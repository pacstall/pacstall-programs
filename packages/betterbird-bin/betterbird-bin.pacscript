pkgname="betterbird-bin"
gives="betterbird"
pkgver="140.3.0esr"
_build=bb11
pkgdesc="Fine-tuned version of Mozilla Thunderbird, Thunderbird on steroids, if you will"
maintainer=("tranquil <tranquiltr0@proton.me>")
arch=("x86_64")
url='https://www.betterbird.eu/index.html'
repology=("project: betterbird")
depends=("libdbus-glib-1-2" "hunspell")
source=(
  "https://www.betterbird.eu/downloads/LinuxArchive/${gives}-${pkgver}-${_build}.en-US.linux-x86_64.tar.xz"
  "eu.betterbird.Betterbird.desktop"
)
sha256sums=(
  "4341c8602c51f57a8aa5112e3a7d0fa954672503940561403c34ff8c05eacda4"
  "bce809385dc48951ca6309776ed8fe5213ebbce301a790349172a799d8987151"
)

package() {
  # Create directories
  install -d "${pkgdir}/opt"
  install -d "${pkgdir}/usr/bin"
  install -d "${pkgdir}/usr/share/applications"

  # Install main files
  cp -r "${srcdir}/${gives}/" "${pkgdir}/opt/${gives}"
  install -m644 "${srcdir}/eu.${gives}.Betterbird.desktop" "${pkgdir}/usr/share/applications/eu.${gives}.Betterbird.desktop"

  # Create symlinks
  ln -s "/opt/${gives}/betterbird" "${pkgdir}/usr/bin/${gives}"

  # Install icons
  for i in 16 22 24 32 48 64 128 256; do
    install -d "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/"
    ln -s "/opt/${gives}/chrome/icons/default/default${i}.png" \
      "${pkgdir}/usr/share/icons/hicolor/${i}x${i}/apps/${gives}.png"
  done
}
