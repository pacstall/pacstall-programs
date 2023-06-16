name="vscode-insiders-deb"
arch=("amd64" "arm64" "armhf")
gives="code-insiders"
version="1.80.0-insiders"
pkgversion="1.80.0"
homepage="https://code.visualstudio.com/"
description="lightweight but powerful source code editor"
project=("project: vscode-insiders")
maintainer="Diegiwg <diegiwg@gmail.com>"

case "${CARCH}" in
  amd64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgversion}-1686909910_amd64.deb"
    hash="ebf2771db5117f3cbe6de4520398f1b8f40be5be194a0e0546c41e7dc64be996"
    ;;
  arm64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgversion}-1686910022_arm64.deb"
    hash="643ececd339ae42720c23717e13a1b7d1b2dccc41f624d0e25d68bfe3ecaeb95"
    ;;
  armhf)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgversion}-1686909311_armhf.deb"
    hash="c4edc7669955b52843612d9fd1942fa8aff5a8503df25bb74ea87be84d65d575"
    ;;
  *) return 1 ;;
esac
