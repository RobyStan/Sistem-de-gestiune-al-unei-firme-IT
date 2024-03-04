-- Tabelul Locatii
CREATE TABLE Locatii (
    cod_locatie INT PRIMARY KEY,
    oras VARCHAR(50) NOT NULL CHECK (REGEXP_LIKE(oras, '^[a-zA-Z]+$')),
    strada VARCHAR(100) NOT NULL CHECK (REGEXP_LIKE(strada, '^[a-zA-Z]+$')),
    cod_postal INT NOT NULL CHECK (LENGTH(TO_CHAR(cod_postal)) = 6),
    UNIQUE (oras, strada, cod_postal)
);

-- Inserare date în Locatii
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (1, 'Bucuresti', 'Victoriei', 110101);
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (2, 'Braila', 'Dorobantilor', 200011);
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (3, 'Timisoara', 'Operei', 300001);
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (4, 'Iasi', 'Palas', 700001);
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (5, 'Constanta', 'Mamaia', 900001);
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (6, 'Brasov', 'Sfatului', 500001);
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (7, 'Craiova', 'Romanescu', 205500);
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (8, 'Sibiu', 'Huet', 600001);
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (9, 'Oradea', 'Independentei', 410001);
INSERT INTO Locatii (cod_locatie, oras, strada, cod_postal) VALUES (10, 'Ploiesti', 'Republicii', 100001);


-- Tabelul Departamente
CREATE TABLE Departamente (
    cod_departament INT PRIMARY KEY,
    nume_departament VARCHAR(50) NOT NULL,
    cod_locatie INT NOT NULL,
    CONSTRAINT fk_departament_locatie FOREIGN KEY (cod_locatie) REFERENCES Locatii(cod_locatie)
);

-- Inserare date în Departamente
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(101, 'Departament IT', 1);
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(102, 'Departament HR', 2);
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(103, 'Departament Financiar', 3);
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(104, 'Departament Marketing', 4);
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(105, 'Departament Operational', 5);
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(106, 'Departament Vanzari', 6);
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(107, 'Departament Servicii Clienti', 7);
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(108, 'Departament Cercetare ?i Dezvoltare', 8);
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(109, 'Departament Juridic', 9);
INSERT INTO Departamente (cod_departament, nume_departament, cod_locatie) VALUES(110, 'Departament Lant de Aprovizionare', 10);

-- Tabelul Clienti
CREATE TABLE Clienti (
    cod_client INT PRIMARY KEY,
    nume_client VARCHAR(15) NOT NULL CHECK (LENGTH(nume_client) >= 3 AND LENGTH(nume_client) <= 15),
    prenume_client VARCHAR(30) NOT NULL CHECK (LENGTH(prenume_client) >= 3 AND LENGTH(prenume_client) <= 30),
    tip_client VARCHAR(50) CHECK (tip_client IN ('Persoana fizica', 'Companie')),
    data_ultimei_achizitii DATE
);

-- Inserare date în Clienti
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(201, 'Popescu', 'Ion', 'Persoana fizica', TO_DATE('2022-05-15', 'YYYY-MM-DD'));
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(202, 'Radulescu', 'Elena', 'Companie', TO_DATE('2022-06-20', 'YYYY-MM-DD'));
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(203, 'Ionescu', 'Maria', 'Persoana fizica', TO_DATE('2022-07-10', 'YYYY-MM-DD'));
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(204, 'Munteanu', 'Andrei', 'Companie', TO_DATE('2022-08-05', 'YYYY-MM-DD'));
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(205, 'Popa', 'Ana', 'Persoana fizica', TO_DATE('2022-09-12', 'YYYY-MM-DD'));
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(206, 'Gheorghescu', 'Cristina', 'Companie', TO_DATE('2022-10-08', 'YYYY-MM-DD'));
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(207, 'Avram', 'George', 'Persoana fizica', TO_DATE('2022-11-25', 'YYYY-MM-DD'));
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(208, 'Dumitru', 'Ana-Maria', 'Companie', TO_DATE('2022-12-30', 'YYYY-MM-DD'));
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(209, 'Stoica', 'Ionut', 'Persoana fizica', TO_DATE('2022-04-02', 'YYYY-MM-DD'));
INSERT INTO Clienti (cod_client, nume_client, prenume_client, tip_client, data_ultimei_achizitii) VALUES(210, 'Vasilescu', 'Diana', 'Companie', TO_DATE('2022-03-18', 'YYYY-MM-DD'));


