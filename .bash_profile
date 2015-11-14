# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

# my go bin dir:
if [ -d "$GOPATH/bin/" ]; then
  PATH="$GOPATH/bin:$PATH"
  export PATH
fi

# Ruby rbenv:
if [ -d "$HOME/.rbenv/bin" ]; then
  PATH="$HOME/.rbenv/bin:$PATH"
  export PATH

  # Initiate rbenv
  eval "$(rbenv init -)"
fi

# Python userbase:
if [ -d "$HOME/.local/bin" ]; then
  PATH="$HOME/.local/bin:$PATH"
  export PATH
fi

# my bin dir:
if [ -d "$HOME/bin/" ]; then
  PATH="$HOME/bin:$PATH"
  export PATH
fi

export EDITOR="vim"
