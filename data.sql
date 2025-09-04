-- data.sql
-- Inserimento dati di esempio per testare il database

INSERT INTO Passeggero (nome, cognome, documento, email, telefono)
VALUES ('Mario', 'Rossi', 'ABC12345', 'mario.rossi@example.com', '3331234567');

INSERT INTO Passeggero (nome, cognome, documento, email, telefono)
VALUES ('Luca', 'Bianchi', 'DEF67890', 'luca.bianchi@example.com', '3339876543');

INSERT INTO Tratta (stazione_partenza, stazione_arrivo, orario_partenza, orario_arrivo)
VALUES ('Roma Termini', 'Milano Centrale', '2025-09-10 09:00', '2025-09-10 12:30');

INSERT INTO Tratta (stazione_partenza, stazione_arrivo, orario_partenza, orario_arrivo)
VALUES ('Napoli Centrale', 'Firenze SMN', '2025-09-11 14:00', '2025-09-11 17:30');

INSERT INTO Mezzo (tipo, capienza, compagnia)
VALUES ('Treno Alta Velocità', 500, 'Ferrovie Italiane');

INSERT INTO Prenotazione (data, stato, id_passeggero)
VALUES ('2025-09-01 10:00', 'Confermata', 1);

INSERT INTO Pagamento (importo, metodo, esito, id_prenotazione)
VALUES (79.90, 'Carta di Credito', 'OK', 1);

INSERT INTO Biglietto (codice_qr, data_emissione, validita, id_prenotazione, id_tratta)
VALUES ('QR12345ABC', '2025-09-01 10:05', TRUE, 1, 1);
