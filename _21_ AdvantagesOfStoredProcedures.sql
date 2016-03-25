/*
Aşağıdaki avantajlar Plansız sorgu yerine Stored Procedure kullanmanın avantajları.

	Sql'de bir sorgu çalıştırıldığında 3 şey olur.
	1. Sorgu yazımı kontrol edilir.
	2. derlenir
	3. çalışma planı oluşturulur.

1. Execution plan retention and reusability:  Procedure'ler derlendiğinde ve çalışma planları kaydedidir ve Procedure tekrar çalıştırıldığında bu planı kullanılır. Plansız sorgular da plan oluşturur ve yeniden kullanır. fakat yazımı değiştiğinde, parametre olarak girilen değer değiştiğinde yeni plan oluşturulur. Yani sorguyu oluştururken bir boşluk bile eklesek plan yeniden oluşturulur. 
2. Reduces network traffic: Ağ trafiğini azaldır. Procedure'lere bir çok sorgudan oluşabilir, veri tabanında çalıştırmak için ise sadece bir kaç kelimeyi kullanırız. Plansız sorgularsa ise tüm işi yazıp göndermek zorundayız. 

3. Code reusability and better maintainability:  Bir Procedure birden fazla uygulamada kullanılabilir. Hazırladığımız işlem Procedure içinde ise Procedure'i güncelleyip tüm uygumalarda değişikliği gerçekleştirmiş oluruz. Fakat Plansız sorgu kullansaydık her sorgu için ayrı ayrı yazma zorunda kalacaktı ve ayrı ayrı düzenlemek zorunda kalacaktık.

4. Better Security : Bir tablonun bazı verilerinin görüntülenmesi bazılarının görüntülenmemesi gerekiyorsa, tabloya select sorgusu uygulanabilmesini engelleyebiliriz. Çünkü tüm veri alınabilir. Fakat engellersek hiç veri göremeyiz. Bu durumda Procedure kullanabiliriz. Çünkü içinde yazdığımız select sorgusu sadece belirli sütun değerlerini gösterir.
5. Avoids SQL Injection attack
*/