/*Index
Index'ler belirlenen sütunun değerlerine göre tabloların satırlarını sıralamak için kullanılır. Her tabloya birden fazla Index ekleyebiliriz. Bu durumda Index uygulanmış her satır tablo satırlarını farklı şekilde sıralar. Yani tablodaki bir Index'in tablonun varsayılan sıralamasını belirlemesi gerekir. Index'lerin oluşturulma türüne göre belirlenen birden fazla türü var. Varsayılan sıralamayı belirleyen Index türü her tabloda sadece bir tane olur fakat tabloya başka türde Index ekleyebiliriz.
Index türlerini ve çalışma şekillerini gelecek derslerde göreceğiz.
Not: Oluşturduğumuz Index birden fazla sütun üzerinde çalışabilir.
Not: Index'leri View'lar ve Tablolar ile kullanabiliriz.
Not: Sp_HelpIndex TableName ile Index'i görebiliriz.
*/	

CREATE Index IX_tblEmployee_Salary  --> Index anahatarını kullanarak oluşturduğumuz Index'in türü NonClustered'dır. ve NonUniqe'dir.Yani sütun değerleri aynı olabilir. Yani aynı olamayacağı türü de var.
ON tblEmployee (SALARY ASC) 

Select * from tblEmployee where Salary > 5000 and Salary <10000

Drop Index tblEmployee.IX_tblEmployee_Salary --> TableName.IndexName

