export GIT_SSL_NO_VERIFY=1


# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s cdspell

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000000000
HISTFILESIZE=200000000000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
	PS1='\[\e[5;36m\](\t)\[\e[5;0m\]${debian_chroot:+($debian_chroot)}\[\e[5;32m\] $(parse_git_branch) \[\e[5;0m\]\[\e[5;32m\]\[\e[5;34m\]\[\e[5;0m\]\[\e[5;31m\]✀  \[\e[5;35m\]\w \[\e[5;33m\]➤ \[\e[5;0m\] '
	#PS1='\[\e[5;36m\](\t)\[\e[5;0m\] ${debian_chroot:+($debian_chroot)}\[\e[5;32m\]chary\[\e[5;34m\] \[\e[5;0m\]\[\e[5;33m\]chary : \[\e[5;31m\]\w \[\e[5;35m\]*>\[\e[5;0m\] '
else
    #PS1='\e[5;36m(\t)\e[5;0m ${debian_chroot:+($debian_chroot)}\e[5;32m\u@\e[5;33m\h : \e[5;31m\w \e[5;35m*>\e[5;0m '
    #PS1='\[\e[5;36m\](\t)\[\e[5;0m\] ${debian_chroot:+($debian_chroot)}\[\e[5;32m\]\u\[\e[5;33m\]@[\e[5;0m\][\e[5;33m\]\h : \[\e[5;31m\]\w \[\e[5;35m\]*>\[\e[5;0m\] '
	PS1='\[\e[5;36m\](\t)\[\e[5;0m\] ${debian_chroot:+($debian_chroot)}\[\e[5;32m\]\u\[\e[5;34m\]@\[\e[5;0m\]\[\e[5;33m\]\h : \[\e[5;35m\]\w \[\e[5;31m\]*>\[\e[5;0m\] '
	PS1='\[\e[5;36m\](\t)\[\e[5;0m\]${debian_chroot:+($debian_chroot)}\[\e[5;32m\] $(parse_git_branch) \[\e[5;0m\]\[\e[5;32m\]\[\e[5;34m\]\[\e[5;0m\]\[\e[5;33m\]✀  \[\e[5;35m\]\w \[\e[5;31m\];)\[\e[5;0m\] '
#										PS1="\e[5;32m\u@\e[5;33m\h:\e[5;31m\w \e[5;35m*>\e[5;0m "
fi
	PS1='\[\e[0;36m\](\t)\[\e[0;0m\]${debian_chroot:+($debian_chroot)}\[\e[0;32m\] $(parse_git_branch) \[\e[0;0m\]\[\e[0;32m\]\[\e[0;34m\]\[\e[0;0m\]\[\e[0;31m\]❤  \[\e[0;35m\]\w \[\e[0;33m\]𝀌 \[\e[0;0m\] '
shortIt()
{
	PS1='uma \[\e[5;36m\](\t)\[\e[5;0m\]${debian_chroot:+($debian_chroot)}\[\e[5;32m\] $(parse_git_branch) \[\e[5;0m\]\[\e[5;32m\]\[\e[5;34m\]\[\e[5;0m\]\[\e[5;31m\]✀  \[\e[5;35m\]\W \[\e[5;33m\]➤ \[\e[5;0m\] '
}
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
# Enable programmable sdb completion features.
if [ -f ~/.sdb/.sdb-completion.bash ]; then
 source ~/.sdb/.sdb-completion.bash
fi
run()
{
	grep -nR --exclude=tags $@
}
#export PS1="\e[5;33m\w $ \e[m"
#       export PS1="-> "
#echo -e "\\033[5;95;38;5;214m*************** LEAVE NO CODE UNTURNED ***************\\033[0m"
#echo -e "\\033[5;99;38;5;214m*************** LEAVE NO CODE UNTURNED ***************\\033[0m"
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode - red
export LESS_TERMCAP_md=$(printf '\e[01;35m') # enter double-bright mode - bold, magenta
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode    
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode - yellow
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;36m') # enter underline mode - cyan
export LESS_TERMCAP_mb=$(printf '\e[01;31m') # enter blinking mode
export LESS_TERMCAP_md=$(printf '\e[01;38;5;75m') # enter double-bright mode
export LESS_TERMCAP_me=$(printf '\e[0m') # turn off all appearance modes (mb, md, so, us)
export LESS_TERMCAP_se=$(printf '\e[0m') # leave standout mode
export LESS_TERMCAP_so=$(printf '\e[01;33m') # enter standout mode
export LESS_TERMCAP_ue=$(printf '\e[0m') # leave underline mode
export LESS_TERMCAP_us=$(printf '\e[04;38;5;200m') # enter underline mode

