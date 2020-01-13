
COMPILER = gcc
CFLAGS = -Wall
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm -std=c99
OFLAGS = -O3 -funroll-loops

galsim: galsim.o  graphics.o
	$(COMPILER) $(CFLAGS) -o galsim galsim.o graphics.o $(LDFLAGS) 

galsim.o: galsim.c graphics.h
	$(COMPILER) $(CFLAGS) -c galsim.c

graphics.o: graphics.c graphics.h
	$(COMPILER) $(CFLAGS) $(INCLUDES) -c graphics.c

clean:
	rm -f ./galsim *.o