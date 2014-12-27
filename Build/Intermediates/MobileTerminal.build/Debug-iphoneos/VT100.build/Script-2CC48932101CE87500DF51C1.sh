#!/bin/sh
#
# When compiling for the device, copy term.h from the simulator SDK
#

if [ $PLATFORM_NAME == "iphoneos" ]
then
  # Get the path to the iphone simulator SDK for the same version
  SIMULATOR_SDK_DIR=${SDK_DIR//iPhoneOS/iPhoneSimulator}

  # Copy to a temporary directory where the build will find the needed
  # header files.  This directory may not already exist, but is passed
  # as a header search path when compiling the source files.
  mkdir -p $DERIVED_SOURCES_DIR
  cp $SIMULATOR_SDK_DIR/usr/include/ncurses_dll.h $DERIVED_SOURCES_DIR/
  cp $SIMULATOR_SDK_DIR/usr/include/term.h $DERIVED_SOURCES_DIR/

fi
