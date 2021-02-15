DOTFILES_EXCLUDES := .DS_Store .git .gitmodules .travis.yml
DOTFILES_TARGET   := $(wildcard .??*)
# DOTFILES_TARGET   := $(wildcard .??*) bin
DOTFILES_DIR      := $(PWD)
DOTFILES_FILES    := $(filter-out $(DOTFILES_EXCLUDES), $(DOTFILES_TARGET))

deploy:
	@$(foreach val, $(DOTFILES_FILES), ln -sfnv $(abspath $(val)) $(HOME)/$(val);)
	ln -sfnv $(HOME)/.vim $(HOME)/.config/nvim
	ln -sfnv $(HOME)/.vimrc $(HOME)/.config/nvim/init.vim

init:
	@$(foreach val, $(wildcard ./etc/init/*.sh), bash $(val);)
