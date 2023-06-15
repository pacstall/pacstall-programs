#!/bin/sh

version="$1"

# check if version is provided
if [ -z "${version}" ]; then
  echo "Usage: $0 <version> [install]"
  exit 1
fi

url="https://github.com/Diegiwg/PrismLauncher-Cracked/releases/download/${version}/PrismLauncher-Linux-develop.tar.gz"

# download the latest version of prismlaucher
if ! wget "${url}" -o /dev/null; then
  echo "Failed to download prismlaucher"
  exit 1
fi

# extract the latest version of prismlaucher
tar -xzf PrismLauncher-Linux-develop.tar.gz

make_install_command() {
  data="$1"
  echo "sudo install -Dm644 \".${data}\" \"\${pkgdir}${data}\""
}

make_pacscript() {
  hash=$(sha256sum PrismLauncher-Linux-develop.tar.gz | cut -d' ' -f 1)

  echo name=\"prismlauncher-cracked-bin\" > prismlauncher-cracked-bin.pacscript

  {
    echo 'gives="prismlauncher"'
    echo 'version="'"${version}""\""
    echo 'homepage="https://github.com/Diegiwg/PrismLauncher-Cracked/"'
    echo "description=\"This project is a Fork of Prism Launcher, which aims to 'unblock' the use of Offline Accounts, disabling the restriction of having a functional Online Account. No other modifications were applied to the project's source code\""
    echo 'maintainer="Diegiwg <diegiwg@gmail.com>"'
    echo "url=\"https://github.com/Diegiwg/PrismLauncher-Cracked/releases/download/${version}/PrismLauncher-Linux-develop.tar.gz\""
    echo 'hash="'"${hash}""\""
    echo
    echo prepare\(\) \{
    echo "  chmod +x ./bin/prismlauncher"
    echo \}
    echo
    echo install\(\) \{
  } >> prismlauncher-cracked-bin.pacscript

  # gen install command's
  find ./share | cut -c2- | grep '[.]' | while read -r data; do
    echo "  $(make_install_command "${data}")" >> prismlauncher-cracked-bin.pacscript
  done

  {
    echo
    echo "  sudo install -Dm755 \"./bin/prismlauncher\" \"\$\{pkgdir\}/usr/bin/prismlauncher\""
    echo \}
  } >> prismlauncher-cracked-bin.pacscript
}

make_pacscript

# remove the latest version of prismlaucher
rm PrismLauncher-Linux-develop.tar.gz

# delete bin and share folder
rm -r ./bin
rm -r ./share

# finally, maybe install package
install="$2"
if [ -n "${install}" ]; then
  if [ "${install}" = "install" ]; then
    pacstall -I ./prismlauncher-cracked-bin.pacscript
    clear
    echo "Updated prismlaucher to version ${version}"
  else
    echo "Usage: $0 <version> install"
  fi
else
  echo "Updated prismlaucher script to version ${version}"
  echo "For auto installation, use: $0 <version> install"
fi
