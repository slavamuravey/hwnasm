        global  _start    
        
        section .text
_start:
main:
        mov     eax, 4
        mov     ebx, 1
        mov     ecx, hello_msg
        mov     edx, hello_len
        int     0x80
        mov     eax, 1
        mov     ebx, 0
        int     0x80

        section .data
hello_msg:
        db      "Hello, world", 10
hello_len: equ $-hello_msg
