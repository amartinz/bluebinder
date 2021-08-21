# TODO: this is a bit minimalistic isn't it?

DESTDIR ?= /

build:
	gcc -Wall -O3 -flto bluebinder.c \
		`pkg-config --cflags glib-2.0` `pkg-config --libs glib-2.0` \
		`pkg-config --cflags libgbinder` `pkg-config --libs libgbinder` -o bluebinder

install:
	mkdir -p $(DESTDIR)/usr/sbin
	cp bluebinder $(DESTDIR)/usr/sbin

clean:
	if test -a "bluebinder"; then rm bluebinder; fi;

