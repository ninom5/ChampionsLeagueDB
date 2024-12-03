CREATE TABLE Liga_prvaka(
 sezona	INTEGER PRIMARY KEY,
 pobjednik CHAR(30),
 FOREIGN KEY (pobjednik) REFERENCES Momcad(ime_momcadi)
);

CREATE TABLE Igrac(
 OIB_igraca INTEGER PRIMARY KEY,
 ime CHAR(30),
 prezime CHAR(30),
 pozicija CHAR(30),
 od DATE,
 doo DATE,
 momcad CHAR(30),
 FOREIGN KEY (momcad) REFERENCES Momcad(ime_momcadi)
);

CREATE TABLE Trener(
 OIB_trenera INTEGER PRIMARY KEY,
 ime CHAR(30),
 prezime CHAR(30),
 od DATE,
 doo DATE,
 momcad CHAR(30),
 FOREIGN KEY (momcad) REFERENCES Momcad(ime_momcadi)
);

CREATE TABLE Utakmica(
 ID_utakmice INTEGER PRIMARY KEY,
 rezultat CHAR(30),
 faza CHAR(30),
 datum DATE,
 sudac CHAR(30),
 mjesto CHAR(30),
 domacin CHAR(30),
 gost CHAR(30),
 FOREIGN KEY (domacin) REFERENCES Momcad(ime_momcadi),
 FOREIGN KEY(gost) REFERENCES Momcad(ime_momcadi)
);

CREATE TABLE Momcad(
 ime_momcadi CHAR(30) PRIMARY KEY,
 stadion CHAR(30)
);

CREATE TABLE Statistika_igraca(
 OIB_igraca INTEGER,
 ID_utakmice INTEGER,
 zuti_kartoni INTEGER,
 crveni_kartoni INTEGER,
 broj_golova INTEGER,
 broj_asistencija INTEGER,
 ulaz INTEGER,
 izlaz INTEGER,
 broj_udaraca_u_okvir INTEGER,
 broj_udaraca_van_okvira INTEGER,
 zaleda INTEGER,
 obrane INTEGER,
 prekrsaji INTEGER,
 PRIMARY KEY (OIB_Igraca, ID_utakmice),
 FOREIGN KEY (OIB_Igraca) REFERENCES Igrac(OIB_igraca),
 FOREIGN KEY (ID_utakmice) REFERENCES Utakmica(ID_utakmice)
);

CREATE TABLE Statistika_momcadi(
 ID_utakmice INTEGER,
 momcad CHAR(30),
 zuti_kartoni INTEGER,
 crveni_kartoni INTEGER,
 broj_golova INTEGER,
 prekrsaji INTEGER,
 broj_udaraca_u_okvir INTEGER,
 broj_udaraca_van_okvira INTEGER,
 zaleda INTEGER,
 slobodni_udarci INTEGER,
 PRIMARY KEY (OIB_Igraca, momcad),
 FOREIGN KEY (momcad) REFERENCES Momcad(ime_momcadi),
 FOREIGN KEY (ID_utakmice) REFERENCES Utakmica(ID_utakmice)
);