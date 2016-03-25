Bu derste 
/*1. DateTime data types 
2. Geçerli system zamanını veren DateTime functions
3. UTC time and Time Zone offset -> dünyanın ortak saati gibi bişe GTM diye bişey de varmış çoğu zaman aynı anlama gerliyormuş.

SqlServer da bir kaç tane hazır DateTime Function var. Açağıdaki methodları kullanarak geçerli system zamanına ulaşabiliriz.
Function			|Date Time Format						|Description
GETDATE()			|2012-08-31 20:15:04.543				|Çoğunlukla kullanılan method
CURRENT_TIMESTAMP	|2012-08-31 20:15:04.543				|ANSI SQL equivalent to GETDATE
SYSDATETIME()		|2012-08-31 20:15:04.5380028			|More fractional seconds precision
SYSDATETIMEOFFSET()	|2012-08-31 20:15:04.5380028 + 01:00	|More fractional seconds precision + Time zone offset
GETUTCDATE()		|2012-08-31 19:15:04.543				|UTC Date and Time
SYSUTCDATETIME()	|2012-08-31 19:15:04.5380028			|UTC Date and Time, with More fractional seconds precision

--Tablonun tüm sütunları faklı tarih türü kullanıyor.
CREATE TABLE [tblDateTime]
(
 [c_time] [time](7) NULL,
 [c_date] [date] NULL,
 [c_smalldatetime] [smalldatetime] NULL,
 [c_datetime] [datetime] NULL,
 [c_datetime2] [datetime2](7) NULL,
 [c_datetimeoffset] [datetimeoffset](7) NULL
)
-- tüm sütunlara GetData() method'unu veriyoruz. Ve sütunlar sadece tutabileceği değerleri gösteriyor. GetDate'in vermediği bir değer varsa, 000.. olarak ekleniyor.
To Insert some sample data, execute the following query. 
INSERT IntO tblDateTime VALUES (GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE(),GETDATE())

Now, issue a select statement, and you should see, the different types of datetime datatypes, storing the current datetime, in different formats.
*/