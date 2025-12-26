pkgname="apptainer-deb"
gives="apptainer"
pkgver="1.4.1"
source=("https://github.com/apptainer/apptainer/releases/download/v${pkgver}/apptainer_${pkgver}_amd64.deb")
pkgdesc='container platform focused on supporting "Mobility of Compute" formerly known as Singularity'
sha256sums=("9a0663f6e680d270dd3675f94cabf35dc324bb8673f5c6b645005e5aa1bd6d88")
arch=('amd64')
repology=("project: ${gives}")
