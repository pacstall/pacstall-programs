pkgname="apptainer-deb"
gives="apptainer"
pkgver="1.3.6"
source=("https://github.com/apptainer/apptainer/releases/download/v${pkgver}/apptainer_${pkgver}_amd64.deb")
pkgdesc='container platform focused on supporting "Mobility of Compute" formerly known as Singularity'
sha256sums=("2723b2928cfc30edf687723c49556ec4e013f0bf7cdb43a5a76bca7bd3c70792")
arch=('amd64')
repology=("project: ${gives}")
