global _start
section .text
; program pytający o imię użytkownika
; wyswietlający powitanie wykorzystując pobrane imie
; 'jak sie nazywasz?'
; 'imie'
; 'czesc imie'
; _koniec
_start:
 
    mov rax, 4              ; zapis do pliku
    mov rbx, 1              ; na ekran
    mov rcx, jak_masz       ; napis do wyswielenia: pytanie
    mov rdx, jak_masz_dl    ; dlugosc napisu
    int 80h                 ; wyswietlamy
 
    mov rax, 3              ; czytanie z pliku
    mov rbx, 0              ; z klawiatury
    mov rcx, imie           ; dokąd czytać?
    mov rdx, imie_dl        ; ile bajtów czytać?
    int 80h                 ; wczytujemy
 
    mov rax, 4              ; zapis do pliku
    mov rbx, 1              ; na ekran
    mov rcx, czesc          ; napis do wyswietlenia "Czesc"
    mov rdx, czesc_dl       ; dlugosc napisu
    int 80h                 ;wyświetlamy
 
    mov rax, 4              ; zapis do pliku
    mov rbx, 1              ; na ekran
    mov rcx, imie           ; napis do wyświetlenia
    mov rdx, imie_dl        ; dlugość napisu
    int 80h                 ; wyświetlamy
 
    jmp _koniec
 
_koniec:
    mov rax, 1
    xor rbx, rbx
    int 80h
     
 
section .data
 
jak_masz    db  "Jak masz na imie? ", 0Ah
jak_masz_dl equ $-jak_masz
; rezerwuj 20 bajtów o wartośći początkowej zero, na imie
imie:       times 20 db 0
imie_dl     equ $ - imie
 
czesc       db  "cześć "
czesc_dl    equ $ - czesc