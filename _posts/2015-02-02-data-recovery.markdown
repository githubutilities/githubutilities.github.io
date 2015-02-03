---
layout: post
title:  "Data Recovery"
date:   2015-02-02 11:45
categories: linux,macos,fs
---

# Difference between filesystem recovery and individual files recovery[1][difference_askubutun]

If a filesystem is damaged, you can attempt to recover that filesystem itself, or individual files. 

Individual file recovery is possible regardless of the state of the filesystem, but it has the drawback of being almost completely useless if you are dealing with a lot of data. When you recover individual files, you are going to LOSE the ENTIRE directory structure of your data (that means organisation and filenames). It may take years to sift through and rename all those music files and other junk. Also, in many cases the program will fail to find specific start and end blocks for your file (this is almost always the case with plain text files) and you could end up (like me) with each mp3 file split into a hundred 1-5 second pieces.

[difference_askubutun]: http://askubuntu.com/questions/533496/accidentally-formatted-ext4-partition

# Recover lost partition [link](https://help.ubuntu.com/community/DataRecovery#Lost_Partition)

* Testdisk
    - Use any method to install `testdisk` package, e.g. `brew install testdisk`
    - run `testdisk` and follow the instructions
* GNU Parted
* Gpart

# Recover file system [link](http://askubuntu.com/questions/533496/accidentally-formatted-ext4-partition)

Unfortunately after hours with this utility, TestDisk was able to find my old partition, but the root inode was destroyed, so I gave up on using TestDisk and decided to try to recover the ext backup superblock manually.

this will be used to calculate where the backup superblocks will be located in the event you were to create a ext filesystem on the partition in question mke2fs (make extended 2 file-system) for ext2/3/4

this will be used to attempt to restore the filesystem using one of the backup superblocks e2fsck (extended 2 file-system check) also for ext2/3/4

An explanation on how to recover an ext superblock manually using these utilities can be found here: http://ing-tani.blogspot.com/2013/01/repair-broken-ext4-superblock-in-ubuntu.html

SIDE NOTE: if your partition table is intact (not the case for me), then you could perhaps make use of dumpe2fs like so: http://www.cyberciti.biz/faq/linux-find-alternative-superblocks/

if you are unable to use these utilities to find the backup superblocks (perhaps you messed up multiple partitions, and because of this, you don't know where they start/end) you may find use of a program called gpart (not to be confused with gparted or parted... it's totally different) though I'm not sure if it supports linux file-systems newer than ext2.. If you are at this point, It may be time to start worrying.


# Forensics Image Manipultating

* Mounting your disk image
    - If you are using Mac OSX and want to mount `ext` file-system, run `brew install ext4fuse`

        > FUSE for OS X allows you to extend OS X's native file handling capabilities via third-party file systems. 
* [Sleuth Kit](https://help.ubuntu.com/community/DataRecovery#Sleuth_Kit_and_Autopsy)
    - `mmls` can show you the partitions found within an image `mmls <your-disk-image>`
    - ls your forensic image `fls -i raw -f ext4 <your-forensic-image>`

        > * be careful of the options order, DON'T PUT `<your-forensic-image>` AT FRONT which causes `Error stat(ing) image file (raw_open: image "-f" - No such file or directory)` error
        > * `-i` imagetype, run `fls -i list` to see available options
        > * `-f` file system type, run `fls -f list` to see available options
    - copy file from forensic image `icat -r -f ext4 -i raw mmcblk0p12.raw  478609 > out.txt`

        > `icat` can only copy regular file and does not work on directory
    - sort files in a disk image into categories `sorter -h -s -i raw -f ext4 -d slimg/ -C /usr/local/Cellar/sleuthkit/4.1.3/share/tsk/sorter/images.sort mmcblk0p12.raw `
* Autopsy(GUI version of Sleuth Kit)


# Recover individual files from recovered image [link](https://help.ubuntu.com/community/DataRecovery#Extract_individual_files_from_recovered_image)

If you are using android and your internal storage cannot be mounted as USB Mass Storage, you can create a raw image by [storage dump]({% post_url 2015-01-30-android-internal-memory-dump-hack %})

Use the following utilities to recover from image file

* [Foremost](https://help.ubuntu.com/community/DataRecovery#Foremost)
    - Foremost is the best recovery tool that I've seen so far because it gives better result when I use it to recover `jpeg` files. Use any method to install package `foremost`, e.g. `brew install foremost`
    - run `foremost -t jpg -i <your-image> -o /path/to/your/output/folder`
* [Photorec](https://help.ubuntu.com/community/DataRecovery#Photorec)
    - Photorec is part of Testdisk package. Use any method to install package `testdisk`, e.g. `brew install testdisk`
    - run `photorec <your-image>` and follow the instructions
* [recoverjpeg](https://help.ubuntu.com/community/DataRecovery#recoverjpeg)
    - recoverjpeg is dedicated to recover `jpeg` pictures(also the `mov` video using `recovermov`, use any method to install package `recoverjpeg`
    - run `recoverjpeg <your-image>`
    - the recovered files will be saved in your current directory with name pattern `image*.jpg`.
* [Ntfsprogs](https://help.ubuntu.com/community/DataRecovery#Ntfsprogs)
    - As the name indicates, `ntfsundelete` can recover deleted files from an NTFS file-system.
* Scalpel
    - `scalpel` depends on `autoconf`, `automake`, `libtool`, `tre`, use any method to install this package
    - `scalpel` is an config-base tool, you must create a `scalpel.conf` file in the working directory and add your configuration in it
    - run `scalpel YOUR-FILE -o OUTPUT-DIRECTORY`


# [Cleaning up](https://help.ubuntu.com/community/DataRecovery#Cleaning_up)

* Sort certain types of files
    - create a folder for sorting `mkdir jpg`
    - run `find . -name "*.jpg" | xargs -I {} mv {} jpg/`
* Eliminate small photos
    - create a folder for storing small photos `mkdir small`
    - run `find . -name "*.jpg" -type f -size -50k -print0 | xargs -0 -I {} mv {} small/`

    > * use `find` to filter small `.jpg` format photos
    > * use `find`'s `-print0` option and `xargs`'s `-0` option for compatibility issue
    > * `-type f` filter the regular files
    > * `-0` and `-print0` If there are blank spaces or characters (including newlines) many commands will not work. This option take cares of file names with blank space and newline.
    > * `-I` Replace occurrences of replace-str in the initial-arguments with names read from standard input. Also, unquoted blanks do not terminate input items; instead the separator is the newline character.
    > * {} as the argument list marker
* Rename jpegs according to exif data
    - install utilities for handling exif data, e.g. `exiftool` or `jhead`(`brew install jhead`)
    - run `find . -name "*.jpg" | xargs -I {} jhead -nf%Y%m%d-%H%M%S {}`

# Reference

* [ubuntu help](https://help.ubuntu.com/community/DataRecovery)
* [ubuntu help for ext](http://askubuntu.com/questions/533496/accidentally-formatted-ext4-partition)
* [**Linux LEO**](http://www.linuxleo.com/)
* [**Forensics Wiki**](http://forensicswiki.org/wiki/Main_Page)
* [ddrescue forensics wiki](http://www.forensicswiki.org/wiki/Ddrescue)
* [Mac-robber](http://wiki.sleuthkit.org/index.php?title=Mac-robber): Unlike the **TSK** tools, mac-robber relies on the OS to gather information about a mounted file system. This makes it more vulnerable to **rootkits**, but it allows an investigator to collect data on file systems that are not supported by TSK.