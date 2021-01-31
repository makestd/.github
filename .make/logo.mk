# Creates the logo using the template and the Base64 embeddable typefaces
img/logo.svg: img/logo.svg.in build/typeface-h1.base64 build/typeface-h2.base64
	cp $< $@.tmp
	sed -i "s|@H1_WOFF@|$$(cat build/typeface-h1.base64)|" $@.tmp
	sed -i "s|@H2_WOFF@|$$(cat build/typeface-h2.base64)|" $@.tmp
	mv $@.tmp $@

# Creates the gzipped version of the previous SVG logo
img/logo.svgz: img/logo.svg
	cat $< | gzip > $@

# Creates the square logo using the template and the Base64 embeddable typefaces
img/logo-square.svg: img/logo-square.svg.in build/typeface-h1.base64 build/typeface-h2.base64
	cp $< $@.tmp
	sed -i "s|@H1_WOFF@|$$(cat build/typeface-h1.base64)|" $@.tmp
	sed -i "s|@H2_WOFF@|$$(cat build/typeface-h2.base64)|" $@.tmp
	mv $@.tmp $@

# Creates the gzipped version of the previous SVG logo
img/logo-square.svgz: img/logo-square.svg
	cat $< | gzip > $@

# Creates the circle logo using the template and the Base64 embeddable typefaces
img/logo-circle.svg: img/logo-circle.svg.in build/typeface-h1.base64 build/typeface-h2.base64
	cp $< $@.tmp
	sed -i "s|@H1_WOFF@|$$(cat build/typeface-h1.base64)|" $@.tmp
	sed -i "s|@H2_WOFF@|$$(cat build/typeface-h2.base64)|" $@.tmp
	mv $@.tmp $@

# Creates the gzipped version of the previous SVG logo
img/logo-circle.svgz: img/logo-circle.svg
	cat $< | gzip > $@
