.data
    # create label hello
    hello: .asciiz "Hello World\n"
.text
    main:
        li $v0, 4   # syscall para imprimir string
        la $a0, hello   # carrega a string como argumento
        syscall

        li $v0, 10  # encerra o programa
        syscall
