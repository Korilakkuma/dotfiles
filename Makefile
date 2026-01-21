DOTFILES_EXCLUDES := .DS_Store .git .gitmodules
DOTFILES_TARGET   := $(wildcard .??*)
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

deploy            :
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)

init              :
	bash ./etc/init/install.sh

maintenance       :
	rm -rf $(HOME)/.npm/_cacache
	command -v brew cleanup           > /dev/null 2>&1 && brew cleanup
	# command -v cargo clean            > /dev/null 2>&1 && cargo clean  # If needed
	command -v docker system prune -f > /dev/null 2>&1 && docker system prune -f

clean             :
	@$(foreach val, $(DOTFILES_FILES), if [ -L $(HOME)/$(val) ]; then rm -rf $(HOME)/$(val); fi;)

help              :
	@echo "make clean         -- Remove Symbolic links to dotfiles from home directory --"
	@echo "make deploy        -- Create Symbolic links to dotfiles at home directory --"
	@echo "make init          -- Install package manager, packages and applications every OS (macOS, Linux, Windows) --"
	@echo "make maintenance   -- Increase empty capacity on SSD by removing cache files ... etc --"
