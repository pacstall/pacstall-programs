name="steam"
repology=("project: ${name}")
version="1.0.0.74"
url="https://repo.steampowered.com/${name}/archive/stable/${name}_${version}.tar.gz"
depends="apt-transport-https ca-certificates coreutils realpath curl file libc6 libnss3 policykit-1 python3 xterm xz-utils zenity steam-libs-amd64 steam-libs-i386 xdg-utils steamos-base-files"
replace="${name} ${name}-launcher-deb"
description="Steam is a software distribution service with an online store, automated installation, automatic updates, achievements, SteamCloud synchronized savegame, screenshot functionality, and many social features"
hash="b0ed3b8378f541e8dab68d8b589d85ad6dc0cdf302701cf8e87130eda2b1a234"
maintainer="WRM-42 <y8bsbahy@anonaddy.me>"

prepare() {
    true
}

build() {
    make -j"$(nproc)"
}

install() {
    sudo make install DESTDIR="${STOWDIR}/${name}"
}
