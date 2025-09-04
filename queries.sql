-- queries.sql
-- 1. Ricerca biglietti disponibili
SELECT t.id_tratta, t.stazione_partenza, t.stazione_arrivo, t.orario_partenza, t.orario_arrivo
FROM Tratta t
LEFT JOIN Biglietto b ON t.id_tratta = b.id_tratta
WHERE t.stazione_partenza = 'Roma'
  AND t.stazione_arrivo = 'Milano'
  AND t.orario_partenza::date = '2025-09-10';

-- 2. Storico prenotazioni di un cliente
SELECT p.id_prenotazione, p.data, p.stato, COUNT(b.id_biglietto) AS biglietti
FROM Prenotazione p
JOIN Biglietto b ON p.id_prenotazione = b.id_prenotazione
WHERE p.id_passeggero = 123
GROUP BY p.id_prenotazione, p.data, p.stato
ORDER BY p.data DESC;

-- 3. Verifica validità di un biglietto
SELECT validita FROM Biglietto WHERE codice_qr = 'ABC123XYZ';

-- 4. Elenco passeggeri su una determinata corsa
SELECT pa.nome, pa.cognome
FROM Passeggero pa
JOIN Prenotazione pr ON pa.id_passeggero = pr.id_passeggero
JOIN Biglietto b ON pr.id_prenotazione = b.id_prenotazione
WHERE b.id_tratta = 45;

-- 5. Analisi vendite per tratta
SELECT t.stazione_partenza, t.stazione_arrivo, COUNT(b.id_biglietto) AS biglietti_venduti, SUM(pg.importo) AS ricavi
FROM Tratta t
JOIN Biglietto b ON t.id_tratta = b.id_tratta
JOIN Prenotazione pr ON b.id_prenotazione = pr.id_prenotazione
JOIN Pagamento pg ON pr.id_prenotazione = pg.id_prenotazione
GROUP BY t.stazione_partenza, t.stazione_arrivo;

-- 6. Totale incassi per periodo
SELECT DATE_TRUNC('month', p.data) AS mese, SUM(pg.importo) AS incasso_mensile
FROM Prenotazione p
JOIN Pagamento pg ON p.id_prenotazione = pg.id_prenotazione
GROUP BY DATE_TRUNC('month', p.data)
ORDER BY mese;

-- 7. Tratte più prenotate
SELECT t.stazione_partenza, t.stazione_arrivo, COUNT(b.id_biglietto) AS totale_biglietti
FROM Tratta t
JOIN Biglietto b ON t.id_tratta = b.id_tratta
GROUP BY t.stazione_partenza, t.stazione_arrivo
ORDER BY totale_biglietti DESC
LIMIT 5;

-- 8. Ultime prenotazioni di un cliente
SELECT p.id_prenotazione, p.data, p.stato
FROM Prenotazione p
WHERE p.id_passeggero = 123
ORDER BY p.data DESC
LIMIT 10;

-- 9. Elenco biglietti emessi in un certo giorno
SELECT b.id_biglietto, b.codice_qr, b.data_emissione
FROM Biglietto b
WHERE b.data_emissione::date = '2025-09-01';

-- 10. Mezzi con più passeggeri
SELECT m.tipo, m.compagnia, COUNT(b.id_biglietto) AS passeggeri_totali
FROM Mezzo m
JOIN Tratta t ON m.id_mezzo = t.id_mezzo
JOIN Biglietto b ON t.id_tratta = b.id_tratta
GROUP BY m.tipo, m.compagnia
ORDER BY passeggeri_totali DESC;
