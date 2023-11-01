# Build libsndfile
cd thirdparty/libsndfile
cmake -Bbuild $CMAKEOPTS -DCMAKE_VERBOSE_MAKEFILE=ON -DCMAKE_C_FLAGS="-fPIC" -DCMAKE_CXX_FLAGS="-fPIC" -DBUILD_TESTING=OFF -DCMAKE_INSTALL_PREFIX="./install"
cmake --build build --config Release
cmake --build build --target install
cd ../..

# Build FaucK
#  -DCMAKE_PREFIX_PATH="thirdparty/libsndfile/install"
cmake -Bbuild $CMAKEOPTS -DCMAKE_VERBOSE_MAKEFILE=ON
cmake --build build --config Release
cmake --build build --config Release --target install

# mkdir -p "/usr/local/lib/chuck"
# cp -r "package/fauck-0.0.1/Faust.chug" "/usr/local/lib/chuck/Faust.chug"
