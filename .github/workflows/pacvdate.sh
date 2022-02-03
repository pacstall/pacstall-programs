#!/bin/bash

export OUTFILE="$PWD/report"

bail_out() {
	printf '%s\n' "BAILING OUT: ${1}"
	exit "${2}"
}

report() {
	printf '%s\n' "REPORT: $*"
}

warn() {
	printf '%s\n' "WARN: $*"
}

gen_report() {
	column "${1:-$OUTFILE}" -t -s'|' | ( sed -u 1q; sort -k 2 )
}

write_results() {
	printf '%s\n' "${1}|${2}" | tee -a "${3}" >/dev/null
}

get_output() {
	local output="$(grep "${1}" "${2:-$OUTFILE}")"
	if [[ "$(wc -l <<< "${output}")" -gt "1" ]]; then
		bail_out "More than one line found when"
	else
		printf '%s\n' "${output#*|}"
	fi
}

banner() {
	printf '%s\n' "=========${*}========="
}

critical_keys=('name' 'version' 'url')
keys=('pkgname' 'build_depends' 'depends' 'breaks' 'replace' 'gives' 'description' 'hash' 'maintainer')
arrays=('optdepends' 'ppa' 'pacdeps' 'patch')
functions=('pkgver' 'prepare' 'build' 'install' 'removescript')

INPUT="${1:?Missing input file}"

source -- "${INPUT}" || { bail_out "Input file missing" "1"; }

rm -f "${OUTFILE:?}"
rm -rf "download/"
rm -f "misc_reports"

printf '%s\n' "VARIABLE|STATUS|USAGE" | tee -a "${OUTFILE}" >/dev/null

for i in "${critical_keys[@]}"; do
	if [[ ! -v "${i}" ]]; then
		write_results "${i}" "FAILURE|CRITICAL" "${OUTFILE}"
	else
		write_results "${i}" "SUCCESS|CRITICAL" "${OUTFILE}"
	fi
done

for i in "${keys[@]}"; do
	if [[ ! -v "${i}" ]]; then
		write_results "${i}" "FAILURE|NOTCRITICAL" "${OUTFILE}"
	else
		write_results "${i}" "SUCCESS|NOTCRITICAL" "${OUTFILE}"
	fi
done

for i in "${functions[@]}"; do
	if [[ "$(type -t "${i}")" == "function" ]]; then
		write_results "${i}" "SUCCESS|NOTCRITICAL" "${OUTFILE}"
	else
		write_results "${i}" "FAILURE|NOTCRITICAL" "${OUTFILE}"
	fi
done

for i in "${arrays[@]}"; do
	if [[ ! -v "${i}" ]]; then
		write_results "${i}" "FAILURE|NOTCRITICAL" "${OUTFILE}"
	else
		write_results "${i}" "SUCCESS|NOTCRITICAL" "${OUTFILE}"
	fi
done

# check for critical variables

declare -i error_sum

for i in {name,version,url}; do
	if [[ ! -v "${i}" ]]; then
		error_sum+=1
	fi
done

if [[ "${error_sum}" -gt 0 ]]; then
	report "Critical variables (name, version, url) do not exist!!"
fi
unset error_sum

mkdir -p download
if [[ "${url##*.}" == "git" ]]; then
	if ! git clone -q --depth=1 "${url}" download/; then
		write_results "download" "FAILURE|CRITICAL" "misc_reports"
	else
		write_results "download" "SUCCESS|CRITICAL" "misc_reports"
	fi
elif ! wget -q "${url}" -P download/; then
	write_results "download" "FAILURE|CRITICAL" "misc_reports"
else
	write_results "download" "SUCCESS|CRITICAL" "misc_reports"
fi

# hash checking
if [[ "$(get_output "download" "misc_reports" | cut -d'|' -f1)" == "SUCCESS" ]]; then
	# check if hash exists, and if so, check against download, and if not, leave as is
	if [[ -z "${hash}" ]]; then
		write_results "hash" "NOTFOUND|NOTCRITICAL" "misc_reports"
	else
		if [[ "$(sha256sum -- download/* | cut -d' ' -f1)" == "${hash}" ]]; then
			write_results "hash" "SUCCESS|CRITICAL" "misc_reports"
		else
			write_results "hash" "FAILURE|CRITICAL" "misc_reports"
		fi
	fi
else
	write_results "hash" "NOTNEEDED|NOTCRITICAL" "misc_reports"
fi
rm -rf download/

if [[ "$(type -t pkgver)" == "function" ]]; then
	if [[ "$(pkgver | wc -l)" -gt 1 ]]; then
		write_results "pkgver" "FAILURE|MULTIPLEHEADS" "misc_reports"
	else
		write_results "pkgver" "SUCCESS|CRITICAL" "misc_reports"
	fi
fi
banner "Variable/array/function checking"
gen_report
banner "Misc reports"
gen_report "misc_reports"
