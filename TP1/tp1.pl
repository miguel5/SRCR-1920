%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Programacao em logica estendida

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Declaracoes iniciais

:- use_module(library(system)).
:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% SICStus PROLOG: Definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic contrato/9.
:- dynamic adjudicante/4.
:- dynamic adjudicataria/4.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Aplicação do PMF

-contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data) :- 
    nao(contrato(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data)), 
    nao(contrato(jogo(IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Data))).

-adjudicante(IdAd,Nome,Nif,Morada) :- 
    nao(adjudicante(IdAd,Nome,Nif,Morada)), 
    nao(excecao(adjudicante(IdAd,Nome,Nif,Morada))).

-adjudicataria(IdAda,Nome,Nif,Morada) :- 
    nao(adjudicataria(IdAda,Nome,Nif,Morada)),
    nao(excecao(adjudicataria(IdAda,Nome,Nif,Morada))).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Referencial: não existir mais do que uma ocorrência da mesma evidência na relação adjudicante/2

+adjudicante(IdAd,N,NIF,M) :: ( solucoes( (IdAd, NIF),
                                        (adjudicante(IdAd,_,_,_),
                                        adjudicante(_,_,NIF,_)),
                                        S ),
                                    comprimento(S,C),
                                    C == 1).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Referencial: não existir mais do que uma ocorrência da mesma evidência na relação adjudicataria/2

+adjudicataria(IdAda,N,NIF,M) :: ( solucoes( (IdAda,NIF),
                                            (adjudicataria(IdAda,_,_,_),
                                            adjudicataria(_,_,NIF,_)),
                                            S ),
                                    comprimento(S,C),
                                    C == 1).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Referencial: Adjudicante já existe

+contrato(IdAd,IdAda,TC,TP,D,V,P,L,Data) :: ( solucoes( IdAd,
                                                        adjudicante(IdAd,_,_,_),
                                                        S ),
                                                comprimento(S,N),
                                                N == 1).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Referencial: Adjudicataria já existe

+contrato(IdAd,IdAda,TC,TP,D,V,P,L,Data) :: ( solucoes( IdAda,
                                                        adjudicataria(IdAda,_,_,_),
                                                        S ),
                                                comprimento(S,N),
                                                N == 1).


%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de tipos de procedimento inválidos

+contrato(IdAd,IdAda,TC,TP,D,V,P,L,Data) :: ( solucoes( TP,
                                                       contrato(IdAd,IdAda,TC,TP,D,V,P,L,Data),
                                                       S ),
                                              pertence(TP,['ajuste direto', 'consulta previa', 'concurso publico']) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de contratos com tipo de procedimento ajuste direto e valor =< a 5000€

+contrato(IdAd,IdAda,TC,TP,D,V,P,L,Data) :: ( solucoes( V,
                                                        contrato(IdAd,IdAda,TC,'ajuste direto',D,V,P,L,Data),
                                                        S ),
                                              V =< 5000, V >= 0 ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de contratos com tipo de procedimento ajuste direto e tipos de contrato inválidos

+contrato(IdAd,IdAda,TC,TP,D,V,P,L,Data) :: ( solucoes( V,
                                                        contrato(IdAd,IdAda,TC,'ajuste direto',D,V,P,L,Data),
                                                        S ),
                                              pertence(TC,['contrato de aquisicao', 'locacao de bens moveis', 'aquisicao de servicos']) ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Invariante Estrutural: nao permitir a insercao de contratos com tipo de procedimento ajuste direto e prazo de vigência superior a 1 ano

%+contrato(IdAd,IdAda,TC,TP,D,V,P,L,Data) :: ( solucoes( DATA,
%                                                       contrato(IdAd,IdAda,TC,'ajuste direto',D,V,P,L,Data),
%                                                       S ) ).
                                            
%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :-
    Questao, !, fail.
nao( Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                            Resposta = { verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :-
    Questao.
demo( Questao,falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensao do predicado que permite a evolucao do conhecimento

evolucao( Termo ) :-
    solucoes( Invariante,+Termo::Invariante,Lista ),
    insercao( Termo ),
    teste( Lista ).

insercao( Termo ) :-
    assert( Termo ).
insercao( Termo ) :-
    retract( Termo ), !,fail.
	
teste( [] ).
teste( [R|LR] ) :-
    R,
    teste( LR ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
% Extensão do predicado que permite a involucao do conhecimento

involucao( Termo ) :-
    solucoes( Invariante,-Termo::Invariante,Lista ),
    remocao( Termo ),
    teste( Lista ).

remocao( Termo ) :-
    retract( Termo ).
remocao( Termo ) :-
    assert( Termo ),!,fail.

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
solucoes( X,Y,Z ) :-
    findall( X,Y,Z ).

comprimento( S,N ) :-
    length( S,N ).

pertence( X,[X|L] ).
pertence( X,[Y|L] ) :-
    X \= Y,
    pertence( X,L ).

%--------------------------------- - - - - - - - - - -  -  -  -  -   -
get_date_time_value(Key, Value) :-
    get_time(Stamp),
    stamp_date_time(Stamp, DateTime, local),
    date_time_value(Key, DateTime, Value).

%valida_data(DATA) :- datime(TIMESTAMP,DATA) 

getParte(_,[],'false').
getParte(1,[H|T],H).
getParte(X,[H|T],R) :- X1 is X - 1, getParte(X1,T,R).

%split_string(DATA,'/',L)
%06/04/2020