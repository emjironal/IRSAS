﻿

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
    ID                         varchar(20) ,
    Nombre                       VARCHAR (150) ,
    DISTRITO_id                  INTEGER NOT NULL ,
    Latitud 					 VARCHAR (50),
    Longitud 					 VARCHAR (50),
    Estado                       BOOLEAN NOT NULL default 1,
    PRIMARY KEY ( ID )
  ) ;

/*Tabla de Asociaciones*/
CREATE TABLE ASOCIACION(
	ID INTEGER NOT NULL AUTO_INCREMENT,
	Nombre VARCHAR (150) NOT NULL,
	CantidadMiembros INTEGER NOT NULL,
	PRIMARY KEY (ID)
);

/*Tabla de AsociacionesXAsada*/
CREATE TABLE ASOCIACIONXASADA(
	ASOCIACION_ID INTEGER NOT NULL,
	ASADA_ID varchar(20),
	PRIMARY KEY (ASOCIACION_ID, ASADA_ID)
);


/*Tabla de COMPONENTEs*/
CREATE TABLE COMPONENTE( 
	ID INTEGER NOT NULL AUTO_INCREMENT,
    Nombre VARCHAR (50) NOT NULL, 
    Valor REAL(10,7) NOT NULL,
    PRIMARY KEY ( ID )
  ) ;

/*Tabla de SUBCOMPONENTEs*/
CREATE TABLE SUBCOMPONENTE( 
	ID INTEGER NOT NULL AUTO_INCREMENT, 
    Nombre VARCHAR (50), 
    Valor REAL(10,7) NOT NULL,
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
    Valor			 REAL(10,7) NOT NULL,
    PRIMARY KEY ( ID )
  ) ;

/*Tabla de Respuestas*/
CREATE TABLE INDICADORXASADA(
    ID               INTEGER NOT NULL AUTO_INCREMENT,
    anno              INTEGER NOT NULL ,
    INDICADOR_ID     INTEGER NOT NULL ,
    ASADA_ID         varchar(20) NOT NULL,
    Valor            REAL(10,7) NOT NULL,
    Texto            VARCHAR(20) NOT NULL,
    PRIMARY KEY ( ID )
  );
  
  /*Tabla de Historico Respuestas*/
CREATE TABLE HISTORICORESPUESTA(
    ID               INTEGER NOT NULL,
    anno              INTEGER NOT NULL,
    INDICADOR_ID     INTEGER NOT NULL,
    ASADA_ID         varchar(20) NOT NULL,
    Valor            REAL(10,7) NOT NULL,
    Texto            VARCHAR(20) NOT NULL,
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
    ASADA_ID varchar(20) NOT NULL,
    Ubicacion Varchar(200),
    Telefono Varchar(15),
    Poblacion Varchar(6),
    Url Varchar(200),
    cantAbonados Varchar(6),
    PRIMARY KEY ( ID )
);

CREATE TABLE USUARIOXASADA(
    USUARIO_ID INTEGER NOT NULL UNIQUE,
    ASADA_ID varchar(20) NOT NULL,
    PRIMARY KEY ( USUARIO_ID )
);

/*Tabla de Respuestas Temporal*/
CREATE TABLE TEMPRESPUESTAFORM(
    ID              INTEGER NOT NULL AUTO_INCREMENT,
    ANNO            INTEGER NOT NULL ,
    INDICADOR_ID    INTEGER NOT NULL ,
    ASADA_ID        varchar(20) NOT NULL,
    TEXTO           VARCHAR(20) NOT NULL,
    PRIMARY KEY ( ID )
  );
  
/*Tabla de RANGOS*/
CREATE TABLE RANGOXINDICADOR(
    ID              INTEGER NOT NULL AUTO_INCREMENT,
    INDICADOR_ID    INTEGER NOT NULL ,
    MINIMO          REAL(6,3) NOT NULL,
    MAXIMO          REAL(6,3) NOT NULL,
    PRIMARY KEY ( ID )
  );

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
    TIPO INTEGER(1) DEFAULT 2,
    ASADA_ID INTEGER NOT NULL,
    PRIMARY KEY ( ID )
);

/*TABLA DE AYUDAFORMULARIO*/
CREATE TABLE AYUDAFORMULARIO(
    ID                  INTEGER NOT NULL AUTO_INCREMENT,
    INDICADOR_ID        INTEGER NOT NULL,
    AYUDA               VARCHAR(500),
    URL                 VARCHAR(600),
    PRIMARY KEY(ID)
);

/*TABLA DE AYUDARIESGO*/
CREATE TABLE AYUDARIESGO(
    ID_Riesgo INTEGER NOT NULL AUTO_INCREMENT,
    AYUDA varchar(500),
    PRIMARY KEY(ID_Riesgo)
);

/*TABLA DE AYUDAXINDICADOR*/
Create table AYUDAXINDICADOR(
	ID_INDICADOR INTEGER NOT NULL,
	SUBCOMPONENTE INT NOT NULL,
	ID_TEXTO_MEJORA INT NOT NULL,
	LIMITE_INFERIOR REAL(10,7) NOT NULL,
	LIMITE_SUPERIOR REAL(10,7) NOT NULL,
	TEXTO_MEJORA varchar(max) NOT NULL, 
	primary key(ID_INDICADOR, ID_TEXTO_MEJORA)
);

