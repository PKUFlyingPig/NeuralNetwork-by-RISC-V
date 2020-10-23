.globl relu

.text
# ==============================================================================
# FUNCTION: Performs an inplace element-wise ReLU on an array of ints
# Arguments:
# 	a0 (int*) is the pointer to the array
#	a1 (int)  is the # of elements in the array
# Returns:
#	None
# Exceptions:
# - If the length of the vector is less than 1,
#   this function terminates the program with error code 78.
# ==============================================================================
relu:
	# check if the length is positive
    li t0, 1
    ble t0, a1, no_exception
    li a1, 78
    j exit2
no_exception:
	add t0, x0, x0 # i = 0
loop_start:
    lw t1, 0(a0) # t1 = a[i]
    bge t1, zero, loop_continue
	sw x0, 0(a0)
loop_continue:
	addi a0, a0, 4
	addi t0, t0, 1
    beq t0, a1, loop_end
	j loop_start
loop_end:  
	ret
