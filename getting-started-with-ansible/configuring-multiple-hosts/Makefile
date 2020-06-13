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
