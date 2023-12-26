name="renpy7-full"
gives="renpy"
replace="${gives}"
breaks=("${gives}-full" "${gives}-git")
repology=("project: ${gives}")
pkgdesc="A visual novel engine (version 7)"
pkgver="7.6.3"
arch=("amd64" "arm64")
homepage="https://www.renpy.org"
url="${homepage}/dl/${pkgver}/${gives}-${pkgver}-sdk.tar.bz2"
case "${CARCH}" in
  amd64)
    hash="556ea40922e304460d50bd3eb335ab9ddce988390dbbf9f7aa77dde4ae959be1"
    ;;
  arm64)
    url="${url/sdk/sdkarm}"
    hash="6a01c152786723f9788eaed9caeb20181ef7ae2ea77b9f3c6ad98a3508410d12"
    ;;
  *) return 1 ;;
esac

declare -A \
sums=(
  ["${gives}-${pkgver}-rapt.zip"]="8cf4b38551a35d2a5af6ba94d021a50b15f375aab86668f9e642f21452e8381e"
  ["${gives}-${pkgver}-renios.zip"]="79d682be6db93f2a64edebbe1fb8805c7eadc5112e562e639974ce1a09a1e74a"
  ["${gives}-${pkgver}-steam.zip"]="9fe01b9c0bbf011a7261b4f212438a555e231f549ec54833dcbdc597fbf91664"
  ["${gives}-${pkgver}-web.zip"]="d56da8d35cfaa50596239e564d18df2fd1eced0c558681eb4e7863b6c6e5bd88"
)

prepare() {
  for filename in "${!sums[@]}"; do
    curl -sO "${homepage}/dl/${pkgver}/${filename}"
    sha256sum -c "${sums[${filename}]}" || {
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
