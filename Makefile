REFERENCE.md: *.bash
	rm -f REFERENCE.md
	bash -c 'source vendor/github.com/reconquest/import.bash/import.bash && \
		import:use "github.com/reconquest/shdoc"'
	vendor/github.com/reconquest/shdoc/shdoc < $^ >> REFERENCE.md
