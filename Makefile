all:
	@echo "Hello $(LOGNAME), please run make setup"

setup:
	bundle
	rake db:setup