/*TABLA DE NOTIFICACIONES_ADMIN*/
Create table NOTIFICACIONES_ADMIN(
  ID INT NOT NULL AUTO_INCREMENT,
  NOMBRE_USUARIO VARCHAR(50) NOT NULL,
  DETALLES VARCHAR(500) NOT NULL,
  FECHAHORA DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (ID)
);




/*_______________REFERENCIAS FOREIGN KEYS_______________*/


/*REFERENCIA: ASADA-DISTRITO*/
ALTER TABLE ASADA ADD CONSTRAINT ASADA_DISTRITO_FK FOREIGN KEY ( DISTRITO_ID ) REFERENCES DISTRITO ( Codigo ) ON DELETE CASCADE;

/*REFERENCIA: CANTON-PROVINCIA*/
ALTER TABLE CANTON ADD CONSTRAINT CANTON_PROVINCIA_FK FOREIGN KEY ( PROVINCIA_ID ) REFERENCES PROVINCIA ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: DISTRITO-CANTON*/
ALTER TABLE DISTRITO ADD CONSTRAINT DISTRITO_CANTON_FK FOREIGN KEY ( CANTON_ID, PROVINCIA_ID ) REFERENCES CANTON ( ID, PROVINCIA_ID ) ON DELETE CASCADE ;

/*REFERENCIA: ASOCIACIONXASADA-ASOCIACION*/
ALTER TABLE ASOCIACIONXASADA ADD CONSTRAINT ASOCIACIONXASADA_ASOCIACION_FK FOREIGN KEY ( ASOCIACION_ID ) REFERENCES ASOCIACION ( ID ) ON DELETE CASCADE ;
/*REFERENCIA: ASOCIACIONXASADA-ASADA*/
ALTER TABLE ASOCIACIONXASADA ADD CONSTRAINT ASOCIACIONXASADA_ASADA_FK FOREIGN KEY ( ASADA_ID ) REFERENCES ASADA ( ID ) ON DELETE CASCADE ;

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

/*REFERENCIA: TEMPRESPUESTA-INDICADOR*/
ALTER TABLE TEMPRESPUESTAFORM ADD CONSTRAINT TEMPRESPUESTAFORM_INDICADOR_FK FOREIGN KEY ( INDICADOR_ID ) REFERENCES INDICADOR ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: TEMPRESPUESTA-ASADA*/
ALTER TABLE TEMPRESPUESTAFORM ADD CONSTRAINT TEMPRESPUESTAFORM_ASADA_FK FOREIGN KEY ( ASADA_ID ) REFERENCES ASADA ( ID ) ON  DELETE CASCADE;

/*REFERENCIA: RANGOXINDICADOR-INDICADOR*/
ALTER TABLE RANGOXINDICADOR ADD CONSTRAINT RANGOXINDICADOR_INDICADOR_FK FOREIGN KEY ( INDICADOR_ID ) REFERENCES INDICADOR ( ID ) ON DELETE CASCADE;

/*REFERENCIA: SOLICITUDASADA-DISTRITO*/
ALTER TABLE SOLICITUDASADA ADD CONSTRAINT SOLICITUDASADA_DISTRITO_FK FOREIGN KEY ( DISTRITO_ID ) REFERENCES DISTRITO ( CODIGO ) ON DELETE CASCADE;

/*REFERENCIA: SOLICITUDASADAINFO-SOLICITUDASADA*/
ALTER TABLE SOLICITUDASADAINFO ADD CONSTRAINT INFO_SOLICITUDASADA_FK FOREIGN KEY ( ASADA_ID ) REFERENCES SOLICITUDASADA ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: SOLICITUDUSUARIO-SOLICITUDASADA*/
ALTER TABLE SOLICITUDUSUARIO ADD CONSTRAINT SOLICITUDUSUARIO_SOLICITUDASADA_FK FOREIGN KEY ( ASADA_ID ) REFERENCES SOLICITUDASADA ( ID ) ON DELETE CASCADE ;

/*REFERENCIA: AYUDAFORMULARIO-INDICADOR*/
ALTER TABLE AYUDAFORMULARIO ADD CONSTRAINT AYUDAFORMULARIO_INDICADOR_ID_FK FOREIGN KEY (INDICADOR_ID) REFERENCES INDICADOR (ID) ON DELETE CASCADE;

/*REFERENCIA: AYUDAXINDICADOR-INDICADOR*/

ALTER TABLE AYUDAXINDICADOR ADD CONSTRAINT AYUDAXINDICADOR_FK FOREIGN KEY (ID_INDICADOR) REFERENCES INDICADOR ( ID ) ON DELETE CASCADE;
/*REFERENCIA: AYUDAXINDICADOR-SUBCOMPONENTE*/

ALTER TABLE AYUDAXINDICADOR ADD CONSTRAINT AYUDAXINDICADOR_SUBCOMPONENTE_FK FOREIGN KEY (SUBCOMPONENTE) REFERENCES SUBCOMPONENTE ( ID ) ON DELETE CASCADE;

/*REFERENCIA: NOTIFICACIONES_ADMIN-USUARIO*/
ALTER TABLE NOTIFICACIONES_ADMIN ADD CONSTRAINT NOTIFICACIONES_ADMIN_FK FOREIGN KEY (NOMBRE_USUARIO) REFERENCES USUARIO (USUARIO) ON DELETE CASCADE;