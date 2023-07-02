# .dotfiles
alias config="git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"

# ITP SSH stuff
alias ssh_itpw='SSH_ASKPASS=${HOME}/.ssh/get_itp_pass.sh SSH_ASKPASS_REQUIRE=force ssh itpw'
