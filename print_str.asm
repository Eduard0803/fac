.data
    buffer: .space 255  # define o tamanho da string em 255
    prompt: .asciiz "Input your name(255): "
    endl: .asciiz "\n"
.text
    main:
        la $a0, endl    # carrega o 'endl' como argumento e imprime no console
        jal print_str

        la $a0, prompt    # carrega o 'print_str' como argumento e imprime no console
        jal print_str
        
        li $v0, 8   # syscall para ler a string
        la $a0, buffer  # carrega o 'buffer' como argumento para guardar a string
        li $a1, 255 # define o tamanho maximo da string
        syscall

        la $a0, buffer    # carrega o 'buffer' como argumento e imprime no console
        jal print_str

        la $a0, endl    # carrega o 'endl' como argumento e imprime no console
        jal print_str

        li $v0, 10
        syscall

    print_str:
        li $v0, 4
        syscall
        jr $ra
