# vimenv
This is my vim configuration mainly made for php coding environment 

## crontab

MAILTO=""
*/1 * * * * source ~/.bashrc ; cd ~/work/www/src/ && ctags --langmap=php:.inc.php --php-kinds=cdfpt --languages=php --exclude=@/mnt/home/wangjun/etc/ctags_exclude.txt -R -f /tmp/tags_wj.tmp && mv /tmp/tags_wj.tmp tags >/dev/null 2>&1
#*/5 * * * * source ~/.bashrc ; cd ~/mysrc/vimenv/ && bash build_cscope.sh >/dev/null 2>&1

ctags_exclude.txt =>
*vendor/*
*PHPExcel/*
*/tests/*
*/Smarty3/*


Have any question, please <mailto: wangjun_1218#163.com>
