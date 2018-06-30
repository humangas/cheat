################################################################### 
# See also: https://github.com/humangas/cheat
################################################################### 
.DEFAULT_GOAL := help

.PHONY: all help update serve index view

all:

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "target:"
	@echo " - update:  Update repository"
	@echo " - serve:   Serve _docs/*.md with mkdocs"
	@echo " - index:   Generate index.md"
	@echo " - view:    make serve after make index"
	@echo ""

update:
	@git pull origin master

serve:
	@open -a "/Applications/Google Chrome.app" "http://localhost:8000"
	@mkdocs serve

index:
	@bash scripts/index.sh

view: index serve
