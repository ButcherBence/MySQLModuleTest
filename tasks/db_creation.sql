/*
Adatbázis létrehozása feladat

Készíts adatbázis-táblákat a feladat leírása alapján!
(Magát az adatbázist nem kell létrehoznod.)

Amit be kell adnod:
    - a táblák létrehozásának MySQL utasítása
    - a táblák mezőinek létrehozásához és beállításához szükséges MySQL utasítások

Az utasításokat jelen fájl tartalmazza!

A bónusz feladat megoldása nem kötelező.

Nem futtatható (azaz szintaktikai hibás) SQL utasításokért nem jár pont.
A feladatot részben teljesítő megoldásokért részpontszám jár.
A bónusz feladatnál csak a teljesen helyes megoldásért jár pont.

A feladat leírása törölhető.

Jó munkát!
*/

/*
Adatbázis-táblák létrehozása (20 pont)

Az általad létrehozott adatbázist egy üzenetküldő alkalmazáshoz szeretnénk használni.
Az alkalmazásban a felhasználók regisztrálás után tudnak üzenetet küldeni szintén regisztrált felhasználóknak,
valamint a kapott üzenetekre válaszolhatnak.
Nincs lehetőség több címzett megadására - azaz egy üzenetet csak egy felhasználó részére lehet küldeni.

Az adatbázisnak képesnek kell lennie a következő adatok tárolására:
    1. regisztrált felhasználók adatai
        - kötelező adatok: név, email-cím, jelszó, aktív felhasználó-e, a regisztrálás időpontja

        CREATE TABLE `app`.`userdatas`
        (`ID` INT NOT NULL AUTO_INCREMENT , `Name` VARCHAR(100) NOT NULL , `E-mail` VARCHAR(200) NOT NULL , `Password` VARCHAR(50) NOT NULL ,
         `Activeuser` BOOLEAN NOT NULL ,
         `Registerdate` DATE NOT NULL , PRIMARY KEY (`ID`)) ENGINE = InnoDB;

    2. a regisztrált felhasználók által egymásnak küldött üzenetek adatai
        - kötelező adatok: küldő, címzett, üzenet szövege, az üzenet küldésének időpontja,
          továbbá ha az üzenet egy korábban kapottra válasz, akkor hivatkozás a megválaszolt üzenetre

          CREATE TABLE `app`.`messagedata` (`ID` INT NOT NULL AUTO_INCREMENT , `SenderId` INT NOT NULL , `AddresseeID` INT NOT NULL , `Text` TEXT NOT NULL ,
          `TextDate` DATE NOT NULL , `ReceivedMessageID` INT NULL , PRIMARY KEY (`ID`),
          FOREIGN KEY(`SenderId`) REFERENCES `userdatas`(`ID`), FOREIGN KEY(`AddresseeID`) REFERENCES `userdatas`(`ID`),
          FOREIGN KEY(`ReceivedMessageID`) REFERENCES `messagedata`(`ID`) )ENGINE = InnoDB;

Kritériumok az adatbázissal kapcsolatban:
    - legalább kettő, legfeljebb négy táblát tartalmazzon
    - legyen legalább egy kapcsolat a létrehozott táblák között (idegen kulccsal)
      (egy tábla saját magával is kapcsolódhat)
    - a fent leírt adatokon kívül más adatokat is tárolhat, de egy táblán legfeljebb 8 mező lehet
    - az adatbázis, a táblák és a mezők elnevezése rajtad áll, azonban használj angol megnevezéseket, méghozzá következetesen
      (ha az egyik táblában camel-case szerinti mező-neveket adtál, akkor a másik táblában is tégy úgy)

*/


-- ---------------------------------------------------------------------------------------------------------------------

/*
Bónusz feladat (5 pont)

Adj hozzá adatokat mindegyik táblához!
(Az adatoknak nem kell valósnak lenniük. Egy felhasználói email-cím lehet például: 'valami@valami.va')

INSERT INTO `userdatas`(`Name`, `E-mail`, `Password`, `Activeuser`, `Registerdate`) VALUES ('Kovács Norbert','kovacsnorbert@kitalacio.hu','Titkositott','1','2022-07-09');
INSERT INTO `userdatas`(`Name`, `E-mail`, `Password`, `Activeuser`, `Registerdate`) VALUES ('Horváth András','horvathandras@kitalacio.hu','Nemtudodmeg','0','2020-07-15');
INSERT INTO `userdatas`(`Name`, `E-mail`, `Password`, `Activeuser`, `Registerdate`) VALUES ('Németh Emese','nemethemese@kitalacio.hu','nemethemese123','0','2018-08-09');
INSERT INTO `messagedata`( `SenderId`, `AddresseeID`, `Text`, `TextDate`) VALUES ('3','2','Szia!','2020-07-15');
INSERT INTO `messagedata`(`SenderId`, `AddresseeID`, `Text`, `TextDate`, `ReceivedMessageID`) VALUES ('2','3','Szia Neked is!','2020-07-15','1');

*/
