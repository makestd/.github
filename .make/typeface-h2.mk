# Downloads the Google Fonts CSS file for the "Roboto Slab" typeface
build/roboto-slab.css:
	@mkdir build 2> /dev/null || true
	wget -qO $@ 'https://fonts.googleapis.com/css2?family=Roboto+Slab' -U 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3729.169 Safari/537.36'
	touch $@

# Extracts the download URLs
build/roboto-slab.list: build/roboto-slab.css
	cat $< | egrep -o '(/\*.*\*/|https:[^)]+)' | awk '/^\/*/ { printf "%-12s ", $$2; getline; }; {print}' > $@

# Downloads the "Roboto Slab" typeface
build/roboto-slab.woff2: build/roboto-slab.list
	wget -qO $@ "$$(cat $< | awk '$$1 == "latin" {print $$2}')"
	touch $@

# Extracts the used characters into a new file
build/typeface-h2.woff2: build/roboto-slab.woff2
	pyftsubset $< --text="Standard Library" --output-file=$@ --flavor=woff2

# Converts the typeface into a Base64 string
build/typeface-h2.base64: build/typeface-h2.woff2
	base64 $< | tr -d '\n' > $@
