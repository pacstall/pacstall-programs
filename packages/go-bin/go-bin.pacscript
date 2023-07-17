maintainer="Paul Cosma (saenai) <paul.cosma97@gmail.com>"

name="go-bin"
pkgname="go"
version="1.20.5"
description="Go is an open source programming language that makes it easy to build simple, reliable, and efficient software."
url="https://go.dev/dl/go${version}.linux-amd64.tar.gz"
breaks=("${pkgname}" "${pkgname}-git" "${pkgname}-app" "${pkgname}-deb" "golang" "golang-git" "golang-deb" "golang-bin" "golang-app" "golang-go")
gives="golang-go"
replace=("golang-go")
hash="d7ec48cde0d3d2be2c69203bc3e0a44de8660b9c09a6e85c4732a3f7dc442612"
arch=('amd64')
repology=("project: go")

__goroot_pkgdir="${pkgdir}/usr/local/${name}"
__goroot="/usr/local/${name}"
__shell_rcs=("${homedir}/.bashrc" "${homedir}/.zshrc" "${homedir}/.profile")

package() {
  # Install binary
  sudo install -Dm755 "bin/go" "${pkgdir}/usr/bin/go"
  sudo install -Dm755 "bin/gofmt" "${pkgdir}/usr/bin/gofmt"

  sudo mkdir -p "${__goroot_pkgdir}"
  sudo cp -r "." "${__goroot_pkgdir}"
  sudo chmod -R 755 "${__goroot_pkgdir}"
}

__goroot_is_set() {
  grep --only-matching -q "GOROOT=.*" < "$1"
  return $?
}

__clear_goroot() {
  sed -i '/export GOROOT=.*/d' "$1"
}

__set_goroot() {
  echo "export GOROOT=\"${__goroot}\"" | tee -a "$1" > /dev/null
}

postinst() {
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

removescript() {
  for shell_rc in "${__shell_rcs[@]}"; do
    if [[ -f ${shell_rc} ]]; then
      if __goroot_is_set "${shell_rc}"; then
        __clear_goroot "${shell_rc}"
      fi
    fi
  done
}
