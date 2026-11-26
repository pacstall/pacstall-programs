pkgname="vscode-deb"
arch=("amd64" "arm64" "armhf")
gives="code"
pkgver="1.148.0"
url='https://code.visualstudio.com/'
pkgdesc="lightweight but powerful source code editor"
repology=("project: vscode")
makedepends=("gpg")
maintainer=("Tobias Heinlein <niontrix@mailbox.org>" "Diegiwg <diegiwg@gmail.com>")

source_amd64=("vscode-amd64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-x64/stable")
source_arm64=("vscode-arm64.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-arm64/stable")
source_armhf=("vscode-armhf.deb::https://update.code.visualstudio.com/${pkgver}/linux-deb-armhf/stable")
sha256sums_amd64=("da33c10565e17b83f93508a365222f31bba116ab5c9e7bef7f562783943fd513")
sha256sums_arm64=("e5615144459c865cf5689ac1cd11ed5507532c64aace93ab8eb2c185a2565f18")
sha256sums_armhf=("549192dc9297c9d94c15bfcc5abff4ff278d4a737ee2f062a6cfdc1e0730859a")
