.text
    main:
        addi $t1, $zero, 1

        li $v0, 5
        syscall
        move $t0, $v0

        li $v0, 5
        syscall
        move $t2, $v0

        sllv $t1, $t1, $t2

        div $t0, $t1

        mfhi $a0

        li $v0, 1
        syscall

        li $v0, 10
        syscall
