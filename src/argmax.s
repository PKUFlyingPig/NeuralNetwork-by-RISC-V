.globl argmax

.text
# =================================================================
# FUNCTION: Given a int vector, return the index of the largest
#	element. If there are multiple, return the one
#	with the smallest index.
# Arguments:
# 	a0 (int*) is the pointer to the start of the vector
#	a1 (int)  is the # of elements in the vector
# Returns:
#	a0 (int)  is the first index of the largest element
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 77.
# =================================================================
argmax:
	li t0, 1
    ble t0, a1, no_exception
    li a1, 77
    j exit2
no_exception:
    # Prologue
    addi sp, sp, -8
    sw s0, 0(sp)
    sw s1, 4(sp)

    mv s0, zero  # max_index
    lw s1, 0(a0) # max_val
    mv t0, zero  # i = 0
loop_start:
	addi t0, t0, 1
    beq t0, a1, loop_end
	addi a0, a0, 4
    lw t1, 0(a0)
    ble t1, s1, loop_continue
    mv s0, t0
    mv s1, t1
loop_continue:
	j loop_start

loop_end:
    mv a0, s0
    # Epilogue
    lw s0, 0(sp)
    lw s1, 4(sp)
    addi sp, sp, 8
    ret
