ifeq ($(OS),Windows_NT)
all:
	$(MAKE) -f Makefile.win
clean:
	$(MAKE) -f Makefile.win clean
install:
	$(MAKE) -f Makefile.win install
else

UNAME_S := $(shell uname -s)

all:
ifeq ($(UNAME_S), Darwin)
	$(MAKE) -f Makefile.other
endif
ifeq ($(UNAME_S), Linux)
	$(MAKE) -f Makefile.other
endif

clean:
ifeq ($(UNAME_S), Darwin)
	$(MAKE) -f Makefile.other clean
endif
ifeq ($(UNAME_S), Linux)
	$(MAKE) -f Makefile.other clean
endif

install:
ifeq ($(UNAME_S), Darwin)
	$(MAKE) -f Makefile.other install
endif
ifeq ($(UNAME_S), Linux)
	$(MAKE) -f Makefile.other install
endif

endif