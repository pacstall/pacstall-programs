name="noisetorch-bin"
pkgname="noisetorch"
version="0.11.5"
description="Easy to use noise suppression for PulseAudio"
repology=("project: noisetorch" "visiblename: noisetorch-bin")
url="https://github.com/lawl/NoiseTorch/releases/download/${version}/NoiseTorch_x64.tgz"
hash="c8105a576fbbf79622105228e957cec80a27bce9e5b9b224ef9dfe87fe82f97b"
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
    # Get icon from github and install it
    wget -q "https://aur.archlinux.org/cgit/aur.git/plain/noisetorch-pipewire.service?h=noisetorch-bin" -O noisetorch-pipewire.service
    wget -q "https://aur.archlinux.org/cgit/aur.git/plain/noisetorch-pulse.service?h=noisetorch-bin" -O noisetorch-pulse.service
    sudo install -D -m644 "noisetorch-{pulse,pipewire}.service" -t "${STOWDIR}/${name}/usr/lib/systemd/user/"

    # Install the rest of the app
    sudo install -D -m755 "${SRCDIR}/.local/bin/noisetorch" "${STOWDIR}/${name}/usr/bin/noisetorch"
    sudo install -D -m644 "${SRCDIR}/.local/share/applications/noisetorch.desktop" "${STOWDIR}/${name}/usr/share/applications/noisetorch.desktop"

    sudo chmod +x "${STOWDIR}/${name}/usr/bin/noisetorch"
    sudo install -D -m644 "${SRCDIR}/.local/share/icons/hicolor/256x256/apps/noisetorch.png" "${STOWDIR}/${name}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}
