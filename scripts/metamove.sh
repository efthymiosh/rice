#!/bin/bash

#move .mp4 files located in subfolders to main torrent folder

TORR_PATH="/mnt/massivetwo/torrents/"
SHOWS_PATH="/mnt/massivetwo/TV Series/"

ls "$TORR_PATH"/*/ -d 2> /dev/null | while read FOLDER
do
    GOODNAME=`ls "${FOLDER}" -d | sed 's/\(.*\)\/\(.*\)\[.*/\2/g'`
	OLDPATHNAME=`ls "${FOLDER}" | grep -i ".mp4"`
	if [[ -f "${FOLDER}${OLDPATHNAME}" ]];
	then
		ln "${FOLDER}${OLDPATHNAME}" "$TORR_PATH/${GOODNAME}.mp4"
    else    
        OLDPATHNAME=`ls "${FOLDER}" | grep -i ".mkv"`
        if [[ -f "${FOLDER}${OLDPATHNAME}" ]];
        then
            ln -v "${FOLDER}${OLDPATHNAME}" "$TORR_PATH/${GOODNAME}.mkv"
        fi
    fi
done

#move .mp4 files from torrents folder to their respective show folders.

ls "$SHOWS_PATH" | while read SHOW
do
    NORMALIZED_SHOW=`echo "$SHOW" | sed 's/\ /\./g'`
	TORRS=`ls "$TORR_PATH"/*.mp4 "$TORR_PATH"/*.mkv 2> /dev/null | grep -i ${NORMALIZED_SHOW}`
	if [[ "$?" -eq "0" ]];
	then
        DIR="$SHOWS_PATH/$SHOW"
		if [[ -d "$DIR" ]];
		then
			for TORR in $TORRS
			do
				mv -v "$TORR" "$DIR"
			done
		else
			ls -d "$DIR"
			echo "directory $DIR not found for torrents: $TORRS"
		fi
	fi
done
