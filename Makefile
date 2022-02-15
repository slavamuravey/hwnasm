all: clean hello
	@./hello

hello: hello.o
	@echo "+ $@"	
	@ld hello.o -o hello

hello.o: hello.asm
	@echo "+ $@"
	@nasm -felf64 hello.asm -o hello.o

.PHONY: clean
clean:
	@echo "+ $@"
	@rm -f hello a.out *.o