/*ABS(), CEILING(), FLOOR(), POWER(), RAND(), SQUARE(), SQRT()
ABS() :		Verdiğimiz sayıyı pozitife çevirir.
CEILING(): 	Verdiğimiz ondalıklı sayıyı bir büyük sayıyı çevirir.
FLOOR(): 	Verdiğimiz ondalıklı sayıyı bir küçük sayıyı çevirir.
POWER(): 	2 parametre alır. 1. paremetre üssü alınacak sayıyı 2. parametre üs sayısını belirtir.
SQUARE():	Verdiğimiz sayının karesini döner.
SQRT():		Parametre olarak aldığı sayının kökünü döner.

RAND(): 	int parametre alır(Optional), float döner. Paramereyi kullanmadığımızda 0 ve 1 arasında rasgele numara verir.  Bir int değer verdiğimizde ise o değer için 0 ile 1 arasında rasgele belirlenir ve aynı değeri methodu her çalıştırdığımızda alırız. 1 ile 100 arasında rasgele bir değer almayı istiyorsak, methodu parametresiz kullanıp sonucu 100 ile çarpmamız gerekiyor. Virgulden sonrasını istemiyorsak, Floor() veya Ceiling() methodlarını kullanabiliriz.


*/
/*ROUND(): Parametre olarak aldığı sayıyı ya yuvarlar yada keser.
3 parametre alıyor ve 3. parametre optionel
1. parametre yuvarlanacak sayı(ondalıklı olacak)
2. int değer alıyor. Bu değer yuvarlama veya kesme işleminin yapılacağı karakterleri belirler ve ondalık noktasında göre çalışır. Yani pozitif değer verilirse, ondalık noktasından başlayarak sağa doğru 2. parametredeki sayı kadar 1. parametredeki sayıdan karakter alınır, negatif sayı verilirse, ondalık noktasından sola doğru 2. parametredeki sayı kadar 1. parametredeki sayıdan karakter alınır. Alınan değerlere ya yuvarlama yada kesme işlemi yapılır.
3. Bu parametre yuvarlama veya kesme işinden hangisinin yapılacağını belirler. İnt değer alır(0,1) 0 varsayılan değerdir ve yuvarlama yapılacağı anlamına gelir. 1. kesme yapılacağı anlamına gelir.

Not: yuvarlama veya kesme işlemi sadece 2. parametrede sayesinde alınan karaktere uygulanır. Sonrasına başka karakterler varsa 0 değerini alır.

*/
Select ABS(-101.5) 
Select CEILING(15.2) -- Returns 16
Select CEILING(-15.2) -- Returns -15
Select FLOOR(15.2) -- Returns 15
Select FLOOR(-15.2) -- Returns -16
Select POWER(2,3) -- Returns 8
Select RAND(1)

Select FLOOR(RAND() * 100)

Declare @Counter INT
Set @Counter = 1
While(@Counter <= 10)
Begin
 Print FLOOR(RAND() * 100)
 Set @Counter = @Counter + 1
End

Select SQUARE(9) -- Returns 81
Select SQRT(81) -- Returns 9
Select ROUND(850.556, 2) -- Returns 850.560
Select ROUND(850.556, 2, 1) -- Returns 850.550
Select ROUND(850.556, 1) -- Returns 850.600
Select ROUND(850.556, 1, 1) -- Returns 850.500
Select ROUND(850.556, -2) -- 900.000
Select ROUND(850.556, -1) -- 850.000