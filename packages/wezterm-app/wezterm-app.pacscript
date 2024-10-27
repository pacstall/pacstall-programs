pkgname="wezterm-app"
gives="wezterm"
arch=("amd64")
pkgver="20240203-110809-5046fc22"
pkgdesc="A GPU-accelerated cross-platform terminal emulator and multiplexer written by @wez and implemented in Rust"
source=("${gives}::https://github.com/wez/wezterm/releases/download/${pkgver}/WezTerm-${pkgver}-Ubuntu20.04.AppImage")
sha256sums=('34010a07076d2272c4d4f94b5e0dae608a679599e8d729446323f88f956c60f0')
breaks=("${gives}-bin")
repology=("project: wezterm")
maintainer=("smokeythemonkey <smokeythemonkey@posteo.net>")

package() {
  chmod +x "${gives}"
  ./"${gives}" --appimage-extract usr/share > /dev/null
  mkdir -p "${pkgdir}"/usr/{bin,share}

  # Duplicate .desktop file
  rm squashfs-root/usr/share/applications/wezterm.desktop
  for d in usr/share/{applications,icons,metainfo,nautilus-python}; do
    cp -a "squashfs-root/${d}" "${pkgdir}/${d}"
  done
  install -Dm755 "${gives}" -t "${pkgdir}/usr/share"
  ln -s "/usr/share/${gives}" "${pkgdir}/usr/bin/${gives}"
}
