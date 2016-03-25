/*Part 22 - System (String) Functions
Tüm system functionlar > Programmability > Functions> System Functions içindedir.
Bu derste çok kullanýlan String Function'larý göreceðiz.
Ascii('ABC'): Parametre olarak aldýðý String'in Acsii kodunu(int) verir.(SADECE ÝLK HARF)
Char(65): Acsii kodu(int) karaktere(String) çevirir.
LTrim('      Hello'): Sol taraftaki boþluklarý siliyor.
select RTrim('HELLO      '):Ayný durum saðdan.
Lower('ABC') ve UPPER('abc'): Biri karakterleri büyütüyor biri karakterleri küçültüyor.
Reverse('AMA'): Ýçindeki yazýyý ters çeviriyor.
Len('a'): Parametre olarak aldýðý String'in boyunu alýyor.

--Part 23
Left, Right, CharIndex ve SubString Function
Left('ABCDE', 3) ve Right('ABCDE', 3): Biri soldan biri saðdan 3 karakteri dönderiyor.
CharIndex('Expression_To_Find', 'Expression_To_Search', 'Start_Location(optional)'):Birinci parametrede belirlediðimz karakterin ikinci parametredeki konumun Index deðerini döner.1 den baþlar.
SubString('Expression', 'Start', 'Length'): 1. Parametredeki String'de, 2. parametrede belirtiLen Index'den SONRAKi karakterlerden, 3. parametrede belirtiLen sayý kadar karakter alýr.

--Part 24
Replicate, Space Patindex,Replace,Stuff Functions
Replicate('asd ',5):1. parametredeki string'i 2. parametredeki kadar tekrarlar. -> email'i gizlemek için kullanýlmýþ
Space(5): Kullanýldýðý yere parametre olarak aldýðý sayý kadar boþluk ekler.
Patindex('%@aaa.com%',Email):1. parametrede belirlenen string 2. parametreye gelen deðer içinde aranýr, bulunursa belirletiðimiz string'in ilk karakterinin Index deðerini döner, bulunmassa 0 döner. CharIndex'e benzer. Fakat CharIndex'de % gibi iþaretleri kullanamayýz.
Replace(Email,'.com','.net'): 1. parametreye gelen string içinde 2. parametrede belirlediðimiz string'i arýyoruz bulursak, 3. parametredeki deðer ile deðiþtiriyoruz.
Stuff(Email,2,3,'*****'):1. parametreye gelen String'in 2. parametrede belirlediðimiz baþlangýç Index'inden baþlayarak, 3. parametrede belirlediðimiz sayýdaki karakterini, 4. parametrede belirlediðimiz String ile deðiþtiriyoruz.
*/

Select Ascii('ABC')
select Char(65)
/*
Büyük harflerin Ascii kodu -> 65 ile 90
Küçüklerin -> 97 ile 122
sýnýfýn -> 48
Declare @Start int
Set @Start = 65
while (@Start <= 90)
Begin
	Print Char(@Start)
	SET @Start = @Start+1 
End
*/
select LTrim('      Hello')

select RTrim('HELLO      ')

SELECT Lower('ABC') SELECT UPPER('abc')
select Reverse('AMA')
select Len('a')
Example: Select Left('ABCDE', 3) Output: ABC

Example: Select Right('ABCDE', 3) Output: CDE


Left('ABCDE', 3) Output: ABC
Right('ABCDE', 3) Output: CDE 

Select CharIndex('@','sara@aaa.com',1) Output: 5

Select SubString('John@bbb.com',5, 7) Output: bbb.com--HardCode
Select SubString('John@bbb.com',(CharIndex('@', 'John@bbb.com') + 1), (Len('John@bbb.com') - CharIndex('@','John@bbb.com'))) Output: bbb.com--Dinamik
-- Tabloda kullanýrken
Select SubString(Email, CharIndex('@', Email) + 1, Len(Email) - CharIndex('@', Email)) as EmailDomain, COUNT(Email) as Total from tblEmployee
Group By SubString(Email, CharIndex('@', Email) + 1, Len(Email) - CharIndex('@', Email))
 
 
Select	FistName, LastName,	SubString(Email,1,2)+ Replace('*',5) + SubString(Email, CharIndex('@',Email),Len(Email)-CharIndex('@',Email)+1) as Email from tblEmployee
select '     '
select Space(5)
--Patindex() Function
Select Email, Patindex('%@aaa.com',Email) as FistOccurence 
from tblEmployee
Where Patindex('%aaa.com',Email)>0 0 dan büyükleri alýyoruz.
--Replace() Function
select Email, Replace(Email,'.com','.net') as ConvertedEmail 
--Stuff() Funciton
Select FistName,LastName.Email,	STUFF(Email,2,3,'*****') as StuffedEmail 
