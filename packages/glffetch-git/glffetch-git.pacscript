pkgname="glffetch-git"
gives="glffetch-git"
arch=('any')
pkgver="1.0"
makedepends=("git")
pacdeps=("fastfetch-git" "nerd-fonts-hack")
pkgdesc="Configuration for Fastfetch for the GLF Team Challenges"
url='https://github.com/Xdavius/GLFfetch'
source=("https://github.com/Xdavius/GLFfetch.git")
maintainer=("xdavius <xdavius@github.com>")

prepare() {
  cd "GLFfetch"
  chmod u+x scripts/*.sh
  echo "#!/bin/bash
  source /opt/GLFfetch/scripts/icon.sh
  fastfetch --config /opt/GLFfetch/challenge.jsonc" | tee glffetch > /dev/null
}

package() {
  cd "GLFfetch"
  install -Dm755 "glffetch" "${pkgdir}/usr/bin/glffetch"
  install -d "${pkgdir}/opt/GLFfetch/scripts"
  install -Dm655 "GLF.png" "${pkgdir}/opt/GLFfetch/GLF.png"
  install -Dm655 "challenge.jsonc" "${pkgdir}/opt/GLFfetch/challenge.jsonc"
  install -Dm755 scripts/*.sh -t "${pkgdir}/opt/GLFfetch/scripts"
  chmod 747 "${pkgdir}"/opt/GLFfetch
}
