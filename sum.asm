.data
    endl: .asciiz "\n"
.text
    main:
        li $v0, 5   # ler um int e armazena em v0
        syscall

        # move o valor de v0 para s0
        move $s0, $v0   # ou addi $s0, $v0, $zero

        li $v0, 5   # ler um int a armazena em v0
        syscall

        add $a0, $s0, $v0   # soma s0 e v0 e armazena em a0
        li $v0, 1   # imprime o resultado na tela
        syscall

        li $v0, 4   # syscall para imprimir string
        la $a0, endl    # carrega a string como argumento
        syscall
