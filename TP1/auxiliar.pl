% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                 PREDICADOS AUXILIARES                                                                    |%   
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Extensão do predicado solucoes : Elemento, Lista, Resultado -> {V,F}

solucoes( X,Y,Z ) :- findall( X,Y,Z ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado comprimento - predicado que dada uma lista calcula o seu comprimento : Lista, Resultado -> {V,F}

comprimento( S,N ) :- length( S,N ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado pertence - predicado que dada uma lista verififica e um elemento verififica se este pertence : Elemento, Lista -> {V,F}

pertence( X,[X|_] ).
pertence( X,[Y|L] ) :- X \= Y, pertence( X,L ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado soma - predicado que dada uma lista, soma todos os seus elementos : Lista, Resultado -> {V,F}

soma([],0).
soma([H|T],R) :- soma(T,Result), R is Result + H. 

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado maior - soma todos os elementos que pertencem a uma determinada lista : Lista, Resultado -> {V,F}

maior([], R, R).
maior([X|Xs], WK, R):- X >  WK, maior(Xs, X, R).
maior([X|Xs], WK, R):- X =< WK, maior(Xs, WK, R).
maior([X|Xs], R):- maior(Xs, X, R).    

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado cmp_datas - valida se a data se encontra dentro de um prazo : Dia, Mes, Ano, Prazo -> {V,F}

cmp_datas(Day,Month,Year,P) :- datime(T1,datime(Year,Month,Day,24,00,00)),   % timestamp do dia do contrato
                               T2 is P * 86400,                              % prazo em timestamp
                               T3 is T1 + T2,                                % timestamp do dia final de contrato
                               now(T4),                                      % timestamp atual
                               T3 > T4.                                      % validação

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado head - devolve a cabeça da lista, não vazia, que recebe como parâmetro : Lista, Elemento -> {V,F}

head([],_) :- !,fail.
head([H|_], H).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado timestamp - devolve o timestamp do dia atual somado com o numero de dias recebido como parâmetro : Número de Dias, Resultado -> {V,F}

timestamp(0,R) :- now(R).
timestamp(Dias,R) :- timestamp(0,T), R1 is Dias * 86400, R is R1 + T.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado timestamp - devolve o timestamp do dia atual somado com o número de dias recebido como parâmetro : Número de Dias, Resultado -> {V,F}

valor_valido(N) :- (integer(N)) -> N >= 0 ; N >= 0, Rest is N*(10^2), Rest - integer(Rest) =:= 0.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado id_contrato - devolve o próximo id de contrato a ser inserido : Resultado -> {V,F}

id_contrato(R) :- solucoes( IdC,
                            contrato(IdC,_,_,_,_,_,_,_,_,_,_,_),
                            S ),
                  maior(S,R1),
                  R is R1 + 1.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado id_adjudicante - devolve o próximo id de adjudicante a ser inserido : Resultado -> {V,F}

id_adjudicante(R) :- solucoes( IdAd,
                               adjudicante(IdAd,_,_,_),
                               S ),
                     maior(S,R1),
                     R is R1 + 1.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado id_adjudicataria - devolve o próximo id de adjudicataria a ser inserido : Resultado -> {V,F}

id_adjudicataria(R) :- solucoes( IdAd,
                                 adjudicataria(IdAd,_,_,_),
                                 S ),
                       maior(S,R1),
                       R is R1 + 1.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado find - devolve o valor total dos contratos de um determinado tipo entre um adjudicante e uma adjudicataria num conjunto de anos : 
%                                                                         Id Adjudicante, Id Adjudicataria, Tipo Contrato, Lista Anos, Resultado -> {V,F}

find(IdAd,IdAda,TC,Anos,R) :- solucoes((V), 
                              (contrato(_,IdAd,IdAda,TC,_,_,V,_,_,_,_,X),
                              pertence(X,Anos)), S),
                              soma(S,R).