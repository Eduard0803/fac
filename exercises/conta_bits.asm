.text
    main:
        li $t3, 1
        add $t1, $zero, $zero # contador loop

        li $v0, 5
        syscall
        
        move $a0, $v0
        add $v0, $zero, $zero

        contaBits:

            and $t0, $t3, $a0

            srl $a0, $a0, 1
            
            add $v0, $v0, $t0

            addi $t1, $t1, 1

            bne $t1, 32, contaBits
        
        exit:
            move $a0, $v0
            li $v0, 1
            syscall

            li $v0, 10
            syscall
