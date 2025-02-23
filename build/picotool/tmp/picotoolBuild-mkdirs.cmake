# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-src"
  "/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-build"
  "/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps"
  "/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/tmp"
  "/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp"
  "/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src"
  "/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp${cfgdir}") # cfgdir has leading slash
endif()
