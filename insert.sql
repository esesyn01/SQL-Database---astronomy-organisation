

insert into Gromady_Galaktyk (Nazwa_katalogowa) values
('Grupa Lokalna'),('Gromada w Pannie'),('Abell 85'),('Abell 432'),('Abell 123'),
('Abell 5322'),('Abell 1243'),('Abell 9821'),('Abell 721'),('Abell 932')

select * from Gromady_Galaktyk

insert into Astronomowie(Imiê,Nazwisko,Data_urodzenia,Narodowoœæ) values
('Aleksander','Wolszczan','1954-04-12','Polska'),
('Stephen','Hawking','1942-09-06','USA'),
('John','Cook','1932-11-26','Wielka Brytania'),
('Peter','Kobas','1978-01-23','Kanada'),
('Elon','Muss','1959-06-15','USA'),
('Hukas','Lein','1994-02-26','Brazylia'),
('Iwan','Iwanow','1967-12-12','Rosja'),
('Daiki','Ito','1959-07-02','Japonia'),
('Mu','Bang','1976-04-22','Chiny'),
('Pablo','Area','1942-09-29','Argentyna'),
('Krzysztof','Krupiñski','2001-07-17','Polska'),
('Mark','Brand','1972-03-25','USA'),
('Vitalij','Kolczko','1982-05-09','Rosja'),
('Daniel','Otegra','1959-08-14','Chile'),
('Morgan','Slowman','1921-06-01','Wielka Brytania'),
('Juliet','Rose','1984-05-30','USA'),
('Otto','Berge','1929-02-07','Dania'),
('Pierre','Croiss','1997-08-10','Francja'),
('Dieter','Wurden','1942-10-23','Austria'),
('Allesandro','Garcia','1956-12-16','Hiszpania')

select * from Astronomowie

insert into Misje_kosmiczne (Cel,Nazwa,SStatus,Data_rozpoczêcia,Data_zakoñczenia) values
('znajdowanie nowych planet','XPlore','zakoñczone','2012-12-12','2020-12-12'),
('znajdowanie nowych gwiazd','Mariner-1','zakoñczone','2004-04-30','2006-10-01'),
('znajdowanie nowych galaktyk','Venera-4','zawieszone','1995-03-07','1999-09-27'),
('poszukiwanie ¿ycia','Mariner-2','w toku','2007-01-01','2025-01-01'),
('komunikacja z kosmitami','Vestera','zawieszone','2010-06-04','2015-01-24'),
('badanie znanych planet','New Horizons 2','zakoñczone','1979-07-17','1989-03-28'),
('znajdowanie nowych planet','New Horizons ','zakoñczone','1960-11-10','1965-09-21'),
('znajdowanie nowych galaktyk','Hugh new galaxies','odwo³ane','1992-02-17','1998-08-05'),
('znajdowanie nowych ksiê¿yców','Universe end','planowane','2025-06-11','2030-02-25'),
('sprawdzanie sygna³ów radiowych','Apollo 19','zakoñczone','1986-03-17','1989-07-28')

select * from Misje_kosmiczne

