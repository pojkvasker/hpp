CC	= gcc
CFLAGS    = -g
LIBS = 

quicksort:  helpfncs.o	quicksort.o

	$(CC) $(CFLAGS) -o quicksort quicksort.o  helpfncs.o $(LIBS)

pquicksort: helpfncs.o pquicksort.o

	$(CC) $(CFLAGS) -pthread -o pquicksort pquicksort.o  helpfncs.o $(LIBS)
	
pquicksort.o: pquicksort.c helpfncs.h

	$(CC) $(CFLAGS) -pthread -c pquicksort.c $(LIBS)
openquicksort: helpfncs.o openquicksort.o

	$(CC) $(CFLAGS) -fopenmp -o openquicksort openquicksort.o  helpfncs.o -fopenmp
	
openquicksort.o: openquicksort.c helpfncs.h

	$(CC) $(CFLAGS) -fopenmp -c openquicksort.c $(LIBS)
 
quicksort.o: quicksort.c helpfncs.h

	$(CC) $(CFLAGS) -c quicksort.c $(LIBS)

helpfncs.o: helpfncs.c helpfncs.h

	$(CC) $(CFLAGS) -c helpfncs.c $(LIBS)
clean: 
	rm -f *.o pquicksort openquicksort quicksort