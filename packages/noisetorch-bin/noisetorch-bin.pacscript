name="noisetorch-bin"
pkgname="noisetorch"
version="0.12.0"
description="Easy to use noise suppression for PulseAudio"
repology=("project: noisetorch" "visiblename: noisetorch-bin")
url="https://github.com/noisetorch/NoiseTorch/releases/download/${version}/NoiseTorch_x64_v${version}.tgz"
hash="641bddd13c62e591f3fe2c799535d721dab9bf856ed8bc0312d408fde1eb7e91"
maintainer="Marie Piontek <marie@kaifa.ch>"
gives="${pkgname}"
breaks="${pkgname} ${pkgname}-deb ${pkgname}-app ${pkgname}-git"

depends="policykit-1"

prepare() {
    true
}

build() {
    true
}

install() {
    # Extract tgz
    tar zxf NoiseTorch_x64_v${version}.tgz

    # Get services from AUR and install
    wget -q "https://aur.archlinux.org/cgit/aur.git/plain/noisetorch-pipewire.service?h=noisetorch-bin" -O noisetorch-pipewire.service
    wget -q "https://aur.archlinux.org/cgit/aur.git/plain/noisetorch-pulse.service?h=noisetorch-bin" -O noisetorch-pulse.service
    sudo install -D -m644 noisetorch-{pulse,pipewire}.service -t "${STOWDIR}/${name}/usr/lib/systemd/user/"

    # Install the rest of the app
    sudo install -D -m755 "${SRCDIR}/.local/bin/noisetorch" "${STOWDIR}/${name}/usr/bin/noisetorch"
    sudo install -D -m644 "${SRCDIR}/.local/share/applications/noisetorch.desktop" "${STOWDIR}/${name}/usr/share/applications/noisetorch.desktop"

    sudo chmod +x "${STOWDIR}/${name}/usr/bin/noisetorch"
    sudo install -D -m644 "${SRCDIR}/.local/share/icons/hicolor/256x256/apps/noisetorch.png" "${STOWDIR}/${name}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}
