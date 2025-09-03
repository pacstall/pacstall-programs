maintainer=("Paul Cosma (saenai) <paul.cosma97@gmail.com>")

pkgname="go-bin"
gives="go"
pkgver="1.24.4"
pkgdesc="Go is an open source programming language that makes it easy to build simple, reliable, and efficient software."
source=("@${pkgname}~${pkgver}::https://go.dev/dl/go${pkgver}.linux-amd64.tar.gz")
breaks=("${gives}" "${gives}-git" "${gives}-app" "${gives}-deb" "golang" "golang-git" "golang-deb" "golang-bin" "golang-app" "golang-go")
replaces=("golang-go")
sha256sums=("77e5da33bb72aeaef1ba4418b6fe511bc4d041873cbf82e5aa6318740df98717")
arch=('amd64')
repology=("project: go")

__goroot="/usr/local/${pkgname}"
__shell_rcs=("${homedir}/.bashrc" "${homedir}/.zshrc" "${homedir}/.profile")

package() {
  cd "${pkgname}~${pkgver}"
  # Install binary
  install -Dm755 "bin/go" "${pkgdir}/usr/bin/go"
  install -Dm755 "bin/gofmt" "${pkgdir}/usr/bin/gofmt"

  mkdir -p "${pkgdir}/${__goroot}"
  cp -r "." "${pkgdir}/${__goroot}"
  chmod -R 755 "${pkgdir}/${__goroot}"
}

__goroot_is_set() {
  grep --only-matching -q "GOROOT=.*" < "$1"
  return $?
}

__clear_goroot() {
  sed -i '/export GOROOT=.*/d' "$1"
}

__set_goroot() {
  echo -e "\nexport GOROOT=\"${__goroot}\"" | tee -a "$1" > /dev/null
}

post_install() {
  for shell_rc in "${__shell_rcs[@]}"; do
    if [[ -f ${shell_rc} ]]; then
      if __goroot_is_set "${shell_rc}"; then
        __clear_goroot "${shell_rc}"
      fi

      __set_goroot "${shell_rc}"
    fi
  done

  fancy_message info "Close and reopen your terminal to start using Go or run one of the following to use it now:"
  echo -e "\tbash: \tsource ~/.bashrc"
  echo -e "\tzsh: \tsource ~/.zshrc"
  echo -e "\tksh: \t. ~/.profile"
}

post_remove() {
  for shell_rc in "${__shell_rcs[@]}"; do
    if [[ -f ${shell_rc} ]]; then
      if __goroot_is_set "${shell_rc}"; then
        __clear_goroot "${shell_rc}"
      fi
    fi
  done
}
