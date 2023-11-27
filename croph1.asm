.data
id:             .word 0
name:           .space 50
type:           .space 50
hdate:          .space 50
pdate:          .space 50
description:    .space 200
newline:        .asciiz "\n"

.text
# crop constructor
crop_constructor:
    # Initialize data members
    sw $zero, id          # id = 0
    sw $zero, name        # name = ""
    sw $zero, type        # type = ""
    sw $zero, hdate       # hdate = ""
    sw $zero, pdate       # pdate = ""
    sw $zero, description # description = ""
    jr $ra

# setId function
set_id:
    lw $t0, 0($a0)  # load this->id
    sw $a1, 0($t0)  # store the parameter in this->id
    jr $ra

# setName function
set_name:
    lw $t0, 4($a0)  # load this->name
    
    # Copy the parameter string into this->name
    move $t1, $a1
    la $t2, name
copy_loop_name:
    lb $t3, 0($t1)
    sb $t3, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    bnez $t3, copy_loop_name  # continue until null character

    jr $ra

# setType function
set_type:
    lw $t0, 8($a0)  # load this->type
    
    # Copy the parameter string into this->type
    move $t1, $a1
    la $t2, type
copy_loop_type:
    lb $t3, 0($t1)
    sb $t3, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    bnez $t3, copy_loop_type  # continue until null character

    jr $ra

# setHdate function
set_hdate:
    lw $t0, 12($a0)  # load this->hdate
    
    # Copy the parameter string into this->hdate
    move $t1, $a1
    la $t2, hdate
copy_loop_hdate:
    lb $t3, 0($t1)
    sb $t3, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    bnez $t3, copy_loop_hdate  # continue until null character

    jr $ra

# setPdate function
set_pdate:
    lw $t0, 16($a0)  # load this->pdate
    
    # Copy the parameter string into this->pdate
    move $t1, $a1
    la $t2, pdate
copy_loop_pdate:
    lb $t3, 0($t1)
    sb $t3, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    bnez $t3, copy_loop_pdate  # continue until null character

    jr $ra

# getId function
get_id:
    lw $v0, 0($a0)  # load this->id
    jr $ra

# getName function
get_name:
    la $a0, name  # load the address of this->name
    move $v0, $a0  # return the address of this->name
    jr $ra

# setType function
get_type:
    la $a0, type  # load the address of this->type
    move $v0, $a0  # return the address of this->type
    jr $ra

# setHdate function
get_hdate:
    la $a0, hdate  # load the address of this->hdate
    move $v0, $a0  # return the address of this->hdate
    jr $ra

# setPdate function
get_pdate:
    la $a0, pdate  # load the address of this->pdate
    move $v0, $a0  # return the address of this->pdate
    jr $ra

# seasonal function
seasonal:
    # ...

# menu function
menu:
    # ...

# display function
display:
    # ...



