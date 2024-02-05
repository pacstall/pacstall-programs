name="katawa-shoujo-re-engineered"
gives="ksre"
pkgver="1.4.2"
pkgdesc="A modern version of the classic bishoujo-style visual novel"
repology=("project: ${name}")
homepage='https://www.fhs.sh/projects'
depends=("renpy")
optdepends=(
  "espeak-ng: speech synthesizer for accessibility"
  "mbrola:    speech synthesizer for accessibility"
)
maintainer="vigress8 <vig@disroot.org>"
repology=("project: ${name}")
url="https://codeberg.org/fhs/${name}/archive/v${pkgver}.tar.gz"
hash="efab7ab1d6cb5e3b67cc4ee44e327b0d040f68b07434f9f9e77d32eba2f697a9"
fname="sh.fhs.KatawaShoujoReEngineered"
frepo="https://github.com/flathub/${fname}/raw/master"

prepare() {
  curl -o "${gives}.desktop"     -Ls "${frepo}/${fname}.desktop"
  curl -o "${gives}.appdata.xml" -Ls "${frepo}/${fname}.appdata.xml"
  curl -o "${gives}.svg"         -Ls "${frepo}/${gives^^}_Logo.svg"
  cat > "${gives}" <<- END
  #!/bin/sh
  renpy /usr/share/${gives} "\$@"
END

  sed "s|Icon=${fname}|Icon=${gives}|g" \
  -i "${gives}.desktop"
  sed 's|config.developer = "auto"|config.developer = False|g' \
  -i game/config.rpy
}

build() {
  renpy game compile
}

package() {
  sudo install -d "${pkgdir}/usr/share"
  sudo cp -r game "${pkgdir}/usr/share/${gives}"

  sudo install -Dm755 "${gives}"             -t "${pkgdir}/usr/bin"
  sudo install -Dm644 "${gives}.desktop"     -t "${pkgdir}/usr/share/applications"
  sudo install -Dm644 "${gives}.appdata.xml" -t "${pkgdir}/usr/share/appdata"
  sudo install -Dm644 "${gives}.svg"         -t "${pkgdir}/usr/share/icons/hicolor/scalable/apps"
  sudo install -Dm644 LICENSE                -t "${pkgdir}/usr/share/licenses/${gives}"
}

# vim:set ft=sh ts=2 sw=2 et:
