.DEFAULT_GOAL := menu

menu:
	@echo "╔═══════════════════════════════════════╗"
	@echo "║       rspeji — Command Menu           ║"
	@echo "╚═══════════════════════════════════════╝"
	@echo ""
	@echo "  === Development ==="
	@echo "  1) Run tests"
	@echo "  2) Run linter"
	@echo "  3) List emoji sets"
	@echo ""
	@echo "  === Build ==="
	@echo "  4) Build gem"
	@echo "  5) Install locally"
	@echo ""
	@read -p "Enter choice: " choice; \
	case $$choice in \
		1) $(MAKE) test ;; \
		2) $(MAKE) lint ;; \
		3) $(MAKE) list-emoji ;; \
		4) $(MAKE) build ;; \
		5) $(MAKE) install ;; \
		*) echo "Invalid choice" ;; \
	esac

test:
	bundle exec appraisal rspec

lint:
	rubocop

list-emoji:
	ruby bin/rspeji

build:
	gem build rspeji.gemspec

install: build
	gem install rspeji-*.gem

help:
	@echo "Available commands:"
	@echo "  make test        - Run tests across all RSpec versions"
	@echo "  make lint        - Run RuboCop"
	@echo "  make list-emoji  - Show all emoji sets"
	@echo "  make build       - Build the gem"
	@echo "  make install     - Build and install locally"

list: help

.PHONY: menu test lint list-emoji build install help list
