pkgname="nvm-git"
gives="nvm"
pkgver="0.40.6"
pkgdesc="Node Version Manager for managing multiple active Node.js versions"
arch=("any")
url="https://github.com/nvm-sh/nvm"
license=("MIT")
depends=("curl")
makedepends=("git")
optdepends=("bash-completion: Bash completion support")
breaks=("nvm")
repology=("project: nvm")
source=("${gives}::https://github.com/nvm-sh/nvm.git")
maintainer=("AJStrong <ajstrongdev@pm.me>")

package() {
  cd "${gives}"

  install -Dm644 "nvm.sh" "${pkgdir}/usr/share/nvm/nvm.sh"
  install -Dm755 "nvm-exec" "${pkgdir}/usr/share/nvm/nvm-exec"
  install -Dm644 "bash_completion" "${pkgdir}/usr/share/nvm/bash_completion"
  install -Dm644 "LICENSE.md" "${pkgdir}/usr/share/licenses/nvm/LICENSE.md"

  cat > "${pkgdir}/usr/share/nvm/init-nvm.sh" << 'EOF'
export NVM_DIR="${NVM_DIR:-$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")}"

[ -d "${NVM_DIR}" ] || mkdir -p "${NVM_DIR}"
[ -e "${NVM_DIR}/nvm.sh" ] || ln -s /usr/share/nvm/nvm.sh "${NVM_DIR}/nvm.sh"
[ -e "${NVM_DIR}/nvm-exec" ] || ln -s /usr/share/nvm/nvm-exec "${NVM_DIR}/nvm-exec"

[ -s /usr/share/nvm/nvm.sh ] && \. /usr/share/nvm/nvm.sh
if [ -n "${BASH_VERSION-}${ZSH_VERSION-}" ] && [ -s /usr/share/nvm/bash_completion ]; then
  \. /usr/share/nvm/bash_completion
fi
EOF
  chmod 644 "${pkgdir}/usr/share/nvm/init-nvm.sh"
}

post_install() {
  fancy_message info "Add NVM to your shell by running one of the following commands:"
  fancy_message sub "echo '. /usr/share/nvm/init-nvm.sh' >> ~/.bashrc"
  fancy_message sub "echo '. /usr/share/nvm/init-nvm.sh' >> ~/.zshrc"
  fancy_message sub "echo '. /usr/share/nvm/init-nvm.sh' >> ~/.profile"
  fancy_message info "Then restart your shell or source the updated file."
}

post_remove() {
  fancy_message warn "Remove '. /usr/share/nvm/init-nvm.sh' from your shell configuration."
}
