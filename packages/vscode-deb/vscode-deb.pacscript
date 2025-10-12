pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.105.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1759933565_amd64.deb")
sha256sums_amd64=("da3676be6826dcbaab1d054b546311971e121ed6645ffd054409eeaf42675d7e")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1759933569_arm64.deb")
sha256sums_arm64=("4fdbbe128ed43a7e0feef4310ec133ae3fab50e6bdd52f402b2ada29e3a863bb")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/code/code_${pkgver}-1759933556_armhf.deb")
sha256sums_armhf=("d3864c639cbb4bef3eab202f86b42139f36159b5a4538abd97f912d1cd7c841b")
