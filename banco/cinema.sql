CREATE DATABASE IF NOT EXISTS cinema;

USE cinema;

-- Apaga as tabelas antigas para começar do zero
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS analise;
DROP TABLE IF EXISTS filme;

SET FOREIGN_KEY_CHECKS = 1;

-- Cria a tabela de filmes
CREATE TABLE filme (
    id INT AUTO_INCREMENT PRIMARY KEY,
    genero VARCHAR(255),
    lancamento INT NOT NULL,
    sinopse VARCHAR(255),
    titulo VARCHAR(255)
);

-- Cria a tabela de análises
CREATE TABLE analise (
    id INT AUTO_INCREMENT PRIMARY KEY,
    analise VARCHAR(255),
    nota DOUBLE,
    filme_id INT,
    CONSTRAINT fk_analise_filme
        FOREIGN KEY (filme_id)
        REFERENCES filme(id)
);

-- Insere 100 filmes
INSERT INTO filme (titulo, genero, lancamento, sinopse) VALUES
('Superman', 'Ação e Aventura', 2025, 'Superman enfrenta novos desafios enquanto tenta proteger a humanidade e encontrar seu lugar no mundo.'),
('Quarteto Fantástico: Primeiros Passos', 'Ação e Ficção Científica', 2025, 'Uma equipe de heróis precisa enfrentar uma ameaça que pode colocar o planeta em perigo.'),
('Thunderbolts*', 'Ação e Super-Herói', 2025, 'Um grupo de personagens improváveis precisa trabalhar junto para enfrentar uma nova ameaça.'),
('Um Filme Minecraft', 'Aventura e Comédia', 2025, 'Um grupo de personagens é transportado para o mundo de Minecraft e precisa encontrar uma forma de voltar para casa.'),
('Jurassic World: Recomeço', 'Ação e Aventura', 2025, 'Uma nova aventura coloca humanos e dinossauros frente a frente em uma missão perigosa.'),
('Deadpool & Wolverine', 'Ação e Comédia', 2024, 'Deadpool se une a Wolverine em uma aventura cheia de ação, humor e situações inesperadas.'),
('Divertida Mente 2', 'Animação e Aventura', 2024, 'Novas emoções surgem na mente de Riley enquanto ela enfrenta uma nova fase de sua vida.'),
('Homem-Aranha: Um Novo Dia', 'Ação e Ficção Científica', 2026, 'Homem-Aranha enfrenta novos desafios enquanto tenta equilibrar sua vida pessoal e sua missão como herói.'),
('Toy Story 5', 'Animação e Comédia', 2026, 'Woody e seus amigos vivem uma nova aventura enquanto enfrentam mudanças inesperadas.'),
('Supergirl', 'Ação e Ficção Científica', 2026, 'Supergirl embarca em uma aventura pelo espaço enquanto descobre mais sobre seu passado.'),
('The Batman', 'Ação e Crime', 2022, 'Batman investiga uma série de crimes que revelam uma conspiração em Gotham City.'),
('O Senhor dos Anéis: A Guerra dos Rohirrim', 'Fantasia e Aventura', 2024, 'Uma história ambientada na Terra-média acompanha uma batalha pelo futuro de Rohan.'),
('Oppenheimer', 'Drama e História', 2023, 'A história do cientista responsável pelo desenvolvimento da primeira bomba atômica.'),
('Barbie', 'Comédia e Fantasia', 2023, 'Barbie começa a questionar seu mundo perfeito e embarca em uma aventura no mundo real.'),
('Duna: Parte Dois', 'Ficção Científica e Aventura', 2024, 'Paul Atreides se une aos Fremen enquanto busca vingança e tenta cumprir seu destino.'),
('Avatar: O Caminho da Água', 'Ficção Científica e Aventura', 2022, 'A família Sully precisa proteger seu novo lar enquanto enfrenta uma nova ameaça.'),
('Top Gun: Maverick', 'Ação e Drama', 2022, 'Um piloto veterano retorna para treinar uma nova geração de pilotos para uma missão extremamente perigosa.'),
('John Wick 4: Baba Yaga', 'Ação e Thriller', 2023, 'John Wick enfrenta novos inimigos enquanto procura uma forma de conquistar sua liberdade.'),
('Guardiões da Galáxia Vol. 3', 'Ação e Ficção Científica', 2023, 'Os Guardiões embarcam em uma última missão para salvar um de seus companheiros.'),
('Homem-Aranha: Através do Aranhaverso', 'Animação e Ação', 2023, 'Miles Morales encontra diferentes versões do Homem-Aranha enquanto enfrenta uma nova ameaça.'),
('Pantera Negra: Wakanda Para Sempre', 'Ação e Super-Herói', 2022, 'Wakanda precisa encontrar uma nova liderança enquanto enfrenta ameaças externas.'),
('Doutor Estranho no Multiverso da Loucura', 'Ação e Fantasia', 2022, 'Doutor Estranho explora diferentes universos e enfrenta perigos vindos do multiverso.'),
('Thor: Amor e Trovão', 'Ação e Comédia', 2022, 'Thor enfrenta uma nova ameaça enquanto tenta descobrir seu verdadeiro propósito.'),
('Avatar', 'Ficção Científica e Aventura', 2009, 'Um soldado chega a Pandora e acaba se envolvendo com o povo Na’vi.'),
('Vingadores: Ultimato', 'Ação e Super-Herói', 2019, 'Os Vingadores enfrentam as consequências de uma batalha que mudou o destino do universo.'),
('Vingadores: Guerra Infinita', 'Ação e Super-Herói', 2018, 'Os heróis da Marvel precisam enfrentar Thanos em uma batalha pelo destino do universo.'),
('Homem-Aranha: Sem Volta Para Casa', 'Ação e Super-Herói', 2021, 'Peter Parker enfrenta as consequências de ter sua identidade revelada.'),
('Homem-Aranha: Longe de Casa', 'Ação e Aventura', 2019, 'Peter Parker tenta aproveitar uma viagem enquanto uma nova ameaça surge.'),
('Homem-Aranha: De Volta ao Lar', 'Ação e Super-Herói', 2017, 'Peter Parker tenta equilibrar sua vida escolar com sua nova responsabilidade como herói.'),
('Capitão América: O Primeiro Vingador', 'Ação e Super-Herói', 2011, 'Steve Rogers se transforma em um supersoldado e luta contra uma organização inimiga.'),
('Capitão América: O Soldado Invernal', 'Ação e Thriller', 2014, 'Steve Rogers descobre uma conspiração dentro da própria organização que deveria proteger.'),
('Capitão América: Guerra Civil', 'Ação e Super-Herói', 2016, 'Os Vingadores se dividem por causa de diferentes opiniões sobre como os heróis devem agir.'),
('Homem de Ferro', 'Ação e Super-Herói', 2008, 'Um empresário desenvolve uma armadura tecnológica e decide usar suas habilidades para combater ameaças.'),
('Homem de Ferro 2', 'Ação e Super-Herói', 2010, 'Tony Stark enfrenta novos inimigos enquanto tenta lidar com as consequências de sua tecnologia.'),
('Homem de Ferro 3', 'Ação e Super-Herói', 2013, 'Tony Stark precisa superar seus medos enquanto enfrenta uma nova ameaça.'),
('Thor', 'Ação e Fantasia', 2011, 'Thor é enviado à Terra e precisa aprender importantes lições antes de recuperar seus poderes.'),
('Thor: O Mundo Sombrio', 'Ação e Fantasia', 2013, 'Thor precisa enfrentar uma antiga ameaça que coloca os Nove Reinos em perigo.'),
('Os Vingadores', 'Ação e Super-Herói', 2012, 'Um grupo de heróis se reúne para impedir uma invasão que ameaça a Terra.'),
('Guardiões da Galáxia', 'Ação e Ficção Científica', 2014, 'Um grupo de personagens improváveis se une para proteger uma poderosa esfera.'),
('Guardiões da Galáxia Vol. 2', 'Ação e Ficção Científica', 2017, 'Os Guardiões descobrem segredos sobre o passado de Peter Quill.'),
('Capitã Marvel', 'Ação e Ficção Científica', 2019, 'Uma piloto descobre seus poderes e acaba envolvida em um conflito intergaláctico.'),
('Viúva Negra', 'Ação e Espionagem', 2021, 'Natasha Romanoff confronta acontecimentos de seu passado.'),
('Shang-Chi e a Lenda dos Dez Anéis', 'Ação e Fantasia', 2021, 'Shang-Chi precisa enfrentar seu passado e uma antiga organização.'),
('Eternos', 'Ação e Fantasia', 2021, 'Um grupo de seres poderosos retorna para proteger a humanidade de uma ameaça ancestral.'),
('Homem-Formiga', 'Ação e Comédia', 2015, 'Um homem recebe uma tecnologia que permite alterar seu tamanho e se torna um herói improvável.'),
('Homem-Formiga e a Vespa', 'Ação e Comédia', 2018, 'Scott Lang se junta à Vespa em uma missão envolvendo o mundo quântico.'),
('Homem-Formiga e a Vespa: Quantumania', 'Ação e Ficção Científica', 2023, 'A família de Scott Lang fica presa em uma dimensão misteriosa.'),
('As Marvels', 'Ação e Ficção Científica', 2023, 'Três heroínas precisam trabalhar juntas depois que seus poderes começam a se conectar.'),
('Batman Begins', 'Ação e Crime', 2005, 'Bruce Wayne inicia sua transformação no herói que protegerá Gotham City.'),
('Batman: O Cavaleiro das Trevas Ressurge', 'Ação e Crime', 2012, 'Batman retorna para enfrentar uma ameaça que coloca Gotham em perigo.'),
('Coringa', 'Drama e Crime', 2019, 'Um homem marginalizado enfrenta uma sociedade que parece ignorá-lo completamente.'),
('Coringa: Delírio a Dois', 'Drama e Musical', 2024, 'Arthur Fleck enfrenta as consequências de seus atos enquanto sua história toma novos rumos.'),
('A Origem', 'Ficção Científica e Thriller', 2010, 'Um grupo utiliza tecnologia para entrar nos sonhos e tentar realizar uma missão complexa.'),
('Interestelar', 'Ficção Científica e Drama', 2014, 'Um grupo de astronautas viaja pelo espaço em busca de um novo lar para a humanidade.'),
('Tenet', 'Ação e Ficção Científica', 2020, 'Um agente precisa compreender uma tecnologia capaz de manipular a passagem do tempo.'),
('Matrix', 'Ficção Científica e Ação', 1999, 'Um programador descobre que a realidade que conhece é uma grande simulação.'),
('Matrix Reloaded', 'Ficção Científica e Ação', 2003, 'Neo continua sua jornada enquanto tenta descobrir mais sobre a Matrix.'),
('Matrix Revolutions', 'Ficção Científica e Ação', 2003, 'Neo enfrenta seu maior desafio em uma batalha pelo futuro da humanidade.'),
('O Senhor dos Anéis: A Sociedade do Anel', 'Fantasia e Aventura', 2001, 'Frodo recebe a missão de destruir um poderoso anel antes que ele caia nas mãos erradas.'),
('O Senhor dos Anéis: As Duas Torres', 'Fantasia e Aventura', 2002, 'A Sociedade se separa enquanto a guerra contra Sauron começa a crescer.'),
('O Senhor dos Anéis: O Retorno do Rei', 'Fantasia e Aventura', 2003, 'Os povos da Terra-média enfrentam sua maior batalha contra as forças de Sauron.'),
('O Hobbit: Uma Jornada Inesperada', 'Fantasia e Aventura', 2012, 'Bilbo Bolseiro parte em uma aventura inesperada ao lado de um grupo de anões.'),
('O Hobbit: A Desolação de Smaug', 'Fantasia e Aventura', 2013, 'Bilbo e os anões continuam sua jornada até a Montanha Solitária.'),
('O Hobbit: A Batalha dos Cinco Exércitos', 'Fantasia e Aventura', 2014, 'Uma grande batalha decide o destino da Terra-média.'),
('Harry Potter e a Pedra Filosofal', 'Fantasia e Aventura', 2001, 'Harry Potter descobre que é um bruxo e começa seus estudos em Hogwarts.'),
('Harry Potter e a Câmara Secreta', 'Fantasia e Aventura', 2002, 'Harry retorna a Hogwarts e enfrenta um novo mistério dentro da escola.'),
('Harry Potter e o Prisioneiro de Azkaban', 'Fantasia e Aventura', 2004, 'Harry descobre novos segredos sobre seu passado enquanto um prisioneiro perigoso foge.'),
('Harry Potter e o Cálice de Fogo', 'Fantasia e Aventura', 2005, 'Harry participa de um torneio mágico extremamente perigoso.'),
('Harry Potter e a Ordem da Fênix', 'Fantasia e Aventura', 2007, 'Harry precisa lidar com uma nova ameaça enquanto Hogwarts enfrenta mudanças.'),
('Harry Potter e o Enigma do Príncipe', 'Fantasia e Aventura', 2009, 'Harry descobre informações importantes sobre o passado de Voldemort.'),
('Harry Potter e as Relíquias da Morte: Parte 1', 'Fantasia e Aventura', 2010, 'Harry, Ron e Hermione deixam Hogwarts para procurar uma forma de derrotar Voldemort.'),
('Harry Potter e as Relíquias da Morte: Parte 2', 'Fantasia e Aventura', 2011, 'A batalha final entre Harry e Voldemort se aproxima.'),
('Piratas do Caribe: A Maldição do Pérola Negra', 'Aventura e Fantasia', 2003, 'Jack Sparrow se envolve em uma aventura para recuperar seu navio e enfrentar uma tripulação amaldiçoada.'),
('Piratas do Caribe: O Baú da Morte', 'Aventura e Fantasia', 2006, 'Jack Sparrow tenta escapar de uma dívida com o lendário Davy Jones.'),
('Piratas do Caribe: No Fim do Mundo', 'Aventura e Fantasia', 2007, 'Os piratas se unem para enfrentar uma poderosa ameaça marítima.'),
('Indiana Jones e os Caçadores da Arca Perdida', 'Aventura e Ação', 1981, 'Indiana Jones parte em busca de uma antiga relíquia antes que seus inimigos a encontrem.'),
('Indiana Jones e a Última Cruzada', 'Aventura e Ação', 1989, 'Indiana Jones embarca em uma aventura para encontrar seu pai e o Santo Graal.'),
('De Volta para o Futuro', 'Ficção Científica e Comédia', 1985, 'Um jovem viaja acidentalmente para o passado e precisa encontrar uma forma de voltar para casa.'),
('De Volta para o Futuro II', 'Ficção Científica e Comédia', 1989, 'Marty McFly viaja novamente pelo tempo e acaba alterando acontecimentos importantes.'),
('De Volta para o Futuro III', 'Ficção Científica e Aventura', 1990, 'Marty viaja ao Velho Oeste para salvar seu amigo Doc Brown.'),
('Jurassic Park', 'Ficção Científica e Aventura', 1993, 'Um parque com dinossauros clonados se transforma em um lugar extremamente perigoso.'),
('O Mundo Perdido: Jurassic Park', 'Aventura e Ficção Científica', 1997, 'Uma equipe retorna à ilha onde os dinossauros vivem livremente.'),
('Jurassic Park III', 'Aventura e Ficção Científica', 2001, 'Uma missão de resgate leva um grupo de pessoas de volta à ilha dos dinossauros.'),
('Jurassic World', 'Ação e Aventura', 2015, 'Um parque de dinossauros moderno enfrenta uma ameaça criada geneticamente.'),
('Jurassic World: Reino Ameaçado', 'Ação e Aventura', 2018, 'Os dinossauros precisam ser resgatados quando a ilha é ameaçada por uma catástrofe.'),
('Jurassic World: Domínio', 'Ação e Aventura', 2022, 'Humanos e dinossauros precisam encontrar uma forma de coexistir em um mundo transformado.'),
('O Rei Leão', 'Animação e Aventura', 1994, 'Um jovem leão precisa assumir seu lugar como rei depois de enfrentar uma grande perda.'),
('O Rei Leão', 'Aventura e Drama', 2019, 'Uma nova versão da história acompanha Simba em sua jornada para se tornar rei.'),
('Procurando Nemo', 'Animação e Aventura', 2003, 'Um peixe atravessa o oceano em busca de seu filho desaparecido.'),
('Procurando Dory', 'Animação e Aventura', 2016, 'Dory embarca em uma jornada para encontrar sua família.'),
('Os Incríveis', 'Animação e Ação', 2004, 'Uma família de super-heróis precisa voltar à ação para enfrentar uma nova ameaça.'),
('Os Incríveis 2', 'Animação e Ação', 2018, 'A família Pêra enfrenta novos desafios enquanto tenta equilibrar a vida familiar e o heroísmo.'),
('WALL-E', 'Animação e Ficção Científica', 2008, 'Um pequeno robô continua trabalhando sozinho na Terra e acaba encontrando uma nova esperança.'),
('Ratatouille', 'Animação e Comédia', 2007, 'Um rato apaixonado por culinária sonha em se tornar um grande chef.'),
('Up: Altas Aventuras', 'Animação e Aventura', 2009, 'Um idoso viaja para uma região distante levando sua casa presa a milhares de balões.'),
('Viva: A Vida é uma Festa', 'Animação e Fantasia', 2017, 'Um jovem músico viaja para o mundo dos mortos e descobre segredos sobre sua família.'),
('Shrek', 'Animação e Comédia', 2001, 'Um ogro que vive tranquilamente em seu pântano acaba embarcando em uma grande aventura.'),
('Shrek 2', 'Animação e Comédia', 2004, 'Shrek conhece a família de Fiona e precisa enfrentar novas situações inesperadas.'),
('Kung Fu Panda', 'Animação e Ação', 2008, 'Um panda improvável é escolhido para se tornar um grande mestre de kung fu.'),
('Como Treinar o Seu Dragão', 'Animação e Aventura', 2010, 'Um jovem viking faz amizade com um dragão e muda a relação entre humanos e criaturas.');

