name="renpy-full"
gives="renpy"
replace="${gives}"
breaks=("${gives}7" "${gives}7-full" "${gives}-nightly")
depends=(
  'ffmpeg' 'libfreetype6' 'libfribidi0'
  'libsdl2-gfx-1.0-0' 'python3-ecdsa'
  'python3-future' 'python3-pygame-sdl2'
)
repology=("project: ${gives}")
pkgdesc="A visual novel engine"
pkgver="8.2.0"
arch=("amd64" "arm64")
homepage='https://www.renpy.org'
maintainer="vigress8 <vig@disroot.org>"
url="https://www.renpy.org/dl/${pkgver}/${gives}-${pkgver}-sdk.tar.bz2"
case "${CARCH}" in
  amd64)
    hash="e79ec1014bad6adba69336f90802e89ae7a70172c1bb9c15301267390e9d7b38"
    ;;
  arm64)
    url="${url/sdk/sdkarm}"
    hash="eeb83b9aebb9c7f9c7e6c8bda6ab4831a20de17d52ee58a428fde10cb67d901d"
    ;;
  *) ;;
esac

declare -A sums=(
    ["${gives}-${pkgver}-rapt.zip"]="8b3b3e3e58fcb2c42c5d7b44b08f83d7c7caaa352e0f1c7c50d532a72f5f3293"
    ["${gives}-${pkgver}-renios.zip"]="509452bc204c59245a8bb52d084c0bab4e0ece330eea03b055a90b37158df282"
    ["${gives}-${pkgver}-steam.zip"]="420f3ff4a33c429d87669b9f009eeee2f9064b8b621917ce37dec05dba995c9c"
    ["${gives}-${pkgver}-web.zip"]="6db580f557bd77d403b9c29b84e33ec2fe9fc154e5d38056d976703093dae92f"
  )

prepare() {
  for filename in "${!sums[@]}"; do
    curl -LO "https://www.renpy.org/dl/${pkgver}/${filename}"
    sha256sum -c <<< "${sums[${filename}]} ${filename}" > /dev/null || {
      fancy_message error "Integrity check for ${filename} failed"
      return 1
    }
  done
}

package() {
  unzip -q ./"*.zip"
  rm ./*.zip
  sudo install -Dm644 LICENSE.txt -t "${pkgdir}/usr/share/licenses/${gives}"
  sudo install -Dm644 launcher/game/images/logo.png "${pkgdir}/usr/share/pixmaps/${gives}.png"
  sudo install -Dm644 launcher/game/images/logo32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${gives}.png"
  sudo install -Dm644 doc/* -t "${pkgdir}/usr/share/doc/${gives}"
  rm -rf doc LICENSE.txt "${gives}.app" lib/{py3-{mac-universal,windows-x86_64},python3.9}
  sudo mkdir -p "${pkgdir}/opt/${gives}"
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

  sudo chgrp -R games "${pkgdir}/opt/${gives}/"{the_question,tutorial}
  sudo chmod g+w "${pkgdir}/opt/${gives}/"{the_question,tutorial}
}

post_install() {
  sudo ln -sf "/opt/${gives}/${gives}.sh" "/usr/bin/${gives}"
}

post_remove() {
  sudo rm -f "/usr/bin/${gives}"
}

# vim:set ft=sh ts=2 sw=2 et:
