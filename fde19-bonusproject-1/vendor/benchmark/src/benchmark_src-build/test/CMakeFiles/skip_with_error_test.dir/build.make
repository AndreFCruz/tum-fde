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
CMAKE_SOURCE_DIR = /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build

# Include any dependencies generated for this target.
include test/CMakeFiles/skip_with_error_test.dir/depend.make

# Include the progress variables for this target.
include test/CMakeFiles/skip_with_error_test.dir/progress.make

# Include the compile flags for this target's objects.
include test/CMakeFiles/skip_with_error_test.dir/flags.make

test/CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.o: test/CMakeFiles/skip_with_error_test.dir/flags.make
test/CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.o: /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src/test/skip_with_error_test.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object test/CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.o"
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build/test && /usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.o -c /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src/test/skip_with_error_test.cc

test/CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.i"
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build/test && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src/test/skip_with_error_test.cc > CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.i

test/CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.s"
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build/test && /usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src/test/skip_with_error_test.cc -o CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.s

# Object files for target skip_with_error_test
skip_with_error_test_OBJECTS = \
"CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.o"

# External object files for target skip_with_error_test
skip_with_error_test_EXTERNAL_OBJECTS =

test/skip_with_error_test: test/CMakeFiles/skip_with_error_test.dir/skip_with_error_test.cc.o
test/skip_with_error_test: test/CMakeFiles/skip_with_error_test.dir/build.make
test/skip_with_error_test: src/libbenchmark.a
test/skip_with_error_test: test/CMakeFiles/skip_with_error_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable skip_with_error_test"
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build/test && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/skip_with_error_test.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
test/CMakeFiles/skip_with_error_test.dir/build: test/skip_with_error_test

.PHONY : test/CMakeFiles/skip_with_error_test.dir/build

test/CMakeFiles/skip_with_error_test.dir/clean:
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build/test && $(CMAKE_COMMAND) -P CMakeFiles/skip_with_error_test.dir/cmake_clean.cmake
.PHONY : test/CMakeFiles/skip_with_error_test.dir/clean

test/CMakeFiles/skip_with_error_test.dir/depend:
	cd /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src/test /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build/test /Users/andre/Documents/fde19-bonusproject-1/vendor/benchmark/src/benchmark_src-build/test/CMakeFiles/skip_with_error_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : test/CMakeFiles/skip_with_error_test.dir/depend

