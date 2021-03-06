#!/bin/bash

set -ex

# delete fuel docker image with this version
docker images | awk '/fuel-7.0/ { print $3; }' | xargs --no-run-if-empty docker rmi -f

# load new images
echo "Uploading deb-build image"
curl -sSf "${JENKINS_URL}/job/devops.7.0.fuel-library.create_docker_env/lastSuccessfulBuild/artifact/artifacts/fuel-7.0-debbuild_env.tar.xz" | docker load

echo "Uploading rpm-build image"
curl -sSf "${JENKINS_URL}/job/devops.7.0.fuel-library.create_docker_env/lastSuccessfulBuild/artifact/artifacts/fuel-7.0-rpmbuild_env.tar.xz" | docker load
