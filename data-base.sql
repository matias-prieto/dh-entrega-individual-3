DROP DATABASE IF EXISTS notes_dh;
CREATE DATABASE notes_dh;
USE notes_dh;
CREATE TABLE users (
    id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(100) UNIQUE NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE notes (
    id INT NOT NULL AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(100) NOT NULL,
    creation_date DATETIME NOT NULL,
    modification_date DATETIME default CURRENT_TIMESTAMP,
    description TEXT NOT NULL,
    eliminated BIT(1),
    PRIMARY KEY (id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE category (
    id INT NOT NULL AUTO_INCREMENT,
    category_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE note_category (
    id INT NOT NULL AUTO_INCREMENT,
    note_id INT NOT NULL,
    category_id INT NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (note_id) REFERENCES notes(id),
    FOREIGN KEY (category_id) REFERENCES category(id)
); 

INSERT INTO users(email, first_name, last_name)
VALUES
("homero.simpson@gmail.com", "Homero", "Simpson"),
("bart.simpson@gmail.com", "Bart", "Simpson"),
("marge.simpson@gmail.com", "Marge", "Simpson"),
("lisa.simpson@gmail.com", "Lisa", "Simpson"),
("monty.burns@gmail.com", "Montgomery", "Burns"),
("apu.nahanoseque@gmail.com", "Apu", "Nahaalgo"),
("ned.flanders@gmail.com", "Ned", "Flanders"),
("house1000@gmail.com", "Milhouse", "Van Houten"),
("moe.szyslak@gmail.com", "Moe", "Szyslak"),
("edna.krabappel@gmail.com", "Edna", "Krabappel");

INSERT INTO notes(user_id, title, creation_date, description, eliminated)
VALUES
(1,"d oh",NOW(), "No explotar la planta nuclear", 0),   --aparentemente el la comilla del d'oh hace que el ";"
(2,"Como era",NOW(), "¡Ay, caramba!", 0),               --no pueda separar y no aparezca el Run SQL
(2,"Despues del cole",NOW(), "Ir a por mi skate", 0),   --*preguntar porque pasa esto, (aunque igual funciono)
(3,"Hay homero",NOW(), "¡Mmmhhh!", 0),
(3,"Para las vacaciones",NOW(), "Ahorrar cada moneda y ponerla en el frasco", 0),
(4,"Donde estudiar",NOW(), "Si alguien me necesita, estaré en mi habitación", 0),
(4,"Que estudiar hoy",NOW(), "Estudiar geografía", 0),
(5,"MONTY",NOW(), "Excelente", 0),
(5,"Que hacer si alguien se acerca",NOW(), "Smithers, suelte a los sabuesos", 0),
(6,"Simpsons",NOW(), "Señor Homero", 0),
(7,"-illo",NOW(), "¡Perfectirijillo!", 0),
(7,"Que hacer los domingos",NOW(), "Ir a la iglesia", 0),
(8,"Que no decir denuevo",NOW(), "Vacacioneeeeeees...EH!", 0),
(9,"Soy feo?",NOW(), "He sido llamado feo, muy muy feo, adefesio muy feo, pero jamas FEO FEO...", 0);


INSERT INTO category
VALUES
(DEFAULT,"Frases celebres"),
(DEFAULT,"Recordatorio"),
(DEFAULT,"Tecnologia"),
(DEFAULT,"Trabajo"),
(DEFAULT,"General"),
(DEFAULT,"Ciencia"),
(DEFAULT,"Colegio"),
(DEFAULT,"Proyectos"),
(DEFAULT,"Economia");

INSERT INTO note_category
VALUES
(DEFAULT,1,4),
(DEFAULT,2,1),
(DEFAULT,3,2),
(DEFAULT,4,1),
(DEFAULT,5,9),
(DEFAULT,6,1),
(DEFAULT,7,7),
(DEFAULT,8,1),
(DEFAULT,9,1),
(DEFAULT,10,1),
(DEFAULT,11,1),
(DEFAULT,12,2),
(DEFAULT,13,1),
(DEFAULT,14,1);

------------------------------------------------
--------------------TERMINE---------------------
------------------------------------------------

SELECT users.id, users.first_name, users.last_name, notes.description, category.category_name FROM users
INNER JOIN notes ON notes.user_id = users.id
INNER JOIN note_category ON note_category.note_id = notes.id
INNER JOIN category ON note_category.category_id = category.id

-- WHERE category.category_name = "Trabajo";
-- WHERE category_name = "Frases celebres";