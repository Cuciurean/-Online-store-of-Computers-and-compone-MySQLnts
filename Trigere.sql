/* Administartor*/


/* Verificare nume administrator*/
CREATE OR ALTER TRIGGER Verificare_nume_admin 
ON Administrator 
After Insert, Update
AS
BEGIN
    IF Not exists (SELECT nume from Administrator)
		Declare @Message varchar(4000);
        SET @Message = 'Username gresit!';
    END

/* Inserarea numelul administratorului.*/
CREATE OR ALTER TRIGGER Adaugare_nume_admin
ON Administrator 
After Insert
AS
DECLARE @nume varchar(4000);
DECLARE @prenume varchar(4000);
 Select @nume=inserted.nume From inserted;
 Select @prenume=inserted.prenume From inserted;
BEGIN
	RAISERROR('Nume incorect',50,1);
	ROLLBACK;
    END

/*Stergere Administrator */
CREATE OR ALTER TRIGGER Stergere_admin 
ON Administrator 
FOR DELETE 
AS BEGIN SET NOCOUNT ON;
	DECLARE @nume varchar(4000);
	DECLARE @prenume varchar(4000);
	SELECT @nume=DELETED.nume FROM DELETED;
	SELECT @prenume=DELETED.prenume FROM DELETED;
BEGIN
RAISERROR('Nu se poate sterge',50,1);
ROLLBACK;
END
END;

	/********* Banca *******/
CREATE TRIGGER Verificare_numar_cont   
ON Cont_Banca 
After Insert, Update
AS
BEGIN
    IF NOT EXISTS (SELECT cont_num from Cont_Banca)
        Declare @Message varchar(4000);
        SET @Message = 'Numar de cont gresit!';
    END
	/* Daugare numar de cont nou */
CREATE TRIGGER Adaugare_numar_cont  
ON Cont_Banca 
After Insert, Update
AS
DECLARE @cont_num varchar(4000);
 Select @cont_num=inserted.cont_num From inserted;
BEGIN
	RAISERROR('Nume de cont incorect',50,1);
	ROLLBACK;
    END


/***** Email  *******/
/* Verificare emailuilui */
CREATE TRIGGER Verificare_email_parola  
ON Client 
After Insert, Update
As
BEGIN
    IF NOT EXISTS (SELECT email from Client)
        Declare @Message varchar(4000);
        SET @Message = 'Adresa de email gresita!';
    END 
    IF NOT EXISTS (SELECT pass from Client)
        Declare @Message1 varchar(4000);
        SET  @Message1 = 'Parola gresita!';
    END 

/* Adaugarea unui nou Email */
CREATE TRIGGER Adaugare_email_parola  
ON client 
After Insert, Update
AS
BEGIN
    IF NOT EXISTS (SELECT email from Client)
        Declare @Message varchar(4000);
        SET @Message = 'Adresa de email gresita!';
    END 
   IF NOT EXISTS (SELECT pass from Client)
        Declare @Message1 varchar(4000);
        SET  @Message1 = 'Parola gresita!';
    END 




/* Pret */ 
/* Validarea pretului  sa nu fie mai mic decat zero sau egal*/
CREATE TRIGGER Validare_pret  ON produse 
FOR Insert
As
BEGIN
    IF ( Select pret from Produse ) <= 0 
		Declare @Message2 varchar(4000);
        SET @Message2 = 'Pretul nu poate fi mai mic ca 0';
    END 

/* Adaugarea unui pret */
CREATE TRIGGER Adaugare_pret  
ON produse 
FOR Update
AS
DECLARE @pret INT;
SELECT @pret=INSERTED.pret FROM INSERTED;
IF @pret <= 0
BEGIN
    
   RAISERROR('Pretul nu poate fi 0 sau mai mic!',16,1);
	ROLLBACK;
END


/* Verificare discount */ 

CREATE TRIGGER Verificare_discount  
ON discounts 
FOR Insert
AS
BEGIN
    IF ( Select pret_nou From Discounts )< 0 
		Declare @Message3 varchar(4000);
        SET @Message3 = 'Pretul nu poate fi mai mic ca 0';
    END

	/* Adaugarea unui discount */
CREATE TRIGGER Adaugare_discount 
ON discounts 
FOR Update
AS
DECLARE @pret_nou INT;
SELECT @pret_nou=INSERTED.pret_nou FROM INSERTED;
IF @pret_nou <= 0
BEGIN
    RAISERROR('Pretul nu poate fi 0 sau mai mic!',16,1);
	ROLLBACK;
    END 


/* Verificare stoc */
CREATE TRIGGER Verificare_Stoc 
ON Stoc 
FOR Update
AS
BEGIN
    IF ( Select cantitate From Stoc ) < 0 
        Declare @Message3 varchar(4000);
        SET @Message3 = 'Stoc epuizat';
    END 

/* Stergere stoc */

CREATE TRIGGER Stergere_stoc  ON Comenzi
  FOR Update
  AS
  DECLARE @cantitate int;
  DECLARE @old_cantitate int;
  SET @cantitate = @cantitate - @old_cantitate
  SELECT @cantitate=DELETED.cantitate FROM DELETED;
  BEGIN
    RAISERROR('Cantitate stearsa',16,1);
	ROLLBACK;
	 END 

