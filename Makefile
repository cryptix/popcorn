#CC=clang
CFLAGS=-Wall -Wextra -pedantic -std=c89
CFLAGS+=-ggdb3

#JackOSX
export PKG_CONFIG_PATH=/usr/local/lib/pkgconfig

CFLAGS+=`pkg-config --cflags json jack` -I. -Iconfiguration
LIBS+=`pkg-config --libs json jack` -lm


SRC+=configuration/routing.c
SRC+=configuration/json.c
SRC+=configuration/hash.c
SRC+=configuration/cJSON.c

SRC+=processing/misc.c
SRC+=processing/oscillators.c
SRC+=processing/tools.c
SRC+=processing/effects.c
SRC+=processing/voices.c
SRC+=processing/compute.c

SRC+=jack.c
SRC+=main.c

OBJS=$(SRC:.c=.o)

popcorn: $(OBJS)
	$(CC) $(CLFAGS) $(LDFLAGS) $(OBJS) $(LIBS) -o $@

clean:
	rm -f $(OBJS) popcorn
