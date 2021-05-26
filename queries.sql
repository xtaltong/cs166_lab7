SELECT COUNT(*)
FROM part_nyc N
WHERE N.on_hand > 70;

/*reference: https://stackoverflow.com/questions/826365/how-do-i-add-two-count-results-together-on-two-different-tables */
SELECT
(SELECT COUNT(*)
FROM part_nyc N, color C
WHERE N.color = C.color_id AND C.color_name = 'Red')
+
(SELECT COUNT(*)
FROM part_sfo F, color C
WHERE F.color = C.color_id AND color_name = 'Red')
as totalParts;

SELECT S.supplier_id, S.supplier_name
FROM supplier S 
WHERE (SELECT SUM(N.on_hand) FROM part_nyc N WHERE S.supplier_id = N.supplier)
> (SELECT SUM(F.on_hand) FROM part_sfo F WHERE S.supplier_id = F.suppler);

SELECT S.supplier_id, S.supplier_name
FROM supplier S, part_nyc N, part_sfo F
WHERE S.supplier_id = N.supplier AND N.part_number != F.part_number;
/*reference: w3schools.com/sql/sql_update.asp */
UPDATE part_nyc
SET on_hand = on_hand - 10;

/*reference: w3schools.com/sql/sql_delete.asp */
DELETE FROM part_nyc
WHERE on_hand < 30;
