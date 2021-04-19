.PHONY: generate-client

all: generate-client

# Generate code
generate-client:
	hack/generate_client.sh
	go mod tidy
