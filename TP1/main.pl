% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Programacao em logica estendida

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% SICStus PROLOG: Declaracoes iniciais

:- use_module(library(system)).
:- set_prolog_flag( discontiguous_warnings,off ).
:- set_prolog_flag( single_var_warnings,off ).
:- set_prolog_flag( unknown,fail ).
:- consult('aux.pl').

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% SICStus PROLOG: Definicoes iniciais

:- op( 900,xfy,'::' ).
:- dynamic contrato/12.
:- dynamic adjudicante/4.
:- dynamic adjudicataria/4.
:- dynamic cancelado/1.
:- dynamic arquivado/1.

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Aplicação do PMF

-contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano) :- 
    nao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano)), 
    nao(excecao(contrato(IdC,IdAd,IdAda,TipoDeContrato,TipoDeProcedimento,Descricao,Valor,Prazo,Local,Dia,Mes,Ano))).

-adjudicante(IdAd,Nome,Nif,Morada) :- 
    nao(adjudicante(IdAd,Nome,Nif,Morada)), 
    nao(excecao(adjudicante(IdAd,Nome,Nif,Morada))).

-adjudicataria(IdAda,Nome,Nif,Morada) :- 
    nao(adjudicataria(IdAda,Nome,Nif,Morada)),
    nao(excecao(adjudicataria(IdAda,Nome,Nif,Morada))).

-cancelado(IdC) :- 
    nao(cancelado(IdC)), 
    nao(excecao(cancelado(IdC))).

-arquivado(IdC) :- 
    nao(arquivado(IdC)), 
    nao(excecao(arquivado(IdC))).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                    Base de Conhecimento                                                                  |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Inserção de Adjudicantes

adjudicante(1, 'Eduardo Ferreira', 700048781, 'Cernache do Bonjardim').
adjudicante(2, 'Orlando Amorim', 154705563, 'Alhandra').
adjudicante(3, 'Valentina Henriques', 220621364, 'Boticas').
adjudicante(4, 'Madeleine McCann', 563343317, 'Luz').
adjudicante(5, 'Vitor Leite', 233531777, 'Manteigas').
adjudicante(6, 'Hugo Antunes', 508648136, 'Carregado').
adjudicante(7, 'Rodolfo Branco', 527402224, 'Serra da Estrela').
adjudicante(8, 'Marcos Tavares', 234534531, 'Bombarral').
adjudicante(9, 'Zacarias Matos',  337133801, 'Montelavar').
adjudicante(10, 'William Pinto', 530788766, 'Nelas').
adjudicante(11, 'Valentim Garcia', 746735673, 'Caranguejeira').
adjudicante(12, 'Aida Melo', 113063545, 'Amares').
adjudicante(13, 'Manuela Morais', 453575823, 'Castro Daire').
adjudicante(14, 'Benjamim Campos', 846437787, 'Carnaxide').
adjudicante(15, 'Daniela Machado', 758862864, 'Vila do Conde').
adjudicante(16, 'Guilhermina Martins', 703000052, 'Alvito').
adjudicante(17, 'Rui Pedro', 655256365, 'Ferreira do Alentejo').
adjudicante(18, 'Frederica Martins', 513266124, 'Paredes').
adjudicante(19, 'Bruna Soares', 811236624, 'Castanheira de Pera').
adjudicante(20, 'Alexandre Neves', 452175840, 'Figueira de Castelo Rodrigo').

% Inserção de Adjudicatarias

