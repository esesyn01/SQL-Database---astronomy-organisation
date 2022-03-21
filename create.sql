CREATE DATABASE FED


CREATE TABLE Galaktyki
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z¥Ê¯£ÓÆ 0-9/\-\.\*\|[]()]%') not null PRIMARY KEY,
	Promieñ INT check (promieñ>99 and promieñ<10000001) not null,
	Odleg³oœæ_od_Drogii_Mlecznej bigint check(Odleg³oœæ_od_Drogii_Mlecznej < 15000000001) not null,
	ID_Gromady varchar(100) not null,
	ID_Misji int  not null,
	Data_odkrycia DATE not null,
	Kszta³t varchar(100) check (Kszta³t not like '%[^A-Z¥Ê¯£ÓÆ -0-9]%') not null
);

CREATE TABLE Astronomowie
(
	ID INT PRIMARY KEY identity(1,1) not null,
	Imiê varchar(100) check (Imiê not like '%[^A-Z¥Ê¯£ÓÆ ]%') not null,
	Nazwisko varchar(100) check (Nazwisko not like '%[^A-Z¥Ê¯£ÓÆ -]%') not null,
	Data_urodzenia DATE not null,
	Narodowoœæ varchar(100) check (Narodowoœæ not like '%[^A-Z¥Ê¯£ÓÆ -\.]%') not null
);
CREATE TABLE Gwiazdy
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z¥Ê¯£ÓÆ 0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Typ_gwiazdy varchar(100) check (Typ_gwiazdy not like '%[^A-Z¥Ê¯£ÓÆ -]%') not null,
	Promieñ float check (promieñ >0 and promieñ <5001) not null,
	Wiek FLOAT check (Wiek > 0 and Wiek <16) not null,
	ID_Galaktyki varchar(100) not null ,
	Alias varchar(100),
	ID_Misji INT not null,
	Data_odkrycia DATE not null,
	Masa FLOAT check (Masa>0 and Masa<1001) not null,
	Odleg³oœæ_od_S³oñca bigint check(Odleg³oœæ_od_S³oñca < 15000000001) not null
);
CREATE TABLE Gromady_Galaktyk
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z¥Ê¯£ÓÆ 0-9/\-\.\*\|[]()]%') PRIMARY KEY not null
);
CREATE TABLE Obiekty_centralne
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z¥Ê¯£ÓÆ 0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Typ_obiektu varchar(100) check (Typ_obiektu not like '%[^A-Z ¥Ê¯£ÓÆ-]%') not null,
	Masa real check(Masa>0 and Masa<10000000001) not null,
	ID_Galaktyki varchar(100) not null,
	ID_Misji int not null,
	Data_odkrycia DATE not null
);

CREATE TABLE Komety_i_planetoidy
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z ¥Ê¯£ÓÆ0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Okres_obiegu_gwiazdy FLOAT check (Okres_obiegu_gwiazdy>0 and Okres_obiegu_gwiazdy <5001) not null,
	Promieñ_orbity FLOAT check (Promieñ_orbity>0 and Promieñ_orbity<3000) not null,
	ID_Gwiazdy varchar(100)not null ,
	ID_Misji INT not null ,
	Data_odkrycia DATE not null
);

