.data
	#declaração das variáveis
	x: .word 5
	y: .word 3
	#declaração do texto
	texto: .asciiz "O valor de x é "
.text
	.globl main
main:
	lw $t0, x($zero) #x = 5
	lw $t1, y($zero) #y = 3
	add $t2, $t0, $t1 #x + y
	li $t3, 2
	rem $t3, $t2, $t3 #(x+y)%2
	beqz $t2, IgualZero # se == 0
	move $t0, $t1 #senao
	j printCoisa
IgualZero:
	add $t0, $t0, $t1
printCoisa:
	li $v0, 4 # este 4 significa que é para imprimir texto
	la $a0, texto
	syscall #imprime texto
	li $v0, 1 # este 1 significa que é para imprimir inteiro
	move $a0, $t0
	syscall #imprime inteiro
	jr $ra