adjudicataria(1, 'COFINA MEDIA, S.A.', 288881114, 'Ferrel').
adjudicataria(2, 'LISBOAGAS GDL - SOCIEDADE DISTRIBUIDORA DE GAS NATURAL DE LISBOA, S.A.', 416173057, 'Baiao').
adjudicataria(3, 'AGRUPALTO - AGRUPAMENTO DE PRODUTORES AGROPECUARIOS, S.A.', 133136500, 'Carvalho de Espingarda as Costas').
adjudicataria(4, 'SOAUTO - COMERCIO DE AUTOMOVEIS, S.A.', 661010031, 'Mogadouro').
adjudicataria(5, 'AVIPRONTO - PRODUTOS ALIMENTARES, S.A.', 101642875, 'Castanheira de Pera').
adjudicataria(6, 'DATABOX - INFORMATICA, S.A.', 130618810, 'Coruche').
adjudicataria(7, 'ARCOL, S.A.', 707857376, 'Crato').
adjudicataria(8, 'ARROWECS PORTUGAL, SOCIEDADE UNIPESSOAL, LDA', 455735168, 'Carrazeda de Ansiaes').
adjudicataria(9, 'CONSTANTINO FERNANDES OLIVEIRA & FILHOS, S.A.', 336086015, 'Ferreira do Zezere').
adjudicataria(10, 'SORGAL - SOCIEDADE DE OLEOS E RACOES, S.A.', 586086015, 'Freixo de Espada a Cinta').

% Inserção de Contratos

contrato(1,1,1,'contrato de aquisicao','ajuste direto','descricao',50000.1,300,'Amares',26,6,2020).
contrato(2,1,1,'contrato de aquisicao','ajuste direto','descricao',10000.45,300,'Amares',26,6,2018).
contrato(3,1,1,'contrato de aquisicao','ajuste direto','descricao',10000.57,300,'Amares',26,6,2019).
contrato(4,1,1,'contrato de aquisicao','ajuste direto','descricao',4000000.98,300,'Amares',26,6,2016).
%evolucao(contrato(5,1,1,'contrato de aquisicao','ajuste direto','descricao',250.356,365,'Amares',26,6,2020)).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                           Adjudicantes                                                                   |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Invariante Referencial: não existir mais do que uma ocorrência da mesma evidência na relação adjudicante/4

+adjudicante(IdAd,N,NIF,M) :: ( solucoes( (IdAd, NIF),
                                        (adjudicante(IdAd,_,_,_),
                                        adjudicante(_,_,NIF,_)),
                                        S ),
                                    comprimento(S,C),
                                    C == 1).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Referencial: não existir mais do que uma ocorrência do NIF nas relações adjudicante/4 e adjudicataria/4

