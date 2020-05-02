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
:- dynamic id/1.
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

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
%Inserção de Adjudicantes

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

adjudicataria(1,'quim barreiros',987654321,'Vila').


contrato(1,1,1,'tipoContrato','tipoProcedimento','descricao',50000,300,'Amares',26,6,2020).
contrato(2,1,1,'tipoContrato','tipoProcedimento','descricao',10000,300,'Amares',26,6,2018).
contrato(3,1,1,'tipoContrato','tipoProcedimento','descricao',10000,300,'Amares',26,6,2019).
contrato(4,1,1,'tipoContrato','tipoProcedimento','descricao',4000000,300,'Amares',26,6,2016).
contrato(5,1,1,'tipoContrato','tipoProcedimento','descricao',5000,300,'Amares',26,6,2018).
%evolucao(contrato(1,1,1,'tipoContrato','ajuste direto','descricao',20,365,'Amares',26,6,2020)).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                           Adjudicantes                                                                   |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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

+adjudicataria(IdAd,N,NIF,M) :: ( solucoes( NIF,
                                            adjudicante(_,_,NIF,_),
                                            S ),
                                comprimento(S,C),
                                C == 0 ).

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                            Contrato                                                                      |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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


find(IdAd,IdAda,TC,Anos,R) :- solucoes((V), 
                              (contrato(_,IdAd,IdAda,TC,_,_,V,_,_,_,_,X),
                              pertence(X,Anos)), S),
                              soma(S,R).


id(R) :- solucoes( IdC,
                   contrato(IdC,_,_,_,_,_,_,_,_,_,_,_),
                   S ),
         maior(S,R1),
         R is R1 + 1.


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                    ESTADOS DE UM CONTRATO                                                                |%    
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%





% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                       META-PREDICADOS                                                                    |%    
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
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