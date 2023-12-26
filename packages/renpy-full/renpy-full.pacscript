maintainer="vigress8 <vig@disroot.org>"

name="renpy-full"
gives="renpy"
replace="${gives}"
breaks=("${gives}7" "${gives}7-full" "${gives}-nightly")
repology=("project: ${gives}")
pkgdesc="A visual novel engine"
pkgver="8.1.3"
arch=("amd64" "arm64")
homepage="https://www.renpy.org"
url="${homepage}/dl/${pkgver}/${gives}-${pkgver}-sdk.tar.bz2"
case "${CARCH}" in
  amd64)
    hash="b15fdaf1322f18aaa1a588761f52543683aefd1a3c9e45c5bf045e3a4ad468b7"
    ;;
  arm64)
    url="${url/sdk/sdkarm}"
    hash="0fb97dda8ab02ec655f8d98b4006ba8b784c6ff7cf16374788b90d9be4c65040"
    ;;
  *) ;;
esac

declare -A \
  sums=(
    ["${gives}-${pkgver}-rapt.zip"]="de1580e6fa78e2c1ed9646346eb3b10db5519735025915366bfa5cb57ecca0e1"
    ["${gives}-${pkgver}-renios.zip"]="27988dc672b2753683f64211dfe39cf87f90aed64948cd9ce2d9be7756fe01cc"
    ["${gives}-${pkgver}-steam.zip"]="d7470f561fcdc277087a0d86b01d6f73caced8a8d302e66dc494060f536d145c"
    ["${gives}-${pkgver}-web.zip"]="351e7a9680f3b972f6bff67bd5952558091d80ffd05fbca295ff90aa25a4f144"
  )

prepare() {
  for filename in "${!sums[@]}"; do
    curl -sO "${homepage}/dl/${pkgver}/${filename}"
    sha256sum -c <<< "${sums[${filename}]} ${filename}" > /dev/null || {
      fancy_message error "Integrity check for ${filename} failed"
      return 1
    }
  done
}

package() {
  unzip -qq ./"*.zip"
  rm ./*.zip
  sudo install -Dm644 "LICENSE.txt" -t "${pkgdir}/usr/share/licenses/${gives}"
  rm -rf "LICENSE.txt" "renpy.app" "lib/"{py3-{mac-universal,windows-x86_64},python3.9}
  sudo install -Dm644 "launcher/game/images/logo.png" "${pkgdir}/usr/share/pixmaps/${gives}.png"
  sudo install -Dm644 "launcher/game/images/logo32.png" "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${gives}.png"
  sudo mkdir -p "${pkgdir}/opt/${gives}"
  sudo mv ./* "${pkgdir}/opt/${gives}"

  sudo install -Dm644 /dev/stdin "${pkgdir}/opt/applications/${gives}.desktop" <<- END
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
  sudo ln -sf "/opt/${gives}/doc" "/usr/share/doc/${gives}"
  sudo ln -sf "/opt/${gives}/${gives}.sh" "/usr/bin/${gives}"
}

post_remove() {
  sudo rm -f "/usr/share/doc/${gives}"
  sudo rm -f "/usr/bin/${gives}"
}
