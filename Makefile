SSH_KEY_DIR=ssh-keys
SSH_PRIVATE_KEY=$(SSH_KEY_DIR)/id_rsa
SSH_PUBLIC_KEY=$(SSH_KEY_DIR)/id_rsa.pub

generate-keys:
	@mkdir -p $(SSH_KEY_DIR)
	@if [ ! -f $(SSH_PRIVATE_KEY) ]; then \
		echo "Generating new SSH keys..."; \
		ssh-keygen -t rsa -b 4096 -f $(SSH_PRIVATE_KEY) -N ""; \
	else \
		echo "SSH keys already exist, skipping generation."; \
	fi

build: generate-keys
	@mkdir -p ansible
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

# Restart everything (including regenerating SSH keys if needed)
rebuild: down build up

.PHONY: generate-keys build up down rebuild
