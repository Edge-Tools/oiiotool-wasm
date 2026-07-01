# Emscripten module interface for the `oiiotool` executable target.
#
# Appended (via `include()`) to src/oiiotool/CMakeLists.txt by the Dockerfile so
# these flags apply ONLY to the oiiotool link — NOT to CMake's configure-time
# compiler probes (which link trivial test executables). Putting -sEXPORT_ES6 /
# --post-js into a global CMAKE_EXE_LINKER_FLAGS would make those probes try to
# emit ES6 modules referencing post.js and fail with "compiler cannot create
# executables" long before the real link. See SKILL.md (lisp --post-js note).
#
# SUFFIX ".mjs" makes emscripten emit ES6-module glue (`export default Module`)
# + a sibling oiiotool.wasm. The runtime methods / module API expose the
# converter interface the JS host needs: callMain(args), FS (stage input image,
# read produced output back), ENV (e.g. OPENIMAGEIO_THREADS=1 — see README).
# EXIT_RUNTIME=1 flushes stdout on exit; MEMFS output files survive in JS memory
# so the host can FS.readFile them after callMain returns. -fexceptions because
# OIIO/OpenEXR/OCIO throw and catch C++ exceptions. Memory grows — image
# processing is allocation-heavy; a generous stack avoids deep-call overflow.
# libheif's HEIF/AVIF backends (libde265 decode, dav1d AV1 decode, libaom AV1
# encode) plus libwebp's SharpYUV (libheif's high-quality RGB->YUV conversion).
# OIIO links libheif.a via its find_library module, which doesn't carry these
# private deps, so add the archives here — lld is order-independent. See the
# libheif CMake-config note in the Dockerfile.
if (EMSCRIPTEN)
    set_target_properties (oiiotool PROPERTIES SUFFIX ".mjs")
    target_link_options (oiiotool PRIVATE
        /opt/lib/libaom.a /opt/lib/libdav1d.a /opt/lib/libde265.a
        /opt/lib/libsharpyuv.a
        -lnodefs.js -lworkerfs.js
        --post-js /src/js/post.js
        -fexceptions
        -Oz
        -sWASM_BIGINT=1
        -sALLOW_MEMORY_GROWTH=1
        -sINITIAL_MEMORY=134217728
        -sMAXIMUM_MEMORY=2147483648
        -sSTACK_SIZE=8388608
        -sEXIT_RUNTIME=1
        -sFORCE_FILESYSTEM=1
        -sEXPORTED_RUNTIME_METHODS=callMain,FS,NODEFS,WORKERFS,ENV
        -sINCOMING_MODULE_JS_API=noInitialRun,wasmBinary,locateFile,preRun,postRun,instantiateWasm,print,printErr,arguments
        -sINVOKE_RUN=0
        -sMODULARIZE=1
        -sEXPORT_ES6=1
    )
endif ()
