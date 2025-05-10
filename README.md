# AES-encryption-in-assembler
A program in x86-64 assembler that encrypts the given text using the AES hardware instructions available on modern processors (Intel/AMD)
The program uses the AES-NI instructions: aesenc, aesenclast and aeskeygenassist to perform full AES-128 encryption.

AES Encryption Using AES-NI in x86-64 Assembly
Key Points
AES operates on 128-bit (16-byte) blocks.

AES-128 uses 10 rounds: 9 rounds with aesenc and 1 final round with aesenclast.

Key expansion (key schedule) is done using aeskeygenassist.

Data and keys are processed in 128-bit XMM registers.

The plaintext and key must be loaded into XMM registers before encryption.

General Workflow
Load the 16-byte plaintext into xmm0.

Load the 16-byte AES-128 key into xmm1.

Perform key expansion to generate 11 round keys (initial key + 10 round keys).

XOR the plaintext with the initial key (AddRoundKey).

Perform 9 rounds of aesenc with the round keys.

Perform the final round with aesenclast.

The encrypted ciphertext will be in xmm0.


Notes
The key expansion step is essential and involves using the aeskeygenassist instruction along with XOR and byte shuffling to generate all round keys.

AES-NI instructions require CPU support (Intel Sandy Bridge or newer, AMD Bulldozer or newer).

This example is a skeleton to demonstrate usage of AES-NI instructions; a full implementation requires completing the key expansion and handling input/output properly.

Summary
To implement AES-128 encryption in assembly with AES-NI:

Use aeskeygenassist to generate round keys.

XOR plaintext with the initial key.

Execute 9 rounds of aesenc.

Execute 1 final round of aesenclast.

Process data in XMM registers for maximum performance.