#bind -x '"\C-K": "echo -en \\033c"'
#echo -e "\e[?25l" and h to restore mouse
#echo -e '\033[?47h' # save screen
#echo -e '\033[?47l' # restore screen
#echo "TPUT is a $(tput setaf 2)nice$(tput setaf 9) and $(tput setaf 5)user friendly$(tput setaf 9) terminal capability database."
title() { echo -en "\e];"$1"\007"; }
#echo -n $'\x1b'[H
# ctrl-I is tab do you know
#sed l important tells you what you typing
#if [[ "$string" =~ ^([0-9][0-9]):([0-9][0-9]):([0-9][0-9])$ ]]; then printf 'Got %s, %s and %s\n'     "${BASH_REMATCH[1]}" "${BASH_REMATCH[2]}" "${BASH_REMATCH[3]}"; fi
bind -x '"\e\e":"gnome-screensaver-command -l"'
vm () {

	[[ "$1" == ".config" ]] && sudo /usr/bin/vim /usr/src/linux-GIT/$1 && return

   __umas_old_pwd__=$OLDPWD
   cd /usr/src/linux-GIT && sudo /usr/bin/vim -t "$1" && cd $OLDPWD
   OLDPWD=$__umas_old_pwd__
   __umas_old_pwd__=""
}
mkdir () {
    if [ $2 ] ; then
    /bin/mkdir $@ 
    else
    /bin/mkdir $@ && cd $@
fi
}
gcc () {
    if [ $2 ] ; then
    /usr/bin/gcc -ggdb $@ 
    else
    foo=$1
    bar=(`echo $foo | tr '.' ' '`)
    /usr/bin/gcc -o ${bar[0]} $1 -ggdb && ./${bar[0]}
fi
}
rm () {
    /bin/mv $@ /tmp
}

#alias su='su && echo -e "${color}*************** WELCOME BACK TO NORMAL USERMODE ***************"'
#export PS1="\e5;32m[umas--> \w\$ \e[m"
#export PS1="--> \w $e[m"
#export PS1="\e[5;32mmasraJ \e[m \e[5;36m\w \e[m\e[5;35m ** \e[m"
#export PS1="\\033[48;5;95;38;5;214mumasraZ-->\e[m \e[5;34m \w $ \e[m"
#export PS1="\x1b[5mmuma_s_raZ--> \w\$ \e[m"
#       export PS1="-> "
#echo -e "\\033[48;5;95;38;5;214m*************** LEAVE NO CODE UNTURNED ***************\\033[0m"
thunder_MAIL() {
	__mail_test__=`ps -e | grep thunderbird -w`
	[[ -z $__mail_test__ ]] && thunderbird &>/dev/null & 
	#disown
}

on(){
	__name=`history | tail -2 | head -1 | awk {'print $3'}`
	bar=(`echo $__name| tr '.' ' '`)
	./${bar[0]}

}
LS_COLORS=$LS_COLORS:'di=1;35:fi=0;6:'
LS_COLORS=$LS_COLORS:'*.c=34:'
LS_COLORS=$LS_COLORS:'*.png=36:'
LS_COLORS=$LS_COLORS:'*.pdf=38;5;126:'
LS_COLORS=$LS_COLORS:'*.zip=38;5;036:'
LS_COLORS=$LS_COLORS:'*.odt=38;5;202:'
LS_COLORS=$LS_COLORS:'*.tar.gz=38;5;084:'
LS_COLORS=$LS_COLORS:'*.tar.xz=38;5;084:'
LS_COLORS=$LS_COLORS:'*.tar=38;5;084:'
LS_COLORS=$LS_COLORS:'*.tar.bz2=38;5;084:'
#LS_COLORS=$LS_COLORS:'di=1;4;31;42:'
#thunder_MAIL

vim(){
	
	if [[ -z $1 ]] 
	then
		if [[ -f "`xclip -o`" ]] 
		then
			/usr/bin/vim `xclip -o` && return 
		fi
	fi
	if [[ "$1" == "-t" ]] 
	then
		if [[ -f tags || -f cscope.out ]] 
		then
			:
		else
			make tags &>/dev/null 
			if [ $? -eq 0 ] 
			then
				echo yes
			else
				ctags -R * && cscope -Rb
			fi
		fi
	
	fi
	[[ -z $2 ]] && ([[ $1 == *":"* ]] && boo=(`echo $1| tr ':' ' '`) &&  /usr/bin/vim ${boo[0]} +${boo[1]}) && return
	
	/usr/bin/vim $@
	
	#( [[ -z $2 ]] && ( ( [[ -f $1 ]] && /usr/bin/vim $@ ) || vm $1 ) ) || /usr/bin/vim $@
}

tst() {
	
	if [[ $1 == *":"* ]]; then
  		echo "It's there!" && boo=(`echo $1| tr ':' ' '`) && echo /usr/bin/vim ${boo[0]} +${boo[1]}
	fi
}
_scp() {
#	echo Get permission from umaraZ
	scp $@
}
_ssh() {
	echo Get permission from umaraZ
	ssh $@
}

