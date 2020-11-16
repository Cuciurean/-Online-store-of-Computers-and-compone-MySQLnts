USE magazin_calculatoare;

-- 1. Administrator

SELECT a.nume, a.prenume, a.pass
FROM Administrator a WHERE a.id = 4;

-- 2. Datele Clientilor

SELECT * FROM client;

-- 3. Numarul de produse 

SELECT DISTINCT COUNT(pnume)
FROM Produse;

-- 4. Produsele si datele clientilor ce au comanadat
/*
SELECT Produse.pnume, Produse.pret, Comenzi.cantitate, Plata.mode, Client.nume, Client.email, Client.tel, Client.username, Client.pass
FROM Comenzi 
	INNER JOIN Produse  ON Comenzi.id_P = Produse.id
	INNER JOIN Plata  ON Comenzi.id_Pay = Plata.id
	INNER JOIN Client  ON Comenzi.id_C = Client.id
GROUP BY Comenzi.id_C;
*/
-- 5. Suma Produselor Totala

SELECT SUM(pret)
FROM produse;

-- 6. Produsele cu Discount

SELECT  p.pnume AS product_name, p.pret AS normal_price, d.pret_nou AS discount_price	
FROM discounts d
	INNER JOIN produse p ON d.id_P = p.id
ORDER BY p.pnume;

-- 7. Cea mai buna oferta
/*
SELECT p.pnume AS Produs, MIN(d.pret_nou) AS Discount
FROM discounts d
INNER JOIN produse p ON d.id_P = p.id;
*/
-- 8. Produse fara discount

SELECT p.pnume, p.pret FROM produse p 
WHERE p.id NOT IN ( SELECT d.id_p FROM discounts d);

-- 9. Conturi Bancare
/*
SELECT c.nume, b.cont_num
FROM Cont_Banca b 
	INNER JOIN client c ON b.id_C = c.id
GROUP BY c.nume
ORDER BY c.nume;
*/
-- 10. Afisati produsele si stocul acestora
/*
SELECT p.pnume AS product_name, p.pret, s.cantitate, s.nr_stoc
FROM stoc s
	INNER JOIN produse p ON s.id_P = p.id
GROUP BY p.pnume
ORDER BY p.pnume;
*/
-- 11. Numele si pretul produsului cu pret minim

SELECT pnume, pret
FROM produse
WHERE pret = (SELECT MIN(pret) FROM produse);
    
-- 12. Pretul minim al produselor al caror nume incepe cu 'r'

SELECT MIN(pret)
FROM produse p
WHERE SUBSTRING(p.pnume, 1, 1) = 'r';
    
    
-- 13. Comenzile efectuate de clienti    
/*    
SELECT c.nume AS Client, COUNT(DISTINCT o.id)    
AS 'Numar comenzi', 
SUM(p.pret * s.cantitate) AS 'Valoare totatla'
FROM  client c
	INNER JOIN comenzi o ON c.id = o.id_C
	INNER JOIN produse p ON o.id_P = p.id
	INNER JOIN stoc s ON p.id = s.id_P
GROUP BY c.id;
*/

-- 14 Comezi mai mari de 1000

SELECT p.pnume, p.pret, o.cantitate
From Comenzi o 
	INNER JOIN produse p ON o.id_P = p.id
    WHERE p.pret>=1000;
   
-- 15 Afisare administratori in ordine alfabetica

/*SELECT nume
FROM Administrator 
GROUP BY nume asc;*/

-- 16 Produse in ordinea pretului

SELECT pret
FROM Produse
GROUP BY pret;

-- 17 Afisarea Produselor fara stoc
/*
SELECT p.pnume AS product_name, s.nr_stoc
FROM stoc s
	INNER JOIN produse p ON s.id_P = p.id
    WHERE s.nr_stoc= 0
	GROUP BY p.pnume;
	*/
-- 18 Clienti si adresa lor
/*
SELECT c.nume, c.email, c.tel, c.username, c.pass, a.judet, a.oras, a.strada, a.numar
FROM Comenzi o 
	INNER JOIN Client c ON o.id_C = c.id
    INNER JOIN Adresa a ON o.id_a = a.id_a
GROUP BY o.id_C;
*/
-- 19 Clineti din Cluj-Napoca

select c.nume, a.oras
from Comenzi o
	INNER JOIN Client c ON o.id_C = c.id
    INNER JOIN Adresa a ON o.id_a = a.id_a
where oras='Cluj-Napoca';


