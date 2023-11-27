.data
admin_id:       .word 0
admin_name:     .space 50
admin_gender:   .space 10
admin_dob:      .space 20
newline:        .asciiz "\n"

.text
# admin constructor
admin_constructor:
    # Initialize data members
    sw $zero, admin_id        # id = 0
    sw $zero, admin_name      # name = ""
    sw $zero, admin_gender    # gender = ""
    sw $zero, admin_dob       # dob = ""
    jr $ra

# setID function
admin_setID:
    lw $t0, admin_id($a0)  # load this->id
    sw $a1, 0($t0)          # store the parameter in this->id
    jr $ra

# setName function
admin_setName:
    lw $t0, admin_name($a0)  # load this->name
    
    # Copy the parameter string into this->name
    move $t1, $a1
    la $t2, admin_name
admin_copy_loop_name:
    lb $t3, 0($t1)
    sb $t3, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    bnez $t3, admin_copy_loop_name  # continue until null character

    jr $ra

# setGender function
admin_setGender:
    lw $t0, admin_gender($a0)  # load this->gender
    
    # Copy the parameter string into this->gender
    move $t1, $a1
    la $t2, admin_gender
admin_copy_loop_gender:
    lb $t3, 0($t1)
    sb $t3, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    bnez $t3, admin_copy_loop_gender  # continue until null character

    jr $ra

# setDOB function
admin_setDOB:
    lw $t0, admin_dob($a0)  # load this->dob
    
    # Copy the parameter string into this->dob
    move $t1, $a1
    la $t2, admin_dob
admin_copy_loop_dob:
    lb $t3, 0($t1)
    sb $t3, 0($t0)
    addi $t0, $t0, 1
    addi $t1, $t1, 1
    bnez $t3, admin_copy_loop_dob  # continue until null character

    jr $ra

# getID function
admin_getID:
    lw $v0, admin_id($a0)  # load this->id
    jr $ra

# getName function
admin_getName:
    la $a0, admin_name  # load the address of this->name
    move $v0, $a0        # return the address of this->name
    jr $ra

# getGender function
admin_getGender:
    la $a0, admin_gender  # load the address of this->gender
    move $v0, $a0          # return the address of this->gender
    jr $ra

# getDOB function
admin_getDOB:
    la $a0, admin_dob  # load the address of this->dob
    move $v0, $a0       # return the address of this->dob
    jr $ra

# adminMenu function
admin_adminMenu:
    # ...

# display function
admin_display:
    # ...

