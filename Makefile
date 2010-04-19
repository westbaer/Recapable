ifeq ($(shell [ -f ./framework/makefiles/common.mk ] && echo 1 || echo 0),0)
all clean package install::
	git submodule update --init --recursive
	$(MAKE) $(MAKEFLAGS) MAKELEVEL=0 $@
else

include framework/makefiles/common.mk

SUBPROJECTS = extension app

include framework/makefiles/aggregate.mk

endif
