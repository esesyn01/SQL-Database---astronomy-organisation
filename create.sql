CREATE DATABASE FED


CREATE TABLE Galaktyki
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z�ʯ���� 0-9/\-\.\*\|[]()]%') not null PRIMARY KEY,
	Promie� INT check (promie�>99 and promie�<10000001) not null,
	Odleg�o��_od_Drogii_Mlecznej bigint check(Odleg�o��_od_Drogii_Mlecznej < 15000000001) not null,
	ID_Gromady varchar(100) not null,
	ID_Misji int  not null,
	Data_odkrycia DATE not null,
	Kszta�t varchar(100) check (Kszta�t not like '%[^A-Z�ʯ���� -0-9]%') not null
);

CREATE TABLE Astronomowie
(
	ID INT PRIMARY KEY identity(1,1) not null,
	Imi� varchar(100) check (Imi� not like '%[^A-Z�ʯ���� ]%') not null,
	Nazwisko varchar(100) check (Nazwisko not like '%[^A-Z�ʯ���� -]%') not null,
	Data_urodzenia DATE not null,
	Narodowo�� varchar(100) check (Narodowo�� not like '%[^A-Z�ʯ���� -\.]%') not null
);
CREATE TABLE Gwiazdy
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z�ʯ���� 0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Typ_gwiazdy varchar(100) check (Typ_gwiazdy not like '%[^A-Z�ʯ���� -]%') not null,
	Promie� float check (promie� >0 and promie� <5001) not null,
	Wiek FLOAT check (Wiek > 0 and Wiek <16) not null,
	ID_Galaktyki varchar(100) not null ,
	Alias varchar(100),
	ID_Misji INT not null,
	Data_odkrycia DATE not null,
	Masa FLOAT check (Masa>0 and Masa<1001) not null,
	Odleg�o��_od_S�o�ca bigint check(Odleg�o��_od_S�o�ca < 15000000001) not null
);
CREATE TABLE Gromady_Galaktyk
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z�ʯ���� 0-9/\-\.\*\|[]()]%') PRIMARY KEY not null
);
CREATE TABLE Obiekty_centralne
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z�ʯ���� 0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Typ_obiektu varchar(100) check (Typ_obiektu not like '%[^A-Z �ʯ����-]%') not null,
	Masa real check(Masa>0 and Masa<10000000001) not null,
	ID_Galaktyki varchar(100) not null,
	ID_Misji int not null,
	Data_odkrycia DATE not null
);

