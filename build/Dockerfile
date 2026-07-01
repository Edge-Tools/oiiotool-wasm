FROM emscripten/emsdk:5.0.7 AS builder

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
      autoconf automake libtool pkg-config make xz-utils python3-pip git \
      ninja-build \
    && pip3 install --break-system-packages --no-cache-dir meson ninja \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV PREFIX=/opt
ENV PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
ENV EM_PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig
ENV CFLAGS="-O2 -I${PREFIX}/include -fexceptions"
ENV CXXFLAGS="-O2 -I${PREFIX}/include -fexceptions"
ENV LDFLAGS="-L${PREFIX}/lib"
ENV CPPFLAGS="-I${PREFIX}/include"
ENV CC_FOR_BUILD=gcc

WORKDIR /src

ARG ZLIB_VERSION=1.3.1
ARG ZLIB_SHA256=9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23
ARG LIBDEFLATE_VERSION=1.25
ARG LIBDEFLATE_SHA256=d11473c1ad4c57d874695e8026865e38b47116bbcb872bfc622ec8f37a86017d
ARG IMATH_VERSION=3.2.2
ARG IMATH_SHA256=b4275d83fb95521510e389b8d13af10298ed5bed1c8e13efd961d91b1105e462
ARG OPENEXR_VERSION=3.4.12
ARG OPENEXR_SHA256=a455779c389f65c64220d45b63ead2900081e5f6337cdf93431cb1032c3e2686
ARG OPENJPH_VERSION=0.26.3
ARG OPENJPH_SHA256=29de006da7f1e8cf0cd7c3ec424cf29103e465052c00b5a5f0ccb7e1f917bb3f
ARG LIBPNG_VERSION=1.6.58
ARG LIBPNG_SHA256=8c9b05b675ca7301a458df2c2e46f26e1d41ff36b8863f8c33530bc58c2e6225
ARG LIBJPEG_VERSION=3.1.4.1
ARG LIBJPEG_SHA256=ecae8008e2cc9ade2f2c1bb9d5e6d4fb73e7c433866a056bd82980741571a022
ARG LIBTIFF_VERSION=4.7.1
ARG LIBTIFF_SHA256=f698d94f3103da8ca7438d84e0344e453fe0ba3b7486e04c5bf7a9a3fabe9b69
ARG GIFLIB_VERSION=5.2.2
ARG GIFLIB_SHA256=be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb
ARG LIBWEBP_VERSION=1.6.0
ARG LIBWEBP_SHA256=e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564
ARG OPENJPEG_VERSION=2.5.4
ARG OPENJPEG_SHA256=a695fbe19c0165f295a8531b1e4e855cd94d0875d2f88ec4b61080677e27188a
ARG FREETYPE_VERSION=2.14.3
ARG FREETYPE_SHA256=36bc4f1cc413335368ee656c42afca65c5a3987e8768cc28cf11ba775e785a5f
ARG LIBDE265_VERSION=1.0.18
ARG LIBDE265_SHA256=800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8
ARG DAV1D_VERSION=1.5.3
ARG DAV1D_SHA256=732010aa5ef461fa93355ed2c6c5fedb48ddc4b74e697eaabe8907eaeb943011
ARG LIBAOM_VERSION=3.13.3
ARG LIBAOM_COMMIT=92d4c37fbdd08944a0e721bbaeb13318f10aebb0
ARG LIBHEIF_VERSION=1.21.2
ARG LIBHEIF_SHA256=75f530b7154bc93e7ecf846edfc0416bf5f490612de8c45983c36385aa742b42
ARG LIBRAW_VERSION=0.21.4
ARG LIBRAW_SHA256=6be43f19397e43214ff56aab056bf3ff4925ca14012ce5a1538a172406a09e63
ARG FMT_VERSION=12.1.0
ARG FMT_SHA256=ea7de4299689e12b6dddd392f9896f08fb0777ac7168897a244a6d6085043fea
ARG ROBINMAP_VERSION=1.4.0
ARG ROBINMAP_SHA256=7930dbf9634acfc02686d87f615c0f4f33135948130b8922331c16d90a03250c
ARG EXPAT_VERSION=2.7.5
ARG EXPAT_SHA256=9931f9860d18e6cf72d183eb8f309bfb96196c00e1d40caa978e95bc9aa978b6
ARG YAMLCPP_VERSION=0.8.0
ARG YAMLCPP_SHA256=fbe74bbdcee21d656715688706da3c8becfd946d92cd44705cc6098bb23b3a16
ARG PYSTRING_VERSION=1.1.4
ARG PYSTRING_SHA256=49da0fe2a049340d3c45cce530df63a2278af936003642330287b68cefd788fb
ARG MINIZIP_VERSION=3.0.7
ARG MINIZIP_SHA256=39981a0db1bb6da504909bce63d7493286c5e50825c056564544c990d15c55cf
ARG OCIO_VERSION=2.4.2
ARG OCIO_SHA256=2d8f2c47c40476d6e8cea9d878f6601d04f6d5642b47018eaafa9e9f833f3690

