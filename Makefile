version := $(shell git rev-list HEAD --count)

all:
	bash ./ssc/ssc -u mtkfest mtkfest.x
	clang -c -fPIC wordexp/wordexp.c -o wordexp.o
	clang -shared -o libandroid-wordexp.so wordexp.o
	wget -O module/gamelist.txt https://gist.github.com/Rem01Gaming/02f2cf5c67119b361e6a6349392845bf/raw/gamelist.txt
	sed -i "s/versionCode=.*/versionCode=$(version)/" ./module/module.prop
	cd module && cp ../mtkfest.x system/bin/mtkfest && cp ../libandroid-wordexp.so system/lib64 && zip -r9 ../mtkfest-$(version).zip * -x *placeholder && rm system/bin/mtkfest system/lib64/libandroid-wordexp.so
	rm mtkfest.x wordexp.o libandroid-wordexp.so module/gamelist.txt
	sed -i "s/versionCode=.*/versionCode=/" ./module/module.prop
