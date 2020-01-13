
COMPILER = gcc
CFLAGS = -Wall
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm
OFLAGS = -O3 -march=native

galsim: galsim.o  graphics.o
	$(COMPILER) $(CFLAGS) -o galsim galsim.o graphics.o $(LDFLAGS) $(OFLAGS)

galsim.o: galsim.c graphics.h
	$(COMPILER) $(CFLAGS) -c galsim.c

graphics.o: graphics.c graphics.h
	$(COMPILER) $(CFLAGS) $(INCLUDES) -c graphics.c

clean:
	rm -f ./galsim *.o