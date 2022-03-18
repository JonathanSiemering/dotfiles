function ssh_agent
    switch $SSH_AGENT
        case "wsl"
            set SSH_AUTH_SOCK ~/c/wsl-ssh-agent/ssh-agent.sock
        case "wsl2"
            set SSH_AUTH_SOCK $HOME/.ssh/agent.sock
            ss -a | grep -q $SSH_AUTH_SOCK
            if test $status -ne 0
                rm -f $SSH_AUTH_SOCK
                bash -c "(setsid socat UNIX-LISTEN:$SSH_AUTH_SOCK,fork EXEC:\"$HOME/c/npiperelay/npiperelay.exe -ei -s //./pipe/openssh -ssh-agent
\",nofork &) >/dev/null 2>&1"
            end
        case default
            set SSH_AUTH_SOCK $XDG_RUNTIME_DIR/ssh-agent.socket
    end
end
