# Yafti-AppImage 🐧

Unofficial AppImage of `yafti`, first-time setup utility by Universal Blue.  
https://github.com/ublue-os/yafti

## Reason for making this

While `yafti` is not the perfect utility and not maintained, it's the best one I know for the first-time setup utility, which is very helpful for custom OS distribution creators.  
It is also great if you want to show the more detailed and intuitive prompt instead of the notification or `zenity` dialog.

Python packaging for the distribution is usually a mess regarding dependencies and clutters the system.  
Due to this, it was expected that the RPM packaging of `yafti` would break.  
And it did. It stopped working since Fedora 43.

To solve this problem, I made the AppImage using alternative better utilities, using [`quick-sharun`](https://github.com/pkgforge-dev/Anylinux-AppImages/blob/main/useful-tools/quick-sharun.sh) ([`sharun`](https://github.com/VHSgunzo/sharun) wrapper) and [`uruntime`](https://github.com/VHSgunzo/uruntime), with [easy generic AppImage template](https://github.com/pkgforge-dev/TEMPLATE-AppImage).  
This way, AppImage works on every old and new distro, and on `musl` distros like Alpine. It doesn't require `libfuse` from the host.
So it doesn't depend on the host system at all, besides `/bin/sh` being available, and if detected, Nvidia proprietary GPU driver will be used.  
Everything needed, including binaries, libraries, GPU acceleration (`mesa`, `opengl`), etc. is contained inside the AppImage.

This makes it very easy and reliable to package it for other Linux distributions if further desktop integration is needed (like adding systemd services, shell profiles, .desktop files etc.).

## TO-DO

- Make a GitHub action to package the AppImage in `.deb`, `.rpm`, `.apk` and other similar formats with desktop file and autostart entries integrated, like the previous `.rpm` did.
