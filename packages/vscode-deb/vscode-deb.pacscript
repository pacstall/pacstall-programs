name="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
version="1.79.1"
homepage="https://code.visualstudio.com/"
description="lightweight but powerful source code editor"
project=("project: vscode")
maintainer="Diegiwg <diegiwg@gmail.com>"

case "${CARCH}" in
  amd64)
    url="http://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1686587647_amd64.deb"
    hash="78e83ba85923600ee982092e83d48f05229b3b4f72de4e706b17a7e30dd8c926"
    ;;
  arm64)
    url="http://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1686586673_arm64.deb"
    hash="b63a3d23eb7d6d39df1aed3e46472dda9d1678d32ece1671dbdfafc41375bc34"
    ;;
  armhf)
    url="http://packages.microsoft.com/repos/code/pool/main/c/code/code_${version}-1686586634_armhf.deb"
    hash="bad1f3982ce9961f31c4094f695a17a1ef010d4821726bc073eb51a76584f3cf"
    ;;
  *) return 1 ;;
esac