-- Tabelul Parteneri
CREATE TABLE Parteneri (
    cod_partener INT PRIMARY KEY,
    nume_partener VARCHAR(255) NOT NULL CHECK (LENGTH(nume_partener) > 3 AND LENGTH(nume_partener) < 30),
    tip_partener VARCHAR(255) NOT NULL,
    data_incepere_colaborare DATE,
    stare_colaborare VARCHAR(255) NOT NULL CHECK (stare_colaborare IN ('activa', 'incheiata', 'negociere')),
    comision_acordat DECIMAL(5,2) NOT NULL CHECK (comision_acordat >= 0 AND comision_acordat <= 100),
    UNIQUE (nume_partener)
);

delete from Parteneri;

-- Inserare date în Parteneri
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (301, 'Partener1', 'Furnizor', TO_DATE('2022-01-15', 'YYYY-MM-DD'), 'activa', 10.50);
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (302, 'Partener2', 'Consultant', TO_DATE('2022-02-20', 'YYYY-MM-DD'), 'incheiata', 15.75);
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (303, 'Partener3', 'Furnizor', TO_DATE('2022-03-10', 'YYYY-MM-DD'), 'negociere', 8.25);
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (304, 'Partener4', 'Strategic', TO_DATE('2022-04-05', 'YYYY-MM-DD'), 'activa', 12.00);
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (305, 'Partener5', 'Investitor', TO_DATE('2022-05-12', 'YYYY-MM-DD'), 'incheiata', 9.75);
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (306, 'Partener6', 'Consultant', TO_DATE('2022-06-08', 'YYYY-MM-DD'), 'negociere', 11.25);
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (307, 'Partener7', 'Furnizor', TO_DATE('2022-07-25', 'YYYY-MM-DD'), 'activa', 13.50);
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (308, 'Partener8', 'Consultant', TO_DATE('2022-08-30', 'YYYY-MM-DD'), 'incheiata', 14.75);
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (309, 'Partener9', 'Furnizor', TO_DATE('2022-09-02', 'YYYY-MM-DD'), 'negociere', 10.00);
INSERT INTO Parteneri (cod_partener, nume_partener, tip_partener, data_incepere_colaborare, stare_colaborare, comision_acordat) VALUES (310, 'Partener10', 'Investitor', TO_DATE('2022-10-18', 'YYYY-MM-DD'), 'activa', 11.50);

-- Tabelul Date_de_contact
CREATE TABLE Date_de_contact (
    email VARCHAR(255) PRIMARY KEY CHECK (REGEXP_LIKE(email, '^[a-zA-Z0-9._%+-]+@(yahoo\.com|gmail\.com)$')),
    numar_telefon CHAR(10) NOT NULL CHECK (REGEXP_LIKE(numar_telefon, '^[0-9]{10}$')),
    cod_partener INT,
    adresa_skype VARCHAR(15) CHECK (LENGTH(adresa_skype) <= 15),
    FOREIGN KEY (cod_partener) REFERENCES Parteneri(cod_partener)
);

-- Inserare date în Date_de_contact
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('partener1@yahoo.com', '0721123456', 301, 'skype_partener1');
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('partener2@yahoo.com', '0722987654', 302, NULL);
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('partener3@yahoo.com', '0723456789', 303, 'skype_partener3');
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('partener4@gmail.com', '0724567890', 304, NULL);
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('partener5info@yahoo.com', '0725678901', 305, 'skype_partener5');
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('partener6@gmail.com', '0726789012', 306, 'skype_partener6');
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('contact7@yahoo.com', '0727890123', 307, NULL);
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('contact8@gmail.com', '0728901234', 308, 'skype_partener8');
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('partners@gmail.com', '0729012345', 309, 'skype_partener9');
INSERT INTO Date_de_contact (email, numar_telefon, cod_partener, adresa_skype) VALUES ('partenerinfo@yahoo.com', '0720123456', 310, NULL);

-- Tabelul Angajati
CREATE TABLE Angajati (
    cod_angajat INT PRIMARY KEY,
    nume VARCHAR(15) NOT NULL CHECK (LENGTH(nume) >= 3 AND LENGTH(nume) <= 15),
    prenume VARCHAR(30) NOT NULL CHECK (LENGTH(prenume) >= 3 AND LENGTH(prenume) <= 30),
    data_angajarii DATE, 
    salariu DECIMAL NOT NULL CHECK (salariu >= 0),
    cod_departament INT,
    FOREIGN KEY (cod_departament) REFERENCES Departamente(cod_departament)
);

