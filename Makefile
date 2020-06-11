# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Standard
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.PHONY: fmt
fmt:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-shell.sh
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-xml.sh
	@printf "\n"

	@printf "\n"
	prettier --write **/package.json
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-terraform.sh
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-javascript.sh
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/fmt-markdown.sh
	@printf "\n"

.PHONY: lint
lint:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/lint-shell.sh
	@printf "\n"

	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/lint-terraform.sh
	@printf "\n"

	@printf "\n"
	scripts/lint-ansible.sh
	@printf "\n"

.PHONY: git-add
git-add: fmt lint
	@printf "\n"
	git add --all .
	@printf "\n"


# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Utils
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.PHONY: clean
clean:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/clean-terraform.sh
	@printf "\n"

.PHONY: export-drawio
export-drawio:
	@printf "\n"
	$(MAKEFILE_SCRIPT_PATH)/export-drawio.sh assets/ansible-scenario-progression.drawio 2
	$(MAKEFILE_SCRIPT_PATH)/export-drawio.sh getting-started-with-ansible/alternatives-to-ssh-for-connecting-to-hosts/assets/ansible-pull-model.drawio 1.8
	$(MAKEFILE_SCRIPT_PATH)/export-drawio.sh getting-started-with-ansible/configuring-multiple-hosts/assets/ansible-push-model.drawio 2
	@printf "\n"
