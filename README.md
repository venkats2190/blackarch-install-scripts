Blackarch Install
-----------------

Install From ArchLinux/BlackArch Live-ISO-DVD/BlackArch NetInstall
----------------------------------------------------------------
Version: 0.7 (See Github Tags and Changelog)

    1. # blackarch-install
    2. Select Install Mode:
        1. Install from Live-ISO.
            - It will dump the current Live image into your hard drive.
        2. Install from BlackArch Official Repository.
            - It will install base system from Arch Linux and
            add Black Arch Linux packages from the official repository
            into your hard drive. You can choose the packets to install.
        3. Install from Blackman.
            - It will install base system from Arch Linux and
            will download and compile all the BlackArch Linux packages
            from their source according to PKGBULD files.
    3. Encryption:
        3.1. If 'y' selected, root partition will be encrypted with
            cryptsetup. After Partitioning, you will be asked for luks
            password.
    4. Partitioning:
        4.1. Set the device you want to install BlackArch Linux in.
        4.2. Choose Partition Mode:
            * Only /boot, / root, and Swap [optional] partition are supported.
            - Set manual partitions with cfdisk and format them.
                - This mode will run cfdisk utility for partition creation.
                Once you have set up your proper /boot and / root partition,
                dont forget to *Write* and you are good to go.
                It will ask you when 'Quit' for the /boot and / root partition
                number chosed, also the partition type is required for
                format purposes. [remember Swap is an optional choice]
    5. Select BlackArch Repository;
        - BlackArch Official Repositories list is displayed, just choose
          blackarch repo number according to your location.
    6. Install:
        - BlackArch Linux will be now installed into your hard drive.
          This will take a while.
    7. Setup up root password.
    8. Setup normal user account (optional).
    9. Grub install (automatic)
    10. Reboot and enjoy your BlackArch distro.




Old Stuff
---------

Install From ArchLinux - v0.6 Release (See Github Tags)
--------------------------------------------------------
    - Mirror option added.
    * See Changelog and v0.7 ;)


Install From ArchLinux - v0.5.x Release (See Github Tags)
--------------------------------------------------------
    1. # blackarch-install
    2. Select Install Mode:
        1. Install from Live-ISO.
            - It will dump the current Live image into your hard drive.
        2. Install from BlackArch Official Repository.
            - It will install base system from Arch Linux and
            add Black Arch Linux packages from the official repository
            into your hard drive. You can choose the packets to install.
        3. Install from Blackman.
            - It will install base system from Arch Linux and
            will download and compile all the BlackArch Linux packages
            from their source according to PKGBULD files.
    3. Partitioning:
        3.1. Set the device you want to install BlackArch Linux in.
            -> i.e. /dev/sda (default one)
        3.2. Choose Partition Mode:
            * At the moment, only /boot and / root partition are supported.
            * We will add optional /home and Swap in future releases.
            1. Automatic - only empty HD! new partitions will be created in
               /dev/sda1 and /dev/sda2.
                - This mode its thinking for Virtual Machines environment,
                where hard disk isnt contain any partitions already.
                It will create by default sda1 for /boot partition
                and sda2 for / root partition. Also, it will format
                /boot partition with ext2 type and / root partition with
                ext4 type.
                - The only configurable thing here its the size of both
                partitions. Set it by default to 100MB for /boot and
                10GB for / root partition.
                - WARNING: this mode isnt tested properly in non Virtual
                Machine box. So do not used it at least you know what
                you are doing. You had been warned bitch. ;)
            2. Manual - set manual partitions with cfdisk and format them.
                - This mode will run cfdisk utility for partition creation.
                Once you have set up your proper /boot and / root partition,
                dont forget to Write and you are good to go.
                It will ask you when Quit for the /boot and / root partition
                number chosed, also the partition type is required for
                format purposes.
    4. Install
        - BlackArch Linux will be now installed into your hard drive.
        This will take a while.
    5. Setup up root password.
    6. Setup normal user account (optional).
    7. Grub install (automatic)
    8. Reboot and enjoy your Black Arch distro.


Install From ArchLinux - v0.4 Release (See Github Tags)
--------------------------------------------------------
    - v0.4 comes with several install options:
        1. Install from Live-ISO - Dump everything to your partition.
        2. Install from Repository - Install packages you choose From BlackArch Official Repository.
        3. Install from Blackman - Download And Compile Packages from their PKGBUILD.


Install From ArchLinux - v0.1 Release (See Github Tags)
-------------------------------------------------------
   1. Download ISO - https://www.archlinux.org/download/
	-> i.e. http://archlinux.c3sl.ufpr.br/iso/2013.12.01/archlinux-2013.12.01-dual.iso
   2. Create Vbox or VMWare Box for it - Do not use this script in real ENV.
   3. # pacman -Syyu
   4. # pacman -S git
   5. git clone https://github.com/BlackArch/blackarch-install-scripts
   6. cd blackarch-install-scripts; sed 's/SEC_ENABLE="true"/SEC_ENABLE="false"/' blackarch-install; sh blackarch-install
   7. Enjoy BlackArch!