CREATE TABLE Komety_i_planetoidy
(
	Nazwa_katalogowa varchar(100) check (Nazwa_katalogowa not like '%[^A-Z �ʯ����0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Okres_obiegu_gwiazdy FLOAT check (Okres_obiegu_gwiazdy>0 and Okres_obiegu_gwiazdy <5001) not null,
	Promie�_orbity FLOAT check (Promie�_orbity>0 and Promie�_orbity<3000) not null,
	ID_Gwiazdy varchar(100)not null ,
	ID_Misji INT not null ,
	Data_odkrycia DATE not null
);

CREATE TABLE Planety
(
	Nazwa varchar(100) check (Nazwa not like '%[^A-Z �ʯ����0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Masa FLOAT check (Masa>0 and Masa <5001) not null,
	Promie� FLOAT check (Promie�>0 and Promie�<3001)not null,
	Typ varchar(100) check (Typ not like '%[^A-Z�ʯ���� -]%') not null,
	Okres_obiegu FLOAT check(Okres_obiegu>0 and Okres_obiegu<30001)not null,
	Promie�_orbity FLOAT check (Promie�_orbity>0 and Promie�_orbity<30001) not null,
	G��wny_sk�adnik_atmosfery varchar(100) check (G��wny_sk�adnik_atmosfery not like '%[^A-Z 0-9/\-]%') not null,
	Temperatura INT check(Temperatura>0 and Temperatura<20001) not null,
	ID_Misji INT ,
	Data_odkrycia DATE not null
);

CREATE TABLE Ksi�yce
(
	Nazwa varchar(100) check (Nazwa not like '%[^A-Z �ʯ����0-9/\-\.\*\|[]()]%') PRIMARY KEY not null,
	Promie� FLOAT check (Promie�>0 and Promie�<3001) not null,
	Temperatura INT check(Temperatura>0 and Temperatura<20001) not null,
	ID_Planety varchar(100),
	ID_Misji INT not null,
	Data_odkrycia DATE not null,
	Masa FLOAT check (Masa>0 and Masa <5001) not null,
	ID_Planetoidy varchar(100)
);

CREATE TABLE Uk�ad_planetarny
(
	ID_Gwiazdy varchar(100)not null,
	ID_Planety varchar(100)not null
	PRIMARY KEY(ID_Gwiazdy,ID_Planety) 
);

CREATE TABLE Misje_kosmiczne
(
	ID INT identity(1,1) PRIMARY KEY,
	Cel varchar(100) check(Cel not like '%[^A-Z 0-9/\-�ʯ����]%') not null,
	Nazwa varchar(100) check (Nazwa not like '%[^A-Z �ʯ����0-9\|/()[]-\.]%') not null,
	SStatus varchar(20) CHECK(SStatus IN ('zako�czone','planowane','w toku','zawieszone','odwo�ane')) not null, 
	Data_rozpocz�cia DATE not null,
	Data_zako�czenia DATE not null

);

CREATE TABLE Astronomowie_w_Misjach
(
	ID_Misji INT,
	ID_Astronoma INT,
	PRIMARY KEY(ID_Misji,ID_Astronoma)
);



alter table Ksi�yce add constraint orbituje foreign key (ID_Planety) references Planety(Nazwa) on delete cascade on update cascade;
alter table Ksi�yce add constraint orbituje2 foreign key (ID_Planetoidy) references Komety_i_planetoidy(Nazwa_katalogowa)on update cascade on delete cascade;
alter table Ksi�yce add constraint odkryto foreign key (ID_Misji) references Misje_kosmiczne(ID);
alter table Komety_i_planetoidy add constraint okr��a foreign key (ID_Gwiazdy) references Gwiazdy(Nazwa_katalogowa) on update cascade on delete cascade;
alter table Komety_i_planetoidy add constraint odkryto2 foreign key (ID_Misji) references Misje_kosmiczne(ID)on delete no action;
alter table Planety add constraint odkryto3 foreign key (ID_Misji) references  Misje_kosmiczne(ID);
alter table Uk�ad_planetarny add constraint wchodzi_w_sk�ad foreign key (ID_Planety) references Planety(Nazwa)on delete cascade on update cascade;
alter table Uk�ad_planetarny add constraint wchodzi_w_sk�ad2 foreign key (ID_Gwiazdy) references Gwiazdy(Nazwa_katalogowa)on delete cascade on update cascade;
alter table Gwiazdy add constraint nale�y foreign key (ID_Galaktyki) references Galaktyki(Nazwa_katalogowa)on delete cascade on update cascade;
alter table Gwiazdy add constraint odkryto4 foreign key (ID_Misji) references Misje_kosmiczne(ID);
alter table Galaktyki add constraint nale�y3 foreign key (ID_Gromady) references Gromady_Galaktyk(Nazwa_katalogowa)on delete cascade on update cascade;
alter table Galaktyki add constraint odkryto5 foreign key (ID_Misji) references Misje_kosmiczne(ID);
alter table Obiekty_centralne add constraint odkryto6 foreign key (ID_Misji) references Misje_kosmiczne(ID);
alter table Obiekty_centralne add constraint odkryto7 foreign key (ID_Galaktyki) references Galaktyki(Nazwa_katalogowa) on update cascade;
alter table Astronomowie_w_Misjach add constraint Wchodz�_w_sk�ad_misji foreign key (ID_Astronoma) references Astronomowie(ID)on delete cascade on update cascade;
alter table Astronomowie_w_Misjach add constraint Wykonywana_przez foreign key (ID_Misji) references Misje_kosmiczne(ID)on delete cascade on update cascade;

