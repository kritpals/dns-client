CC = gcc
CFLAGS = -g -Wall

objects = client.o dns_c.h socket_utils.o constructor.o c_utils.o parser.o


build: shell_lib.a
	$(CC) $(CFLAGS) -o client client.c dns_client.a

shell_lib.a: $(objects)
	ar -r dns_client.a $(objects)


test: build
	./client www.google.com

clean:
	rm client
	rm -f *.o
	rm -f dns_client.a
