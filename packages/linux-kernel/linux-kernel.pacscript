name="linux-kernel"
version="6.0"
url="https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-zip-file.zip"
pacdeps=("linux-headers-deb" "linux-headers-generic-deb" "linux-modules-deb" "linux-image-unsigned-deb")
description="Provides the latest Linux kernel via the Ubuntu mainline repositories"
maintainer="Chadano <chadano@llamawebdesign.co.uk>"

prepare() {
  true
}

build() {
  true
}

install() {
  true
}
