.data
endl: .asciiz "\n"
cem_double: .double 100.0

.text
    main:
        li $v0, 7
        syscall

        mov.d $f2, $f0

        li $v0, 7
        syscall

        mov.d $f4, $f0

        li $v0, 7
        syscall

        mov.d $f6, $f0

        mov.d $f8, $f2

        l.d $f10, cem_double
        div.d $f4, $f4, $f10
        div.d $f6, $f6, $f10

        mul.d $f4, $f2, $f4
        mul.d $f6, $f2, $f6
        add.d $f8, $f8, $f4
        add.d $f8, $f8, $f6

        li $v0, 3
        mov.d $f12, $f8
        syscall

        li $v0, 4
        la $a0, endl
        syscall

        li $v0, 10
        syscall
