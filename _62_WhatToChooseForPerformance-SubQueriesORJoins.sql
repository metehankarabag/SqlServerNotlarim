/*
	MSDN'e göre Sql server'de Join ve SubQuery kullanan sorgularýn arasýnda çoðunlukla performans farklý yoktur. Yine MSDN'e göre varlýk kontrolünün yapýldýðý bazý durumlarda Join'ler daha hýzlýdýr.
	Genellikle Join'ler sub-Query'lerden daha hýzlýdýr. Gerçekte hýzý Sql Server'in oluþturduðu çalýþma planý belirler. Yani önemli olan ne yazdýðýmýz deðil Sql Server'in neye çevirdiði, Sorgular için ayný plan kullanýlýyorsa ayný derecede hýzlýdýr.
	Join'ler hýzlýdýr'a göre çalýþmak yerine client statistics'i ve execution plan'ý açýktýktan sonra 2 sorguyuda çalýþtýrýp hangisinin daha hýzlý olduðuna karar vermeliyiz.
    
	client statistics ve execution plan'ý sonra anlatacak.
	
*/

Select Id, Name, Description
from tblProducts
where ID IN
(
 Select ProductId from tblProductSales
) 

CHECKPOINT; 
GO 
DBCC DROPCLEANBUFFERS; -- Clears query cache
Go
DBCC FREEPROCCACHE; -- Clears execution plan cache
GO

	
Select distinct tblProducts.Id, Name, Description
from tblProducts
inner join tblProductSales
on tblProducts.Id = tblProductSales.ProductId

	
Select Id, Name, [Description]
from tblProducts
where Not Exists(Select * from tblProductSales where ProductId = tblProducts.Id)

----Ayný sorguyu 3 sn de çalýþtýrdýðýmda 

Select tblProducts.Id, Name, [Description]
from tblProducts
left join tblProductSales
on tblProducts.Id = tblProductSales.ProductId
where tblProductSales.ProductId IS NULL 
