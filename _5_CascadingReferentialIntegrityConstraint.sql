/*FOREÝGN KEY'in kullandýðý deðerleri silme
Referance tablodaki bir deðer Foreign Key'in uygulandýðý sütunda kullanýlýyorsa ve referans tablodan bu satýrý silmeyi denersek hata alýrýz. Bunun nedeni referanse tabloda silme ve güncelleme iþlerine Foreign Key'in izin vermemesidir. Bu davranýþý nedeni Foreign Key Relationships pencesesinin en altýnda bulunan Insert and Update specification sekmesesindeki Delete ve update Role'un varsayýlan olarak No Action deðer almasýdýr. Verebileceðimiz 4 deðer var. 
1. No Action: Ýþlemin gerçekleþtirilmesi durumunda hata verir.
2. Cascade: Referans tablodan silinen satýr ile iliþkili tüm satýrlar silinir.
3. Set Null: Foreing Key sütununda iliþkili olan deðerler Null'a alýr. 
4. Set Default: Bu seçeneði kullanabilmemiz için Foreing Key sütun üzerinde çalýþan bir Default Constraint olmasý gerekir. Referans tablodan silinen satýr ile iliþkili Default Constraint'de belirlediðimiz varsayýlan deðeri alýr.
*/
select * from tblGender
select * from tblPerson

delete from tblGender WHERE ID = 2

