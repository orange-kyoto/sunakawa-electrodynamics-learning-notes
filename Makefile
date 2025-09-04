fmt: *.tex
	tex-fmt $^ --nowrap

fmt-check: *.tex
	tex-fmt --check --nowrap $^
    