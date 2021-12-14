#!/bin/bash
sudo apt update
sudo apt install wget docker.io
docker pull ghcr.io/pacstall/pacstall:latest
for changed_file in ${{ steps.files.outputs.added_modified }}; do
  if [[ ${changed_file} == *".pacscript" ]]; then
    pacscript_file=$(basename "${changed_file}")
    package_name="${pacscript_file/.pacscript/ }"
    package_dir=$(dirname "${changed_file}")
    echo "pacstall -Il ${package_name}"
    cd "${package_dir}" || exit 1
    echo "pacstall -PU pacstall develop" | tee -a /tmp/docker.sh
    echo "echo $(cat "${package_name}".pacscript) > ${package_name}.pacscript" | tee -a /tmp/docker.sh > /dev/null
    echo "pacstall -PIl ${package_name}" | tee -a /tmp/docker.sh > /dev/null

    docker container run -i pacstall:latest /bin/bash -s < /tmp/docker.sh
  fi
done
# vim:set ts=2 sw=2 et:
