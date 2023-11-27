.data
     number: .word 0 # for storing 11 12 and 13
    name_prompt:           .asciiz "Enter the crop name: "
    yield_prompt:          .asciiz "Enter the crop yield: "
    month_prompt:   .asciiz "Please enter the Month(1 to 12): "
    winter_crop_prompt:    .asciiz "Which plants do you want to plant\n1.Wheat\n2.Peas\n3.Potatoes\n"
     summer_crop_prompt:    .asciiz "Which plants do you want to plant\n1.Maize\n2.Beans\n3.pumpkin\n4.sorghum\n5.watermelon\n6.groundnuts\n"
    soil_fertility_prompt: .asciiz "What is the Soil Fertility(low,medium,high): "
    moisture_level_prompt:  .asciiz "What is the Moisture Level(low,medium,high): "
    winter_harvest_prompt:   .asciiz "Press 1 to Harvest winter plants: "
    summer_harvest_prompt:   .asciiz "Press 1 to Harvest summer plants: "
    done_harvesting:  .asciiz "*************************Done with harvesting********************\n"
    invalid_option:   .asciiz "Invalid option. Please enter 1, 2, or 3."
    winter_harvesting_heading:  .asciiz"************************************Winter Harvesting************************************\n" 
    summer_harvesting_heading:  .asciiz"************************************Summer Harvesting************************************\n" 

    winter_crop_heading: .asciiz "*********************Winter Crops*********************\n"
    summer_crops_heading: .asciiz "*********************Summer Crops*********************\n"
    crop_status_heading: .asciiz "*************************_Crop Status_**************************************\n"
    
     wheat_str: .asciiz "Wheat"
    peas_str:  .asciiz "Peas"
    potatoes_str: .asciiz "Potatoes"
    maize_str: .asciiz "maize"
    beans_str: .asciiz "beans"
    pumpkin_str: .asciiz "pumpkin"
    sorghum_str: .asciiz "sorghum"
    watermelon_str: .asciiz "watermelon"
    groundnuts_str: .asciiz "groundnuts"

.text
    .globl main

main:
    li $t6, 0  # date_month
    li $t7, 0  # action_harvest

main_loop:
    # Display month options
    la $a0, month_prompt
    li $v0, 4
    syscall

    # Read user input for month
    li $v0, 5
    syscall
    move $t6, $v0
    sw $t0,number

    # planting winter plants
    beq $t6, 4, plant_winter
    beq $t6, 5, plant_winter

    # planting summer plants
    beq $t6, 8, plant_summer
    beq $t6, 9, plant_summer
    beq $t6, 10, plant_summer

    # winter harvesting
    beq $t6, 1, harvest_winter
    beq $t6, 2, harvest_winter
    beq $t6, 3, harvest_winter

    # summer harvesting
    beq $t6, 11, harvest_summer
    beq $t6, 12, harvest_summer

    # Displaying Crop status
    beq $t6, 13, crop_details

    # Exit the program
    beq $t6, 0, exit_program

    j main_loop

plant_winter:
    li $v0, 4
    la $a0,  winter_crop_prompt
    syscall

    # Read user input for crop to plant
    li $v0, 5
    syscall
    move $t0, $v0

    # initializing crops
    la $t1, winter_crops
    li $t2, 0  # crop index
    
    
    # Map user input to crop names
    beq $t0, 1, plant_wheat
    beq $t0, 2, plant_peas
    beq $t0, 3, plant_potatoes
    #j invalid_option  # Jump to invalid_option if input is not 1, 2, or 3

plant_wheat:
    # Set the crop name to Wheat
    la $a0, winter_crops  # Address of the winter_crops array
    li $v0, 4
    la $a1,  wheat_str  # The name "Wheat"
    syscall
    j winter_crops_other_inputs

plant_peas:
    # Set the crop name to Peas
    la $a0, winter_crops  # Address of the name field in the array
    li $v0, 4
    la $a1, peas_str  # The name "Peas"
    syscall
     j winter_crops_other_inputs
plant_potatoes:
    # Set the crop name to Potatoes
    la $a0, winter_crops  # Address of the name field in the array
    li $v0, 4
    la $a1, potatoes_str  # The name "Potatoes"
    syscall
    
winter_crops_other_inputs:
     # Read user input for soil fertility
    li $v0, 4
    la $a0, soil_fertility_prompt
    syscall

    li $v0, 8
    la $a0, winter_crops + 8  # Address of the soil_fertility field in the array
    li $a1, 16                # Maximum length of the input string
    syscall

 # Read user input for moisture level
    li $v0, 4
    la $a0, moisture_level_prompt
    syscall

    li $v0, 8
    la $a0, winter_crops + 12  # Address of the moisture_level field in the array
    li $a1, 16                 # Maximum length of the input string
    syscall

    # Increment the index for the next crop
    addi $t2, $t2, 4

    j main_loop

plant_summer:
        li $v0, 4
    la $a0,  summer_crop_prompt
    syscall

    # Read user input for crop to plant
    li $v0, 5
    syscall
    move $t0, $v0

    # initializing crops
    la $t1, summer_crops
    li $t2, 0  # crop index

     # Map user input to crop names
    beq $t0, 1, plant_maize
    beq $t0, 2, plant_beans
    beq $t0, 3, plant_pumpkin
    beq $t0, 4, plant_sorghum
    beq $t0, 5, plant_watermelon
    beq $t0, 6, plant_groundnuts
    #j invalid_option  # Jump to invalid_option if input is not 1, 2, or 3

