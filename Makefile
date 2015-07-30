test: build test.sh
	docker run -v `pwd`:/src:ro gitolite-test /src/test.sh

build: Dockerfile
	docker build -t gitolite-test -f Dockerfile .
