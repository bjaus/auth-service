.PHONY: migrate-up
migrate-up: # Run the migrations
	@echo "Running the migrations..."
	@goose --dir ./migrations up

.PHONY: migrate-down
migrate-down: # Rollback the migrations
	@echo "Rolling back the migrations..."
	@goose --dir ./migrations down

.PHONY: migrate-status
migrate-status: # Show the status of the migrations
	@echo "Showing the status of the migrations..."
	@goose --dir ./migrations status

.PHONY: migrate-reset
migrate-reset: # Reset the migrations
	@echo "Resetting the migrations..."
	@goose --dir ./migrations reset
