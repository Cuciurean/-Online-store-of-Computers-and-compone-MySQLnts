USE magazin_calculatoare

INSERT INTO Plata (id, mode)
VALUES  (1,'PayPal'),
		(2,'CreditCard'),
		(3,'Visa'),
		(4,'Ramburs')

INSERT INTO Plata_Online VALUES
(1,'PayPal'),
(2,'CreditCard'),
(3,'Visa')

INSERT INTO Plata_Ramburs VALUES
(4,'Ramburs');

INSERT INTO Administrator (id,nume,prenume,pass) VALUES
(1,'Andrei','Popescu','parola'),
(2,'George','Mayer','parola1'),
(3,'Bogdan','Chilian','parola2'),
(4,'Catalin','Cuciurean','parola3'),
(5,'Gal','David','parola4');

INSERT INTO Client (id,nume,username,email,tel,pass) VALUES
(1,'Mircea','Mirciulica','mirecea@yahoo.com','0722134631','parolaclient'),
(2,'Viorel','Boss','viorel@yahoo.com','0774875395','parolaclient1'),
(3,'Gicu','Gicutu','GG@yahoo.com','0724345313','parolaclient2'),
(4,'Horea','Salam','smecher@yahoo.com','0783483743','parolaclient3'),
(5,'Geta','Printesa','geta@yahoo.com','0731242342','parolaclient4');

INSERT INTO Client1 (nume,username,email,tel,pass) VALUES
('Mircea','Mirciulica','mirecea@yahoo.com','0722134631','parolaclient'),
('Viorel','Boss','viorel@yahoo.com','0774875395','parolaclient1'),
('Gicu','Gicutu','GG@yahoo.com','0724345313','parolaclient2'),
('Horea','Salam','smecher@yahoo.com','0783483743','parolaclient3'),
('Geta','Printesa','geta@yahoo.com','0731242342','parolaclient4');

INSERT INTO Adresa(id_a,judet,oras,strada,numar) VALUES
(1,'Cluj','Cluj-Napoca', 'Plopilor',58),
(2,'Cluj','Cluj-Napoca', 'Dunari',34),
(3,'Ilfov','Bucuresti','Strada',22),
(4,'Ilfov','Bucuresti','Brazilor',76),
(5,'Ilfov','Bucuresti','Apelor',99);

INSERT INTO Cont_Banca (cont_num,id_C) VALUES
('Cont1',1),
('Cont2',2),
('Cont3',3),
('Cont4',4),
('Cont5',5);

INSERT INTO Produse (pnume,pret,descriere,id) VALUES
('Viking',2400,'Sistem Gaming',1),
('Boss',3400,'Sistem Server',2),
('Zeus',8900,'Sistem Ultra Performant',3),
('RedLine',300,'Sistem Gaming',4),
('Safir',1500,'Sistem De Buget',5),
('Msi',5000,'Sistem Gaming',6),
('Assus',1200,'Sistem Server',7),
('Accer',3333,'Sistem Ultra Performant',8),
('Protoype',900,'Sistem Gaming',9),
('Pink',4000,'Sistem De Buget',10),
('Placa Video',900,'Placa Video Gigabyte',11),
('Ram',500,'Ram 8 Gb',12),
('SSD',350,'SSD Capacitate 240 Gb',13),
('Placa De Baza',650,'Msi Gaming',14),
('Carcasa',290, 'Carcasa Iluminata',15);

INSERT INTO Sisteme (pnume,pret,descriere,id_s) VALUES
('Viking',2400,'Sistem Gaming',1),
('Boss',3400,'Sistem Server',2),
('Zeus',8900,'Sistem Ultra Performant',3),
('RedLine',300,'Sistem Gaming',4),
('Safir',1500,'Sistem De Buget',5),
('Msi',5000,'Sistem Gaming',6),
('Assus',1200,'Sistem Server',7),
('Accer',3333,'Sistem Ultra Performant',8),
('Protoype',900,'Sistem Gaming',9),
('Pink',4000,'Sistem De Buget',10);


INSERT INTO Componente (pnume,pret,descriere,id_c) VALUES
('Placa Video',900,'Placa Video Gigabyte',1),
('Ram',500,'Ram 8 Gb',2),
('SSD',350,'SSD Capacitate 240 Gb',3),
('Placa De Baza',650,'Msi Gaming',4),
('Carcasa',290, 'Carcasa Iluminata',5);

INSERT INTO Discounts (id,id_P,pret_nou) VALUES
(1,1,'220'),
(2,2,'3000'),
(3,6,'780'),
(4,14,'600'),
(5,15,'260');

INSERT INTO Stoc (id, nr_stoc,cantitate,id_P) VALUES
(1,13,44,1),
(2,14,22,2),
(3,15,12,3),
(4,16,34,4),
(5,17,23,5),
(6,18,34,6),
(7,19,34,7),
(8,20,0,8),
(9,21,0,9),
(10,22,3,10),
(11,23,4,11),
(12,24,5,12),
(13,25,7,13),
(14,26,4,14),
(15,27,9,15);

INSERT INTO Comenzi (id,id_C,id_P,id_a,id_Pay,cantitate) VALUES
(1,1,1,1,1,4),
(2,2,2,4,2,3),
(3,3,3,2,3,2),
(4,4,4,5,1,3),
(5,5,5,6,4,4);

