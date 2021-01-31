# Downloads the "Emilio 20" archive
build/emilio-20.zip:
	@mkdir build 2> /dev/null || true
	wget -qO $@ 'https://www.1001fonts.com/download/emilio-20.zip'
	touch $@

# Extracts the typeface
build/emilio-20.ttf: build/emilio-20.zip
	unzip -p $< 'emilio 20.ttf' > $@

# Extracts the used characters into a new file
build/typeface-h1.woff2: build/emilio-20.ttf
	pyftsubset $< --text="Makefile" --output-file=$@ --flavor=woff2

# Converts the typeface into a Base64 string
build/typeface-h1.base64: build/typeface-h1.woff2
	base64 $< | tr -d '\n' > $@
