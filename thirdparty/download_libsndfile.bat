if not exist "libsndfile-1.2.0-win64/" (
    echo "Downloading libsndfile..." 
	curl -OL https://github.com/libsndfile/libsndfile/releases/download/1.2.0/libsndfile-1.2.0-win64.zip
	7z x libsndfile-1.2.0-win64.zip -y
	rm libsndfile-1.2.0-win64.zip
	echo "Downloaded libsndfile." 
)