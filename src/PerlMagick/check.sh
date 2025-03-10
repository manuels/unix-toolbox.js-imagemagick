#!/bin/sh
#  Copyright 1999-2013 ImageMagick Studio LLC, a non-profit organization
#  dedicated to making software imaging solutions freely available.
#
#  You may not use this file except in compliance with the License.  You may
#  obtain a copy of the License at
#
#    http://www.imagemagick.org/script/license.php
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
# 
#  Copyright (C) 2003 - 2009 GraphicsMagick Group
#
#  Check script for building PerlMagick.

echo "LD_LIBRARY_PATH='${LD_LIBRARY_PATH}'"
echo "MAGICK_CODER_MODULE_PATH='${MAGICK_CODER_MODULE_PATH}'"
echo "MAGICK_CONFIGURE_PATH='${MAGICK_CONFIGURE_PATH}'"
echo "MAGICK_FILTER_MODULE_PATH='${MAGICK_FILTER_MODULE_PATH}'"
echo "MAKE='${MAKE}'"
echo "MAKEFLAGS='${MAKEFLAGS}'"
echo "MEMCHECK='${MEMCHECK}'"
echo "PATH='${PATH}'"
echo "SRCDIR='${SRCDIR}'"
echo "srcdir='${srcdir}'"

set -x

SRCDIR=`dirname $0`
SRCDIR=`cd $SRCDIR && pwd`
TOPSRCDIR=`cd $srcdir && pwd`

cd PerlMagick || exit 1

if test -z "${MAKE}" ; then
  MAKE=make
fi

if test -x PerlMagick -a -f Makefile.aperl ; then
  # Static build test incantation
  ${MAKE} -f Makefile.aperl CC='/home/manuel/lib/emscripten/emcc' TEST_VERBOSE=1 test
elif test -f Makefile -a -f Magick.o; then
  # Shared build test incantation
  ${MAKE} CC='/home/manuel/lib/emscripten/emcc' TEST_VERBOSE=1 test
else
  echo 'PerlMagick has not been built!'
  exit 1
fi
