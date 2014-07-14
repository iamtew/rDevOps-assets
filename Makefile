# Run 'make all' to export the SVG's page to a PNG and optimize them

# We rely on the following tools to create our files
# - inkscape
# - optipng
# - convert (ImageMagick)

SVGDIR = vectors
PNGDIR = outputs

OPTI_OPTS = -o 2


all: $(PNGDIR) \
	   twitter-profile-photo.png \
	   twitter-header.png \
	   rDevOps-header.png

# Create the Twitter logo
twitter-profile-photo.png:
	inkscape --file=$(SVGDIR)/twitter-profile-photo.svg \
	         --export-png=$(PNGDIR)/twitter-profile-photo.png \
	         --export-area-page \
	         --export-width=400 \
	         --export-height=400
	optipng $(OPTI_OPTS) $(PNGDIR)/twitter-profile-photo.png

# Create the Twitter header
twitter-header.png:
	inkscape --file=$(SVGDIR)/trianglify-background.lime-blue.svg \
	         --export-png=$(PNGDIR)/twitter-header.png \
	         --export-area-page \
	         --export-width=1500
	optipng $(OPTI_OPTS) $(PNGDIR)/twitter-header.png

# Create the reddit header
rDevOps-header.png:
	inkscape --file=$(SVGDIR)/trianglify-background.lime-blue.svg \
	         --export-png=$(PNGDIR)/rDevOps-header.png \
	         --export-area-page \
	         --export-width=2000
	convert $(PNGDIR)/rDevOps-header.png \
	        -gravity South \
	        -crop 2000x117+0-0 \
	        $(PNGDIR)/rDevOps-header.png
	optipng $(OPTI_OPTS) $(PNGDIR)/rDevOps-header.png


$(PNGDIR):
	mkdir -p $(PNGDIR)

clean:
	rm -f $(PNGDIR)/*.png
	rm -r $(PNGDIR)
