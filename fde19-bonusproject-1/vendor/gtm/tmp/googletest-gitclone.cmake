
if(NOT "/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest-stamp/googletest-gitinfo.txt" IS_NEWER_THAN "/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest-stamp/googletest-gitclone-lastrun.txt")
  message(STATUS "Avoiding repeated git clone, stamp file is up to date: '/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest-stamp/googletest-gitclone-lastrun.txt'")
  return()
endif()

execute_process(
  COMMAND ${CMAKE_COMMAND} -E remove_directory "/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to remove directory: '/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest'")
endif()

# try the clone 3 times in case there is an odd git clone issue
set(error_code 1)
set(number_of_tries 0)
while(error_code AND number_of_tries LESS 3)
  execute_process(
    COMMAND "/usr/bin/git"  clone  "https://github.com/google/googletest.git" "googletest"
    WORKING_DIRECTORY "/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src"
    RESULT_VARIABLE error_code
    )
  math(EXPR number_of_tries "${number_of_tries} + 1")
endwhile()
if(number_of_tries GREATER 1)
  message(STATUS "Had to git clone more than once:
          ${number_of_tries} times.")
endif()
if(error_code)
  message(FATAL_ERROR "Failed to clone repository: 'https://github.com/google/googletest.git'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  checkout release-1.8.0 --
  WORKING_DIRECTORY "/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to checkout tag: 'release-1.8.0'")
endif()

execute_process(
  COMMAND "/usr/bin/git"  submodule update --recursive --init 
  WORKING_DIRECTORY "/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to update submodules in: '/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest'")
endif()

# Complete success, update the script-last-run stamp file:
#
execute_process(
  COMMAND ${CMAKE_COMMAND} -E copy
    "/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest-stamp/googletest-gitinfo.txt"
    "/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest-stamp/googletest-gitclone-lastrun.txt"
  RESULT_VARIABLE error_code
  )
if(error_code)
  message(FATAL_ERROR "Failed to copy script-last-run stamp file: '/Users/andre/Documents/fde19-bonusproject-1/vendor/gtm/src/googletest-stamp/googletest-gitclone-lastrun.txt'")
endif()

