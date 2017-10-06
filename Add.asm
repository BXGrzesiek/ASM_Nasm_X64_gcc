;extern clrscr
extern printf
extern scanf
global main
section .text
 
 
main:
;   call clrscr
; ; wyczyści ekran
;   mov ah,00H
;   mov al,13H
;   int 10h
; wypisze tekst dane autora
    mov rax, 4      ; zapis do pliku
    mov rbx, 1      ; na ekran
    mov rcx, autor      ; napis do wyswielenia: pytanie
    mov rdx, autor_dl   ; dlugosc napisu
    int 80h         ; wyswietlamy
; wypisze zapytanie o pierwszą liczbę
    mov rax, 4      ; zapis do pliku
    mov rbx, 1      ; na ekran
    mov rcx, podaj_1    ; napis do wyswielenia: pytanie
    mov rdx, podaj_1_dl ; dlugosc napisu
    int 80h         ; wyswietlamy
;pobierze wartość do liczba_1
    mov rdi, format
    mov rsi, liczba_1
    xor rax, rax
    call scanf
 
; wypisze zapytanie o drugą liczbę
    mov rax, 4      ; zapis do pliku
    mov rbx, 1      ; na ekran
    mov rcx, podaj_2    ; napis do wyswielenia: pytanie
    mov rdx, podaj_2_dl ; dlugosc napisu
    int 80h         ; wyswietlamy
; pobierze wartość do liczba_2
    mov rdi, format
    mov rsi, liczba_2
    xor rax, rax
    call scanf
 
; dodawanie
    xor rsi, rsi
    mov eax, [liczba_1]
    add eax, [liczba_2]
    mov esi, eax
 
    mov rdi, wynik
    xor rax, rax
    call printf
 
;   xor r10, r10        ; zeruj rejestry pomocnicze
;   xor r11, r11        ; r10 i r11
 
    mov rax, 1
    xor rbx, rbx
    int 80h
   
 
section .data
 
autor       db  "* * * * * * * * * * * * * * * * * * * * *",0Ah,0Ah,"* Autor:       Grzegorz Biskup *",0Ah,0Ah ,"* * * * * * * * * * * * * * * * * * * * *", 0Ah
autor_dl    equ $-autor
 
format      dd  "%d", 0
 
podaj_1     db  "Podaj pierwszą liczbę: ", 0Ah
podaj_1_dl  equ $-podaj_1
 
liczba_1    dd  0
 
podaj_2     db  "Podaj drugą liczbę: ", 0Ah
podaj_2_dl  equ $-podaj_2
 
liczba_2    dd  0
 
wynik       db  "Wynik dodawania:   %d",10,0