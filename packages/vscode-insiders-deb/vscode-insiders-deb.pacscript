name="vscode-insiders-deb"
arch=("amd64" "arm64" "armhf")
gives="code-insiders"
version="1.80.0"
homepage="https://code.visualstudio.com/"
description="lightweight but powerful source code editor"
project=("project: vscode-insiders")
maintainer="Diegiwg <diegiwg@gmail.com>"

case "${CARCH}" in
  amd64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_${version}-1686808276_amd64.deb"
    hash="59de6c1ebd99db65639acbf47da59e94a156cd7b5ae5abd960a3d932593c16dd"
    ;;
  arm64)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_1.80.0-1686808335_arm64.deb"
    hash="7d9f52f5072b37427d3e4df3d74157522b953dba48688a51a9466da1c2669db6"
    ;;
  armhf)
    url="https://packages.microsoft.com/repos/code/pool/main/c/code-insiders/code-insiders_1.80.0-1686807634_armhf.deb"
    hash="7e4245a22f8d528654ffc368bee1648f5e49b39f87c58a4037e70a622b83ae1b"
    ;;
  *) return 1 ;;
esac
