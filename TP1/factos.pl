% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
%|                                                                            FACTOS                                                                        |%
% –––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––––– %
% - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -%

% Inserção de Adjudicantes
% Extensao do predicado adjudicante: IdAd, N, NIF, M -> {V,F}
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
% Extensao do predicado adjudicataria: IdAda, N, NIF, M -> {V,F}
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
% Extensao do predicado contrato: IdC, IdAd, IdAda, TC, TP, D, V, P, L, Dia, Mes, Ano -> {V,F}
contrato(1, 3, 4, 'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 2761.13, 246, 'Marinha das Ondas', 11, 1, 2018).
contrato(2, 6, 11, 'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 390.51, 218, 'Canical', 26, 2, 2011).
contrato(3, 4, 9, 'contrato de arrendamento', 'concurso publico', 'contrato de arrendamento de imovel', 91017.60, 466, 'Aveiras de Cima', 13, 8, 2013).
contrato(4, 4, 19, 'compra de carro', 'consulta previa', 'contrato de compra ou venda de veiculo', 83768.80, 506, 'Linda-a-Velha', 0, 3, 2019).
contrato(5, 9, 13, 'aquisicao de servicos', 'ajuste direto', 'contrato de aquisicao de servicos', 1181.86, 134, 'Alandroal', 6, 4, 2014).
contrato(6, 4, 8, 'compra de carro', 'concurso publico', 'contrato de compra ou venda de veiculo', 1689.44, 247, 'Alfandega da Fe', 5, 10, 2016).
contrato(7, 2, 9, 'contrato de habitacao', 'concurso publico', 'contrato de arrendamento de habitacao', 33116.98, 990, 'Mira de Aire', 3, 5, 2019).
contrato(8, 7, 14, 'compra de carro', 'concurso publico', 'contrato de compra ou venda de veiculo', 1985.46, 315, 'Apulia', 11, 9, 2014).
contrato(9, 3, 11, 'aquisicao de servicos', 'ajuste direto', 'contrato de aquisicao de servicos', 3323.13, 311, 'Caminha', 17, 6, 2012).
contrato(10, 3, 16, 'contrato de arrendamento', 'consulta previa', 'contrato de arrendamento de imovel', 83447.72, 197, 'Mira', 11, 7, 2017).
contrato(11, 5, 6, 'compra de carro', 'consulta previa', 'contrato de compra ou venda de veiculo', 2150.57, 650, 'Canecas', 27, 7, 2016).
contrato(12, 1, 13, 'contrato de trabalho', 'consulta previa', 'contrato de trabalho a termo certo', 81678.70, 778, 'Lousa', 27, 11, 2013).
contrato(13, 4, 14, 'compra de carro', 'consulta previa', 'contrato de compra ou venda de veiculo', 69245.32, 352, 'Barrancos', 26, 1, 2019).
contrato(14, 5, 9, 'contrato de trabalho', 'concurso publico', 'contrato de trabalho a termo certo', 23080.46, 805, 'Cumieira', 6, 3, 2013).
contrato(15, 6, 6, 'contrato de trabalho', 'concurso publico', 'contrato de trabalho a termo certo', 3770.60, 667, 'Condeixa-a-Nova', 25, 1, 2012).
contrato(16, 7, 19, 'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 2977.99, 358, 'Fornos de Algodres', 28, 2, 2012).
contrato(17, 6, 14, 'aluguer', 'concurso publico', 'contrato de aluguer', 64318.17, 626, 'Campo de Besteiros', 16, 1, 2017).
contrato(18, 5, 9, 'aluguer', 'consulta previa', 'contrato de aluguer', 61904.20, 26, 'Corvo', 0, 12, 2018).
contrato(19, 9, 6, 'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 4329.24, 186, 'Arruda dos Vinhos', 21, 5, 2016).
contrato(20, 9, 8, 'contrato de arrendamento', 'concurso publico', 'contrato de arrendamento de imovel', 20819.35, 646, 'Avanca', 14, 5, 2018).
contrato(21, 2, 14, 'contrato de arrendamento', 'consulta previa', 'contrato de arrendamento de imovel', 47304.45, 606, 'Nordeste', 17, 4, 2012).
contrato(22, 7, 19, 'compra de carro', 'consulta previa', 'contrato de compra ou venda de veiculo', 45546.58, 598, 'Cumieira', 19, 8, 2011).
contrato(23, 7, 18, 'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 4348.36, 170, 'Mogadouro', 29, 11, 2011).
contrato(24, 5, 19, 'contrato de habitacao', 'concurso publico', 'contrato de arrendamento de habitacao', 25145.97, 663, 'Monforte', 27, 5, 2015).
contrato(25, 4, 1, 'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 1731.16, 110, 'Chamusca', 23, 6, 2019).
contrato(26, 2, 10, 'compra de carro', 'concurso publico', 'contrato de compra ou venda de veiculo', 34358.66, 172, 'Marvao', 10, 6, 2018).
contrato(27, 7, 8, 'aluguer', 'concurso publico', 'contrato de aluguer', 81789.45, 834, 'Calheta', 29, 11, 2019).
contrato(28, 2, 12, 'contrato de arrendamento', 'concurso publico', 'contrato de arrendamento de imovel', 38962.08, 261, 'Alhadas', 27, 5, 2015).
contrato(29, 2, 17, 'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 3919.66, 251, 'Arganil', 19, 7, 2016).
contrato(30, 7, 19, 'contrato de habitacao', 'consulta previa', 'contrato de arrendamento de habitacao', 35347.26, 786, 'Ferreira do Alentejo', 4, 5, 2017).
contrato(31, 8, 6, 'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 1339.54, 356, 'Alcanena', 14, 12, 2013).
contrato(32, 2, 12, 'contrato de habitacao', 'consulta previa', 'contrato de arrendamento de habitacao', 66103.82, 785, 'Mortagua', 3, 3, 2015).
contrato(33, 3, 1, 'contrato de trabalho', 'consulta previa', 'contrato de trabalho a termo certo', 86284.71, 901, 'Arrifana', 2, 12, 2016).
contrato(34, 3, 14, 'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 4834.41, 219, 'Castelo de Paiva', 24, 12, 2015).
contrato(35, 8, 5, 'aluguer', 'concurso publico', 'contrato de aluguer', 38136.82, 404, 'Idanha-a-Nova', 21, 12, 2017).
contrato(36, 2, 3, 'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 1192.87, 32, 'Murtosa', 24, 2, 2015).
contrato(37, 7, 13, 'contrato de habitacao', 'consulta previa', 'contrato de arrendamento de habitacao', 2346.74, 832, 'Mogadouro', 2, 7, 2012).
contrato(38, 2, 4, 'compra de carro', 'concurso publico', 'contrato de compra ou venda de veiculo', 27029.95, 318, 'Marinha das Ondas', 16, 4, 2013).
contrato(39, 2, 2, 'contrato de habitacao', 'concurso publico', 'contrato de arrendamento de habitacao', 24278.61, 721, 'Alpiarca', 17, 10, 2011).
contrato(40, 9, 13, 'contrato de arrendamento', 'concurso publico', 'contrato de arrendamento de imovel', 33252.79, 991, 'Amares', 24, 11, 2018).
contrato(41, 9, 8, 'contrato de arrendamento', 'consulta previa', 'contrato de arrendamento de imovel', 68444.59, 12, 'Arronches', 14, 5, 2016).
contrato(42, 5, 15, 'contrato de trabalho', 'concurso publico', 'contrato de trabalho a termo certo', 13413.61, 532, 'Moimenta da Beira', 12, 2, 2014).
contrato(43, 3, 12, 'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 2579.32, 338, 'Cabeceiras de Basto', 21, 5, 2018).
contrato(44, 7, 12, 'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 3684.83, 52, 'Avis', 4, 6, 2017).
contrato(45, 9, 16, 'contrato de trabalho', 'concurso publico', 'contrato de trabalho a termo certo', 46638.28, 715, 'Baiao', 26, 9, 2014).
contrato(46, 1, 14, 'aluguer', 'consulta previa', 'contrato de aluguer', 97784.75, 375, 'Lousada', 4, 7, 2017).
contrato(47, 9, 14, 'contrato de habitacao', 'concurso publico', 'contrato de arrendamento de habitacao', 67620.97, 550, 'Baltar', 2, 11, 2015).
contrato(48, 5, 2, 'locacao de bens moveis', 'ajuste direto', 'contrato de locacao de um ou mais bens moveis', 2857.45, 156, 'Lousada', 22, 2, 2018).
contrato(49, 9, 3, 'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 2533.91, 46, 'Ancas', 8, 1, 2017).
contrato(50, 3, 19, 'contrato de aquisicao', 'ajuste direto', 'contrato de aquisicao de um bem', 3640.41, 22, 'Boticas', 29, 2, 2011).