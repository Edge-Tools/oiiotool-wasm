oiiotool-wasm — Corresponding Source mirror
==================================================

This repository publishes the Corresponding Source for the WebAssembly
build of oiiotool (license: Apache-2.0) used in edgetools.io.

Contents
  build/      our build recipe: Dockerfile + helper scripts/config/patches.
              Rebuild with:  docker build build/
  upstream/   the exact upstream source archive(s) the build fetched,
              byte-identical and sha256-verified (see below).

Upstream sources:
  zlib.tar.gz
    https://github.com/madler/zlib/releases/download/v1.3.1/zlib-1.3.1.tar.gz
    sha256 9a93b2b7dfdac77ceba5a558a580e74667dd6fede4585b91eefb60f03b72df23
  libdeflate.tar.gz
    https://github.com/ebiggers/libdeflate/archive/refs/tags/v1.25.tar.gz
    sha256 d11473c1ad4c57d874695e8026865e38b47116bbcb872bfc622ec8f37a86017d
  imath.tar.gz
    https://github.com/AcademySoftwareFoundation/Imath/archive/refs/tags/v3.2.2.tar.gz
    sha256 b4275d83fb95521510e389b8d13af10298ed5bed1c8e13efd961d91b1105e462
  openjph.tar.gz
    https://github.com/aous72/OpenJPH/archive/refs/tags/0.26.3.tar.gz
    sha256 29de006da7f1e8cf0cd7c3ec424cf29103e465052c00b5a5f0ccb7e1f917bb3f
  openexr.tar.gz
    https://github.com/AcademySoftwareFoundation/openexr/archive/refs/tags/v3.4.12.tar.gz
    sha256 a455779c389f65c64220d45b63ead2900081e5f6337cdf93431cb1032c3e2686
  libpng.tar.gz
    https://downloads.sourceforge.net/project/libpng/libpng16/1.6.58/libpng-1.6.58.tar.gz
    sha256 8c9b05b675ca7301a458df2c2e46f26e1d41ff36b8863f8c33530bc58c2e6225
  libjpeg.tar.gz
    https://github.com/libjpeg-turbo/libjpeg-turbo/releases/download/3.1.4.1/libjpeg-turbo-3.1.4.1.tar.gz
    sha256 ecae8008e2cc9ade2f2c1bb9d5e6d4fb73e7c433866a056bd82980741571a022
  libtiff.tar.gz
    https://download.osgeo.org/libtiff/tiff-4.7.1.tar.gz
    sha256 f698d94f3103da8ca7438d84e0344e453fe0ba3b7486e04c5bf7a9a3fabe9b69
  giflib.tar.gz
    https://deb.debian.org/debian/pool/main/g/giflib/giflib_5.2.2.orig.tar.gz
    sha256 be7ffbd057cadebe2aa144542fd90c6838c6a083b5e8a9048b8ee3b66b29d5fb
  libwebp.tar.gz
    https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.6.0.tar.gz
    sha256 e4ab7009bf0629fd11982d4c2aa83964cf244cffba7347ecd39019a9e38c4564
  openjpeg.tar.gz
    https://github.com/uclouvain/openjpeg/archive/refs/tags/v2.5.4.tar.gz
    sha256 a695fbe19c0165f295a8531b1e4e855cd94d0875d2f88ec4b61080677e27188a
  freetype.tar.xz
    https://download.savannah.gnu.org/releases/freetype/freetype-2.14.3.tar.xz
    sha256 36bc4f1cc413335368ee656c42afca65c5a3987e8768cc28cf11ba775e785a5f
  libde265.tar.gz
    https://github.com/strukturag/libde265/releases/download/v1.0.18/libde265-1.0.18.tar.gz
    sha256 800478f3bf35f0621b14928ceb317579f3e8b23de4bd2aac29b6cb8be962bbd8
  dav1d.tar.xz
    https://download.videolan.org/pub/videolan/dav1d/1.5.3/dav1d-1.5.3.tar.xz
    sha256 732010aa5ef461fa93355ed2c6c5fedb48ddc4b74e697eaabe8907eaeb943011
  libheif.tar.gz
    https://github.com/strukturag/libheif/releases/download/v1.21.2/libheif-1.21.2.tar.gz
    sha256 75f530b7154bc93e7ecf846edfc0416bf5f490612de8c45983c36385aa742b42
  libraw.tar.gz
    https://www.libraw.org/data/LibRaw-0.21.4.tar.gz
    sha256 6be43f19397e43214ff56aab056bf3ff4925ca14012ce5a1538a172406a09e63
  fmt.tar.gz
    https://github.com/fmtlib/fmt/archive/refs/tags/12.1.0.tar.gz
    sha256 ea7de4299689e12b6dddd392f9896f08fb0777ac7168897a244a6d6085043fea
  robinmap.tar.gz
    https://github.com/Tessil/robin-map/archive/refs/tags/v1.4.0.tar.gz
    sha256 7930dbf9634acfc02686d87f615c0f4f33135948130b8922331c16d90a03250c
  expat.tar.gz
    https://github.com/libexpat/libexpat/releases/download/R_2_7_5/expat-2.7.5.tar.gz
    sha256 9931f9860d18e6cf72d183eb8f309bfb96196c00e1d40caa978e95bc9aa978b6
  yaml-cpp.tar.gz
    https://github.com/jbeder/yaml-cpp/archive/refs/tags/0.8.0.tar.gz
    sha256 fbe74bbdcee21d656715688706da3c8becfd946d92cd44705cc6098bb23b3a16
  pystring.tar.gz
    https://github.com/imageworks/pystring/archive/refs/tags/v1.1.4.tar.gz
    sha256 49da0fe2a049340d3c45cce530df63a2278af936003642330287b68cefd788fb
  minizip.tar.gz
    https://github.com/zlib-ng/minizip-ng/archive/refs/tags/3.0.7.tar.gz
    sha256 39981a0db1bb6da504909bce63d7493286c5e50825c056564544c990d15c55cf
  ocio.tar.gz
    https://github.com/AcademySoftwareFoundation/OpenColorIO/archive/refs/tags/v2.4.2.tar.gz
    sha256 2d8f2c47c40476d6e8cea9d878f6601d04f6d5642b47018eaafa9e9f833f3690
  oiio.tar.gz
    https://github.com/AcademySoftwareFoundation/OpenImageIO/archive/refs/tags/v3.1.13.1.tar.gz
    sha256 0fc59b8e2708ded02d3793b8f3331f037ed49bfcde38158f05ac0e876ebb85b7
