-- PARA OBTENER LAS PREGUNTAS:
 -- 10 random
SELECT *
FROM preguntas
ORDER BY RAND()
LIMIT 10;

--- 4 fáciles, 3 medias y 3 difíciles
(
  SELECT * FROM preguntas 
  WHERE dificultad = 1
  ORDER BY RAND()
  LIMIT 4
)
UNION ALL
(
  SELECT * FROM preguntas 
  WHERE dificultad = 2
  ORDER BY RAND()
  LIMIT 3
)
UNION ALL
(
  SELECT * FROM preguntas 
  WHERE dificultad = 3
  ORDER BY RAND()
  LIMIT 3
);


-- como el anterior pero mezcladas:
SELECT * FROM (
  (
    SELECT * FROM preguntas 
    WHERE dificultad = 1
    ORDER BY RAND()
    LIMIT 4
  )
  UNION ALL
  (
    SELECT * FROM preguntas 
    WHERE dificultad = 2
    ORDER BY RAND()
    LIMIT 3
  )
  UNION ALL
  (
    SELECT * FROM preguntas 
    WHERE dificultad = 3
    ORDER BY RAND()
    LIMIT 3
  )
) AS mezcla
ORDER BY RAND();

-- Lo mejor, separarlo en varias querys y depsues juntarlas todas:

$historia = getPreguntas(1, 4);
$internacional = getPreguntas(2, 4);
$nacional = getPreguntas(3, 4);
$todas = array_merge($historia, $internacional, $nacional);

shuffle($todas);


function getPreguntas($conexion, $categoria, $limite) {
    $sql = "SELECT * FROM preguntas WHERE categoria = $categoria ORDER BY RAND() LIMIT $limite";
    $result = mysqli_query($conexion, $sql);

    $preguntas = [];
    while ($row = mysqli_fetch_assoc($result)) {
        $preguntas[] = $row;
    }

    return $preguntas;
}


-- PONER 135 preguntas minimo :)

INSERT INTO preguntas
(pregunta, opcion_a, opcion_b, opcion_c, opcion_d, respuesta_correcta, categoria, dificultad, autor_id, validada)
VALUES

-- 🏛️ HISTORIA (1)

('¿En qué país nació el fútbol moderno?', 'España', 'Inglaterra', 'Italia', 'Brasil', 'Inglaterra', 1, 1, 1, 1),
('¿En qué año se fundó la FIFA?', '1904', '1890', '1920', '1910', '1904', 1, 2, 1, 1),
('¿Quién ganó el primer Mundial (1930)?', 'Brasil', 'Argentina', 'Uruguay', 'Italia', 'Uruguay', 1, 1, 1, 1),
('¿Qué selección ganó el Mundial de 1950?', 'Brasil', 'Uruguay', 'Italia', 'Alemania', 'Uruguay', 1, 2, 1, 1),
('¿Dónde se celebró el primer Mundial?', 'Argentina', 'Brasil', 'Uruguay', 'Francia', 'Uruguay', 1, 1, 1, 1),
('¿Qué país ganó el Mundial de 1966?', 'Brasil', 'Inglaterra', 'Alemania', 'Italia', 'Inglaterra', 1, 1, 1, 1),
('¿Quién fue Pelé?', 'Entrenador', 'Árbitro', 'Jugador', 'Presidente', 'Jugador', 1, 1, 1, 1),
('¿Qué selección dominó los años 30?', 'Italia', 'Alemania', 'España', 'Francia', 'Italia', 1, 2, 1, 1),
('¿Cuántos Mundiales ganó Pelé?', '2', '3', '1', '4', '3', 1, 2, 1, 1),
('¿Qué país ganó el Mundial 1954?', 'Hungría', 'Alemania', 'Italia', 'Brasil', 'Alemania', 1, 2, 1, 1),
('¿Qué selección ganó Euro 1960?', 'España', 'URSS', 'Alemania', 'Italia', 'URSS', 1, 3, 1, 1),
('¿Quién fue Maradona?', 'Jugador', 'Árbitro', 'Presidente', 'Médico', 'Jugador', 1, 1, 1, 1),
('¿Qué selección ganó el Mundial 1970?', 'Italia', 'Alemania', 'Brasil', 'Argentina', 'Brasil', 1, 1, 1, 1),
('¿Quién marcó el "Gol del siglo"?', 'Pelé', 'Cruyff', 'Maradona', 'Messi', 'Maradona', 1, 2, 1, 1),
('¿Qué club fue fundado en 1899?', 'Madrid', 'Barça', 'Milan', 'Liverpool', 'Barça', 1, 3, 1, 1),
('¿Qué país ganó el Mundial 1982?', 'Brasil', 'Italia', 'Alemania', 'España', 'Italia', 1, 2, 1, 1),
('¿Qué país ganó el Mundial 1990?', 'Brasil', 'Argentina', 'Alemania', 'Italia', 'Alemania', 1, 2, 1, 1),
('¿Qué selección ganó el Mundial 1986?', 'Brasil', 'Argentina', 'Alemania', 'Italia', 'Argentina', 1, 1, 1, 1),
('¿Quién fue Johan Cruyff?', 'Jugador', 'Árbitro', 'Entrenador', 'Ambos', 'Ambos', 1, 2, 1, 1),
('¿Qué país ganó el Mundial 1974?', 'Brasil', 'Alemania', 'Italia', 'Argentina', 'Alemania', 1, 2, 1, 1),

