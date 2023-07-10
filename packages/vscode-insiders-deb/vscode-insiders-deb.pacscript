name="vscode-insiders-deb"
arch=("amd64" "arm64" "armhf")
gives="code-insiders"
version="1.81.0-insiders"
pkgversion="1.80.0"
homepage="https://code.visualstudio.com/"
description="lightweight but powerful source code editor"
project=("project: vscode-insiders")
maintainer="Diegiwg <diegiwg@gmail.com>"

case "${CARCH}" in
  amd64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgversion}-1688968302_amd64.deb"
    hash="db8c503f9b5ca2dd8d6caa732b9b2046f18cd38493530528e63a4e7a2d1c1fc6"
    ;;
  arm64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgversion}-1688968285_arm64.deb"
    hash="425bbedd2983657baefdb09a72ac12af2b319e189f5a83b300bdcf98e87ea5f6"
    ;;
  armhf)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${pkgversion}-1688967628_armhf.deb"
    hash="e63007c12fb4bfc8e87b4038a1ddb33f752e4ecd1ad6cf46ac00e9c88de2bfec"
    ;;
  *) return 1 ;;
esac