RUNIT() {
			(gcc -o init -static -xc -) <<- __EOF__

			#include <stdio.h>
			int main( void )
			{
				printf("test kernel for logs\n");
				while(1);
			}
		__EOF__

	echo init | cpio -o -H newc | gzip > test.cpio.gz
	qemu-system-x86_64 -kernel /usr/src/linux-GIT/arch/x86/boot/bzImage -initrd test.cpio.gz -append "console=ttyS0 root=/dev/sda" -nographic 
	rm init test.cpio.gz

}
netIt() {
	iface=`ifconfig | head -n1 | cut -d" " -f1`
	sudo ifconfig $iface 172.16.9.22/24 && sudo route add -n default gw 172.16.9.1 ; sudo ifconfig $iface up && ping google.com
}


mukesh='mukesh@172.16.9.97'
mvm(){
	mv $@ /home/heihei/mIsc
}
raj='rajeshwari@172.16.9.63'
bkup(){
for i in $*; do
 mv $i $i.bk
done
}
title(){
  if [[ -z "$ORIG" ]]; then
    ORIG=$PS1
  fi
  #__uma__=`echo $* | tr [a-z] [A-Z]`
  __uma__=`echo $* `
  TITLE="\[\e]2;$__uma__\a\]"
  PS1=${ORIG}${TITLE}
}

alias c='cd ..'
alias v='cd -'
export INSTALL_DIR=/tftpboot/ebuild/install
export ECOS_INSTALL_DIR=/tftpboot/ebuild/install
export ECOS_TARGET_DIR=/tftpboot/ebuild/

send()
{
	notify-send  -i /usr/share/notify-osd/icons/hicolor/scalable/status/notification-message-email.svg -u critical "$@"
}
X()
{
	echo `$@` | xclip -i 
}
Y()
{
	$@ `xclip -o` 
}
b()
{
	$@ &>/dev/null &
}
parse_git_branch() 
{
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
alias G='cd ~/GIT/qca953x_ecos/'
ncon()
{
	 [[ $1 ]] && /usr/bin/nmtui-connect $1 &>/dev/null
}
inspire()
{
	echo -e "\n \e[5;33m                   WHERE THERE IS A SHELL THERE IS A WAY \e[m\n"
	echo -e "\n \e[5;33m                       LEARN UNLEARN and RELEARN \e[m\n"
}
check_for_ssh()
{
	connection=`echo $SSH_CONNECTION`
	if [[ ! -z "$connection" ]] ; then
		echo %%%%%%%%%%%%%%%%%%% UMA $SSH_CONNECTION LOGGED IN %%%%%%%%%%%%%%%%%%%%%
		inspire
	#	echo -e "\n \e[5;33m Where There is a SHELL There is a Way \e[m\n" 
	fi
}
check_for_ssh

complete -W "net openshit uboot auto" ncon
complete -W "--user  --passwd --time  --date  --month  --year  --message -u -m -t -d -x -p" thatday
complete -W "--user  --passwd --time  --date  --month  --year  --message -u -m -t -d -x -p" today

alias Umaraju='umaraju'
alias su='echo -e Be Very Careful && su'

log_bash_persistent_history()
{

  [[
    $(history 1) =~ ^\ *[0-9]+\ +([^\ ]+\ [^\ ]+)\ +(.*)$
  ]]
  local date_part="${BASH_REMATCH[1]}"
  local command_part="${BASH_REMATCH[2]}"
  if [ "$command_part" != "$PERSISTENT_HISTORY_LAST" ]
  then
	echo Whatever
    echo $date_part "|" "$command_part" >> ~/.persistent_history
    export PERSISTENT_HISTORY_LAST="$command_part"
  fi
}

# Stuff to do on PROMPT_COMMAND
run_on_prompt_command()
{
    log_bash_persistent_history
}

PROMPT_COMMAND="run_on_prompt_command"
alias p='cp ecosap.bin /tftpboot'
alias mg='mipsisa32-elf-gdb ecosap -q'
export PATH=$PATH:/opt/qca953x/qca953x_ecos/u-boot/build/gcc-4.3.3/build_mips/staging_dir/usr/bin/
alias rmm='/bin/rm'
alias bim='vim'
alias new='ll -lrt | tail -3'
#xrandr -o right

et() {
	
  	if [[ -z "$1" ]]; then
		sudo ethtool enp2s0
		return 
	fi
	sudo ethtool -s enp2s0 speed $1 duplex $2
}
alias tvim='vim -t'
alias y='sudo mount /dev/sda1 /mnt/ && cd /mnt/_start'

look() 
{
	 [[ $1 ]] && tail -c +7 $1 > /tmp/tmp.$$ && totem /tmp/tmp.$$
}
C()
{
	`xclip -o`
}
export PATH=$PATH:/home/heihei/Downloads/MIPS/mipsisa32-elf/bin/

HI(){
	ionice -c 2 -n 0 nice -n -20 $@
}
