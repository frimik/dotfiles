# msysgit Git prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM='verbose git'
export GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWUPSTREAM

if [ "$OSTYPE" = "msys" ]; then
  # Be able to launch gvim
  vim()
  {
    "C:/Program Files (x86)/Vim/vim74/vim.exe" "$@"
  }
  gvim()
  {
    "C:/Program Files (x86)/Vim/vim74/gvim.exe" "$@"
  }

  # SSH Agent trickery
  # http://halyph.blogspot.se/2012/08/how-to-use-ssh-agent-in-msysgit.html
  SSH_ENV="$HOME/.ssh/environment"

  # start the ssh-agent
  function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    ssh-agent | sed 's/^echo/#echo/' > "$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" > /dev/null
    ssh-add
  }

  # test for identities
  function test_identities {
    # test whether standard identities have been added to the agent already
    ssh-add -l | grep "The agent has no identities" > /dev/null
    if [ $? -eq 0 ]; then
      ssh-add
      # $SSH_AUTH_SOCK broken so we start a new proper agent
      if [ $? -eq 2 ];then
        start_agent
      fi
    fi
  }

  # check for running ssh-agent with proper $SSH_AGENT_PID
  if [ -n "$SSH_AGENT_PID" ]; then
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
      test_identities
    fi
    # if $SSH_AGENT_PID is not properly set, we might be able to load one from
    # $SSH_ENV
  else
    if [ -f "$SSH_ENV" ]; then
      . "$SSH_ENV" > /dev/null
    fi
    ps -ef | grep "$SSH_AGENT_PID" | grep ssh-agent > /dev/null
    if [ $? -eq 0 ]; then
      test_identities
    else
      start_agent
    fi
  fi

elif [ "$OSTYPE" = "linux-gnu" ]; then
  if [ -f ~/.bash/git-completion.bash ]; then
    . ~/.bash/git-completion.bash
  fi

  [ -f ~/.bash/aws-completion.bash ] && . ~/.bash/aws-completion.bash

  export GOPATH="${HOME}/.gopath"
fi

# Are we in a VM?
VBOX=$(cat /sys/class/dmi/id/product_name 2>/dev/null)
if [ "$VBOX" = "VirtualBox" ]; then
  VIRT_PS1="[$VBOX] "
fi

# semi-fancy git prompt ...
export PS1="$VIRT_PS1\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]\$(__git_ps1 2>/dev/null)\[\033[01;34m\] \$\[\033[00m\] "

# ls colors
alias ls='ls --color=auto'

export BOTO_CONFIG=~/.aws/config
