-- 1.	ZnajdŸ wszystkich astronomów FED, bior¹cych udzia³ w misji „Mariner-2”.
select * from Astronomowie a inner join Astronomowie_w_Misjach m on a.ID=m.ID_Astronoma
where m.ID_Misji=(select ID from Misje_kosmiczne where Nazwa='Mariner-2')



-- 2.	Wybierz i wypisz 10 astronomów, którzy brali udzia³ w najwiêkszej liczbie misji i posortuj ich malej¹co
-- ze wzglêdu na liczbê misji, a nastêpnie malej¹co ze wzglêdu na ich wiek.

select top 10 count(Astronomowie.ID) as "Liczba misji", max(Astronomowie.Imiê) as "Imiê astronoma",
max(Astronomowie.Nazwisko) as "Nazwisko astronoma",max(Astronomowie.Narodowoœæ) as "Narodowoœæ",
max(Astronomowie.Data_Urodzenia) as "Dataa"
from Astronomowie
    inner join Astronomowie_w_Misjach on Astronomowie.ID=Astronomowie_w_Misjach.ID_Astronoma 
	inner join Misje_kosmiczne on Misje_kosmiczne.ID=Astronomowie_w_Misjach.ID_Misji
	group by Astronomowie.ID
	order by [Liczba misji] desc, [Dataa]

-- 3.	Zestawienie wszystkich planowanych misji w kolejnoœci od tych najbli¿szych. 
-- Jeœli rozpoczynaj¹ siê tego samego dnia, to wtedy pierwsza ma byæ d³u¿sza misja.

select * from Misje_kosmiczne where (Misje_kosmiczne.SStatus = 'planowane')
order by Data_rozpoczêcia, Data_zakoñczenia desc

--4. ZnajdŸ wszystkie ksiê¿yce, które orbituj¹ wokó³ planety i maj¹ tempraturê ró¿ni¹c¹ siê od
--niej nie wiêcej ni¿ 50 stopni, a nastêpnie posortuj je malej¹co wed³ug daty ich odkrycia oraz
--rosn¹co wed³ug ich masy (np. Jeœli data odkrycia jest taka sama, to pierwszy bêdzie ksiê¿yc
--o mniejszej masie).

select Ksiê¿yce.Nazwa,Ksiê¿yce.Promieñ,Ksiê¿yce.Temperatura,Ksiê¿yce.ID_Planety,Ksiê¿yce.ID_Planety,Ksiê¿yce.Data_odkrycia,Ksiê¿yce.Masa from Ksiê¿yce 
inner join Planety on Planety.Nazwa = Ksiê¿yce.ID_Planety
where (ID_Planety is not null)  and Ksiê¿yce.Temperatura<Planety.Temperatura+50 and Ksiê¿yce.Temperatura > Planety.Temperatura-50
order by Ksiê¿yce.Data_odkrycia,Ksiê¿yce.Masa desc;


-- 5.	Utwórz zestawienie wszystkich misji, które odkry³y jakiekolwiek galaktyki w 1962 roku.

select count(distinct Galaktyki.Nazwa_katalogowa) as "Liczba_galaktyk",
max(Misje_kosmiczne.Nazwa) as "Nazwa misji" from Misje_kosmiczne
inner join Galaktyki on Galaktyki.ID_Misji= Misje_kosmiczne.ID
where (Galaktyki.Data_odkrycia>'1961-12-31' and Galaktyki.Data_odkrycia<'1963-01-01')
group by Misje_kosmiczne.ID

-- 6.	Odkryto bakteriê, która mo¿e prze¿yæ dawkê promieniowania wytwarzan¹ przez czerwone kar³y.
--ZnajdŸ wszystkie planety, które znajduj¹ siê w takich uk³adach oraz ich temperatura
--nie jest ni¿sza ni¿ 220K oraz wiêksza ni¿ 340K. Uszereguj je rosn¹co wed³ug odleg³oœci od S³oñca.

select p.Nazwa,p.ID_Misji,p.Typ,p.Temperatura,p.Okres_obiegu,g.Odleg³oœæ_od_S³oñca from Planety p
inner join Uk³ad_planetarny u on p.Nazwa=u.ID_Planety
inner join Gwiazdy g on g.Nazwa_katalogowa=u.ID_Gwiazdy
where g.Typ_gwiazdy like 'czerwony karze³' and p.Temperatura<341 and p.Temperatura>219
order by g.Odleg³oœæ_od_S³oñca

-- 7. Wypisz wszystkie ksiê¿yce najciê¿szej planety

select k.Nazwa,k.ID_Planety,k.ID_Misji,k.Data_odkrycia,k.Masa,k.Promieñ,k.Temperatura from Ksiê¿yce k
inner join Planety p on p.Nazwa=k.ID_Planety
where k.ID_Planety = (select Nazwa from Planety where Masa=
(select max(Masa) from Planety))

-- 8. Wypisz wszystkie ksiê¿yce planety, która ma ich najwiêcej

select k.Nazwa,k.ID_Planety,k.ID_Misji,k.Data_odkrycia,k.Masa,k.Promieñ,k.Temperatura from Ksiê¿yce k
inner join Planety p on p.Nazwa=k.ID_Planety
where k.ID_Planety = (select Nazwa from Planety where Nazwa=
(select top 1 ID_Planety from Ksiê¿yce
group by ID_Planety
order by count(ID_Planety) desc))

--9.	Stwórz widok gdzie umieœcisz nazwê i odleg³oœæ galaktyki od Drogi Mlecznej,
-- ID, nazwê oraz status misji, w której zosta³a ona odkryta przed rokiem 2000.
go
create view Widok (Nazwa_galaktyki,Odleglosc_galaktyki,ID_Misji,Nazwa_misji,SStatus) as 
select g.Nazwa_katalogowa,g.Odleg³oœæ_od_Drogii_Mlecznej,g.ID_Misji,m.Nazwa,m.SStatus
from Galaktyki g, Misje_kosmiczne m
where g.Data_odkrycia < '2000-01-01' and g.ID_Misji=m.ID 
go

select * from Widok








