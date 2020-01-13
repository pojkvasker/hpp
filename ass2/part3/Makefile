CC = gcc
CFLAGS = Wall
OBJS =  january.c

all: january

january.o: january.c	
	$(CC) -$(CFLAGS) -c january.c

january: january.o
	$(CC) -$(CFLAGS) $(OBJS) -o january
	
clean: 
	rm -f january january.o