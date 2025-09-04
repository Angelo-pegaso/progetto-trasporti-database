-- schema.sql
-- Definizione tabelle per il sistema di biglietteria trasporti

CREATE TABLE Passeggero (
  id_passeggero SERIAL PRIMARY KEY,
  nome VARCHAR(50),
  cognome VARCHAR(50),
  documento VARCHAR(20) UNIQUE,
  email VARCHAR(100) UNIQUE,
  telefono VARCHAR(15)
);

CREATE TABLE Prenotazione (
  id_prenotazione SERIAL PRIMARY KEY,
  data TIMESTAMP NOT NULL,
  stato VARCHAR(20),
  id_passeggero INT REFERENCES Passeggero(id_passeggero)
);

CREATE TABLE Tratta (
  id_tratta SERIAL PRIMARY KEY,
  stazione_partenza VARCHAR(100),
  stazione_arrivo VARCHAR(100),
  orario_partenza TIMESTAMP,
  orario_arrivo TIMESTAMP
);

CREATE TABLE Mezzo (
  id_mezzo SERIAL PRIMARY KEY,
  tipo VARCHAR(30),
  capienza INT,
  compagnia VARCHAR(50)
);

CREATE TABLE Biglietto (
  id_biglietto SERIAL PRIMARY KEY,
  codice_qr VARCHAR(100) UNIQUE,
  data_emissione TIMESTAMP,
  validita BOOLEAN,
  id_prenotazione INT REFERENCES Prenotazione(id_prenotazione),
  id_tratta INT REFERENCES Tratta(id_tratta)
);

CREATE TABLE Pagamento (
  id_pagamento SERIAL PRIMARY KEY,
  importo DECIMAL(10,2),
  metodo VARCHAR(30),
  esito VARCHAR(20),
  id_prenotazione INT REFERENCES Prenotazione(id_prenotazione)
);
