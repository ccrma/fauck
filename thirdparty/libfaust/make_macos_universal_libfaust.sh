# copy arm64 into universal just to use the headers
cp -r darwin-arm64 darwin-universal

# combine the static libfaust.a from x64 and arm64 into a universal library.
lipo darwin-x64/Release/lib/libfaust.a darwin-arm64/Release/lib/libfaust.a -create -output darwin-universal/Release/lib/libfaust.a