#!/usr/bin/env bash

set -x
set -e

cp -r ocean landice visualization mesh_tools conda_package

cd conda_package
${PYTHON} -m pip install . --no-deps -vv

# build and install sea ice partitioning tool
cd ${SRC_DIR}/conda_package/mesh_tools/seaice_grid_tools
mkdir build
cd build
cmake \
  -D CMAKE_INSTALL_PREFIX=${PREFIX} \
  -D CMAKE_BUILD_TYPE=Release \
  ..
cmake --build .
cmake --install .

# build and install mesh conversion tools
cd ${SRC_DIR}/conda_package/mesh_tools/mesh_conversion_tools
mkdir build
cd build
cmake \
  -D CMAKE_INSTALL_PREFIX=${PREFIX} \
  -D CMAKE_BUILD_TYPE=Release \
  ..
cmake --build .
cmake --install .

