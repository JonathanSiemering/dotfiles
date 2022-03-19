switch $SSH_AGENT
    case "wsl"
        set SSH_AUTH_SOCK ~/c/wsl-ssh-agent/ssh-agent.sock
    case "wsl2"
        set -x SSH_AUTH_SOCK "$HOME/.ssh/agent.sock"
        if not ss -a | grep -q "$SSH_AUTH_SOCK";
            rm -f "$SSH_AUTH_SOCK"
            setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:"$HOME/c/npiperelay/npiperelay.exe -ei -s //./pipe/openssh-ssh-agent",nofork >/dev/null 2>&1 &
        end
    case default
        set SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
end
