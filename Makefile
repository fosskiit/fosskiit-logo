all: logo xpad favicon

# 420 x 420; approx. 20px padding on each side for GitHub/LinkedIn
logo:
	inkscape -z -e "$$PWD/fosskiit.png" "$$PWD/fosskiit.svg"

# 460 x 460; additional 20px padding on each side for Facebook/Twitter
xpad:
	sed -e 's/width="420"/width="460"/' \
	    -e 's/height="420"/height="460" viewBox="-20 -20 460 460"/' \
	    fosskiit.svg > fosskiit-xpad.svg
	inkscape -z -e "$$PWD/fosskiit-xpad.png" "$$PWD/fosskiit-xpad.svg"

# 380 x 380; Website Favicon
favicon:
	inkscape -z -e "$$PWD/favicon.png" "$$PWD/favicon.svg"

preview:
	@echo ========================================
	@echo Visit http://localhost:8000/preview.html
	@echo ========================================
	python -m SimpleHTTPServer

# Remove generated files.
clean:
	rm -f fosskiit-xpad.svg *.png
