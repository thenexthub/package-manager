include(FetchContent)

find_package(CodiraSyntax CONFIG GLOBAL)
if(NOT CodiraSyntax_FOUND)
  set(SWIFT_SYNTAX_INSTALL_TARGETS YES)
  if(DEFINED SWIFTPM_PATH_TO_SWIFT_SYNTAX_SOURCE)
    file(TO_CMAKE_PATH "${SWIFTPM_PATH_TO_SWIFT_SYNTAX_SOURCE}" codira_syntax_path)
    FetchContent_Declare(CodiraSyntax
      SOURCE_DIR "${codira_syntax_path}")
  else()
    FetchContent_Declare(CodiraSyntax
      GIT_REPOSITORY https://github.com/codiralang/codira-syntax
      GIT_TAG main)
  endif()
  FetchContent_MakeAvailable(CodiraSyntax)
endif()
