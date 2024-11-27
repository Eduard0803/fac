.text
    main:
        li $v0, 5
        syscall

        move $t0, $v0
        add $t1, $zero, $zero

        li $v0, 5
        syscall

        move $a0, $v0
        addi $t0, $t0, -1

        j scan_n

        scan_n:
            beq $t0, $t1, exit
            addi $t1, $t1, 1

            li $v0, 5
            syscall

            slt $t2, $a0, $v0
            beq $t2, $zero, scan_n

            move $a0, $v0
            j scan_n

        exit:
            li $v0, 1
            syscall

            li $v0, 10
            syscall
