.386
.model flat, stdcall
option casemap : none
.data
arr db 5,4,3,2,1,8,9,34,24,56
.code
start:

mov eax,9
xor ebx,ebx
xor edx,edx

main_cycle:
mov cl,arr[ebx]
cmp cl,arr[ebx+1]
jg replace
inc ebx
cmp ebx,eax
jz end_of
jmp main_cycle

replace:
push ebx

rep_cycle:
mov cl,arr[ebx]
cmp cl,arr[ebx+1]
jl rep_cycle_end

;xchg arr[ebx],arr[ebx+1]
mov dl,arr[ebx+1]
mov arr[ebx+1],cl
mov arr[ebx],dl

inc ebx
cmp ebx,eax
jnz rep_cycle

rep_cycle_end:
pop ebx
jmp main_cycle

end_of:

ret
end start
