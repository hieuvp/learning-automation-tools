.PHONY: terraform-plan
terraform-plan:
	cd terraform \
	&& terraform plan

.PHONY: terraform-apply
terraform-apply:
	cd terraform \
	&& terraform apply -auto-approve

.PHONY: terraform-destroy
terraform-destroy:
	cd terraform \
	&& terraform destroy

.PHONY: ansible-inventory-list
ansible-inventory-list:
	cd labs \
	&& ../scripts/ansible-inventory-list.sh &> ../scripts/ansible-inventory-list.console

.PHONY: all
all: ansible-inventory-list