ENV EMCMAKE_COMMON="-DCMAKE_INSTALL_PREFIX=/opt -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_PREFIX_PATH=/opt -DCMAKE_FIND_ROOT_PATH=/opt \
    -DBUILD_SHARED_LIBS=OFF -DBUILD_TESTING=OFF"

ADD https://github.com/madler/zlib/releases/download/v${ZLIB_VERSION}/zlib-${ZLIB_VERSION}.tar.gz zlib.tar.gz
RUN echo "${ZLIB_SHA256}  zlib.tar.gz" | sha256sum -c - \
    && tar -xzf zlib.tar.gz && rm zlib.tar.gz && cd zlib-${ZLIB_VERSION} \
    && emconfigure ./configure --prefix=${PREFIX} --static \
    && emmake make -j$(nproc) install

ADD https://github.com/ebiggers/libdeflate/archive/refs/tags/v${LIBDEFLATE_VERSION}.tar.gz libdeflate.tar.gz
RUN echo "${LIBDEFLATE_SHA256}  libdeflate.tar.gz" | sha256sum -c - \
    && tar -xzf libdeflate.tar.gz && rm libdeflate.tar.gz && cd libdeflate-${LIBDEFLATE_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DLIBDEFLATE_BUILD_SHARED_LIB=OFF -DLIBDEFLATE_BUILD_GZIP=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v${IMATH_VERSION}.tar.gz imath.tar.gz
RUN echo "${IMATH_SHA256}  imath.tar.gz" | sha256sum -c - \
    && tar -xzf imath.tar.gz && rm imath.tar.gz && cd Imath-${IMATH_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DIMATH_INSTALL_PKG_CONFIG=ON -DPYTHON=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/aous72/OpenJPH/archive/refs/tags/${OPENJPH_VERSION}.tar.gz openjph.tar.gz
RUN echo "${OPENJPH_SHA256}  openjph.tar.gz" | sha256sum -c - \
    && tar -xzf openjph.tar.gz && rm openjph.tar.gz && cd OpenJPH-${OPENJPH_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DOJPH_DISABLE_SIMD=ON -DOJPH_ENABLE_TIFF_SUPPORT=OFF \
        -DOJPH_BUILD_EXECUTABLES=OFF -DOJPH_BUILD_TESTS=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v${OPENEXR_VERSION}.tar.gz openexr.tar.gz
RUN echo "${OPENEXR_SHA256}  openexr.tar.gz" | sha256sum -c - \
    && tar -xzf openexr.tar.gz && rm openexr.tar.gz && cd openexr-${OPENEXR_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DOPENEXR_ENABLE_THREADING=OFF \
        -DOPENEXR_BUILD_TOOLS=OFF -DOPENEXR_BUILD_EXAMPLES=OFF \
        -DOPENEXR_INSTALL_TOOLS=OFF -DOPENEXR_INSTALL_PKG_CONFIG=ON \
        -DOPENEXR_FORCE_INTERNAL_IMATH=OFF -DOPENEXR_FORCE_INTERNAL_DEFLATE=OFF \
        -DOPENEXR_FORCE_INTERNAL_OPENJPH=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://downloads.sourceforge.net/project/libpng/libpng16/${LIBPNG_VERSION}/libpng-${LIBPNG_VERSION}.tar.gz libpng.tar.gz
RUN echo "${LIBPNG_SHA256}  libpng.tar.gz" | sha256sum -c - \
    && tar -xzf libpng.tar.gz && rm libpng.tar.gz && cd libpng-${LIBPNG_VERSION} \
    && emconfigure ./configure --host=wasm32-unknown-emscripten --prefix=${PREFIX} \
        --disable-shared --enable-static --disable-tools \
    && emmake make -j$(nproc) install

ADD https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/${LIBJPEG_VERSION}/libjpeg-turbo-${LIBJPEG_VERSION}.tar.gz libjpeg.tar.gz
RUN echo "${LIBJPEG_SHA256}  libjpeg.tar.gz" | sha256sum -c - \
    && tar -xzf libjpeg.tar.gz && rm libjpeg.tar.gz && cd libjpeg-turbo-${LIBJPEG_VERSION} \
    && emcmake cmake -B build -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release \
        -DENABLE_SHARED=OFF -DENABLE_STATIC=ON -DWITH_SIMD=OFF -DWITH_TURBOJPEG=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://download.osgeo.org/libtiff/tiff-${LIBTIFF_VERSION}.tar.gz libtiff.tar.gz
RUN echo "${LIBTIFF_SHA256}  libtiff.tar.gz" | sha256sum -c - \
    && tar -xzf libtiff.tar.gz && rm libtiff.tar.gz && cd tiff-${LIBTIFF_VERSION} \
    && emconfigure ./configure --host=wasm32-unknown-emscripten --prefix=${PREFIX} \
        --disable-shared --enable-static --disable-tools --disable-tests \
        --disable-contrib --disable-docs --enable-zlib --enable-jpeg \
        --disable-lzma --disable-zstd --disable-webp \
    && emmake make -j$(nproc) install

ADD https://deb.debian.org/debian/pool/main/g/giflib/giflib_${GIFLIB_VERSION}.orig.tar.gz giflib.tar.gz
RUN echo "${GIFLIB_SHA256}  giflib.tar.gz" | sha256sum -c - \
    && tar -xzf giflib.tar.gz && rm giflib.tar.gz && cd giflib-${GIFLIB_VERSION} \
    && emmake make libgif.a CFLAGS="-std=gnu99 -fPIC -O2" \
    && cp libgif.a ${PREFIX}/lib/ && cp gif_lib.h ${PREFIX}/include/ \
    && test -f ${PREFIX}/lib/libgif.a

ADD https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-${LIBWEBP_VERSION}.tar.gz libwebp.tar.gz
RUN echo "${LIBWEBP_SHA256}  libwebp.tar.gz" | sha256sum -c - \
    && tar -xzf libwebp.tar.gz && rm libwebp.tar.gz && cd libwebp-${LIBWEBP_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DWEBP_ENABLE_SIMD=OFF -DWEBP_USE_THREAD=OFF -DWEBP_BUILD_WEBP_JS=OFF \
        -DWEBP_BUILD_ANIM_UTILS=OFF -DWEBP_BUILD_CWEBP=OFF -DWEBP_BUILD_DWEBP=OFF \
        -DWEBP_BUILD_GIF2WEBP=OFF -DWEBP_BUILD_IMG2WEBP=OFF -DWEBP_BUILD_VWEBP=OFF \
        -DWEBP_BUILD_WEBPINFO=OFF -DWEBP_BUILD_WEBPMUX=OFF -DWEBP_BUILD_EXTRAS=OFF \
        -DWEBP_BUILD_LIBWEBPMUX=ON \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/uclouvain/openjpeg/archive/refs/tags/v${OPENJPEG_VERSION}.tar.gz openjpeg.tar.gz
RUN echo "${OPENJPEG_SHA256}  openjpeg.tar.gz" | sha256sum -c - \
    && tar -xzf openjpeg.tar.gz && rm openjpeg.tar.gz && cd openjpeg-${OPENJPEG_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DBUILD_CODEC=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://download.savannah.gnu.org/releases/freetype/freetype-${FREETYPE_VERSION}.tar.xz freetype.tar.xz
RUN echo "${FREETYPE_SHA256}  freetype.tar.xz" | sha256sum -c - \
    && tar -xJf freetype.tar.xz && rm freetype.tar.xz && cd freetype-${FREETYPE_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DFT_DISABLE_HARFBUZZ=ON -DFT_DISABLE_BROTLI=ON -DFT_DISABLE_BZIP2=ON \
        -DFT_REQUIRE_ZLIB=ON -DFT_REQUIRE_PNG=ON \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/strukturag/libde265/releases/download/v${LIBDE265_VERSION}/libde265-${LIBDE265_VERSION}.tar.gz libde265.tar.gz
RUN echo "${LIBDE265_SHA256}  libde265.tar.gz" | sha256sum -c - \
    && tar -xzf libde265.tar.gz && rm libde265.tar.gz && cd libde265-${LIBDE265_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DENABLE_SDL=OFF -DENABLE_DECODER=OFF -DENABLE_ENCODER=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://download.videolan.org/pub/videolan/dav1d/${DAV1D_VERSION}/dav1d-${DAV1D_VERSION}.tar.xz dav1d.tar.xz
COPY meson-emscripten-cross.txt /src/meson-emscripten-cross.txt
RUN echo "${DAV1D_SHA256}  dav1d.tar.xz" | sha256sum -c - \
    && tar -xJf dav1d.tar.xz && rm dav1d.tar.xz && cd dav1d-${DAV1D_VERSION} \
    && meson setup build --cross-file /src/meson-emscripten-cross.txt \
        --prefix=${PREFIX} --buildtype=release --default-library=static \
        -Denable_tools=false -Denable_tests=false -Denable_asm=false \
    && ninja -C build install

RUN git clone --depth 1 --branch v${LIBAOM_VERSION} https://aomedia.googlesource.com/aom aom \
    && [ "$(git -C aom rev-parse HEAD)" = "${LIBAOM_COMMIT}" ] \
       || { echo "FATAL: aom tag v${LIBAOM_VERSION} commit mismatch"; exit 1; } \
    && cd aom \
    && emcmake cmake -B build -DCMAKE_INSTALL_PREFIX=${PREFIX} -DCMAKE_BUILD_TYPE=Release \
        -DAOM_TARGET_CPU=generic -DENABLE_NASM=0 -DCONFIG_RUNTIME_CPU_DETECT=0 \
        -DCONFIG_MULTITHREAD=0 \
        -DCONFIG_AV1_DECODER=0 -DCONFIG_AV1_ENCODER=1 \
        -DENABLE_TESTS=0 -DENABLE_TOOLS=0 -DENABLE_EXAMPLES=0 -DENABLE_DOCS=0 \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/strukturag/libheif/releases/download/v${LIBHEIF_VERSION}/libheif-${LIBHEIF_VERSION}.tar.gz libheif.tar.gz
RUN echo "${LIBHEIF_SHA256}  libheif.tar.gz" | sha256sum -c - \
    && tar -xzf libheif.tar.gz && rm libheif.tar.gz && cd libheif-${LIBHEIF_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DCMAKE_CXX_FLAGS="${CXXFLAGS} -D__EMSCRIPTEN_STANDALONE_WASM__" \
        -DWITH_EXAMPLES=OFF -DWITH_GDK_PIXBUF=OFF -DENABLE_PLUGIN_LOADING=OFF \
        -DWITH_LIBDE265=ON -DWITH_DAV1D=ON \
        -DWITH_AOM_ENCODER=ON -DWITH_AOM_DECODER=OFF -DWITH_X265=OFF \
        -DWITH_SvtEnc=OFF -DWITH_RAV1E=OFF -DWITH_KVAZAAR=OFF -DWITH_UVG266=OFF \
        -DWITH_VVDEC=OFF -DWITH_VVENC=OFF -DWITH_FFMPEG_DECODER=OFF \
        -DWITH_OpenH264_DECODER=OFF -DWITH_OpenH264_ENCODER=OFF \
        -DWITH_JPEG_DECODER=OFF -DWITH_JPEG_ENCODER=OFF \
        -DWITH_OpenJPEG_DECODER=OFF -DWITH_OpenJPEG_ENCODER=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://www.libraw.org/data/LibRaw-${LIBRAW_VERSION}.tar.gz libraw.tar.gz
RUN echo "${LIBRAW_SHA256}  libraw.tar.gz" | sha256sum -c - \
    && tar -xzf libraw.tar.gz && rm libraw.tar.gz && cd LibRaw-${LIBRAW_VERSION} \
    && cp "$(find /usr -name config.sub 2>/dev/null | head -1)" config.sub \
    && cp "$(find /usr -name config.guess 2>/dev/null | head -1)" config.guess \
    && grep -q wasm32 config.sub \
       || { echo "FATAL: replacement config.sub does not know wasm32"; exit 1; } \
    && emconfigure ./configure --host=wasm32-unknown-emscripten --prefix=${PREFIX} \
        --disable-shared --enable-static --disable-examples --disable-openmp \
        --disable-lcms --disable-jasper \
    && emmake make -j$(nproc) install

ADD https://github.com/fmtlib/fmt/archive/refs/tags/${FMT_VERSION}.tar.gz fmt.tar.gz
RUN echo "${FMT_SHA256}  fmt.tar.gz" | sha256sum -c - \
    && tar -xzf fmt.tar.gz && rm fmt.tar.gz && cd fmt-${FMT_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DFMT_TEST=OFF -DFMT_DOC=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/Tessil/robin-map/archive/refs/tags/v${ROBINMAP_VERSION}.tar.gz robinmap.tar.gz
RUN echo "${ROBINMAP_SHA256}  robinmap.tar.gz" | sha256sum -c - \
    && tar -xzf robinmap.tar.gz && rm robinmap.tar.gz && cd robin-map-${ROBINMAP_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/libexpat/libexpat/releases/download/R_2_7_5/expat-${EXPAT_VERSION}.tar.gz expat.tar.gz
RUN echo "${EXPAT_SHA256}  expat.tar.gz" | sha256sum -c - \
    && tar -xzf expat.tar.gz && rm expat.tar.gz && cd expat-${EXPAT_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DEXPAT_SHARED_LIBS=OFF -DEXPAT_BUILD_TOOLS=OFF -DEXPAT_BUILD_EXAMPLES=OFF \
        -DEXPAT_BUILD_TESTS=OFF -DEXPAT_BUILD_DOCS=OFF -DEXPAT_BUILD_PKGCONFIG=ON \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/jbeder/yaml-cpp/archive/refs/tags/${YAMLCPP_VERSION}.tar.gz yaml-cpp.tar.gz
RUN echo "${YAMLCPP_SHA256}  yaml-cpp.tar.gz" | sha256sum -c - \
    && tar -xzf yaml-cpp.tar.gz && rm yaml-cpp.tar.gz && cd yaml-cpp-${YAMLCPP_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DYAML_CPP_BUILD_TESTS=OFF -DYAML_CPP_BUILD_TOOLS=OFF \
        -DYAML_CPP_BUILD_CONTRIB=OFF -DYAML_BUILD_SHARED_LIBS=OFF \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/imageworks/pystring/archive/refs/tags/v${PYSTRING_VERSION}.tar.gz pystring.tar.gz
RUN echo "${PYSTRING_SHA256}  pystring.tar.gz" | sha256sum -c - \
    && tar -xzf pystring.tar.gz && rm pystring.tar.gz && cd pystring-${PYSTRING_VERSION} \
    && em++ ${CXXFLAGS} -c pystring.cpp -o pystring.o \
    && emar rcs libpystring.a pystring.o \
    && cp libpystring.a ${PREFIX}/lib/ \
    && mkdir -p ${PREFIX}/include/pystring \
    && cp pystring.h ${PREFIX}/include/pystring.h \
    && cp pystring.h ${PREFIX}/include/pystring/pystring.h \
    && test -f ${PREFIX}/lib/libpystring.a

ADD https://github.com/zlib-ng/minizip-ng/archive/refs/tags/${MINIZIP_VERSION}.tar.gz minizip.tar.gz
RUN echo "${MINIZIP_SHA256}  minizip.tar.gz" | sha256sum -c - \
    && tar -xzf minizip.tar.gz && rm minizip.tar.gz && cd minizip-ng-${MINIZIP_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DMZ_COMPAT=OFF -DMZ_BZIP2=OFF -DMZ_LZMA=OFF -DMZ_ZSTD=OFF \
        -DMZ_LIBCOMP=OFF -DMZ_OPENSSL=OFF -DMZ_PKCRYPT=OFF -DMZ_WZAES=OFF \
        -DMZ_LIBBSD=OFF -DMZ_ICONV=OFF -DMZ_FETCH_LIBS=OFF -DMZ_ZLIB=ON \
    && cmake --build build -j$(nproc) --target install

ADD https://github.com/AcademySoftwareFoundation/OpenColorIO/archive/refs/tags/v${OCIO_VERSION}.tar.gz ocio.tar.gz
RUN echo "${OCIO_SHA256}  ocio.tar.gz" | sha256sum -c - \
    && tar -xzf ocio.tar.gz && rm ocio.tar.gz && cd OpenColorIO-${OCIO_VERSION} \
    && emcmake cmake -B build ${EMCMAKE_COMMON} \
        -DOCIO_INSTALL_EXT_PACKAGES=NONE \
        -DOCIO_BUILD_APPS=OFF -DOCIO_BUILD_TESTS=OFF -DOCIO_BUILD_GPU_TESTS=OFF \
        -DOCIO_BUILD_PYTHON=OFF -DOCIO_BUILD_DOCS=OFF -DOCIO_BUILD_FROZEN_DOCS=OFF \
        -DOCIO_USE_SSE=OFF \
        -DCMAKE_POLICY_VERSION_MINIMUM=3.5 \
    && cmake --build build -j$(nproc) --target install

ARG VERSION=3.1.13.1
ENV VERSION=${VERSION}
ARG OIIO_SHA256=0fc59b8e2708ded02d3793b8f3331f037ed49bfcde38158f05ac0e876ebb85b7
ADD https://github.com/AcademySoftwareFoundation/OpenImageIO/archive/refs/tags/v${VERSION}.tar.gz oiio.tar.gz
RUN echo "${OIIO_SHA256}  oiio.tar.gz" | sha256sum -c - \
    && tar -xzf oiio.tar.gz && rm oiio.tar.gz

COPY js /src/js
COPY oiiotool-emscripten.cmake /src/oiiotool-emscripten.cmake

WORKDIR /src/OpenImageIO-${VERSION}

RUN echo 'include(/src/oiiotool-emscripten.cmake)' >> src/oiiotool/CMakeLists.txt \
    && grep -q oiiotool-emscripten src/oiiotool/CMakeLists.txt \
    || { echo "FATAL: oiiotool link-options include not appended"; exit 1; }

RUN rm -rf ${PREFIX}/lib/cmake/libheif && [ ! -d ${PREFIX}/lib/cmake/libheif ]

RUN sed -i 's/#ifdef __linux__/#if defined(__linux__) || defined(__EMSCRIPTEN__)/' src/libutil/sysutil.cpp \
    && sed -i 's/^#if defined(__linux__)$/#if defined(__linux__) || defined(__EMSCRIPTEN__)/' src/libutil/sysutil.cpp \
    && sed -i 's/|| defined(__GLIBC__)/|| defined(__GLIBC__) || defined(__EMSCRIPTEN__)/g' src/libutil/strutil.cpp \
    && sed -i 's|        if (nThreads < 0)|#ifdef __EMSCRIPTEN__\n        nThreads = 0;\n#endif\n        if (nThreads < 0)|' src/libutil/thread.cpp \
    && grep -q '__EMSCRIPTEN__' src/libutil/sysutil.cpp \
    && grep -q '__EMSCRIPTEN__' src/libutil/strutil.cpp \
    && grep -q '__EMSCRIPTEN__' src/libutil/thread.cpp \
    || { echo "FATAL: emscripten platform patches did not apply"; exit 1; }

RUN sed -i 's|#elif defined(_LIBCPP_VERSION) && !defined(__aarch64__)|#elif defined(_LIBCPP_VERSION) \&\& !defined(__aarch64__) \&\& !defined(__EMSCRIPTEN__)|' src/libutil/ustring.cpp \
    && grep -q '!defined(__aarch64__) && !defined(__EMSCRIPTEN__)' src/libutil/ustring.cpp \
    || { echo "FATAL: ustring libc++-layout patch did not apply"; exit 1; }

RUN emcmake cmake -B build \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_PREFIX_PATH=/opt -DCMAKE_FIND_ROOT_PATH=/opt \
        -DCMAKE_CXX_STANDARD=17 \
        -DBUILD_SHARED_LIBS=OFF -DLINKSTATIC=ON \
        -DOpenImageIO_BUILD_MISSING_DEPS=none -DOpenImageIO_BUILD_LOCAL_DEPS=none \
        -DOpenImageIO_BUILD_TOOLS=ON -DOpenImageIO_BUILD_TESTS=OFF \
        -DEMBEDPLUGINS=ON -DINSTALL_DOCS=OFF \
        -DUSE_PYTHON=OFF -DUSE_QT=OFF -DUSE_OPENGL=OFF -DUSE_OPENCV=OFF \
        -DUSE_FFMPEG=OFF -DUSE_OPENVDB=OFF -DUSE_TBB=OFF -DUSE_JXL=OFF \
        -DUSE_DICOM=OFF -DUSE_NUKE=OFF -DUSE_R3DSDK=OFF \
        -DUSE_SIMD=0 \
        -DENABLE_libuhdr=OFF \
        -DOIIO_BUILD_TESTS=OFF -DVERBOSE=ON

RUN cmake --build build -j$(nproc) --target oiiotool

RUN mkdir -p /dist \
    && cp build/bin/oiiotool.mjs /dist/oiiotool.mjs \
    && cp build/bin/oiiotool.wasm /dist/oiiotool.wasm \
    && [ "$(head -c4 /dist/oiiotool.wasm | od -An -tx1 | tr -d ' \n')" = "0061736d" ] \
    && [ "$(stat -c%s /dist/oiiotool.wasm)" -gt 4194304 ]

FROM scratch AS exportor
COPY --from=builder /dist /dist
