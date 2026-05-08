pkgname="apptainer-deb"
gives="apptainer"
pkgver="1.4.5"
source=("https://github.com/apptainer/apptainer/releases/download/v${pkgver}/apptainer_${pkgver}_amd64.deb")
pkgdesc='container platform focused on supporting "Mobility of Compute" formerly known as Singularity'
sha256sums=("70f19af846501acfbc2e42e7cfeee9ee11ddbbfa1c3502d0d99cde34e8e0af05")
arch=('amd64')
repology=("project: ${gives}")
