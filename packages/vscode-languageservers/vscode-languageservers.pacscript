pkgname=(
  "vscode-css-languageserver"
  "vscode-html-languageserver"
  "vscode-json-languageserver"
)
pkgbase="vscode-languageservers"
pkgver="1.99.3"
pkgdesc='VS Code language servers'
arch=("any")
url='https://github.com/Microsoft/vscode'
license=("MIT")
depends=("nodejs")
makedepends=(
  "git"
  "npm"
)
pacdeps=("typescript")
source=("git+${url}.git#tag=${pkgver}")
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
    tsc
    popd
  done
}

package_vscode-css-languageserver() {
  # ported from original function:
  # case "$1" in
  #   vscode-css-languageserver)
  pkgdesc='CSS/LESS/SCSS language server'

  install -d "${pkgdir}"/usr/{bin,lib/node_modules/vscode-css-languageserver}
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/vscode-css-languageserver vscode/LICENSE.txt

  cd vscode/extensions

  printf '%s\n' '#!/usr/bin/env node' "require('/usr/lib/node_modules/vscode-css-languageserver/out/node/cssServerMain');" > "${pkgdir}"/usr/bin/vscode-css-languageserver
  ln -s vscode-css-languageserver "${pkgdir}"/usr/bin/vscode-css-language-server
  cd css-language-features/server
  #   ;;
  # esac

  chmod +x "${pkgdir}"/usr/bin/vscode-css-languageserver
  rm -r node_modules/@types
  cp -r node_modules out package.json "${pkgdir}"/usr/lib/node_modules/vscode-css-languageserver
}

package_vscode-html-languageserver() {
  # ported from original function:
  # case "$1" in
  #   vscode-html-languageserver)
  pkgdesc='HTML language server'
  # pacdeps already logs this as part of the pkgbase
  #depends+=("typescript")

  install -d "${pkgdir}"/usr/{bin,lib/node_modules/vscode-html-languageserver}
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/vscode-html-languageserver vscode/LICENSE.txt

  cd vscode/extensions

  printf '%s\n' '#!/usr/bin/env node' "require('/usr/lib/node_modules/vscode-html-languageserver/out/node/htmlServerMain');" > "${pkgdir}"/usr/bin/vscode-html-languageserver
  ln -s vscode-html-languageserver "${pkgdir}"/usr/bin/vscode-html-language-server
  cd html-language-features/server
  #   ;;
  # esac

  chmod +x "${pkgdir}"/usr/bin/vscode-html-languageserver
  rm -r node_modules/@types
  cp -r node_modules out package.json "${pkgdir}"/usr/lib/node_modules/vscode-html-languageserver
}

package_vscode-json-languageserver() {
  # ported from original function:
  # case "$1" in
  #   vscode-json-languageserver)
  pkgdesc='JSON language server'

  install -d "${pkgdir}"/usr/{bin,lib/node_modules/vscode-json-languageserver}
  install -Dm644 -t "${pkgdir}"/usr/share/licenses/vscode-json-languageserver vscode/LICENSE.txt

  cd vscode/extensions

  printf '%s\n' '#!/usr/bin/env node' "require('/usr/lib/node_modules/vscode-json-languageserver/out/node/jsonServerMain');" > "${pkgdir}"/usr/bin/vscode-json-languageserver
  ln -s vscode-json-languageserver "${pkgdir}"/usr/bin/vscode-json-language-server
  cd json-language-features/server
  #   ;;
  # esac

  chmod +x "${pkgdir}"/usr/bin/vscode-json-languageserver
  rm -r node_modules/@types
  cp -r node_modules out package.json "${pkgdir}"/usr/lib/node_modules/vscode-json-languageserver
}
