pkgname="noisetorch-bin"
gives="noisetorch"
arch=("amd64")
pkgver="0.12.2"
pkgdesc="Easy to use noise suppression for PulseAudio"
repology=("project: noisetorch" "visiblename: noisetorch-bin")
source=(
  "${pkgname}~${pkgver}::https://github.com/noisetorch/NoiseTorch/releases/download/v${pkgver}/NoiseTorch_x64_v${pkgver}.tgz"
  "noisetorch-pipewire.service::https://aur.archlinux.org/cgit/aur.git/plain/noisetorch-pipewire.service?h=noisetorch-bin"
  "noisetorch-pulse.service::https://aur.archlinux.org/cgit/aur.git/plain/noisetorch-pulse.service?h=noisetorch-bin"
)
sha256sums=(
  "aaa29e76736dc3432197e665f3c868496b5aca52183b67e5a0a1b8fa7913fe60"
  "SKIP"
  "SKIP"
)
maintainer=("Marie Piontek <marie@kaifa.ch>")
breaks=("${gives}" "${gives}-deb" "${gives}-app" "${gives}-git")
depends=("policykit-1")

package() {
  # Get services from AUR and install
  install -D -m644 noisetorch-{pulse,pipewire}.service -t "${pkgdir}/usr/lib/systemd/user/"

  # Install the rest of the app
  install -D -m755 ".local/bin/noisetorch" "${pkgdir}/usr/bin/noisetorch"
  install -D -m644 ".local/share/applications/noisetorch.desktop" "${pkgdir}/usr/share/applications/noisetorch.desktop"

  chmod +x "${pkgdir}/usr/bin/noisetorch"
  install -D -m644 ".local/share/icons/hicolor/256x256/apps/noisetorch.png" "${pkgdir}/usr/share/icons/hicolor/256x256/apps/noisetorch.png"
}
