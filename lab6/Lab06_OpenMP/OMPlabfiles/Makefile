CC	= gcc
CFLAGS    =  -O3 -fopenmp

helloworld:	helloworld.c
	$(CC) $(CFLAGS) -o helloworld helloworld.c $(LIBS)

datasharing:	datasharing.c
	$(CC) $(CFLAGS) -o datasharing datasharing.c $(LIBS)

loop:	loop.c 
	$(CC) $(CFLAGS) -o loop loop.c $(LIBS)

reduce:	reduce.c
	$(CC) $(CFLAGS) -o reduce reduce.c $(LIBS)

pi:	pi.c
	$(CC) $(CFLAGS) -o pi pi.c $(LIBS)

enumsort:	enumsort.c
	$(CC) $(CFLAGS) -o enumsort enumsort.c $(LIBS)

lu: lu.c 
	$(CC) $(CFLAGS) -o lu lu.c $(LIBS)

clean: 
	rm -f *.o lu enumsort pi reduce loop datasharing helloworld
