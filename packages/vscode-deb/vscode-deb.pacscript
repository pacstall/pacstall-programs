pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.127.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
project=("project: vscode")
makedepends=("gpg")
maintainer=("Diegiwg <diegiwg@gmail.com>")

source_amd64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1782814776_amd64.deb")
sha256sums_amd64=("0cddc13023bf713dfc4774d4f24418b53d32180bfd73f50ff960bc5cdaf56a2d")
source_arm64=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1782811064_arm64.deb")
sha256sums_arm64=("55d7fda22a4097d5a23842360264f771edd7d309f07362a6acf2ae93ba6016a5")
source_armhf=("https://packages.microsoft.com/repos/code/pool/main/c/${gives}/${gives}_${pkgver}-1782810923_armhf.deb")
sha256sums_armhf=("1eda12c69983305395d876ba911ba3c6703530c568ce22abe57312dece02ff15")
