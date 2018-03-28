build:
	dep ensure

	echo "Compiling functions bin/handlers/ ..."

	rm -rf bin/
	cd src/handlers

	for f in *.go; do
		filename="${f%.go}"
		if GOOS=linux go build -ldflags="-s -w" -0 "../../bin/handlers/$filename" ${f}; then
		  echo "++ Compiled $filename"
		else
		  echo "-- Failed to compile $filename!"
			exit 1
		fi
	done

	echo "Complete."