-- ANÁLISES
INSERT INTO analise (analise, nota, filme_id) VALUES

-- 1. Superman - 5 análises
('Uma ótima versão do personagem, com boas cenas de ação e uma história divertida.', 4.5, 1),
('Gostei bastante da personalidade do Superman e da forma como a história foi construída.', 5.0, 1),
('Esperava mais do filme. Algumas partes ficaram um pouco previsíveis.', 3.0, 1),
('As cenas de ação são muito boas e o visual ficou excelente.', 4.5, 1),
('O filme consegue apresentar uma versão interessante do personagem.', 4.0, 1),

-- 2. Quarteto Fantástico - 4 análises
('A equipe tem uma boa química e o visual do filme ficou muito interessante.', 4.5, 2),
('O filme apresenta uma história divertida e bons personagens.', 4.0, 2),
('Achei o vilão pouco aproveitado e esperava mais das cenas de ação.', 2.5, 2),
('Gostei bastante da dinâmica entre os integrantes da equipe.', 4.5, 2),

-- 3. Thunderbolts - 3 análises
('A mistura de ação e humor funciona muito bem durante o filme.', 4.5, 3),
('Os personagens são interessantes e a dinâmica da equipe é um dos pontos fortes.', 4.0, 3),
('Algumas partes parecem repetitivas e o roteiro poderia ser melhor.', 3.0, 3),

