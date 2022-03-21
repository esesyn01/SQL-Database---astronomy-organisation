-- 1.	Znajd� wszystkich astronom�w FED, bior�cych udzia� w misji �Mariner-2�.
select * from Astronomowie a inner join Astronomowie_w_Misjach m on a.ID=m.ID_Astronoma
where m.ID_Misji=(select ID from Misje_kosmiczne where Nazwa='Mariner-2')



-- 2.	Wybierz i wypisz 10 astronom�w, kt�rzy brali udzia� w najwi�kszej liczbie misji i posortuj ich malej�co
-- ze wzgl�du na liczb� misji, a nast�pnie malej�co ze wzgl�du na ich wiek.

select top 10 count(Astronomowie.ID) as "Liczba misji", max(Astronomowie.Imi�) as "Imi� astronoma",
max(Astronomowie.Nazwisko) as "Nazwisko astronoma",max(Astronomowie.Narodowo��) as "Narodowo��",
max(Astronomowie.Data_Urodzenia) as "Dataa"
from Astronomowie
    inner join Astronomowie_w_Misjach on Astronomowie.ID=Astronomowie_w_Misjach.ID_Astronoma 
	inner join Misje_kosmiczne on Misje_kosmiczne.ID=Astronomowie_w_Misjach.ID_Misji
	group by Astronomowie.ID
	order by [Liczba misji] desc, [Dataa]

-- 3.	Zestawienie wszystkich planowanych misji w kolejno�ci od tych najbli�szych. 
-- Je�li rozpoczynaj� si� tego samego dnia, to wtedy pierwsza ma by� d�u�sza misja.

select * from Misje_kosmiczne where (Misje_kosmiczne.SStatus = 'planowane')
order by Data_rozpocz�cia, Data_zako�czenia desc

--4. Znajd� wszystkie ksi�yce, kt�re orbituj� wok� planety i maj� tempratur� r�ni�c� si� od
--niej nie wi�cej ni� 50 stopni, a nast�pnie posortuj je malej�co wed�ug daty ich odkrycia oraz
--rosn�co wed�ug ich masy (np. Je�li data odkrycia jest taka sama, to pierwszy b�dzie ksi�yc
--o mniejszej masie).

select Ksi�yce.Nazwa,Ksi�yce.Promie�,Ksi�yce.Temperatura,Ksi�yce.ID_Planety,Ksi�yce.ID_Planety,Ksi�yce.Data_odkrycia,Ksi�yce.Masa from Ksi�yce 
inner join Planety on Planety.Nazwa = Ksi�yce.ID_Planety
where (ID_Planety is not null)  and Ksi�yce.Temperatura<Planety.Temperatura+50 and Ksi�yce.Temperatura > Planety.Temperatura-50
order by Ksi�yce.Data_odkrycia,Ksi�yce.Masa desc;


-- 5.	Utw�rz zestawienie wszystkich misji, kt�re odkry�y jakiekolwiek galaktyki w 1962 roku.

select count(distinct Galaktyki.Nazwa_katalogowa) as "Liczba_galaktyk",
max(Misje_kosmiczne.Nazwa) as "Nazwa misji" from Misje_kosmiczne
inner join Galaktyki on Galaktyki.ID_Misji= Misje_kosmiczne.ID
where (Galaktyki.Data_odkrycia>'1961-12-31' and Galaktyki.Data_odkrycia<'1963-01-01')
group by Misje_kosmiczne.ID

-- 6.	Odkryto bakteri�, kt�ra mo�e prze�y� dawk� promieniowania wytwarzan� przez czerwone kar�y.
--Znajd� wszystkie planety, kt�re znajduj� si� w takich uk�adach oraz ich temperatura
--nie jest ni�sza ni� 220K oraz wi�ksza ni� 340K. Uszereguj je rosn�co wed�ug odleg�o�ci od S�o�ca.

select p.Nazwa,p.ID_Misji,p.Typ,p.Temperatura,p.Okres_obiegu,g.Odleg�o��_od_S�o�ca from Planety p
inner join Uk�ad_planetarny u on p.Nazwa=u.ID_Planety
inner join Gwiazdy g on g.Nazwa_katalogowa=u.ID_Gwiazdy
where g.Typ_gwiazdy like 'czerwony karze�' and p.Temperatura<341 and p.Temperatura>219
order by g.Odleg�o��_od_S�o�ca

-- 7. Wypisz wszystkie ksi�yce najci�szej planety

select k.Nazwa,k.ID_Planety,k.ID_Misji,k.Data_odkrycia,k.Masa,k.Promie�,k.Temperatura from Ksi�yce k
inner join Planety p on p.Nazwa=k.ID_Planety
where k.ID_Planety = (select Nazwa from Planety where Masa=
(select max(Masa) from Planety))

-- 8. Wypisz wszystkie ksi�yce planety, kt�ra ma ich najwi�cej

select k.Nazwa,k.ID_Planety,k.ID_Misji,k.Data_odkrycia,k.Masa,k.Promie�,k.Temperatura from Ksi�yce k
inner join Planety p on p.Nazwa=k.ID_Planety
where k.ID_Planety = (select Nazwa from Planety where Nazwa=
(select top 1 ID_Planety from Ksi�yce
group by ID_Planety
order by count(ID_Planety) desc))

--9.	Stw�rz widok gdzie umie�cisz nazw� i odleg�o�� galaktyki od Drogi Mlecznej,
-- ID, nazw� oraz status misji, w kt�rej zosta�a ona odkryta przed rokiem 2000.
go
create view Widok (Nazwa_galaktyki,Odleglosc_galaktyki,ID_Misji,Nazwa_misji,SStatus) as 
select g.Nazwa_katalogowa,g.Odleg�o��_od_Drogii_Mlecznej,g.ID_Misji,m.Nazwa,m.SStatus
from Galaktyki g, Misje_kosmiczne m
where g.Data_odkrycia < '2000-01-01' and g.ID_Misji=m.ID 
go

select * from Widok