-- Inserare date în Angajati
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (401, 'Gheorhiu', 'Iulian', TO_DATE('2021-01-01', 'YYYY-MM-DD'), 5000.0, 101);
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (402, 'Tomulescu', 'Geanina', TO_DATE('2021-02-01', 'YYYY-MM-DD'), 6000.0, 102);
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (403, 'Constantinescu', 'Lucian', TO_DATE('2021-03-01', 'YYYY-MM-DD'), 5500.0, 103);
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (404, 'Tudor', 'Pavel', TO_DATE('2021-04-01', 'YYYY-MM-DD'), 7000.0, 104);
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (405, 'Cristea', 'Ionut', TO_DATE('2021-05-01', 'YYYY-MM-DD'), 6500.0, 105);
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (406, 'Istrate', 'Andreea', TO_DATE('2021-06-01', 'YYYY-MM-DD'), 7500.0, 106);
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (407, 'Cosma', 'Andrei', TO_DATE('2021-07-01', 'YYYY-MM-DD'), 6800.0, 107);
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (408, 'Ionescu', 'Robert', TO_DATE('2021-08-01', 'YYYY-MM-DD'), 8000.0, 108);
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (409, 'Cristian', 'George', TO_DATE('2021-09-01', 'YYYY-MM-DD'), 7200.0, 109);
INSERT INTO Angajati (cod_angajat, nume, prenume, data_angajarii, salariu, cod_departament) VALUES (410, 'Ifrim', 'Emilian', TO_DATE('2021-10-01', 'YYYY-MM-DD'), 6700.0, 110);


-- Tabelul Proiecte
CREATE TABLE Proiecte (
    cod_proiect INT PRIMARY KEY,
    nume_proiect VARCHAR(255) NOT NULL,
    cod_partener INT,
    stadiu_proiect VARCHAR(50) NOT NULL CHECK (stadiu_proiect IN ('In desfasurare', 'Finalizat', 'Intarziat', 'Anulat', 'Planificat')),
    FOREIGN KEY (cod_partener) REFERENCES Parteneri(cod_partener)
);

-- Inserare date în Proiecte
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(501, 'Sistem de Gestiune a Resurselor Umane', 301, 'In desfasurare');
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(503, 'Solutie de Securitate Cibernetica', 303, 'In desfasurare');
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(505, 'Sistem de Monitorizare a Performantelor', 305, 'Planificat');
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(506, 'Aplicatie Mobile Banking', 306, 'In desfasurare');
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(507, 'Sistem de Automatizare a Proceselor', 307, 'Anulat');
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(508, 'Platforma de Gestionare a Documentelor', 308, 'Planificat');
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(509, 'Sistem de Analiza Predictiva', 309, 'Finalizat');
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(512, 'Platfoma de Educatie Online', 302, 'Intarziat');
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(513, 'Sistem de Recunoastere Vocala', 303, 'Planificat');
INSERT INTO Proiecte (cod_proiect, nume_proiect, cod_partener, stadiu_proiect) VALUES(515, 'Sistem de Control al Traficului', 305, 'Finalizat');



-- Tabelul Proiecte_Clienti
CREATE TABLE Proiecte_Clienti (
    cod_proiect INT,
    cod_client INT,
    PRIMARY KEY (cod_proiect, cod_client),
    FOREIGN KEY (cod_proiect) REFERENCES Proiecte(cod_proiect),
    FOREIGN KEY (cod_client) REFERENCES Clienti(cod_client)
);

-- Inserare date în Proiecte_Clienti
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(501,201);
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(503,202);
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(505,203);
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(506,204);
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(507,205);
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(508,206);
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(509,207);
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(512,208);
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(513,209);
INSERT INTO Proiecte_Clienti (cod_proiect, cod_client) VALUES(515,210);

-- Tabelul Angajati_Proiecte
CREATE TABLE Angajati_Proiecte (
    cod_angajat INT,
    cod_proiect INT,
    PRIMARY KEY (cod_angajat, cod_proiect),
    FOREIGN KEY (cod_angajat) REFERENCES Angajati(cod_angajat),
    FOREIGN KEY (cod_proiect) REFERENCES Proiecte(cod_proiect)
);

-- Inserare date în Angajati_Proiecte
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(401, 501);
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(402, 503);
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(403, 505);
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(404, 506);
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(405, 507);
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(406, 508);
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(407, 509);
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(408, 512);
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(409, 513);
INSERT INTO Angajati_Proiecte (cod_angajat, cod_proiect) VALUES(410, 515);

commit;
