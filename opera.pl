/*
Especificação dos predicados
Integrantes do Grupo: Aline Noronha, Jonatan da Silva e Gabriel Oliveira
*/

/*
operações básicas
*/
/* 1.1 Soma e Subtracão*/
somasub :- 
        write('Digite um valor: '), nl,
        read(N),
        write('Digite o segundo valor: '), nl,
        read(M),
        S is N+M,
        SU is N - M,
        writef('%w%w%w%w%w%w',['A soma de ', N, ' + ',M, ' é ', S]),nl,
        writef('%w%w%w%w%w%w',['A subtração de ', N, ' - ',M, ' é ', SU]).

/* 1.2 Multiplicação e Divisão */

multdiv :- 
		write('Digite um valor: '), nl,
        read(F),	
		write('Digite o segundo valor: '), nl,
        read(S),
		M is F*S,
		
		(S =:= 0 -> write('A divisão não pode ser feita por zero.'),nl, multdiv; D is F/S, writef('%w%w%w%w%w%w',['A multiplicação de ', F, ' * ',S, ' é ', M]),nl,
        writef('%w%w%w%w%w%w',['A divisão de ', F, ' - ',S, ' é ', D]),nl).
	
/* 1.3 Potenciação */

pot :- 
		write('Digite a base: '), nl,
        read(F),	
		write('Digite a potência: '), nl,
        read(S),
		P is F^S,
		writef('%w%w%w%w%w%w',['A potência de ', F, ' ^ ',S, ' é ', P]).

/* 1.4 Raiz Quadrada */ 
raiz :- 
		write('Digite o valor: '), nl,
        read(F),	
		P is F^0.5,
		writef('%w%w%w%w',['A raiz quadrada de ', F, ' é ', P]).

/* 1.5 Resto da Divisão */
resto :-
		write('Digite o valor: '), nl,
        read(F),
		write('Digite o segundo valor: '), nl,
        read(S),
		(S =:= 0 -> write('A divisão não pode ser feita por zero.'),nl, resto; P is F mod S, writef('%w%w%w%w%w%w',['O resto da divisão de ', F, ' por ',S, ' é ', P]),nl).

/*
operações com expressões
*/

/* 2.1 Número par ou ímpar */
parimpar :- 
		write('Digite o valor: '), nl,
        read(F),
		(F mod 2 =:= 0 -> writef('%w%w%w',['O valor ', F, ' é par']), nl; writef('%w%w%w',['O valor ', F, ' é ímpar'])).

/* 2.2 Quadrado e cubo*/
quadcubo :-     
        write('Digite um valor: '), nl,
        read(N),
        Q is N*N,
        C is N*N*N,
        writef('%w%w%w%w',['O quadrado de ', N, ' é ',Q]), nl,
        writef('%w%w%w%w',['O cubo de ', N, ' é ',C]).

/* 2.3 Soma n números inteiros */
somanum :-
		write('Digite um valor: '), nl,
        read(N),
		somannumeros(N,R),
		writef('%w%w',['O total da soma é ', R]).
		
somannumeros(0,0).
somannumeros(N,R) :- 
	N>0,
	N1 is N-1,
	somannumeros(N1,F1),
	R is N + F1.

/* 2.4 Fatorial*/
fat :-  
        write('Cálculo do fatorial, digite um valor: '), nl,
        read(N),
        fatorial(N,F), 
        writef('%w%w%w%w',['O fatorial de ', N, ' é ',F]).

fatorial(0,1).
fatorial(N,F) :-
   N>0,
   N1 is N-1,
   fatorial(N1,F1),
   F is N * F1.

/*2.5 Fibonacci*/
fib :-
        write('Cálculo de fibonacci, digite um valor: '), nl,
        read(X),
        fib(X,Y),
        writef('%w%w%w%w',['O fibonacci de ', X, ' é ',Y]).
