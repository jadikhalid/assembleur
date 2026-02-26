%include "asm_io.inc"

segment .data
sum dd 0

segment .bss
input resd 1

; algorithme en pseudo-code
; i = 1
; sum = 0
; while(get_int(i,&input), input != 0) {
;  sum += input;
;  i++;
; }
; print_sum(sum);

segment .text
  global  _asm_main
_asm_main:
  enter   0,0
  pusha

  mov edx, 1

while_loop:
  push edx
  push dword input
  call get_int
  add esp, 8

  mov eax, [input]
  cmp eax, 0
  je end_while

  add [sum], eax

  inc edx
  jmp short while_loop
  
  end_while:
  push dword [sum]
  call print_sum
  pop ecx

  popa
  leave
  ret

  ; sous-programme get_int
  ; Paramètres dans l'ordre de l'empliment
  ; le nombre de saises (en [ebp + 12])
  ; adresse du mot oû stocker la saisie (en [ebp + 8])
  ;Notes :
  ; les valeurs de eax et ebx sont détruites

  segment .data
  prompt db "Enter a number (0 to stop): ", 0

  segment .text
  get_int:
  push ebp
  mov ebp, esp

  mov eax, [ebp + 12] ; nombre de saisies
  call print_int

  mov eax, prompt
  call print_string

  call read_int
  mov ebx,[ebp + 8] ; adresse de stockage
  mov [ebx], eax ; stocker la saisie

  pop ebp
  ret

; sous-programme print_sum
; affiche la somme des nombres saisis
; somme à afficher (en [ebp + 8])
; Notes : détruit la valeur de eax

  segment .data
  result db "The sum is: ", 0

  segment .text
  print_sum:
  push ebp
  mov ebp, esp

  mov eax, result
  call print_string

  mov eax, [ebp + 8]
  call print_int
  call print_nl

  pop ebp
  