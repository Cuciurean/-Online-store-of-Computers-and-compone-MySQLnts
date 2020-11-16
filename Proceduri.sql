USE magazin_calculatoare

/* Afisare ututro clientilor*/
CREATE PROCEDURE Lista_clienti
AS
BEGIN
    SELECT  nume , username, pass
    FROM 
        Client
    ORDER BY 
        nume
END;
EXECUTE Lista_clienti;

---------------------------------------------------------------------
/* Afisarea numelui unui administrator*/

CREATE PROCEDURE Selectare_Administratori (@NumeAdmin nvarchar(50))
AS
Begin
    SELECT distinct  a.nume +' '+ a.prenume as 'Nume Administrator'
    FROM 
        Administrator a
        Where a.nume like @NumeAdmin
END
GO
EXECUTE Selectare_Administratori'%Andrei%';
-- ---------------------------------------------------------------------------------------
/* Adaugarea unui cont nou la banca*/
CREATE PROCEDURE AdaugareContBanca  @id_C int, @cont_nume varchar(40)
AS
	BEGIN
	Set NOCOUNT ON;
	Insert INTO Cont_Banca(id_C, cont_num)
	Values(@id_C, @cont_nume)
	End
EXECUTE AdaugareContBanca  16,'cont99';
-- --------------------------------------------------------------------------------------
/* Adaugarea unui client in baza de date */ /* da eroare da adauga*/
CREATE PROCEDURE AdaugareClientt @emaill varchar(30), @telefonn varchar(15), @usernamee varchar(40), @passs varchar(25), @numee varchar (40)
  AS
  BEGIN
    Set NOCOUNT ON;
		INSERT INTO Client1 (email, tel, username, pass,nume)
	    VALUES
	    (@emaill, @telefonn, @usernamee, @passs, @numee);
	COMMIT;
  END 

EXECUTE AdaugareClientt 'email@yahoo.com10000', '0723122323','User11111','parolaparola','Cosmin';

-- ------------------------------------------------------------------------------------------------------
/* Stergere Produs din Stoc */
DROP PROCEDURE IF EXISTS Stergere_Produs_Stoc;

CREATE PROCEDURE Stergere_Produs_Stoc @idd int
AS
  BEGIN
     DELETE FROM Stoc 
     WHERE @idd = id
  END 
EXECUTE Stergere_Produs_Stoc 2;
-- -------------------------------------------------------------------------------------------------------

/* Actualizare Produs */
CREATE PROCEDURE Actualizare_Produs (@pnumee VARCHAR(50), @pnumee1 VARCHAR(50))
AS
Update Produse set pnume = @pnumee1
	from Produse
	where pnume like @pnumee
	Go
EXECUTE Actualizare_Produs '%Boss%','Republic';
----------------------------------------------------------------------
/* Afisarea cantitatii unui produs */
CREATE PROCEDURE Produsul @ProductName VARCHAR(50)
AS
declare @prod_id int;
select @prod_id = Produse.id from Produse where pnume like @ProductName;
SELECT COUNT(Comenzi.id) as 'Cantitate Produs'
FROM Comenzi 
JOIN Produse ON Comenzi.cantitate  = Produse.id   
WHERE Comenzi.id like @prod_id
;
GO
;
EXEC Produsul @ProductName='%Zeus%';
