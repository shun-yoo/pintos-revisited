CLEAN_SUBDIRS = src docs/manual tests

all::
	@echo "This makefile has only 'clean' and 'check' targets."

clean::
	for d in $(CLEAN_SUBDIRS); do $(MAKE) -C $$d $@; done

distclean:: clean
	find . -name '*~' -exec rm '{}' \;

check::
	$(MAKE) -C tests $@
