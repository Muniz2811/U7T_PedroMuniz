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

# Include any dependencies generated for this target.
include pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/compiler_depend.make

# Include the progress variables for this target.
include pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/progress.make

# Include the compile flags for this target's objects.
include pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/flags.make

pico-sdk/src/rp2040/boot_stage2/bs2_default_padded_checksummed.S: pico-sdk/src/rp2040/boot_stage2/bs2_default.bin
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Generating bs2_default_padded_checksummed.S"
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2 && /usr/bin/python3 /home/pedro/Downloads/BitDogLab-C/pico-sdk/src/rp2040/boot_stage2/pad_checksum -s 0xffffffff /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2/bs2_default.bin /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2/bs2_default_padded_checksummed.S

pico-sdk/src/rp2040/boot_stage2/bs2_default.bin: pico-sdk/src/rp2040/boot_stage2/bs2_default.elf
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --blue --bold --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Generating bs2_default.bin"
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2 && /usr/bin/arm-none-eabi-objcopy -Obinary /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2/bs2_default.elf /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2/bs2_default.bin

pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.o: pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/flags.make
pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.o: pico-sdk/src/rp2040/boot_stage2/bs2_default_padded_checksummed.S
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green --progress-dir=/home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building ASM object pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.o"
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2 && /usr/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -o CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.o   -c /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2/bs2_default_padded_checksummed.S

pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Preprocessing ASM source to CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.i"
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2 && /usr/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -E /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2/bs2_default_padded_checksummed.S > CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.i

pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color "--switch=$(COLOR)" --green "Compiling ASM source to assembly CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.s"
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2 && /usr/bin/arm-none-eabi-gcc $(ASM_DEFINES) $(ASM_INCLUDES) $(ASM_FLAGS) -S /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2/bs2_default_padded_checksummed.S -o CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.s

bs2_default_library: pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/bs2_default_padded_checksummed.S.o
bs2_default_library: pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/build.make
.PHONY : bs2_default_library

# Rule to build all files generated by this target.
pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/build: bs2_default_library
.PHONY : pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/build

pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/clean:
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2 && $(CMAKE_COMMAND) -P CMakeFiles/bs2_default_library.dir/cmake_clean.cmake
.PHONY : pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/clean

pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/depend: pico-sdk/src/rp2040/boot_stage2/bs2_default.bin
pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/depend: pico-sdk/src/rp2040/boot_stage2/bs2_default_padded_checksummed.S
	cd /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/pedro/Downloads/BitDogLab-C/sistema_seguranca /home/pedro/Downloads/BitDogLab-C/pico-sdk/src/rp2040/boot_stage2 /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2 /home/pedro/Downloads/BitDogLab-C/sistema_seguranca/build/pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/DependInfo.cmake "--color=$(COLOR)"
.PHONY : pico-sdk/src/rp2040/boot_stage2/CMakeFiles/bs2_default_library.dir/depend

