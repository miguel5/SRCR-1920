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

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Extensao do predicado cmp_datas - valida se a data se encontra dentro de um prazo : Dia, Mes, Ano, Prazo -> {V,F}

cmp_datas(Day,Month,Year,P) :- datime(T1,datime(Year,Month,Day,24,00,00)),   % timestamp do dia do contrato
                               T2 is P * 86400,                              % prazo em timestamp
                               T3 is T1 + T2,                                % timestamp do dia final de contrato
                               now(T4),                                      % timestamp atual
                               T3 > T4.                                      % validação


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Extensao do predicado head - devolve a cabeça da lista, não vazia, que recebe como parâmetro : Lista, Elemento -> {V,F}

head([],_) :- !,fail.
head([H|_], H).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Extensao do predicado timestamp - devolve o timestamp do dia atual somado com o numero de dias recebido como parâmetro : Número de Dias, Resultado -> {V,F}

timestamp(0,R) :- now(R).
timestamp(Dias,R) :- timestamp(0,T), R1 is Dias * 86400, R is R1 + T.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Extensao do predicado timestamp - devolve o timestamp do dia atual somado com o numero de dias recebido como parâmetro : Número de Dias, Resultado -> {V,F}
valor_valido(N) :- (integer(N)) -> N >= 0 ; N >= 0, Rest is N*(10^2), Rest - integer(Rest) =:= 0.