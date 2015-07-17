## vimenv
This is my vim configuration mainly made for php coding environment

- Set up Vundle:

	$ git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

## crontab

	MAILTO=""
	*/1 * * * * source ~/.bashrc ; cd ~/work/www/src/ && ctags --langmap=php:.inc.php --php-kinds=cdfpt --languages=php --exclude=@/mnt/home/wangjun/etc/ctags_exclude.txt -R -f /tmp/tags_wj.tmp && mv /tmp/tags_wj.tmp tags >/dev/null 2>&1
	#*/5 * * * * source ~/.bashrc ; cd ~/mysrc/vimenv/ && bash build_cscope.sh >/dev/null 2>&1

ctags_exclude.txt used to exclude files for ctags.

## .editorconfig

add .editorconfig in the same directory of .gitignore

editor plugins @see http://editorconfig.org/#download

Have any question, please mailto: wangjun_1218#163.com
