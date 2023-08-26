name="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.80.1"
homepage="https://code.visualstudio.com/"
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
maintainer="Diegiwg <diegiwg@gmail.com>"

case "${CARCH}" in
  amd64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1689183569_amd64.deb"
    hash="fb1e8368f82a342c2c64806ef94eab380c2ee0ddfc6d27f37f56eb828f92dde5"
    ;;
  arm64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1689182504_arm64.deb"
    hash="47b931d79a77584ba2530e6998f888f3f6c26802f35acf9c351064250167033d"
    ;;
  armhf)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1689182523_armhf.deb"
    hash="422503f3756ec4c713496b6e62a1fe9ec20909990719768b5e7d9046a50c04ad"
    ;;
  *) return 1 ;;
esac
