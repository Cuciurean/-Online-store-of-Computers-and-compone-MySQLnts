use magazin_calculatoare

CREATE TABLE Administrator
(id INT NOT NULL ,
nume varchar(50) unique,
prenume varchar(30) unique,
pass varchar(25),
PRIMARY KEY(id)
);

CREATE TABLE  Plata
(id INT NOT NULL,
mode varchar(20) unique,
PRIMARY KEY(id)
);

CREATE TABLE Plata_Online
(id_o INT NOT NULL ,
mode varchar(20) unique,
PRIMARY KEY(id_o),
CONSTRAINT Onlinet_plata
	FOREIGN KEY (id_o)
	REFERENCES Plata(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE
);

CREATE TABLE  Plata_Ramburs
(id_r INT NOT NULL ,
mode varchar(20) unique,
PRIMARY KEY(id_r),
CONSTRAINT Ramburs_plata
	FOREIGN KEY (id_r)
	REFERENCES Plata(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE
);


CREATE TABLE  Client1
(
nume VARCHAR(30) NOT NULL,
username varchar(30) not null unique,
email VARCHAR(20) not null,
tel VARCHAR(20) not null unique,
pass varchar(20) not null,

);

CREATE TABLE  Adresa
(id_a INT NOT NULL,
judet varchar(20) not null,
oras varchar(20) not null,
strada varchar(20) not null,
numar int not null,
PRIMARY KEY(id_a),
CONSTRAINT Adresa_Client
	FOREIGN KEY (id_a)
	REFERENCES Client(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE
);

CREATE TABLE  Cont_Banca
(
cont_num varchar(30) unique,
id_C int,

);

CREATE TABLE  Produse
(id INT NOT NULL ,
pnume VARCHAR(50) NOT NULL unique,
pret float,
descriere varchar(5000), 
PRIMARY KEY(id)
);

CREATE TABLE  Sisteme
(id_s INT NOT NULL ,
pnume VARCHAR(50) NOT NULL unique,
pret float,
descriere varchar(5000), 
PRIMARY KEY(id_s),
CONSTRAINT Sisteme_produse
	FOREIGN KEY (id_s)
	REFERENCES Produse(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE
);

CREATE TABLE Componente
(id_c INT NOT NULL ,
pnume VARCHAR(50) NOT NULL unique,
pret float,
descriere varchar(5000), 
PRIMARY KEY(id_c),
CONSTRAINT Componente_produse
	FOREIGN KEY (id_c)
	REFERENCES Produse(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE
);

CREATE TABLE  Discounts
(id INT NOT NULL,
id_P int,
pret_nou float,
PRIMARY KEY(id),
CONSTRAINT Discounts_produse
	FOREIGN KEY (id_P)
	REFERENCES Produse(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE

);

CREATE TABLE Stoc
(
id INT NOT NULL ,
nr_stoc int,
cantitate int,
id_P int,
PRIMARY KEY(id),
CONSTRAINT Stoc_produse
	FOREIGN KEY (id_P)
	REFERENCES Produse(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE
);

CREATE TABLE  Comenzi
(
id INT NOT NULL ,
id_C int,
id_a int,
id_P int,
id_Pay int,
cantitate int,


PRIMARY KEY(id),
CONSTRAINT Comanda_produs
	FOREIGN KEY (id_P)
	REFERENCES Produse(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE,
    
CONSTRAINT Comanda_client
	FOREIGN KEY (id_C)
	REFERENCES Client(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE,
    
/*CONSTRAINT Comanda_adresa
	FOREIGN KEY (id_a)
	REFERENCES Client(id)
	ON DELETE  CASCADE
	ON UPDATE  CASCADE,*/

CONSTRAINT Comanda_plata
	FOREIGN KEY (id_Pay)
	REFERENCES Plata(id)
	ON DELETE  NO ACTION
	ON UPDATE  NO ACTION
);