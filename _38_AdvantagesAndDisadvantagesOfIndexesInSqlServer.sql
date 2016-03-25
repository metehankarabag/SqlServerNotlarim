/*
Bu derste 
Index'lerin avantaj ve dezavantajlarını göreceğiz.
Index'lerden yaralanabilecek sorguları göreceğiz.
Covering Query

Index'lerin sorguyu hızlandırdığını görmüştük.
Avantajları
Where'i kullandığımız da Index'lerden faydalanırız. Çünkü koşula uyan satırlar bir yerde toplanır.
Order by ile de Index'lerden faydalanırız. Çünkü önceden sıralanmış olur.(Sıralama ters olsa bile işe yarar.)
Group by ile kullandığımızda da Index'lerden faydalanırız. - Where ile aynı mantık.
Yukarıdaki anahtarları select sorgusu ile kullandığımızda kesin işe yarar.
Update, Delete ile kullanırken de işe yarayabilir.

Dezavantaj'ları
Non Clustered Index kullanıyorsak, fazladan alan kullanırız.
Insert, Update ve delete yavaş olabilir. DML açıklamaları(Insert, Update, Delete) veri tabanındaki veriyi güncellediğinde Index'in oluşturduğu tablonunda güncellenmesi gerektiği için sorguyu yavaşlatabilir. Yani silinecek güncellenecek satırları kolay bulabiliriz fakat tüm Index tablosu yeniden düzenleneceği için sorguyu yavaşladır.

Covering Query: Sadece Index'in uygulandığı sütunun tüm değerleri almayı istiyorsak ve değerleri almak için kulladığımız select sorgununu * ile kullanırsak, hiç ihtiyacımız olmadığı halde gerçek tabloya gideriz. Çünkü Index'in oluşturduğu 2. sütunuda kullanmış oluruz. Tüm ihtiyacaımızı Index'den karşılayabildiğimiz sorguya Coverin Query deniyor.(Birden fazla sütun kullanarak Index'i oluşturabiliriz.). Bu durum NonClustered Index için geçerli, Clustered Index her zaman kapsar çünkü aynı tabloda.


*/