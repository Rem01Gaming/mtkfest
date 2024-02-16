all:
	bash ./ssc -u mtkfest mtkfest.x
	cd module && cp ../mtkfest.x mtkfest && zip -r9 ../mtkfest.zip * && rm mtkfest
	rm mtkfest.x
