CREATE DATABASE Universidad_Potaxies;
USE Universidad_Potaxies;

CREATE TABLE Edificio (
    id_edificio INT PRIMARY KEY AUTO_INCREMENT, -- Identificador único
    nombre VARCHAR(100) NOT NULL                -- Nombre del edificio
);

CREATE TABLE Estudiantes (
    id_estudiante INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    fecha_nacimiento DATE,
    genero VARCHAR(50),
    correo VARCHAR(100) NOT NULL,
    Telefono VARCHAR(100) NOT NULL
);
CREATE TABLE Tipo_Calificacion (
    id_calificacion INT PRIMARY KEY AUTO_INCREMENT,
    descripcion VARCHAR(100) NOT NULL
);

CREATE TABLE Horarios (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    dia VARCHAR(20) NOT NULL,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL
);

CREATE TABLE Docentes (
    id_docente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(15)
);

CREATE TABLE Cursos (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nombre_curso VARCHAR(100) NOT NULL,
    descripcion TEXT,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);
CREATE TABLE Facultad (
    id_facultad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_edificio INT,
    FOREIGN KEY (id_edificio) REFERENCES Edificio(id_edificio) 
);

CREATE TABLE Facultad_Curso (
    id_facultad INT,
    id_curso INT,
    PRIMARY KEY (id_facultad, id_curso),
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso) 
);

CREATE TABLE Facultad_Docentes (
    id_facultad INT,
    id_docente INT,
    PRIMARY KEY (id_facultad, id_docente),
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad),
    FOREIGN KEY (id_docente) REFERENCES Docentes(id_docente) 
);
CREATE TABLE Facultad_Estudiantes (
    id_facultad INT,
    id_estudiante INT,
    PRIMARY KEY (id_facultad, id_estudiante),
    FOREIGN KEY (id_facultad) REFERENCES Facultad(id_facultad),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante) 
);
CREATE TABLE Cursos_Docente (
    id_curso INT,
    id_docente INT,
    PRIMARY KEY (id_curso, id_docente),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),  
    FOREIGN KEY (id_docente) REFERENCES Docentes(id_docente)  
);
CREATE TABLE Cursos_Estudiantes (
    id_curso INT,
    id_estudiante INT,
    PRIMARY KEY (id_curso, id_estudiante),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso), 
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante)  
);


CREATE TABLE Calificaciones (
    id_calificacion INT AUTO_INCREMENT,
    id_curso INT,
    id_estudiante INT,
    id_tipo_calificacion INT, 
    calificacion DECIMAL(5,2),
    fecha DATE,
    PRIMARY KEY (id_calificacion),
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),
    FOREIGN KEY (id_estudiante) REFERENCES Estudiantes(id_estudiante),
    FOREIGN KEY (id_tipo_calificacion) REFERENCES Tipo_Calificacion(id_calificacion) 
);

CREATE TABLE Aulas (
    id_aula INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    capacidad INT NOT NULL,
    id_edificio INT,
    FOREIGN KEY (id_edificio) REFERENCES Edificio(id_edificio) ON DELETE CASCADE
);
CREATE TABLE Cursos_Aulas (
    id_curso_aula INT PRIMARY KEY AUTO_INCREMENT,
    id_curso INT NOT NULL,
    id_aula INT NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES Cursos(id_curso),
    FOREIGN KEY (id_aula) REFERENCES Aulas(id_aula)
);

CREATE TABLE Aulas_Horario (
    id_aula INT NOT NULL,
    id_horario INT NOT NULL,
    PRIMARY KEY (id_aula, id_horario),
    FOREIGN KEY (id_aula) REFERENCES Aulas(id_aula) ,
    FOREIGN KEY (id_horario) REFERENCES Horarios(id_horario)
);





