if [ "$(uname)" = "Darwin" ]; then
    if [[ $(uname -m) == 'arm64' ]]; then
        export LIBFAUST_DIR=$PWD/thirdparty/libfaust/darwin-arm64/Release
    else
        export LIBFAUST_DIR=$PWD/thirdparty/libfaust/darwin-x64/Release
    fi
else
    export LIBFAUST_DIR=$PWD/thirdparty/libfaust/ubuntu-x86_64/Release
fi

# Build libsndfile
cd thirdparty/libsndfile
cmake -Bbuild $CMAKEOPTS -DCMAKE_C_FLAGS="-fPIC" -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_INSTALL_PREFIX="./install"
cmake --build build --config Release
cmake --build build --target install
cd ../..

# Build FaucK
cmake -Bbuild $CMAKEOPTS -DCMAKE_C_FLAGS="-fPIC" -DCMAKE_CXX_FLAGS="-fPIC" -DCMAKE_VERBOSE_MAKEFILE=ON -DLIBFAUST_DIR="$LIBFAUST_DIR" -DCMAKE_PREFIX_PATH="thirdparty/libsndfile/install"
cmake --build build --config Release
cmake --build build --config Release --target install

# mkdir -p "/usr/local/lib/chuck"
# cp -r "package/fauck-0.0.1/Faust.chug" "/usr/local/lib/chuck/Faust.chug"