+adjudicante(IdAd,N,NIF,M) :: ( solucoes( NIF,
                                        adjudicataria(_,_,NIF,_),
                                        S ),
                              comprimento(S,C),
                              C == 0 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Referencial: não permitir a involucao de um adjudicante caso este já tenha realizado um contrato

-adjudicante(IdAd,N,NIF,M) :: ( solucoes( IdAd,
                                          contrato(_,IdAd,_,_,_,_,_,_,_,_,_,_),
                                          S ),
                                comprimento(S,C),
                                C == 0 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                          Adjudicataria                                                                   |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Invariante Referencial: não existir mais do que uma ocorrência da mesma evidência na relação adjudicataria/4

+adjudicataria(IdAda,N,NIF,M) :: ( solucoes( (IdAda,NIF),
                                            (adjudicataria(IdAda,_,_,_),
                                            adjudicataria(_,_,NIF,_)),
                                            S ),
                                   comprimento(S,C),
                                   C == 1).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Referencial: não existir mais do que uma ocorrência do NIF nas relações adjudicante/4 e adjudicataria/4

+adjudicataria(IdAda,N,NIF,M) :: ( solucoes( NIF,
                                             adjudicante(_,_,NIF,_),
                                             S ),
                                   comprimento(S,C),
                                   C == 0 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Referencial: não permitir a involucao de um adjudicante caso este já tenha realizado um contrato

-adjudicataria(IdAda,N,NIF,M) :: ( solucoes( IdAda,
                                            contrato(_,_,IdAda,_,_,_,_,_,_,_,_,_),
                                            S ),
                                  comprimento(S,C),
                                  C == 0 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Referencial: não permitir a involucao de um adjudicante caso este já tenha realizado um contrato

-adjudicataria(IdAda,N,NIF,M) :: ( solucoes( IdAda,
                                            contrato(_,_,IdAda,_,_,_,_,_,_,_,_,_),
                                            S ),
                                  comprimento(S,C),
                                  C == 0 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                            Contrato                                                                      |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Invariante Referencial: não existir mais do que uma ocorrência do identificador de contrato na relação contrato/12

+contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano) :: ( solucoes( IdC,
                                                                   contrato(IdC,_,_,_,_,_,_,_,_,_,_,_),
                                                                   S ),
                                                         comprimento(S,N),
                                                         N == 1 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Referencial: existir uma ocorrência do identificador do adjudicante/4

+contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano) :: ( solucoes( IdAd,
                                                                   adjudicante(IdAd,_,_,_),
                                                                   S ),
                                                         comprimento(S,N),
                                                         N == 1 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Referencial: existir uma ocorrência do identificador do adjudicataria/4

+contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano) :: ( solucoes( IdAda,
                                                                   adjudicataria(IdAda,_,_,_),
                                                                   S ),
                                                         comprimento(S,N),
                                                         N == 1 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Estrutural: não permitir a inserção de tipos de procedimento inválidos

+contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano) :: pertence( TP,['ajuste direto', 'consulta previa', 'concurso publico'] ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Estrutural: não permitir a inserção de contratos com tipo de procedimento ajuste direto e valor =< a 5000€

+contrato(IdC,IdAd,IdAda,TC,'ajuste direto',D,V,P,L,Dia,Mes,Ano) :: (V =< 5000, V >= 0).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Estrutural: não permitir a inserção de contratos com tipo de procedimento ajuste direto e tipos de contrato inválidos

+contrato(IdC,IdAd,IdAda,TC,'ajuste direto',D,V,P,L,Dia,Mes,Ano) :: pertence( TC,['contrato de aquisicao', 'locacao de bens moveis', 'aquisicao de servicos'] ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Estrutural: não permitir a inserção de contratos com tipo de procedimento ajuste direto e prazo de vigência superior a 1 ano

+contrato(IdC,IdAd,IdAda,TC,'ajuste direto',D,V,P,L,Dia,Mes,Ano) :: (P =< 365, P > 0). 

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Estrutural: Uma entidade adjudicante não pode convidar a mesma empresa para celebrar um contrato com prestações de serviço do mesmo tipo ou 
% idênticas às de contratos que já lhe foram atribuídos, no ano económico em curso e nos dois anos económicos anteriores, sempre que o preço contratual 
% acumulado dos contratos já celebrados (não incluindo o contrato que se pretende celebrar) seja igual ou superior a 75.000 euros

+contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano) :: ( Ano1 is Ano - 1,
                                                         Ano2 is Ano - 2, 
                                                         find(IdAd,IdAda,TC,[Ano,Ano1,Ano2],R), 
                                                         X is R - V,
                                                         X < 75000 ).

% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– 

% Invariante Estrutural: não permitir a inserção de um valor inválido.

+contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano) :: valor_valido(V).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                    ESTADOS DE UM CONTRATO                                                                |%    
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Invariante Referencial: não existir mais do que uma ocorrência do identificador na relação cancelado/1

+cancelado(IdC) :: ( solucoes( IdC,
                               cancelado(IdC),
                               S ),
                     comprimento(S,N),
                     N == 1 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Invariante Referencial: não existir mais do que uma ocorrência do identificador na relação arquivado/1

+arquivado(IdC) :: ( solucoes( IdC,
                               arquivado(IdC),
                               S ),
                     comprimento(S,N),
                     N == 1 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                       META-PREDICADOS                                                                    |%    
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Extensao do meta-predicado nao: Questao -> {V,F}

nao( Questao ) :- Questao, !, fail.
nao( Questao ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensao do meta-predicado demo: Questao,Resposta -> {V,F}
%                                          Resposta = { verdadeiro,falso,desconhecido }

demo( Questao,verdadeiro ) :-   
    Questao.
demo( Questao,falso ) :-
    -Questao.
demo( Questao,desconhecido ) :-
    nao( Questao ),
    nao( -Questao ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

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

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

% Extensão do predicado que permite a involucao do conhecimento

involucao( Termo ) :-
    solucoes( Invariante,-Termo::Invariante,Lista ),
    remocao( Termo ),
    teste( Lista ).

remocao( Termo ) :-
    retract( Termo ).
remocao( Termo ) :-
    assert( Termo ),!,fail.