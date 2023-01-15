name="xivlauncher-cn-git"
pkgname="xivlauncher-cn"
gives="xivlauncher-cn"
repology=("project: xivlauncher-cn")
version="1.0.2"
url="https://github.com/ottercorp/XIVLauncher.Core.git"
license="GPL-3.0"
maintainer="qy117121 <chuan@ubuntu.org.cn>"
build_depends="dotnet-sdk-6.0 git"
depends="build-essential aria2 libsdl2-2.0-0 libsecret-1-0 attr fontconfig liblcms2-2 libxml2 libxcursor1 libxrandr2 libxdamage1 libxio0 gettext libfreetype6 libglu1-mesa libsm6 libpcap0.8 libfaudio0 desktop-file-utils libjxr0 xdg-utils "
description="Custom Launcher for Final Fantasy XIV Online CN."

build() {
    mkdir ${srcdir}/build
    git submodule update --init --recursive
    cd  ${srcdir}/src/XIVLauncher.Core
    echo "Building XIVLauncher ${version}"
    dotnet publish -r linux-x64 --sc -o "${srcdir}/build" --configuration Release 
}

install() {
    sudo install -d "${pkgdir}/usr/bin/"
    sudo install -d "${pkgdir}/opt/XIVLauncher/"
    sudo sed -i "s@Name=XIVLauncher@Name=XIVLauncher-CN@g" "${srcdir}/misc/linux_distrib/XIVLauncher.desktop"
    sudo sed -i "s@Exec=xivlauncher@Exec=xivlauncher-cn@g" "${srcdir}/misc/linux_distrib/XIVLauncher.desktop"
    sudo sed -i "s@the most critically acclaimed MMO@FFXIV CN@g" "${srcdir}/misc/linux_distrib/XIVLauncher.desktop"
    sudo sed -i "s@Icon=xivlauncher@Icon=/usr/share/pixmaps/xivlauncher.png@g" "${srcdir}/misc/linux_distrib/XIVLauncher.desktop"
    sudo install -D -m644 "${srcdir}/misc/linux_distrib/XIVLauncher.desktop" "${pkgdir}/usr/share/applications/XIVLauncher-CN.desktop"
    sudo install -D -m644 "${srcdir}/misc/linux_distrib/512.png" "${pkgdir}/usr/share/pixmaps/xivlauncher.png"
    sudo cp -r "${srcdir}/build/." "${pkgdir}/opt/XIVLauncher/"
    sudo ln -s  ../../opt/XIVLauncher/XIVLauncher.Core "${pkgdir}/usr/bin/xivlauncher-cn"
}
