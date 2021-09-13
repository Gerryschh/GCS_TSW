DROP DATABASE IF EXISTS gcs;
CREATE DATABASE gcs;
USE gcs;

DROP TABLE IF EXISTS prodotto;

CREATE TABLE prodotto (	
  id int primary key AUTO_INCREMENT not null,
  prezzo double default 0,
  nome varchar(50),
  descrizione varchar(250),
  sconto double default 0,
  prezzo_scontato double default 0,
  IVA double default 22,
  quantità int default 0,
  thumbnail varchar(700),
  categoria varchar(50)
);

CREATE TABLE utente (	
  nome varchar(25),
  cognome varchar(25),
  pw char(50),
  indirizzo varchar(200),
  email varchar(35) primary key,
  telefono varchar(15),
  numCarta varchar(16),
  dataScad varchar(7),
  CVV varchar(3)
);


CREATE TABLE ordine (
	id int primary key AUTO_INCREMENT,
	data_Effettuazione datetime,
    Prezzo_Totale double,
    utente varchar(35),
    
    FOREIGN KEY (utente) REFERENCES utente(email)
    ON DELETE RESTRICT
    ON UPDATE CASCADE
);

CREATE TABLE Dettaglio (
	prezzoUnitario double not null,
    quantità int not null,
    IVA double not null,
    id_Prodotto int,
    id_Ordine int,
    
    FOREIGN KEY (id_Prodotto) REFERENCES prodotto(id)
    ON DELETE CASCADE
    ON UPDATE RESTRICT,
    
    FOREIGN KEY (id_Ordine) REFERENCES ordine(id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    
    PRIMARY KEY(id_prodotto, id_Ordine)
);

CREATE TABLE amministratore(
	username varchar(35) primary key,
    password varchar(35) not null
);



INSERT INTO prodotto (nome, descrizione, prezzo, quantità, thumbnail, categoria) values
("NZXT H510", "Case", 85.99, 10, "https://static.macca.cloud/gcs/1.png", "componentiPC"), /*CATEGORIA COMPONENTI PC*/
("CORSAIR HX750", "Alimentatore", 164.99, 5, "https://static.macca.cloud/gcs/2.png", "componentiPC"), /*CATEGORIA COMPONENTI PC*/
("AMD Ryzen 5 5600X", "Processore AMD", 283.99, 10, "https://static.macca.cloud/gcs/3.png", "componentiPC"), /*CATEGORIA COMPONENTI PC*/
("MSI B450 GAMING PLUS MAX'", "Scheda Madre MSI", 73.99, 7, "https://static.macca.cloud/gcs/4.png", "componentiPC"), /*CATEGORIA COMPONENTI PC*/
("Gigabyte GeForce RTX 3060", "Scheda Video NVIDIA", 800.99, 3, "https://static.macca.cloud/gcs/5.png", "componentiPC"), /*CATEGORIA COMPONENTI PC*/
("Corsair Vengeance RGB PRO 3600MHZ", "RAM", 104.99, 3, "https://static.macca.cloud/gcs/6.png", "componentiPC"), /*CATEGORIA COMPONENTI PC*/
("Crucial BX500 240 GB", "SSD Interno, 3D NAND, SATA, 2.5 Pollici", 33.99, 6, "https://static.macca.cloud/gcs/7.png", "componentiPC"), /*CATEGORIA COMPONENTI PC*/

("MAK ENTRY LEVEL 1.0", "PC Desktop Intel i3 10100,SSD NVMe 250 GB fino a 2.400 mb/sec, SCHEDA VIDEO GTX 1650 4Gb, RAM 16GB 3000MHZ", 849.99, 4, "https://static.macca.cloud/gcs/8.png", "pcGaming"), /*CATEGORIA PC GAMING*/
("PJ RIG ERIS", "Pc gaming i5 4.30Ghz, Ram 16 Gb ddr4 3000 mhz, Rtx 2060 6GB, SSD 1000Gb M.2 Nvme, PSU 600 watt 80 plus", 1200.99, 5, "https://static.macca.cloud/gcs/9.png", "pcGaming"), /*CATEGORIA PC GAMING*/
("Megaport PC-Gaming ULTRA", "Intel Core i7-11700KF, Nvidia GeForce RTX 3080 10GB, 16 GB DDR4, 1GB M.2 SSD, 2TB HDD", 2649.99, 5, "https://static.macca.cloud/gcs/10.png", "pcGaming"), /*CATEGORIA PC GAMING*/

("Samsung S24F350FH", "Monitor 24 pollici Full HD, 1920 x 1080, 60 Hz, 5 ms, D-Sub, HDMI", 144.99, 11, "https://static.macca.cloud/gcs/11.png", "monitor"), /*CATEGORIA MONITOR*/
("LG 24ML600S", "Monitor 24 pollici FULL HD LED IPS, 1920x1080, 1ms MBR, AMD FreeSync 120Hz, Audio Stereo 10W, HDMI (HDCP 1.4)", 158.99, 14, "https://static.macca.cloud/gcs/12.png", "monitor"), /*CATEGORIA MONITOR*/
("BenQ ZOWIE Xl2411K", "Monitor da Gioco 24 Pollici 144Hz, 1080P, Ps5 e Xbox 120 Fps, Pannello Tn Veloce", 203.99, 12, "https://static.macca.cloud/gcs/13.png", "monitor"), /*CATEGORIA MONITOR*/
("MSI Optix MAG251RX", "Monitor Gaming Esport 24.5 pollici, Display 16:9 FHD (1920x1080), Frequenza 240Hz, Tempo di risposta 1ms, Pannello IPS", 203.99, 12, "https://media.discordapp.net/attachments/531160551372619778/887048183073619968/msi.png", "monitor"), /*CATEGORIA MONITOR*/

("Trust Gaming GXT 707R", "Sedia Gaming Ergonomica Regolabile, con Cuscini Rimovibili, Rosso", 179.99, 10, "https://static.macca.cloud/gcs/14.png", "sedieGaming"), /*CATEGORIA SEDIE GAMING*/
("Secretlab TITAN Evo serie 2022", "Cyberpunk Yellow Secretlab NEO™ Hybrid Leatherette / Black Secretlab NEO™ Hybrid Leatherette / Black Suede", 420.99, 10, "https://leganerd.com/wp-content/uploads/2020/06/cp-splash-chairs-min_1000x.png", "sedieGaming"), /*CATEGORIA SEDIE GAMING*/
("GTRACING 3", "Sedia Gaming Ufficio da Scrivania Poltrona Ergonomica Sedie da Gaming Girevole con Braccioli 4D Ace Serie Bianco", 239.99, 17, "https://static.macca.cloud/gcs/15.png", "sedieGaming"), /*CATEGORIA SEDIE GAMING*/
("Dxracer Racer 5", "Sedia da gioco / Ufficio/ Scrivania, con Ruote, Regolabile in Altezza", 249.99, 10, "https://static.macca.cloud/gcs/16.png", "sedieGaming"),

("Logitech G PRO", "Mouse Gaming Wireless, Sensore HERO 25K, 25.600 DPI, RGB, Ultraleggero", 114.99, 15, "https://static.macca.cloud/gcs/17.png", "periferiche"), /*CATEGORIA PERIFERICHE*/
("Corsair K70 RGB MK.2", "Tastiera Meccanica Gaming Cherry MX Red, Lineare e Veloce, Retroilluminato RGB LED", 169.99, 10, "https://static.macca.cloud/gcs/18.png", "periferiche"), /*CATEGORIA PERIFERICHE*/
("Logitech G PRO X", "Cuffie Gaming Wireless LIGHTSPEED, Tecnologia VO!CE Blue, Driver PRO-G 50 mm, Cuffie DTS: Audio Surround X 2.0", 167.99, 11, "https://static.macca.cloud/gcs/19.png", "periferiche"); /*CATEGORIA PERIFERICHE*/

INSERT INTO prodotto (nome, descrizione, prezzo, quantità, thumbnail, categoria, sconto) values
("Razer Viper Ultimate", "Wireless Gaming Mouse, Gioco Sensore Ottico 20K Focus+, Solo 74 G", 130.99, 5, "https://static.macca.cloud/gcs/20.png", "periferiche" , 24); /*CATEGORIA PERIFERICHE*/


CREATE TRIGGER prezzo_scontato_insert
BEFORE INSERT ON Prodotto
for each row
set new.prezzo_scontato=(new.prezzo-(new.prezzo*new.sconto/100));

CREATE TRIGGER prezzo_scontato_update
BEFORE update ON Prodotto
for each row
set new.prezzo_scontato=(new.prezzo-(new.prezzo*new.sconto/100));

INSERT INTO utente (nome, cognome, email, pw) values 
("Antonio", "Rossi", "arossi@gmail.com", "antonio1234"),
("Giacomo", "Bianchi", "gbianchi@gmail.com", "giacomo2021"),
("Luca", "Verdi", "lverdi@gmail.com", "luca23"),
("Luigi", "Lodi", "llodi@gmail.com", "lodi77");

insert into amministratore(username, password) values ("root", "root");