# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Standard
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.PHONY: fmt
fmt:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-markdown.sh
	@printf "\n"

.PHONY: lint
lint:

.PHONY: git-add
git-add: fmt lint
	@printf "\n"
	git add --all .
	@printf "\n"
