.data
    caractere_C:     .byte 'C'
    caractere_F:     .byte 'F'
    caractere_K:     .byte 'K'
    constantes_F:  .float 5.0, 9.0, 32.0
    constantes_C:  .float 273.15
    endl:     .asciiz "\n"

.text
    main:
        li      $v0,        12
        syscall 
        move    $t0,        $v0

        li      $v0,        12
        syscall 

        li      $v0,        12
        syscall 
        move    $t1,        $v0

        li      $v0,        12
        syscall 

        li      $v0,        6
        syscall 

    verifica_entrada:
        lb      $s0,        caractere_C
        beq     $t0,        $s0,    converte_C

        lb      $s0,        caractere_F
        beq     $t0,        $s0,    converte_F

    converte_K:
        lb      $s0,        caractere_C
        beq     $t1,        $s0,    K_para_C

    K_para_F:
        lwc1    $f2,        constantes_C
        sub.s   $f0,        $f0,    $f2
        j       C_para_F

    K_para_C:
        lwc1    $f2,        constantes_C
        sub.s   $f0,        $f0,    $f2
        j       finalizar

    converte_C:
        lb      $s0,        caractere_F
        beq     $t1,        $s0,    C_para_F

    C_para_K:
        lwc1    $f2,        constantes_C
        add.s   $f0,        $f0,    $f2
        j       finalizar

    C_para_F:
        la      $t3,        constantes_F
        lwc1    $f2,        0($t3)
        lwc1    $f3,        4($t3)
        lwc1    $f4,        8($t3)

        div.s   $f1,        $f3,    $f2
        mul.s   $f1,        $f1,    $f0
        add.s   $f0,        $f1,    $f4
        j       finalizar

    converte_F:
        lb      $s0,        caractere_C
        beq     $t1,        $s0,    F_para_C

    F_para_K:
        la      $t3,        constantes_F
        lwc1    $f2,        0($t3)
        lwc1    $f3,        4($t3)
        lwc1    $f4,        8($t3)

        div.s   $f1,        $f2,    $f3
        sub.s   $f0,        $f0,    $f4
        mul.s   $f0,        $f0,    $f1
        lwc1    $f2,        constantes_C
        add.s   $f0,        $f0,    $f2
        j       finalizar

    F_para_C:
        la      $t3,        constantes_F
        lwc1    $f2,        0($t3)
        lwc1    $f3,        4($t3)
        lwc1    $f4,        8($t3)

        div.s   $f1,        $f2,    $f3
        sub.s   $f0,        $f0,    $f4
        mul.s   $f0,        $f0,    $f1
        j       finalizar

    finalizar:
        li      $v0,        2
        mov.s   $f12,       $f0
        syscall 

        li      $v0,        4
        la      $a0,        endl
        syscall 

        li      $v0,        10
        syscall
