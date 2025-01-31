.data
zero_float: .float 0.0
newline: .asciiz "\n"

.text
    main:
        li $v0, 5
        syscall

        move $t0, $v0

        l.s $f1, zero_float
        l.s $f2, zero_float

        li $t1, 0

        j ciclo
    ciclo:
        beq $t1, $t0, fim_ciclo

        li $v0, 6
        syscall

        mov.s $f3, $f0

        li $v0, 6
        syscall

        mov.s $f4, $f0

        mul.s $f5, $f3, $f4
        add.s $f1, $f1, $f5
        add.s $f2, $f2, $f3

        addi $t1, $t1, 1

        j ciclo

    fim_ciclo:
        div.s $f12, $f1, $f2

        li $v0, 2
        syscall

        li $v0, 4
        la $a0, newline
        syscall

        li $v0, 10
        syscall
