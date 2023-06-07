name="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
version="1.78.2"

case "${CARCH}" in
  amd64)
    url="http://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1683731010_$CARCH.deb"
    hash="eeca823ab932d927a12dc85fb2f7fb011e25d8bf61bcb96e807c9add57e9ccd0"
    ;;
  arm64)
    url="http://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1683731061_$CARCH.deb"
    hash="4d7f0cc976ed1dfde1ceeaadd16829427a477eba1b49ff82dd490395f32eb78c"
    ;;
  armhf)
    url="http://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1683730415_$CARCH.deb"
    hash="4d7f0cc976ed1dfde1ceeaadd16829427a477eba1b49ff82dd490395f32eb78c"
    ;;
  *) return 1 ;;
esac

homepage="https://code.visualstudio.com/"
description="Visual Studio Code is a lightweight but powerful source code editor which runs on your desktop and is available for Windows, macOS and Linux."

project=("project: vscode")
