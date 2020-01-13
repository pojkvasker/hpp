CC = gcc
CFLAGS = Wall
OBJS =  readfile.c

readfile.o: readfile.c	
	$(CC) -$(CFLAGS) -c readfile.c

readfile: readfile.o
	$(CC) -$(CFLAGS) $(OBJS) -o readfile
	
clean: 
	rm -f readfile readfile.o