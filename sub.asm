%include "asm_io.inc"

segment .text
global _calc_sum
_calc_sum:
    enter 4,0
    push ebx
    mov dword [ebp-4], 0 ; sum = 0
    dump_stack 1,2,4
    mov ecx, 1 ; i = 1
    for_loop:
        cmp ecx, [ebp+8] ; compare i with n
        jnle end_for ; if i > n, exit loop
        add [ebp-4], ecx ; sum += i
        inc ecx ; i++
        jmp short for_loop ; repeat loop
    end_for:
        mov ebx, [ebp+12] ; move sum to ebx for return
        mov eax, [ebp-4] ; move sum to eax for return
        mov [ebx], eax ; store sum in the location pointed by ebx
    pop ebx
    leave
    ret


