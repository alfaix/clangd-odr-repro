.ONESHELL:
.PHONY: build clean
BUILD_PARAMS = -g -std=c++23 -stdlib=libc++ -x c++-module

build: clean
	mkdir -p build
	cd build
	# c++ ${BUILD_PARAMS} -fmodule-output=a.cppm.pcm -o a.cppm.o -c ../a.cppm
	c++ ${BUILD_PARAMS} -fmodule-output=b.cppm.pcm -o b.cppm.o -c ../b.cppm
	c++ ${BUILD_PARAMS} -fmodule-file=b=b.cppm.pcm -fmodule-output=c.cppm.pcm -o c.cppm.o -c ../c.cppm
	c++ -g -std=c++23 -stdlib=libc++ b.cppm.o c.cppm.o -o out

clean: 
	rm -rf build

check: build
	clangd --compile-commands-dir=. --check=c.cppm 2>&1 | grep '^E'