CREATE TABLE Planety
(
	Nazwa varchar(100) check (Nazwa not like '%[^A-Z ¥Ê¯£ÓÆ0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Masa FLOAT check (Masa>0 and Masa <5001) not null,
	Promieñ FLOAT check (Promieñ>0 and Promieñ<3001)not null,
	Typ varchar(100) check (Typ not like '%[^A-Z¥Ê¯£ÓÆ -]%') not null,
	Okres_obiegu FLOAT check(Okres_obiegu>0 and Okres_obiegu<30001)not null,
	Promieñ_orbity FLOAT check (Promieñ_orbity>0 and Promieñ_orbity<30001) not null,
	G³ówny_sk³adnik_atmosfery varchar(100) check (G³ówny_sk³adnik_atmosfery not like '%[^A-Z 0-9/\-]%') not null,
	Temperatura INT check(Temperatura>0 and Temperatura<20001) not null,
	ID_Misji INT ,
	Data_odkrycia DATE not null
);

CREATE TABLE Ksiê¿yce
(
	Nazwa varchar(100) check (Nazwa not like '%[^A-Z ¥Ê¯£ÓÆ0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Promieñ FLOAT check (Promieñ>0 and Promieñ<3001) not null,
	Temperatura INT check(Temperatura>0 and Temperatura<20001) not null,
	ID_Planety varchar(100),
	ID_Misji INT not null,
	Data_odkrycia DATE not null,
	Masa FLOAT check (Masa>0 and Masa <5001) not null,
	ID_Planetoidy varchar(100)
);

CREATE TABLE Uk³ad_planetarny
(
	ID_Gwiazdy varchar(100)not null,
	ID_Planety varchar(100)not null
	PRIMARY KEY(ID_Gwiazdy,ID_Planety) 
);

CREATE TABLE Misje_kosmiczne
(
	ID INT identity(1,1) PRIMARY KEY,
	Cel varchar(100) check(Cel not like '%[^A-Z 0-9/\-¥Ê¯£ÓÆ]%') not null,
	Nazwa varchar(100) check (Nazwa not like '%[^A-Z ¥Ê¯£ÓÆ0-9\|/()[]-\.]%') not null,
	SStatus varchar(20) CHECK(SStatus IN ('zakoñczone','planowane','w toku','zawieszone','odwo³ane')) not null, 
	Data_rozpoczêcia DATE not null,
	Data_zakoñczenia DATE not null

);

CREATE TABLE Astronomowie_w_Misjach
(
	ID_Misji INT,
	ID_Astronoma INT,
	PRIMARY KEY(ID_Misji,ID_Astronoma)
);



alter table Ksiê¿yce add constraint orbituje foreign key (ID_Planety) references Planety(Nazwa) on delete cascade on update cascade;
alter table Ksiê¿yce add constraint orbituje2 foreign key (ID_Planetoidy) references Komety_i_planetoidy(Nazwa_katalogowa)on update cascade on delete cascade;
alter table Ksiê¿yce add constraint odkryto foreign key (ID_Misji) references Misje_kosmiczne(ID);
alter table Komety_i_planetoidy add constraint okr¹¿a foreign key (ID_Gwiazdy) references Gwiazdy(Nazwa_katalogowa) on update cascade on delete cascade;
alter table Komety_i_planetoidy add constraint odkryto2 foreign key (ID_Misji) references Misje_kosmiczne(ID)on delete no action;
alter table Planety add constraint odkryto3 foreign key (ID_Misji) references  Misje_kosmiczne(ID);
alter table Uk³ad_planetarny add constraint wchodzi_w_sk³ad foreign key (ID_Planety) references Planety(Nazwa)on delete cascade on update cascade;
alter table Uk³ad_planetarny add constraint wchodzi_w_sk³ad2 foreign key (ID_Gwiazdy) references Gwiazdy(Nazwa_katalogowa)on delete cascade on update cascade;
alter table Gwiazdy add constraint nale¿y foreign key (ID_Galaktyki) references Galaktyki(Nazwa_katalogowa)on delete cascade on update cascade;
alter table Gwiazdy add constraint odkryto4 foreign key (ID_Misji) references Misje_kosmiczne(ID);
alter table Galaktyki add constraint nale¿y3 foreign key (ID_Gromady) references Gromady_Galaktyk(Nazwa_katalogowa)on delete cascade on update cascade;
alter table Galaktyki add constraint odkryto5 foreign key (ID_Misji) references Misje_kosmiczne(ID);
alter table Obiekty_centralne add constraint odkryto6 foreign key (ID_Misji) references Misje_kosmiczne(ID);
alter table Obiekty_centralne add constraint odkryto7 foreign key (ID_Galaktyki) references Galaktyki(Nazwa_katalogowa) on update cascade;
alter table Astronomowie_w_Misjach add constraint Wchodz¹_w_sk³ad_misji foreign key (ID_Astronoma) references Astronomowie(ID)on delete cascade on update cascade;
alter table Astronomowie_w_Misjach add constraint Wykonywana_przez foreign key (ID_Misji) references Misje_kosmiczne(ID)on delete cascade on update cascade;

