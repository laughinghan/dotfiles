# whitelist not blacklist because temporary dotfiles get created by e.g. vim
FILES_TO_LINK='.bash_profile .bashrc .gitconfig .gitignore .vim .vimrc'
cd
FILES_ALREADY_IN_HOMEDIR="$(ls $FILES_TO_LINK 2>/dev/null)"
if test -n "$FILES_ALREADY_IN_HOMEDIR" 
then
	echo 'These dotfiles are already in your homedir:' >&2
	echo "$FILES_ALREADY_IN_HOMEDIR" >&2
	exit 1
else
	for FILE in $FILES_TO_LINK
	do
		ln -s dotfiles/$FILE .
	done
fi
