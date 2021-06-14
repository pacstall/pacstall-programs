name="packagetest1"
version="1.0"
url="https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-zip-file.zip"
pacdeps=("packagetest2")
maintainer="test package"
prepare() {
  echo "test"
}

build() {
  echo "test"
}

install() {
  sudo mkdir -p /usr/src/pacstall/"$name"/tmp
  echo test | sudo tee /usr/src/pacstall/"$name"/tmp/test
}
