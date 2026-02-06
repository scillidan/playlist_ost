default:
	just all

all:
	just pdf
	just pdf-jpg
	just mp4

pdf:
	find . -name "*.typ" -exec typst compile {} \;

pdf-jpg:
	mkdir -p pdf-jpg
	for f in *.pdf; do \
		basename=$(basename "$f" .pdf); \
		magick -density 300 "$f[0]" -resize x1080 -background white -alpha remove -quality 90 "pdf-jpg/$basename.pdf.jpg"; \
	done

mp4:
	mkdir -p mp4
	find txt-pdf-jpg -maxdepth 1 -name "*.jpg" -print0 | while IFS= read -r -d '' f; do \
		basename=$(basename "$f" .pdf.jpg | sed 's/｜/|/g'); \
		img_file="$f"; \
		aud_file="${basename}.mp3"; \
		if [ -f "$aud_file" ]; then \
			ffmpeg -loop 1 -framerate 1 -i "$img_file" -i "$aud_file" -c:v libx264 -tune stillimage -c:a copy -pix_fmt yuv420p -shortest -y "mp4/${basename}.mp4"; \
		fi; \
	done

clean:
	find . -name "*.pdf" -delete
	# find . -name "*.pdf.jpg" -delete
	find . -name "*.mp4" -delete