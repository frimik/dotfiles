# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

# User specific environment and startup programs

# Ruby rbenv:

if [ -d "$HOME/.rbenv/bin" ]; then
  PATH="$HOME/.rbenv/bin:$PATH"
  export PATH

  # Initiate rbenv
  eval "$(rbenv init -)"
fi

export EDITOR="vim"