-- 4. Minecraft - 5 análises
('É um filme divertido e cheio de referências ao jogo.', 4.0, 4),
('Gostei das criaturas e das cenas dentro do mundo de Minecraft.', 4.5, 4),
('A história é simples demais e parece voltada principalmente para crianças.', 2.5, 4),
('As referências ao jogo são um dos melhores pontos do filme.', 4.0, 4),
('É uma aventura leve e divertida para quem conhece o jogo.', 4.5, 4),

-- 5. Jurassic World: Recomeço - 4 análises
('As cenas de ação são muito boas e o filme entrega uma aventura divertida.', 4.5, 5),
('Gostei da ideia de explorar uma nova história dentro do universo de Jurassic Park.', 4.0, 5),
('Esperava mais do roteiro e achei alguns momentos previsíveis.', 2.5, 5),
('Os dinossauros são o grande destaque do filme.', 4.5, 5),

-- 6. Deadpool & Wolverine - 5 análises
('A combinação dos dois personagens funciona muito bem e o filme é muito divertido.', 5.0, 6),
('As cenas de ação e o humor são os grandes destaques.', 4.5, 6),
('Tem muitas piadas, mas algumas acabam ficando repetitivas.', 3.5, 6),
('Gostei bastante das referências e participações especiais.', 4.5, 6),
('A química entre Deadpool e Wolverine funciona muito bem.', 5.0, 6),

