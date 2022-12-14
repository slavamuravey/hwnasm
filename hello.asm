        global  _start    
        
        section .text
_start:
main:
        mov     esi, hello_msg
        xor     eax, eax
        xor     ebx, ebx
lp:     mov     bl, [esi + ecx]      
        cmp     bl, 0
        je      lpquit
        push    ebx
        inc     ecx
        jmp     lp
lpquit: jecxz   done
        mov     edi, esi
lp2:    pop     ebx
        mov     [edi], bl
        inc     edi
        loop    lp2
done:   
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
