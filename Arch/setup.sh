#!/bin/zsh

# Reconfigure SSH
#if [[ ! -d /etc/ssh/default_keys ]]; then
#    mkdir -p /etc/ssh/default_keys
#fi

#if grep --recursive --line-number --binary-files=without-match "ssh_host_" /etc/ssh ; then
#    mv /etc/ssh/ssh_host_* /etc/ssh/default_keys
#fi

#ssh-keygen -f /etc/ssh/ssh_host_rsa -p "ABC123def.";

#if  grep --recursive --line-number --binary-files=without-match "ssh_host_" /etc/ssh/default_keys ; then
#    md5sum /etc/ssh/ssh_host_* /etc/ssh/default_keys/ssh_host_*
#fi

if [[ -f /etc/ssh/sshd_config ]]; then 
    sed -i "s/\#Port 22/Port 55555/" /etc/ssh/sshd_config;
    sed -i "s/PasswordAuthentication no/\#PasswordAuthentication yes/" /etc/ssh/sshd_config;
    sed -i "s/X11Forwarding yes/\#X11Forwarding no/" /etc/ssh/sshd_config;
    sed -i "s/PrintMotd no/\#PrintMotd no/" /etc/ssh/sshd_config
else    
    cp $HOME/Sync/Arch/Configs/sshd_config /etc/ssh/sshd_config
fi

# Install Ngrok
if ! sudo pacman -Si ngrok; then
    echo "\nInstalling Ngrok Now ...\n"
    sudo wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip;
    unzip ngrok-stable-linux-amd64.zip;
    mv ngrok /usr/bin;
    rm ngrok-stable-linux-amd64.zip
else 
    clear;
    echo "Ngrok Is Already Installed\n"
    sleep 3
    clear
fi
ngrok authtoken 1zLFHvAICLfpld9JB91SvRBux3x_4rZfGLP8y7o1YeD2Ui1Nc

# Link all Configs and Directories
if [[ -f $HOME/.zshrc ]]; then mv $HOME/.zshrc /tmp; fi
if [[ -f /root/.zshrc ]]; then sudo mv /root/.zshrc /tmp ;fi
if [[ -f /etc/proxychains.conf ]]; then sudo mv /etc/proxychains.conf /tmp; fi
ln -sf $HOME/Sync/Arch/Configs/zshrc $HOME/.zshrc
sudo ln -sf $HOME/Sync/Arch/Configs/zshrc /root/.zshrc
sudo ln -sf $HOME/Sync/Arch/Configs/proxychains.conf /etc/proxychains.conf
ln -sf $HOME/Sync/Arch/Configs/zsh_aliases $HOME/.zsh_aliases
sudo ln -sf $HOME/Sync/Arch/Configs/zsh_aliases /root/.zsh_aliases
ln -sf $HOME/Sync/Arch/Configs/zsh_ngrok $HOME/.zsh_ngrok
sudo ln -sf $HOME/Sync/Arch/Configs/zsh_ngrok /root/.zsh_ngrok
ln -sf $HOME/Sync/Arch/Configs/ngrok.yml $HOME/.ngrok2/.ngrok.yml
ln -sf $HOME/Sync/Arch/Configs/ngrok2.yml $HOME/.ngrok2/.ngrok2.yml
ln -sf $(find $HOME/Sync -maxdepth 1 -type d -not -path "./Sync/*") $HOME/
sudo ln -sf $(find $HOME/Sync -maxdepth 1 -type d -not -path "./Sync/*") /root/
