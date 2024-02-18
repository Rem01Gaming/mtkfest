all:
	bash ./ssc -u mtkfest mtkfest.x
	cd module && cp ../mtkfest.x system/bin/mtkfest && zip -r9 ../mtkfest.zip * -x *placeholder && rm system/bin/mtkfest
	rm mtkfest.x
