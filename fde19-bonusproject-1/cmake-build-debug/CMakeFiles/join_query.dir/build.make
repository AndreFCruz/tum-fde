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
CMAKE_SOURCE_DIR = /Users/andre/Documents/fde19-bonusproject-1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/join_query.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/join_query.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/join_query.dir/flags.make

CMakeFiles/join_query.dir/src/JoinQuery.cpp.o: CMakeFiles/join_query.dir/flags.make
CMakeFiles/join_query.dir/src/JoinQuery.cpp.o: ../src/JoinQuery.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/join_query.dir/src/JoinQuery.cpp.o"
	/usr/bin/g++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/join_query.dir/src/JoinQuery.cpp.o -c /Users/andre/Documents/fde19-bonusproject-1/src/JoinQuery.cpp

CMakeFiles/join_query.dir/src/JoinQuery.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/join_query.dir/src/JoinQuery.cpp.i"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /Users/andre/Documents/fde19-bonusproject-1/src/JoinQuery.cpp > CMakeFiles/join_query.dir/src/JoinQuery.cpp.i

CMakeFiles/join_query.dir/src/JoinQuery.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/join_query.dir/src/JoinQuery.cpp.s"
	/usr/bin/g++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /Users/andre/Documents/fde19-bonusproject-1/src/JoinQuery.cpp -o CMakeFiles/join_query.dir/src/JoinQuery.cpp.s

# Object files for target join_query
join_query_OBJECTS = \
"CMakeFiles/join_query.dir/src/JoinQuery.cpp.o"

# External object files for target join_query
join_query_EXTERNAL_OBJECTS =

libjoin_query.a: CMakeFiles/join_query.dir/src/JoinQuery.cpp.o
libjoin_query.a: CMakeFiles/join_query.dir/build.make
libjoin_query.a: CMakeFiles/join_query.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX static library libjoin_query.a"
	$(CMAKE_COMMAND) -P CMakeFiles/join_query.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/join_query.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/join_query.dir/build: libjoin_query.a

.PHONY : CMakeFiles/join_query.dir/build

CMakeFiles/join_query.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/join_query.dir/cmake_clean.cmake
.PHONY : CMakeFiles/join_query.dir/clean

CMakeFiles/join_query.dir/depend:
	cd /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /Users/andre/Documents/fde19-bonusproject-1 /Users/andre/Documents/fde19-bonusproject-1 /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug /Users/andre/Documents/fde19-bonusproject-1/cmake-build-debug/CMakeFiles/join_query.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/join_query.dir/depend

