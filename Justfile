# justfile

default:
	just all

all:
	just build-pdf
	just convert-to-jpg
	just convert-to-mp4

clean:
	find . -name "*.pdf" -delete
	find . -name "*.pdf.jpg" -delete
	find . -name "*.mp4" -delete

watch:
	find . -name "*.typ" | entr -c just all

build-pdf:
	find . -name "*.typ" -exec typst compile {} \;

convert-to-jpg:
	bash ./_convert-to-jpg.sh


convert-to-mp4:
	bash ./_convert-to-mp4.sh