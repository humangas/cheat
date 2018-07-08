################################################################### 
# See also: https://github.com/humangas/cheat
################################################################### 
CMDNAME := cheat
INSTALLPATH := /usr/local/bin

.DEFAULT_GOAL := help

.PHONY: all help update serve indexmd view install

all:

help:
	@echo "Usage: make <target>"
	@echo ""
	@echo "target:"
	@echo " - update:    Update repository"
	@echo " - serve:     Serve _docs/*.md with mkdocs"
	@echo " - indexmd:   Generate index.md"
	@echo " - view:      make serve after make indexmd"
	@echo " - install:   Install cheat command"
	@echo ""

update:
	@git pull origin master

serve:
	@open -a "/Applications/Google Chrome.app" "http://localhost:8000"
	@mkdocs serve

indexmd:
	@bash scripts/indexmd.sh

view: indexmd serve

install:
	rm -rf $(INSTALLPATH)/$(CMDNAME)
	cp $(PWD)/bin/cheat.sh $(INSTALLPATH)/$(CMDNAME)
	chmod +x $(INSTALLPATH)/$(CMDNAME)
	@echo ""
	@echo "Install Completion. Usage: $(CMDNAME) --help"
