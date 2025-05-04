.PHONY: test
test: # Run the tests
	@echo "Running the tests..."
	@mkdir -p ./build/coverage
	@go test -v ./... -coverprofile=./build/coverage/coverage.out
	@go tool cover -html=./build/coverage/coverage.out -o ./build/coverage/coverage.html

.PHONY: serve
serve: # Serve the service
	@echo "Serving the service..."
	@air

.PHONY: run
run: # Run the service
	@echo "Running the service..."
	@go run ./cmd/service

.PHONY: build
build: # Build the Go service
	@echo "Building the service..."
	@go build -o ./bin/auth-serivce ./cmd/service

.PHONY: image
image: # Build the docker image
	@echo "Building the docker image..."
	@docker build -t auth-serivce:latest .

.PHONY: setup
setup: # Setup resourecs
	@echo "Setting up the resources..."
	@docker compose -f docker-compose.yml up -d --build

.PHONY: teardown
teardown: # Teardown resources
	@echo "Tearing down the resources..."
	@docker compose -f docker-compose.yml down -v --remove-orphans
