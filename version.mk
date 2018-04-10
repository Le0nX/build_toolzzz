#Дополнительная информация о ветке и ее текущем состоянии.
SHELL=/bin/bash
COMMIT := $(shell git rev-parse --verify --short HEAD )
BRANCH := $(shell git branch | grep \* | cut -d ' ' -f2 )
CHANGES := $(shell git status --porcelain )

version:
	@echo Building version
	@echo Branch: $(BRANCH)
	@echo Commit: $(COMMIT)
	
