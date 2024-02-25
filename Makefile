version := $(shell git rev-list HEAD --count)

all:
	wget -O module/gamelist.txt https://gist.github.com/Rem01Gaming/02f2cf5c67119b361e6a6349392845bf/raw/gamelist.txt
	sed -i "s/versionCode=.*/versionCode=$(version)/" ./module/module.prop
	cp LISENSE ./module
	cd module && zip -r9 ../mtkfest-$(version).zip * -x *placeholder
	rm module/gamelist.txt module/LICENSE
	sed -i "s/versionCode=.*/versionCode=/" ./module/module.prop
