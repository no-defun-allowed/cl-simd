
FROM = markdown_phpextra+backtick_code_blocks+footnotes

all: README.html README.pdf
%.html: %.md Makefile
	pandoc -f $(FROM) -t html5 -V pagetitle=cl-simd -V css=style.css --template=default.html $< -o $@
%.pdf: %.md Makefile
	pandoc -f $(FROM) $< -o $@
