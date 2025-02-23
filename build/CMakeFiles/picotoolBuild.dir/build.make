# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.28

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/pedro/Downloads/BitDogLab-C/sistema_seguranca

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build

# Utility rule file for picotoolBuild.

# Include any custom commands dependencies for this target.
include CMakeFiles/picotoolBuild.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/picotoolBuild.dir/progress.make

CMakeFiles/picotoolBuild: CMakeFiles/picotoolBuild-complete

CMakeFiles/picotoolBuild-complete: picotool/src/picotoolBuild-stamp/picotoolBuild-install
CMakeFiles/picotoolBuild-complete: picotool/src/picotoolBuild-stamp/picotoolBuild-mkdir
CMakeFiles/picotoolBuild-complete: picotool/src/picotoolBuild-stamp/picotoolBuild-download
CMakeFiles/picotoolBuild-complete: picotool/src/picotoolBuild-stamp/picotoolBuild-update
CMakeFiles/picotoolBuild-complete: picotool/src/picotoolBuild-stamp/picotoolBuild-patch
CMakeFiles/picotoolBuild-complete: picotool/src/picotoolBuild-stamp/picotoolBuild-configure
CMakeFiles/picotoolBuild-complete: picotool/src/picotoolBuild-stamp/picotoolBuild-build
CMakeFiles/picotoolBuild-complete: picotool/src/picotoolBuild-stamp/picotoolBuild-install
CMakeFiles/picotoolBuild-complete: picotool/src/picotoolBuild-stamp/picotoolBuild-test
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'picotoolBuild'"
	/usr/bin/cmake -E make_directory /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles
	/usr/bin/cmake -E touch /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles/picotoolBuild-complete
	/usr/bin/cmake -E touch /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp/picotoolBuild-done

picotool/src/picotoolBuild-stamp/picotoolBuild-install:
.PHONY : picotool/src/picotoolBuild-stamp/picotoolBuild-install

picotool/src/picotoolBuild-stamp/picotoolBuild-build:
.PHONY : picotool/src/picotoolBuild-stamp/picotoolBuild-build

picotool/src/picotoolBuild-stamp/picotoolBuild-install:
.PHONY : picotool/src/picotoolBuild-stamp/picotoolBuild-install

picotool/src/picotoolBuild-stamp/picotoolBuild-build: picotool/src/picotoolBuild-stamp/picotoolBuild-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing build step for 'picotoolBuild'"
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-build && $(MAKE)

picotool/src/picotoolBuild-stamp/picotoolBuild-configure: picotool/tmp/picotoolBuild-cfgcmd.txt
picotool/src/picotoolBuild-stamp/picotoolBuild-configure: picotool/src/picotoolBuild-stamp/picotoolBuild-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Performing configure step for 'picotoolBuild'"
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-build && /usr/bin/cmake --no-warn-unused-cli -DCMAKE_MAKE_PROGRAM:FILEPATH=/usr/bin/gmake -DPICO_SDK_PATH:FILEPATH=/home/pedro/Downloads/BitDogLab-C/pico-sdk -DPICOTOOL_NO_LIBUSB=1 -DPICOTOOL_FLAT_INSTALL=1 -DCMAKE_INSTALL_PREFIX=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps -DCMAKE_RULE_MESSAGES=OFF -DCMAKE_INSTALL_MESSAGE=NEVER "-GUnix Makefiles" -S /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-src -B /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-build
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-build && /usr/bin/cmake -E touch /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp/picotoolBuild-configure

picotool/src/picotoolBuild-stamp/picotoolBuild-download: picotool/src/picotoolBuild-stamp/picotoolBuild-source_dirinfo.txt
picotool/src/picotoolBuild-stamp/picotoolBuild-download: picotool/src/picotoolBuild-stamp/picotoolBuild-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'picotoolBuild'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp/picotoolBuild-download

picotool/src/picotoolBuild-stamp/picotoolBuild-install: picotool/src/picotoolBuild-stamp/picotoolBuild-build
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Performing install step for 'picotoolBuild'"
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-build && $(MAKE) install

picotool/src/picotoolBuild-stamp/picotoolBuild-build:
.PHONY : picotool/src/picotoolBuild-stamp/picotoolBuild-build

picotool/src/picotoolBuild-stamp/picotoolBuild-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Creating directories for 'picotoolBuild'"
	/usr/bin/cmake -Dcfgdir= -P /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/tmp/picotoolBuild-mkdirs.cmake
	/usr/bin/cmake -E touch /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp/picotoolBuild-mkdir

picotool/src/picotoolBuild-stamp/picotoolBuild-patch: picotool/src/picotoolBuild-stamp/picotoolBuild-patch-info.txt
picotool/src/picotoolBuild-stamp/picotoolBuild-patch: picotool/src/picotoolBuild-stamp/picotoolBuild-update
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "No patch step for 'picotoolBuild'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp/picotoolBuild-patch

picotool/src/picotoolBuild-stamp/picotoolBuild-test: picotool/src/picotoolBuild-stamp/picotoolBuild-install
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing test step for 'picotoolBuild'"
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-build && /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool/picotool version 2.1.1
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/_deps/picotool-build && /usr/bin/cmake -E touch /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp/picotoolBuild-test

picotool/src/picotoolBuild-stamp/picotoolBuild-install:
.PHONY : picotool/src/picotoolBuild-stamp/picotoolBuild-install

picotool/src/picotoolBuild-stamp/picotoolBuild-update: picotool/src/picotoolBuild-stamp/picotoolBuild-update-info.txt
picotool/src/picotoolBuild-stamp/picotoolBuild-update: picotool/src/picotoolBuild-stamp/picotoolBuild-download
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "No update step for 'picotoolBuild'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/picotool/src/picotoolBuild-stamp/picotoolBuild-update

picotoolBuild: CMakeFiles/picotoolBuild
picotoolBuild: CMakeFiles/picotoolBuild-complete
picotoolBuild: picotool/src/picotoolBuild-stamp/picotoolBuild-build
picotoolBuild: picotool/src/picotoolBuild-stamp/picotoolBuild-configure
picotoolBuild: picotool/src/picotoolBuild-stamp/picotoolBuild-download
picotoolBuild: picotool/src/picotoolBuild-stamp/picotoolBuild-install
picotoolBuild: picotool/src/picotoolBuild-stamp/picotoolBuild-mkdir
picotoolBuild: picotool/src/picotoolBuild-stamp/picotoolBuild-patch
picotoolBuild: picotool/src/picotoolBuild-stamp/picotoolBuild-test
picotoolBuild: picotool/src/picotoolBuild-stamp/picotoolBuild-update
picotoolBuild: CMakeFiles/picotoolBuild.dir/build.make
.PHONY : picotoolBuild

# Rule to build all files generated by this target.
CMakeFiles/picotoolBuild.dir/build: picotoolBuild
.PHONY : CMakeFiles/picotoolBuild.dir/build

CMakeFiles/picotoolBuild.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/picotoolBuild.dir/cmake_clean.cmake
.PHONY : CMakeFiles/picotoolBuild.dir/clean

CMakeFiles/picotoolBuild.dir/depend:
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pedro/Downloads/BitDogLab-C/sistema_seguranca /home/pedro/Downloads/BitDogLab-C/sistema_seguranca /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles/picotoolBuild.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : CMakeFiles/picotoolBuild.dir/depend

