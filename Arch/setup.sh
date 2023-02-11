#!/bin/zsh

# Reconfigure SSH
cd /etc/ssh
mkdir default_keys &&
mv ssh_host_* default_keys &&
dpkg-reconfigure openssh-server &&
md5sum ssh_host_* default_keys/ssh_host_* &&
sed -i "s/\#Port 22/Port 55555/" sshd_config &&
sed -i "s/PasswordAuthentication no/\#PasswordAuthentication yes/" sshd_config &&
sed -i "s/X11Forwarding yes/\#X11Forwarding no/" sshd_config &&
sed -i "s/PrintMotd no/\#PrintMotd no/" sshd_config

# Install Ngrok
if ! sudo pacman -Si ngrok; then
    sudo wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip &&
    unzip ngrok-stable-linux-amd64.zip &&
    mv ngrok /usr/bin &&
    rm ngrok-stable-linux-amd64.zip
fi
ngrok authtoken 1zLFHvAICLfpld9JB91SvRBux3x_4rZfGLP8y7o1YeD2Ui1Nc

# Link all Configs and Directories
mv $HOME/.zshrc /tmp
mv /root/.zshrc /tmp
mv /etc/proxychains.conf /tmp
ln -s $HOME/Sync/Arch/Configs/zshrc $HOME/.zshrc
ln -s $HOME/Sync/Arch/Configs/zshrc /root/.zshrc
ln -s $HOME/Sync/Arch/Configs/proxychains.conf /etc/proxychains.conf
ln -s $HOME/Sync/Arch/Configs/zsh_aliases $HOME/.zsh_aliases
ln -s $HOME/Sync/Arch/Configs/zsh_ngrok $HOME/.zsh_ngrok
ln -s $HOME/Sync/Arch/Configs/ngrok.yml $HOME/.ngrok2/.ngrok.yml
ln -s $HOME/Sync/Arch/Configs/ngrok2.yml $HOME/.ngrok2/.ngrok2.yml
ln -s $(find $HOME/Sync -maxdepth 1 -type d -not -path "./Sync/*") $HOME/
ln -s $(find $HOME/Sync -maxdepth 1 -type d -not -path "./Sync/*") /root/