fib(0, 1).
fib(1, 1).
fib(X, Y):-
        X > 1, X1 is X - 1, X2 is X - 2, fib(X1, Z), fib(X2, W), Y is W + Z.

/* 2.7 MDC */
mdc :- 
        write('Cálculo do mdc, digite um valor: '), nl,
        read(A),
        write('digite o segundo valor: '), nl,
        read(B),
        mdc(A,B,C),
        writef('%w%w%w%w%w%w',['O mdc dos valores ', A, ' e ', B, ' é ',C]).

mdc(A, A, A).
mdc(A,B,C) :- 
      A < B,
      Temp is B - A,
      mdc(A,Temp,C).
mdc(A,B,C) :- 
      A > B,
      Temp is A - B,
      mdc(Temp,B,C).
         
/*Operações com listas */

/*3.1 X é elemento da lista */
memb :- 
        write('Digite o membro: '), nl,
        read(N),
        write('Digite a lista: '), nl,
        read(M),
        membro(N,M),
        writef('%w%w%w%w',['O valor ', N, ' é membro da lista ', M]).
        
membro(X,[X|_]).                %  X é membro de uma lista se X é a 
membro(X,[_|Y]):-               %  cabeça da lista.  Ou então se X é
        membro(X,Y).    %  membro do corpo da lista.

/* 3.2 Soma e produto de elementos da lista*/
somaprodutolista :- 
        write('Digite uma lista (entre [ , ]): '), nl,
        read(N),
        somalista(N,S),
        produto(N,P),
        writef('%w%w%w%w',['A soma dos valores da lista ', N, ' é ',S]),
        writef('%w%w%w%w',['O produto dos valores da lista ', N, ' é ',P]).

somalista([], 0).               %  A soma dos elementos de uma lista de números é 
somalista([H|R], S):-           %  obtida somando o valor da cabeça á soma dos 
        somalista(R, X),                %  elementos do corpo da lista.
        S is H + X. 

produto([],0).                  %  O produto de uma lista é obtido com o uso de
produto([X],X).                 %  um predicado auxiliar, prod/2, necessario para
produto(L,P):-                  %  isolar a aplicação do elemento neutro da
        prod(L,P).              %  multiplicação do caso em que se pede diretamente
prod([],1).                     %  o produto de uma lista vazia.
prod([X|Y],P):-
        prod(Y,Q),
        P is Q * X.
 
/* 3.4 Verifica o tamanho da lista */
 tam :- 
        write('Digite uma lista (entre [ , ]): '), nl,
        read(N),
        tamanho(N,Z),
        writef('%w%w%w%w',['O tamanho da lista ', N, ' é ', Z]).

tamanho([], 0).          %  O tamanho de uma lista vazia é zero.  O tamanho de
tamanho([_|R], N):-             %  uma lista não-vazia é obtido acrescentando-se uma
        tamanho(R, N1),         %  unidade ao tamanho de seu corpo.
        N is N1 + 1.
  
 
/*3.6 Concatenação de duas listas*/
conc :- 
        write('Digite uma lista (entre [ , ]): '), nl,
        read(N),
        write('Digite a segunda lista (entre [ , ]): '), nl,
        read(M),
        concat(N,M,S),
        writef('%w%w%w%w%w%w',['A concatenação da lista ', N, ' e da lista ', M, ' é ', S]).

concat([], L, L).       
concat([X | L1], L2, [X | L3]):-
        concat(L1, L2, L3).   

/*3.8. Enesimo elemento da lista */
enes:-
        write('Digite uma lista (entre [ , ]): '), nl,
        read(X),
        write('Digite o elemento: '), nl,
        read(Y),
        enesimo(M,X,Y),
        write(N).
        
enesimo(1, X, [X | _]).         %  Este predicado devolve em X o enésimo elemento de
enesimo(N, X, [_ | Y]):-        %  uma lista.  Pode ser usado no sentido inverso para
        enesimo(M, X, Y),       %  informar a posição de um determinado elemento
        N is M + 1.             %  na lista.
                
