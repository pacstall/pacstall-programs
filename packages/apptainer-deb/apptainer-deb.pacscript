pkgname="apptainer-deb"
gives="apptainer"
pkgver="1.5.2"
source=("https://github.com/apptainer/apptainer/releases/download/v${pkgver}/apptainer_${pkgver}_amd64.deb")
pkgdesc='container platform focused on supporting "Mobility of Compute" formerly known as Singularity'
sha256sums=("b5ea4ddbb7db2bfd396b4e64adaedb75d990fc7efd851189472899a1bd521d89")
arch=('amd64')
repology=("project: ${gives}")
