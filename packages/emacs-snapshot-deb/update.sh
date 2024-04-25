#!/usr/bin/env bash
# shellcheck disable=1090
set -o pipefail

self=$(readlink -f "$0")
here=$(dirname "${self}")
root=$(dirname "${here}")
pacscript="${here}/emacs-snapshot-deb.pacscript"

tmp=$(mktemp -d)
trap 'rm -rf $tmp' EXIT

pkgs=(
  emacs-snapshot-bin-common-deb
  emacs-snapshot-common-deb
  emacs-snapshot-deb
  emacs-snapshot-el-deb
  emacs-snapshot-lucid-deb
  emacs-snapshot-nox-deb
)

latestver=$(
  curl -fsL "https://github.com/dkogan/emacs-snapshot/raw/master/debian/changelog" |
  head -1 | sed -E 's,^emacs-snapshot \([0-9]:(.+)\) .*,\1,'
)

source "${pacscript}"
echo "Latest version: ${latestver}"
echo "Current version: ${pkgver}"
if [[ ${pkgver} = "${latestver}" ]]; then
    echo Nothing to do.
    exit
fi

CARCH=amd64
pushd "${tmp}" >/dev/null
for pkg in "${pkgs[@]}"; do
  echo "Updating ${pkg}..."
  pacscript="${root}/${pkg}/${pkg}.pacscript"
  out="${pkg}.deb"
  sed -i "s,^pkgver='.*',pkgver='${latestver}'," "${pacscript}"

  (
    source "${pacscript}"
    curl -fS#L -o "${out}" "${url}"
    newhash=$(sha256sum "${out}" | awk '{print $1}')
    sed -i "s,^hash='.*',hash='${newhash}'," "${pacscript}"
  )
done
popd

echo Done.
