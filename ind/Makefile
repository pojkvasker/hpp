COMPILER = gcc
CFLAGS = -Wall -fopenmp
INCLUDES=-I/opt/X11/include
LDFLAGS=-L/opt/X11/lib -lX11 -lm -std=c99
OFLAGS = -O2 -march=native


ompquicksort: ompquicksort.o 
	$(COMPILER) $(CFLAGS) -o ompquicksort ompquicksort.o $(LDFLAGS) 
ompquicksort.o : ompquicksort.c 
	$(COMPILER) $(CFLAGS) $(OFLAGS) -c ompquicksort.c
clean:
	rm -f ./ompquicksort *.o