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
CMAKE_COMMAND = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake

# The command to remove a file.
RM = /Applications/CLion.app/Contents/bin/cmake/mac/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build

# Include any dependencies generated for this target.
include test/CMakeFiles/fixture_test.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/fixture_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/fixture_test.dir/flags.make

test/CMakeFiles/fixture_test.dir/fixture_test.cc.o: test/CMakeFiles/fixture_test.dir/flags.make
test/CMakeFiles/fixture_test.dir/fixture_test.cc.o: /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test/fixture_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/fixture_test.dir/fixture_test.cc.o"
	cd /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/fixture_test.dir/fixture_test.cc.o -c /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test/fixture_test.cc

test/CMakeFiles/fixture_test.dir/fixture_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/fixture_test.dir/fixture_test.cc.i"
	cd /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test/fixture_test.cc > CMakeFiles/fixture_test.dir/fixture_test.cc.i

test/CMakeFiles/fixture_test.dir/fixture_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/fixture_test.dir/fixture_test.cc.s"
	cd /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test/fixture_test.cc -o CMakeFiles/fixture_test.dir/fixture_test.cc.s

# Object files for target fixture_test
fixture_test_OBJECTS = \
"CMakeFiles/fixture_test.dir/fixture_test.cc.o"

# External object files for target fixture_test
fixture_test_EXTERNAL_OBJECTS =

test/fixture_test: test/CMakeFiles/fixture_test.dir/fixture_test.cc.o
test/fixture_test: test/CMakeFiles/fixture_test.dir/build.make
test/fixture_test: src/libbenchmark.a
test/fixture_test: test/CMakeFiles/fixture_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable fixture_test"
	cd /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/fixture_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/fixture_test.dir/build: test/fixture_test

.PHONY : test/CMakeFiles/fixture_test.dir/build

test/CMakeFiles/fixture_test.dir/clean:
	cd /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test && $(CMAKE_COMMAND) -P CMakeFiles/fixture_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/fixture_test.dir/clean

test/CMakeFiles/fixture_test.dir/depend:
	cd /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src/test /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/vendor/benchmark/src/benchmark_src-build/test/CMakeFiles/fixture_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/fixture_test.dir/depend

