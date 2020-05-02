% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                 PREDICADOS AUXILIARES                                                                    |%   
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Extensao do predicado solucoes: Elemento, Lista, Resultado -> {V,F}

solucoes( X,Y,Z ) :- findall( X,Y,Z ).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Extensao do predicado comprimento - predicado que dada uma lista calcula o seu comprimento : Lista, Resultado -> {V,F}

comprimento( S,N ) :- length( S,N ).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Extensao do predicado pertence - predicado que dada uma lista verififica e um elemento verififica se este pertence : Elemento, Lista -> {V,F}

pertence( X,[X|_] ).
pertence( X,[Y|L] ) :- X \= Y, pertence( X,L ).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Extensao do predicado soma - predicado que dada uma lista, soma todos os seus elementos : Lista, Resultado -> {V,F}

soma([],0).
soma([H|T],R) :- soma(T,Result), R is Result + H. 


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Extensao do predicado maior - soma todos os elementos que pertencem a uma determinada lista : Lista, Resultado -> {V,F}

maior([], R, R).
maior([X|Xs], WK, R):- X >  WK, maior(Xs, X, R).
maior([X|Xs], WK, R):- X =< WK, maior(Xs, WK, R).
maior([X|Xs], R):- maior(Xs, X, R).    