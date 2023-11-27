.data
    newline:            .asciiz "\n"
    winter_crops_prompt: .asciiz "*************************Harvesting winter Crops*************************\n"
    summer_crops_prompt: .asciiz "*************************Harvesting summer Crops*************************\n"
    done_harvest_prompt: .asciiz "*************************Done with harvesting*************************\n"
    invalid_option_prompt: .asciiz "Invalid option. Please enter 1, 2, or 3.\n"
    winter_crops_label:  .asciiz "*************************_Winter_crops_**************************************\n"
    summer_crops_label:  .asciiz "*************************_Summer_crops_**************************************\n"
    menu_prompt:         .asciiz "####################################_MAIN_####################################\n1. January\n2. February\n3. March\n4. April\n5. May\n6. June\n7. July\n8. August\n9. September\n10. October\n11. November\n12. December\n13. Display Crop status\n0. Exit\nPlease enter the Month: "

    winter_crops: .space 1000  # Adjust the size based on the expected number of winter crops
    summer_crops: .space 1000  # Adjust the size based on the expected number of summer crops

.text
main:
    # Initialize vectors for winter and summer crops
    la $t0, winter_crops
    la $t1, summer_crops

menu:
    # Display menu options
    li $v0, 4
    la $a0, menu_prompt
    syscall

    # Read user input
    li $v0, 5
    syscall
    move $t2, $v0  # Store user input in $t2

    # Selecting the Month
    beq $t2, 0, exit_program
    beq $t2, 13, crop_details
    bgt $t2, 13, menu  # If input is greater than 13, display menu again

    # Planting winter plants (Months 4 and 5)
    bne $t2, 4, not_winter_month
    b planting_winter

not_winter_month:
    # Planting summer plants (Months 8, 9, and 10)
    bne $t2, 8, not_summer_month
    b planting_summer

not_summer_month:
    # Winter harvesting (Months 1, 2, and 3)
    bne $t2, 1, not_winter_harvest
    b harvest_winter

not_winter_harvest:
    # Summer harvesting (Months 11 and 12)
    bne $t2, 11, not_summer_harvest
    b harvest_summer

not_summer_harvest:
    j menu  # Return to the main menu

planting_winter:
    # Call function to plant winter crops
    jal Plant_winter
    j menu

planting_summer:
    # Call function to plant summer crops
    jal Plant_summer
    j menu

harvest_winter:
    # Call function to harvest winter crops
    jal Harvest_winter
    j menu

harvest_summer:
    # Call function to harvest summer crops
    jal Harvest_summer
    j menu

crop_details:
    # Call function to display crop details
    jal Crop_details
    j menu

exit_program:
    # Exit the program
    li $v0, 10
    syscall

# Function to plant winter crops
Plant_winter:
    # Add code to plant winter crops here
    j $ra

# Function to plant summer crops
Plant_summer:
    # Add code to plant summer crops here
    j $ra

# Function to harvest winter crops
Harvest_winter:
    # Add code to harvest winter crops here
    # Display prompt for winter harvesting
    li $v0, 4
    la $a0, winter_crops_prompt
    syscall

    # Display harvested winter crops
    la $t3, winter_crops
    li $t4, 0  # Index for winter crops
    loop_display_winter:
        lw $a0, 0($t3)
        li $v0, 1
        syscall

        # Display newline
        li $v0, 4
        la $a0, newline
        syscall

        # Move to the next crop
        addi $t3, $t3, 4
        addi $t4, $t4, 1
        blt $t4, 10, loop_display_winter

    # Display prompt for completing winter harvesting
    li $v0, 4
    la $a0, done_harvest_prompt
    syscall

    j $ra

# Function to harvest summer crops
Harvest_summer:
    # Add code to harvest summer crops here
    # Display prompt for summer harvesting
    li $v0, 4
    la $a0, summer_crops_prompt
    syscall

    # Display harvested summer crops
    la $t3, summer_crops
    li $t4, 0  # Index for summer crops
    loop_display_summer:
        lw $a0, 0($t3)
        li $v0, 1
        syscall

        # Display newline
        li $v0, 4
        la $a0, newline
        syscall

        # Move to the next crop
        addi $t3, $t3, 4
        addi $t4, $t4, 1
        blt $t4, 10, loop_display_summer

    # Display prompt for completing summer harvesting
    li $v0, 4
    la $a0, done_harvest_prompt
    syscall

    j $ra

# Function to display crop details
Crop_details:
    # Add code to display crop details here
    # Display winter crops label
    li $v0, 4
    la $a0, winter_crops_label
    syscall

    # Display winter crops details
    la $t3, winter_crops
    li $t4, 0  # Index for winter crops
    loop_display_details_winter:
        lw $a0, 0($t3)
        li $v0, 1
        syscall

        # Display newline
        li $v0, 4
        la $a0, newline
        syscall

        # Move to the next crop
        addi $t3, $t3, 4
        addi $t4, $t4, 1
        blt $t4, 10, loop_display_details_winter

    # Display summer crops label
    li $v0, 4
    la $a0
