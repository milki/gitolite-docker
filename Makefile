test: build test.sh
	docker run -v `pwd`:/src:ro gitolite-test /src/test.sh

test_mirror: build test.sh
	docker run -t -v `pwd`:/src:ro gitolite-test /src/test.sh t/mirror-test

build: Dockerfile
	docker build -t gitolite-test -f Dockerfile .
