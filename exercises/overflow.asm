.data
    endl: .asciiz "\n"
    aviso_overflow: .asciiz "overflow\n"

.text
    main:
        li $v0, 5
        syscall

        move $t0, $v0

        li $v0, 5
        syscall

        move $s0, $v0

        li $v0, 5
        syscall

        move $s1, $v0

        beqz $t0, sem_sinal
        j com_sinal

    sem_sinal:
        addu $s2, $s0, $s1
        nor $t1, $s1, $zero
        sltu $t1, $t1, $s0

        bne $t1, $zero, erro_overflow
        j resultado

    com_sinal:
        addu $s2, $s0, $s1
        xor $t1, $s0, $s1
        slt $t1, $t1, $zero
        bne $t1, $zero, resultado

        xor $t1, $s2, $s0
        slt $t1, $t1, $zero
        bne $t1, $zero, erro_overflow

        j resultado

    erro_overflow:
        li $v0, 4
        la $a0, aviso_overflow
        syscall

        j fim

    resultado:
        move $a0, $s2
        li $v0, 1
        syscall

        la $a0, endl
        li $v0, 4
        syscall

        j fim

    fim:
        li $v0, 10
        syscall
