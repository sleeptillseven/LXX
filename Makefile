# A Self-Documenting Makefile: http://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
# the version is hold in the file .version

.PHONY: test help
.DEFAULT_GOAL := help

build-html:	## build HTML files from sources
	@echo "building HTML docs..."
	@cd scripts && python3 build_static.py && cd ..
	@echo "🍺 done"

check-encoding:	## verify encoding of text
	@echo "running encoding checker..."
	@validate-text text-validator.toml text/*.txt

help:
	@grep -E '^[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
