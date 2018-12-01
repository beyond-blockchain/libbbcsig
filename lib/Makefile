CC = gcc
OPENSSL_DIR=../openssl
INCS = -I$(OPENSSL_DIR)/include -I$(OPENSSL_DIR)
LIBS = $(OPENSSL_DIR)/libssl.a $(OPENSSL_DIR)/libcrypto.a

UNAME := $(shell uname)
ifeq ($(UNAME),Darwin)
LFLAGS0 = 
LFLAGS1 = 
LFLAGS2 =
TARGET = libbbcsig.dylib
else
LFLAGS0 = -fPIC
LFLAGS1 = -Wl,--whole-archive
LFLAGS2 = -Wl,--no-whole-archive
TARGET = libbbcsig.so
endif

.c.o:
	$(CC) $(INCS) $(LFLAGS0) -c $<

all:
	make $(TARGET)

libbbcsig.so:	libbbcsig.o
	gcc -shared -o $@ $(LFLAGS1) $(LIBS) $(LFLAGS2) $<
	make libbbcsig.a

libbbcsig.dylib:	libbbcsig.o
	gcc -shared -o $@ $(LFLAGS1) $(LIBS) $(LFLAGS2) $<
	make libbbcsig.a

libbbcsig.a:    libbbcsig.o
	@if [ "$(UNAME)" = "Darwin" ]; then \
	    libtool -o $@ $(LIBS) $<; \
	else \
	    rm -f $@ libbbc1.a && \
	    ar rcs libbbc1.a $< && \
	    ar cqT $@ $< $(LIBS) && \
	    bash -c "echo -n -e \"create $@\naddlib libbbc1.a\naddlib $(OPENSSL_DIR)/libssl.a\naddlib $(OPENSSL_DIR)/libcrypto.a\nsave\nend\" | ar -M" && \
	    rm -f libbbc1.a; \
	fi

openssl:
	cd $(OPENSSL_DIR) && ./config && make

clean:
	rm -f libbbcsig.so libbbcsig.dylib libbbcsig.o libbbcsig.a

