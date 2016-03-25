/*
Bu Derste DataBase Nomalization, Normal formalrın listesi ve birinci Normal Form'u göreceğiz.
Veri tabano normalleştirmesinin amacı tablolardaki fazla verileri azalmaktır. Söylenebilecek fazla bir şey yok. Bir tabloda belirli bir düzene göre süreki kullanılan aynı verileri başka bir tablo ya almak. BU durumda tek bir veri tüm işimizi görür, daha az hafıza kullanırız, bu veriyi değiştirdiğimizde veriyi kullanan tüm sütunların değerini değiştirmiş oluruz.(hız). Veri tek bir yerden kontrol edildiği için tablo turarlılığı artar.

Tablo yapısına göre tablo normalleştirmenin 6 yolu var. -> 1. 1NF 2. 2NF .... 6. 6NF

1NF
1. her sütunun 1 değeri olmalı -> yani sütun içinde birden fazla değer aralarına virgul koyularak oluşturulmamalı.
2. Verisi bir birine benzeyen sütunlar olmamalı, tüm veriyi tek bir sütunda toplayıp ayırmanın bir yolunu bulmamız lazım.(Ayırmak için ayırma değerlerini başka bir tabloda tutup FOreing Key ile tabloları bağlamalıyız. )
3. Primary key kullanmak lazım.

2NF
1. 1NF in tüm şartlarını karşalayacak
2. Ayrılmış bir tabloya redundant(Gerekiz) veri taşınır.(1nf'de de yapmıştık)
3. 2 tablo arasındaki bağlantığı FOREING KEY kullanarak oluştururuz.(1nf'de birleştirmemiştik.)

3NF
1. 1NF ve 2NF şartlarını karşılamak
2. Sütunlardaki değerler sadece Primary key ile ilişkili olmalı. Başka sütunlardaki değerlerle ilişkili olmamalı
*/