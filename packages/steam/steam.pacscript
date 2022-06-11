name="steam"
repology=("project: ${name}")
version="1.0.0.74"
url="https://repo.steampowered.com/${name}/archive/stable/${name}_${version}.tar.gz"
depends="apt-transport-https ca-certificates coreutils curl file libc6 libnss3 policykit-1 python3 xterm xz-utils zenity"
replace="${name} ${name}-launcher-deb"
description="Software distribution service with an online store, automated installation, automatic updates, achievements, SteamCloud synchronized savegame, screenshot functionality, and many social features"
hash="b0ed3b8378f541e8dab68d8b589d85ad6dc0cdf302701cf8e87130eda2b1a234"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    true
}

install() {
    # Udev rules
    sudo mkdir -p "${STOWDIR}/${name}/lib/udev/rules.d"
    sudo mv "./subprojects/steam-devices/60-steam-input.rules" "${STOWDIR}/${name}/lib/udev/rules.d"
    sudo mv "./subprojects/steam-devices/60-steam-vr.rules" "${STOWDIR}/${name}/lib/udev/rules.d"
    # Icons
    sudo mkdir -p "${STOWDIR}/${name}/usr/share/icons/hicolor"
    sudo mv "./icons/16" "${STOWDIR}/${name}/usr/share/icons/hicolor/16x16"
    sudo mv "./icons/32" "${STOWDIR}/${name}/usr/share/icons/hicolor/32x32"
    sudo mv "./icons/256" "${STOWDIR}/${name}/usr/share/icons/hicolor/256x256"
    sudo mv "./icons/32" "${STOWDIR}/${name}/usr/share/icons/hicolor/32x32"
    sudo mv "./icons/48" "${STOWDIR}/${name}/usr/share/icons/hicolor/48x48"
    # Man
    sudo mkdir -p "${STOWDIR}/${name}/usr/share/man/man6/"
    sudo mv "steam.6" "${STOWDIR}/${name}/usr/share/man/man6"
    # Metainfo
    sudo mkdir -p "${STOWDIR}/${name}/usr/share/metainfo"
    sudo mv "com.valvesoftware.Steam.metainfo.xml" "${STOWDIR}/${name}/usr/share/metainfo"
    # .desktop
    sudo mkdir -p "${STOWDIR}/${name}/usr/share/applications"
    sudo mv "steam.desktop" "${STOWDIR}/${name}/usr/share/applications"
    # Binary
    sudo mkdir -p "${STOWDIR}/${name}/usr/bin"
    sudo mv "steam" "${STOWDIR}/${name}/usr/bin"
    # Documentation
    sudo mkdir -p "${STOWDIR}/${name}/usr/share/doc/steam"
    sudo mkdir -p "${STOWDIR}/${name}/usr/share/doc/steam-launcher"
    sudo mv "README" "${STOWDIR}/${name}/usr/share/doc/steam"
    sudo mv "steam_subscriber_agreement.txt" "${STOWDIR}/${name}/usr/share/doc/steam"
    sudo mv "./debian/copyright" "${STOWDIR}/${name}/usr/share/doc/steam-launcher"
    sudo mv "./debian/changelog" "${STOWDIR}/${name}/usr/share/doc/steam-launcher"
    # Other generic files
    sudo mkdir -p "${STOWDIR}/${name}/usr/lib/steam"
    sudo mv "steam_launcher" "${STOWDIR}/${name}/usr/lib/steam"
    sudo mv "bin_steam.sh" "${STOWDIR}/${name}/usr/lib/steam"
    sudo mv "bin_steamdeps.py" "${STOWDIR}/${name}/usr/lib/steam"
    sudo mv "bootstraplinux_ubuntu12_32.tar.xz" "${STOWDIR}/${name}/usr/lib/steam"
}
