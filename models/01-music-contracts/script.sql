CREATE TABLE agente (
    id     INTEGER NOT NULL,
    nombre VARCHAR2(128) NOT NULL
);

ALTER TABLE agente ADD CONSTRAINT agente_pk PRIMARY KEY ( id );

CREATE TABLE artista (
    id        INTEGER NOT NULL,
    nombre    VARCHAR2(128) NOT NULL,
    agente_id INTEGER NOT NULL,
    estilo_id INTEGER NOT NULL
);

ALTER TABLE artista ADD CONSTRAINT artista_pk PRIMARY KEY ( id );

CREATE TABLE clente (
    id        INTEGER NOT NULL,
    nombre    VARCHAR2(128) NOT NULL,
    agente_id INTEGER NOT NULL
);

ALTER TABLE clente ADD CONSTRAINT clente_pk PRIMARY KEY ( id );

CREATE TABLE contrato (
    id              INTEGER NOT NULL,
    clente_id       INTEGER NOT NULL,
    artista_id      INTEGER NOT NULL,
    fecha_ejecución DATE NOT NULL
);

ALTER TABLE contrato ADD CONSTRAINT contrato_pk PRIMARY KEY ( id );

CREATE TABLE estilo (
    id     INTEGER NOT NULL,
    nombre VARCHAR2(128) NOT NULL
);

ALTER TABLE estilo ADD CONSTRAINT estilo_pk PRIMARY KEY ( id );

CREATE TABLE factura (
    id          INTEGER NOT NULL,
    contrato_id INTEGER NOT NULL,
    fecha       DATE NOT NULL
);

CREATE UNIQUE INDEX factura__idx ON
    factura (
        contrato_id
    ASC );

ALTER TABLE factura ADD CONSTRAINT factura_pk PRIMARY KEY ( id );

ALTER TABLE artista
    ADD CONSTRAINT artista_agente_fk FOREIGN KEY ( agente_id )
        REFERENCES agente ( id );

ALTER TABLE artista
    ADD CONSTRAINT artista_estilo_fk FOREIGN KEY ( estilo_id )
        REFERENCES estilo ( id );

ALTER TABLE clente
    ADD CONSTRAINT clente_agente_fk FOREIGN KEY ( agente_id )
        REFERENCES agente ( id );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_artista_fk FOREIGN KEY ( artista_id )
        REFERENCES artista ( id );

ALTER TABLE contrato
    ADD CONSTRAINT contrato_clente_fk FOREIGN KEY ( clente_id )
        REFERENCES clente ( id );

ALTER TABLE factura
    ADD CONSTRAINT factura_contrato_fk FOREIGN KEY ( contrato_id )
        REFERENCES contrato ( id );

