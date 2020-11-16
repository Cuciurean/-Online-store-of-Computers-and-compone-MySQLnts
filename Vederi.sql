USE magazin_calculatoare;

-- -----------------------------------------------------------------------------------------------
/* Afisare produse cu pretul mai mare de 2000*/
CREATE VIEW A_Produse  
AS 
SELECT Produse.pnume As Nume, Produse.descriere As Descriere, Produse.pret as Pret
From Produse
	Where pret > 2000
	Go

  SELECT * FROM A_Produse
 -- ----------------------------------------------------------------------------------------
 /* Afisare cont Clint la Banca*/
 CREATE VIEW A_Cont AS 
SELECT dbo.Client.nume, dbo.Client.tel, dbo.Cont_Banca.cont_num
FROM   dbo.Client INNER JOIN
       dbo.Cont_Banca ON dbo.Client.id = dbo.Cont_Banca.id_C

SELECT * FROM A_Cont
-- -------------------------------------------------------------------------------------------- 

CREATE VIEW AFISARE_Sisteme1 
AS
SELECT        dbo.Produse.pnume, dbo.Produse.pret, dbo.Produse.descriere
FROM          dbo.Produse INNER JOIN
               dbo.Sisteme ON dbo.Produse.id = dbo.Sisteme.id_s

SELECT * FROM AFISARE_Sisteme1;
-- -----------------------------------------------------------------------------------------------

CREATE VIEW AFISARE_Componente 
AS
SELECT dbo.Produse.pnume, dbo.Produse.pret, dbo.Produse.descriere
FROM dbo.Produse INNER JOIN
     dbo.Componente ON dbo.Produse.id = dbo.Componente.id_c

SELECT * FROM AFISARE_Componente;
-- ----------------------------------------------------------------------------------------------

CREATE VIEW Afisare_stoc AS
SELECT dbo.Produse.pnume, dbo.Produse.pret, dbo.Produse.descriere, dbo.Stoc.nr_stoc, dbo.Stoc.cantitate
FROM dbo.Produse INNER JOIN
     dbo.Stoc ON dbo.Produse.id = dbo.Stoc.id_P
	 Where nr_stoc > 20

SELECT * FROM Afisare_stoc;

-- -----------------------------------------------------------------------------------------------

CREATE VIEW Afisare_discounts AS
SELECT dbo.Produse.pnume, dbo.Produse.pret, dbo.Produse.descriere, dbo.Discounts.pret_nou
FROM dbo.Produse INNER JOIN
     dbo.Discounts ON dbo.Produse.id = dbo.Discounts.id_P

SELECT * FROM Afisare_discounts;

-- ---------------------------------------------------------------------------------------------
CREATE VIEW Afisare_Comenzi AS
SELECT  dbo.Comenzi.id_C, dbo.Client.username, dbo.Client.nume, dbo.Client.email, dbo.Client.tel, dbo.Comenzi.id_P, dbo.Comenzi.id_a, dbo.Produse.pnume, dbo.Produse.pret, dbo.Produse.descriere
FROM  dbo.Comenzi INNER JOIN
      dbo.Client ON dbo.Comenzi.id_C = dbo.Client.id INNER JOIN
      dbo.Produse ON dbo.Comenzi.id_P = dbo.Produse.id

SELECT * FROM Afisare_Comenzi;


---------------------------------------------------------------------
CREATE VIEW Afisare_Date_Comanda AS
SELECT dbo.Client.username, dbo.Client.tel, dbo.Client.email, dbo.Produse.pnume, dbo.Produse.pret, dbo.Produse.descriere, dbo.Adresa.oras, dbo.Adresa.strada, dbo.Adresa.judet, dbo.Plata_Ramburs.mode
FROM  dbo.Client INNER JOIN
      dbo.Produse ON dbo.Client.id = dbo.Produse.id INNER JOIN
      dbo.Adresa ON dbo.Client.id = dbo.Adresa.id_a CROSS JOIN
      dbo.Plata_Ramburs

SELECT * FROM Afisare_Date_Comanda;