-- 7. Divertida Mente 2 - 3 análises
('Uma continuação muito boa e com uma história que consegue emocionar.', 5.0, 7),
('As novas emoções foram uma ótima escolha para continuar a história.', 4.5, 7),
('Gostei, mas achei o primeiro filme mais marcante.', 3.5, 7),

-- 8. Homem-Aranha: Um Novo Dia - 4 análises
('O Homem-Aranha continua sendo um dos personagens mais divertidos do cinema.', 4.5, 8),
('As cenas de ação são muito boas e o filme aproveita bem o personagem.', 5.0, 8),
('A história poderia ter desenvolvido melhor alguns personagens.', 3.0, 8),
('As cenas de ação são um dos grandes destaques.', 4.5, 8),

-- 9. Toy Story 5 - 5 análises
('Uma aventura divertida que mantém o espírito dos filmes anteriores.', 4.5, 9),
('Os personagens continuam carismáticos e a animação está muito bonita.', 4.0, 9),
('Achei que a franquia poderia ter terminado antes. Não me empolgou tanto.', 2.5, 9),
('Gostei das novas situações apresentadas na história.', 4.0, 9),
('A animação continua sendo um dos pontos fortes.', 4.5, 9),

-- 10. Supergirl - 4 análises
('A protagonista tem bastante carisma e as cenas espaciais ficaram muito boas.', 4.0, 10),
('Gostei da proposta e da aventura, principalmente das cenas de ação.', 4.5, 10),
('O roteiro deixou algumas partes confusas e não gostei muito do vilão.', 2.5, 10),
('A personagem principal consegue carregar bem a história.', 4.0, 10),

-- 11. The Batman - 5 análises
('Uma versão mais sombria do Batman, com uma ótima atmosfera e investigação.', 5.0, 11),
('Robert Pattinson combina muito bem com a proposta do personagem.', 4.5, 11),
('Gostei da ambientação, mas achei o ritmo um pouco lento em algumas partes.', 3.0, 11),
('A investigação é um dos pontos mais interessantes do filme.', 4.5, 11),
('A fotografia e a atmosfera de Gotham ficaram excelentes.', 5.0, 11),

-- 12. Guerra dos Rohirrim - 3 análises
('Uma ótima maneira de voltar ao universo de Tolkien com uma história diferente.', 4.5, 12),
('A animação e as batalhas são os grandes destaques do filme.', 4.0, 12),
('A história é interessante, mas não me envolveu tanto quanto a trilogia original.', 3.0, 12),

-- 13. Oppenheimer - 4 análises
('Um filme intenso e muito bem produzido.', 5.0, 13),
('A atuação e a construção da história são excelentes.', 4.5, 13),
('O filme é interessante, mas achei algumas partes muito longas.', 3.5, 13),
('A trilha sonora ajuda bastante na atmosfera do filme.', 4.5, 13),

-- 14. Barbie - 5 análises
('Um filme divertido que também consegue apresentar boas reflexões.', 4.5, 14),
('Gostei bastante do visual e das atuações.', 4.0, 14),
('Algumas mensagens ficaram um pouco exageradas para mim.', 3.0, 14),
('A direção de arte é um dos maiores destaques.', 5.0, 14),
('É um filme leve, divertido e diferente.', 4.5, 14),

-- 15. Duna: Parte Dois - 4 análises
('O visual do filme é impressionante e as batalhas são excelentes.', 5.0, 15),
('A história ficou ainda mais interessante nesta continuação.', 4.5, 15),
('Algumas partes são um pouco difíceis de acompanhar.', 3.5, 15),
('Um dos melhores filmes de ficção científica dos últimos anos.', 5.0, 15),

-- 16. Avatar: O Caminho da Água - 5 análises
('Os efeitos visuais são impressionantes.', 5.0, 16),
('O mundo de Pandora continua sendo um dos pontos fortes.', 4.5, 16),
('A história é boa, mas poderia ser um pouco mais curta.', 3.5, 16),
('As cenas debaixo d’água são incríveis.', 5.0, 16),
('A experiência visual é realmente impressionante.', 4.5, 16),

-- 17. Top Gun: Maverick - 3 análises
('As cenas de voo são incríveis e muito bem produzidas.', 5.0, 17),
('Uma continuação que conseguiu superar minhas expectativas.', 4.5, 17),
('A história é simples, mas funciona muito bem.', 4.0, 17),

-- 18. John Wick 4 - 4 análises
('As cenas de ação são espetaculares.', 5.0, 18),
('John Wick continua sendo um dos melhores filmes de ação.', 4.5, 18),
('Algumas lutas ficaram longas demais.', 3.5, 18),
('A fotografia e as cenas de combate são excelentes.', 5.0, 18),

-- 19. Guardiões da Galáxia Vol. 3 - 5 análises
('Uma história emocionante e muito boa para encerrar a equipe.', 5.0, 19),
('Os personagens continuam sendo o grande destaque.', 4.5, 19),
('O filme consegue misturar humor e emoção muito bem.', 4.5, 19),
('Algumas cenas são um pouco pesadas.', 3.5, 19),
('O encerramento dos personagens foi muito satisfatório.', 5.0, 19),

-- 20. Homem-Aranha: Através do Aranhaverso - 4 análises
('A animação é simplesmente incrível.', 5.0, 20),
('Miles Morales continua sendo um personagem excelente.', 4.5, 20),
('A quantidade de personagens pode deixar algumas partes confusas.', 4.0, 20),
('O estilo visual é um dos grandes destaques.', 5.0, 20),

