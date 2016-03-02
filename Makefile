
FROM = markdown_phpextra+backtick_code_blocks+footnotes

all: README.html README.pdf
%.html: %.md Makefile
	pandoc -f $(FROM) $< -o $@
%.pdf: %.md Makefile
	pandoc -f $(FROM) $< -o $@
