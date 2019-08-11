;Anthony Bravo 

LOCALS
.MODEL tiny
.386


;Bomb matrix where 1 = bomb and 0 = no bomb
.DATA
    arrayRow0 DB    0,   1,   0,    1,   0,    0,    0,    0,    0
    arrayRow1 DB    1,   1,   0,    0,   0,    0,    0,    0,    0
    arrayRow2 DB    1,   1,   1,    1,   0,    1,    0,    0,    0
    arrayRow3 DB    1,   0,   1,    0,   1,    0,    1,    0,    1
    arrayRow4 DB    1,   1,   1,    1,   0,    1,    0,    1,    0
    arrayRow5 DB    1,   0,   1,    0,   1,    0,    1,    0,    1
    arrayRow6 DB    0,   1,   0,    1,   0,    1,    0,    1,    0
    arrayRow7 DB    1,   0,   1,    0,   1,    0,    1,    0,    1
    arrayRow8 DB    0,   0,   0,    1,   0,    1,    0,    1,    0

.CODE
org 100h

main PROC

    Begin:  

    ;Sets video mode 
    mov ah, 0
    mov al, 3
    int 10h

    ;background color to Red
    mov ax, 0600h
    mov bh, 40h
    mov cx, 00h
    mov dx, 184fh
    int 10h 

    ;Sets line drawing
    LINE MACRO row, col
    mov ah, 2
    mov dh, row
    mov dl, col
    mov bh, 0
    int 10h

    ;six lines are drawn
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 36
    int 10h
    ENDM

    ;position for 6 lines
    LINE 3,8
    LINE 5,8
    LINE 7,8
    LINE 9,8
    LINE 11,8
    LINE 13,8
    LINE 15,8
    LINE 17,8
    LINE 19,8
    LINE 21,8

    ;cursor for 1st line
    mov dh, 21
    VERTICAL_1:
    mov ah, 2
    mov dh, dh
    mov dl, 8
    mov bh, 0
    int 10h
    add dh, -1

    ;Draw line
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_1
    
    ;cursor for 2nd line
    mov dh, 21
    VERTICAL_2:
    mov ah, 2
    mov dh, dh
    mov dl, 12
    mov bh, 0
    int 10h
    add dh, -1

    ;draw 2nd line
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_2

    ;cursor for 3rd line
    mov dh, 21
    VERTICAL_3:
    mov ah, 2
    mov dh, dh
    mov dl, 16
    mov bh, 0
    int 10h
    add dh, -1

    ;Draw third line 
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_3

    ;cursor for 4th line
    mov dh, 21
    VERTICAL_4:
    mov ah, 2
    mov dh, dh
    mov dl, 20
    mov bh, 0
    int 10h
    add dh, -1

    ;Draw 4th line 
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_4

    ;cursor for 5th line
    mov dh, 21
    VERTICAL_5:
    mov ah, 2
    mov dh, dh
    mov dl, 24
    mov bh, 0
    int 10h
    add dh, -1

    ;Draw 5th line 
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_5

    ;cursor for 6th line
    mov dh, 21
    VERTICAL_6:
    mov ah, 2
    mov dh, dh
    mov dl, 28
    mov bh, 0
    int 10h
    add dh, -1

    ;draw 6th
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_6

    ;cursor for 7th line
    mov dh, 21
    VERTICAL_7:
    mov ah, 2
    mov dh, dh
    mov dl, 32
    mov bh, 0
    int 10h
    add dh, -1

    ;Draw 7th  line 
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_7

    ;cursor for 8th line
    mov dh, 21
    VERTICAL_8:
    mov ah, 2
    mov dh, dh
    mov dl, 36
    mov bh, 0
    int 10h
    add dh, -1

    ;Draw 8th line 
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_8

    ;cursor for 9th line
    mov dh, 21
    VERTICAL_9:
    mov ah, 2
    mov dh, dh
    mov dl, 40
    mov bh, 0
    int 10h
    add dh, -1

    ;Draw 9th line
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_9

    ;cursor for 10th line
    mov dh, 21
    VERTICAL_10:
    mov ah, 2
    mov dh, dh
    mov dl, 44
    mov bh, 0
    int 10h
    add dh, -1

    ;Draw 10th line
    mov ah, 9
    mov bh, 0
    mov bl, 1h
    mov cx, 01
    int 10h
    cmp dh, 3
    JGE VERTICAL_10

    ;show Game name
    mov bh, 0
    mov bl, 0Fh
    mov cx, txt37 - offset msg37
    mov dl, 24 ;colum
    mov dh, 1 ; row
    mov bp, offset msg37
    mov ah, 13h
    int 10h
    jmp txt37
    msg37 db "Minesweeper"
    txt37:

    ;Show my name 
    mov bh, 0
    mov bl, 40h
    mov cx, txt38 - offset msg38
    mov dl, 22
    mov dh, 2
    mov bp, offset msg38
    mov ah, 13h
    int 10h
    jmp txt38
    msg38 db "By Anthony Bravo"
    txt38:  

    ;Show instructions
    mov bh, 0
    mov bl, 0Fh
    mov cx, txt39 - offset msg39
    mov dl, 50
    mov dh, 5
    mov bp, offset msg39
    mov ah, 13h
    int 10h
    jmp txt39
    msg39 db "Instructions to play:"
    txt39:  

    ;Displays First Instruction
    mov bh, 0
    mov bl, 40h
    mov cx, txt40 - offset msg40
    mov dl, 46
    mov dh, 7
    mov bp, offset msg40
    mov ah, 13h
    int 10h
    jmp txt40
    msg40 db "1)Use arrows to move between cells"
    txt40:  

    ;Displays Second Instruction
    mov bh, 0
    mov bl, 40h
    mov cx, txt41 - offset msg41
    mov dl, 46
    mov dh, 9
    mov bp, offset msg41
    mov ah, 13h
    int 10h
    jmp txt41
    msg41 db "2)Press F1 on the desired cell"
    txt41:  


    ;Displays Third Instruction
    mov bh, 0
    mov bl, 40h
    mov cx, txt43 - offset msg43
    mov dl, 46
    mov dh, 11
    mov bp, offset msg43
    mov ah, 13h
    int 10h
    jmp txt43
    msg43 db "3)If there is no bomb then"
    txt43:  

    ;Displays Fourth Instruction
    mov bh, 0
    mov bl, 40h
    mov cx, txt44 - offset msg44
    mov dl, 46
    mov dh, 12
    mov bp, offset msg44
    mov ah, 13h
    int 10h
    jmp txt44
    msg44 db "the number of neighboring"
    txt44:  

    ;Displays Fifth Instruction
    mov bh, 0
    mov bl, 40h
    mov cx, txt45 - offset msg45
    mov dl, 46
    mov dh, 13
    mov bp, offset msg45
    mov ah, 13h
    int 10h
    jmp txt45
    msg45 db "bombs appear"
    txt45:  

    ;Displays sixth Instruction
    mov bh, 0
    mov bl, 40h
    mov cx, txt46 - offset msg46
    mov dl, 46
    mov dh, 15
    mov bp, offset msg46
    mov ah, 13h
    int 10h
    jmp txt46
    msg46 db "4)Else there is a bomb and"
    txt46:  

    ;Displays seventh Instruction
    mov bh, 0
    mov bl, 40h
    mov cx, txt47 - offset msg47
    mov dl, 46
    mov dh, 16
    mov bp, offset msg47
    mov ah, 13h
    int 10h
    jmp txt47
    msg47 db "no number will appear - Game Over"
    txt47:  

    mov DI, 0; Initial Score

    ;Displays Score
    mov bh, 0
    mov bl, 0Fh
    mov cx, txt48 - offset msg48
    mov dl, 46
    mov dh, 20
    mov bp, offset msg48
    mov ah, 13h
    int 10h
    jmp txt48
    msg48 db "Score: "
    txt48:  

    ;Moves cursor to Initial score
    mov ah, 2
    mov dl, 52 ; colum
    mov dh, 20  ;row
    mov bh, 0           
    int 10h  

    ;Write a score of 0
    mov  bl, 0
    mov  ah, 02h
    mov  dl, bl
    add  dl, "0"   ; Integer to single-digit ASCII character
    int  21h


    ;Moves cursor to first cell
    mov ah, 2  
    mov dl, 10 ; colum
    mov dh, 4  ;row
    mov bh, 0           
    int 10h  
    mov ah, 0          
    int 16h   



    Start:

    ;----------------------------------------------
    ;Move cursor using keyboard
    WHILE:
    cmp al, 1Bh         
    je ENDWHILE         

    ;Compare function 
    cmp al, 0            
    jne ELSE1 
    call Stores_Value 
    jmp NEXT   

    ELSE1:  
    mov ah, 2            
    mov dl, al        
    int 21h     

    NEXT:
    cmp ah, 3Bh
    je F1_Pressed
    mov ah, 0            
    int 16h   
    jmp WHILE

    ;This runs when F1 is pressed-----------------------------------------
    F1_Pressed:
    mov  bl, 0
    ;Get current position
    mov ah, 3
    mov bh, 0 
    int 10h

    ;cl = row
    mov ax, 0
    mov al,0
    mov al, dh
    Sub al,4
    mov cl,2
    Div cl
    mov cx,0
    mov cl,al

    ;dl = colum
    mov ax, 0
    mov al,0
    mov al, dl
    sub al,216
    sub al, 50
    mov dl,4
    Div dl
    mov dx,0
    mov dl,al

    mov ax, 0
    mov si, 0
    ;al = # of bombs

    ;bomb@cell 
    cmp cl,0
    je Row0
    cmp cl,1
    je Row1
    cmp cl,2
    je Row2
    cmp cl,3
    je Row3
    cmp cl,4
    je Row4
    cmp cl,5
    je Row5
    cmp cl,6
    je Row6
    cmp cl,7
    je Row7
    cmp cl,8
    je Row8

    Continue:
    mov ax, 0 ;al = #of bombs- now we can start counting

    ;update cursor to bombs-left-----
    Dec dl

    ;check if we are at the edge
    cmp dl,-1
    je Bombs_Right

    ;bombs-left
    cmp cl,0
    je Left_Row0
    cmp cl,1
    je Left_Row1
    cmp cl,2
    je Left_Row2
    cmp cl,3
    je Left_Row3
    cmp cl,4
    je Left_Row4
    cmp cl,5
    je Left_Row5
    cmp cl,6
    je Left_Row6
    cmp cl,7
    je Left_Row7
    cmp cl,8
    je Left_Row8


    Bombs_Right:
    ;update cursor to bombs-Right
    Inc dl
    Inc dl

    cmp dl,9
    je Bombs_Up

    ;bombs-right
    cmp cl,0
    je Right_Row0
    cmp cl,1
    je Right_Row1
    cmp cl,2
    je Right_Row2
    cmp cl,3
    je Right_Row3
    cmp cl,4
    je Right_Row4
    cmp cl,5
    je Right_Row5
    cmp cl,6
    je Right_Row6
    cmp cl,7
    je Right_Row7
    cmp cl,8
    je Right_Row8


    Bombs_Up:
    ;update cursor to bombs-Up
    Dec dl
    Dec cl

    cmp cl,-1
    je Bombs_Down

    ;Bombs-up
    cmp cl,0
    je Up_Row0
    cmp cl,1
    je Up_Row1
    cmp cl,2
    je Up_Row2
    cmp cl,3
    je Up_Row3
    cmp cl,4
    je Up_Row4
    cmp cl,5
    je Up_Row5
    cmp cl,6
    je Up_Row6
    cmp cl,7
    je Up_Row7
    cmp cl,8
    je Up_Row8

    Bombs_Down:
    ;update cursor to bombs-Down
    Inc cl
    Inc cl

    cmp cl, 9
    je Bombs_topLeft

    ;Bombs_Down
    cmp cl,0
    je Down_Row0
    cmp cl,1
    je Down_Row1
    cmp cl,2
    je Down_Row2
    cmp cl,3
    je Down_Row3
    cmp cl,4
    je Down_Row4
    cmp cl,5
    je Down_Row5
    cmp cl,6
    je Down_Row6
    cmp cl,7
    je Down_Row7
    cmp cl,8
    je Down_Row8


    Bombs_topLeft:
    ;update cursor to bombs-topLeft
    Dec cl
    Dec cl
    Dec dl

    cmp cl,-1
    je Bombs_topRight
    cmp dl, -1
    je Bombs_topRight

    ;Bombs_topLeft
    cmp cl,0
    je Top_Left_Row0
    cmp cl,1
    je Top_Left_Row1
    cmp cl,2
    je Top_Left_Row2
    cmp cl,3
    je Top_Left_Row3
    cmp cl,4
    je Top_Left_Row4
    cmp cl,5
    je Top_Left_Row5
    cmp cl,6
    je Top_Left_Row6
    cmp cl,7
    je Top_Left_Row7
    cmp cl,8
    je Top_Left_Row8


    Bombs_topRight:
    ;update cursor to bombs-topRight
    inc dl
    inc dl

    cmp dl, 9
    je Bombs_bottomRight
    cmp cl, -1
    je Bombs_bottomRight

    ;Bombs_topRight
    cmp cl,0
    je Top_Right_Row0
    cmp cl,1
    je Top_Right_Row1
    cmp cl,2
    je Top_Right_Row2
    cmp cl,3
    je Top_Right_Row3
    cmp cl,4
    je Top_Right_Row4
    cmp cl,5
    je Top_Right_Row5
    cmp cl,6
    je Top_Right_Row6
    cmp cl,7
    je Top_Right_Row7
    cmp cl,8
    je Top_Right_Row8


    Bombs_bottomRight:
    ;update cursor to bombs-topRight
    inc cl
    inc cl

    cmp cl,9
    je Bombs_bottomLeft
    cmp dl,9
    je Bombs_bottomLeft

    ;bombs_bottomRigth
    cmp cl,0
    je Bottom_Right_Row0
    cmp cl,1
    je Bottom_Right_Row1
    cmp cl,2
    je Bottom_Right_Row2
    cmp cl,3
    je Bottom_Right_Row3
    cmp cl,4
    je Bottom_Right_Row4
    cmp cl,5
    je Bottom_Right_Row5
    cmp cl,6
    je Bottom_Right_Row6
    cmp cl,7
    je Bottom_Right_Row7
    cmp cl,8
    je Bottom_Right_Row8


    Bombs_bottomLeft:
    ;update cursor to bombs-bottomLeft
    dec dl 
    dec dl

    cmp cl,9
    je Done
    cmp dl,-1
    je Done

    ;bombs-bottomLeft
    cmp cl,0
    je Bottom_Left_Row0
    cmp cl,1
    je Bottom_Left_Row1
    cmp cl,2
    je Bottom_Left_Row2
    cmp cl,3
    je Bottom_Left_Row3
    cmp cl,4
    je Bottom_Left_Row4
    cmp cl,5
    je Bottom_Left_Row5
    cmp cl,6
    je Bottom_Left_Row6
    cmp cl,7
    je Bottom_Left_Row7
    cmp cl,8
    je Bottom_Left_Row8

    ;Runs once we counted all cells
    Done:
    inc dl
    Dec cl
    ;Get current position
    mov ah, 3
    mov bh, 0 
    int 10h

    mov cl,dh ;row
    mov ch,dl ; colum


    ;print on cell (prints whats on bl)
    Print:
    mov bx, 0
    mov bl, al

    ;print neighbors
    mov  ah, 02h
    mov  dl, bl
    add  dl, "0"   ; Integer to single-digit ASCII character
    int  21h


    Inc DI ;update score
    mov ax, 0
    mov ax,DI

    ;move cursor to score
    mov ah, 2
    mov dl, 52 ; colum
    mov dh, 20  ;row
    mov bh, 0           
    int 10h  

    ;Print new score
    mov  bl, al
    mov  ah, 02h
    mov  dl, bl
    add  dl, "0"   ; Integer to single-digit ASCII character
    int  21h

    ;Moves cursor to current cell
    mov ah, 2  
    mov dl, ch ; colum
    mov dh, cl ;row
    mov bh, 0           
    int 10h  
    mov ah, 0          
    int 16h  

    jmp While

    ;When there is a bomb
    Dead:
    mov ah, 0
    jmp Begin

    ;--------For the first cell-------------
    Row0:
    mov si, OFFSET arrayRow0
    add si, dx   ;get the current colum @ row 0
    mov bl, [si]
    cmp bl, 1
    je Dead ;jumps to print if there is a bomb
    jmp Continue

    Row1:
    mov si, OFFSET arrayRow1
    add si, dx   ;get the current colum @ row 1
    mov bl, [si]
    cmp bl, 1
    je Dead
    jmp Continue

    Row2:
    mov si, OFFSET arrayRow2
    add si, dx   ;get the current colum @ row 2
    mov bl, [si]
    cmp bl, 1
    je Dead
    jmp Continue

    Row3:
    mov si, OFFSET arrayRow3
    add si, dx   ;get the current colum @ row 3
    mov bl, [si]
    cmp bl, 1
    je Dead
    jmp Continue

    Row4:
    mov si, OFFSET arrayRow4
    add si, dx   ;get the current colum @ row 4
    mov bl, [si]
    cmp bl, 1
    je Dead
    jmp Continue

    Row5:
    mov si, OFFSET arrayRow5
    add si, dx   ;get the current colum @ row 5
    mov bl, [si]
    cmp bl, 1
    je Dead
    jmp Continue

    Row6:
    mov si, OFFSET arrayRow6
    add si, dx   ;get the current colum @ row 6
    mov bl, [si]
    cmp bl, 1
    je Dead
    jmp Continue

    Row7:
    mov si, OFFSET arrayRow7
    add si, dx   ;get the current colum @ row 7
    mov bl, [si]
    cmp bl, 1
    je Dead
    jmp Continue

    Row8:
    mov si, OFFSET arrayRow8
    add si, dx   ;get the current colum @ row 8
    mov bl, [si]
    cmp bl, 1
    je Dead
    jmp Continue

    ;-------------For Left Cell---------------
    Left_Row0:
    mov si, OFFSET arrayRow0
    add si, dx   ;get the current colum @ row 0
    mov bl, [si]
    cmp bl, 0
    je Bombs_Right ;jumps to print if there is a bomb
    Inc al
    jmp Bombs_Right

    Left_Row1:
    mov si, OFFSET arrayRow1
    add si, dx   ;get the current colum @ row 1
    mov bl, [si]
    cmp bl, 0
    je Bombs_Right
    Inc al
    jmp Bombs_Right

    Left_Row2:
    mov si, OFFSET arrayRow2
    add si, dx   ;get the current colum @ row 2
    mov bl, [si]
    cmp bl, 0
    je Bombs_Right
    Inc al
    jmp Bombs_Right

    Left_Row3:
    mov si, OFFSET arrayRow3
    add si, dx   ;get the current colum @ row 3
    mov bl, [si]
    cmp bl, 0
    je Bombs_Right
    Inc al
    jmp Bombs_Right

    Left_Row4:
    mov si, OFFSET arrayRow4
    add si, dx   ;get the current colum @ row 4
    mov bl, [si]
    cmp bl, 0
    je Bombs_Right
    Inc al
    jmp Bombs_Right

    Left_Row5:
    mov si, OFFSET arrayRow5
    add si, dx   ;get the current colum @ row 5
    mov bl, [si]
    cmp bl, 0
    je Bombs_Right
    Inc al
    jmp Bombs_Right

    Left_Row6:
    mov si, OFFSET arrayRow6
    add si, dx   ;get the current colum @ row 6
    mov bl, [si]
    cmp bl, 0
    je Bombs_Right
    Inc al
    jmp Bombs_Right

    Left_Row7:
    mov si, OFFSET arrayRow7
    add si, dx   ;get the current colum @ row 7
    mov bl, [si]
    cmp bl, 0
    je Bombs_Right
    Inc al
    jmp Bombs_Right

    Left_Row8:
    mov si, OFFSET arrayRow8
    add si, dx   ;get the current colum @ row 8
    mov bl, [si]
    cmp bl, 0
    je Bombs_Right
    Inc al
    jmp Bombs_Right


    ;-------------For Right Cell---------------
    Right_Row0:
    mov si, OFFSET arrayRow0
    add si, dx   ;get the current colum @ row 0
    mov bl, [si]
    cmp bl, 0
    je Bombs_Up ;jumps to print if there is a bomb
    Inc al
    jmp Bombs_Up

    Right_Row1:
    mov si, OFFSET arrayRow1
    add si, dx   ;get the current colum @ row 1
    mov bl, [si]
    cmp bl, 0
    je Bombs_Up
    Inc al
    jmp Bombs_Up

    Right_Row2:
    mov si, OFFSET arrayRow2
    add si, dx   ;get the current colum @ row 2
    mov bl, [si]
    cmp bl, 0
    je Bombs_Up
    Inc al
    jmp Bombs_Up

    Right_Row3:
    mov si, OFFSET arrayRow3
    add si, dx   ;get the current colum @ row 3
    mov bl, [si]
    cmp bl, 0
    je Bombs_Up
    Inc al
    jmp Bombs_Up

    Right_Row4:
    mov si, OFFSET arrayRow4
    add si, dx   ;get the current colum @ row 4
    mov bl, [si]
    cmp bl, 0
    je Bombs_Up
    Inc al
    jmp Bombs_Up

    Right_Row5:
    mov si, OFFSET arrayRow5
    add si, dx   ;get the current colum @ row 5
    mov bl, [si]
    cmp bl, 0
    je Bombs_Up
    Inc al
    jmp Bombs_Up

    Right_Row6:
    mov si, OFFSET arrayRow6
    add si, dx   ;get the current colum @ row 6
    mov bl, [si]
    cmp bl, 0
    je Bombs_Up
    Inc al
    jmp Bombs_Up

    Right_Row7:
    mov si, OFFSET arrayRow7
    add si, dx   ;get the current colum @ row 7
    mov bl, [si]
    cmp bl, 0
    je Bombs_Up
    Inc al
    jmp Bombs_Up

    Right_Row8:
    mov si, OFFSET arrayRow8
    add si, dx   ;get the current colum @ row 8
    mov bl, [si]
    cmp bl, 0
    je Bombs_Up
    Inc al
    jmp Bombs_Up



    ;-------------For Up Cell---------------
    Up_Row0:
    mov si, OFFSET arrayRow0
    add si, dx   ;get the current colum @ row 0
    mov bl, [si]
    cmp bl, 0
    je Bombs_Down ;jumps to print if there is a bomb
    Inc al
    jmp Bombs_Down

    Up_Row1:
    mov si, OFFSET arrayRow1
    add si, dx   ;get the current colum @ row 1
    mov bl, [si]
    cmp bl, 0
    je Bombs_Down
    Inc al
    jmp Bombs_Down

    Up_Row2:
    mov si, OFFSET arrayRow2
    add si, dx   ;get the current colum @ row 2
    mov bl, [si]
    cmp bl, 0
    je Bombs_Down
    Inc al
    jmp Bombs_Down

    Up_Row3:
    mov si, OFFSET arrayRow3
    add si, dx   ;get the current colum @ row 3
    mov bl, [si]
    cmp bl, 0
    je Bombs_Down
    Inc al
    jmp Bombs_Down

    Up_Row4:
    mov si, OFFSET arrayRow4
    add si, dx   ;get the current colum @ row 4
    mov bl, [si]
    cmp bl, 0
    je Bombs_Down
    Inc al
    jmp Bombs_Down

    Up_Row5:
    mov si, OFFSET arrayRow5
    add si, dx   ;get the current colum @ row 5
    mov bl, [si]
    cmp bl, 0
    je Bombs_Down
    Inc al
    jmp Bombs_Down

    Up_Row6:
    mov si, OFFSET arrayRow6
    add si, dx   ;get the current colum @ row 6
    mov bl, [si]
    cmp bl, 0
    je Bombs_Down
    Inc al
    jmp Bombs_Down

    Up_Row7:
    mov si, OFFSET arrayRow7
    add si, dx   ;get the current colum @ row 7
    mov bl, [si]
    cmp bl, 0
    je Bombs_Down
    Inc al
    jmp Bombs_Down

    Up_Row8:
    mov si, OFFSET arrayRow8
    add si, dx   ;get the current colum @ row 8
    mov bl, [si]
    cmp bl, 0
    je Bombs_Down
    Inc al
    jmp Bombs_Down



    ;-------------For Down Cell---------------
    Down_Row0:
    mov si, OFFSET arrayRow0
    add si, dx   ;get the current colum @ row 0
    mov bl, [si]
    cmp bl, 0
    je Bombs_topLeft ;jumps to print if there is a bomb
    Inc al
    jmp Bombs_topLeft

    Down_Row1:
    mov si, OFFSET arrayRow1
    add si, dx   ;get the current colum @ row 1
    mov bl, [si]
    cmp bl, 0
    je Bombs_topLeft
    Inc al
    jmp Bombs_topLeft

    Down_Row2:
    mov si, OFFSET arrayRow2
    add si, dx   ;get the current colum @ row 2
    mov bl, [si]
    cmp bl, 0
    je Bombs_topLeft
    Inc al
    jmp Bombs_topLeft

    Down_Row3:
    mov si, OFFSET arrayRow3
    add si, dx   ;get the current colum @ row 3
    mov bl, [si]
    cmp bl, 0
    je Bombs_topLeft
    Inc al
    jmp Bombs_topLeft

    Down_Row4:
    mov si, OFFSET arrayRow4
    add si, dx   ;get the current colum @ row 4
    mov bl, [si]
    cmp bl, 0
    je Bombs_topLeft
    Inc al
    jmp Bombs_topLeft

    Down_Row5:
    mov si, OFFSET arrayRow5
    add si, dx   ;get the current colum @ row 5
    mov bl, [si]
    cmp bl, 0
    je Bombs_topLeft
    Inc al
    jmp Bombs_topLeft

    Down_Row6:
    mov si, OFFSET arrayRow6
    add si, dx   ;get the current colum @ row 6
    mov bl, [si]
    cmp bl, 0
    je Bombs_topLeft
    Inc al
    jmp Bombs_topLeft

    Down_Row7:
    mov si, OFFSET arrayRow7
    add si, dx   ;get the current colum @ row 7
    mov bl, [si]
    cmp bl, 0
    je Bombs_topLeft
    Inc al
    jmp Bombs_topLeft

    Down_Row8:
    mov si, OFFSET arrayRow8
    add si, dx   ;get the current colum @ row 8
    mov bl, [si]
    cmp bl, 0
    je Bombs_topLeft
    Inc al
    jmp Bombs_topLeft



    ;-------------For Top Left Cell---------------
    Top_Left_Row0:
    mov si, OFFSET arrayRow0
    add si, dx   ;get the current colum @ row 0
    mov bl, [si]
    cmp bl, 0
    je Bombs_topRight ;jumps to print if there is a bomb
    Inc al
    jmp Bombs_topRight

    Top_Left_Row1:
    mov si, OFFSET arrayRow1
    add si, dx   ;get the current colum @ row 1
    mov bl, [si]
    cmp bl, 0
    je Bombs_topRight
    Inc al
    jmp Bombs_topRight

    Top_Left_Row2:
    mov si, OFFSET arrayRow2
    add si, dx   ;get the current colum @ row 2
    mov bl, [si]
    cmp bl, 0
    je Bombs_topRight
    Inc al
    jmp Bombs_topRight

    Top_Left_Row3:
    mov si, OFFSET arrayRow3
    add si, dx   ;get the current colum @ row 3
    mov bl, [si]
    cmp bl, 0
    je Bombs_topRight
    Inc al
    jmp Bombs_topRight

    Top_Left_Row4:
    mov si, OFFSET arrayRow4
    add si, dx   ;get the current colum @ row 4
    mov bl, [si]
    cmp bl, 0
    je Bombs_topRight
    Inc al
    jmp Bombs_topRight

    Top_Left_Row5:
    mov si, OFFSET arrayRow5
    add si, dx   ;get the current colum @ row 5
    mov bl, [si]
    cmp bl, 0
    je Bombs_topRight
    Inc al
    jmp Bombs_topRight

    Top_Left_Row6:
    mov si, OFFSET arrayRow6
    add si, dx   ;get the current colum @ row 6
    mov bl, [si]
    cmp bl, 0
    je Bombs_topRight
    Inc al
    jmp Bombs_topRight

    Top_Left_Row7:
    mov si, OFFSET arrayRow7
    add si, dx   ;get the current colum @ row 7
    mov bl, [si]
    cmp bl, 0
    je Bombs_topRight
    Inc al
    jmp Bombs_topRight

    Top_Left_Row8:
    mov si, OFFSET arrayRow8
    add si, dx   ;get the current colum @ row 8
    mov bl, [si]
    cmp bl, 0
    je Bombs_topRight
    Inc al
    jmp Bombs_topRight



    ;-------------For Top Right Cell---------------
    Top_Right_Row0:
    mov si, OFFSET arrayRow0
    add si, dx   ;get the current colum @ row 0
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomRight ;jumps to print if there is a bomb
    Inc al
    jmp Bombs_bottomRight

    Top_Right_Row1:
    mov si, OFFSET arrayRow1
    add si, dx   ;get the current colum @ row 1
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomRight
    Inc al
    jmp Bombs_bottomRight

    Top_Right_Row2:
    mov si, OFFSET arrayRow2
    add si, dx   ;get the current colum @ row 2
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomRight
    Inc al
    jmp Bombs_bottomRight

    Top_Right_Row3:
    mov si, OFFSET arrayRow3
    add si, dx   ;get the current colum @ row 3
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomRight
    Inc al
    jmp Bombs_bottomRight

    Top_Right_Row4:
    mov si, OFFSET arrayRow4
    add si, dx   ;get the current colum @ row 4
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomRight
    Inc al
    jmp Bombs_bottomRight

    Top_Right_Row5:
    mov si, OFFSET arrayRow5
    add si, dx   ;get the current colum @ row 5
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomRight
    Inc al
    jmp Bombs_bottomRight

    Top_Right_Row6:
    mov si, OFFSET arrayRow6
    add si, dx   ;get the current colum @ row 6
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomRight
    Inc al
    jmp Bombs_bottomRight

    Top_Right_Row7:
    mov si, OFFSET arrayRow7
    add si, dx   ;get the current colum @ row 7
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomRight
    Inc al
    jmp Bombs_bottomRight

    Top_Right_Row8:
    mov si, OFFSET arrayRow8
    add si, dx   ;get the current colum @ row 8
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomRight
    Inc al
    jmp Bombs_bottomRight


    ;-------------For Bottom Right Cell---------------
    Bottom_Right_Row0:
    mov si, OFFSET arrayRow0
    add si, dx   ;get the current colum @ row 0
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomLeft ;jumps to print if there is a bomb
    Inc al
    jmp Bombs_bottomLeft

    Bottom_Right_Row1:
    mov si, OFFSET arrayRow1
    add si, dx   ;get the current colum @ row 1
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomLeft
    Inc al
    jmp Bombs_bottomLeft

    Bottom_Right_Row2:
    mov si, OFFSET arrayRow2
    add si, dx   ;get the current colum @ row 2
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomLeft
    Inc al
    jmp Bombs_bottomLeft

    Bottom_Right_Row3:
    mov si, OFFSET arrayRow3
    add si, dx   ;get the current colum @ row 3
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomLeft
    Inc al
    jmp Bombs_bottomLeft

    Bottom_Right_Row4:
    mov si, OFFSET arrayRow4
    add si, dx   ;get the current colum @ row 4
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomLeft
    Inc al
    jmp Bombs_bottomLeft

    Bottom_Right_Row5:
    mov si, OFFSET arrayRow5
    add si, dx   ;get the current colum @ row 5
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomLeft
    Inc al
    jmp Bombs_bottomLeft

    Bottom_Right_Row6:
    mov si, OFFSET arrayRow6
    add si, dx   ;get the current colum @ row 6
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomLeft
    Inc al
    jmp Bombs_bottomLeft

    Bottom_Right_Row7:
    mov si, OFFSET arrayRow7
    add si, dx   ;get the current colum @ row 7
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomLeft
    Inc al
    jmp Bombs_bottomLeft

    Bottom_Right_Row8:
    mov si, OFFSET arrayRow8
    add si, dx   ;get the current colum @ row 8
    mov bl, [si]
    cmp bl, 0
    je Bombs_bottomLeft
    Inc al
    jmp Bombs_bottomLeft


    ;-------------For Bottom Left Cell---------------
    Bottom_Left_Row0:
    mov si, OFFSET arrayRow0
    add si, dx   ;get the current colum @ row 0
    mov bl, [si]
    cmp bl, 0
    je Done ;jumps to print if there is a bomb
    Inc al
    jmp Done

    Bottom_Left_Row1:
    mov si, OFFSET arrayRow1
    add si, dx   ;get the current colum @ row 1
    mov bl, [si]
    cmp bl, 0
    je Done
    Inc al
    jmp Done

    Bottom_Left_Row2:
    mov si, OFFSET arrayRow2
    add si, dx   ;get the current colum @ row 2
    mov bl, [si]
    cmp bl, 0
    je Done
    Inc al
    jmp Done

    Bottom_Left_Row3:
    mov si, OFFSET arrayRow3
    add si, dx   ;get the current colum @ row 3
    mov bl, [si]
    cmp bl, 0
    je Done
    Inc al
    jmp Done

    Bottom_Left_Row4:
    mov si, OFFSET arrayRow4
    add si, dx   ;get the current colum @ row 4
    mov bl, [si]
    cmp bl, 0
    je Done
    Inc al
    jmp Done

    Bottom_Left_Row5:
    mov si, OFFSET arrayRow5
    add si, dx   ;get the current colum @ row 5
    mov bl, [si]
    cmp bl, 0
    je Done
    Inc al
    jmp Done

    Bottom_Left_Row6:
    mov si, OFFSET arrayRow6
    add si, dx   ;get the current colum @ row 6
    mov bl, [si]
    cmp bl, 0
    je Done
    Inc al
    jmp Done

    Bottom_Left_Row7:
    mov si, OFFSET arrayRow7
    add si, dx   ;get the current colum @ row 7
    mov bl, [si]
    cmp bl, 0
    je Done
    Inc al
    jmp Done

    Bottom_Left_Row8:
    mov si, OFFSET arrayRow8
    add si, dx   ;get the current colum @ row 8
    mov bl, [si]
    cmp bl, 0
    je Done
    Inc al
    jmp Done

    ENDWHILE:
    mov ah, 5Ch
    int 21h

    Stores_Value:
    push ax 

    ;Locates position of cursor 
    mov ah, 3            
    mov bh, 0          
    int 10h            
    pop ax    

    ;Scanning Codes for arrows on keyboard
    cmp ah, 48h           
    je Arrow_Up     
    cmp ah, 4Bh          
    je Arrow_Left     
    cmp ah, 4Dh           
    je Arrow_Right 
    cmp ah, 50h         
    je Arrow_Down      
    jmp Exit_  

    Arrow_Up:
    mov ah, 3  
    int 10h
    cmp dh, 4 
    jne UP        
    mov dh, 20 
    jmp RUN 

    Arrow_Down:
    mov ah, 3  
    int 10h
    cmp dh, 20
    jne Down 
    mov dh, 4                 
    jmp RUN    

    Arrow_Left:
    mov ah, 3  
    int 10h
    cmp dl, 10        
    jne Left      
    mov dl, 42          
    jmp RUN        

    Arrow_Right:
    mov ah, 3  
    int 10h
    cmp dl, 42     
    jne Right       
    mov dl, 10         
    jmp RUN 

    Left:
    SUB dl,4             
    jmp RUN     

    Right:
    ADD dl,4          
    jmp RUN   

    Up: 
    SUB dh, 2
    jmp RUN

    Down:
    ADD dh,2
    jmp RUN    

    RUN:
    mov ah, 2          
    int 10h  

    Exit_:
    ret 

    ;------------------------------------------

main ENDP

End main