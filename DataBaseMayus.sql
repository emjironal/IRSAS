

/*Creación de las tablas de la base de datos*/

/*Tabla de MEDIDAs para los valores de las respuestas*/
CREATE TABLE MEDIDA( 
	ID INTEGER NOT NULL AUTO_INCREMENT, 
    Nombre VARCHAR (50),
    PRIMARY KEY ( ID )
  );
  
/*Tabla de provincias*/
CREATE TABLE PROVINCIA( 
  ID INTEGER NOT NULL, 
  Nombre VARCHAR (10),
  PRIMARY KEY ( ID )
  ) ;

/*Tabla de cantones*/
CREATE TABLE CANTON(
    ID           INTEGER NOT NULL ,
    Nombre       VARCHAR (20) ,
    Provincia_ID INTEGER NOT NULL,
    PRIMARY KEY ( ID, Provincia_ID )
  ) ;

/*Tabla de DISTRITOs*/
CREATE TABLE DISTRITO(
    ID                  INTEGER NOT NULL ,
    Nombre              VARCHAR (50) ,
    Canton_ID           INTEGER NOT NULL ,
    Provincia_ID INTEGER NOT NULL,
    Codigo 				INTEGER NOT NULL UNIQUE,
    PRIMARY KEY ( ID, Canton_ID, Provincia_ID ) 
  ) ;

/*Tabla de ASADAs*/
CREATE TABLE ASADA(
    ID                       INTEGER NOT NULL ,
    Nombre                       VARCHAR (150) ,
    DISTRITO_id                  INTEGER NOT NULL ,
    Latitud 					 VARCHAR (50),
    Longitud 					 VARCHAR (50),
    PRIMARY KEY ( ID )
  ) ;


/*Tabla de COMPONENTEs*/
CREATE TABLE COMPONENTE( 
	ID INTEGER NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR (50) NOT NULL, 
    Valor REAL(6,3) NOT NULL,
    PRIMARY KEY ( ID )
  ) ;

/*Tabla de SUBCOMPONENTEs*/
CREATE TABLE SUBCOMPONENTE( 
	ID INTEGER NOT NULL AUTO_INCREMENT, 
    Nombre VARCHAR (50), 
    Valor REAL(6,3) NOT NULL,
	COMPONENTE_ID INTEGER NOT NULL,
    CantPreguntas INTEGER,
    Siglas Varchar(5),
    PRIMARY KEY ( ID )
  ) ;

/*Tabla de INDICADORes*/
CREATE TABLE INDICADOR(
    ID            INTEGER NOT NULL AUTO_INCREMENT,
    Codigo        VARCHAR (10) ,
    SUBCOMPONENTE_ID INTEGER NOT NULL,
    MEDIDA_ID     INTEGER NOT NULL,
    Nombre 	  VARCHAR(200) NOT NULL,
    Valor			 REAL(6,3) NOT NULL,
    PRIMARY KEY ( ID )
  ) ;

/*Tabla de Respuestas*/
CREATE TABLE INDICADORXASADA(
    ID               INTEGER NOT NULL AUTO_INCREMENT,
    Año              INTEGER NOT NULL ,
    INDICADOR_ID INTEGER NOT NULL ,
    ASADA_ID     INTEGER NOT NULL,
    Valor			 REAL(6,3) NOT NULL,
    Texto			 VARCHAR(20) NOT NULL,
    PRIMARY KEY ( ID )
  );
  
  /*Tabla de Historico Respuestas*/
CREATE TABLE HISTORICORESPUESTA(
    ID               INTEGER NOT NULL,
    Año              INTEGER NOT NULL,
    INDICADOR_ID INTEGER NOT NULL,
    ASADA_ID     INTEGER NOT NULL,
    Valor			 REAL(6,3) NOT NULL,
    Texto			 VARCHAR(20) NOT NULL,
    PRIMARY KEY ( ID )
  );

/*Tabla de USUARIOs*/
CREATE TABLE USUARIO(
	ID INTEGER NOT NULL AUTO_INCREMENT, 
	Nombre varchar(100),
    USUARIO varchar(50) NOT NULL UNIQUE,
    Contrasenna varchar(50),
    Tipo integer(1),    
    PRIMARY KEY ( ID )
);

/*Tabla de LINEAL*/
CREATE TABLE LINEAL(
	ID INTEGER NOT NULL AUTO_INCREMENT,
    Pendiente REAL(6,3)  NULL,
    Ordenada REAL(6,3)  NULL,
    INDICADOR_ID INTEGER NULL,
    PRIMARY KEY ( ID )
);
/*Tabla de NOMINALes*/
CREATE TABLE NOMINAL(
	ID INTEGER NOT NULL AUTO_INCREMENT,
    Simbolo Varchar(2),
    Porcentaje REAL(6,3)  NULL,
    Valor 	INTEGER  NULL,
    INDICADOR_ID INTEGER NULL,
    PRIMARY KEY ( ID )
);