/* 3.9 Menor e Maior valor da lista*/
menormaior :- 
        write('Digite uma lista (entre [ , ]): '), nl,
        read(N),
        min(N,ME),
        max(N,MA),
     writef('%w%w%w%w',['O menor valor da lista ', N, ' é ',ME]),nl,
     writef('%w%w%w%w',['O maior valor da lista ', N, ' é ',MA]).
 
min([X],X).                             
min([X|Y],M):-
        min(Y,N),
        (X<N -> M=X; M=N).
                
max([X],X).                        %  Calcula o maior elemento de uma lista numérica.
max([X|Y],M):-                     %  Notar a semelhança com o predicado min/2, a 
        max(Y,N),                  %  seguir, e o emprego da construção "if then else"
        (X>N -> M=X; M=N).         %  dada por (A -> B ; C).

/*
Especificação do Menu principal!
*/
menu :-
                repeat,
                write('-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x'),nl,
                write('      :...  Programa em Prolog -+- Menu de Operações  ...:    '),nl,
                write('-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x-x'),nl,nl,
                write('Digite a opção escolhida (opção com * já está implementada):   '), nl,
                write('1: Operações básicas\n \t 1.1 Soma e subtração (*)\t 1.2 Multiplicação e Divisão (*)\t\t 1.3 Potenciação (*)\n \t 1.4 Raiz Quadrada (*)\t\t 1.5 Resto da Divisão (*)\n2: Operações com expressões\n \t 2.1 Número par ou ímpar (*)\t\t 2.2 Quadrado e Cubo (*)\n\t 2.3 Soma n valores inteiros (*)\t\t 2.4 Fatorial (*)\n\t 2.5 Fibonacci (*)\t\t\t 2.6 Valores entre N =< X =< N1 em ordem decrescente\n\t 2.7 MDC (*)\t\t\t\t 2.8 MMC\n\t 2.9 Número primo\n3: Operações com listas\n \t 3.1 X é um elemento na lista (*) \t 3.2 Soma e Produto dos elementos (*) \n\t 3.3 Múltiplos de 2 \t\t\t 3.4 Tamanho da lista (*)\n\t 3.5 Média dos elementos da lista\t 3.6 Concatenação de listas (*) \n\t 3.7 Divisíveis por 5\t\t\t 3.8 Enesimo elemento da lista (*)\n \t 3.9 Menor e Maior valor digitado (*) \t 3.10 Posicao do maior elemento da lista \n\t 3.11 Palindrome \t\t\t 3.12 Soma Pares \n\t 3.13 Multiplica numeros primos \n0: Para sair do programa '),nl,
                write('Opcao: '),
                read(X),
                X >= 0,
                X =< 5,
                operacao(X),nl,nl,
                menu.

operacao(0) :- halt.

operacao(1.1) :- somasub.
operacao(1.2) :- multdiv.
operacao(1.3) :- pot.
operacao(1.4) :- raiz.
operacao(1.5) :- resto.

operacao(2.1) :- parimpar.
operacao(2.2) :- quadcubo.
operacao(2.3) :- somanum.
operacao(2.4) :- fat.
operacao(2.5) :- fib.
operacao(2.6) :- entreInvertido.
operacao(2.7) :- mdc.
operacao(2.8) :- mmc.
operacao(2.9) :- primo.

operacao(3.1) :- memb.
operacao(3.2) :- somaprodutolista.
operacao(3.3) :- multdois.
operacao(3.4) :- tam.
operacao(3.5) :- med.
operacao(3.6) :- conc.
operacao(3.7) :- dev5.
operacao(3.8) :- enes.
operacao(3.9) :- menormaior.
operacao(3.10) :- posicmenor.
operacao(3.11) :- palindrome.
operacao(3.12) :- somapar.
operacao(3.13) :- multprimo.

