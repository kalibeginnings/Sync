#echo "What is the name of the WiFi Network?"
#read ssid_name
#echo "What is the password?"
#read ssid_pass
#iwctl station wlan0 connect $ssid_name $ssid_pass
#sleep 5
timedatectl set-ntp true
fdisk -l
echo ""
echo "What disk would you like to use? (Example: /dev/sdX)"
read disk_id
echo """
########################################################
########################################################
################   GDISK INSTRUCTIONS   ################
########################################################

########################################################
Step 1: Type o To Create a New GUID partition table
########################################################
Step 2: Type n To Create New Partition For Boot
########################################################
Step 3: Use Default for Partition Number
########################################################
Step 4: Use Default for First Sector
########################################################
Step 5: Type +512M for Last Sector
########################################################
Step 6: Type ef00 for Hex Code
########################################################
Step 7: Type n To Create New Partion For Root
########################################################
Step 8: Use Defaults for All options
########################################################
Step 9: Type w To Write All Changes to Disk
########################################################
"""

gdisk $disk_id
mkfs.fat $disk_id1
mkfs.ext4 $disk_id2
mount $disk_id2 /mnt 
mkdir -p /mnt/boot/efi
mount $disk_id1 /mnt/boot/efi
pacstrap /mnt base base-devel linux linux-firmware plasma sddm NetworkManager nano iwd man intel-ucode grub efibootmgr konsole
genfstab -U /mnt >> /mnt/etc/fstab

echo """
###############################################################################################
#############  Copy And Paste The Following Commands Into The Chroot Environment  ############# 
###############################################################################################
ln -sf /usr/share/zoneinfo/America/New_York /etc/localtime
hwclock --systohc
sed -i "s|#en_US.UTF-8 UTF-8|en_US.UTF-8 UTF-8|g" /etc/locale.gen
echo "LANG=en_US.UTF-8" > /etc/locale.conf
echo "ArchBox" > /etc/hostname
echo """
127.0.0.1   localhost
::1         localhost
127.0.1.1   ArchBox.localdomain ArchBox
""" >> /etc/hosts
mkinitcpio -P
passwd 
grub-install --target=x86_64-efi --efi-directory /boot/efi --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
systemctl enable sddm
systemctl enable NetworkManager
useradd -m -G wheel blackarch
passwd blackarch
sed -i "s|# %wheel ALL=(ALL:ALL) ALL|%wheel ALL=(ALL:ALL) ALL|g" /etc/sudoers
sync
################################################################################################
"""

arch-chroot /mnt

