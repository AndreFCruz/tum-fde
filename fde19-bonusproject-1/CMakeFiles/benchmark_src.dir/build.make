# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.15

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/local/Cellar/cmake/3.15.5/bin/cmake

# The command to remove a file.
RM = /usr/local/Cellar/cmake/3.15.5/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/andre/Documents/fde19-bonusproject-1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/andre/Documents/fde19-bonusproject-1

# Utility rule file for benchmark_src.

# Include the progress variables for this target.
include CMakeFiles/benchmark_src.dir/progress.make

CMakeFiles/benchmark_src: CMakeFiles/benchmark_src-complete


CMakeFiles/benchmark_src-complete: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-install
CMakeFiles/benchmark_src-complete: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-mkdir
CMakeFiles/benchmark_src-complete: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-download
CMakeFiles/benchmark_src-complete: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-update
CMakeFiles/benchmark_src-complete: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-patch
CMakeFiles/benchmark_src-complete: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-configure
CMakeFiles/benchmark_src-complete: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-build
CMakeFiles/benchmark_src-complete: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'benchmark_src'"
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E make_directory /Users/andre/Documents/fde19-bonusproject-1/CMakeFiles
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E touch /Users/andre/Documents/fde19-bonusproject-1/CMakeFiles/benchmark_src-complete
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E touch /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp/benchmark_src-done

vendor/benchmark/src/benchmark_src-stamp/benchmark_src-install: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Performing install step for 'benchmark_src'"
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build && $(MAKE) install
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build && /usr/local/Cellar/cmake/3.15.5/bin/cmake -E touch /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp/benchmark_src-install

vendor/benchmark/src/benchmark_src-stamp/benchmark_src-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'benchmark_src'"
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E make_directory /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E make_directory /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E make_directory /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E make_directory /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/tmp
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E make_directory /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E make_directory /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E make_directory /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E touch /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp/benchmark_src-mkdir

vendor/benchmark/src/benchmark_src-stamp/benchmark_src-download: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-gitinfo.txt
vendor/benchmark/src/benchmark_src-stamp/benchmark_src-download: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Performing download step (git clone) for 'benchmark_src'"
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src && /usr/local/Cellar/cmake/3.15.5/bin/cmake -P /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/tmp/benchmark_src-gitclone.cmake
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src && /usr/local/Cellar/cmake/3.15.5/bin/cmake -E touch /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp/benchmark_src-download

vendor/benchmark/src/benchmark_src-stamp/benchmark_src-update: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'benchmark_src'"
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src && /usr/local/Cellar/cmake/3.15.5/bin/cmake -E echo_append
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src && /usr/local/Cellar/cmake/3.15.5/bin/cmake -E touch /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp/benchmark_src-update

vendor/benchmark/src/benchmark_src-stamp/benchmark_src-patch: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'benchmark_src'"
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E echo_append
	/usr/local/Cellar/cmake/3.15.5/bin/cmake -E touch /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp/benchmark_src-patch

vendor/benchmark/src/benchmark_src-stamp/benchmark_src-configure: vendor/benchmark/tmp/benchmark_src-cfgcmd.txt
vendor/benchmark/src/benchmark_src-stamp/benchmark_src-configure: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-update
vendor/benchmark/src/benchmark_src-stamp/benchmark_src-configure: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'benchmark_src'"
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build && /usr/local/Cellar/cmake/3.15.5/bin/cmake -DCMAKE_INSTALL_PREFIX=/Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark -DCMAKE_C_COMPILER=/usr/bin/gcc -DCMAKE_CXX_COMPILER=/usr/bin/g++ -DCMAKE_CXX_FLAGS= -DCMAKE_BUILD_TYPE:STRING=Debug "-GUnix Makefiles" /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build && /usr/local/Cellar/cmake/3.15.5/bin/cmake -E touch /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp/benchmark_src-configure

vendor/benchmark/src/benchmark_src-stamp/benchmark_src-build: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'benchmark_src'"
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build && $(MAKE)
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build && /usr/local/Cellar/cmake/3.15.5/bin/cmake -E touch /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-stamp/benchmark_src-build

benchmark_src: CMakeFiles/benchmark_src
benchmark_src: CMakeFiles/benchmark_src-complete
benchmark_src: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-install
benchmark_src: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-mkdir
benchmark_src: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-download
benchmark_src: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-update
benchmark_src: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-patch
benchmark_src: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-configure
benchmark_src: vendor/benchmark/src/benchmark_src-stamp/benchmark_src-build
benchmark_src: CMakeFiles/benchmark_src.dir/build.make

.PHONY : benchmark_src

# Rule to build all files generated by this target.
CMakeFiles/benchmark_src.dir/build: benchmark_src

.PHONY : CMakeFiles/benchmark_src.dir/build

CMakeFiles/benchmark_src.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/benchmark_src.dir/cmake_clean.cmake
.PHONY : CMakeFiles/benchmark_src.dir/clean

CMakeFiles/benchmark_src.dir/depend:
	cd /Users/andre/Documents/fde19-bonusproject-1 && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andre/Documents/fde19-bonusproject-1 /Users/andre/Documents/fde19-bonusproject-1 /Users/andre/Documents/fde19-bonusproject-1 /Users/andre/Documents/fde19-bonusproject-1 /Users/andre/Documents/fde19-bonusproject-1/CMakeFiles/benchmark_src.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/benchmark_src.dir/depend