insert into Galaktyki (Nazwa_katalogowa,Promieñ,Odleg³oœæ_od_Drogii_Mlecznej,ID_Gromady,ID_Misji,Data_odkrycia,Kszta³t) values
('Droga Mleczna',100000,0,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Grupa Lokalna'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01','spiralna'),
('Andromeda',150000,2000000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Grupa Lokalna'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12','spiralna'),
('Galaktyka Trójk¹ta',40000,2200000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Grupa Lokalna'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12','ob³ok'),
('NGC 321',450000,1000000000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 85'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1988-12-12','spiralna'),
('NGC 4532',900000,1500000000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 932'),(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2010-01-01','ob³ok'),
('NGC 7645',70000,43231000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 432'),(select ID from Misje_kosmiczne where Nazwa='Venera-4'),'1996-04-01','spiralna'),
('IC 3523',9000000,10000000000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 932'),(select ID from Misje_kosmiczne where Nazwa='XPlore'),'2015-11-18','eliptyczna'),
('IC 323',6541000,432342131,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 123'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1987-07-24','soczewkowata'),
('IC 982',465000,782100000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 85'),(select ID from Misje_kosmiczne where Nazwa='Venera-4'),'1997-02-12','spiralna'),
('IC 14',200000,545353870,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 721'),(select ID from Misje_kosmiczne where Nazwa='XPlore'),'2018-03-11','nieregularna'),
('Messier 62',834200,888330000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 721'),(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2012-10-01','kulista'),
('Messier 312',532000,4000000000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 932'),(select ID from Misje_kosmiczne where Nazwa='XPlore'),'2016-04-27','spiralna'),
('Leo 12',76000,8765400000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 432'),(select ID from Misje_kosmiczne where Nazwa='Venera-4'),'1998-10-10','soczewkowata'),
('Leo 45',100000,213700000,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 85'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1987-09-15','spiralna'),
('SagDEG',5992100,694206900,(select Nazwa_katalogowa from Gromady_Galaktyk where Nazwa_katalogowa='Abell 123'),(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2019-07-13','spiralna z poprzeczk¹')

insert into Obiekty_centralne (Nazwa_katalogowa,Typ_obiektu,Masa,ID_Galaktyki,ID_Misji,Data_odkrycia) values
('Sagittarius-A','czarna dziura',500000000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'Droga Mleczna'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Sagittarius-B','kwazar',500043200,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'Andromeda'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12'),
('Sagittarius-C','pulsar',999000000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'Galaktyka Trójk¹ta'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12'),
('Aries-A','kwazar',8000000000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'NGC 321'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1988-12-12'),
('Aries-B','czarna dziura',300000000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'NGC 4532'),(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2010-01-01'),
('Aries-C','pulsar',100000000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'NGC 7645'),(select ID from Misje_kosmiczne where Nazwa='Venera-4'),'1996-04-01'),
('Aries-D','czarna dziura',150000000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'IC 3523'),(select ID from Misje_kosmiczne where Nazwa='XPlore'),'2015-11-18'),
('Pisces-A','kwazar',250000000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'IC 323'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1987-07-24'),
('Pisces-B','czarna dziura',567000000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'IC 982'),(select ID from Misje_kosmiczne where Nazwa='Venera-4'),'1997-02-12'),
('Pisces-C','pulsar',200000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'IC 14'),(select ID from Misje_kosmiczne where Nazwa='XPlore'),'2018-03-11'),
('Pisces-D','czarna dziura',12300000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'Messier 62'),(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2012-10-01'),
('Gemini-A','kwazar',67420000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'Messier 312'),(select ID from Misje_kosmiczne where Nazwa='XPlore'),'2016-04-27'),
('Gemini-B','pulsar',32140000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'Leo 12'),(select ID from Misje_kosmiczne where Nazwa='Venera-4'),'1998-10-10'),
('Gemini-C','czarna dziura',550500000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'Leo 45'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1987-09-15'),
('Gemini-D','kwazar',900340000,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa = 'SagDEG'),(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2019-07-13')

select * from Galaktyki

insert into Gwiazdy (Nazwa_katalogowa,Typ_gwiazdy,Promieñ,Wiek,ID_Galaktyki,ID_Misji,Data_odkrycia,Masa,Odleg³oœæ_od_S³oñca) values
('S³oñce2','¿ó³ty karze³',1,5,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='Droga Mleczna'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',1,0),
('Aldebaran','niebieski olbrzym',678,1,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='Andromeda'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12',643,1998342),
('Rigel','niebieski nadolbrzym',765,0.3,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='NGC 321'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1988-12-12',863,1000000832),
('VY Canis Majoris','niebieski superolbrzym',2405,0.15,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='Messier 62'),(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2015-01-01',999,888330642),
('UY Scuti','czerwony nadolbrzym',3200,0.08,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='NGC 321'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1988-12-12',978,1000000345),
('Trappist','czerwony karze³',0.3,8,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='Messier 62'),(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2012-10-01',0.91,888334000),
('Alfa Centauri','czerwony karze³',0.5,7.53,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='Droga Mleczna'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',0.78,4),
('PSR45J','bia³y karze³',0.03,12,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='Andromeda'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12',0.89,1999418),
('ORF34C','¿ó³ty karze³',1.56,7.43,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='IC 323'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1987-09-09',1.19,432342834),
('JAGG12','bia³y karze³',0.05,13.23,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='Messier 62'),(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2012-10-01',1.65,888390000),
('XMM0','¿ó³ty karze³',6.12,3.54,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='Andromeda'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12',0.78,1997342),
('RAXMAX','¿ó³ty karze³',0.92,6.18,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='NGC 321'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1988-12-12',0.43,1000000067),
('Betelgeza','czerwony nadolbrzym',1000,0.025,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='Droga Mleczna'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',873,65000),
('LASS453','gwiazda neutronowa',0.001,8.53,(select Nazwa_katalogowa from Galaktyki where Nazwa_katalogowa='IC 323'),(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1987-09-09',783,432348412)

select * from Gwiazdy

insert into Komety_i_planetoidy (Nazwa_katalogowa,Okres_obiegu_gwiazdy,Promieñ_orbity,ID_Gwiazdy,ID_Misji,Data_odkrycia) values
('Kometa Halleya',80,230,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Pluton',210,45,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Oumuamua',450,210,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Ceres',3.12,2.73,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Westa',3.78,3,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Pallas',3.54,2.89,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Juno',2.92,2.62,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Kometa Hallidaya',176,193,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Kometa Shumaker-Levy',199,211,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Sedna',960,450,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('K19JA',456,312,(select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01')


insert into Planety (Nazwa,Masa,Promieñ,Typ,Okres_obiegu,Promieñ_orbity,G³ówny_sk³adnik_atmosfery,Temperatura,ID_Misji,Data_odkrycia) values
('Mars',0.5,0.1,'skalista',1.69,2.28,'Fe',220,(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Jowisz',432,18,'gazowa',11.83,5.63,'He',100,(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Saturn',212,15,'gazowa',20.54,6.12,'He',80,(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01'),
('Trappist-A',0.3,0.05,'skalista',0.01,0.02,'Mg',3450,(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2012-10-01'),
('Trappist-D',0.25,0.03,'skalista',0.05,0.005,'Mg',275,(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2012-10-01'),
('PSRJ48B',4,1,'skalista',0.07,0.001,'Co',5000,(select ID from Misje_kosmiczne where Nazwa='Mariner-1'),'2012-10-01'),
('CSR34A',3.22,1.2,'skalista',1.49,1.98,'K',240,(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12'),
('Nabuku',0.78,0.8,'skalista',1.95,2.29,'H',400,(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12'),
('Namek',5,4,'skalista',5.32,3.67,'Ba',150,(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12'),
('BCR43J/2015',3.71,2.54,'skalista',1.23,1.65,'Mn',130,(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1988-12-1'),
('HHG43A',1342,40,'gazowa',94,25.43,'Pb',3000,(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1988-12-1'),
('BCXX12',786,31,'gazowa',500,312,'Pr',35,(select ID from Misje_kosmiczne where Nazwa='Apollo 19'),'1988-12-1')

select * from Planety

insert into Ksiê¿yce(Nazwa,Promieñ,Temperatura,ID_Planety,ID_Misji,Data_odkrycia,Masa,ID_Planetoidy) values
('Ganimedes',10,200,(select Nazwa from Planety where Nazwa='Jowisz'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',951,NULL),
('Io',1,854,(select Nazwa from Planety where Nazwa='Jowisz'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',0.89,NULL),
('Kalisto',2.54,180,(select Nazwa from Planety where Nazwa='Jowisz'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',10.59,NULL),
('Europa',1.12,50,(select Nazwa from Planety where Nazwa='Jowisz'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',5.43,NULL),
('Tytan',7.65,30,(select Nazwa from Planety where Nazwa='Saturn'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',652,NULL),
('Miranda',3.12,25,(select Nazwa from Planety where Nazwa='Saturn'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',8.32,NULL),
('Enceladus',0.79,20,(select Nazwa from Planety where Nazwa='Saturn'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',0.51,NULL),
('Charon',0.07,15,NULL,(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',0.002,(select Nazwa_katalogowa from Komety_i_planetoidy where Nazwa_katalogowa='Pluton')),
('BVB1234',13,3450,NULL,(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1961-01-01',0.001,(select Nazwa_katalogowa from Komety_i_planetoidy where Nazwa_katalogowa='Pluton')),
('PSK4521',15.43,324,(select Nazwa from Planety where Nazwa='Namek'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12',1532,NULL),
('STS12G',6.83,10,(select Nazwa from Planety where Nazwa='Namek'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12',123,NULL),
('XXC12',0.28,56,(select Nazwa from Planety where Nazwa='Namek'),(select ID from Misje_kosmiczne where Nazwa='New Horizons'),'1962-03-12',0.1,NULL)

insert into Astronomowie_w_Misjach (ID_Misji,ID_Astronoma) values
((select ID from Misje_kosmiczne where Nazwa='XPlore'),(select ID from Astronomowie where Imiê='Aleksander' and Nazwisko='Wolszczan')),
((select ID from Misje_kosmiczne where Nazwa='XPlore'),(select ID from Astronomowie where Imiê='Stephen' and Nazwisko='Hawking')),
((select ID from Misje_kosmiczne where Nazwa='XPlore'),(select ID from Astronomowie where Imiê='Daiki' and Nazwisko='Ito')),
((select ID from Misje_kosmiczne where Nazwa='XPlore'),(select ID from Astronomowie where Imiê='John' and Nazwisko='Cook')),
((select ID from Misje_kosmiczne where Nazwa='XPlore'),(select ID from Astronomowie where Imiê='Dieter' and Nazwisko='Wurden')),
((select ID from Misje_kosmiczne where Nazwa='XPlore'),(select ID from Astronomowie where Imiê='Allesandro' and Nazwisko='Garcia')),
((select ID from Misje_kosmiczne where Nazwa='XPlore'),(select ID from Astronomowie where Imiê='Morgan' and Nazwisko='Slowman')),
((select ID from Misje_kosmiczne where Nazwa='Venera-4'),(select ID from Astronomowie where Imiê='Aleksander' and Nazwisko='Wolszczan')),
((select ID from Misje_kosmiczne where Nazwa='Venera-4'),(select ID from Astronomowie where Imiê='Otto' and Nazwisko='Berge')),
((select ID from Misje_kosmiczne where Nazwa='Venera-4'),(select ID from Astronomowie where Imiê='Pierre' and Nazwisko='Croiss')),
((select ID from Misje_kosmiczne where Nazwa='Venera-4'),(select ID from Astronomowie where Imiê='Juliet' and Nazwisko='Rose')),
((select ID from Misje_kosmiczne where Nazwa='Apollo 19'),(select ID from Astronomowie where Imiê='Aleksander' and Nazwisko='Wolszczan')),
((select ID from Misje_kosmiczne where Nazwa='Apollo 19'),(select ID from Astronomowie where Imiê='Mark' and Nazwisko='Brand')),
((select ID from Misje_kosmiczne where Nazwa='Apollo 19'),(select ID from Astronomowie where Imiê='Elon' and Nazwisko='Muss')),
((select ID from Misje_kosmiczne where Nazwa='Apollo 19'),(select ID from Astronomowie where Imiê='Peter' and Nazwisko='Kobas')),
((select ID from Misje_kosmiczne where Nazwa='Mariner-2'),(select ID from Astronomowie where Imiê='Aleksander' and Nazwisko='Wolszczan')),
((select ID from Misje_kosmiczne where Nazwa='Mariner-2'),(select ID from Astronomowie where Imiê='Mu' and Nazwisko='Bang')),
((select ID from Misje_kosmiczne where Nazwa='Mariner-2'),(select ID from Astronomowie where Imiê='Daniel' and Nazwisko='Otegra')),
((select ID from Misje_kosmiczne where Nazwa='Mariner-2'),(select ID from Astronomowie where Imiê='Iwan ' and Nazwisko='Iwanow')),
((select ID from Misje_kosmiczne where Nazwa='Vestera'),(select ID from Astronomowie where Imiê='Aleksander' and Nazwisko='Wolszczan'))

insert into Uk³ad_planetarny (ID_Gwiazdy,ID_Planety) values
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select Nazwa from Planety where Nazwa='Jowisz')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select Nazwa from Planety where Nazwa='Mars')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='S³oñce2'),(select Nazwa from Planety where Nazwa='Saturn')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='Trappist'),(select Nazwa from Planety where Nazwa='Trappist-A')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='Trappist'),(select Nazwa from Planety where Nazwa='Trappist-D')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='Aldebaran'),(select Nazwa from Planety where Nazwa='Namek')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='Aldebaran'),(select Nazwa from Planety where Nazwa='BCXX12')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='Aldebaran'),(select Nazwa from Planety where Nazwa='Nabuku')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='Aldebaran'),(select Nazwa from Planety where Nazwa='CSR34A')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='Rigel'),(select Nazwa from Planety where Nazwa='HHG43A')),
((select Nazwa_katalogowa from Gwiazdy where Nazwa_katalogowa='LASS453'),(select Nazwa from Planety where Nazwa='PSRJ48B'))