-- 🌍 INTERNACIONAL (2)

('¿Quién ganó el Mundial 2018?', 'Francia', 'Croacia', 'Brasil', 'Alemania', 'Francia', 2, 1, 1, 1),
('¿Quién ganó el Mundial 2022?', 'Francia', 'Argentina', 'Brasil', 'Alemania', 'Argentina', 2, 1, 1, 1),
('¿Qué país tiene más Mundiales?', 'Alemania', 'Italia', 'Brasil', 'Argentina', 'Brasil', 2, 1, 1, 1),
('¿Qué país ganó la Euro 2008?', 'Italia', 'España', 'Alemania', 'Francia', 'España', 2, 1, 1, 1),
('¿Quién ganó la Champions 2020?', 'Madrid', 'Bayern', 'PSG', 'Liverpool', 'Bayern', 2, 2, 1, 1),
('¿Quién ganó la Champions 2022?', 'Madrid', 'Liverpool', 'City', 'PSG', 'Madrid', 2, 1, 1, 1),
('¿Qué país ganó la Euro 2016?', 'Portugal', 'Francia', 'España', 'Italia', 'Portugal', 2, 1, 1, 1),
('¿Qué selección ganó Copa América 2021?', 'Brasil', 'Argentina', 'Chile', 'Uruguay', 'Argentina', 2, 1, 1, 1),
('¿Qué club tiene más Champions?', 'Barça', 'Madrid', 'Milan', 'Liverpool', 'Madrid', 2, 1, 1, 1),
('¿Quién ganó Euro 2020?', 'Italia', 'Inglaterra', 'Francia', 'España', 'Italia', 2, 1, 1, 1),
('¿Qué país ganó Mundial 2014?', 'Argentina', 'Alemania', 'Brasil', 'España', 'Alemania', 2, 1, 1, 1),
('¿Quién ganó Champions 2019?', 'Liverpool', 'Tottenham', 'Barça', 'City', 'Liverpool', 2, 2, 1, 1),
('¿Qué país ganó Euro 2012?', 'Italia', 'España', 'Alemania', 'Portugal', 'España', 2, 1, 1, 1),
('¿Quién ganó Copa América 2015?', 'Chile', 'Argentina', 'Brasil', 'Uruguay', 'Chile', 2, 2, 1, 1),
('¿Qué país ganó Mundial 2010?', 'España', 'Holanda', 'Alemania', 'Brasil', 'España', 2, 1, 1, 1),
('¿Quién ganó Champions 2023?', 'City', 'Inter', 'Madrid', 'Bayern', 'City', 2, 1, 1, 1),
('¿Qué selección ganó Copa América 2019?', 'Brasil', 'Argentina', 'Chile', 'Uruguay', 'Brasil', 2, 1, 1, 1),
('¿Quién ganó Euro 2004?', 'Portugal', 'Grecia', 'Italia', 'España', 'Grecia', 2, 3, 1, 1),
('¿Quién ganó Champions 2015?', 'Barça', 'Madrid', 'Juventus', 'Bayern', 'Barça', 2, 2, 1, 1),
('¿Qué país ganó Mundial 2006?', 'Italia', 'Francia', 'Alemania', 'Brasil', 'Italia', 2, 1, 1, 1),