plant_maize:
    # Set the crop name to Wheat
    la $a0, summer_crops  # Address of the winter_crops array
    li $v0, 4
    la $a1,  maize_str  # The name "Wheat"
    syscall
    j summer_crops_other_inputs

 plant_beans:
    # Set the crop name to Peas
    la $a0, summer_crops  # Address of the name field in the array
    li $v0, 4
    la $a1, peas_str  # The name "Peas"
    syscall
     j  summer_crops_other_inputs
plant_pumpkin:
    # Set the crop name to Potatoes
    la $a0, summer_crops  # Address of the name field in the array
    li $v0, 4
    la $a1, pumpkin_str  # The name "Potatoes"
    syscall
    j summer_crops_other_inputs
plant_sorghum:
    # Set the crop name to Potatoes
    la $a0, summer_crops  # Address of the name field in the array
    li $v0, 4
    la $a1, sorghum_str  # The name "Potatoes"
    syscall
    j summer_crops_other_inputs
plant_watermelon:
    # Set the crop name to Potatoes
    la $a0, summer_crops  # Address of the name field in the array
    li $v0, 4
    la $a1, watermelon_str  # The name "Potatoes"
    syscall
    j summer_crops_other_inputs
plant_groundnuts:
    # Set the crop name to Potatoes
    la $a0, summer_crops  # Address of the name field in the array
    li $v0, 4
    la $a1, groundnuts_str  # The name "Potatoes"
    syscall  
    
summer_crops_other_inputs :
# Read user input for soil fertility
    li $v0, 4
    la $a0, soil_fertility_prompt
    syscall

    li $v0, 8
    la $a0, winter_crops + 8  # Address of the soil_fertility field in the array
    li $a1, 16                # Maximum length of the input string
    syscall
     
 # Read user input for moisture level
    li $v0, 4
    la $a0, moisture_level_prompt
    syscall

    li $v0, 8
    la $a0, winter_crops + 12  # Address of the moisture_level field in the array
    li $a1, 16                 # Maximum length of the input string
    syscall

    # Increment the index for the next crop
    addi $t2, $t2, 4
        
    j main_loop

harvest_winter:
    # winter harvesting heading
         li $v0, 4
    la $a0,  summer_harvesting_heading
    
    # winter harvest crops display
    crop_details:
    # Display header for Winter crops
    li $v0, 4
    la $a0, winter_crop_heading
    syscall

    la $t1, winter_crops  # Address of the winter_crops array
    li $t2, 0             # crop index

    display_crops_loop:
    # Check if we have reached the end of the array
    bge $t2, 4, main_loop

    # Display crop details
    li $v0, 4
    lw $a0, 0($t1)  # Display crop name
    syscall

    li $v0, 4
    la $a0, winter_crops + 4  # Display crop yield
    syscall

    li $v0, 4
    la $a0, winter_crops + 8  # Display crop soil_fertility
    syscall

    li $v0, 4
    la $a0, winter_crops + 12  # Display crop moisture_level
    syscall

    # Move to the next crop
    addi $t1, $t1, 16  # Move to the next crop entry
    addi $t2, $t2, 4   # Increment the index

    j display_crops_loop
    
    # harvesting prompt
      li $v0, 4
    la $a0,  winter_harvest_prompt  # press one to harvest
    syscall
    
     # Read user input for harvesting
    li $v0, 5
    syscall
    move $t0, $v0
    
    beq $t0, 1, plant_summer  # if harvest then calculate the yield

harvest_summer:
    # summer harvesting heading
         li $v0, 4
    la $a0,  summer_harvesting_heading
    
    display_crops_loop1:
    # Check if we have reached the end of the array
    bge $t2, 4, main_loop

    # Display crop details
    li $v0, 4
    la $a0, 0($t1)  # Display crop name
    syscall

    li $v0, 4
    la $a0, summer_crops + 4  # Display crop yield
    syscall

    li $v0, 4
    la $a0, summer_crops + 8  # Display crop soil_fertility
    syscall

    li $v0, 4
    la $a0, summer_crops + 12  # Display crop moisture_level
    syscall

    # Move to the next crop
    addi $t1, $t1, 16  # Move to the next crop entry
    addi $t2, $t2, 4   # Increment the index

    j display_crops_loop1
    
    # harvesting prompt
      li $v0, 4
    la $a0,  summer_harvest_prompt 
    syscall
    
     # Read user input for harvesting
    li $v0, 5
    syscall
    move $t0, $v0
    
    beq $t0, 1, plant_summer  # if harvest then calculate the yield

#crop_details:
    # Similar to plant_winter, implement the logic here

exit_program:
    li $v0, 10
    syscall

.data
    winter_crops: .space 16  # Assuming each crop has 4 words of data (name, yield, soil_fertility, moisture_level)
    summer_crops: .space 16  # Assuming each crop has 4 words of data (name, yield, soil_fertility, moisture_level)
