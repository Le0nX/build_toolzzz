#Дополнительная информация о ветке и ее текущем состоянии.
COMMIT := $(shell git rev-parse --verify --short HEAD)
BRANCH := $(shell git branch | grep \* | cut -d ' ' -f2)
CHANGES := $(shell git status --porcelain)

version:
	SHELL:=/bin/bash
	@echo Building version
	@echo Branch: $(BRANCH)
	@echo Commit: $(COMMIT)
	
