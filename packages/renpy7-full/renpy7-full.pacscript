name="renpy7-full"
gives="renpy"
pkgdesc="A visual novel engine"
pkgver="7.7.0"
timestamp="24012702"
homepage='https://www.renpy.org'
arch=("amd64" "arm64")
replace=("${gives}")
breaks=("${gives}7" "${gives}-full" "${gives}-nightly")
depends=(
  'ffmpeg' 'libfreetype6' 'libfribidi0'
  'libglvnd0' 'libglx0' 'libsdl2-gfx-1.0-0'
  'libx11-6' 'libxau6' 'libxcb1'
  'libxdmcp6'
)
repology=("project: ${gives}")
pkgdesc="A visual novel engine"
pkgver="7.7.0"
arch=("amd64" "arm64")
homepage='https://www.renpy.org'
maintainer="vigress8 <vig@disroot.org>"
url="https://github.com/renpy/renpy/releases/download/${pkgver}.${timestamp}/${gives}-${pkgver}-sdk.tar.bz2"
case "${CARCH}" in
  amd64)
    hash="02cfcc1423ff29465932900f5423d9e0a951ad45b508911a666bb45f0fbe34cf"
    ;;
  arm64)
    url="${url/sdk/sdkarm}"
    hash="263bab3fb37406498f80d42ebb8bd502e78d234fdea5d93e3e52716036fd09a5"
    ;;
  *) ;;
esac
maintainer="vigress8 <vig@disroot.org>"
repology=("project: ${gives}")
declare -A sums=(
    ["${gives}-${pkgver}-rapt.zip"]="a55c1894cac754b4660f75e5540350f2033530a035eba0294b8a6d256a29559d"
    ["${gives}-${pkgver}-renios.zip"]="2d8bf51b49206a2ded6103e4f525397c9a387d3c0a8cba02bb59e46716ce1319"
    ["${gives}-${pkgver}-steam.zip"]="22de7021ce5cdde7f88790bb95cccdf0fc4b516bacfc55da5e526aae820a6f09"
    ["${gives}-${pkgver}-web.zip"]="7e8dc3c2ec15ffbd60db29dcc99100fadbe706a41eb1b9e037b02fa63a87bf13"
  )

prepare() {
  for filename in "${!sums[@]}"; do
    curl -LO \
    "https://github.com/renpy/renpy/releases/download/${pkgver}.${timestamp}/${filename}"
    sha256sum -c <<< "${sums[${filename}]} ${filename}" > /dev/null || {
      fancy_message error "Integrity check for ${filename} failed"
      return 1
    }
  done

  unzip -q ./"*.zip"
  rm ./*.zip
}

package() {
  sudo install -d "${pkgdir}/"{opt,usr/share/doc}"/${gives}"
  sudo install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${gives}"
  sudo install -Dm644 launcher/game/images/logo.png "${pkgdir}/usr/share/pixmaps/${gives}.png"
  sudo install -Dm644 launcher/game/images/logo32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${gives}.png"
  sudo cp -r doc "${pkgdir}/usr/share/doc/${gives}"
  rm -rf doc LICENSE.txt
  sudo mv ./* "${pkgdir}/opt/${gives}"

  sudo install -Dm644 /dev/stdin "${pkgdir}/usr/share/applications/${gives}.desktop" <<- END
  [Desktop Entry]
  Type=Application
  Name=Ren'Py
  Comment=A visual novel engine
  Icon=${gives}
  Exec=${gives}
  TryExec=${gives}
  Terminal=false
  Categories=Development;Game;
END

  sudo chmod -R +w "${pkgdir}/opt/${gives}/"{the_question,tutorial}
}

post_install() {
  sudo ln -sf "/opt/${gives}/${gives}.sh" "/usr/bin/${gives}"
}

post_remove() {
  sudo rm -f "/usr/bin/${gives}"
}

# vim:set ft=sh ts=2 sw=2 et:
