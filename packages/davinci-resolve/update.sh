#!/usr/bin/env bash
set -euxo pipefail

msg() {
  printf >&2 '>>> %s\n' "$@"
}

tmpdir=
# shellcheck disable=SC2317
cleanup() {
  if [[ -n ${tmpdir} && -d ${tmpdir} ]]; then
    if [[ ${PWD} == "${tmpdir}" ]]; then
      popd > /dev/null
    fi
    msg 'Cleaning up...'
    rm -rf -- "${tmpdir}"
  fi
}
trap cleanup EXIT

pkgname='davinci-resolve'
here=$(dirname "$(readlink -f "$0")")
pacscript="${here}/${pkgname}.pacscript"

releaseinfo=$(curl -fsS 'https://www.blackmagicdesign.com/api/support/latest-stable-version/davinci-resolve/linux')
pkgver_new=$(jq -r '.linux | "\(.major).\(.minor).\(.releaseNum)"' <<< "${releaseinfo}")
download_id_new=$(jq -r '.linux.downloadId' <<< "${releaseinfo}")

# shellcheck disable=SC1090
. "${pacscript}"
msg "Old pkgver: ${pkgver}" "New pkgver: ${pkgver_new}"
msg "Old download_id: ${download_id}" "New download_id: ${download_id_new}"

if [[ ${pkgver} == "${pkgver_new}" ]]; then
  msg 'Nothing to do'
  exit 0
fi

resolveurl=$(get_resolveurl)
msg "Download URL: ${resolveurl}"
msg 'Fetching Resolve...'

tmpdir=$(mktemp -d)
pushd "${tmpdir}" > /dev/null
fetch_resolve
resolve_sha256_new=$(sha256sum "${zipfile}" | awk '{print $1}')
msg "Old resolve_sha256: ${resolve_sha256}" "New resolve_sha256: ${resolve_sha256_new}"

msg 'Updating pacscript...'
sed "
  s|${pkgver@Q}|${pkgver_new@Q}|
  s|${download_id@Q}|${download_id_new@Q}|
  s|${resolve_sha256@Q}|${resolve_sha256_new@Q}|
  " -i "${pacscript}"

msg 'Done.'
exit 0
