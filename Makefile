ENV_FILE ?= .env
ifneq ("$(wildcard $(ENV_FILE))", "")
  include $(ENV_FILE)
  export $(shell sed -n 's/=.*//' $(ENV_FILE))
endif

include make/migration.mk
include make/development.mk

.PHONY: help
help: # List available targets
	@grep -h '^[a-zA-Z_-]\+:.*#' Makefile make/*.mk \
		|sed 's/:.*#/:/' \
		|awk -F':' '{printf "  %-20s %s\n", $$1, $$2}'
