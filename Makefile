# TODO: this is a bit minimalistic isn't it?

USE_SYSTEMD ?= 1

build:
	gcc -Wall -O3 -flto bluebinder.c `pkg-config --cflags libgbinder` `pkg-config --libs libgbinder` -o bluebinder

build: bluebinder

bluebinder: bluebinder.c
	gcc $(CFLAGS) -Wall -flto $^ `pkg-config --cflags --libs $(DEPEND_LIBS)` -DUSE_SYSTEMD=$(USE_SYSTEMD) -o $@

install:
	mkdir -p $(DESTDIR)/usr/sbin
	cp bluebinder $(DESTDIR)/usr/sbin

clean:
	if test -a "bluebinder"; then rm bluebinder; fi;

