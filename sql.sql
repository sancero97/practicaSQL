CREATE DATABASE evaluacion-practica;
USE evaluacion-practica;

CREATE TABLE Usuario (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
email VARCHAR(100)NOT NULL,
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Nota (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
titulo VARCHAR(100) NOT NULL,
fecha_creacion TIMESTAMP NULL DEFAULT NULL,
fecha_modificacion TIMESTAMP NULL DEFAULT NULL,
descripcion TEXT NOT NULL,
puede_eliminarse TINYINT NOT NULL,
id_usuario INT NOT NULL,
FOREIGN KEY (id_usuario) REFERENCES Usuario(id)
)

CREATE TABLE Categorias (
id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
nombre VARCHAR(100) NOT NULL
)

CREATE TABLE nota_categoria (
id_categoria INT NOT NULL,
id_nota INT NOT NULL,
FOREIGN KEY (id_categoria) REFERENCES Categorias(id),
FOREIGN KEY (id_nota) REFERENCES Nota(id)
)

INSERT INTO Usuario 
VALUES(DEFAULT, "pepito@gmail.com","Pepito")

INSERT INTO Usuario 
VALUES (DEFAULT, "carlos@gmail.com","Carlos")

INSERT INTO Usuario 
VALUES (DEFAULT, "juan@gmail.com","Juan")

INSERT INTO Usuario 
VALUES (DEFAULT, "ana@gmail.com","Ana"),
(DEFAULT, "antonio@gmail.com", "Antonio")

INSERT INTO Usuario 
VALUES (DEFAULT, "pedro@gmail.com","Pedro"),
(DEFAULT, "roberto@gmail.com","Roberto"),
(DEFAULT, "carmen@gmail.com","Carmen"),
(DEFAULT, "dario@gmail.com","Dario"),
(DEFAULT, "josefina@gmail.com","Josefina"),
(DEFAULT, "luna@gmail.com", "Luna")

SELECT * FROM Usuario u 

INSERT INTO Nota 
VALUES 
(DEFAULT, "Matemáticas", DEFAULT,DEFAULT,"Hizo la tarea de Matemáticas", 0,2)

SELECT * FROM Nota n 

UPDATE Nota 
SET fecha_creacion = NOW(), fecha_modificacion = NOW()
WHERE id = 1

UPDATE Nota
SET descripcion = "Tarea de Matemáticas"
WHERE id = 1

INSERT INTO Nota 
VALUES
(DEFAULT, "Historia", NOW(), NOW(), "Tarea de Historia",1, 6),
(DEFAULT, "Estadística", NOW(), NOW(), "Tarea de estadística", 0, 4),
(DEFAULT, "Geografía", NOW(), NOW(), "Tarea de geografía", 0, 3),
(DEFAULT, "Geometría", NOW(), NOW(), "Tarea de geometría", 1, 4),
(DEFAULT, "Ciencias", NOW(), NOW(), "Tarea de ciencias", 0, 2),
(DEFAULT, "Educación física", NOW(), NOW(), "Tarea de educación física", 1, 9),
(DEFAULT, "Religíon", NOW(), NOW(), "Tarea de religión", 0, 7),
(DEFAULT, "Química", NOW(), NOW(), "Tarea de química", 1, 8),
(DEFAULT, "Física", NOW(), NOW(), "Tarea de Física", 0, 6)



SELECT * FROM Nota n 


INSERT INTO Categorias 
VALUES
(DEFAULT,"Grado 1"),
(DEFAULT,"Grado 2"),
(DEFAULT,"Grado 3"),
(DEFAULT,"Grado 4"),
(DEFAULT,"Grado 5"),
(DEFAULT,"Grado 6"),
(DEFAULT,"Grado 7"),
(DEFAULT,"Grado 8"),
(DEFAULT,"Grado 9"),
(DEFAULT,"Grado 10")

SELECT * FROM Categorias c 

INSERT INTO nota_categoria 
VALUES
(2,4),
(3,2),
(5,6),
(7,3),
(1,1),
(5,6),
(8,10),
(10,3),
(4,4)
INSERT INTO nota_categoria 
VALUES (9,9)
/*Probando inner join*/
SELECT c.nombre, n.titulo 
FROM Categorias c
INNER JOIN nota_categoria nc ON nc.id_categoria = c.id 
INNER JOIN Nota n ON nc.id_nota = n.id 

SELECT u.nombre, n.descripcion 
FROM Usuario u 
INNER JOIN Nota n ON n.id_usuario = u.id 