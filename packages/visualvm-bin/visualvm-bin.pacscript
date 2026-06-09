pkgname="visualvm-bin"
gives="visualvm"
arch=("any")
pkgver="2.2.1"
pkgdesc="All-in-One Java Troubleshooting Tool"
url='https://visualvm.github.io/'
depends=('openjdk-8-jdk | openjdk-11-jdk | openjdk-17-jdk | openjdk-21-jdk | openjdk-25-jdk')
source=(
  "https://github.com/oracle/visualvm/releases/download/${pkgver}/visualvm_${pkgver//./}.zip"
  "visualvm.png::https://avatars.githubusercontent.com/u/16240463"
)
sha256sums=(
  "6884c908c9e10a959dea8e7b168b496515c0310d6b86a35ce96b8197231f4ef3"
  "SKIP"
)
repology=("project: visualvm")

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/usr/share/java/"
  mv "visualvm_${pkgver//./}" visualvm
  cp -r visualvm "${pkgdir}/usr/share/java/"

  mkdir -p "${pkgdir}/usr/bin/"
  ln -sf "/usr/share/java/visualvm/bin/visualvm" "${pkgdir}/usr/bin/visualvm"

  cat <<- END > "visualvm.desktop"
[Desktop Entry]
Name=VisualVM
Comment=All-in-One Java Troubleshooting Tool
Keywords=java;jvm;profiler;monitoring
Exec=visualvm
Icon=visualvm
Categories=Development;Java;
Terminal=false
Type=Application
END

  install -Dm644 "visualvm.desktop" -t "${pkgdir}/usr/share/applications"
  install -Dm644 "${srcdir}/visualvm.png" -t "${pkgdir}/usr/share/pixmaps"
}
