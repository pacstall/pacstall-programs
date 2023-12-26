name="renpy-full"
gives="renpy"
replace="${gives}"
breaks=("${gives}7-full" "${gives}-git")
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
  *) return 1 ;;
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
    sha256sum -c <<< "${sums[${filename}]}" || {
      fancy_message error "Integrity check for ${filename} failed"
      return 1
    }
    unzip -qq "${filename}"
  done
}

package() {
  rm ./*.zip
  sudo install -Dm644 LICENSE.txt "${pkgdir}/usr/share/licenses/${gives}"
  rm LICENSE.txt
  mkdir -p "${pkgdir}/usr/share/doc" "${pkgdir}/opt/${gives}"
  sudo mv doc/* "${pkgdir}/usr/share/doc/${gives}"
  sudo cp -r --preserve=mode ./* "${pkgdir}/opt/${gives}"
  sudo install -Dm644 launcher/game/images/logo.png "${pkgdir}/usr/share/pixmaps/${gives}.png"
  sudo install -Dm644 launcher/game/images/logo32.png "${pkgdir}/usr/share/icons/hicolor/32x32/apps/${gives}.png"
  cat <<- END > "${gives}.desktop"
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
  sudo install -Dm644 "${gives}.desktop" -t "${pkgdir}/usr/share/applications"
}

post_install() {
  sudo ln -sf "/usr/bin/${gives}" "${pkgdir}/opt/${gives}/${gives}.sh"
}

post_remove() {
  sudo rm -f "/usr/bin/${gives}"
}
