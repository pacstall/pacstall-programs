name="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.84.2"
homepage="https://code.visualstudio.com/"
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
maintainer="Diegiwg <diegiwg@gmail.com>"

case "${CARCH}" in
  amd64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1699528352_amd64.deb"
    hash="4c11a2912d0f1054b2088fa8e86b7cce6bfee4d8ef700e1750cd0ac997d19c39"
    ;;
  arm64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1699527205_arm64.deb"
    hash="b3b6130f02dfcc6372646efbe81a48d3f962daa3229b9c44b07848366e53a3d0"
    ;;
  armhf)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1699527189_armhf.deb"
    hash="ef85352d7241c46398ad4938a5e17839256308cbdd43fcaf13446ad8fe466f3c"
    ;;
  *) return 1 ;;
esac
