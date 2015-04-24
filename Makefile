default: image

bin:
	@mkdir bin
bin/sh: | bin
	@cp -L /bin/sh bin/
lib:
	@mkdir lib
lib/x86_64-linux-gnu: | lib
	@mkdir lib/x86_64-linux-gnu
lib/x86_64-linux-gnu/libm.so.6: | lib/x86_64-linux-gnu
	@cp -L /lib/x86_64-linux-gnu/libm.so.6 lib/x86_64-linux-gnu/
lib/x86_64-linux-gnu/libz.so.1: | lib/x86_64-linux-gnu
	@cp -L /lib/x86_64-linux-gnu/libz.so.1 lib/x86_64-linux-gnu/
lib/x86_64-linux-gnu/libdl.so.2: | lib/x86_64-linux-gnu
	@cp -L /lib/x86_64-linux-gnu/libdl.so.2 lib/x86_64-linux-gnu/
lib/x86_64-linux-gnu/libc.so.6: | lib/x86_64-linux-gnu
	@cp -L /lib/x86_64-linux-gnu/libc.so.6 lib/x86_64-linux-gnu/
lib/x86_64-linux-gnu/libpthread.so.0: | lib/x86_64-linux-gnu
	@cp -L /lib/x86_64-linux-gnu/libpthread.so.0 lib/x86_64-linux-gnu/
lib/x86_64-linux-gnu/librt.so.1: | lib/x86_64-linux-gnu
	@cp -L /lib/x86_64-linux-gnu/librt.so.1 lib/x86_64-linux-gnu/
lib64:
	@mkdir lib64
lib64/ld-linux-x86-64.so.2: | lib64
	@cp -L /lib64/ld-linux-x86-64.so.2 lib64/
usr/lib:
	@mkdir -p usr/lib
usr/lib/x86_64-linux-gnu: | usr/lib
	@mkdir usr/lib/x86_64-linux-gnu
usr/lib/x86_64-linux-gnu/gconv: | usr/lib/x86_64-linux-gnu
	@mkdir usr/lib/x86_64-linux-gnu/gconv
usr/lib/x86_64-linux-gnu/gconv/UTF-16.so: | usr/lib/x86_64-linux-gnu/gconv
	@cp -L /usr/lib/x86_64-linux-gnu/gconv/UTF-16.so usr/lib/x86_64-linux-gnu/gconv/
usr/lib/x86_64-linux-gnu/gconv/UTF-32.so: | usr/lib/x86_64-linux-gnu/gconv
	@cp -L /usr/lib/x86_64-linux-gnu/gconv/UTF-32.so usr/lib/x86_64-linux-gnu/gconv/
usr/lib/x86_64-linux-gnu/gconv/UTF-7.so: | usr/lib/x86_64-linux-gnu/gconv
	@cp -L /usr/lib/x86_64-linux-gnu/gconv/UTF-7.so usr/lib/x86_64-linux-gnu/gconv/
usr/lib/x86_64-linux-gnu/gconv/gconv-modules: | usr/lib/x86_64-linux-gnu/gconv
	@cp -L /usr/lib/x86_64-linux-gnu/gconv/gconv-modules usr/lib/x86_64-linux-gnu/gconv/
usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache: | usr/lib/x86_64-linux-gnu/gconv/
	@cp -L /usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache usr/lib/x86_64-linux-gnu/gconv/
usr/lib/x86_64-linux-gnu/libffi.so.6: | lib/x86_64-linux-gnu
	@cp -L /usr/lib/x86_64-linux-gnu/libffi.so.6 usr/lib/x86_64-linux-gnu/
usr/lib/x86_64-linux-gnu/libgmp.so.10: | usr/lib/x86_64-linux-gnu
	@cp -L /usr/lib/x86_64-linux-gnu/libgmp.so.10 usr/lib/x86_64-linux-gnu/

image: | bin/sh lib/x86_64-linux-gnu/libm.so.6 lib/x86_64-linux-gnu/libz.so.1 lib/x86_64-linux-gnu/libdl.so.2 lib/x86_64-linux-gnu/libc.so.6 lib/x86_64-linux-gnu/libc.so.6 lib/x86_64-linux-gnu/libpthread.so.0 lib/x86_64-linux-gnu/librt.so.1 lib64/ld-linux-x86-64.so.2 usr/lib/x86_64-linux-gnu/gconv/UTF-16.so usr/lib/x86_64-linux-gnu/gconv/UTF-32.so usr/lib/x86_64-linux-gnu/gconv/UTF-7.so usr/lib/x86_64-linux-gnu/gconv/gconv-modules usr/lib/x86_64-linux-gnu/gconv/gconv-modules.cache usr/lib/x86_64-linux-gnu/libffi.so.6 usr/lib/x86_64-linux-gnu/libgmp.so.10
	@(docker images|grep -e '^empty' >/dev/null 2>&1) || \
		(tar cv --files-from >/dev/null 2>&1|docker import - empty)
	@docker build -t haskell-scratch .

clean:
	@rm -rf bin usr lib lib64

.PHONY: default image clean
