/*TABLA DE SOLICITUDASADAS*/
CREATE TABLE SOLICITUDASADA(
    ID                           INTEGER NOT NULL AUTO_INCREMENT ,
    NOMBRE                       VARCHAR (150) ,
    DISTRITO_ID                  INTEGER NOT NULL ,
    LATITUD 					 VARCHAR (50),
    LONGITUD 					 VARCHAR (50),
    ASOCIACION                   INTEGER,
    PENDIENTE                    BOOLEAN DEFAULT NULL,
    FECHAHORA                    DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY ( ID )
  ) ;
  
CREATE TABLE SOLICITUDASADAINFO(
	ID INTEGER NOT NULL AUTO_INCREMENT,
    ASADA_ID INTEGER NOT NULL,
    UBICACION VARCHAR(200),
    TELEFONO VARCHAR(15),
    POBLACION VARCHAR(6),
    URL VARCHAR(200),
    CANTABONADOS VARCHAR(6),
    CELULAR VARCHAR(15),
    PRIMARY KEY ( ID )
);

/*TABLA DE SOLICITUDUSUARIOS*/
CREATE TABLE SOLICITUDUSUARIO(
	ID INTEGER NOT NULL AUTO_INCREMENT, 
	NOMBRE VARCHAR(100),
    USUARIO VARCHAR(50) NOT NULL UNIQUE,
    CONTRASENNA VARCHAR(50),
    TIPO INTEGER(1),
    ASADA_ID INTEGER NOT NULL,
    PRIMARY KEY ( ID )
);

/*REFERENCIA: SOLICITUDASADA-DISTRITO*/
ALTER TABLE SOLICITUDASADA ADD CONSTRAINT SOLICITUDASADA_DISTRITO_FK FOREIGN KEY ( DISTRITO_ID ) REFERENCES DISTRITO ( CODIGO ) ON DELETE CASCADE;

/*REFERENCIA: SOLICITUDASADAINFO-SOLICITUDASADA*/
ALTER TABLE SOLICITUDASADAINFO ADD CONSTRAINT INFO_SOLICITUDASADA_FK FOREIGN KEY ( ASADA_ID ) REFERENCES SOLICITUDASADA ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: SOLICITUDUSUARIO-SOLICITUDASADA*/
ALTER TABLE SOLICITUDUSUARIO ADD CONSTRAINT SOLICITUDUSUARIO_SOLICITUDASADA_FK FOREIGN KEY ( ASADA_ID ) REFERENCES SOLICITUDASADA ( ID ) ON DELETE CASCADE ;
