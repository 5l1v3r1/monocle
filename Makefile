GCC=			/usr/bin/gcc

EXEC=   		monocle

S=			./src/

CSOURCE=		$(S)main.c			\
			$(S)mem.c			\
			$(S)error.c			\
			$(S)netconf.c			\
			$(S)socket.c


OBJS=			$(CSOURCE:.c=.o)

CFLAGS=			-g -O0 -I src/ -Wall -W
LDFLAGS=

all: 			$(OBJS) $(EXEC)

$(EXEC):
			$(GCC) -o $@ $(OBJS) $(CFLAGS) $(LDFLAGS)

.c.o:
			$(GCC) $(CFLAGS) $(LDFLAGS) -o $@ -c $<

.PHONY: install clean distclean uninstall

install:
	cp $(EXEC) /usr/local/bin/

clean:
	@rm ./src/*.o

distclean:
	@rm $(EXEC)

uninstall:
	@rm /usr/bin/$(EXEC)
