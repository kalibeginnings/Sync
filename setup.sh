#!/bin/zsh

mv /home/kali/.zshrc /tmp
mv /root/.zshrc /tmp
mv /etc/proxychains4.conf /tmp
mv /etc/ssh/sshd_config /tmp
ln -s /home/kali/Sync/Configs/zshrc /home/kali/.zshrc
ln -s /home/kali/Sync/Configs/zshrc /root/.zshrc
ln -s /home/kali/Sync/Configs/proxychains4.conf /etc/proxychains4.conf
ln -s /home/kali/Sync/Configs/sshd_config /etc/ssh/sshd_config
ln -s /home/kali/Sync/Configs/zsh_aliases /home/kali/.zsh_aliases
ln -s /home/kali/Sync/Configs/zsh_ngrok /home/kali/.zsh_ngrok