-- 21. Wakanda Para Sempre - 5 análises
('O filme trata a perda do personagem com bastante emoção.', 4.5, 21),
('As cenas de ação são muito boas.', 4.0, 21),
('Algumas partes do roteiro poderiam ser melhores.', 3.0, 21),
('A relação entre os personagens é interessante.', 4.0, 21),
('A ambientação de Wakanda continua muito bonita.', 4.5, 21),

-- 22. Doutor Estranho no Multiverso da Loucura - 3 análises
('O multiverso deixa o filme muito interessante.', 4.5, 22),
('Gostei bastante do visual e das cenas de ação.', 4.5, 22),
('Algumas decisões da história não me convenceram.', 3.0, 22),

-- 23. Thor: Amor e Trovão - 4 análises
('O humor funciona bem em várias partes.', 4.0, 23),
('Thor continua sendo um personagem muito divertido.', 4.0, 23),
('Achei o vilão interessante, mas pouco desenvolvido.', 3.0, 23),
('O filme poderia ter aproveitado melhor alguns personagens.', 3.5, 23),

-- 24. Avatar - 5 análises
('Um dos mundos de ficção científica mais bonitos do cinema.', 5.0, 24),
('Os efeitos visuais continuam impressionantes.', 4.5, 24),
('A história é simples, mas funciona muito bem.', 4.0, 24),
('Pandora é um dos mundos mais interessantes do cinema.', 5.0, 24),
('A experiência visual continua excelente.', 4.5, 24),

-- 25. Vingadores: Ultimato - 3 análises
('Um encerramento emocionante para uma grande fase da Marvel.', 5.0, 25),
('As cenas de batalha são excelentes.', 5.0, 25),
('Algumas partes poderiam ter sido desenvolvidas melhor.', 4.0, 25),

-- 26. Guerra Infinita - 4 análises
('Thanos é um dos melhores vilões do universo Marvel.', 5.0, 26),
('O filme consegue trabalhar muitos personagens sem ficar parado.', 4.5, 26),
('O final é surpreendente e muito marcante.', 5.0, 26),
('A batalha final é uma das melhores da Marvel.', 4.5, 26),

-- 27. Homem-Aranha: Sem Volta Para Casa - 5 análises
('As participações especiais tornaram o filme muito divertido.', 5.0, 27),
('Uma das melhores aventuras do Homem-Aranha.', 4.5, 27),
('Alguns acontecimentos parecem convenientes demais.', 3.5, 27),
('O final é muito emocionante.', 5.0, 27),
('As referências aos filmes anteriores são muito boas.', 4.5, 27),

-- 28. Longe de Casa - 4 análises
('Uma aventura divertida com boas cenas de ação.', 4.0, 28),
('Mysterio é um ótimo vilão.', 4.5, 28),
('A história funciona bem como continuação.', 4.0, 28),
('As cenas de ilusão são muito criativas.', 4.5, 28),

-- 29. De Volta ao Lar - 3 análises
('Uma versão mais jovem e divertida do Homem-Aranha.', 4.5, 29),
('Tom Holland combina muito bem com o personagem.', 4.5, 29),
('O vilão poderia ter sido melhor aproveitado.', 3.5, 29),

-- 30. Capitão América: O Primeiro Vingador - 5 análises
('Uma boa história de origem para o personagem.', 4.0, 30),
('Steve Rogers é um protagonista muito carismático.', 4.5, 30),
('O terceiro ato poderia ser melhor.', 3.5, 30),
('A ambientação durante a Segunda Guerra ficou interessante.', 4.0, 30),
('O filme apresenta bem a origem do Capitão América.', 4.5, 30),

-- 31. Soldado Invernal - 4 análises
('Um dos filmes mais interessantes da Marvel.', 5.0, 31),
('As cenas de luta são excelentes.', 4.5, 31),
('A história de espionagem funciona muito bem.', 4.5, 31),
('O filme tem um tom diferente e muito interessante.', 5.0, 31),

-- 32. Guerra Civil - 5 análises
('A divisão entre os heróis cria ótimos conflitos.', 4.5, 32),
('Homem-Aranha e Pantera Negra são grandes destaques.', 4.5, 32),
('Algumas motivações poderiam ser melhor explicadas.', 3.5, 32),
('As cenas de ação são muito boas.', 4.5, 32),
('A luta entre os heróis é uma das melhores do MCU.', 5.0, 32),

-- 33. Homem de Ferro - 3 análises
('Um dos melhores filmes de origem de super-herói.', 5.0, 33),
('Tony Stark é um protagonista muito carismático.', 4.5, 33),
('O vilão poderia ter recebido mais destaque.', 3.5, 33),

-- 34. Homem de Ferro 2 - 4 análises
('O filme tem boas cenas de ação.', 4.0, 34),
('A introdução da Viúva Negra foi interessante.', 4.0, 34),
('O roteiro é um pouco confuso em algumas partes.', 3.0, 34),
('Tony Stark continua sendo o grande destaque.', 4.5, 34),

-- 35. Homem de Ferro 3 - 5 análises
('Gostei da abordagem mais pessoal do personagem.', 4.0, 35),
('As cenas de ação são muito boas.', 4.5, 35),
('O vilão não funcionou tão bem para mim.', 3.0, 35),
('A relação entre Tony e sua armadura é interessante.', 4.0, 35),
('O filme tem bons momentos de humor.', 4.0, 35),

-- 36. Thor - 4 análises
('Uma boa introdução ao personagem.', 4.0, 36),
('As paisagens de Asgard são muito bonitas.', 4.0, 36),
('A história é simples, mas divertida.', 3.5, 36),
('Loki é um dos destaques do filme.', 4.5, 36),

-- 37. Thor: O Mundo Sombrio - 3 análises
('O filme tem bons momentos de ação.', 3.5, 37),
('Loki continua sendo um dos melhores personagens.', 4.5, 37),
('O vilão poderia ser mais interessante.', 2.5, 37),

-- 38. Os Vingadores - 5 análises
('Ver todos os heróis juntos foi incrível.', 5.0, 38),
('O filme equilibra bem ação e humor.', 4.5, 38),
('A batalha final é excelente.', 5.0, 38),
('Loki funciona muito bem como vilão.', 4.5, 38),
('O encontro dos personagens é um dos melhores momentos.', 5.0, 38),

-- 39. Guardiões da Galáxia - 4 análises
('Um grupo de personagens muito divertido.', 4.5, 39),
('A trilha sonora é um dos destaques.', 5.0, 39),
('O humor funciona muito bem.', 4.5, 39),
('A história consegue ser divertida e emocionante.', 4.5, 39),

-- 40. Guardiões da Galáxia Vol. 2 - 5 análises
('A relação entre Peter e Ego é interessante.', 4.0, 40),
('O filme tem ótimas cenas emocionais.', 4.5, 40),
('Algumas piadas são repetitivas.', 3.5, 40),
('A trilha sonora continua excelente.', 4.5, 40),
('Yondu é um dos grandes destaques.', 5.0, 40),