CREATE TABLE INDICADORINFO(
	ID INTEGER NOT NULL AUTO_INCREMENT,
    INDICADOR_ID INTEGER NULL,
    Descripcion Varchar(200),
    Formula Varchar(100),
    Fuente Varchar(100),
    Url Varchar(200),
    Responsable Varchar(100),
    Periodo Varchar(20),
    Observaciones Varchar(200),
    Frecuencia Varchar(20),
    PRIMARY KEY ( ID )
);

CREATE TABLE ASADAINFO(
	ID INTEGER NOT NULL AUTO_INCREMENT,
    ASADA_ID INTEGER NULL,
    Ubicacion Varchar(200),
    Telefono Varchar(15),
    Poblacion Varchar(6),
    Url Varchar(200),
    cantAbonados Varchar(6),
    PRIMARY KEY ( ID )
);

CREATE TABLE USUARIOXASADA(
    USUARIO_ID INTEGER NOT NULL UNIQUE,
    ASADA_ID INTEGER NOT NULL,
    PRIMARY KEY ( USUARIO_ID )
);




/*_______________REFERENCIAS FOREIGN KEYS_______________*/


/*REFERENCIA: ASADA-DISTRITO*/
ALTER TABLE ASADA ADD CONSTRAINT ASADA_DISTRITO_FK FOREIGN KEY ( DISTRITO_ID ) REFERENCES DISTRITO ( Codigo ) ON DELETE CASCADE;

/*REFERENCIA: CANTON-PROVINCIA*/
ALTER TABLE CANTON ADD CONSTRAINT CANTON_PROVINCIA_FK FOREIGN KEY ( PROVINCIA_ID ) REFERENCES PROVINCIA ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: DISTRITO-CANTON*/
ALTER TABLE DISTRITO ADD CONSTRAINT DISTRITO_CANTON_FK FOREIGN KEY ( CANTON_ID, PROVINCIA_ID ) REFERENCES CANTON ( ID, PROVINCIA_ID ) ON DELETE CASCADE ;

/*REFERENCIA: RESPUESTA-INDICADOR*/
ALTER TABLE INDICADORXASADA ADD CONSTRAINT INDICADOR_ASADA_IND_FK FOREIGN KEY ( INDICADOR_ID ) REFERENCES INDICADOR ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: RESPUESTA-ASADA*/
ALTER TABLE INDICADORXASADA ADD CONSTRAINT INDICADOR_ASADA_ASD_FK FOREIGN KEY ( ASADA_ID ) REFERENCES ASADA ( ID ) ON  DELETE CASCADE;


/*REFERENCIA: INDICADOR-MEDIDA*/
ALTER TABLE INDICADOR ADD CONSTRAINT INDICADOR_MEDIDA_FK FOREIGN KEY ( MEDIDA_ID ) REFERENCES MEDIDA ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: INDICADOR-SUBCOMPONENTE*/
ALTER TABLE INDICADOR ADD CONSTRAINT INDICADOR_SUBCOMPONENTE_FK FOREIGN KEY ( SUBCOMPONENTE_ID ) REFERENCES SUBCOMPONENTE ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: SUBCOMPONENTE-COMPONENTE*/
ALTER TABLE SUBCOMPONENTE ADD CONSTRAINT SUBCOMPONENTE_COMPONENTE_FK FOREIGN KEY ( COMPONENTE_ID ) REFERENCES COMPONENTE ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: NOMINAL-INDICADOR*/
ALTER TABLE NOMINAL ADD CONSTRAINT NOMINAL_INDICADOR_FK FOREIGN KEY ( INDICADOR_ID ) REFERENCES INDICADOR ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: LINEAL-INDICADOR*/
ALTER TABLE LINEAL ADD CONSTRAINT LINEAL_INDICADOR_FK FOREIGN KEY ( INDICADOR_ID ) REFERENCES INDICADOR ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: INDICADORINFO-INDICADOR*/
ALTER TABLE INDICADORINFO ADD CONSTRAINT INFO_INDICADOR_FK FOREIGN KEY ( INDICADOR_ID ) REFERENCES INDICADOR ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: ASADAINFO-ASADA*/
ALTER TABLE ASADAINFO ADD CONSTRAINT INFO_ASADA_FK FOREIGN KEY ( ASADA_ID ) REFERENCES ASADA ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: USUARIOASADA-ASADA*/
ALTER TABLE USUARIOXASADA ADD CONSTRAINT USUARIOASADA_ASADA_FK FOREIGN KEY ( ASADA_ID ) REFERENCES ASADA ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: USUARIOASADA-USUARIO*/
ALTER TABLE USUARIOXASADA ADD CONSTRAINT USUARIOASADA_USUARIO_FK FOREIGN KEY ( USUARIO_ID ) REFERENCES USUARIO ( ID ) ON DELETE CASCADE ;
