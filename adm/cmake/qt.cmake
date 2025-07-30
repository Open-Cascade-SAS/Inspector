#qt

# Add QtX option with description
set(QtX "Qt6" CACHE STRING "Qt version to use (Qt4, Qt5, or Qt6)")
set_property(CACHE QtX PROPERTY STRINGS Qt4 Qt5 Qt6)

# Validate QtX value
if(NOT QtX MATCHES "^Qt[456]$")
  message(FATAL_ERROR "QtX must be one of: Qt4, Qt5, Qt6")
endif()

# Qt is searched manually first (just determine root)
message (STATUS "Processing Qt 3-rd party")

if (${QtX} STREQUAL "Qt6")
  if (${QtX}_DIR)
    find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets Xml LinguistTools PATHS ${QtX}_DIR NO_DEFAULT_PATH)
  else ()
    find_package(Qt6 REQUIRED COMPONENTS Core Gui Widgets Xml LinguistTools)
  endif ()
elseif (${QtX} STREQUAL "Qt5")
  if (${QtX}_DIR)
    find_package(Qt5 QUIET COMPONENTS Widgets Quick Xml PATHS ${QtX}_DIR NO_DEFAULT_PATH)
  else ()
    find_package(Qt5 QUIET COMPONENTS Widgets Quick Xml)
  endif ()
elseif (${QtX} STREQUAL "Qt4")
  find_package(Qt4)
endif ()

set(3RDPARTY_QT_DIR ${QtX}_DIR)



