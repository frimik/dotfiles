# msysgit Git prompt
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM='verbose git'
export GIT_PS1_SHOWDIRTYSTATE GIT_PS1_SHOWUPSTREAM

# Be able to launch gvim
vim()
{
  "C:/Program Files (x86)/Vim/vim73/vim.exe" "$@"
}
gvim()
{
  "C:/Program Files (x86)/Vim/vim73/gvim.exe" "$@"
}
