section .data
    plaintext: db 16 dup(0x00)           ; 16-byte plaintext input
    key:       db 16 dup(0x00)           ; 16-byte AES-128 key

section .bss
    round_keys: resb 176                  ; 11 round keys * 16 bytes each = 176 bytes

section .text
    global _start

_start:
    ; Load plaintext into xmm0
    movdqu xmm0, [plaintext]

    ; Load initial key into xmm1
    movdqu xmm1, [key]

    ; Key expansion to fill round_keys (requires aeskeygenassist and XOR operations)
    ; (Key expansion routine not shown here)

    ; Initial AddRoundKey: XOR plaintext with initial key
    pxor xmm0, xmm1

    ; Perform 9 rounds of aesenc with round keys
    ; Example:
    ; movdqu xmm2, [round_keys + 16]  ; round key 1
    ; aesenc xmm0, xmm2
    ; ... repeat for rounds 2 to 9

    ; Final round with aesenclast
    ; movdqu xmm2, [round_keys + 160] ; round key 10
    ; aesenclast xmm0, xmm2

    ; xmm0 now contains the encrypted ciphertext

    ; Exit program (Linux syscall)
    mov eax, 60
    xor edi, edi
    syscall
