all:
	shc -r -v -f mtkfest
	cd module && cp ../mtkfest.x mtkfest && zip -r9 ../mtkfest.zip * && rm mtkfest
	rm mtkfest.x mtkfest.x.c
