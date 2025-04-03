pkgname=(
  vscode-css-languageserver
  vscode-html-languageserver
  vscode-json-languageserver
)
pkgbase=vscode-languageservers
pkgver=1.97.0
pkgrel=1
pkgdesc='VS Code language servers'
arch=(any)
url=https://github.com/Microsoft/vscode
license=(MIT)
depends=(nodejs)
makedepends=(
  git
  npm
  typescript
)
source=("git+${url}.git#tag=${pkgver}")
b2sums=('b24ba35d9b48dda55304b711d55c465b7f9ae392fbac92f5ed1886c401e9989dabe5acd4b7f055b3e8ab861ef92192d6fba2e59aeffc84394d2f735832087709')
external_connection=true
maintainer=("Bahar KURT <kurtbahartr@gmail.com>")

prepare() {
  for i in css html json; do
    pushd vscode/extensions/"${i}-language-features"/server
    npm ci
    popd
  done
}

build() {
  for i in css html json; do
    pushd vscode/extensions/"${i}-language-features"/server
    tsc || true
    popd
  done
}

_package() {
  install -d "${pkgdir}"/usr/{bin,lib/node_modules/"$1"}
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/"$1" vscode/LICENSE.txt

  cd vscode/extensions

  case "$1" in
    vscode-css-languageserver)
      pkgdesc='CSS/LESS/SCSS language server'

      printf '%s\n' '#!/usr/bin/env node' "require('/usr/lib/node_modules/$1/out/node/cssServerMain');" > "${pkgdir}"/usr/bin/"$1"
      ln -s "$1" "${pkgdir}"/usr/bin/vscode-css-language-server
      cd css-language-features/server
      ;;
    vscode-html-languageserver)
      pkgdesc='HTML language server'
      depends+=('typescript')

      printf '%s\n' '#!/usr/bin/env node' "require('/usr/lib/node_modules/$1/out/node/htmlServerMain');" > "${pkgdir}"/usr/bin/"$1"
      ln -s "$1" "${pkgdir}"/usr/bin/vscode-html-language-server
      cd html-language-features/server
      ;;
    vscode-json-languageserver)
      pkgdesc='JSON language server'

      printf '%s\n' '#!/usr/bin/env node' "require('/usr/lib/node_modules/$1/out/node/jsonServerMain');" > "${pkgdir}"/usr/bin/"$1"
      ln -s "$1" "${pkgdir}"/usr/bin/vscode-json-language-server
      cd json-language-features/server
      ;;
    *) ;;
  esac

  chmod +x "${pkgdir}"/usr/bin/"$1"
  rm -r node_modules/@types
  cp -r node_modules out package.json "${pkgdir}"/usr/lib/node_modules/"$1"
}

for _pkgname in "${pkgname[@]}"; do
  eval "package_${_pkgname}() { _package ${_pkgname}; }"
done