-- 🏆 NACIONAL (3)

('¿Qué club ha ganado más ligas en España?', 'Barça', 'Madrid', 'Atleti', 'Valencia', 'Madrid', 3, 1, 1, 1),
('¿Qué club ha ganado más Premier League?', 'Liverpool', 'United', 'City', 'Chelsea', 'United', 3, 1, 1, 1),
('¿Qué club domina la Bundesliga?', 'Bayern', 'Dortmund', 'Leipzig', 'Hamburgo', 'Bayern', 3, 1, 1, 1),
('¿Qué club ha ganado más Serie A?', 'Milan', 'Inter', 'Juventus', 'Roma', 'Juventus', 3, 1, 1, 1),
('¿Quién ganó LaLiga 2020?', 'Madrid', 'Barça', 'Atleti', 'Sevilla', 'Madrid', 3, 2, 1, 1),
('¿Quién ganó LaLiga 2021?', 'Madrid', 'Barça', 'Atleti', 'Sevilla', 'Atleti', 3, 1, 1, 1),
('¿Qué club ganó Premier 2016?', 'City', 'Leicester', 'United', 'Chelsea', 'Leicester', 3, 2, 1, 1),
('¿Qué club ganó Serie A 2021?', 'Juventus', 'Inter', 'Milan', 'Roma', 'Inter', 3, 2, 1, 1),
('¿Qué club ganó Bundesliga 2022?', 'Bayern', 'Dortmund', 'Leipzig', 'Leverkusen', 'Bayern', 3, 1, 1, 1),
('¿Qué club ganó Ligue 1 2020?', 'PSG', 'Lyon', 'Marsella', 'Lille', 'PSG', 3, 1, 1, 1),
('¿Qué club ganó Ligue 1 2021?', 'PSG', 'Lyon', 'Lille', 'Marsella', 'Lille', 3, 2, 1, 1),
('¿Qué club ganó LaLiga 2023?', 'Madrid', 'Barça', 'Atleti', 'Sevilla', 'Barça', 3, 1, 1, 1),
('¿Qué club ganó Premier 2023?', 'City', 'Arsenal', 'Liverpool', 'Chelsea', 'City', 3, 1, 1, 1),
('¿Qué club ganó Serie A 2022?', 'Milan', 'Inter', 'Napoli', 'Roma', 'Milan', 3, 2, 1, 1),
('¿Qué club ganó Bundesliga 2021?', 'Bayern', 'Dortmund', 'Leipzig', 'Schalke', 'Bayern', 3, 1, 1, 1),
('¿Qué club tiene más ligas en Francia?', 'PSG', 'Marsella', 'Lyon', 'Saint-Etienne', 'Saint-Etienne', 3, 3, 1, 1),
('¿Qué club ganó Serie A 2023?', 'Napoli', 'Milan', 'Inter', 'Juventus', 'Napoli', 3, 1, 1, 1),
('¿Qué club ganó Premier 2022?', 'City', 'Liverpool', 'Chelsea', 'United', 'City', 3, 1, 1, 1),
('¿Qué club ganó LaLiga 2022?', 'Madrid', 'Barça', 'Atleti', 'Sevilla', 'Madrid', 3, 1, 1, 1),
('¿Qué club ganó Bundesliga 2023?', 'Bayern', 'Dortmund', 'Leipzig', 'Union Berlin', 'Bayern', 3, 1, 1, 1);
