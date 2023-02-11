#!/bin/zsh

mv $HOME/.zshrc /tmp
mv /root/.zshrc /tmp
mv /etc/proxychains4.conf /tmp
mv /etc/ssh/sshd_config /tmp
ln -sf $HOME/Sync/Kali/Configs/zshrc $HOME/.zshrc
ln -sf $HOME/Sync/Kali/Configs/zshrc /root/.zshrc
ln -sf $HOME/Sync/Kali/Configs/proxychains4.conf /etc/proxychains4.conf
ln -sf $HOME/Sync/Kali/Configs/sshd_config /etc/ssh/sshd_config
ln -sf $HOME/Sync/Kali/Configs/zsh_aliases $HOME/.zsh_aliases
ln -sf $HOME/Sync/Kali/Configs/zsh_ngrok $HOME/.zsh_ngrok
ln -sf $(find $HOME/Sync -maxdepth 1 -type d) $HOME/
ln -sf $(find $HOME/Sync -maxdepth 1 -type d) /root/
