
FROM = markdown_phpextra+backtick_code_blocks+footnotes

all: cl-simd.html cl-simd.pdf
%.html: %.md Makefile
	pandoc -f $(FROM) $< -o $@
%.pdf: %.md Makefile
	pandoc -f $(FROM) $< -o $@
