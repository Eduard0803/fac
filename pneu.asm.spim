.data
    endl: .asciiz "\n"
.text
    main:
        li $v0, 5
        syscall

        move $s0, $v0

        li $v0, 5
        syscall

        sub $a0, $s0, $v0
        li $v0, 1
        syscall

        li $v0, 4
        la $a0, endl
        syscall
