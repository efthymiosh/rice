# Get the filename to store/lookup the environment from
ssh_env_cache="$HOME/.ssh-environment-$HOST"

# Check if ssh-agent is already running
if [[ -f "$ssh_env_cache" ]]; then
  . "$ssh_env_cache" > /dev/null

  {
    [[ "$USERNAME" = root ]] && command ps ax || command ps x
  } | command grep ssh-agent | command grep -q $SSH_AGENT_PID && return 0
fi

# start ssh-agent and setup environment
ssh-agent -s | sed '/^echo/d' >! "$ssh_env_cache"
chmod 600 "$ssh_env_cache"
. "$ssh_env_cache" > /dev/null


ssh-add ~/.ssh/id_ed25519 > /dev/null 2>&1 || true

unset agent_forwarding ssh_env_cache
