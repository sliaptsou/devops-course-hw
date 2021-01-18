.PHONY: fmt help destroy

VAR_FILE=vars.tfvars

validate: fmt
	@terraform validate

fmt:
	@terraform fmt

plan: validate
	@terraform plan -var-file=$(VAR_FILE)

apply: validate
	@terraform apply -var-file=$(VAR_FILE)

destroy:
	@terraform destroy -var-file=$(VAR_FILE)

help:
	@terraform --help