-- 41. Capitã Marvel - 3 análises
('Uma boa aventura de origem.', 4.0, 41),
('Brie Larson combina com a personagem.', 4.0, 41),
('O filme poderia desenvolver melhor alguns personagens.', 3.0, 41),

-- 42. Viúva Negra - 4 análises
('Boas cenas de ação e espionagem.', 4.0, 42),
('A relação entre Natasha e sua família é interessante.', 4.5, 42),
('A história poderia ter sido mais importante para o universo.', 3.0, 42),
('As cenas de luta são muito boas.', 4.5, 42),

-- 43. Shang-Chi - 5 análises
('As cenas de luta são excelentes.', 5.0, 43),
('O protagonista é muito carismático.', 4.5, 43),
('A história mistura bem ação e fantasia.', 4.5, 43),
('O visual das batalhas é impressionante.', 5.0, 43),
('A relação familiar é um dos pontos fortes.', 4.5, 43),

-- 44. Eternos - 4 análises
('O visual do filme é muito bonito.', 4.0, 44),
('A proposta é diferente dos outros filmes da Marvel.', 4.0, 44),
('São muitos personagens para desenvolver.', 2.5, 44),
('Algumas partes ficaram lentas.', 3.0, 44),

-- 45. Homem-Formiga - 3 análises
('Uma aventura leve e divertida.', 4.0, 45),
('Paul Rudd combina muito com o personagem.', 4.5, 45),
('O vilão poderia ser melhor.', 3.0, 45),

-- 46. Homem-Formiga e a Vespa - 5 análises
('Uma continuação divertida.', 4.0, 46),
('A relação entre Scott e Hope funciona bem.', 4.0, 46),
('O vilão não é muito marcante.', 3.0, 46),
('As cenas no mundo quântico são interessantes.', 4.0, 46),
('O filme consegue manter um clima leve.', 4.5, 46),

-- 47. Quantumania - 4 análises
('O mundo quântico tem um visual interessante.', 4.0, 47),
('Kang é um vilão interessante.', 4.0, 47),
('A história parece exagerada em alguns momentos.', 3.0, 47),
('Gostei das criaturas e do visual do mundo quântico.', 4.0, 47),

-- 48. As Marvels - 5 análises
('As três protagonistas funcionam bem juntas.', 4.0, 48),
('O filme é divertido e tem boas cenas de ação.', 4.0, 48),
('A história poderia ser mais desenvolvida.', 3.0, 48),
('A interação entre as personagens é divertida.', 4.5, 48),
('É um filme leve e fácil de assistir.', 4.0, 48),

-- 49. Batman Begins - 3 análises
('Uma excelente história de origem para Batman.', 5.0, 49),
('Christian Bale faz um ótimo Batman.', 4.5, 49),
('A primeira metade é melhor que a segunda.', 4.0, 49),

-- 50. Cavaleiro das Trevas Ressurge - 4 análises
('Um encerramento digno para a trilogia.', 4.5, 50),
('Bane é um vilão muito marcante.', 4.5, 50),
('O filme é um pouco longo.', 3.5, 50),
('O final consegue fechar bem a história.', 4.5, 50),

-- 51. Coringa - 5 análises
('Uma atuação impressionante de Joaquin Phoenix.', 5.0, 51),
('O filme tem uma atmosfera muito marcante.', 5.0, 51),
('É um filme pesado e não funciona para todos.', 4.0, 51),
('A fotografia combina muito com a história.', 4.5, 51),
('A transformação do personagem é muito bem construída.', 5.0, 51),

-- 52. Coringa: Delírio a Dois - 3 análises
('A proposta musical é diferente e interessante.', 4.0, 52),
('As atuações são muito boas.', 4.0, 52),
('Achei o ritmo um pouco lento.', 3.0, 52),

-- 53. A Origem - 4 análises
('Uma história inteligente e muito bem construída.', 5.0, 53),
('O conceito dos sonhos é muito interessante.', 5.0, 53),
('Algumas explicações podem ser difíceis de acompanhar.', 4.0, 53),
('O final deixa uma ótima dúvida para o espectador.', 5.0, 53),

-- 54. Interestelar - 5 análises
('Um dos melhores filmes de ficção científica.', 5.0, 54),
('A trilha sonora é fantástica.', 5.0, 54),
('A história consegue emocionar bastante.', 4.5, 54),
('Algumas partes são um pouco complexas.', 4.0, 54),
('As cenas espaciais são incríveis.', 5.0, 54),

-- 55. Tenet - 3 análises
('A ideia de manipular o tempo é muito interessante.', 4.5, 55),
('As cenas de ação são excelentes.', 4.5, 55),
('A história é difícil de entender em alguns momentos.', 3.5, 55),

-- 56. Matrix - 4 análises
('Um clássico da ficção científica.', 5.0, 56),
('A ideia da Matrix é incrível.', 5.0, 56),
('As cenas de ação continuam muito boas.', 4.5, 56),
('O conceito do filme continua atual.', 5.0, 56),

-- 57. Matrix Reloaded - 5 análises
('A continuação expande bastante o universo.', 4.0, 57),
('As cenas de ação são excelentes.', 4.5, 57),
('Algumas conversas são longas demais.', 3.0, 57),
('A perseguição na estrada é muito boa.', 5.0, 57),
('O filme apresenta ideias interessantes sobre a Matrix.', 4.0, 57),

-- 58. Matrix Revolutions - 4 análises
('Um encerramento interessante para a trilogia.', 4.0, 58),
('A batalha final é muito boa.', 4.5, 58),
('O roteiro poderia explicar melhor algumas coisas.', 3.0, 58),
('Gostei da conclusão da história de Neo.', 4.0, 58),

-- 59. Sociedade do Anel - 3 análises
('Uma introdução perfeita para a Terra-média.', 5.0, 59),
('A ambientação é incrível.', 5.0, 59),
('A jornada dos personagens é muito envolvente.', 4.5, 59),

-- 60. Duas Torres - 5 análises
('As batalhas são espetaculares.', 5.0, 60),
('A história continua excelente.', 5.0, 60),
('A batalha do Abismo de Helm é inesquecível.', 5.0, 60),
('Gollum é um dos grandes destaques.', 4.5, 60),
('O desenvolvimento dos personagens é muito bom.', 4.5, 60),

-- 61. Retorno do Rei - 4 análises
('Um dos melhores finais de trilogia já feitos.', 5.0, 61),
('As batalhas são gigantescas e emocionantes.', 5.0, 61),
('O filme é longo, mas vale a pena.', 4.5, 61),
('O encerramento dos personagens é muito bom.', 5.0, 61),

