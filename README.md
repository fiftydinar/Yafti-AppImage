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
This way, AppImage works on old and new distros, and on `musl` distros like Alpine. So it doesn't depend on the host system at all, besides `/bin/sh` being available, and if detected, Nvidia proprietary GPU driver will be used.  
Everything needed, including binaries, libraries, GPU acceleration (`mesa`, `opengl`), etc. is contained inside the AppImage.
