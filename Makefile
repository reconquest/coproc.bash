REFERENCE.md: *.bash
	rm -f REFERENCE.md
	vendor/github.com/reconquest/shdoc/shdoc < $^ >> REFERENCE.md