-- 62. Hobbit Uma Jornada Inesperada - 5 análises
('Uma aventura divertida pela Terra-média.', 4.0, 62),
('Bilbo é um ótimo protagonista.', 4.5, 62),
('O filme poderia ser um pouco mais curto.', 3.5, 62),
('A viagem dos anões é muito interessante.', 4.0, 62),
('Smaug é uma ótima preparação para os próximos filmes.', 4.0, 62),

-- 63. Hobbit Desolação de Smaug - 3 análises
('Smaug é um dos grandes destaques.', 4.5, 63),
('A aventura continua muito interessante.', 4.0, 63),
('O final parece mais uma preparação para o próximo filme.', 3.5, 63),

-- 64. Hobbit Batalha dos Cinco Exércitos - 4 análises
('As batalhas são o ponto forte.', 4.0, 64),
('A conclusão é emocionante.', 4.5, 64),
('O filme tem ação demais em alguns momentos.', 3.5, 64),
('A conclusão da jornada de Bilbo é interessante.', 4.0, 64),

-- 65. Harry Potter Pedra Filosofal - 5 análises
('Uma ótima introdução ao mundo de Harry Potter.', 5.0, 65),
('Hogwarts é um lugar incrível.', 5.0, 65),
('A história é simples, mas muito divertida.', 4.5, 65),
('Os personagens são muito carismáticos.', 4.5, 65),
('É um filme que continua divertido mesmo depois de vários anos.', 5.0, 65),

-- 66. Harry Potter Câmara Secreta - 3 análises
('O mistério da Câmara Secreta funciona muito bem.', 4.5, 66),
('Dobby é um personagem muito divertido.', 4.5, 66),
('Algumas partes poderiam ser mais rápidas.', 4.0, 66),

-- 67. Harry Potter Prisioneiro de Azkaban - 4 análises
('Um dos melhores filmes da série.', 5.0, 67),
('A atmosfera é mais sombria e interessante.', 5.0, 67),
('Os personagens estão mais desenvolvidos.', 4.5, 67),
('A história de Sirius Black é muito boa.', 5.0, 67),

-- 68. Harry Potter Cálice de Fogo - 5 análises
('O torneio é muito divertido de acompanhar.', 4.5, 68),
('O filme começa a ficar mais sombrio.', 4.5, 68),
('Algumas partes do livro foram cortadas demais.', 3.5, 68),
('As provas do torneio são muito interessantes.', 4.5, 68),
('O final muda completamente o clima da saga.', 5.0, 68),

-- 69. Harry Potter Ordem da Fênix - 4 análises
('A Ordem da Fênix tem ótimos momentos.', 4.0, 69),
('Umbridge é uma vilã muito irritante.', 4.5, 69),
('O filme poderia desenvolver melhor alguns personagens.', 3.5, 69),
('A batalha no Ministério é muito boa.', 4.5, 69),

-- 70. Harry Potter Enigma do Príncipe - 3 análises
('O filme tem uma atmosfera excelente.', 4.5, 70),
('As informações sobre Voldemort são muito interessantes.', 4.5, 70),
('Algumas partes românticas ocupam espaço demais.', 3.5, 70),

-- 71. Harry Potter Relíquias 1 - 5 análises
('Um filme mais sombrio e diferente dos anteriores.', 4.5, 71),
('A jornada dos três protagonistas é muito boa.', 4.5, 71),
('O ritmo é um pouco lento em algumas partes.', 3.5, 71),
('A amizade entre os personagens é muito bem trabalhada.', 4.5, 71),
('A atmosfera combina muito com a fase final da história.', 5.0, 71),

-- 72. Harry Potter Relíquias 2 - 4 análises
('Um excelente encerramento para a saga.', 5.0, 72),
('A batalha de Hogwarts é incrível.', 5.0, 72),
('O final consegue emocionar bastante.', 5.0, 72),
('A conclusão dos personagens foi muito boa.', 4.5, 72),

-- 73. Piratas do Caribe 1 - 5 análises
('Jack Sparrow é um personagem inesquecível.', 5.0, 73),
('Uma aventura muito divertida.', 4.5, 73),
('As cenas de ação são excelentes.', 4.5, 73),
('A história dos piratas amaldiçoados é muito interessante.', 4.5, 73),
('Um dos melhores filmes de aventura.', 5.0, 73),

-- 74. Piratas do Caribe 2 - 3 análises
('Davy Jones é um ótimo vilão.', 4.5, 74),
('O filme tem boas cenas de aventura.', 4.5, 74),
('Algumas partes são confusas.', 3.5, 74),

-- 75. Piratas do Caribe 3 - 4 análises
('Uma conclusão épica para a história.', 4.0, 75),
('As batalhas no mar são muito boas.', 4.5, 75),
('O roteiro pode ser difícil de acompanhar.', 3.0, 75),
('O final é emocionante.', 4.5, 75),

-- 76. Indiana Jones 1 - 5 análises
('Um clássico absoluto de aventura.', 5.0, 76),
('Indiana Jones é um protagonista excelente.', 5.0, 76),
('As cenas de aventura continuam divertidas.', 4.5, 76),
('A história tem um ótimo ritmo.', 4.5, 76),
('Um dos grandes clássicos do gênero.', 5.0, 76),

-- 77. Indiana Jones Última Cruzada - 4 análises
('A relação entre Indiana e seu pai é ótima.', 5.0, 77),
('Uma aventura muito divertida.', 4.5, 77),
('O filme tem ótimas cenas de ação.', 4.5, 77),
('A história do Santo Graal é muito interessante.', 4.5, 77),

-- 78. De Volta para o Futuro - 3 análises
('Um clássico que continua muito divertido.', 5.0, 78),
('A viagem no tempo é muito bem utilizada.', 5.0, 78),
('Marty e Doc são uma ótima dupla.', 5.0, 78),

-- 79. De Volta para o Futuro II - 5 análises
('Uma continuação criativa e divertida.', 4.5, 79),
('As diferentes versões do futuro são muito interessantes.', 4.5, 79),
('Algumas partes são confusas.', 3.5, 79),
('A viagem entre diferentes períodos é muito divertida.', 5.0, 79),
('A criatividade do roteiro é um dos grandes destaques.', 4.5, 79),

-- 80. De Volta para o Futuro III - 4 análises
('Uma boa conclusão para a trilogia.', 4.5, 80),
('O Velho Oeste combina muito bem com a história.', 4.0, 80),
('É um pouco mais simples que os anteriores.', 3.5, 80),
('A relação entre Marty e Doc continua excelente.', 4.5, 80),

