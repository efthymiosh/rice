#!/bin/bash

function read_var_fn {
    echo -ne "$1 (${!2}):"
    read FNTEMP
    if [[ ! -z "$FNTEMP" ]]; then
        eval $2="$FNTEMP"
    fi
}

if ! type sshfs &> /dev/null; then
    echo 'sshfs not found in $PATH folders, is the package installed?'
    exit
fi
if ! type encfs &> /dev/null; then
    echo 'encfs not found in $PATH folders, is the package installed?'
    exit
fi

LUSER=`id -nu`
LHIDDENMOUNT="/home/$LUSER/.encrypted_storage/"
LMOUNT="/home/$LUSER/remote_storage/"
RUSER="$LUSER"
RSERV="centauri.di.uoa.gr"
RPORT=22
LUID=`id -u`
LGID=`id -g`

if ! groups | grep fuse &> /dev/null; then
    echo -ne "**WARNING:** $LUSER not in \"fuse\" group.\nIf generated scripts fail, execute:\n\tadduser $LUSER fuse\nas root, log out and in to apply group, then retry.\n\n"
fi

read_var_fn "Remote Host" RSERV
read_var_fn "SSH Port" RPORT
read_var_fn "Username at $RSERV" RUSER
RFOLDER="/home/$RUSER/encrypted_storage"
read_var_fn "Data folder to create on $RSERV" RFOLDER

echo "Connecting to $RSERV.."
ssh -p "$RPORT" "$RUSER"@"$RSERV" "mkdir $RFOLDER; chmod 700 $RFOLDER"

read_var_fn "Local mount point of remote folder" LHIDDENMOUNT
read_var_fn "Local decrypted mount point" LMOUNT

if echo -ne "#!/bin/bash\n\n"\
"mkdir $LHIDDENMOUNT\n"\
"mkdir $LMOUNT\n"\
"sshfs $RSERV:$RFOLDER $LHIDDENMOUNT -o uid=$LUID -o gid=$LGID -p $RPORT\n"\
"encfs $LHIDDENMOUNT $LMOUNT\n" > mount.sh; then
    chmod 700 mount.sh
    echo "Created $PWD/mount.sh"
fi

if echo -en "#!/bin/bash\n\n"\
"fusermount -u $LMOUNT\n"\
"fusermount -u $LHIDDENMOUNT\n"\
"rmdir $LMOUNT\n"\
"rmdir $LHIDDENMOUNT\n" > umount.sh; then
    echo "Created $PWD/umount.sh"
    chmod 700 umount.sh
fi

