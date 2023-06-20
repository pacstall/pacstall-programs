name="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
version="1.79.2"
homepage="https://code.visualstudio.com/"
description="lightweight but powerful source code editor"
project=("project: vscode")
maintainer="Diegiwg <diegiwg@gmail.com>"

case "${CARCH}" in
  amd64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.79.2-1686734195_amd64.deb"
    hash="a3886d54a5d1782f49be4eee0c25e24daa56345d6d316ca9edffe5719ef1240c"
    ;;
  arm64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.79.2-1686733230_arm64.deb"
    hash="69bfc49ca60b140d971f1427b14645c6ab6d12b2e7313e5f722f76ed2306983c"
    ;;
  armhf)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code/code_1.79.2-1686733070_armhf.deb"
    hash="9dec925caf4c81a9aafccf72a9b141fe6574f97f0177321a29654f3079f58fd7"
    ;;
  *) return 1 ;;
esac
