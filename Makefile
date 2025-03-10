UTIL_PATH=./src/utilities
ZLIB_PATH=./zlib/src
LIBPNG_PATH=./libpng/src
LIBJPEG_PATH=./libjpeg/src

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

LIBJPEG=${LIBJPEG_PATH}/cdjpeg.o \
  ${LIBJPEG_PATH}/jaricom.o \
  ${LIBJPEG_PATH}/jcapimin.o \
  ${LIBJPEG_PATH}/jcapistd.o \
  ${LIBJPEG_PATH}/jcarith.o \
  ${LIBJPEG_PATH}/jccoefct.o \
  ${LIBJPEG_PATH}/jccolor.o \
  ${LIBJPEG_PATH}/jcdctmgr.o \
  ${LIBJPEG_PATH}/jchuff.o \
  ${LIBJPEG_PATH}/jcinit.o \
  ${LIBJPEG_PATH}/jcmainct.o \
  ${LIBJPEG_PATH}/jcmarker.o \
  ${LIBJPEG_PATH}/jcmaster.o \
  ${LIBJPEG_PATH}/jcomapi.o \
  ${LIBJPEG_PATH}/jcparam.o \
  ${LIBJPEG_PATH}/jcprepct.o \
  ${LIBJPEG_PATH}/jcsample.o \
  ${LIBJPEG_PATH}/jctrans.o \
  ${LIBJPEG_PATH}/jdapimin.o \
  ${LIBJPEG_PATH}/jdapistd.o \
  ${LIBJPEG_PATH}/jdarith.o \
  ${LIBJPEG_PATH}/jdatadst.o \
  ${LIBJPEG_PATH}/jdatasrc.o \
  ${LIBJPEG_PATH}/jdcoefct.o \
  ${LIBJPEG_PATH}/jdcolor.o \
  ${LIBJPEG_PATH}/jddctmgr.o \
  ${LIBJPEG_PATH}/jdhuff.o \
  ${LIBJPEG_PATH}/jdinput.o \
  ${LIBJPEG_PATH}/jdmainct.o \
  ${LIBJPEG_PATH}/jdmarker.o \
  ${LIBJPEG_PATH}/jdmaster.o \
  ${LIBJPEG_PATH}/jdmerge.o \
  ${LIBJPEG_PATH}/jdpostct.o \
  ${LIBJPEG_PATH}/jdsample.o \
  ${LIBJPEG_PATH}/jdtrans.o \
  ${LIBJPEG_PATH}/jerror.o \
  ${LIBJPEG_PATH}/jfdctflt.o \
  ${LIBJPEG_PATH}/jfdctfst.o \
  ${LIBJPEG_PATH}/jfdctint.o \
  ${LIBJPEG_PATH}/jidctflt.o \
  ${LIBJPEG_PATH}/jidctfst.o \
  ${LIBJPEG_PATH}/jidctint.o \
  ${LIBJPEG_PATH}/jmemmgr.o \
  ${LIBJPEG_PATH}/jmemnobs.o \
  ${LIBJPEG_PATH}/jquant1.o \
  ${LIBJPEG_PATH}/jquant2.o \
  ${LIBJPEG_PATH}/jutils.o \
  ${LIBJPEG_PATH}/rdbmp.o \
  ${LIBJPEG_PATH}/rdcolmap.o \
  ${LIBJPEG_PATH}/rdgif.o \
  ${LIBJPEG_PATH}/rdppm.o \
  ${LIBJPEG_PATH}/rdrle.o \
  ${LIBJPEG_PATH}/rdswitch.o \
  ${LIBJPEG_PATH}/rdtarga.o \
  ${LIBJPEG_PATH}/transupp.o \
  ${LIBJPEG_PATH}/wrbmp.o \
  ${LIBJPEG_PATH}/wrgif.o \
  ${LIBJPEG_PATH}/wrppm.o \
  ${LIBJPEG_PATH}/wrrle.o \
  ${LIBJPEG_PATH}/wrtarga.o

LIBTIFF=./libtiff/src/libtiff/.libs/libtiff.so

all: utils ;

utils: compare composite conjure convert identify mogrify montage stream ;

%:
	cp ${UTIL_PATH}/$@ ${UTIL_PATH}/$@.bc
	emcc -O2 -minify 1 --pre-js ./toolbox-base/pre.js ${UTIL_PATH}/$@.bc ${ZLIB} ${LIBPNG} ${LIBJPEG} ${LIBTIFF} -o $@-worker.js -s ALLOW_MEMORY_GROWTH=1
