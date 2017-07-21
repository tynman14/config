# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi
 
if [ -d "/bin" ] ; then
    PATH="/bin:$PATH"
fi


# if this tty is tty1, then this is probably a bootup login tty
# run startx but offer a chance to stay in shell (no X)
xorg_delay=10

if [[ -z "$DISPLAY"  ]] && [[ $(tty) = /dev/tty1  ]]; then
  xorg_msg="xorg/Openbox will start automatically in ${xorg_delay} seconds unless you..."
  printf '\n\n%s\n' "${xorg_msg}"
  read -t ${xorg_delay}  -p "Enter n to stay in CLI shell: " ans

  if [ "${ans}" != "n" ] && [ "${ans}" != "N"  ]; then    
    . startx
  fi
fi

# Added 7-Jan-2017 to enhance appearance of QT4 apps (Cantata)
export QT_STYLE_OVERRIDE=GTK+
