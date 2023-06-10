name="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
version="1.79.0"
homepage="https://code.visualstudio.com/"
description="lightweight but powerful source code editor"
project=("project: vscode")
maintainer="Diegiwg <diegiwg@gmail.com>"

case "${CARCH}" in
  amd64)
    url="http://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1686149120_amd64.deb"
    hash="c629e3cd1bed03ccba0ad43dc6bf995b0e4f053f9553b165161dab9cb68a9990"
    ;;
  arm64)
    url="http://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1686148160_arm64.deb"
    hash="c7bd085c555e11c83491a14d533bcf87a0874ef197f47abd4861268baefed276"
    ;;
  armhf)
    url="http://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1686148155_armhf.deb"
    hash="7edaa8648478cec405ca0c8d96c1474e2ea44cc3f2f13af3358ff78500978d0b"
    ;;
  *) return 1 ;;
esac
