DROP DATABASE tubodaapp;
CREATE DATABASE tubodaapp;
USE tubodaapp;
CREATE TABLE TUsuarios(
Usuario       VARCHAR(25) NOT NULL PRIMARY KEY,
Password      VARCHAR(12) NOT NULL
)CHARACTER SET utf8 COLLATE utf8_spanish_ci; 

Insert into TUsuarios (Usuario,Password)Values ('M@g.com','12345');

CREATE TABLE TPerfilBoda(
NombreBoda             VARCHAR(25) NOT NULL PRIMARY KEY,
Usuario                VARCHAR(25) NOT NULL,
NombrePersonaUno       VARCHAR(20) NOT NULL,
TipoPersonaUno         VARCHAR(12) NOT NULL,
NombrePersonaDos       VARCHAR(20) NOT NULL,
TipoPersonaDos         VARCHAR(12) NOT NULL,
FBoda                  DATE        NOT NULL,
RutaImagen             VARCHAR(50) ,
NombreCeremonia        VARCHAR(50) ,
DireccionCeremonia     VARCHAR(50) ,
CiudadCeremonia        VARCHAR(25) ,
HoraCeremonia          VARCHAR(12) ,
NombreCelebracion      VARCHAR(50) ,
DireccionCelebracion   VARCHAR(50) ,
CiudadCelebracion      VARCHAR(25) ,
HoraCelebracion        VARCHAR(12) ,
FHActualizacion        TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT Usuarios  FOREIGN KEY (Usuario)  REFERENCES TUsuarios(Usuario)
)CHARACTER SET utf8 COLLATE utf8_spanish_ci; 

CREATE TABLE TMesasInvitados(
NumeroMesa           TINYINT      NOT NULL ,
NombreBoda           VARCHAR(25)  NOT NULL ,
FHActualizacion      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(NumeroMesa,NombreBoda),
CONSTRAINT PerfilBodasMesas  FOREIGN KEY (NombreBoda)  REFERENCES TPerfilBoda(NombreBoda)
)CHARACTER SET utf8 COLLATE utf8_spanish_ci; 

CREATE TABLE TInvitados(
NombreInvitado       VARCHAR(15)  NOT NULL ,
NumeroMesa           TINYINT      NOT NULL ,
NombreBoda           VARCHAR(25)  NOT NULL ,
FHActualizacion      TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
PRIMARY KEY(NombreInvitado,NumeroMesa,NombreBoda),
CONSTRAINT InvitadosMesas  FOREIGN KEY (NombreBoda)  REFERENCES TMesasInvitados(NombreBoda),
CONSTRAINT InvitadosMesas2  FOREIGN KEY (NumeroMesa)  REFERENCES TMesasInvitados(NumeroMesa)
)CHARACTER SET utf8 COLLATE utf8_spanish_ci; 

CREATE TABLE TPublicaciones(
IdPublicacion        INTEGER      NOT NULL PRIMARY KEY AUTO_INCREMENT,
NombreBoda           VARCHAR(25)  NOT NULL,
Usuario              VARCHAR(12)  NOT NULL,
TipoPublicacion      VARCHAR(15)  NOT NULL,
Mensaje              VARCHAR(255) ,
RutaImagen           VARCHAR(22)  ,
FechaHora            TIMESTAMP   NOT NULL DEFAULT CURRENT_TIMESTAMP,
CONSTRAINT PerfilBodasPublicaciones  FOREIGN KEY (NombreBoda)  REFERENCES TPerfilBoda(NombreBoda),
CONSTRAINT UsuariosPublicaciones     FOREIGN KEY (Usuario)     REFERENCES TUsuarios(Usuario)
)CHARACTER SET utf8 COLLATE utf8_spanish_ci; 


