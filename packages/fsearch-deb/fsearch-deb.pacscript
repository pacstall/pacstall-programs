name="fsearch-deb"
gives="fsearch"
repology=("project: fsearch")
version="0.2.2"
codename="$(lsb_release -cs)"
echo "Installing for ${codename}"
case "${codename}" in
  bullseye)
    url="https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_11/amd64/fsearch_${version}-1+3.2_amd64.deb"
    hash="6c9eaa57fe0d8375d762298cce4109251b91b61cc78696e48d66983d8f49067f"
    ;;
  buster)
    url="https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_10/amd64/fsearch_${version}-1+3.1_amd64.deb"
    hash="aa2bb2c672405315cacd226eaf2c76ddb46166d9321b4b01cd31fa8683834430"
    ;;
  jammy)
    url="https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_Unstable/amd64/fsearch_${version}-1+3.21_amd64.deb"
    pacdeps=("libicu71-deb")
    hash="49cd0ebbbfc33ee8bb8747ee68fcefe76056eb430bf158371f8c1df703dc420d"
    ;;
  *)
    url="https://download.opensuse.org/repositories/home:/cboxdoerfer/Debian_Unstable/amd64/fsearch_${version}-1+3.21_amd64.deb"
    hash="49cd0ebbbfc33ee8bb8747ee68fcefe76056eb430bf158371f8c1df703dc420d"
    ;;
esac
description="FSearch is a fast file search utility, inspired by Everything Search Engine"
maintainer="Zahrun <Zahrun@github.com>"
