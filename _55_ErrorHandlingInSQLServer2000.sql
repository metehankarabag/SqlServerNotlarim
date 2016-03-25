/*
2 farklı hata yakalama şekli var.
1. Sql Server 2005'deki try/Catch blogu ile (Bir sonraki derste göreceğiz.)
2. Sql Server 2000'deki @@Error System Function'ı ile

2. @@Error: @@Error hata yoksa 0 döner, varsa 0 dan farklı bir değer döner. @@Error ile sadece bir önce gerçekleşen işlemin hata verip vermediğini anlayabiliriz. Yani hata veren bir işlemden sonra hata vermeyen bir işlem çalışırsa ve @@Error'u bu işlemden sonra kullanırsak bize hata olmadığını söyler. Bu yüzden hata olması muthemel olan sorgudan hemen sonra kullanmak zorundayız. Kullandıktan sonra değeri bir Field'a alıp, hata durumundaki işlemi başka bir yerde çalıştırabiliriz.

Sql Server'da hata oluşturmak için RaiseError() function kullanılır. C#'da throw anahtarı kullanılır. RaiseError() methodunun 3 parametresi var.
1. Parametre hata mesajı
2. Error Severity: Hatanın ciddiyet derecesi. 		--> Genellikle 16 dır. Bu kullanıcının çözebileceği bir hata olduğu anlamına gelir.
3. Error State: 1 ile 255 arasında değer olabilir fakat bu method ile sadece 1 ile 127 arasındaki değerleri kullanabilriiz. 	--> Genellikle 1 kullanırız.

Not: @@ ile başlayan system Function'lar Global Variables olarak da adlandırılır. Variable değillerdir, çalışma şekil Variable'a değil Function'a benzerdir. 

Not: Aşağıdaki Procedue'lerde mevcut ürünler tablosundan satılan ürün miktarını, çıkartıyoruz ve satılmış ürünler tablosuna giriyoruz. Bu iş için 2 sorgu kullanmamız gerekir. Bu sorgular bir birinden bağımsız olduğu için biri çalışırken diğeri hata verebilir. Mevcut ürünler tablosundan çıkarıldıktan sonra, satılmış ürünler tablosuna eklenemesse hata olur. Bu sorunu çözmek için Transaction kullanıyoruz. Transaction içinde yazdığımız herhangi bir işlem hata verirse, gerçekleşen işlemlerin etkisi geri almak ve gerçekleştirilmeyen işlemler çalışmasını engellemek için kullanırız. Yani bir birinden bağımsız işleri birleştirir.
*/
Create Procedure spSellProduct --> 2 parametreli Procedure
@ProductId int,
@QuantityToSell int 
as
Begin
Declare @StockAvailable int --> Belirtilen üründen ne kadar olduğunu alıyoruz.
Select @StockAvailable = QtyAvailable 
from tblProduct where ProductId = @ProductId --> 1. parametre satılacak ürünü belirliyor.
 
 if(@StockAvailable < @QuantityToSell) --> Stokdakinden fazla istenmişse,
   Begin
  Raiserror('Not enough stock available',16,1) --> Hata
   End
 Else
   Begin
    Begin Tran --> Transaction oluşturuyoruz. aşağıdaki 2 sorgudan biri hata verirse, diğerinin çalışmamasını, çalışmışsa etkisinin geri alınmasını sağlar.
  Update tblProduct set QtyAvailable = (QtyAvailable - @QuantityToSell)
  where ProductId = @ProductId --> Kullanın belirlediği ürününun stockdaki miktarını güncelliyoruz çünkü sattık.
  
  Declare @MaxProductSalesId int --> Bu Field'ı oluşturma nedenimiz Tablonun Primary Key'inin kendi kendine artmaması.
  Select @MaxProductSalesId = Case When --> Bu sorgunun satılmış ürünler tablosundaki en son ıd'i almak.
          MAX(ProductSalesId) IS NULL --> Satılan ilk ürünse Null gelir.
          Then 0 else MAX(ProductSalesId) end -->Null'sa 0 değilse kendi değeri.
         from tblProductSales
  Set @MaxProductSalesId = @MaxProductSalesId + 1 --> Son Id +1 şimdiki ürünün Id'si
  
  -- aşağıdaki sorgu satılmış ürünler tablosuna kayıt girmek için.
  Insert into tblProductSales values(@MaxProductSalesId, @ProductId, @QuantityToSell)
    Commit Tran --> Transaction içindeki işlemleri onaylar.
   End
End

--@@Error kullanmak için düzenledik.
Alter Procedure spSellProduct
@ProductId int,
@QuantityToSell int
as
Begin
 Declare @StockAvailable int
 Select @StockAvailable = QtyAvailable 
 from tblProduct where ProductId = @ProductId
 
 if(@StockAvailable < @QuantityToSell)
   Begin
  Raiserror('Not enough stock available',16,1)
   End
 Else
   Begin
    Begin Tran
  Update tblProduct set QtyAvailable = (QtyAvailable - @QuantityToSell)
  where ProductId = @ProductId
  
  Declare @MaxProductSalesId int
  Select @MaxProductSalesId = Case When 
          MAX(ProductSalesId) IS NULL 
          Then 0 else MAX(ProductSalesId) end 
         from tblProductSales
		  
  --Set @MaxProductSalesId = @MaxProductSalesId + 1 --> Id değerini bir attırmadığımız için yeni kayıt eski kaydın üzerine yazılmaya çalışılacak. Bu durum hata verir. 
  Insert into tblProductSales values(@MaxProductSalesId, @ProductId, @QuantityToSell)
  if(@@ERROR <> 0) --> Programda hata olmuşsa, @@Error Function'ı 0 olmayan bir değer döner. Yani Sql Server'da C#'daki gibi uygulama hata olduğunda durmuyor.
  Begin
   Rollback Tran --> Bu durumda Transactiondaki işlemlerin hepsini geri alıp
   Print 'Rolled Back Transaction' --> mesaj veriyoruz.
  End
  Else
  Begin
   Commit Tran --> Hata yoksa gerçekleşen işlemleri onaylıyoruz.
   Print 'Committed Transaction' --> mesaj yazdırıyoruz.
  End
   End
End

--@@Error'un nasıl çalıştığı ile ilgili.
Insert into tblProduct values(2, 'Mobile Phone', 1500, 100)
if(@@ERROR <> 0)
 Print 'Error Occurred'
Else
 Print 'No Errors'

Insert into tblProduct values(2, 'Mobile Phone', 1500, 100)
Select * from tblProduct
if(@@ERROR <> 0)
 Print 'Error Occurred'
Else
 Print 'No Errors'

Declare @Error int
Insert into tblProduct values(2, 'Mobile Phone', 1500, 100)
Set @Error = @@ERROR
Select * from tblProduct
if(@Error <> 0)
 Print 'Error Occurred'
Else
 Print 'No Errors'

 ------------------------------------------------------
 Create Table tblProduct
(
 ProductId int NOT NULL primary key,
 Name nvarchar(50),
 UnitPrice int,
 QtyAvailable int
)

Insert into tblProduct values(1, 'Laptops', 2340, 100)
Insert into tblProduct values(2, 'Desktops', 3467, 50)

Create Table tblProductSales
(
 ProductSalesId int primary key,
 ProductId int,
 QuantitySold int
) 