-- 81. Jurassic Park - 5 análises
('Um dos melhores filmes de dinossauros já feitos.', 5.0, 81),
('Os efeitos continuam impressionantes.', 5.0, 81),
('A tensão funciona muito bem.', 4.5, 81),
('A trilha sonora é inesquecível.', 5.0, 81),
('O filme continua divertido mesmo depois de muitos anos.', 5.0, 81),

-- 82. O Mundo Perdido - 3 análises
('A ideia de explorar uma segunda ilha é interessante.', 4.0, 82),
('Os dinossauros continuam sendo o destaque.', 4.5, 82),
('O roteiro é mais fraco que o primeiro.', 3.0, 82),

-- 83. Jurassic Park III - 4 análises
('Um filme divertido para quem gosta de dinossauros.', 3.5, 83),
('Algumas cenas de ação são boas.', 4.0, 83),
('A história é simples demais.', 2.5, 83),
('O filme é curto e fácil de assistir.', 3.5, 83),

-- 84. Jurassic World - 5 análises
('O parque funcionando novamente é uma ótima ideia.', 4.5, 84),
('As cenas com dinossauros são muito boas.', 4.5, 84),
('Alguns momentos parecem exagerados.', 3.5, 84),
('O Indominus Rex é uma ameaça interessante.', 4.0, 84),
('A nostalgia do primeiro filme funciona muito bem.', 4.5, 84),

-- 85. Jurassic World Reino Ameaçado - 4 análises
('A primeira parte do filme é muito interessante.', 4.0, 85),
('A ideia de salvar os dinossauros funciona bem.', 4.0, 85),
('A segunda metade perde um pouco o ritmo.', 3.0, 85),
('Algumas cenas de ação são muito boas.', 4.0, 85),

-- 86. Jurassic World Domínio - 5 análises
('Gostei de reunir personagens dos filmes antigos.', 4.0, 86),
('Os dinossauros continuam sendo o ponto forte.', 4.0, 86),
('O roteiro é exagerado em alguns momentos.', 3.0, 86),
('A ideia de humanos e dinossauros convivendo é interessante.', 4.0, 86),
('As cenas de ação são divertidas.', 4.5, 86),

-- 87. O Rei Leão 1994 - 3 análises
('Um clássico da animação.', 5.0, 87),
('A trilha sonora é inesquecível.', 5.0, 87),
('A história continua emocionante.', 5.0, 87),

-- 88. O Rei Leão 2019 - 4 análises
('O visual é muito realista.', 4.0, 88),
('As músicas continuam excelentes.', 4.5, 88),
('Prefiro a animação original.', 3.5, 88),
('A tecnologia utilizada no filme é impressionante.', 4.5, 88),

-- 89. Procurando Nemo - 5 análises
('Uma aventura emocionante e divertida.', 5.0, 89),
('Os personagens são muito carismáticos.', 4.5, 89),
('A história é ótima para todas as idades.', 5.0, 89),
('O relacionamento entre Marlin e Nemo é muito bom.', 5.0, 89),
('O mundo submarino é muito bonito.', 4.5, 89),

-- 90. Procurando Dory - 3 análises
('Dory continua sendo uma personagem muito divertida.', 4.5, 90),
('A história consegue emocionar.', 4.0, 90),
('Não é tão marcante quanto o primeiro.', 3.5, 90),

-- 91. Os Incríveis - 4 análises
('Uma das melhores animações de super-heróis.', 5.0, 91),
('A família funciona muito bem como protagonista.', 5.0, 91),
('As cenas de ação são excelentes.', 4.5, 91),
('O vilão é muito interessante.', 4.5, 91),

-- 92. Os Incríveis 2 - 5 análises
('Uma continuação muito divertida.', 4.5, 92),
('A animação está excelente.', 4.5, 92),
('O primeiro filme ainda é melhor.', 4.0, 92),
('As novas situações da família são interessantes.', 4.0, 92),
('Jack-Jack é um dos grandes destaques.', 5.0, 92),

-- 93. WALL-E - 3 análises
('Uma história simples, mas muito emocionante.', 5.0, 93),
('WALL-E é um personagem muito carismático.', 5.0, 93),
('A mensagem do filme é muito interessante.', 4.5, 93),

-- 94. Ratatouille - 4 análises
('Uma das animações mais criativas da Pixar.', 5.0, 94),
('A história é divertida e inspiradora.', 4.5, 94),
('A ambientação de Paris ficou muito bonita.', 4.5, 94),
('Remy é um protagonista muito carismático.', 5.0, 94),

-- 95. Up: Altas Aventuras - 5 análises
('O começo do filme é extremamente emocionante.', 5.0, 95),
('A aventura é muito divertida.', 4.5, 95),
('Carl e Russell formam uma ótima dupla.', 5.0, 95),
('A história consegue misturar humor e emoção.', 5.0, 95),
('A trilha sonora combina muito com a história.', 4.5, 95),

-- 96. Viva: A Vida é uma Festa - 4 análises
('Uma história muito bonita sobre família.', 5.0, 96),
('As músicas são excelentes.', 4.5, 96),
('O visual do mundo dos mortos é incrível.', 5.0, 96),
('O final é muito emocionante.', 5.0, 96),

-- 97. Shrek - 3 análises
('Um clássico da animação e da comédia.', 5.0, 97),
('O humor continua funcionando muito bem.', 5.0, 97),
('Os personagens são muito carismáticos.', 4.5, 97),

-- 98. Shrek 2 - 4 análises
('Uma continuação ainda melhor que o primeiro.', 5.0, 98),
('O Gato de Botas é um ótimo personagem.', 5.0, 98),
('O filme tem ótimas piadas.', 4.5, 98),
('A história consegue expandir muito bem o primeiro filme.', 4.5, 98),

-- 99. Kung Fu Panda - 5 análises
('Uma animação muito divertida e inspiradora.', 4.5, 99),
('Po é um protagonista muito carismático.', 5.0, 99),
('As cenas de luta são excelentes.', 4.5, 99),
('A história passa uma mensagem muito boa.', 4.5, 99),
('Os personagens secundários também são muito interessantes.', 4.0, 99),

-- 100. Como Treinar o Seu Dragão - 4 análises
('Uma das melhores animações de aventura.', 5.0, 100),
('A relação entre Soluço e Banguela é excelente.', 5.0, 100),
('A trilha sonora é muito bonita.', 4.5, 100),
('A história consegue emocionar bastante.', 5.0, 100);


-- Confere a quantidade de registros cadastrados
SELECT COUNT(*) AS total_filmes FROM filme;
SELECT COUNT(*) AS total_analises FROM analise;

-- Mostra os filmes cadastrados
SELECT * FROM filme;

