UTIL_PATH=./src/utilities
ZLIB_PATH=./zlib/src
LIBPNG_PATH=./libpng/src

ZLIB=${ZLIB_PATH}/compress.o \
  ${ZLIB_PATH}/adler32.o \
  ${ZLIB_PATH}/crc32.o \
  ${ZLIB_PATH}/deflate.o \
  ${ZLIB_PATH}/gzclose.o \
  ${ZLIB_PATH}/gzlib.o \
  ${ZLIB_PATH}/gzread.o \
  ${ZLIB_PATH}/gzwrite.o \
  ${ZLIB_PATH}/infback.o \
  ${ZLIB_PATH}/inffast.o \
  ${ZLIB_PATH}/inflate.o \
  ${ZLIB_PATH}/inftrees.o \
  ${ZLIB_PATH}/trees.o \
  ${ZLIB_PATH}/uncompr.o \
  ${ZLIB_PATH}/zutil.o

LIBPNG=${LIBPNG_PATH}/libpng15_la-pngerror.o \
  ${LIBPNG_PATH}/libpng15_la-pngget.o \
  ${LIBPNG_PATH}/libpng15_la-pngmem.o \
  ${LIBPNG_PATH}/libpng15_la-png.o \
  ${LIBPNG_PATH}/libpng15_la-pngpread.o \
  ${LIBPNG_PATH}/libpng15_la-pngread.o \
  ${LIBPNG_PATH}/libpng15_la-pngrio.o \
  ${LIBPNG_PATH}/libpng15_la-pngrtran.o \
  ${LIBPNG_PATH}/libpng15_la-pngrutil.o \
  ${LIBPNG_PATH}/libpng15_la-pngset.o \
  ${LIBPNG_PATH}/libpng15_la-pngtrans.o \
  ${LIBPNG_PATH}/libpng15_la-pngwio.o \
  ${LIBPNG_PATH}/libpng15_la-pngwrite.o \
  ${LIBPNG_PATH}/libpng15_la-pngwtran.o \
  ${LIBPNG_PATH}/libpng15_la-pngwutil.o


convert:
	cp ${UTIL_PATH}/convert ${UTIL_PATH}/convert.bc
	emcc -O2 -minify 2 --pre-js ./toolbox-base/pre.js ${UTIL_PATH}/convert.bc ${ZLIB} ${LIBPNG} -o convert-worker.js

all: convert

