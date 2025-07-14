gives="keyd"
pkgname="${gives}-deb"
pkgver="2.5.0-4"
pkgdesc='Keyboard key remapping daemon'
arch=('amd64' 'arm64' 'armhf' 'i386' 'riscv64')
source=("http://ftp.debian.org/debian/pool/main/k/${gives}/${gives}_${pkgver}_${CARCH}.deb")
sha256sums_amd64=("1026a168630c8e00ef0356b7e15bc298de2ba535228c1b05772f7c55828b61a1")
sha256sums_arm64=("406f18b2103680fbe34a1e35b1e60794560c28fe206091fb7ae5cec8e4ccb6bd")
sha256sums_armhf=("f0e9974d4866c470c3a00befd8494baf70b09282a8de8c9098e09408147c98fa")
sha256sums_i386=("933b4ffaf3efd23619826e149ccfea1984929dbc7276efabb5863e03e0157b4a")
sha256sums_riscv64=("1840aee6074fde916c8bc11fae021e7aac32253f3da6ba8fc709308290b73414")
depends=('libc6>=2.34')
repology=("project: ${gives}")
maintainer=("Oren Klopfer <oren@taumoda.com>")
