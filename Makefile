all: clean hello
	@./hello

hello: clean_hello hello.o
	@echo "+ $@"	
	@ld -m elf_i386 hello.o -o hello

hello.o: hello.asm
	@echo "+ $@"
	@nasm -felf hello.asm -o hello.o

hello_debug: clean_hello_debug hello_debug.o
	@echo "+ $@"	
	@ld -m elf_i386 hello_debug.o -o hello_debug

hello_debug.o: hello.asm
	@echo "+ $@"
	@nasm -g -felf hello.asm -o hello_debug.o

debug: hello_debug
	@echo "+ $@"
	gdb -x hello.gdb

.PHONY: clean
clean: clean_hello clean_hello_debug
	@echo "+ $@"

.PHONY: clean_hello
clean_hello:
	@echo "+ $@"
	@rm -f hello hello.o

.PHONY: clean_hello_debug
clean_hello_debug:
	@echo "+ $@"
	@rm -f hello_debug hello_debug.o
