name="noisetorch-bin"
gives="noisetorch"
pkgver="0.12.2"
pkgdesc="Easy to use noise suppression for PulseAudio"
repology=("project: noisetorch" "visiblename: noisetorch-bin")
url="https://github.com/noisetorch/NoiseTorch/releases/download/v${pkgver}/NoiseTorch_x64_v${pkgver}.tgz"
hash="aaa29e76736dc3432197e665f3c868496b5aca52183b67e5a0a1b8fa7913fe60"
maintainer="Marie Piontek <marie@kaifa.ch>"
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
depends=("policykit-1")

package() {
  # Extract tgz
  tar zxf NoiseTorch_x64_v"${pkgver}".tgz

  # Get services from AUR and install
  wget -q "https://aur.archlinux.org/cgit/aur.git/plain/noisetorch-pipewire.service?h=noisetorch-bin" -O noisetorch-pipewire.service
  wget -q "https://aur.archlinux.org/cgit/aur.git/plain/noisetorch-pulse.service?h=noisetorch-bin" -O noisetorch-pulse.service
  sudo install -D -m644 noisetorch-{pulse,pipewire}.service -t "${pkgdir}/usr/lib/systemd/user/"

  # Install the rest of the app
  sudo install -D -m755 "${SRCDIR}/.local/bin/noisetorch" "${pkgdir}/usr/bin/noisetorch"
  sudo install -D -m644 "${SRCDIR}/.local/share/applications/noisetorch.desktop" "${pkgdir}/usr/share/applications/noisetorch.desktop"

  sudo chmod +x "${pkgdir}/usr/bin/noisetorch"
  sudo install -D -m644 "${SRCDIR}/.local/share/icons/hicolor/256x256/apps/noisetorch.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}
