all:
	bash ./ssc -u mtkfest mtkfest.x
	clang -c -fPIC wordexp/wordexp.c -o wordexp.o
	clang -shared -o libandroid-wordexp.so wordexp.o
	cd module && cp ../mtkfest.x system/bin/mtkfest && cp ../libandroid-wordexp.so system/lib64 && zip -r9 ../mtkfest.zip * -x *placeholder && rm system/bin/mtkfest system/lib64/libandroid-wordexp.so
	rm mtkfest.x wordexp.o libandroid-wordexp.so
