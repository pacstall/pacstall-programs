pkgname="genymotion-bin"
gives="genymotion"
repology=("project: ${gives}")
pkgver="3.6.0"
replaces=("${gives}")
breaks=("${gives}" "${gives}-bin" "${gives}-git" "${gives}-app" "${gives}-deb")
arch=("amd64")
sha256sums=("092d40f6e76de3b6e1827609aaa9021b7cf85da3d51e6cf8d7b553b18d9c70e0")
source=("https://dl.${gives}.com/releases/${gives}-${pkgver}/${gives}-${pkgver}-linux_x64.bin")
url="https://${gives}.com"
pkgdesc="Android virtual devices"
maintainer=("Arrowsome <ramtintoosi@gmail.com>")

prepare() {
  cd "${srcdir}"
  rm -rf "/opt/${gives}"
  mkdir -p "${pkgdir}/opt/${gives}"

  chmod +x "./${gives}-${pkgver}-linux_x64.bin"
}

package() {
  cd "${srcdir}"
  # Retrieve line number where tar.bzip2 binary begins
  local skip
  skip=$(awk "/^__TARFILE_FOLLOWS__/ { print NR + 1; exit 0; }" "./${gives}-${pkgver}-linux_x64.bin")

  # Untar following archive
  if ! tail -n +"${skip}" "./${gives}-${pkgver}-linux_x64.bin" | tar -xj --no-same-owner -C "${pkgdir}/opt/${gives}"; then
    return 1
  fi

  install -Dm644 "/dev/stdin" "${pkgdir}/usr/share/applications/${gives}.desktop" <<- END
[Desktop Entry]
Type=Application
Version=1.0
Name=Genymotion
Comment=Virtual environment for Android.
Exec=/opt/${gives}/${gives}
Icon=/opt/${gives}/icons/${gives}-logo.png
Terminal=false
Categories=Development;
END
}
