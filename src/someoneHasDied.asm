#Retorna 1 ó 0 si algunos de los elementos del buffer es menor a 0
#incluido el indice del ganador
#$a0 -> Direccion inicial del buffer de Vida(float)
#$v0 -> 1 ó 0 si alguno de los elementos es menor o igual a 0
#$V1 -> Indice el pokemon vencedor
.globl someoneHasDied
.data
	zero: .float 0.0
.text
someoneHasDied:
	addi $sp, $sp, -24
	sw $t0, 0($sp)
	sw $a0, 4($sp)
	s.s $f0, 8($sp)
	s.s $f1, 12($sp)
	s.s $f3, 16($sp)
	sw $ra, 20($sp)
	
	la  $t0, zero
	l.s $f3, ($t0)
	
	l.s $f0 ($a0)
	l.s $f1 4($a0)
	
	c.le.s $f0, $f3 
	bc1t firstPokeHasDied 
	c.le.s $f1, $f3 
	bc1t secondPokHasDied 
	j exit
	firstPokeHasDied:
	li $v0, 1
	li $v1, 1
	j exit
	secondPokHasDied:
	li $v0, 1
	li $v1, 0
	exit: 
	lw $t0, 0($sp)
	lw $a0, 4($sp)
	l.s $f0, 8($sp)
	l.s $f1, 12($sp)
	l.s $f3, 16($sp)
	lw $ra, 20($sp)
	addi $sp, $sp, -24
	jr $ra
