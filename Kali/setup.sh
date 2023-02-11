#!/bin/zsh

mv $HOME/.zshrc /tmp
mv /root/.zshrc /tmp
mv /etc/proxychains4.conf /tmp
mv /etc/ssh/sshd_config /tmp
ln -s $HOME/Sync/Kali/Configs/zshrc $HOME/.zshrc
ln -s $HOME/Sync/Kali/Configs/zshrc /root/.zshrc
ln -s $HOME/Sync/Kali/Configs/proxychains4.conf /etc/proxychains4.conf
ln -s $HOME/Sync/Kali/Configs/sshd_config /etc/ssh/sshd_config
ln -s $HOME/Sync/Kali/Configs/zsh_aliases $HOME/.zsh_aliases
ln -s $HOME/Sync/Kali/Configs/zsh_ngrok $HOME/.zsh_ngrok
ln -s $(find $HOME/Sync -maxdepth 1 -type d) $HOME/
ln -s $(find $HOME/Sync -maxdepth 1 -type d) /root/
