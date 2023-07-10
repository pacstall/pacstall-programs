name="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
version="1.80.0"
homepage="https://code.visualstudio.com/"
description="lightweight but powerful source code editor"
project=("project: vscode")
maintainer="Diegiwg <diegiwg@gmail.com>"

case "${CARCH}" in
  amd64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1688479026_amd64.deb"
    hash="3fbc0fd2bf960fc495950e406ba24ee800c047156d1e88885239655e922e15a7"
    ;;
  arm64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1688477953_arm64.deb"
    hash="b10bf771909998a2aa53c2222bf4b38d7a8a7b48f6cf877dd490a8638c6cc17f"
    ;;
  armhf)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1688477950_armhf.deb"
    hash="23528e05bcbf9fb85976e82954f372e6ffb08f514b7e97e5278e6d08fff6e0a8"
    ;;
  *) return 1 ;;
esac
