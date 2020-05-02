:- consult('main.pl').

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                           Adjudicantes                                                                   |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Adicionar um adjudicante


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Remover um adjudicante

remove_ad(IdAd) :- involucao(adjudicante(IdAd,_,_,_)).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                          Adjudicataria                                                                   |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Remover uma adjudicataria

remove_ada(IdAda) :- involucao(adjudicataria(IdAda,_,_,_)).


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                            Contrato                                                                      |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Adicionar um contrato

add_contrato(IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano) :- idContrato(IdC),                                                        % get próximo id
                                                      evolucao(contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano)).   % inserir conhecimento

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                    ESTADOS DE UM CONTRATO                                                                |%    
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Predicado que cancela um contrato se este ainda estiver dentro do prazo.

cancelar(IdC) :- ( solucoes( IdC,
                             contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),
                             S ),
                   comprimento(S,N),
                   N == 1 ), 
                 findall(P,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R1),         % get R1 = [prazo]
                 head(R1,R2),                                                              % get R2 = prazo
                 findall(Dia,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R3),       % get R3 = [dia]
                 head(R3,R4),                                                              % get R4 = dia
                 findall(Mes,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R5),       % get R5 = [mes]
                 head(R5,R6),                                                              % get R6 = mes
                 findall(Ano,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R7),       % get R7 = [ano]
                 head(R7,R8),                                                              % get R8 = ano
                 cmp_datas(R4,R6,R8,R2),                                                   % validar prazo
                 evolucao(cancelado(IdC)).                                                 % inserir conhecimento

% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Predicado que arquiva um contrato se este já estiver expirado o seu prazo.

arquivar(IdC) :- ( solucoes( IdC,
                             contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),
                             S ),
                   comprimento(S,N),
                   N == 1 ), 
                 findall(P,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R1),         % get R1 = [prazo]
                 head(R1,R2),                                                              % get R2 = prazo
                 findall(Dia,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R3),       % get R3 = [dia]
                 head(R3,R4),                                                              % get R4 = dia
                 findall(Mes,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R5),       % get R5 = [mes]
                 head(R5,R6),                                                              % get R6 = mes
                 findall(Ano,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),R7),       % get R7 = [ano]
                 head(R7,R8),                                                              % get R8 = ano
                 nao(cmp_datas(R4,R6,R8,R2)),                                              % validar prazo
                 evolucao(arquivado(IdC)).                                                 % inserir conhecimento


% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
% Predicado que devolve o estado de um contrato.

estado(IdC) :- findall(IdC,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),S),
               length(S,N),
               N == 0,
               write('contrato inexistente').

estado(IdC) :- findall(IdC,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),S1),
               length(S1,N1),
               N1 == 1,
               findall(IdC,cancelado(IdC),S2),
               length(S2,N2),
               N2 == 1,
               write('contrato cancelado').

estado(IdC) :- findall(IdC,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),S1),
               length(S1,N1),
               N1 == 1,
               findall(IdC,arquivado(IdC),S2),
               length(S2,N2),
               N2 == 1,
               write('contrato arquivado').

estado(IdC) :- findall(IdC,contrato(IdC,IdAd,IdAda,TC,TP,D,V,P,L,Dia,Mes,Ano),S1),
               length(S1,N1),
               N1 == 1,
               findall(IdC,cancelado(IdC),S2),
               length(S2,N2),
               N2 == 0,
               findall(IdC,arquivado(IdC),S3),
               length(S3,N3),
               N3 == 0,
               write('contrato em vigor').