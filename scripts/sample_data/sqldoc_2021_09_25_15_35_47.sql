-- MySQL dump 10.13  Distrib 8.0.18, for macos10.14 (x86_64)
--
-- Host: 127.0.0.1    Database: sqldoc
-- ------------------------------------------------------
-- Server version	5.7.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_number` int(11) NOT NULL COMMENT 'Our assigned customer number',
  `customer_name` varchar(50) NOT NULL COMMENT 'Company or individual name',
  `contact_last_name` varchar(50) NOT NULL COMMENT 'Company contact''s last name',
  `contact_first_name` varchar(50) NOT NULL COMMENT 'Company contact''s first name',
  `email` varchar(254) DEFAULT NULL COMMENT 'Customer''s email if available.',
  `phone` varchar(50) NOT NULL COMMENT 'Company phone',
  `address_line_1` varchar(50) NOT NULL COMMENT 'First line of Company address',
  `address_line_2` varchar(50) NOT NULL DEFAULT '' COMMENT 'Second line of Company address',
  `city` varchar(50) NOT NULL DEFAULT '' COMMENT 'Company city',
  `state` varchar(50) NOT NULL DEFAULT '' COMMENT 'Company state',
  `postal_code` varchar(15) NOT NULL DEFAULT '' COMMENT 'Company zip or postal code',
  `country` varchar(50) NOT NULL DEFAULT '' COMMENT 'Company country',
  `sales_rep_employee_number` int(11) NOT NULL DEFAULT '0' COMMENT 'Employee number of associated sales rep',
  `credit_limit` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT 'Amout of credit we are willing to extend to this customer',
  PRIMARY KEY (`customer_number`),
  UNIQUE KEY `customer_email_uindex` (`email`),
  KEY `customer_contact_last_name_contact_first_name_index` (`contact_last_name`,`contact_first_name`) COMMENT 'Speed up search by last name, first name',
  KEY `customer_sales_rep_employee_number_index` (`sales_rep_employee_number`),
  CONSTRAINT `customer_employee_employee_number_fk` FOREIGN KEY (`sales_rep_employee_number`) REFERENCES `employee` (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Collection of existing customers';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (103,'Atelier graphique','Schmitt','Carine ',NULL,'40.32.2555','54, rue Royale','','Nantes','','44000','France',1370,21000.00);
INSERT INTO `customer` VALUES (112,'Signal Gift Stores','King','Jean',NULL,'7025551838','8489 Strong St.','','Las Vegas','NV','83030','USA',1166,71800.00);
INSERT INTO `customer` VALUES (114,'Australian Collectors, Co.','Ferguson','Peter',NULL,'03 9520 4555','636 St Kilda Road','Level 3','Melbourne','Victoria','3004','Australia',1611,117300.00);
INSERT INTO `customer` VALUES (119,'La Rochelle Gifts','Labrune','Janine ',NULL,'40.67.8555','67, rue des Cinquante Otages','','Nantes','','44000','France',1370,118200.00);
INSERT INTO `customer` VALUES (121,'Baane Mini Imports','Bergulfsen','Jonas ',NULL,'07-98 9555','Erling Skakkes gate 78','','Stavern','','4110','Norway',1504,81700.00);
INSERT INTO `customer` VALUES (124,'Mini Gifts Distributors Ltd.','Nelson','Susan',NULL,'4155551450','5677 Strong St.','','San Rafael','CA','97562','USA',1165,210500.00);
INSERT INTO `customer` VALUES (125,'Havel & Zbyszek Co','Piestrzeniewicz','Zbyszek ',NULL,'(26) 642-7555','ul. Filtrowa 68','','Warszawa','','01-012','Poland',0,0.00);
INSERT INTO `customer` VALUES (128,'Blauer See Auto, Co.','Keitel','Roland',NULL,'+49 69 66 90 2555','Lyonerstr. 34','','Frankfurt','','60528','Germany',1504,59700.00);
INSERT INTO `customer` VALUES (129,'Mini Wheels Co.','Murphy','Julie',NULL,'6505555787','5557 North Pendale Street','','San Francisco','CA','94217','USA',1165,64600.00);
INSERT INTO `customer` VALUES (131,'Land of Toys Inc.','Lee','Kwai',NULL,'2125557818','897 Long Airport Avenue','','NYC','NY','10022','USA',1323,114900.00);
INSERT INTO `customer` VALUES (141,'Euro+ Shopping Channel','Freyre','Diego ',NULL,'(91) 555 94 44','C/ Moralzarzal, 86','','Madrid','','28034','Spain',1370,227600.00);
INSERT INTO `customer` VALUES (144,'Volvo Model Replicas, Co','Berglund','Christina ',NULL,'0921-12 3555','Berguvsvägen  8','','Luleå','','S-958 22','Sweden',1504,53100.00);
INSERT INTO `customer` VALUES (145,'Danish Wholesale Imports','Petersen','Jytte ',NULL,'31 12 3555','Vinbæltet 34','','Kobenhavn','','1734','Denmark',1401,83400.00);
INSERT INTO `customer` VALUES (146,'Saveley & Henriot, Co.','Saveley','Mary ',NULL,'78.32.5555','2, rue du Commerce','','Lyon','','69004','France',1337,123900.00);
INSERT INTO `customer` VALUES (148,'Dragon Souveniers, Ltd.','Natividad','Eric',NULL,'+65 221 7555','Bronz Sok.','Bronz Apt. 3/6 Tesvikiye','Singapore','0','079903','Singapore',1621,103800.00);
INSERT INTO `customer` VALUES (151,'Muscle Machine Inc','Young','Jeff',NULL,'2125557413','4092 Furth Circle','Suite 400','NYC','NY','10022','USA',1286,138500.00);
INSERT INTO `customer` VALUES (157,'Diecast Classics Inc.','Leong','Kelvin',NULL,'2155551555','7586 Pompton St.','','Allentown','PA','70267','USA',1216,100600.00);
INSERT INTO `customer` VALUES (161,'Technics Stores Inc.','Hashimoto','Juri',NULL,'6505556809','9408 Furth Circle','','Burlingame','CA','94217','USA',1165,84600.00);
INSERT INTO `customer` VALUES (166,'Handji Gifts& Co','Victorino','Wendy',NULL,'+65 224 1555','106 Linden Road Sandown','2nd Floor','Singapore','0','069045','Singapore',1612,97900.00);
INSERT INTO `customer` VALUES (167,'Herkku Gifts','Oeztan','Veysel',NULL,'+47 2267 3215','Brehmen St. 121','PR 334 Sentrum','Bergen','0','N 5804','Norway  ',1504,96800.00);
INSERT INTO `customer` VALUES (168,'American Souvenirs Inc','Franco','Keith',NULL,'2035557845','149 Spinnaker Dr.','Suite 101','New Haven','CT','97823','USA',1286,0.00);
INSERT INTO `customer` VALUES (169,'Porto Imports Co.','de Castro','Isabel ',NULL,'(1) 356-5555','Estrada da saúde n. 58','','Lisboa','','1756','Portugal',0,0.00);
INSERT INTO `customer` VALUES (171,'Daedalus Designs Imports','Rancé','Martine ',NULL,'20.16.1555','184, chaussée de Tournai','','Lille','','59000','France',1370,82900.00);
INSERT INTO `customer` VALUES (172,'La Corne D\'abondance, Co.','Bertrand','Marie',NULL,'(1) 42.34.2555','265, boulevard Charonne','','Paris','','75012','France',1337,84300.00);
INSERT INTO `customer` VALUES (173,'Cambridge Collectables Co.','Tseng','Jerry',NULL,'6175555555','4658 Baden Av.','','Cambridge','MA','51247','USA',1188,43400.00);
INSERT INTO `customer` VALUES (175,'Gift Depot Inc.','King','Julie',NULL,'2035552570','25593 South Bay Ln.','','Bridgewater','CT','97562','USA',1323,84300.00);
INSERT INTO `customer` VALUES (177,'Osaka Souveniers Co.','Kentary','Mory',NULL,'+81 06 6342 5555','1-6-20 Dojima','','Kita-ku','Osaka',' 530-0003','Japan',1621,81200.00);
INSERT INTO `customer` VALUES (181,'Vitachrome Inc.','Frick','Michael',NULL,'2125551500','2678 Kingston Rd.','Suite 101','NYC','NY','10022','USA',1286,76400.00);
INSERT INTO `customer` VALUES (186,'Toys of Finland, Co.','Karttunen','Matti',NULL,'90-224 8555','Keskuskatu 45','','Helsinki','','21240','Finland',1501,96500.00);
INSERT INTO `customer` VALUES (187,'AV Stores, Co.','Ashworth','Rachel',NULL,'(171) 555-1555','Fauntleroy Circus','','Manchester','','EC2 5NT','UK',1501,136800.00);
INSERT INTO `customer` VALUES (189,'Clover Collections, Co.','Cassidy','Dean',NULL,'+353 1862 1555','25 Maiden Lane','Floor No. 4','Dublin','','2','Ireland',1504,69400.00);
INSERT INTO `customer` VALUES (198,'Auto-Moto Classics Inc.','Taylor','Leslie',NULL,'6175558428','16780 Pompton St.','','Brickhaven','MA','58339','USA',1216,23000.00);
INSERT INTO `customer` VALUES (201,'UK Collectables, Ltd.','Devon','Elizabeth',NULL,'(171) 555-2282','12, Berkeley Gardens Blvd','','Liverpool','','WX1 6LT','UK',1501,92700.00);
INSERT INTO `customer` VALUES (202,'Canadian Gift Exchange Network','Tamuri','Yoshi ',NULL,'(604) 555-3392','1900 Oak St.','','Vancouver','BC','V3F 2K1','Canada',1323,90300.00);
INSERT INTO `customer` VALUES (204,'Online Mini Collectables','Barajas','Miguel',NULL,'6175557555','7635 Spinnaker Dr.','','Brickhaven','MA','58339','USA',1188,68700.00);
INSERT INTO `customer` VALUES (205,'Toys4GrownUps.com','Young','Julie',NULL,'6265557265','78934 Hillside Dr.','','Pasadena','CA','90003','USA',1166,90700.00);
INSERT INTO `customer` VALUES (206,'Asian Shopping Network, Co','Walker','Brydey',NULL,'+612 9411 1555','Suntec Tower Three','8 Temasek','Singapore','','038988','Singapore',0,0.00);
INSERT INTO `customer` VALUES (209,'Mini Caravy','Citeaux','Frédérique ',NULL,'88.60.1555','24, place Kléber','','Strasbourg','','67000','France',1370,53800.00);
INSERT INTO `customer` VALUES (211,'King Kong Collectables, Co.','Gao','Mike',NULL,'+852 2251 1555','Bank of China Tower','1 Garden Road','Central Hong Kong','','','Hong Kong',1621,58600.00);
INSERT INTO `customer` VALUES (216,'Enaco Distributors','Saavedra','Eduardo ',NULL,'(93) 203 4555','Rambla de Cataluña, 23','','Barcelona','','08022','Spain',1702,60300.00);
INSERT INTO `customer` VALUES (219,'Boards & Toys Co.','Young','Mary',NULL,'3105552373','4097 Douglas Av.','','Glendale','CA','92561','USA',1166,11000.00);
INSERT INTO `customer` VALUES (223,'Natürlich Autos','Kloss','Horst ',NULL,'0372-555188','Taucherstraße 10','','Cunewalde','','01307','Germany',0,0.00);
INSERT INTO `customer` VALUES (227,'Heintze Collectables','Ibsen','Palle',NULL,'86 21 3555','Smagsloget 45','','Århus','','8200','Denmark',1401,120800.00);
INSERT INTO `customer` VALUES (233,'Québec Home Shopping Network','Fresnière','Jean ',NULL,'(514) 555-8054','43 rue St. Laurent','','Montréal','Québec','H1J 1C3','Canada',1286,48700.00);
INSERT INTO `customer` VALUES (237,'ANG Resellers','Camino','Alejandra ',NULL,'(91) 745 6555','Gran Vía, 1','','Madrid','','28001','Spain',0,0.00);
INSERT INTO `customer` VALUES (239,'Collectable Mini Designs Co.','Thompson','Valarie',NULL,'7605558146','361 Furth Circle','','San Diego','CA','91217','USA',1166,105000.00);
INSERT INTO `customer` VALUES (240,'giftsbymail.co.uk','Bennett','Helen ',NULL,'(198) 555-8888','Garden House','Crowther Way 23','Cowes','Isle of Wight','PO31 7PJ','UK',1501,93900.00);
INSERT INTO `customer` VALUES (242,'Alpha Cognac','Roulet','Annette ',NULL,'61.77.6555','1 rue Alsace-Lorraine','','Toulouse','','31000','France',1370,61100.00);
INSERT INTO `customer` VALUES (247,'Messner Shopping Network','Messner','Renate ',NULL,'069-0555984','Magazinweg 7','','Frankfurt','','60528','Germany',0,0.00);
INSERT INTO `customer` VALUES (249,'Amica Models & Co.','Accorti','Paolo ',NULL,'011-4988555','Via Monte Bianco 34','','Torino','','10100','Italy',1401,113000.00);
INSERT INTO `customer` VALUES (250,'Lyon Souveniers','Da Silva','Daniel',NULL,'+33 1 46 62 7555','27 rue du Colonel Pierre Avia','','Paris','','75508','France',1337,68100.00);
INSERT INTO `customer` VALUES (256,'Auto Associés & Cie.','Tonini','Daniel ',NULL,'30.59.8555','67, avenue de l\'Europe','','Versailles','','78000','France',1370,77900.00);
INSERT INTO `customer` VALUES (259,'Toms Spezialitäten, Ltd','Pfalzheim','Henriette ',NULL,'0221-5554327','Mehrheimerstr. 369','','Köln','','50739','Germany',1504,120400.00);
INSERT INTO `customer` VALUES (260,'Royal Canadian Collectables, Ltd.','Lincoln','Elizabeth ',NULL,'(604) 555-4555','23 Tsawassen Blvd.','','Tsawassen','BC','T2F 8M4','Canada',1323,89600.00);
INSERT INTO `customer` VALUES (273,'Franken Gifts, Co','Franken','Peter ',NULL,'089-0877555','Berliner Platz 43','','München','','80805','Germany',0,0.00);
INSERT INTO `customer` VALUES (276,'Anna\'s Decorations, Ltd','O\'Hara','Anna',NULL,'02 9936 8555','201 Miller Street','Level 15','North Sydney','NSW','2060','Australia',1611,107800.00);
INSERT INTO `customer` VALUES (278,'Rovelli Gifts','Rovelli','Giovanni ',NULL,'035-640555','Via Ludovico il Moro 22','','Bergamo','','24100','Italy',1401,119600.00);
INSERT INTO `customer` VALUES (282,'Souveniers And Things Co.','Huxley','Adrian',NULL,'+61 2 9495 8555','Monitor Money Building','815 Pacific Hwy','Chatswood','NSW','2067','Australia',1611,93300.00);
INSERT INTO `customer` VALUES (286,'Marta\'s Replicas Co.','Hernandez','Marta',NULL,'6175558555','39323 Spinnaker Dr.','','Cambridge','MA','51247','USA',1216,123700.00);
INSERT INTO `customer` VALUES (293,'BG&E Collectables','Harrison','Ed',NULL,'+41 26 425 50 01','Rte des Arsenaux 41 ','','Fribourg','','1700','Switzerland',0,0.00);
INSERT INTO `customer` VALUES (298,'Vida Sport, Ltd','Holz','Mihael',NULL,'0897-034555','Grenzacherweg 237','','Genève','','1203','Switzerland',1702,141300.00);
INSERT INTO `customer` VALUES (299,'Norway Gifts By Mail, Co.','Klaeboe','Jan',NULL,'+47 2212 1555','Drammensveien 126A','PB 211 Sentrum','Oslo','','N 0106','Norway  ',1504,95100.00);
INSERT INTO `customer` VALUES (303,'Schuyler Imports','Schuyler','Bradley',NULL,'+31 20 491 9555','Kingsfordweg 151','','Amsterdam','','1043 GR','Netherlands',0,0.00);
INSERT INTO `customer` VALUES (307,'Der Hund Imports','Andersen','Mel',NULL,'030-0074555','Obere Str. 57','','Berlin','','12209','Germany',0,0.00);
INSERT INTO `customer` VALUES (311,'Oulu Toy Supplies, Inc.','Koskitalo','Pirkko',NULL,'981-443655','Torikatu 38','','Oulu','','90110','Finland',1501,90500.00);
INSERT INTO `customer` VALUES (314,'Petit Auto','Dewey','Catherine ',NULL,'(02) 5554 67','Rue Joseph-Bens 532','','Bruxelles','','B-1180','Belgium',1401,79900.00);
INSERT INTO `customer` VALUES (319,'Mini Classics','Frick','Steve',NULL,'9145554562','3758 North Pendale Street','','White Plains','NY','24067','USA',1323,102700.00);
INSERT INTO `customer` VALUES (320,'Mini Creations Ltd.','Huang','Wing',NULL,'5085559555','4575 Hillside Dr.','','New Bedford','MA','50553','USA',1188,94500.00);
INSERT INTO `customer` VALUES (321,'Corporate Gift Ideas Co.','Brown','Julie',NULL,'6505551386','7734 Strong St.','','San Francisco','CA','94217','USA',1165,105000.00);
INSERT INTO `customer` VALUES (323,'Down Under Souveniers, Inc','Graham','Mike',NULL,'+64 9 312 5555','162-164 Grafton Road','Level 2','Auckland  ','','','New Zealand',1612,88000.00);
INSERT INTO `customer` VALUES (324,'Stylish Desk Decors, Co.','Brown','Ann ',NULL,'(171) 555-0297','35 King George','','London','','WX3 6FW','UK',1501,77000.00);
INSERT INTO `customer` VALUES (328,'Tekni Collectables Inc.','Brown','William',NULL,'2015559350','7476 Moss Rd.','','Newark','NJ','94019','USA',1323,43000.00);
INSERT INTO `customer` VALUES (333,'Australian Gift Network, Co','Calaghan','Ben',NULL,'61-7-3844-6555','31 Duncan St. West End','','South Brisbane','Queensland','4101','Australia',1611,51600.00);
INSERT INTO `customer` VALUES (334,'Suominen Souveniers','Suominen','Kalle',NULL,'+358 9 8045 555','Software Engineering Center','SEC Oy','Espoo','','FIN-02271','Finland',1501,98800.00);
INSERT INTO `customer` VALUES (335,'Cramer Spezialitäten, Ltd','Cramer','Philip ',NULL,'0555-09555','Maubelstr. 90','','Brandenburg','','14776','Germany',0,0.00);
INSERT INTO `customer` VALUES (339,'Classic Gift Ideas, Inc','Cervantes','Francisca',NULL,'2155554695','782 First Street','','Philadelphia','PA','71270','USA',1188,81100.00);
INSERT INTO `customer` VALUES (344,'CAF Imports','Fernandez','Jesus',NULL,'+34 913 728 555','Merchants House','27-30 Merchant\'s Quay','Madrid','','28023','Spain',1702,59600.00);
INSERT INTO `customer` VALUES (347,'Men \'R\' US Retailers, Ltd.','Chandler','Brian',NULL,'2155554369','6047 Douglas Av.','','Los Angeles','CA','91003','USA',1166,57700.00);
INSERT INTO `customer` VALUES (348,'Asian Treasures, Inc.','McKenna','Patricia ',NULL,'2967 555','8 Johnstown Road','','Cork','Co. Cork','','Ireland',0,0.00);
INSERT INTO `customer` VALUES (350,'Marseille Mini Autos','Lebihan','Laurence ',NULL,'91.24.4555','12, rue des Bouchers','','Marseille','','13008','France',1337,65000.00);
INSERT INTO `customer` VALUES (353,'Reims Collectables','Henriot','Paul ',NULL,'26.47.1555','59 rue de l\'Abbaye','','Reims','','51100','France',1337,81100.00);
INSERT INTO `customer` VALUES (356,'SAR Distributors, Co','Kuger','Armand',NULL,'+27 21 550 3555','1250 Pretorius Street','','Hatfield','Pretoria','0028','South Africa',0,0.00);
INSERT INTO `customer` VALUES (357,'GiftsForHim.com','MacKinlay','Wales',NULL,'64-9-3763555','199 Great North Road','','Auckland','','','New Zealand',1612,77700.00);
INSERT INTO `customer` VALUES (361,'Kommission Auto','Josephs','Karin',NULL,'0251-555259','Luisenstr. 48','','Münster','','44087','Germany',0,0.00);
INSERT INTO `customer` VALUES (362,'Gifts4AllAges.com','Yoshido','Juri',NULL,'6175559555','8616 Spinnaker Dr.','','Boston','MA','51003','USA',1216,41900.00);
INSERT INTO `customer` VALUES (363,'Online Diecast Creations Co.','Young','Dorothy',NULL,'6035558647','2304 Long Airport Avenue','','Nashua','NH','62005','USA',1216,114200.00);
INSERT INTO `customer` VALUES (369,'Lisboa Souveniers, Inc','Rodriguez','Lino ',NULL,'(1) 354-2555','Jardim das rosas n. 32','','Lisboa','','1675','Portugal',0,0.00);
INSERT INTO `customer` VALUES (376,'Precious Collectables','Urs','Braun',NULL,'0452-076555','Hauptstr. 29','','Bern','','3012','Switzerland',1702,0.00);
INSERT INTO `customer` VALUES (379,'Collectables For Less Inc.','Nelson','Allen',NULL,'6175558555','7825 Douglas Av.','','Brickhaven','MA','58339','USA',1188,70700.00);
INSERT INTO `customer` VALUES (381,'Royale Belge','Cartrain','Pascale ',NULL,'(071) 23 67 2555','Boulevard Tirou, 255','','Charleroi','','B-6000','Belgium',1401,23500.00);
INSERT INTO `customer` VALUES (382,'Salzburg Collectables','Pipps','Georg ',NULL,'6562-9555','Geislweg 14','','Salzburg','','5020','Austria',1401,71700.00);
INSERT INTO `customer` VALUES (385,'Cruz & Sons Co.','Cruz','Arnold',NULL,'+63 2 555 3587','15 McCallum Street','NatWest Center #13-03','Makati City','','1227 MM','Philippines',1621,81500.00);
INSERT INTO `customer` VALUES (386,'L\'ordine Souveniers','Moroni','Maurizio ',NULL,'0522-556555','Strada Provinciale 124','','Reggio Emilia','','42100','Italy',1401,121400.00);
INSERT INTO `customer` VALUES (398,'Tokyo Collectables, Ltd','Shimamura','Akiko',NULL,'+81 3 3584 0555','2-2-8 Roppongi','','Minato-ku','Tokyo','106-0032','Japan',1621,94400.00);
INSERT INTO `customer` VALUES (406,'Auto Canal+ Petit','Perrier','Dominique',NULL,'(1) 47.55.6555','25, rue Lauriston','','Paris','','75016','France',1337,95000.00);
INSERT INTO `customer` VALUES (409,'Stuttgart Collectable Exchange','Müller','Rita ',NULL,'0711-555361','Adenauerallee 900','','Stuttgart','','70563','Germany',0,0.00);
INSERT INTO `customer` VALUES (412,'Extreme Desk Decorations, Ltd','McRoy','Sarah',NULL,'04 499 9555','101 Lambton Quay','Level 11','Wellington','','','New Zealand',1612,86800.00);
INSERT INTO `customer` VALUES (415,'Bavarian Collectables Imports, Co.','Donnermeyer','Michael',NULL,' +49 89 61 08 9555','Hansastr. 15','','Munich','','80686','Germany',1504,77000.00);
INSERT INTO `customer` VALUES (424,'Classic Legends Inc.','Hernandez','Maria',NULL,'2125558493','5905 Pompton St.','Suite 750','NYC','NY','10022','USA',1286,67500.00);
INSERT INTO `customer` VALUES (443,'Feuer Online Stores, Inc','Feuer','Alexander ',NULL,'0342-555176','Heerstr. 22','','Leipzig','','04179','Germany',0,0.00);
INSERT INTO `customer` VALUES (447,'Gift Ideas Corp.','Lewis','Dan',NULL,'2035554407','2440 Pompton St.','','Glendale','CT','97561','USA',1323,49700.00);
INSERT INTO `customer` VALUES (448,'Scandinavian Gift Ideas','Larsson','Martha',NULL,'0695-34 6555','Åkergatan 24','','Bräcke','','S-844 67','Sweden',1504,116400.00);
INSERT INTO `customer` VALUES (450,'The Sharp Gifts Warehouse','Frick','Sue',NULL,'4085553659','3086 Ingle Ln.','','San Jose','CA','94217','USA',1165,77600.00);
INSERT INTO `customer` VALUES (452,'Mini Auto Werke','Mendel','Roland ',NULL,'7675-3555','Kirchgasse 6','','Graz','','8010','Austria',1401,45300.00);
INSERT INTO `customer` VALUES (455,'Super Scale Inc.','Murphy','Leslie',NULL,'2035559545','567 North Pendale Street','','New Haven','CT','97823','USA',1286,95400.00);
INSERT INTO `customer` VALUES (456,'Microscale Inc.','Choi','Yu',NULL,'2125551957','5290 North Pendale Street','Suite 200','NYC','NY','10022','USA',1286,39800.00);
INSERT INTO `customer` VALUES (458,'Corrida Auto Replicas, Ltd','Sommer','Martín ',NULL,'(91) 555 22 82','C/ Araquil, 67','','Madrid','','28023','Spain',1702,104600.00);
INSERT INTO `customer` VALUES (459,'Warburg Exchange','Ottlieb','Sven ',NULL,'0241-039123','Walserweg 21','','Aachen','','52066','Germany',0,0.00);
INSERT INTO `customer` VALUES (462,'FunGiftIdeas.com','Benitez','Violeta',NULL,'5085552555','1785 First Street','','New Bedford','MA','50553','USA',1216,85800.00);
INSERT INTO `customer` VALUES (465,'Anton Designs, Ltd.','Anton','Carmen',NULL,'+34 913 728555','c/ Gobelas, 19-1 Urb. La Florida','','Madrid','','28023','Spain',0,0.00);
INSERT INTO `customer` VALUES (471,'Australian Collectables, Ltd','Clenahan','Sean',NULL,'61-9-3844-6555','7 Allen Street','','Glen Waverly','Victoria','3150','Australia',1611,60300.00);
INSERT INTO `customer` VALUES (473,'Frau da Collezione','Ricotti','Franco',NULL,'+39 022515555','20093 Cologno Monzese','Alessandro Volta 16','Milan','','','Italy',1401,34800.00);
INSERT INTO `customer` VALUES (475,'West Coast Collectables Co.','Thompson','Steve',NULL,'3105553722','3675 Furth Circle','','Burbank','CA','94019','USA',1166,55400.00);
INSERT INTO `customer` VALUES (477,'Mit Vergnügen & Co.','Moos','Hanna ',NULL,'0621-08555','Forsterstr. 57','','Mannheim','','68306','Germany',0,0.00);
INSERT INTO `customer` VALUES (480,'Kremlin Collectables, Co.','Semenov','Alexander ',NULL,'+7 812 293 0521','2 Pobedy Square','','Saint Petersburg','','196143','Russia',0,0.00);
INSERT INTO `customer` VALUES (481,'Raanan Stores, Inc','Altagar,G M','Raanan',NULL,'+ 972 9 959 8555','3 Hagalim Blv.','','Herzlia','','47625','Israel',0,0.00);
INSERT INTO `customer` VALUES (484,'Iberia Gift Imports, Corp.','Roel','José Pedro ',NULL,'(95) 555 82 82','C/ Romero, 33','','Sevilla','','41101','Spain',1702,65700.00);
INSERT INTO `customer` VALUES (486,'Motor Mint Distributors Inc.','Salazar','Rosa',NULL,'2155559857','11328 Douglas Av.','','Philadelphia','PA','71270','USA',1323,72600.00);
INSERT INTO `customer` VALUES (487,'Signal Collectibles Ltd.','Taylor','Sue',NULL,'4155554312','2793 Furth Circle','','Brisbane','CA','94217','USA',1165,60300.00);
INSERT INTO `customer` VALUES (489,'Double Decker Gift Stores, Ltd','Smith','Thomas ',NULL,'(171) 555-7555','120 Hanover Sq.','','London','','WA1 1DP','UK',1501,43300.00);
INSERT INTO `customer` VALUES (495,'Diecast Collectables','Franco','Valarie',NULL,'6175552555','6251 Ingle Ln.','','Boston','MA','51003','USA',1188,85100.00);
INSERT INTO `customer` VALUES (496,'Kelly\'s Gift Shop','Snowden','Tony',NULL,'+64 9 5555500','Arenales 1938 3\'A\'','','Auckland  ','','','New Zealand',1612,110000.00);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;

--
-- Table structure for table `customer_extension`
--

DROP TABLE IF EXISTS `customer_extension`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer_extension` (
  `customer_number` int(11) NOT NULL,
  `favorite_pet` varchar(50) NOT NULL DEFAULT '',
  `favorite_color` varchar(50) NOT NULL DEFAULT '',
  `favorite_movie` varchar(200) NOT NULL DEFAULT '',
  PRIMARY KEY (`customer_number`),
  CONSTRAINT `customer_extension_customer_customer_number_fk` FOREIGN KEY (`customer_number`) REFERENCES `customer` (`customer_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='example of a 1 to 1 relationship';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_extension`
--

/*!40000 ALTER TABLE `customer_extension` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_extension` ENABLE KEYS */;

--
-- Temporary view structure for view `customer_payments`
--

DROP TABLE IF EXISTS `customer_payments`;
/*!50001 DROP VIEW IF EXISTS `customer_payments`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `customer_payments` AS SELECT 
 1 AS `customer_name`,
 1 AS `check_number`,
 1 AS `payment_date`,
 1 AS `amount`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_number` int(11) NOT NULL,
  `last_name` varchar(50) NOT NULL DEFAULT '',
  `first_name` varchar(50) NOT NULL DEFAULT '',
  `extension` varchar(10) NOT NULL DEFAULT '',
  `email` varchar(254) NOT NULL DEFAULT '',
  `reports_to` int(11) NOT NULL DEFAULT '0',
  `job_title` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`employee_number`),
  KEY `employee_last_name_first_name_email_index` (`last_name`,`first_name`,`email`) COMMENT 'Fast search on last name, first name, email',
  KEY `employee_reports_to_index` (`reports_to`),
  CONSTRAINT `employee_employee_employee_number_fk` FOREIGN KEY (`reports_to`) REFERENCES `employee` (`employee_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (0,'assigned','un','','',0,'unassigned');
INSERT INTO `employee` VALUES (1002,'Murphy','Diane','x5800','dmurphy@classicmodelcars.com',0,'President');
INSERT INTO `employee` VALUES (1056,'Patterson','Mary','x4611','mpatterso@classicmodelcars.com',1002,'VP Sales');
INSERT INTO `employee` VALUES (1076,'Firrelli','Jeff','x9273','jfirrelli@classicmodelcars.com',1002,'VP Marketing');
INSERT INTO `employee` VALUES (1088,'Patterson','William','x4871','wpatterson@classicmodelcars.com',1056,'Sales Manager (APAC)');
INSERT INTO `employee` VALUES (1102,'Bondur','Gerard','x5408','gbondur@classicmodelcars.com',1056,'Sales Manager (EMEA)');
INSERT INTO `employee` VALUES (1143,'Bow','Anthony','x5428','abow@classicmodelcars.com',1056,'Sales Manager (NA)');
INSERT INTO `employee` VALUES (1165,'Jennings','Leslie','x3291','ljennings@classicmodelcars.com',1143,'Sales Rep');
INSERT INTO `employee` VALUES (1166,'Thompson','Leslie','x4065','lthompson@classicmodelcars.com',1143,'Sales Rep');
INSERT INTO `employee` VALUES (1188,'Firrelli','Julie','x2173','jfirrelli@classicmodelcars.com',1143,'Sales Rep');
INSERT INTO `employee` VALUES (1216,'Patterson','Steve','x4334','spatterson@classicmodelcars.com',1143,'Sales Rep');
INSERT INTO `employee` VALUES (1286,'Tseng','Foon Yue','x2248','ftseng@classicmodelcars.com',1143,'Sales Rep');
INSERT INTO `employee` VALUES (1323,'Vanauf','George','x4102','gvanauf@classicmodelcars.com',1143,'Sales Rep');
INSERT INTO `employee` VALUES (1337,'Bondur','Loui','x6493','lbondur@classicmodelcars.com',1102,'Sales Rep');
INSERT INTO `employee` VALUES (1370,'Hernandez','Gerard','x2028','ghernande@classicmodelcars.com',1102,'Sales Rep');
INSERT INTO `employee` VALUES (1401,'Castillo','Pamela','x2759','pcastillo@classicmodelcars.com',1102,'Sales Rep');
INSERT INTO `employee` VALUES (1501,'Bott','Larry','x2311','lbott@classicmodelcars.com',1102,'Sales Rep');
INSERT INTO `employee` VALUES (1504,'Jones','Barry','x102','bjones@classicmodelcars.com',1102,'Sales Rep');
INSERT INTO `employee` VALUES (1611,'Fixter','Andy','x101','afixter@classicmodelcars.com',1088,'Sales Rep');
INSERT INTO `employee` VALUES (1612,'Marsh','Peter','x102','pmarsh@classicmodelcars.com',1088,'Sales Rep');
INSERT INTO `employee` VALUES (1619,'King','Tom','x103','tking@classicmodelcars.com',1088,'Sales Rep');
INSERT INTO `employee` VALUES (1621,'Nishi','Mami','x101','mnishi@classicmodelcars.com',1056,'Sales Rep');
INSERT INTO `employee` VALUES (1625,'Kato','Yoshimi','x102','ykato@classicmodelcars.com',1621,'Sales Rep');
INSERT INTO `employee` VALUES (1702,'Gerard','Martin','x2312','mgerard@classicmodelcars.com',1102,'Sales Rep');
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS employee_ins */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger employee_ins
    after insert
    on employee
    for each row
begin
    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)
    values (NEW.employee_number,
            null,
            json_object("last_name", NEW.last_name, "first_name", NEW.first_name, "extension", NEW.extension, "email",
                        NEW.email, "reports_to", NEW.reports_to, "job_title",
                        NEW.job_title),
            'INSERT');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS employee_upd */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger employee_upd
    after update
    on employee
    for each row
begin
    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)
    values (NEW.employee_number,
            json_object("last_name", OLD.last_name, "first_name", OLD.first_name, "extension", OLD.extension, "email",
                        OLD.email, "reports_to", OLD.reports_to, "job_title",
                        OLD.job_title),
            json_object("last_name", NEW.last_name, "first_name", NEW.first_name, "extension", NEW.extension, "email",
                        NEW.email, "reports_to", NEW.reports_to, "job_title",
                        NEW.job_title),
            'UPDATE');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS employee_del */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 trigger employee_del
    after delete
    on employee
    for each row
begin
    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)
    values (OLD.employee_number,
            json_object("last_name", OLD.last_name, "first_name", OLD.first_name, "extension", OLD.extension, "email",
                        OLD.email, "reports_to", OLD.reports_to, "job_title",
                        OLD.job_title),
            null,
            'DELETE');
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `employee_audit`
--

DROP TABLE IF EXISTS `employee_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_audit` (
  `employee_number` int(11) NOT NULL,
  `old_row_data` json DEFAULT NULL,
  `new_row_data` json DEFAULT NULL,
  `operation` enum('INSERT','UPDATE','DELETE') NOT NULL,
  `event_timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`employee_number`,`operation`,`event_timestamp`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_audit`
--

/*!40000 ALTER TABLE `employee_audit` DISABLE KEYS */;
INSERT INTO `employee_audit` VALUES (0,NULL,'{\"email\": \"\", \"extension\": \"\", \"job_title\": \"unassigned\", \"last_name\": \"assigned\", \"first_name\": \"un\", \"reports_to\": 0, \"office_code\": \"\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (0,NULL,'{\"email\": \"\", \"extension\": \"\", \"job_title\": \"unassigned\", \"last_name\": \"assigned\", \"first_name\": \"un\", \"reports_to\": 0, \"office_code\": \"\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1002,NULL,'{\"email\": \"dmurphy@classicmodelcars.com\", \"extension\": \"x5800\", \"job_title\": \"President\", \"last_name\": \"Murphy\", \"first_name\": \"Diane\", \"reports_to\": 0, \"office_code\": \"1\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1002,NULL,'{\"email\": \"dmurphy@classicmodelcars.com\", \"extension\": \"x5800\", \"job_title\": \"President\", \"last_name\": \"Murphy\", \"first_name\": \"Diane\", \"reports_to\": 0, \"office_code\": \"1\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1056,NULL,'{\"email\": \"mpatterso@classicmodelcars.com\", \"extension\": \"x4611\", \"job_title\": \"VP Sales\", \"last_name\": \"Patterson\", \"first_name\": \"Mary\", \"reports_to\": 1002, \"office_code\": \"1\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1056,NULL,'{\"email\": \"mpatterso@classicmodelcars.com\", \"extension\": \"x4611\", \"job_title\": \"VP Sales\", \"last_name\": \"Patterson\", \"first_name\": \"Mary\", \"reports_to\": 1002, \"office_code\": \"1\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1076,NULL,'{\"email\": \"jfirrelli@classicmodelcars.com\", \"extension\": \"x9273\", \"job_title\": \"VP Marketing\", \"last_name\": \"Firrelli\", \"first_name\": \"Jeff\", \"reports_to\": 1002, \"office_code\": \"1\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1076,NULL,'{\"email\": \"jfirrelli@classicmodelcars.com\", \"extension\": \"x9273\", \"job_title\": \"VP Marketing\", \"last_name\": \"Firrelli\", \"first_name\": \"Jeff\", \"reports_to\": 1002, \"office_code\": \"1\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1088,NULL,'{\"email\": \"wpatterson@classicmodelcars.com\", \"extension\": \"x4871\", \"job_title\": \"Sales Manager (APAC)\", \"last_name\": \"Patterson\", \"first_name\": \"William\", \"reports_to\": 1056, \"office_code\": \"6\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1088,NULL,'{\"email\": \"wpatterson@classicmodelcars.com\", \"extension\": \"x4871\", \"job_title\": \"Sales Manager (APAC)\", \"last_name\": \"Patterson\", \"first_name\": \"William\", \"reports_to\": 1056, \"office_code\": \"6\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1102,NULL,'{\"email\": \"gbondur@classicmodelcars.com\", \"extension\": \"x5408\", \"job_title\": \"Sales Manager (EMEA)\", \"last_name\": \"Bondur\", \"first_name\": \"Gerard\", \"reports_to\": 1056, \"office_code\": \"4\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1102,NULL,'{\"email\": \"gbondur@classicmodelcars.com\", \"extension\": \"x5408\", \"job_title\": \"Sales Manager (EMEA)\", \"last_name\": \"Bondur\", \"first_name\": \"Gerard\", \"reports_to\": 1056, \"office_code\": \"4\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1143,NULL,'{\"email\": \"abow@classicmodelcars.com\", \"extension\": \"x5428\", \"job_title\": \"Sales Manager (NA)\", \"last_name\": \"Bow\", \"first_name\": \"Anthony\", \"reports_to\": 1056, \"office_code\": \"1\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1143,NULL,'{\"email\": \"abow@classicmodelcars.com\", \"extension\": \"x5428\", \"job_title\": \"Sales Manager (NA)\", \"last_name\": \"Bow\", \"first_name\": \"Anthony\", \"reports_to\": 1056, \"office_code\": \"1\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1165,NULL,'{\"email\": \"ljennings@classicmodelcars.com\", \"extension\": \"x3291\", \"job_title\": \"Sales Rep\", \"last_name\": \"Jennings\", \"first_name\": \"Leslie\", \"reports_to\": 1143, \"office_code\": \"1\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1165,NULL,'{\"email\": \"ljennings@classicmodelcars.com\", \"extension\": \"x3291\", \"job_title\": \"Sales Rep\", \"last_name\": \"Jennings\", \"first_name\": \"Leslie\", \"reports_to\": 1143, \"office_code\": \"1\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1166,NULL,'{\"email\": \"lthompson@classicmodelcars.com\", \"extension\": \"x4065\", \"job_title\": \"Sales Rep\", \"last_name\": \"Thompson\", \"first_name\": \"Leslie\", \"reports_to\": 1143, \"office_code\": \"1\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1166,NULL,'{\"email\": \"lthompson@classicmodelcars.com\", \"extension\": \"x4065\", \"job_title\": \"Sales Rep\", \"last_name\": \"Thompson\", \"first_name\": \"Leslie\", \"reports_to\": 1143, \"office_code\": \"1\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1188,NULL,'{\"email\": \"jfirrelli@classicmodelcars.com\", \"extension\": \"x2173\", \"job_title\": \"Sales Rep\", \"last_name\": \"Firrelli\", \"first_name\": \"Julie\", \"reports_to\": 1143, \"office_code\": \"2\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1188,NULL,'{\"email\": \"jfirrelli@classicmodelcars.com\", \"extension\": \"x2173\", \"job_title\": \"Sales Rep\", \"last_name\": \"Firrelli\", \"first_name\": \"Julie\", \"reports_to\": 1143, \"office_code\": \"2\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1216,NULL,'{\"email\": \"spatterson@classicmodelcars.com\", \"extension\": \"x4334\", \"job_title\": \"Sales Rep\", \"last_name\": \"Patterson\", \"first_name\": \"Steve\", \"reports_to\": 1143, \"office_code\": \"2\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1216,NULL,'{\"email\": \"spatterson@classicmodelcars.com\", \"extension\": \"x4334\", \"job_title\": \"Sales Rep\", \"last_name\": \"Patterson\", \"first_name\": \"Steve\", \"reports_to\": 1143, \"office_code\": \"2\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1286,NULL,'{\"email\": \"ftseng@classicmodelcars.com\", \"extension\": \"x2248\", \"job_title\": \"Sales Rep\", \"last_name\": \"Tseng\", \"first_name\": \"Foon Yue\", \"reports_to\": 1143, \"office_code\": \"3\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1286,NULL,'{\"email\": \"ftseng@classicmodelcars.com\", \"extension\": \"x2248\", \"job_title\": \"Sales Rep\", \"last_name\": \"Tseng\", \"first_name\": \"Foon Yue\", \"reports_to\": 1143, \"office_code\": \"3\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1323,NULL,'{\"email\": \"gvanauf@classicmodelcars.com\", \"extension\": \"x4102\", \"job_title\": \"Sales Rep\", \"last_name\": \"Vanauf\", \"first_name\": \"George\", \"reports_to\": 1143, \"office_code\": \"3\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1323,NULL,'{\"email\": \"gvanauf@classicmodelcars.com\", \"extension\": \"x4102\", \"job_title\": \"Sales Rep\", \"last_name\": \"Vanauf\", \"first_name\": \"George\", \"reports_to\": 1143, \"office_code\": \"3\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1337,NULL,'{\"email\": \"lbondur@classicmodelcars.com\", \"extension\": \"x6493\", \"job_title\": \"Sales Rep\", \"last_name\": \"Bondur\", \"first_name\": \"Loui\", \"reports_to\": 1102, \"office_code\": \"4\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1337,NULL,'{\"email\": \"lbondur@classicmodelcars.com\", \"extension\": \"x6493\", \"job_title\": \"Sales Rep\", \"last_name\": \"Bondur\", \"first_name\": \"Loui\", \"reports_to\": 1102, \"office_code\": \"4\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1370,NULL,'{\"email\": \"ghernande@classicmodelcars.com\", \"extension\": \"x2028\", \"job_title\": \"Sales Rep\", \"last_name\": \"Hernandez\", \"first_name\": \"Gerard\", \"reports_to\": 1102, \"office_code\": \"4\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1370,NULL,'{\"email\": \"ghernande@classicmodelcars.com\", \"extension\": \"x2028\", \"job_title\": \"Sales Rep\", \"last_name\": \"Hernandez\", \"first_name\": \"Gerard\", \"reports_to\": 1102, \"office_code\": \"4\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1401,NULL,'{\"email\": \"pcastillo@classicmodelcars.com\", \"extension\": \"x2759\", \"job_title\": \"Sales Rep\", \"last_name\": \"Castillo\", \"first_name\": \"Pamela\", \"reports_to\": 1102, \"office_code\": \"4\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1401,NULL,'{\"email\": \"pcastillo@classicmodelcars.com\", \"extension\": \"x2759\", \"job_title\": \"Sales Rep\", \"last_name\": \"Castillo\", \"first_name\": \"Pamela\", \"reports_to\": 1102, \"office_code\": \"4\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1501,NULL,'{\"email\": \"lbott@classicmodelcars.com\", \"extension\": \"x2311\", \"job_title\": \"Sales Rep\", \"last_name\": \"Bott\", \"first_name\": \"Larry\", \"reports_to\": 1102, \"office_code\": \"7\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1501,NULL,'{\"email\": \"lbott@classicmodelcars.com\", \"extension\": \"x2311\", \"job_title\": \"Sales Rep\", \"last_name\": \"Bott\", \"first_name\": \"Larry\", \"reports_to\": 1102, \"office_code\": \"7\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1504,NULL,'{\"email\": \"bjones@classicmodelcars.com\", \"extension\": \"x102\", \"job_title\": \"Sales Rep\", \"last_name\": \"Jones\", \"first_name\": \"Barry\", \"reports_to\": 1102, \"office_code\": \"7\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1504,NULL,'{\"email\": \"bjones@classicmodelcars.com\", \"extension\": \"x102\", \"job_title\": \"Sales Rep\", \"last_name\": \"Jones\", \"first_name\": \"Barry\", \"reports_to\": 1102, \"office_code\": \"7\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1611,NULL,'{\"email\": \"afixter@classicmodelcars.com\", \"extension\": \"x101\", \"job_title\": \"Sales Rep\", \"last_name\": \"Fixter\", \"first_name\": \"Andy\", \"reports_to\": 1088, \"office_code\": \"6\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1611,NULL,'{\"email\": \"afixter@classicmodelcars.com\", \"extension\": \"x101\", \"job_title\": \"Sales Rep\", \"last_name\": \"Fixter\", \"first_name\": \"Andy\", \"reports_to\": 1088, \"office_code\": \"6\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1612,NULL,'{\"email\": \"pmarsh@classicmodelcars.com\", \"extension\": \"x102\", \"job_title\": \"Sales Rep\", \"last_name\": \"Marsh\", \"first_name\": \"Peter\", \"reports_to\": 1088, \"office_code\": \"6\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1612,NULL,'{\"email\": \"pmarsh@classicmodelcars.com\", \"extension\": \"x102\", \"job_title\": \"Sales Rep\", \"last_name\": \"Marsh\", \"first_name\": \"Peter\", \"reports_to\": 1088, \"office_code\": \"6\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1619,NULL,'{\"email\": \"tking@classicmodelcars.com\", \"extension\": \"x103\", \"job_title\": \"Sales Rep\", \"last_name\": \"King\", \"first_name\": \"Tom\", \"reports_to\": 1088, \"office_code\": \"6\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1619,NULL,'{\"email\": \"tking@classicmodelcars.com\", \"extension\": \"x103\", \"job_title\": \"Sales Rep\", \"last_name\": \"King\", \"first_name\": \"Tom\", \"reports_to\": 1088, \"office_code\": \"6\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1621,NULL,'{\"email\": \"mnishi@classicmodelcars.com\", \"extension\": \"x101\", \"job_title\": \"Sales Rep\", \"last_name\": \"Nishi\", \"first_name\": \"Mami\", \"reports_to\": 1056, \"office_code\": \"5\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1621,NULL,'{\"email\": \"mnishi@classicmodelcars.com\", \"extension\": \"x101\", \"job_title\": \"Sales Rep\", \"last_name\": \"Nishi\", \"first_name\": \"Mami\", \"reports_to\": 1056, \"office_code\": \"5\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1625,NULL,'{\"email\": \"ykato@classicmodelcars.com\", \"extension\": \"x102\", \"job_title\": \"Sales Rep\", \"last_name\": \"Kato\", \"first_name\": \"Yoshimi\", \"reports_to\": 1621, \"office_code\": \"5\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1625,NULL,'{\"email\": \"ykato@classicmodelcars.com\", \"extension\": \"x102\", \"job_title\": \"Sales Rep\", \"last_name\": \"Kato\", \"first_name\": \"Yoshimi\", \"reports_to\": 1621, \"office_code\": \"5\"}','INSERT','2021-08-21 16:54:37');
INSERT INTO `employee_audit` VALUES (1702,NULL,'{\"email\": \"mgerard@classicmodelcars.com\", \"extension\": \"x2312\", \"job_title\": \"Sales Rep\", \"last_name\": \"Gerard\", \"first_name\": \"Martin\", \"reports_to\": 1102, \"office_code\": \"4\"}','INSERT','2021-08-21 16:34:35');
INSERT INTO `employee_audit` VALUES (1702,NULL,'{\"email\": \"mgerard@classicmodelcars.com\", \"extension\": \"x2312\", \"job_title\": \"Sales Rep\", \"last_name\": \"Gerard\", \"first_name\": \"Martin\", \"reports_to\": 1102, \"office_code\": \"4\"}','INSERT','2021-08-21 16:54:37');
/*!40000 ALTER TABLE `employee_audit` ENABLE KEYS */;

--
-- Table structure for table `employee_office`
--

DROP TABLE IF EXISTS `employee_office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee_office` (
  `employee_number` int(11) NOT NULL,
  `office_code` varchar(10) NOT NULL,
  PRIMARY KEY (`employee_number`,`office_code`),
  KEY `employee_office_office_code_index` (`office_code`),
  CONSTRAINT `employee_office_employee_employee_number_fk` FOREIGN KEY (`employee_number`) REFERENCES `employee` (`employee_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `employee_office_office_office_code_fk` FOREIGN KEY (`office_code`) REFERENCES `office` (`office_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='employee/office junction table';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee_office`
--

/*!40000 ALTER TABLE `employee_office` DISABLE KEYS */;
INSERT INTO `employee_office` VALUES (1002,'1');
INSERT INTO `employee_office` VALUES (1166,'1');
INSERT INTO `employee_office` VALUES (1401,'1');
INSERT INTO `employee_office` VALUES (1625,'1');
INSERT INTO `employee_office` VALUES (1056,'2');
INSERT INTO `employee_office` VALUES (1188,'2');
INSERT INTO `employee_office` VALUES (1501,'2');
INSERT INTO `employee_office` VALUES (1702,'2');
INSERT INTO `employee_office` VALUES (1076,'3');
INSERT INTO `employee_office` VALUES (1216,'3');
INSERT INTO `employee_office` VALUES (1504,'3');
INSERT INTO `employee_office` VALUES (1002,'4');
INSERT INTO `employee_office` VALUES (1088,'4');
INSERT INTO `employee_office` VALUES (1286,'4');
INSERT INTO `employee_office` VALUES (1611,'4');
INSERT INTO `employee_office` VALUES (1056,'5');
INSERT INTO `employee_office` VALUES (1102,'5');
INSERT INTO `employee_office` VALUES (1323,'5');
INSERT INTO `employee_office` VALUES (1612,'5');
INSERT INTO `employee_office` VALUES (1076,'6');
INSERT INTO `employee_office` VALUES (1143,'6');
INSERT INTO `employee_office` VALUES (1337,'6');
INSERT INTO `employee_office` VALUES (1619,'6');
INSERT INTO `employee_office` VALUES (1165,'7');
INSERT INTO `employee_office` VALUES (1370,'7');
INSERT INTO `employee_office` VALUES (1621,'7');
/*!40000 ALTER TABLE `employee_office` ENABLE KEYS */;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `sku` varchar(15) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `bin_id` varchar(10) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`sku`,`warehouse_id`,`bin_id`),
  KEY `inventory_warehouse_bin_warehouse_id_bin_id_fk` (`warehouse_id`,`bin_id`),
  CONSTRAINT `inventory_product_sku_fk` FOREIGN KEY (`sku`) REFERENCES `product` (`sku`),
  CONSTRAINT `inventory_warehouse_bin_warehouse_id_bin_id_fk` FOREIGN KEY (`warehouse_id`, `bin_id`) REFERENCES `warehouse_bin` (`warehouse_id`, `bin_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Quantity on hand and location';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
INSERT INTO `inventory` VALUES ('S10_1678',1,'1',7933);
INSERT INTO `inventory` VALUES ('S10_1949',1,'1',7305);
INSERT INTO `inventory` VALUES ('S10_2016',1,'1',6625);
INSERT INTO `inventory` VALUES ('S10_4698',1,'1',5582);
INSERT INTO `inventory` VALUES ('S10_4757',1,'1',3252);
INSERT INTO `inventory` VALUES ('S10_4962',1,'1',6791);
INSERT INTO `inventory` VALUES ('S12_1099',1,'1',68);
INSERT INTO `inventory` VALUES ('S12_1108',1,'1',3619);
INSERT INTO `inventory` VALUES ('S12_1666',1,'1',1579);
INSERT INTO `inventory` VALUES ('S12_2823',1,'1',9997);
INSERT INTO `inventory` VALUES ('S12_3148',1,'1',6906);
INSERT INTO `inventory` VALUES ('S12_3380',1,'1',9123);
INSERT INTO `inventory` VALUES ('S12_3891',1,'1',1049);
INSERT INTO `inventory` VALUES ('S12_3990',1,'1',5663);
INSERT INTO `inventory` VALUES ('S12_4473',1,'1',6125);
INSERT INTO `inventory` VALUES ('S12_4675',1,'1',7323);
INSERT INTO `inventory` VALUES ('S18_1097',1,'1',2613);
INSERT INTO `inventory` VALUES ('S18_1129',1,'1',3975);
INSERT INTO `inventory` VALUES ('S18_1342',1,'1',8693);
INSERT INTO `inventory` VALUES ('S18_1367',1,'1',8635);
INSERT INTO `inventory` VALUES ('S18_1589',1,'1',9042);
INSERT INTO `inventory` VALUES ('S18_1662',1,'1',5330);
INSERT INTO `inventory` VALUES ('S18_1749',1,'1',2724);
INSERT INTO `inventory` VALUES ('S18_1889',1,'1',8826);
INSERT INTO `inventory` VALUES ('S18_1984',1,'1',9772);
INSERT INTO `inventory` VALUES ('S18_2238',1,'1',4724);
INSERT INTO `inventory` VALUES ('S18_2248',1,'1',540);
INSERT INTO `inventory` VALUES ('S18_2319',1,'1',8258);
INSERT INTO `inventory` VALUES ('S18_2325',1,'1',9354);
INSERT INTO `inventory` VALUES ('S18_2432',1,'1',2018);
INSERT INTO `inventory` VALUES ('S18_2581',1,'1',992);
INSERT INTO `inventory` VALUES ('S18_2625',1,'1',4357);
INSERT INTO `inventory` VALUES ('S18_2795',1,'1',548);
INSERT INTO `inventory` VALUES ('S18_2870',1,'1',8164);
INSERT INTO `inventory` VALUES ('S18_2949',1,'1',4189);
INSERT INTO `inventory` VALUES ('S18_2957',1,'1',5649);
INSERT INTO `inventory` VALUES ('S18_3029',1,'1',4259);
INSERT INTO `inventory` VALUES ('S18_3136',1,'1',5992);
INSERT INTO `inventory` VALUES ('S18_3140',1,'1',3913);
INSERT INTO `inventory` VALUES ('S18_3232',1,'1',8347);
INSERT INTO `inventory` VALUES ('S18_3233',1,'1',7733);
INSERT INTO `inventory` VALUES ('S18_3259',1,'1',6450);
INSERT INTO `inventory` VALUES ('S18_3278',1,'1',1917);
INSERT INTO `inventory` VALUES ('S18_3320',1,'1',7913);
INSERT INTO `inventory` VALUES ('S18_3482',1,'1',9127);
INSERT INTO `inventory` VALUES ('S18_3685',1,'1',8990);
INSERT INTO `inventory` VALUES ('S18_3782',1,'1',7689);
INSERT INTO `inventory` VALUES ('S18_3856',1,'1',2378);
INSERT INTO `inventory` VALUES ('S18_4027',1,'1',5545);
INSERT INTO `inventory` VALUES ('S18_4409',1,'1',6553);
INSERT INTO `inventory` VALUES ('S18_4522',1,'1',8290);
INSERT INTO `inventory` VALUES ('S18_4600',1,'1',3128);
INSERT INTO `inventory` VALUES ('S18_4668',1,'1',6645);
INSERT INTO `inventory` VALUES ('S18_4721',1,'1',1249);
INSERT INTO `inventory` VALUES ('S18_4933',1,'1',3209);
INSERT INTO `inventory` VALUES ('S24_1046',1,'1',1005);
INSERT INTO `inventory` VALUES ('S24_1444',1,'1',4074);
INSERT INTO `inventory` VALUES ('S24_1578',1,'1',7003);
INSERT INTO `inventory` VALUES ('S24_1628',1,'1',8197);
INSERT INTO `inventory` VALUES ('S24_1785',1,'1',3627);
INSERT INTO `inventory` VALUES ('S24_1937',1,'1',7332);
INSERT INTO `inventory` VALUES ('S24_2000',1,'1',15);
INSERT INTO `inventory` VALUES ('S24_2011',1,'1',1898);
INSERT INTO `inventory` VALUES ('S24_2022',1,'1',2847);
INSERT INTO `inventory` VALUES ('S24_2300',1,'1',2327);
INSERT INTO `inventory` VALUES ('S24_2360',1,'1',6840);
INSERT INTO `inventory` VALUES ('S24_2766',1,'1',2350);
INSERT INTO `inventory` VALUES ('S24_2840',1,'1',2542);
INSERT INTO `inventory` VALUES ('S24_2841',1,'1',5942);
INSERT INTO `inventory` VALUES ('S24_2887',1,'1',1452);
INSERT INTO `inventory` VALUES ('S24_2972',1,'1',7723);
INSERT INTO `inventory` VALUES ('S24_3151',1,'1',9173);
INSERT INTO `inventory` VALUES ('S24_3191',1,'1',4695);
INSERT INTO `inventory` VALUES ('S24_3371',1,'1',7995);
INSERT INTO `inventory` VALUES ('S24_3420',1,'1',2902);
INSERT INTO `inventory` VALUES ('S24_3432',1,'1',9446);
INSERT INTO `inventory` VALUES ('S24_3816',1,'1',6621);
INSERT INTO `inventory` VALUES ('S24_3856',1,'1',6600);
INSERT INTO `inventory` VALUES ('S24_3949',1,'1',6812);
INSERT INTO `inventory` VALUES ('S24_3969',1,'1',2081);
INSERT INTO `inventory` VALUES ('S24_4048',1,'1',6582);
INSERT INTO `inventory` VALUES ('S24_4258',1,'1',4710);
INSERT INTO `inventory` VALUES ('S24_4278',1,'1',2756);
INSERT INTO `inventory` VALUES ('S24_4620',1,'1',7869);
INSERT INTO `inventory` VALUES ('S32_1268',1,'1',5099);
INSERT INTO `inventory` VALUES ('S32_1374',1,'1',178);
INSERT INTO `inventory` VALUES ('S32_2206',1,'1',9241);
INSERT INTO `inventory` VALUES ('S32_2509',1,'1',2874);
INSERT INTO `inventory` VALUES ('S32_3207',1,'1',8601);
INSERT INTO `inventory` VALUES ('S32_3522',1,'1',814);
INSERT INTO `inventory` VALUES ('S32_4289',1,'1',136);
INSERT INTO `inventory` VALUES ('S32_4485',1,'1',3341);
INSERT INTO `inventory` VALUES ('S50_1341',1,'1',7062);
INSERT INTO `inventory` VALUES ('S50_1392',1,'1',1016);
INSERT INTO `inventory` VALUES ('S50_1514',1,'1',1645);
INSERT INTO `inventory` VALUES ('S50_4713',1,'1',600);
INSERT INTO `inventory` VALUES ('S700_1138',1,'1',1897);
INSERT INTO `inventory` VALUES ('S700_1691',1,'1',5841);
INSERT INTO `inventory` VALUES ('S700_1938',1,'1',737);
INSERT INTO `inventory` VALUES ('S700_2047',1,'1',3501);
INSERT INTO `inventory` VALUES ('S700_2466',1,'1',9653);
INSERT INTO `inventory` VALUES ('S700_2610',1,'1',7083);
INSERT INTO `inventory` VALUES ('S700_2824',1,'1',6934);
INSERT INTO `inventory` VALUES ('S700_2834',1,'1',7106);
INSERT INTO `inventory` VALUES ('S700_3167',1,'1',551);
INSERT INTO `inventory` VALUES ('S700_3505',1,'1',1956);
INSERT INTO `inventory` VALUES ('S700_3962',1,'1',5088);
INSERT INTO `inventory` VALUES ('S700_4002',1,'1',8820);
INSERT INTO `inventory` VALUES ('S72_1253',1,'1',4857);
INSERT INTO `inventory` VALUES ('S72_3212',1,'1',414);
INSERT INTO `inventory` VALUES ('S72_3212',2,'2a',300);
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;

--
-- Table structure for table `office`
--

DROP TABLE IF EXISTS `office`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `office` (
  `office_code` varchar(10) NOT NULL,
  `city` varchar(50) NOT NULL DEFAULT '',
  `phone` varchar(50) NOT NULL DEFAULT '',
  `address_line_1` varchar(50) NOT NULL DEFAULT '',
  `address_line_2` varchar(50) NOT NULL DEFAULT '',
  `state` varchar(50) NOT NULL DEFAULT '',
  `country` varchar(50) NOT NULL DEFAULT '',
  `postal_code` varchar(15) NOT NULL DEFAULT '',
  `territory` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`office_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `office`
--

/*!40000 ALTER TABLE `office` DISABLE KEYS */;
INSERT INTO `office` VALUES ('1','San Francisco','+1 650 219 4782','100 Market Street','Suite 300','CA','USA','94080','NA');
INSERT INTO `office` VALUES ('2','Boston','+1 215 837 0825','1550 Court Place','Suite 102','MA','USA','02107','NA');
INSERT INTO `office` VALUES ('3','NYC','+1 212 555 3000','523 East 53rd Street','apt. 5A','NY','USA','10022','NA');
INSERT INTO `office` VALUES ('4','Paris','+33 14 723 4404','43 Rue Jouffroy D\'abbans','','','France','75017','EMEA');
INSERT INTO `office` VALUES ('5','Tokyo','+81 33 224 5000','4-1 Kioicho','','Chiyoda-Ku','Japan','102-8578','Japan');
INSERT INTO `office` VALUES ('6','Sydney','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2','','Australia','NSW 2010','APAC');
INSERT INTO `office` VALUES ('7','London','+44 20 7877 2041','25 Old Broad Street','Level 7','','UK','EC2N 1HN','EMEA');
/*!40000 ALTER TABLE `office` ENABLE KEYS */;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `order_number` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `required_date` date NOT NULL,
  `shipped_date` date NOT NULL DEFAULT '1900-01-01',
  `status` varchar(15) NOT NULL,
  `comment` text,
  `customer_number` int(11) NOT NULL,
  PRIMARY KEY (`order_number`),
  KEY `order_customer_number_index` (`customer_number`),
  CONSTRAINT `order_customer_customer_number_fk` FOREIGN KEY (`customer_number`) REFERENCES `customer` (`customer_number`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (10100,'2003-01-06','2003-01-13','2003-01-10','Shipped',NULL,363);
INSERT INTO `order` VALUES (10101,'2003-01-09','2003-01-18','2003-01-11','Shipped','Check on availability.',128);
INSERT INTO `order` VALUES (10102,'2003-01-10','2003-01-18','2003-01-14','Shipped','',181);
INSERT INTO `order` VALUES (10103,'2003-01-29','2003-02-07','2003-02-02','Shipped','',121);
INSERT INTO `order` VALUES (10104,'2003-01-31','2003-02-09','2003-02-01','Shipped','',141);
INSERT INTO `order` VALUES (10105,'2003-02-11','2003-02-21','2003-02-12','Shipped','',145);
INSERT INTO `order` VALUES (10106,'2003-02-17','2003-02-24','2003-02-21','Shipped','',278);
INSERT INTO `order` VALUES (10107,'2003-02-24','2003-03-03','2003-02-26','Shipped','Difficult to negotiate with customer. We need more marketing materials',131);
INSERT INTO `order` VALUES (10108,'2003-03-03','2003-03-12','2003-03-08','Shipped','',385);
INSERT INTO `order` VALUES (10109,'2003-03-10','2003-03-19','2003-03-11','Shipped','Customer requested that FedEx Ground is used for this shipping',486);
INSERT INTO `order` VALUES (10110,'2003-03-18','2003-03-24','2003-03-20','Shipped','',187);
INSERT INTO `order` VALUES (10111,'2003-03-25','2003-03-31','2003-03-30','Shipped','',129);
INSERT INTO `order` VALUES (10112,'2003-03-24','2003-04-03','2003-03-29','Shipped','Customer requested that ad materials (such as posters, pamphlets) be included in the shippment',144);
INSERT INTO `order` VALUES (10113,'2003-03-26','2003-04-02','2003-03-27','Shipped','',124);
INSERT INTO `order` VALUES (10114,'2003-04-01','2003-04-07','2003-04-02','Shipped','',172);
INSERT INTO `order` VALUES (10115,'2003-04-04','2003-04-12','2003-04-07','Shipped','',424);
INSERT INTO `order` VALUES (10116,'2003-04-11','2003-04-19','2003-04-13','Shipped','',381);
INSERT INTO `order` VALUES (10117,'2003-04-16','2003-04-24','2003-04-17','Shipped','',148);
INSERT INTO `order` VALUES (10118,'2003-04-21','2003-04-29','2003-04-26','Shipped','Customer has worked with some of our vendors in the past and is aware of their MSRP',216);
INSERT INTO `order` VALUES (10119,'2003-04-28','2003-05-05','2003-05-02','Shipped','',382);
INSERT INTO `order` VALUES (10120,'2003-04-29','2003-05-08','2003-05-01','Shipped','',114);
INSERT INTO `order` VALUES (10121,'2003-05-07','2003-05-13','2003-05-13','Shipped','',353);
INSERT INTO `order` VALUES (10122,'2003-05-08','2003-05-16','2003-05-13','Shipped','',350);
INSERT INTO `order` VALUES (10123,'2003-05-20','2003-05-29','2003-05-22','Shipped','',103);
INSERT INTO `order` VALUES (10124,'2003-05-21','2003-05-29','2003-05-25','Shipped','Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch',112);
INSERT INTO `order` VALUES (10125,'2003-05-21','2003-05-27','2003-05-24','Shipped','',114);
INSERT INTO `order` VALUES (10126,'2003-05-28','2003-06-07','2003-06-02','Shipped','',458);
INSERT INTO `order` VALUES (10127,'2003-06-03','2003-06-09','2003-06-06','Shipped','Customer requested special shippment. The instructions were passed along to the warehouse',151);
INSERT INTO `order` VALUES (10128,'2003-06-06','2003-06-12','2003-06-11','Shipped','',141);
INSERT INTO `order` VALUES (10129,'2003-06-12','2003-06-18','2003-06-14','Shipped','',324);
INSERT INTO `order` VALUES (10130,'2003-06-16','2003-06-24','2003-06-21','Shipped','',198);
INSERT INTO `order` VALUES (10131,'2003-06-16','2003-06-25','2003-06-21','Shipped','',447);
INSERT INTO `order` VALUES (10132,'2003-06-25','2003-07-01','2003-06-28','Shipped','',323);
INSERT INTO `order` VALUES (10133,'2003-06-27','2003-07-04','2003-07-03','Shipped','',141);
INSERT INTO `order` VALUES (10134,'2003-07-01','2003-07-10','2003-07-05','Shipped','',250);
INSERT INTO `order` VALUES (10135,'2003-07-02','2003-07-12','2003-07-03','Shipped','',124);
INSERT INTO `order` VALUES (10136,'2003-07-04','2003-07-14','2003-07-06','Shipped','Customer is interested in buying more Ferrari models',242);
INSERT INTO `order` VALUES (10137,'2003-07-10','2003-07-20','2003-07-14','Shipped','',353);
INSERT INTO `order` VALUES (10138,'2003-07-07','2003-07-16','2003-07-13','Shipped','',496);
INSERT INTO `order` VALUES (10139,'2003-07-16','2003-07-23','2003-07-21','Shipped','',282);
INSERT INTO `order` VALUES (10140,'2003-07-24','2003-08-02','2003-07-30','Shipped','',161);
INSERT INTO `order` VALUES (10141,'2003-08-01','2003-08-09','2003-08-04','Shipped','',334);
INSERT INTO `order` VALUES (10142,'2003-08-08','2003-08-16','2003-08-13','Shipped','',124);
INSERT INTO `order` VALUES (10143,'2003-08-10','2003-08-18','2003-08-12','Shipped','Can we deliver the new Ford Mustang models by end-of-quarter?',320);
INSERT INTO `order` VALUES (10144,'2003-08-13','2003-08-21','2003-08-14','Shipped','',381);
INSERT INTO `order` VALUES (10145,'2003-08-25','2003-09-02','2003-08-31','Shipped','',205);
INSERT INTO `order` VALUES (10146,'2003-09-03','2003-09-13','2003-09-06','Shipped','',447);
INSERT INTO `order` VALUES (10147,'2003-09-05','2003-09-12','2003-09-09','Shipped','',379);
INSERT INTO `order` VALUES (10148,'2003-09-11','2003-09-21','2003-09-15','Shipped','They want to reevaluate their terms agreement with Finance.',276);
INSERT INTO `order` VALUES (10149,'2003-09-12','2003-09-18','2003-09-17','Shipped','',487);
INSERT INTO `order` VALUES (10150,'2003-09-19','2003-09-27','2003-09-21','Shipped','They want to reevaluate their terms agreement with Finance.',148);
INSERT INTO `order` VALUES (10151,'2003-09-21','2003-09-30','2003-09-24','Shipped','',311);
INSERT INTO `order` VALUES (10152,'2003-09-25','2003-10-03','2003-10-01','Shipped','',333);
INSERT INTO `order` VALUES (10153,'2003-09-28','2003-10-05','2003-10-03','Shipped','',141);
INSERT INTO `order` VALUES (10154,'2003-10-02','2003-10-12','2003-10-08','Shipped','',219);
INSERT INTO `order` VALUES (10155,'2003-10-06','2003-10-13','2003-10-07','Shipped','',186);
INSERT INTO `order` VALUES (10156,'2003-10-08','2003-10-17','2003-10-11','Shipped','',141);
INSERT INTO `order` VALUES (10157,'2003-10-09','2003-10-15','2003-10-14','Shipped','',473);
INSERT INTO `order` VALUES (10158,'2003-10-10','2003-10-18','2003-10-15','Shipped','',121);
INSERT INTO `order` VALUES (10159,'2003-10-10','2003-10-19','2003-10-16','Shipped','',321);
INSERT INTO `order` VALUES (10160,'2003-10-11','2003-10-17','2003-10-17','Shipped','',347);
INSERT INTO `order` VALUES (10161,'2003-10-17','2003-10-25','2003-10-20','Shipped','',227);
INSERT INTO `order` VALUES (10162,'2003-10-18','2003-10-26','2003-10-19','Shipped','',321);
INSERT INTO `order` VALUES (10163,'2003-10-20','2003-10-27','2003-10-24','Shipped','',424);
INSERT INTO `order` VALUES (10164,'2003-10-21','2003-10-30','2003-10-23','Resolved','This order was disputed, but resolved on 11/1/2003; Customer doesn\'t like the colors and precision of the models.',452);
INSERT INTO `order` VALUES (10165,'2003-10-22','2003-10-31','2003-12-26','Shipped','This order was on hold because customers\'s credit limit had been exceeded. Order will ship when payment is received',148);
INSERT INTO `order` VALUES (10166,'2003-10-21','2003-10-30','2003-10-27','Shipped','',462);
INSERT INTO `order` VALUES (10167,'2003-10-23','2003-10-30','9999-12-31','Cancelled','Customer called to cancel. The warehouse was notified in time and the order didn\'t ship. They have a new VP of Sales and are shifting their sales model. Our VP of Sales should contact them.',448);
INSERT INTO `order` VALUES (10168,'2003-10-28','2003-11-03','2003-11-01','Shipped','',161);
INSERT INTO `order` VALUES (10169,'2003-11-04','2003-11-14','2003-11-09','Shipped','',276);
INSERT INTO `order` VALUES (10170,'2003-11-04','2003-11-12','2003-11-07','Shipped','',452);
INSERT INTO `order` VALUES (10171,'2003-11-05','2003-11-13','2003-11-07','Shipped','',233);
INSERT INTO `order` VALUES (10172,'2003-11-05','2003-11-14','2003-11-11','Shipped','',175);
INSERT INTO `order` VALUES (10173,'2003-11-05','2003-11-15','2003-11-09','Shipped','Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches',278);
INSERT INTO `order` VALUES (10174,'2003-11-06','2003-11-15','2003-11-10','Shipped','',333);
INSERT INTO `order` VALUES (10175,'2003-11-06','2003-11-14','2003-11-09','Shipped','',324);
INSERT INTO `order` VALUES (10176,'2003-11-06','2003-11-15','2003-11-12','Shipped','',386);
INSERT INTO `order` VALUES (10177,'2003-11-07','2003-11-17','2003-11-12','Shipped','',344);
INSERT INTO `order` VALUES (10178,'2003-11-08','2003-11-16','2003-11-10','Shipped','Custom shipping instructions sent to warehouse',242);
INSERT INTO `order` VALUES (10179,'2003-11-11','2003-11-17','2003-11-13','Cancelled','Customer cancelled due to urgent budgeting issues. Must be cautious when dealing with them in the future. Since order shipped already we must discuss who would cover the shipping charges.',496);
INSERT INTO `order` VALUES (10180,'2003-11-11','2003-11-19','2003-11-14','Shipped','',171);
INSERT INTO `order` VALUES (10181,'2003-11-12','2003-11-19','2003-11-15','Shipped','',167);
INSERT INTO `order` VALUES (10182,'2003-11-12','2003-11-21','2003-11-18','Shipped','',124);
INSERT INTO `order` VALUES (10183,'2003-11-13','2003-11-22','2003-11-15','Shipped','We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.',339);
INSERT INTO `order` VALUES (10184,'2003-11-14','2003-11-22','2003-11-20','Shipped','',484);
INSERT INTO `order` VALUES (10185,'2003-11-14','2003-11-21','2003-11-20','Shipped','',320);
INSERT INTO `order` VALUES (10186,'2003-11-14','2003-11-20','2003-11-18','Shipped','They want to reevaluate their terms agreement with the VP of Sales',489);
INSERT INTO `order` VALUES (10187,'2003-11-15','2003-11-24','2003-11-16','Shipped','',211);
INSERT INTO `order` VALUES (10188,'2003-11-18','2003-11-26','2003-11-24','Shipped','',167);
INSERT INTO `order` VALUES (10189,'2003-11-18','2003-11-25','2003-11-24','Shipped','They want to reevaluate their terms agreement with Finance.',205);
INSERT INTO `order` VALUES (10190,'2003-11-19','2003-11-29','2003-11-20','Shipped','',141);
INSERT INTO `order` VALUES (10191,'2003-11-20','2003-11-30','2003-11-24','Shipped','We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.',259);
INSERT INTO `order` VALUES (10192,'2003-11-20','2003-11-29','2003-11-25','Shipped','',363);
INSERT INTO `order` VALUES (10193,'2003-11-21','2003-11-28','2003-11-27','Shipped','',471);
INSERT INTO `order` VALUES (10194,'2003-11-25','2003-12-02','2003-11-26','Shipped','',146);
INSERT INTO `order` VALUES (10195,'2003-11-25','2003-12-01','2003-11-28','Shipped','',319);
INSERT INTO `order` VALUES (10196,'2003-11-26','2003-12-03','2003-12-01','Shipped','',455);
INSERT INTO `order` VALUES (10197,'2003-11-26','2003-12-02','2003-12-01','Shipped','Customer inquired about remote controlled models and gold models.',216);
INSERT INTO `order` VALUES (10198,'2003-11-27','2003-12-06','2003-12-03','Shipped','',385);
INSERT INTO `order` VALUES (10199,'2003-12-01','2003-12-10','2003-12-06','Shipped','',475);
INSERT INTO `order` VALUES (10200,'2003-12-01','2003-12-09','2003-12-06','Shipped','',211);
INSERT INTO `order` VALUES (10201,'2003-12-01','2003-12-11','2003-12-02','Shipped','',129);
INSERT INTO `order` VALUES (10202,'2003-12-02','2003-12-09','2003-12-06','Shipped','',357);
INSERT INTO `order` VALUES (10203,'2003-12-02','2003-12-11','2003-12-07','Shipped','',141);
INSERT INTO `order` VALUES (10204,'2003-12-02','2003-12-10','2003-12-04','Shipped','',151);
INSERT INTO `order` VALUES (10205,'2003-12-03','2003-12-09','2003-12-07','Shipped',' I need all the information I can get on our competitors.',141);
INSERT INTO `order` VALUES (10206,'2003-12-05','2003-12-13','2003-12-08','Shipped','Can we renegotiate this one?',202);
INSERT INTO `order` VALUES (10207,'2003-12-09','2003-12-17','2003-12-11','Shipped','Check on availability.',495);
INSERT INTO `order` VALUES (10208,'2004-01-02','2004-01-11','2004-01-04','Shipped','',146);
INSERT INTO `order` VALUES (10209,'2004-01-09','2004-01-15','2004-01-12','Shipped','',347);
INSERT INTO `order` VALUES (10210,'2004-01-12','2004-01-22','2004-01-20','Shipped','',177);
INSERT INTO `order` VALUES (10211,'2004-01-15','2004-01-25','2004-01-18','Shipped','',406);
INSERT INTO `order` VALUES (10212,'2004-01-16','2004-01-24','2004-01-18','Shipped','',141);
INSERT INTO `order` VALUES (10213,'2004-01-22','2004-01-28','2004-01-27','Shipped','Difficult to negotiate with customer. We need more marketing materials',489);
INSERT INTO `order` VALUES (10214,'2004-01-26','2004-02-04','2004-01-29','Shipped','',458);
INSERT INTO `order` VALUES (10215,'2004-01-29','2004-02-08','2004-02-01','Shipped','Customer requested that FedEx Ground is used for this shipping',475);
INSERT INTO `order` VALUES (10216,'2004-02-02','2004-02-10','2004-02-04','Shipped','',256);
INSERT INTO `order` VALUES (10217,'2004-02-04','2004-02-14','2004-02-06','Shipped','',166);
INSERT INTO `order` VALUES (10218,'2004-02-09','2004-02-16','2004-02-11','Shipped','Customer requested that ad materials (such as posters, pamphlets) be included in the shippment',473);
INSERT INTO `order` VALUES (10219,'2004-02-10','2004-02-17','2004-02-12','Shipped','',487);
INSERT INTO `order` VALUES (10220,'2004-02-12','2004-02-19','2004-02-16','Shipped','',189);
INSERT INTO `order` VALUES (10221,'2004-02-18','2004-02-26','2004-02-19','Shipped','',314);
INSERT INTO `order` VALUES (10222,'2004-02-19','2004-02-27','2004-02-20','Shipped','',239);
INSERT INTO `order` VALUES (10223,'2004-02-20','2004-02-29','2004-02-24','Shipped','',114);
INSERT INTO `order` VALUES (10224,'2004-02-21','2004-03-02','2004-02-26','Shipped','Customer has worked with some of our vendors in the past and is aware of their MSRP',171);
INSERT INTO `order` VALUES (10225,'2004-02-22','2004-03-01','2004-02-24','Shipped','',298);
INSERT INTO `order` VALUES (10226,'2004-02-26','2004-03-06','2004-03-02','Shipped','',239);
INSERT INTO `order` VALUES (10227,'2004-03-02','2004-03-12','2004-03-08','Shipped','',146);
INSERT INTO `order` VALUES (10228,'2004-03-10','2004-03-18','2004-03-13','Shipped','',173);
INSERT INTO `order` VALUES (10229,'2004-03-11','2004-03-20','2004-03-12','Shipped','',124);
INSERT INTO `order` VALUES (10230,'2004-03-15','2004-03-24','2004-03-20','Shipped','Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch',128);
INSERT INTO `order` VALUES (10231,'2004-03-19','2004-03-26','2004-03-25','Shipped','',344);
INSERT INTO `order` VALUES (10232,'2004-03-20','2004-03-30','2004-03-25','Shipped','',240);
INSERT INTO `order` VALUES (10233,'2004-03-29','2004-04-04','2004-04-02','Shipped','Customer requested special shippment. The instructions were passed along to the warehouse',328);
INSERT INTO `order` VALUES (10234,'2004-03-30','2004-04-05','2004-04-02','Shipped','',412);
INSERT INTO `order` VALUES (10235,'2004-04-02','2004-04-12','2004-04-06','Shipped','',260);
INSERT INTO `order` VALUES (10236,'2004-04-03','2004-04-11','2004-04-08','Shipped','',486);
INSERT INTO `order` VALUES (10237,'2004-04-05','2004-04-12','2004-04-10','Shipped','',181);
INSERT INTO `order` VALUES (10238,'2004-04-09','2004-04-16','2004-04-10','Shipped','',145);
INSERT INTO `order` VALUES (10239,'2004-04-12','2004-04-21','2004-04-17','Shipped','',311);
INSERT INTO `order` VALUES (10240,'2004-04-13','2004-04-20','2004-04-20','Shipped','',177);
INSERT INTO `order` VALUES (10241,'2004-04-13','2004-04-20','2004-04-19','Shipped','',209);
INSERT INTO `order` VALUES (10242,'2004-04-20','2004-04-28','2004-04-25','Shipped','Customer is interested in buying more Ferrari models',456);
INSERT INTO `order` VALUES (10243,'2004-04-26','2004-05-03','2004-04-28','Shipped','',495);
INSERT INTO `order` VALUES (10244,'2004-04-29','2004-05-09','2004-05-04','Shipped','',141);
INSERT INTO `order` VALUES (10245,'2004-05-04','2004-05-12','2004-05-09','Shipped','',455);
INSERT INTO `order` VALUES (10246,'2004-05-05','2004-05-13','2004-05-06','Shipped','',141);
INSERT INTO `order` VALUES (10247,'2004-05-05','2004-05-11','2004-05-08','Shipped','',334);
INSERT INTO `order` VALUES (10248,'2004-05-07','2004-05-14','1900-01-01','Cancelled','Order was mistakenly placed. The warehouse noticed the lack of documentation.',131);
INSERT INTO `order` VALUES (10249,'2004-05-08','2004-05-17','2004-05-11','Shipped','Can we deliver the new Ford Mustang models by end-of-quarter?',173);
INSERT INTO `order` VALUES (10250,'2004-05-11','2004-05-19','2004-05-15','Shipped','',450);
INSERT INTO `order` VALUES (10251,'2004-05-18','2004-05-24','2004-05-24','Shipped','',328);
INSERT INTO `order` VALUES (10252,'2004-05-26','2004-06-04','2004-05-29','Shipped','',406);
INSERT INTO `order` VALUES (10253,'2004-06-01','2004-06-09','2004-06-02','Cancelled','Customer disputed the order and we agreed to cancel it. We must be more cautions with this customer going forward, since they are very hard to please. We must cover the shipping fees.',201);
INSERT INTO `order` VALUES (10254,'2004-06-03','2004-06-13','2004-06-04','Shipped','Customer requested that DHL is used for this shipping',323);
INSERT INTO `order` VALUES (10255,'2004-06-04','2004-06-12','2004-06-09','Shipped','',209);
INSERT INTO `order` VALUES (10256,'2004-06-08','2004-06-16','2004-06-10','Shipped','',145);
INSERT INTO `order` VALUES (10257,'2004-06-14','2004-06-24','2004-06-15','Shipped','',450);
INSERT INTO `order` VALUES (10258,'2004-06-15','2004-06-25','2004-06-23','Shipped','',398);
INSERT INTO `order` VALUES (10259,'2004-06-15','2004-06-22','2004-06-17','Shipped','',166);
INSERT INTO `order` VALUES (10260,'2004-06-16','2004-06-22','9999-12-31','Cancelled','Customer heard complaints from their customers and called to cancel this order. Will notify the Sales Manager.',357);
INSERT INTO `order` VALUES (10261,'2004-06-17','2004-06-25','2004-06-22','Shipped','',233);
INSERT INTO `order` VALUES (10262,'2004-06-24','2004-07-01','9999-12-31','Cancelled','This customer found a better offer from one of our competitors. Will call back to renegotiate.',141);
INSERT INTO `order` VALUES (10263,'2004-06-28','2004-07-04','2004-07-02','Shipped','',175);
INSERT INTO `order` VALUES (10264,'2004-06-30','2004-07-06','2004-07-01','Shipped','Customer will send a truck to our local warehouse on 7/1/2004',362);
INSERT INTO `order` VALUES (10265,'2004-07-02','2004-07-09','2004-07-07','Shipped','',471);
INSERT INTO `order` VALUES (10266,'2004-07-06','2004-07-14','2004-07-10','Shipped','',386);
INSERT INTO `order` VALUES (10267,'2004-07-07','2004-07-17','2004-07-09','Shipped','',151);
INSERT INTO `order` VALUES (10268,'2004-07-12','2004-07-18','2004-07-14','Shipped','',412);
INSERT INTO `order` VALUES (10269,'2004-07-16','2004-07-22','2004-07-18','Shipped','',382);
INSERT INTO `order` VALUES (10270,'2004-07-19','2004-07-27','2004-07-24','Shipped','Can we renegotiate this one?',282);
INSERT INTO `order` VALUES (10271,'2004-07-20','2004-07-29','2004-07-23','Shipped','',124);
INSERT INTO `order` VALUES (10272,'2004-07-20','2004-07-26','2004-07-22','Shipped','',157);
INSERT INTO `order` VALUES (10273,'2004-07-21','2004-07-28','2004-07-22','Shipped','',314);
INSERT INTO `order` VALUES (10274,'2004-07-21','2004-07-29','2004-07-22','Shipped','',379);
INSERT INTO `order` VALUES (10275,'2004-07-23','2004-08-02','2004-07-29','Shipped','',119);
INSERT INTO `order` VALUES (10276,'2004-08-02','2004-08-11','2004-08-08','Shipped','',204);
INSERT INTO `order` VALUES (10277,'2004-08-04','2004-08-12','2004-08-05','Shipped','',148);
INSERT INTO `order` VALUES (10278,'2004-08-06','2004-08-16','2004-08-09','Shipped','',112);
INSERT INTO `order` VALUES (10279,'2004-08-09','2004-08-19','2004-08-15','Shipped','Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches',141);
INSERT INTO `order` VALUES (10280,'2004-08-17','2004-08-27','2004-08-19','Shipped','',249);
INSERT INTO `order` VALUES (10281,'2004-08-19','2004-08-28','2004-08-23','Shipped','',157);
INSERT INTO `order` VALUES (10282,'2004-08-20','2004-08-26','2004-08-22','Shipped','',124);
INSERT INTO `order` VALUES (10283,'2004-08-20','2004-08-30','2004-08-23','Shipped','',260);
INSERT INTO `order` VALUES (10284,'2004-08-21','2004-08-29','2004-08-26','Shipped','Custom shipping instructions sent to warehouse',299);
INSERT INTO `order` VALUES (10285,'2004-08-27','2004-09-04','2004-08-31','Shipped','',286);
INSERT INTO `order` VALUES (10286,'2004-08-28','2004-09-06','2004-09-01','Shipped','',172);
INSERT INTO `order` VALUES (10287,'2004-08-30','2004-09-06','2004-09-01','Shipped','',298);
INSERT INTO `order` VALUES (10288,'2004-09-01','2004-09-11','2004-09-05','Shipped','',166);
INSERT INTO `order` VALUES (10289,'2004-09-03','2004-09-13','2004-09-04','Shipped','We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.',167);
INSERT INTO `order` VALUES (10290,'2004-09-07','2004-09-15','2004-09-13','Shipped','',198);
INSERT INTO `order` VALUES (10291,'2004-09-08','2004-09-17','2004-09-14','Shipped','',448);
INSERT INTO `order` VALUES (10292,'2004-09-08','2004-09-18','2004-09-11','Shipped','They want to reevaluate their terms agreement with Finance.',131);
INSERT INTO `order` VALUES (10293,'2004-09-09','2004-09-18','2004-09-14','Shipped','',249);
INSERT INTO `order` VALUES (10294,'2004-09-10','2004-09-17','2004-09-14','Shipped','',204);
INSERT INTO `order` VALUES (10295,'2004-09-10','2004-09-17','2004-09-14','Shipped','They want to reevaluate their terms agreement with Finance.',362);
INSERT INTO `order` VALUES (10296,'2004-09-15','2004-09-22','2004-09-16','Shipped','',415);
INSERT INTO `order` VALUES (10297,'2004-09-16','2004-09-22','2004-09-21','Shipped','We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.',189);
INSERT INTO `order` VALUES (10298,'2004-09-27','2004-10-05','2004-10-01','Shipped','',103);
INSERT INTO `order` VALUES (10299,'2004-09-30','2004-10-10','2004-10-01','Shipped','',186);
INSERT INTO `order` VALUES (10300,'2003-10-04','2003-10-13','2003-10-09','Shipped','',128);
INSERT INTO `order` VALUES (10301,'2003-10-05','2003-10-15','2003-10-08','Shipped','',299);
INSERT INTO `order` VALUES (10302,'2003-10-06','2003-10-16','2003-10-07','Shipped','',201);
INSERT INTO `order` VALUES (10303,'2004-10-06','2004-10-14','2004-10-09','Shipped','Customer inquired about remote controlled models and gold models.',484);
INSERT INTO `order` VALUES (10304,'2004-10-11','2004-10-20','2004-10-17','Shipped','',256);
INSERT INTO `order` VALUES (10305,'2004-10-13','2004-10-22','2004-10-15','Shipped','Check on availability.',286);
INSERT INTO `order` VALUES (10306,'2004-10-14','2004-10-21','2004-10-17','Shipped','',187);
INSERT INTO `order` VALUES (10307,'2004-10-14','2004-10-23','2004-10-20','Shipped','',339);
INSERT INTO `order` VALUES (10308,'2004-10-15','2004-10-24','2004-10-20','Shipped','Customer requested that FedEx Ground is used for this shipping',319);
INSERT INTO `order` VALUES (10309,'2004-10-15','2004-10-24','2004-10-18','Shipped','',121);
INSERT INTO `order` VALUES (10310,'2004-10-16','2004-10-24','2004-10-18','Shipped','',259);
INSERT INTO `order` VALUES (10311,'2004-10-16','2004-10-23','2004-10-20','Shipped','Difficult to negotiate with customer. We need more marketing materials',141);
INSERT INTO `order` VALUES (10312,'2004-10-21','2004-10-27','2004-10-23','Shipped','',124);
INSERT INTO `order` VALUES (10313,'2004-10-22','2004-10-28','2004-10-25','Shipped','Customer requested that FedEx Ground is used for this shipping',202);
INSERT INTO `order` VALUES (10314,'2004-10-22','2004-11-01','2004-10-23','Shipped','',227);
INSERT INTO `order` VALUES (10315,'2004-10-29','2004-11-08','2004-10-30','Shipped','',119);
INSERT INTO `order` VALUES (10316,'2004-11-01','2004-11-09','2004-11-07','Shipped','Customer requested that ad materials (such as posters, pamphlets) be included in the shippment',240);
INSERT INTO `order` VALUES (10317,'2004-11-02','2004-11-12','2004-11-08','Shipped','',161);
INSERT INTO `order` VALUES (10318,'2004-11-02','2004-11-09','2004-11-07','Shipped','',157);
INSERT INTO `order` VALUES (10319,'2004-11-03','2004-11-11','2004-11-06','Shipped','Customer requested that DHL is used for this shipping',456);
INSERT INTO `order` VALUES (10320,'2004-11-03','2004-11-13','2004-11-07','Shipped','',144);
INSERT INTO `order` VALUES (10321,'2004-11-04','2004-11-12','2004-11-07','Shipped','',462);
INSERT INTO `order` VALUES (10322,'2004-11-04','2004-11-12','2004-11-10','Shipped','Customer has worked with some of our vendors in the past and is aware of their MSRP',363);
INSERT INTO `order` VALUES (10323,'2004-11-05','2004-11-12','2004-11-09','Shipped','',128);
INSERT INTO `order` VALUES (10324,'2004-11-05','2004-11-11','2004-11-08','Shipped','',181);
INSERT INTO `order` VALUES (10325,'2004-11-05','2004-11-13','2004-11-08','Shipped','',121);
INSERT INTO `order` VALUES (10326,'2004-11-09','2004-11-16','2004-11-10','Shipped','',144);
INSERT INTO `order` VALUES (10327,'2004-11-10','2004-11-19','2004-11-13','Resolved','Order was disputed and resolved on 12/1/04. The Sales Manager was involved. Customer claims the scales of the models don\'t match what was discussed.',145);
INSERT INTO `order` VALUES (10328,'2004-11-12','2004-11-21','2004-11-18','Shipped','Customer very concerned about the exact color of the models. There is high risk that he may dispute the order because there is a slight color mismatch',278);
INSERT INTO `order` VALUES (10329,'2004-11-15','2004-11-24','2004-11-16','Shipped','',131);
INSERT INTO `order` VALUES (10330,'2004-11-16','2004-11-25','2004-11-21','Shipped','',385);
INSERT INTO `order` VALUES (10331,'2004-11-17','2004-11-23','2004-11-23','Shipped','Customer requested special shippment. The instructions were passed along to the warehouse',486);
INSERT INTO `order` VALUES (10332,'2004-11-17','2004-11-25','2004-11-18','Shipped','',187);
INSERT INTO `order` VALUES (10333,'2004-11-18','2004-11-27','2004-11-20','Shipped','',129);
INSERT INTO `order` VALUES (10334,'2004-11-19','2004-11-28','9999-12-31','On Hold','The outstaniding balance for this customer exceeds their credit limit. Order will be shipped when a payment is received.',144);
INSERT INTO `order` VALUES (10335,'2004-11-19','2004-11-29','2004-11-23','Shipped','',124);
INSERT INTO `order` VALUES (10336,'2004-11-20','2004-11-26','2004-11-24','Shipped','Customer requested that DHL is used for this shipping',172);
INSERT INTO `order` VALUES (10337,'2004-11-21','2004-11-30','2004-11-26','Shipped','',424);
INSERT INTO `order` VALUES (10338,'2004-11-22','2004-12-02','2004-11-27','Shipped','',381);
INSERT INTO `order` VALUES (10339,'2004-11-23','2004-11-30','2004-11-30','Shipped','',398);
INSERT INTO `order` VALUES (10340,'2004-11-24','2004-12-01','2004-11-25','Shipped','Customer is interested in buying more Ferrari models',216);
INSERT INTO `order` VALUES (10341,'2004-11-24','2004-12-01','2004-11-29','Shipped','',382);
INSERT INTO `order` VALUES (10342,'2004-11-24','2004-12-01','2004-11-29','Shipped','',114);
INSERT INTO `order` VALUES (10343,'2004-11-24','2004-12-01','2004-11-26','Shipped','',353);
INSERT INTO `order` VALUES (10344,'2004-11-25','2004-12-02','2004-11-29','Shipped','',350);
INSERT INTO `order` VALUES (10345,'2004-11-25','2004-12-01','2004-11-26','Shipped','',103);
INSERT INTO `order` VALUES (10346,'2004-11-29','2004-12-05','2004-11-30','Shipped','',112);
INSERT INTO `order` VALUES (10347,'2004-11-29','2004-12-07','2004-11-30','Shipped','Can we deliver the new Ford Mustang models by end-of-quarter?',114);
INSERT INTO `order` VALUES (10348,'2004-11-01','2004-11-08','2004-11-05','Shipped','',458);
INSERT INTO `order` VALUES (10349,'2004-12-01','2004-12-07','2004-12-03','Shipped','',151);
INSERT INTO `order` VALUES (10350,'2004-12-02','2004-12-08','2004-12-05','Shipped','',141);
INSERT INTO `order` VALUES (10351,'2004-12-03','2004-12-11','2004-12-07','Shipped','',324);
INSERT INTO `order` VALUES (10352,'2004-12-03','2004-12-12','2004-12-09','Shipped','',198);
INSERT INTO `order` VALUES (10353,'2004-12-04','2004-12-11','2004-12-05','Shipped','',447);
INSERT INTO `order` VALUES (10354,'2004-12-04','2004-12-10','2004-12-05','Shipped','',323);
INSERT INTO `order` VALUES (10355,'2004-12-07','2004-12-14','2004-12-13','Shipped','',141);
INSERT INTO `order` VALUES (10356,'2004-12-09','2004-12-15','2004-12-12','Shipped','',250);
INSERT INTO `order` VALUES (10357,'2004-12-10','2004-12-16','2004-12-14','Shipped','',124);
INSERT INTO `order` VALUES (10358,'2004-12-10','2004-12-16','2004-12-16','Shipped','Customer requested that DHL is used for this shipping',141);
INSERT INTO `order` VALUES (10359,'2004-12-15','2004-12-23','2004-12-18','Shipped','',353);
INSERT INTO `order` VALUES (10360,'2004-12-16','2004-12-22','2004-12-18','Shipped','',496);
INSERT INTO `order` VALUES (10361,'2004-12-17','2004-12-24','2004-12-20','Shipped','',282);
INSERT INTO `order` VALUES (10362,'2005-01-05','2005-01-16','2005-01-10','Shipped','',161);
INSERT INTO `order` VALUES (10363,'2005-01-06','2005-01-12','2005-01-10','Shipped','',334);
INSERT INTO `order` VALUES (10364,'2005-01-06','2005-01-17','2005-01-09','Shipped','',350);
INSERT INTO `order` VALUES (10365,'2005-01-07','2005-01-18','2005-01-11','Shipped','',320);
INSERT INTO `order` VALUES (10366,'2005-01-10','2005-01-19','2005-01-12','Shipped','',381);
INSERT INTO `order` VALUES (10367,'2005-01-12','2005-01-21','2005-01-16','Resolved','This order was disputed and resolved on 2/1/2005. Customer claimed that container with shipment was damaged. FedEx\'s investigation proved this wrong.',205);
INSERT INTO `order` VALUES (10368,'2005-01-19','2005-01-27','2005-01-24','Shipped','Can we renegotiate this one?',124);
INSERT INTO `order` VALUES (10369,'2005-01-20','2005-01-28','2005-01-24','Shipped','',379);
INSERT INTO `order` VALUES (10370,'2005-01-20','2005-02-01','2005-01-25','Shipped','',276);
INSERT INTO `order` VALUES (10371,'2005-01-23','2005-02-03','2005-01-25','Shipped','',124);
INSERT INTO `order` VALUES (10372,'2005-01-26','2005-02-05','2005-01-28','Shipped','',398);
INSERT INTO `order` VALUES (10373,'2005-01-31','2005-02-08','2005-02-06','Shipped','',311);
INSERT INTO `order` VALUES (10374,'2005-02-02','2005-02-09','2005-02-03','Shipped','',333);
INSERT INTO `order` VALUES (10375,'2005-02-03','2005-02-10','2005-02-06','Shipped','',119);
INSERT INTO `order` VALUES (10376,'2005-02-08','2005-02-18','2005-02-13','Shipped','',219);
INSERT INTO `order` VALUES (10377,'2005-02-09','2005-02-21','2005-02-12','Shipped','Cautious optimism. We have happy customers here, if we can keep them well stocked.  I need all the information I can get on the planned shippments of Porches',186);
INSERT INTO `order` VALUES (10378,'2005-02-10','2005-02-18','2005-02-11','Shipped','',141);
INSERT INTO `order` VALUES (10379,'2005-02-10','2005-02-18','2005-02-11','Shipped','',141);
INSERT INTO `order` VALUES (10380,'2005-02-16','2005-02-24','2005-02-18','Shipped','',141);
INSERT INTO `order` VALUES (10381,'2005-02-17','2005-02-25','2005-02-18','Shipped','',321);
INSERT INTO `order` VALUES (10382,'2005-02-17','2005-02-23','2005-02-18','Shipped','Custom shipping instructions sent to warehouse',124);
INSERT INTO `order` VALUES (10383,'2005-02-22','2005-03-02','2005-02-25','Shipped','',141);
INSERT INTO `order` VALUES (10384,'2005-02-23','2005-03-06','2005-02-27','Shipped','',321);
INSERT INTO `order` VALUES (10385,'2005-02-28','2005-03-09','2005-03-01','Shipped','',124);
INSERT INTO `order` VALUES (10386,'2005-03-01','2005-03-09','2005-03-06','Resolved','Disputed then Resolved on 3/15/2005. Customer doesn\'t like the craftsmaship of the models.',141);
INSERT INTO `order` VALUES (10387,'2005-03-02','2005-03-09','2005-03-06','Shipped','We need to keep in close contact with their Marketing VP. He is the decision maker for all their purchases.',148);
INSERT INTO `order` VALUES (10388,'2005-03-03','2005-03-11','2005-03-09','Shipped','',462);
INSERT INTO `order` VALUES (10389,'2005-03-03','2005-03-09','2005-03-08','Shipped','',448);
INSERT INTO `order` VALUES (10390,'2005-03-04','2005-03-11','2005-03-07','Shipped','They want to reevaluate their terms agreement with Finance.',124);
INSERT INTO `order` VALUES (10391,'2005-03-09','2005-03-20','2005-03-15','Shipped','',276);
INSERT INTO `order` VALUES (10392,'2005-03-10','2005-03-18','2005-03-12','Shipped','',452);
INSERT INTO `order` VALUES (10393,'2005-03-11','2005-03-22','2005-03-14','Shipped','They want to reevaluate their terms agreement with Finance.',323);
INSERT INTO `order` VALUES (10394,'2005-03-15','2005-03-25','2005-03-19','Shipped','',141);
INSERT INTO `order` VALUES (10395,'2005-03-17','2005-03-24','2005-03-23','Shipped','We must be cautions with this customer. Their VP of Sales resigned. Company may be heading down.',250);
INSERT INTO `order` VALUES (10396,'2005-03-23','2005-04-02','2005-03-28','Shipped','',124);
INSERT INTO `order` VALUES (10397,'2005-03-28','2005-04-09','2005-04-01','Shipped','',242);
INSERT INTO `order` VALUES (10398,'2005-03-30','2005-04-09','2005-03-31','Shipped','',353);
INSERT INTO `order` VALUES (10399,'2005-04-01','2005-04-12','2005-04-03','Shipped','',496);
INSERT INTO `order` VALUES (10400,'2005-04-01','2005-04-11','2005-04-04','Shipped','Customer requested that DHL is used for this shipping',450);
INSERT INTO `order` VALUES (10401,'2005-04-03','2005-04-14','9999-12-31','On Hold','Customer credit limit exceeded. Will ship when a payment is received.',328);
INSERT INTO `order` VALUES (10402,'2005-04-07','2005-04-14','2005-04-12','Shipped','',406);
INSERT INTO `order` VALUES (10403,'2005-04-08','2005-04-18','2005-04-11','Shipped','',201);
INSERT INTO `order` VALUES (10404,'2005-04-08','2005-04-14','2005-04-11','Shipped','',323);
INSERT INTO `order` VALUES (10405,'2005-04-14','2005-04-24','2005-04-20','Shipped','',209);
INSERT INTO `order` VALUES (10406,'2005-04-15','2005-04-25','2005-04-21','Disputed','Customer claims container with shipment was damaged during shipping and some items were missing. I am talking to FedEx about this.',145);
INSERT INTO `order` VALUES (10407,'2005-04-22','2005-05-04','9999-12-31','On Hold','Customer credit limit exceeded. Will ship when a payment is received.',450);
INSERT INTO `order` VALUES (10408,'2005-04-22','2005-04-29','2005-04-27','Shipped','',398);
INSERT INTO `order` VALUES (10409,'2005-04-23','2005-05-05','2005-04-24','Shipped','',166);
INSERT INTO `order` VALUES (10410,'2005-04-29','2005-05-10','2005-04-30','Shipped','',357);
INSERT INTO `order` VALUES (10411,'2005-05-01','2005-05-08','2005-05-06','Shipped','',233);
INSERT INTO `order` VALUES (10412,'2005-05-03','2005-05-13','2005-05-05','Shipped','',141);
INSERT INTO `order` VALUES (10413,'2005-05-05','2005-05-14','2005-05-09','Shipped','Customer requested that DHL is used for this shipping',175);
INSERT INTO `order` VALUES (10414,'2005-05-06','2005-05-13','9999-12-31','On Hold','Customer credit limit exceeded. Will ship when a payment is received.',362);
INSERT INTO `order` VALUES (10415,'2005-05-09','2005-05-20','2005-05-12','Disputed','Customer claims the scales of the models don\'t match what was discussed. I keep all the paperwork though to prove otherwise',471);
INSERT INTO `order` VALUES (10416,'2005-05-10','2005-05-16','2005-05-14','Shipped','',386);
INSERT INTO `order` VALUES (10417,'2005-05-13','2005-05-19','2005-05-19','Disputed','Customer doesn\'t like the colors and precision of the models.',141);
INSERT INTO `order` VALUES (10418,'2005-05-16','2005-05-24','2005-05-20','Shipped','',412);
INSERT INTO `order` VALUES (10419,'2005-05-17','2005-05-28','2005-05-19','Shipped','',382);
INSERT INTO `order` VALUES (10420,'2005-05-29','2005-06-07','9999-12-31','In Process','',282);
INSERT INTO `order` VALUES (10421,'2005-05-29','2005-06-06','9999-12-31','In Process','Custom shipping instructions were sent to warehouse',124);
INSERT INTO `order` VALUES (10422,'2005-05-30','2005-06-11','9999-12-31','In Process','',157);
INSERT INTO `order` VALUES (10423,'2005-05-30','2005-06-05','9999-12-31','In Process','',314);
INSERT INTO `order` VALUES (10424,'2005-05-31','2005-06-08','9999-12-31','In Process','',141);
INSERT INTO `order` VALUES (10425,'2005-05-31','2005-06-07','9999-12-31','In Process','',119);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_number` int(11) NOT NULL,
  `product_code` varchar(15) NOT NULL,
  `quantity_ordered` int(11) NOT NULL,
  `price_each` decimal(10,2) NOT NULL,
  `order_line_number` smallint(6) NOT NULL,
  PRIMARY KEY (`order_number`,`product_code`),
  KEY `order_detail_product_code_index` (`product_code`),
  CONSTRAINT `order_detail_order_order_number_fk` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
INSERT INTO `order_detail` VALUES (10100,'S18_1749',30,136.00,3);
INSERT INTO `order_detail` VALUES (10100,'S18_2248',50,55.09,2);
INSERT INTO `order_detail` VALUES (10100,'S18_4409',22,75.46,4);
INSERT INTO `order_detail` VALUES (10100,'S24_3969',49,35.29,1);
INSERT INTO `order_detail` VALUES (10101,'S18_2325',25,108.06,4);
INSERT INTO `order_detail` VALUES (10101,'S18_2795',26,167.06,1);
INSERT INTO `order_detail` VALUES (10101,'S24_1937',45,32.53,3);
INSERT INTO `order_detail` VALUES (10101,'S24_2022',46,44.35,2);
INSERT INTO `order_detail` VALUES (10102,'S18_1342',39,95.55,2);
INSERT INTO `order_detail` VALUES (10102,'S18_1367',41,43.13,1);
INSERT INTO `order_detail` VALUES (10103,'S10_1949',26,214.30,11);
INSERT INTO `order_detail` VALUES (10103,'S10_4962',42,119.67,4);
INSERT INTO `order_detail` VALUES (10103,'S12_1666',27,121.64,8);
INSERT INTO `order_detail` VALUES (10103,'S18_1097',35,94.50,10);
INSERT INTO `order_detail` VALUES (10103,'S18_2432',22,58.34,2);
INSERT INTO `order_detail` VALUES (10103,'S18_2949',27,92.19,12);
INSERT INTO `order_detail` VALUES (10103,'S18_2957',35,61.84,14);
INSERT INTO `order_detail` VALUES (10103,'S18_3136',25,86.92,13);
INSERT INTO `order_detail` VALUES (10103,'S18_3320',46,86.31,16);
INSERT INTO `order_detail` VALUES (10103,'S18_4600',36,98.07,5);
INSERT INTO `order_detail` VALUES (10103,'S18_4668',41,40.75,9);
INSERT INTO `order_detail` VALUES (10103,'S24_2300',36,107.34,1);
INSERT INTO `order_detail` VALUES (10103,'S24_4258',25,88.62,15);
INSERT INTO `order_detail` VALUES (10103,'S32_1268',31,92.46,3);
INSERT INTO `order_detail` VALUES (10103,'S32_3522',45,63.35,7);
INSERT INTO `order_detail` VALUES (10103,'S700_2824',42,94.07,6);
INSERT INTO `order_detail` VALUES (10104,'S12_3148',34,131.44,1);
INSERT INTO `order_detail` VALUES (10104,'S12_4473',41,111.39,9);
INSERT INTO `order_detail` VALUES (10104,'S18_2238',24,135.90,8);
INSERT INTO `order_detail` VALUES (10104,'S18_2319',29,122.73,12);
INSERT INTO `order_detail` VALUES (10104,'S18_3232',23,165.95,13);
INSERT INTO `order_detail` VALUES (10104,'S18_4027',38,119.20,3);
INSERT INTO `order_detail` VALUES (10104,'S24_1444',35,52.02,6);
INSERT INTO `order_detail` VALUES (10104,'S24_2840',44,30.41,10);
INSERT INTO `order_detail` VALUES (10104,'S24_4048',26,106.45,5);
INSERT INTO `order_detail` VALUES (10104,'S32_2509',35,51.95,11);
INSERT INTO `order_detail` VALUES (10104,'S32_3207',49,56.55,4);
INSERT INTO `order_detail` VALUES (10104,'S50_1392',33,114.59,7);
INSERT INTO `order_detail` VALUES (10104,'S50_1514',32,53.31,2);
INSERT INTO `order_detail` VALUES (10105,'S10_4757',50,127.84,2);
INSERT INTO `order_detail` VALUES (10105,'S12_1108',41,205.72,15);
INSERT INTO `order_detail` VALUES (10105,'S12_3891',29,141.88,14);
INSERT INTO `order_detail` VALUES (10105,'S18_3140',22,136.59,11);
INSERT INTO `order_detail` VALUES (10105,'S18_3259',38,87.73,13);
INSERT INTO `order_detail` VALUES (10105,'S18_4522',41,75.48,10);
INSERT INTO `order_detail` VALUES (10105,'S24_2011',43,117.97,9);
INSERT INTO `order_detail` VALUES (10105,'S24_3151',44,73.46,4);
INSERT INTO `order_detail` VALUES (10105,'S24_3816',50,75.47,1);
INSERT INTO `order_detail` VALUES (10105,'S700_1138',41,54.00,5);
INSERT INTO `order_detail` VALUES (10105,'S700_1938',29,86.61,12);
INSERT INTO `order_detail` VALUES (10105,'S700_2610',31,60.72,3);
INSERT INTO `order_detail` VALUES (10105,'S700_3505',39,92.16,6);
INSERT INTO `order_detail` VALUES (10105,'S700_3962',22,99.31,7);
INSERT INTO `order_detail` VALUES (10105,'S72_3212',25,44.77,8);
INSERT INTO `order_detail` VALUES (10106,'S18_1662',36,134.04,12);
INSERT INTO `order_detail` VALUES (10106,'S18_2581',34,81.10,2);
INSERT INTO `order_detail` VALUES (10106,'S18_3029',41,80.86,18);
INSERT INTO `order_detail` VALUES (10106,'S18_3856',41,94.22,17);
INSERT INTO `order_detail` VALUES (10106,'S24_1785',28,107.23,4);
INSERT INTO `order_detail` VALUES (10106,'S24_2841',49,65.77,13);
INSERT INTO `order_detail` VALUES (10106,'S24_3420',31,55.89,14);
INSERT INTO `order_detail` VALUES (10106,'S24_3949',50,55.96,11);
INSERT INTO `order_detail` VALUES (10106,'S24_4278',26,71.00,3);
INSERT INTO `order_detail` VALUES (10106,'S32_4289',33,65.35,5);
INSERT INTO `order_detail` VALUES (10106,'S50_1341',39,35.78,6);
INSERT INTO `order_detail` VALUES (10106,'S700_1691',31,91.34,7);
INSERT INTO `order_detail` VALUES (10106,'S700_2047',30,85.09,16);
INSERT INTO `order_detail` VALUES (10106,'S700_2466',34,99.72,9);
INSERT INTO `order_detail` VALUES (10106,'S700_2834',32,113.90,1);
INSERT INTO `order_detail` VALUES (10106,'S700_3167',44,76.00,8);
INSERT INTO `order_detail` VALUES (10106,'S700_4002',48,70.33,10);
INSERT INTO `order_detail` VALUES (10106,'S72_1253',48,43.70,15);
INSERT INTO `order_detail` VALUES (10107,'S10_1678',30,81.35,2);
INSERT INTO `order_detail` VALUES (10107,'S10_2016',39,105.86,5);
INSERT INTO `order_detail` VALUES (10107,'S10_4698',27,172.36,4);
INSERT INTO `order_detail` VALUES (10107,'S12_2823',21,122.00,1);
INSERT INTO `order_detail` VALUES (10107,'S18_2625',29,52.70,6);
INSERT INTO `order_detail` VALUES (10107,'S24_1578',25,96.92,3);
INSERT INTO `order_detail` VALUES (10107,'S24_2000',38,73.12,7);
INSERT INTO `order_detail` VALUES (10107,'S32_1374',20,88.90,8);
INSERT INTO `order_detail` VALUES (10108,'S12_1099',33,165.38,6);
INSERT INTO `order_detail` VALUES (10108,'S12_3380',45,96.30,4);
INSERT INTO `order_detail` VALUES (10108,'S12_3990',39,75.81,7);
INSERT INTO `order_detail` VALUES (10108,'S12_4675',36,107.10,3);
INSERT INTO `order_detail` VALUES (10108,'S18_1889',38,67.76,2);
INSERT INTO `order_detail` VALUES (10108,'S18_3278',26,73.17,9);
INSERT INTO `order_detail` VALUES (10108,'S18_3482',29,132.29,8);
INSERT INTO `order_detail` VALUES (10108,'S18_3782',43,52.84,12);
INSERT INTO `order_detail` VALUES (10108,'S18_4721',44,139.87,11);
INSERT INTO `order_detail` VALUES (10108,'S24_2360',35,64.41,15);
INSERT INTO `order_detail` VALUES (10108,'S24_3371',30,60.01,5);
INSERT INTO `order_detail` VALUES (10108,'S24_3856',40,132.00,1);
INSERT INTO `order_detail` VALUES (10108,'S24_4620',31,67.10,10);
INSERT INTO `order_detail` VALUES (10108,'S32_2206',27,36.21,13);
INSERT INTO `order_detail` VALUES (10108,'S32_4485',31,87.76,16);
INSERT INTO `order_detail` VALUES (10108,'S50_4713',34,74.85,14);
INSERT INTO `order_detail` VALUES (10109,'S18_1129',26,117.48,4);
INSERT INTO `order_detail` VALUES (10109,'S18_1984',38,137.98,3);
INSERT INTO `order_detail` VALUES (10109,'S18_2870',26,126.72,1);
INSERT INTO `order_detail` VALUES (10109,'S18_3232',46,160.87,5);
INSERT INTO `order_detail` VALUES (10109,'S18_3685',47,125.74,2);
INSERT INTO `order_detail` VALUES (10109,'S24_2972',29,32.10,6);
INSERT INTO `order_detail` VALUES (10110,'S18_1589',37,118.22,16);
INSERT INTO `order_detail` VALUES (10110,'S18_1749',42,153.00,7);
INSERT INTO `order_detail` VALUES (10110,'S18_2248',32,51.46,6);
INSERT INTO `order_detail` VALUES (10110,'S18_2325',33,115.69,4);
INSERT INTO `order_detail` VALUES (10110,'S18_2795',31,163.69,1);
INSERT INTO `order_detail` VALUES (10110,'S18_4409',28,81.91,8);
INSERT INTO `order_detail` VALUES (10110,'S18_4933',42,62.00,9);
INSERT INTO `order_detail` VALUES (10110,'S24_1046',36,72.02,13);
INSERT INTO `order_detail` VALUES (10110,'S24_1628',29,43.27,15);
INSERT INTO `order_detail` VALUES (10110,'S24_1937',20,28.88,3);
INSERT INTO `order_detail` VALUES (10110,'S24_2022',39,40.77,2);
INSERT INTO `order_detail` VALUES (10110,'S24_2766',43,82.69,11);
INSERT INTO `order_detail` VALUES (10110,'S24_2887',46,112.74,10);
INSERT INTO `order_detail` VALUES (10110,'S24_3191',27,80.47,12);
INSERT INTO `order_detail` VALUES (10110,'S24_3432',37,96.37,14);
INSERT INTO `order_detail` VALUES (10110,'S24_3969',48,35.29,5);
INSERT INTO `order_detail` VALUES (10111,'S18_1342',33,87.33,6);
INSERT INTO `order_detail` VALUES (10111,'S18_1367',48,48.52,5);
INSERT INTO `order_detail` VALUES (10111,'S18_2957',28,53.09,2);
INSERT INTO `order_detail` VALUES (10111,'S18_3136',43,94.25,1);
INSERT INTO `order_detail` VALUES (10111,'S18_3320',39,91.27,4);
INSERT INTO `order_detail` VALUES (10111,'S24_4258',26,85.70,3);
INSERT INTO `order_detail` VALUES (10112,'S10_1949',29,197.16,1);
INSERT INTO `order_detail` VALUES (10112,'S18_2949',23,85.10,2);
INSERT INTO `order_detail` VALUES (10113,'S12_1666',21,121.64,2);
INSERT INTO `order_detail` VALUES (10113,'S18_1097',49,101.50,4);
INSERT INTO `order_detail` VALUES (10113,'S18_4668',50,43.27,3);
INSERT INTO `order_detail` VALUES (10113,'S32_3522',23,58.82,1);
INSERT INTO `order_detail` VALUES (10114,'S10_4962',31,128.53,8);
INSERT INTO `order_detail` VALUES (10114,'S18_2319',39,106.78,3);
INSERT INTO `order_detail` VALUES (10114,'S18_2432',45,53.48,6);
INSERT INTO `order_detail` VALUES (10114,'S18_3232',48,169.34,4);
INSERT INTO `order_detail` VALUES (10114,'S18_4600',41,105.34,9);
INSERT INTO `order_detail` VALUES (10114,'S24_2300',21,102.23,5);
INSERT INTO `order_detail` VALUES (10114,'S24_2840',24,28.64,1);
INSERT INTO `order_detail` VALUES (10114,'S32_1268',32,88.61,7);
INSERT INTO `order_detail` VALUES (10114,'S32_2509',28,43.83,2);
INSERT INTO `order_detail` VALUES (10114,'S700_2824',42,82.94,10);
INSERT INTO `order_detail` VALUES (10115,'S12_4473',46,111.39,5);
INSERT INTO `order_detail` VALUES (10115,'S18_2238',46,140.81,4);
INSERT INTO `order_detail` VALUES (10115,'S24_1444',47,56.64,2);
INSERT INTO `order_detail` VALUES (10115,'S24_4048',44,106.45,1);
INSERT INTO `order_detail` VALUES (10115,'S50_1392',27,100.70,3);
INSERT INTO `order_detail` VALUES (10116,'S32_3207',27,60.28,1);
INSERT INTO `order_detail` VALUES (10117,'S12_1108',33,195.33,9);
INSERT INTO `order_detail` VALUES (10117,'S12_3148',43,148.06,10);
INSERT INTO `order_detail` VALUES (10117,'S12_3891',39,173.02,8);
INSERT INTO `order_detail` VALUES (10117,'S18_3140',26,121.57,5);
INSERT INTO `order_detail` VALUES (10117,'S18_3259',21,81.68,7);
INSERT INTO `order_detail` VALUES (10117,'S18_4027',22,122.08,12);
INSERT INTO `order_detail` VALUES (10117,'S18_4522',23,73.73,4);
INSERT INTO `order_detail` VALUES (10117,'S24_2011',41,119.20,3);
INSERT INTO `order_detail` VALUES (10117,'S50_1514',21,55.65,11);
INSERT INTO `order_detail` VALUES (10117,'S700_1938',38,75.35,6);
INSERT INTO `order_detail` VALUES (10117,'S700_3962',45,89.38,1);
INSERT INTO `order_detail` VALUES (10117,'S72_3212',50,52.42,2);
INSERT INTO `order_detail` VALUES (10118,'S700_3505',36,86.15,1);
INSERT INTO `order_detail` VALUES (10119,'S10_4757',46,112.88,11);
INSERT INTO `order_detail` VALUES (10119,'S18_1662',43,151.38,3);
INSERT INTO `order_detail` VALUES (10119,'S18_3029',21,74.84,9);
INSERT INTO `order_detail` VALUES (10119,'S18_3856',27,95.28,8);
INSERT INTO `order_detail` VALUES (10119,'S24_2841',41,64.40,4);
INSERT INTO `order_detail` VALUES (10119,'S24_3151',35,72.58,13);
INSERT INTO `order_detail` VALUES (10119,'S24_3420',20,63.12,5);
INSERT INTO `order_detail` VALUES (10119,'S24_3816',35,82.18,10);
INSERT INTO `order_detail` VALUES (10119,'S24_3949',28,62.10,2);
INSERT INTO `order_detail` VALUES (10119,'S700_1138',25,57.34,14);
INSERT INTO `order_detail` VALUES (10119,'S700_2047',29,74.23,7);
INSERT INTO `order_detail` VALUES (10119,'S700_2610',38,67.22,12);
INSERT INTO `order_detail` VALUES (10119,'S700_4002',26,63.67,1);
INSERT INTO `order_detail` VALUES (10119,'S72_1253',28,40.22,6);
INSERT INTO `order_detail` VALUES (10120,'S10_2016',29,118.94,3);
INSERT INTO `order_detail` VALUES (10120,'S10_4698',46,158.80,2);
INSERT INTO `order_detail` VALUES (10120,'S18_2581',29,82.79,8);
INSERT INTO `order_detail` VALUES (10120,'S18_2625',46,57.54,4);
INSERT INTO `order_detail` VALUES (10120,'S24_1578',35,110.45,1);
INSERT INTO `order_detail` VALUES (10120,'S24_1785',39,93.01,10);
INSERT INTO `order_detail` VALUES (10120,'S24_2000',34,72.36,5);
INSERT INTO `order_detail` VALUES (10120,'S24_4278',29,71.73,9);
INSERT INTO `order_detail` VALUES (10120,'S32_1374',22,94.90,6);
INSERT INTO `order_detail` VALUES (10120,'S32_4289',29,68.79,11);
INSERT INTO `order_detail` VALUES (10120,'S50_1341',49,41.46,12);
INSERT INTO `order_detail` VALUES (10120,'S700_1691',47,91.34,13);
INSERT INTO `order_detail` VALUES (10120,'S700_2466',24,81.77,15);
INSERT INTO `order_detail` VALUES (10120,'S700_2834',24,106.79,7);
INSERT INTO `order_detail` VALUES (10120,'S700_3167',43,72.00,14);
INSERT INTO `order_detail` VALUES (10121,'S10_1678',34,86.13,5);
INSERT INTO `order_detail` VALUES (10121,'S12_2823',50,126.52,4);
INSERT INTO `order_detail` VALUES (10121,'S24_2360',32,58.18,2);
INSERT INTO `order_detail` VALUES (10121,'S32_4485',25,95.93,3);
INSERT INTO `order_detail` VALUES (10121,'S50_4713',44,72.41,1);
INSERT INTO `order_detail` VALUES (10122,'S12_1099',42,155.66,10);
INSERT INTO `order_detail` VALUES (10122,'S12_3380',37,113.92,8);
INSERT INTO `order_detail` VALUES (10122,'S12_3990',32,65.44,11);
INSERT INTO `order_detail` VALUES (10122,'S12_4675',20,104.80,7);
INSERT INTO `order_detail` VALUES (10122,'S18_1129',34,114.65,2);
INSERT INTO `order_detail` VALUES (10122,'S18_1889',43,62.37,6);
INSERT INTO `order_detail` VALUES (10122,'S18_1984',31,113.80,1);
INSERT INTO `order_detail` VALUES (10122,'S18_3232',25,137.17,3);
INSERT INTO `order_detail` VALUES (10122,'S18_3278',21,69.15,13);
INSERT INTO `order_detail` VALUES (10122,'S18_3482',21,133.76,12);
INSERT INTO `order_detail` VALUES (10122,'S18_3782',35,59.06,16);
INSERT INTO `order_detail` VALUES (10122,'S18_4721',28,145.82,15);
INSERT INTO `order_detail` VALUES (10122,'S24_2972',39,34.74,4);
INSERT INTO `order_detail` VALUES (10122,'S24_3371',34,50.82,9);
INSERT INTO `order_detail` VALUES (10122,'S24_3856',43,136.22,5);
INSERT INTO `order_detail` VALUES (10122,'S24_4620',29,67.10,14);
INSERT INTO `order_detail` VALUES (10122,'S32_2206',31,33.79,17);
INSERT INTO `order_detail` VALUES (10123,'S18_1589',26,120.71,2);
INSERT INTO `order_detail` VALUES (10123,'S18_2870',46,114.84,3);
INSERT INTO `order_detail` VALUES (10123,'S18_3685',34,117.26,4);
INSERT INTO `order_detail` VALUES (10123,'S24_1628',50,43.27,1);
INSERT INTO `order_detail` VALUES (10124,'S18_1749',21,153.00,6);
INSERT INTO `order_detail` VALUES (10124,'S18_2248',42,58.12,5);
INSERT INTO `order_detail` VALUES (10124,'S18_2325',42,111.87,3);
INSERT INTO `order_detail` VALUES (10124,'S18_4409',36,75.46,7);
INSERT INTO `order_detail` VALUES (10124,'S18_4933',23,66.28,8);
INSERT INTO `order_detail` VALUES (10124,'S24_1046',22,62.47,12);
INSERT INTO `order_detail` VALUES (10124,'S24_1937',45,30.53,2);
INSERT INTO `order_detail` VALUES (10124,'S24_2022',22,36.29,1);
INSERT INTO `order_detail` VALUES (10124,'S24_2766',32,74.51,10);
INSERT INTO `order_detail` VALUES (10124,'S24_2887',25,93.95,9);
INSERT INTO `order_detail` VALUES (10124,'S24_3191',49,76.19,11);
INSERT INTO `order_detail` VALUES (10124,'S24_3432',43,101.73,13);
INSERT INTO `order_detail` VALUES (10124,'S24_3969',46,36.11,4);
INSERT INTO `order_detail` VALUES (10125,'S18_1342',32,89.38,1);
INSERT INTO `order_detail` VALUES (10125,'S18_2795',34,138.38,2);
INSERT INTO `order_detail` VALUES (10126,'S10_1949',38,205.73,11);
INSERT INTO `order_detail` VALUES (10126,'S10_4962',22,122.62,4);
INSERT INTO `order_detail` VALUES (10126,'S12_1666',21,135.30,8);
INSERT INTO `order_detail` VALUES (10126,'S18_1097',38,116.67,10);
INSERT INTO `order_detail` VALUES (10126,'S18_1367',42,51.21,17);
INSERT INTO `order_detail` VALUES (10126,'S18_2432',43,51.05,2);
INSERT INTO `order_detail` VALUES (10126,'S18_2949',31,93.21,12);
INSERT INTO `order_detail` VALUES (10126,'S18_2957',46,61.84,14);
INSERT INTO `order_detail` VALUES (10126,'S18_3136',30,93.20,13);
INSERT INTO `order_detail` VALUES (10126,'S18_3320',38,94.25,16);
INSERT INTO `order_detail` VALUES (10126,'S18_4600',50,102.92,5);
INSERT INTO `order_detail` VALUES (10126,'S18_4668',43,47.29,9);
INSERT INTO `order_detail` VALUES (10126,'S24_2300',27,122.68,1);
INSERT INTO `order_detail` VALUES (10126,'S24_4258',34,83.76,15);
INSERT INTO `order_detail` VALUES (10126,'S32_1268',43,82.83,3);
INSERT INTO `order_detail` VALUES (10126,'S32_3522',26,62.05,7);
INSERT INTO `order_detail` VALUES (10126,'S700_2824',45,97.10,6);
INSERT INTO `order_detail` VALUES (10127,'S12_1108',46,193.25,2);
INSERT INTO `order_detail` VALUES (10127,'S12_3148',46,140.50,3);
INSERT INTO `order_detail` VALUES (10127,'S12_3891',42,169.56,1);
INSERT INTO `order_detail` VALUES (10127,'S12_4473',24,100.73,11);
INSERT INTO `order_detail` VALUES (10127,'S18_2238',45,140.81,10);
INSERT INTO `order_detail` VALUES (10127,'S18_2319',45,114.14,14);
INSERT INTO `order_detail` VALUES (10127,'S18_3232',22,149.02,15);
INSERT INTO `order_detail` VALUES (10127,'S18_4027',25,126.39,5);
INSERT INTO `order_detail` VALUES (10127,'S24_1444',20,50.86,8);
INSERT INTO `order_detail` VALUES (10127,'S24_2840',39,34.30,12);
INSERT INTO `order_detail` VALUES (10127,'S24_4048',20,107.63,7);
INSERT INTO `order_detail` VALUES (10127,'S32_2509',45,46.53,13);
INSERT INTO `order_detail` VALUES (10127,'S32_3207',29,60.90,6);
INSERT INTO `order_detail` VALUES (10127,'S50_1392',46,111.12,9);
INSERT INTO `order_detail` VALUES (10127,'S50_1514',46,55.65,4);
INSERT INTO `order_detail` VALUES (10128,'S18_3140',41,120.20,2);
INSERT INTO `order_detail` VALUES (10128,'S18_3259',41,80.67,4);
INSERT INTO `order_detail` VALUES (10128,'S18_4522',43,77.24,1);
INSERT INTO `order_detail` VALUES (10128,'S700_1938',32,72.75,3);
INSERT INTO `order_detail` VALUES (10129,'S10_4757',33,123.76,2);
INSERT INTO `order_detail` VALUES (10129,'S24_2011',45,113.06,9);
INSERT INTO `order_detail` VALUES (10129,'S24_3151',41,81.43,4);
INSERT INTO `order_detail` VALUES (10129,'S24_3816',50,76.31,1);
INSERT INTO `order_detail` VALUES (10129,'S700_1138',31,58.67,5);
INSERT INTO `order_detail` VALUES (10129,'S700_2610',45,72.28,3);
INSERT INTO `order_detail` VALUES (10129,'S700_3505',42,90.15,6);
INSERT INTO `order_detail` VALUES (10129,'S700_3962',30,94.34,7);
INSERT INTO `order_detail` VALUES (10129,'S72_3212',32,44.23,8);
INSERT INTO `order_detail` VALUES (10130,'S18_3029',40,68.82,2);
INSERT INTO `order_detail` VALUES (10130,'S18_3856',33,99.52,1);
INSERT INTO `order_detail` VALUES (10131,'S18_1662',21,141.92,4);
INSERT INTO `order_detail` VALUES (10131,'S24_2841',35,60.97,5);
INSERT INTO `order_detail` VALUES (10131,'S24_3420',29,52.60,6);
INSERT INTO `order_detail` VALUES (10131,'S24_3949',50,54.59,3);
INSERT INTO `order_detail` VALUES (10131,'S700_2047',22,76.94,8);
INSERT INTO `order_detail` VALUES (10131,'S700_2466',40,86.76,1);
INSERT INTO `order_detail` VALUES (10131,'S700_4002',26,63.67,2);
INSERT INTO `order_detail` VALUES (10131,'S72_1253',21,40.22,7);
INSERT INTO `order_detail` VALUES (10132,'S700_3167',36,80.00,1);
INSERT INTO `order_detail` VALUES (10133,'S18_2581',49,80.26,3);
INSERT INTO `order_detail` VALUES (10133,'S24_1785',41,109.42,5);
INSERT INTO `order_detail` VALUES (10133,'S24_4278',46,61.58,4);
INSERT INTO `order_detail` VALUES (10133,'S32_1374',23,80.91,1);
INSERT INTO `order_detail` VALUES (10133,'S32_4289',49,67.41,6);
INSERT INTO `order_detail` VALUES (10133,'S50_1341',27,37.09,7);
INSERT INTO `order_detail` VALUES (10133,'S700_1691',24,76.73,8);
INSERT INTO `order_detail` VALUES (10133,'S700_2834',27,115.09,2);
INSERT INTO `order_detail` VALUES (10134,'S10_1678',41,90.92,2);
INSERT INTO `order_detail` VALUES (10134,'S10_2016',27,116.56,5);
INSERT INTO `order_detail` VALUES (10134,'S10_4698',31,187.85,4);
INSERT INTO `order_detail` VALUES (10134,'S12_2823',20,131.04,1);
INSERT INTO `order_detail` VALUES (10134,'S18_2625',30,51.48,6);
INSERT INTO `order_detail` VALUES (10134,'S24_1578',35,94.67,3);
INSERT INTO `order_detail` VALUES (10134,'S24_2000',43,75.41,7);
INSERT INTO `order_detail` VALUES (10135,'S12_1099',42,173.17,7);
INSERT INTO `order_detail` VALUES (10135,'S12_3380',48,110.39,5);
INSERT INTO `order_detail` VALUES (10135,'S12_3990',24,72.62,8);
INSERT INTO `order_detail` VALUES (10135,'S12_4675',29,103.64,4);
INSERT INTO `order_detail` VALUES (10135,'S18_1889',48,66.99,3);
INSERT INTO `order_detail` VALUES (10135,'S18_3278',45,65.94,10);
INSERT INTO `order_detail` VALUES (10135,'S18_3482',42,139.64,9);
INSERT INTO `order_detail` VALUES (10135,'S18_3782',45,49.74,13);
INSERT INTO `order_detail` VALUES (10135,'S18_4721',31,133.92,12);
INSERT INTO `order_detail` VALUES (10135,'S24_2360',29,67.18,16);
INSERT INTO `order_detail` VALUES (10135,'S24_2972',20,34.36,1);
INSERT INTO `order_detail` VALUES (10135,'S24_3371',27,52.05,6);
INSERT INTO `order_detail` VALUES (10135,'S24_3856',47,139.03,2);
INSERT INTO `order_detail` VALUES (10135,'S24_4620',23,76.80,11);
INSERT INTO `order_detail` VALUES (10135,'S32_2206',33,38.62,14);
INSERT INTO `order_detail` VALUES (10135,'S32_4485',30,91.85,17);
INSERT INTO `order_detail` VALUES (10135,'S50_4713',44,78.92,15);
INSERT INTO `order_detail` VALUES (10136,'S18_1129',25,117.48,2);
INSERT INTO `order_detail` VALUES (10136,'S18_1984',36,120.91,1);
INSERT INTO `order_detail` VALUES (10136,'S18_3232',41,169.34,3);
INSERT INTO `order_detail` VALUES (10137,'S18_1589',44,115.73,2);
INSERT INTO `order_detail` VALUES (10137,'S18_2870',37,110.88,3);
INSERT INTO `order_detail` VALUES (10137,'S18_3685',31,118.68,4);
INSERT INTO `order_detail` VALUES (10137,'S24_1628',26,40.25,1);
INSERT INTO `order_detail` VALUES (10138,'S18_1749',33,149.60,6);
INSERT INTO `order_detail` VALUES (10138,'S18_2248',22,51.46,5);
INSERT INTO `order_detail` VALUES (10138,'S18_2325',38,114.42,3);
INSERT INTO `order_detail` VALUES (10138,'S18_4409',47,79.15,7);
INSERT INTO `order_detail` VALUES (10138,'S18_4933',23,64.86,8);
INSERT INTO `order_detail` VALUES (10138,'S24_1046',45,59.53,12);
INSERT INTO `order_detail` VALUES (10138,'S24_1937',22,33.19,2);
INSERT INTO `order_detail` VALUES (10138,'S24_2022',33,38.53,1);
INSERT INTO `order_detail` VALUES (10138,'S24_2766',28,73.60,10);
INSERT INTO `order_detail` VALUES (10138,'S24_2887',30,96.30,9);
INSERT INTO `order_detail` VALUES (10138,'S24_3191',49,77.05,11);
INSERT INTO `order_detail` VALUES (10138,'S24_3432',21,99.58,13);
INSERT INTO `order_detail` VALUES (10138,'S24_3969',29,32.82,4);
INSERT INTO `order_detail` VALUES (10139,'S18_1342',31,89.38,7);
INSERT INTO `order_detail` VALUES (10139,'S18_1367',49,52.83,6);
INSERT INTO `order_detail` VALUES (10139,'S18_2795',41,151.88,8);
INSERT INTO `order_detail` VALUES (10139,'S18_2949',46,91.18,1);
INSERT INTO `order_detail` VALUES (10139,'S18_2957',20,52.47,3);
INSERT INTO `order_detail` VALUES (10139,'S18_3136',20,101.58,2);
INSERT INTO `order_detail` VALUES (10139,'S18_3320',30,81.35,5);
INSERT INTO `order_detail` VALUES (10139,'S24_4258',29,93.49,4);
INSERT INTO `order_detail` VALUES (10140,'S10_1949',37,186.44,11);
INSERT INTO `order_detail` VALUES (10140,'S10_4962',26,131.49,4);
INSERT INTO `order_detail` VALUES (10140,'S12_1666',38,118.90,8);
INSERT INTO `order_detail` VALUES (10140,'S18_1097',32,95.67,10);
INSERT INTO `order_detail` VALUES (10140,'S18_2432',46,51.05,2);
INSERT INTO `order_detail` VALUES (10140,'S18_4600',40,100.50,5);
INSERT INTO `order_detail` VALUES (10140,'S18_4668',29,40.25,9);
INSERT INTO `order_detail` VALUES (10140,'S24_2300',47,118.84,1);
INSERT INTO `order_detail` VALUES (10140,'S32_1268',26,87.64,3);
INSERT INTO `order_detail` VALUES (10140,'S32_3522',28,62.05,7);
INSERT INTO `order_detail` VALUES (10140,'S700_2824',36,101.15,6);
INSERT INTO `order_detail` VALUES (10141,'S12_4473',21,114.95,5);
INSERT INTO `order_detail` VALUES (10141,'S18_2238',39,160.46,4);
INSERT INTO `order_detail` VALUES (10141,'S18_2319',47,103.09,8);
INSERT INTO `order_detail` VALUES (10141,'S18_3232',34,143.94,9);
INSERT INTO `order_detail` VALUES (10141,'S24_1444',20,50.86,2);
INSERT INTO `order_detail` VALUES (10141,'S24_2840',21,32.18,6);
INSERT INTO `order_detail` VALUES (10141,'S24_4048',40,104.09,1);
INSERT INTO `order_detail` VALUES (10141,'S32_2509',24,53.03,7);
INSERT INTO `order_detail` VALUES (10141,'S50_1392',44,94.92,3);
INSERT INTO `order_detail` VALUES (10142,'S12_1108',33,166.24,12);
INSERT INTO `order_detail` VALUES (10142,'S12_3148',33,140.50,13);
INSERT INTO `order_detail` VALUES (10142,'S12_3891',46,167.83,11);
INSERT INTO `order_detail` VALUES (10142,'S18_3140',47,129.76,8);
INSERT INTO `order_detail` VALUES (10142,'S18_3259',22,95.80,10);
INSERT INTO `order_detail` VALUES (10142,'S18_4027',24,122.08,15);
INSERT INTO `order_detail` VALUES (10142,'S18_4522',24,79.87,7);
INSERT INTO `order_detail` VALUES (10142,'S24_2011',33,114.29,6);
INSERT INTO `order_detail` VALUES (10142,'S24_3151',49,74.35,1);
INSERT INTO `order_detail` VALUES (10142,'S32_3207',42,60.90,16);
INSERT INTO `order_detail` VALUES (10142,'S50_1514',42,56.24,14);
INSERT INTO `order_detail` VALUES (10142,'S700_1138',41,55.34,2);
INSERT INTO `order_detail` VALUES (10142,'S700_1938',43,77.08,9);
INSERT INTO `order_detail` VALUES (10142,'S700_3505',21,92.16,3);
INSERT INTO `order_detail` VALUES (10142,'S700_3962',38,91.37,4);
INSERT INTO `order_detail` VALUES (10142,'S72_3212',39,46.96,5);
INSERT INTO `order_detail` VALUES (10143,'S10_4757',49,133.28,15);
INSERT INTO `order_detail` VALUES (10143,'S18_1662',32,126.15,7);
INSERT INTO `order_detail` VALUES (10143,'S18_3029',46,70.54,13);
INSERT INTO `order_detail` VALUES (10143,'S18_3856',34,99.52,12);
INSERT INTO `order_detail` VALUES (10143,'S24_2841',27,63.71,8);
INSERT INTO `order_detail` VALUES (10143,'S24_3420',33,59.83,9);
INSERT INTO `order_detail` VALUES (10143,'S24_3816',23,74.64,14);
INSERT INTO `order_detail` VALUES (10143,'S24_3949',28,55.96,6);
INSERT INTO `order_detail` VALUES (10143,'S50_1341',34,34.91,1);
INSERT INTO `order_detail` VALUES (10143,'S700_1691',36,86.77,2);
INSERT INTO `order_detail` VALUES (10143,'S700_2047',26,87.80,11);
INSERT INTO `order_detail` VALUES (10143,'S700_2466',26,79.78,4);
INSERT INTO `order_detail` VALUES (10143,'S700_2610',31,69.39,16);
INSERT INTO `order_detail` VALUES (10143,'S700_3167',28,70.40,3);
INSERT INTO `order_detail` VALUES (10143,'S700_4002',34,65.15,5);
INSERT INTO `order_detail` VALUES (10143,'S72_1253',37,49.66,10);
INSERT INTO `order_detail` VALUES (10144,'S32_4289',20,56.41,1);
INSERT INTO `order_detail` VALUES (10145,'S10_1678',45,76.56,6);
INSERT INTO `order_detail` VALUES (10145,'S10_2016',37,104.67,9);
INSERT INTO `order_detail` VALUES (10145,'S10_4698',33,154.93,8);
INSERT INTO `order_detail` VALUES (10145,'S12_2823',49,146.10,5);
INSERT INTO `order_detail` VALUES (10145,'S18_2581',30,71.81,14);
INSERT INTO `order_detail` VALUES (10145,'S18_2625',30,52.70,10);
INSERT INTO `order_detail` VALUES (10145,'S24_1578',43,103.68,7);
INSERT INTO `order_detail` VALUES (10145,'S24_1785',40,87.54,16);
INSERT INTO `order_detail` VALUES (10145,'S24_2000',47,63.98,11);
INSERT INTO `order_detail` VALUES (10145,'S24_2360',27,56.10,3);
INSERT INTO `order_detail` VALUES (10145,'S24_4278',33,71.73,15);
INSERT INTO `order_detail` VALUES (10145,'S32_1374',33,99.89,12);
INSERT INTO `order_detail` VALUES (10145,'S32_2206',31,39.43,1);
INSERT INTO `order_detail` VALUES (10145,'S32_4485',27,95.93,4);
INSERT INTO `order_detail` VALUES (10145,'S50_4713',38,73.22,2);
INSERT INTO `order_detail` VALUES (10145,'S700_2834',20,113.90,13);
INSERT INTO `order_detail` VALUES (10146,'S18_3782',47,60.30,2);
INSERT INTO `order_detail` VALUES (10146,'S18_4721',29,130.94,1);
INSERT INTO `order_detail` VALUES (10147,'S12_1099',48,161.49,7);
INSERT INTO `order_detail` VALUES (10147,'S12_3380',31,110.39,5);
INSERT INTO `order_detail` VALUES (10147,'S12_3990',21,74.21,8);
INSERT INTO `order_detail` VALUES (10147,'S12_4675',33,97.89,4);
INSERT INTO `order_detail` VALUES (10147,'S18_1889',26,70.84,3);
INSERT INTO `order_detail` VALUES (10147,'S18_3278',36,74.78,10);
INSERT INTO `order_detail` VALUES (10147,'S18_3482',37,129.35,9);
INSERT INTO `order_detail` VALUES (10147,'S24_2972',25,33.23,1);
INSERT INTO `order_detail` VALUES (10147,'S24_3371',30,48.98,6);
INSERT INTO `order_detail` VALUES (10147,'S24_3856',23,123.58,2);
INSERT INTO `order_detail` VALUES (10147,'S24_4620',31,72.76,11);
INSERT INTO `order_detail` VALUES (10148,'S18_1129',23,114.65,13);
INSERT INTO `order_detail` VALUES (10148,'S18_1589',47,108.26,9);
INSERT INTO `order_detail` VALUES (10148,'S18_1984',25,136.56,12);
INSERT INTO `order_detail` VALUES (10148,'S18_2870',27,113.52,10);
INSERT INTO `order_detail` VALUES (10148,'S18_3232',32,143.94,14);
INSERT INTO `order_detail` VALUES (10148,'S18_3685',28,135.63,11);
INSERT INTO `order_detail` VALUES (10148,'S18_4409',34,83.75,1);
INSERT INTO `order_detail` VALUES (10148,'S18_4933',29,66.28,2);
INSERT INTO `order_detail` VALUES (10148,'S24_1046',25,65.41,6);
INSERT INTO `order_detail` VALUES (10148,'S24_1628',47,46.29,8);
INSERT INTO `order_detail` VALUES (10148,'S24_2766',21,77.24,4);
INSERT INTO `order_detail` VALUES (10148,'S24_2887',34,115.09,3);
INSERT INTO `order_detail` VALUES (10148,'S24_3191',31,71.91,5);
INSERT INTO `order_detail` VALUES (10148,'S24_3432',27,96.37,7);
INSERT INTO `order_detail` VALUES (10149,'S18_1342',50,87.33,4);
INSERT INTO `order_detail` VALUES (10149,'S18_1367',30,48.52,3);
INSERT INTO `order_detail` VALUES (10149,'S18_1749',34,156.40,11);
INSERT INTO `order_detail` VALUES (10149,'S18_2248',24,50.85,10);
INSERT INTO `order_detail` VALUES (10149,'S18_2325',33,125.86,8);
INSERT INTO `order_detail` VALUES (10149,'S18_2795',23,167.06,5);
INSERT INTO `order_detail` VALUES (10149,'S18_3320',42,89.29,2);
INSERT INTO `order_detail` VALUES (10149,'S24_1937',36,31.20,7);
INSERT INTO `order_detail` VALUES (10149,'S24_2022',49,39.87,6);
INSERT INTO `order_detail` VALUES (10149,'S24_3969',26,38.57,9);
INSERT INTO `order_detail` VALUES (10149,'S24_4258',20,90.57,1);
INSERT INTO `order_detail` VALUES (10150,'S10_1949',45,182.16,8);
INSERT INTO `order_detail` VALUES (10150,'S10_4962',20,121.15,1);
INSERT INTO `order_detail` VALUES (10150,'S12_1666',30,135.30,5);
INSERT INTO `order_detail` VALUES (10150,'S18_1097',34,95.67,7);
INSERT INTO `order_detail` VALUES (10150,'S18_2949',47,93.21,9);
INSERT INTO `order_detail` VALUES (10150,'S18_2957',30,56.21,11);
INSERT INTO `order_detail` VALUES (10150,'S18_3136',26,97.39,10);
INSERT INTO `order_detail` VALUES (10150,'S18_4600',49,111.39,2);
INSERT INTO `order_detail` VALUES (10150,'S18_4668',30,47.29,6);
INSERT INTO `order_detail` VALUES (10150,'S32_3522',49,62.05,4);
INSERT INTO `order_detail` VALUES (10150,'S700_2824',20,95.08,3);
INSERT INTO `order_detail` VALUES (10151,'S12_4473',24,114.95,3);
INSERT INTO `order_detail` VALUES (10151,'S18_2238',43,152.27,2);
INSERT INTO `order_detail` VALUES (10151,'S18_2319',49,106.78,6);
INSERT INTO `order_detail` VALUES (10151,'S18_2432',39,58.34,9);
INSERT INTO `order_detail` VALUES (10151,'S18_3232',21,167.65,7);
INSERT INTO `order_detail` VALUES (10151,'S24_2300',42,109.90,8);
INSERT INTO `order_detail` VALUES (10151,'S24_2840',30,29.35,4);
INSERT INTO `order_detail` VALUES (10151,'S32_1268',27,84.75,10);
INSERT INTO `order_detail` VALUES (10151,'S32_2509',41,43.29,5);
INSERT INTO `order_detail` VALUES (10151,'S50_1392',26,108.81,1);
INSERT INTO `order_detail` VALUES (10152,'S18_4027',35,117.77,1);
INSERT INTO `order_detail` VALUES (10152,'S24_1444',25,49.13,4);
INSERT INTO `order_detail` VALUES (10152,'S24_4048',23,112.37,3);
INSERT INTO `order_detail` VALUES (10152,'S32_3207',33,57.17,2);
INSERT INTO `order_detail` VALUES (10153,'S12_1108',20,201.57,11);
INSERT INTO `order_detail` VALUES (10153,'S12_3148',42,128.42,12);
INSERT INTO `order_detail` VALUES (10153,'S12_3891',49,155.72,10);
INSERT INTO `order_detail` VALUES (10153,'S18_3140',31,125.66,7);
INSERT INTO `order_detail` VALUES (10153,'S18_3259',29,82.69,9);
INSERT INTO `order_detail` VALUES (10153,'S18_4522',22,82.50,6);
INSERT INTO `order_detail` VALUES (10153,'S24_2011',40,111.83,5);
INSERT INTO `order_detail` VALUES (10153,'S50_1514',31,53.31,13);
INSERT INTO `order_detail` VALUES (10153,'S700_1138',43,58.00,1);
INSERT INTO `order_detail` VALUES (10153,'S700_1938',31,80.55,8);
INSERT INTO `order_detail` VALUES (10153,'S700_3505',50,87.15,2);
INSERT INTO `order_detail` VALUES (10153,'S700_3962',20,85.41,3);
INSERT INTO `order_detail` VALUES (10153,'S72_3212',50,51.87,4);
INSERT INTO `order_detail` VALUES (10154,'S24_3151',31,75.23,2);
INSERT INTO `order_detail` VALUES (10154,'S700_2610',36,59.27,1);
INSERT INTO `order_detail` VALUES (10155,'S10_4757',32,129.20,13);
INSERT INTO `order_detail` VALUES (10155,'S18_1662',38,138.77,5);
INSERT INTO `order_detail` VALUES (10155,'S18_3029',44,83.44,11);
INSERT INTO `order_detail` VALUES (10155,'S18_3856',29,105.87,10);
INSERT INTO `order_detail` VALUES (10155,'S24_2841',23,62.34,6);
INSERT INTO `order_detail` VALUES (10155,'S24_3420',34,56.55,7);
INSERT INTO `order_detail` VALUES (10155,'S24_3816',37,76.31,12);
INSERT INTO `order_detail` VALUES (10155,'S24_3949',44,58.69,4);
INSERT INTO `order_detail` VALUES (10155,'S700_2047',32,89.61,9);
INSERT INTO `order_detail` VALUES (10155,'S700_2466',20,87.75,2);
INSERT INTO `order_detail` VALUES (10155,'S700_3167',43,76.80,1);
INSERT INTO `order_detail` VALUES (10155,'S700_4002',44,70.33,3);
INSERT INTO `order_detail` VALUES (10155,'S72_1253',34,49.16,8);
INSERT INTO `order_detail` VALUES (10156,'S50_1341',20,43.64,1);
INSERT INTO `order_detail` VALUES (10156,'S700_1691',48,77.64,2);
INSERT INTO `order_detail` VALUES (10157,'S18_2581',33,69.27,3);
INSERT INTO `order_detail` VALUES (10157,'S24_1785',40,89.72,5);
INSERT INTO `order_detail` VALUES (10157,'S24_4278',33,66.65,4);
INSERT INTO `order_detail` VALUES (10157,'S32_1374',34,83.91,1);
INSERT INTO `order_detail` VALUES (10157,'S32_4289',28,56.41,6);
INSERT INTO `order_detail` VALUES (10157,'S700_2834',48,109.16,2);
INSERT INTO `order_detail` VALUES (10158,'S24_2000',22,67.79,1);
INSERT INTO `order_detail` VALUES (10159,'S10_1678',49,81.35,14);
INSERT INTO `order_detail` VALUES (10159,'S10_2016',37,101.10,17);
INSERT INTO `order_detail` VALUES (10159,'S10_4698',22,170.42,16);
INSERT INTO `order_detail` VALUES (10159,'S12_1099',41,188.73,2);
INSERT INTO `order_detail` VALUES (10159,'S12_2823',38,131.04,13);
INSERT INTO `order_detail` VALUES (10159,'S12_3990',24,67.03,3);
INSERT INTO `order_detail` VALUES (10159,'S18_2625',42,51.48,18);
INSERT INTO `order_detail` VALUES (10159,'S18_3278',21,66.74,5);
INSERT INTO `order_detail` VALUES (10159,'S18_3482',25,129.35,4);
INSERT INTO `order_detail` VALUES (10159,'S18_3782',21,54.71,8);
INSERT INTO `order_detail` VALUES (10159,'S18_4721',32,142.85,7);
INSERT INTO `order_detail` VALUES (10159,'S24_1578',44,100.30,15);
INSERT INTO `order_detail` VALUES (10159,'S24_2360',27,67.18,11);
INSERT INTO `order_detail` VALUES (10159,'S24_3371',50,49.60,1);
INSERT INTO `order_detail` VALUES (10159,'S24_4620',23,80.84,6);
INSERT INTO `order_detail` VALUES (10159,'S32_2206',35,39.43,9);
INSERT INTO `order_detail` VALUES (10159,'S32_4485',23,86.74,12);
INSERT INTO `order_detail` VALUES (10159,'S50_4713',31,78.11,10);
INSERT INTO `order_detail` VALUES (10160,'S12_3380',46,96.30,6);
INSERT INTO `order_detail` VALUES (10160,'S12_4675',50,93.28,5);
INSERT INTO `order_detail` VALUES (10160,'S18_1889',38,70.84,4);
INSERT INTO `order_detail` VALUES (10160,'S18_3232',20,140.55,1);
INSERT INTO `order_detail` VALUES (10160,'S24_2972',42,30.59,2);
INSERT INTO `order_detail` VALUES (10160,'S24_3856',35,130.60,3);
INSERT INTO `order_detail` VALUES (10161,'S18_1129',28,121.72,12);
INSERT INTO `order_detail` VALUES (10161,'S18_1589',43,102.04,8);
INSERT INTO `order_detail` VALUES (10161,'S18_1984',48,139.41,11);
INSERT INTO `order_detail` VALUES (10161,'S18_2870',23,125.40,9);
INSERT INTO `order_detail` VALUES (10161,'S18_3685',36,132.80,10);
INSERT INTO `order_detail` VALUES (10161,'S18_4933',25,62.72,1);
INSERT INTO `order_detail` VALUES (10161,'S24_1046',37,73.49,5);
INSERT INTO `order_detail` VALUES (10161,'S24_1628',23,47.29,7);
INSERT INTO `order_detail` VALUES (10161,'S24_2766',20,82.69,3);
INSERT INTO `order_detail` VALUES (10161,'S24_2887',25,108.04,2);
INSERT INTO `order_detail` VALUES (10161,'S24_3191',20,72.77,4);
INSERT INTO `order_detail` VALUES (10161,'S24_3432',30,94.23,6);
INSERT INTO `order_detail` VALUES (10162,'S18_1342',48,87.33,2);
INSERT INTO `order_detail` VALUES (10162,'S18_1367',45,45.28,1);
INSERT INTO `order_detail` VALUES (10162,'S18_1749',29,141.10,9);
INSERT INTO `order_detail` VALUES (10162,'S18_2248',27,53.28,8);
INSERT INTO `order_detail` VALUES (10162,'S18_2325',38,113.15,6);
INSERT INTO `order_detail` VALUES (10162,'S18_2795',48,156.94,3);
INSERT INTO `order_detail` VALUES (10162,'S18_4409',39,86.51,10);
INSERT INTO `order_detail` VALUES (10162,'S24_1937',37,27.55,5);
INSERT INTO `order_detail` VALUES (10162,'S24_2022',43,38.98,4);
INSERT INTO `order_detail` VALUES (10162,'S24_3969',37,32.82,7);
INSERT INTO `order_detail` VALUES (10163,'S10_1949',21,212.16,1);
INSERT INTO `order_detail` VALUES (10163,'S18_2949',31,101.31,2);
INSERT INTO `order_detail` VALUES (10163,'S18_2957',48,59.96,4);
INSERT INTO `order_detail` VALUES (10163,'S18_3136',40,101.58,3);
INSERT INTO `order_detail` VALUES (10163,'S18_3320',43,80.36,6);
INSERT INTO `order_detail` VALUES (10163,'S24_4258',42,96.42,5);
INSERT INTO `order_detail` VALUES (10164,'S10_4962',21,143.31,2);
INSERT INTO `order_detail` VALUES (10164,'S12_1666',49,121.64,6);
INSERT INTO `order_detail` VALUES (10164,'S18_1097',36,103.84,8);
INSERT INTO `order_detail` VALUES (10164,'S18_4600',45,107.76,3);
INSERT INTO `order_detail` VALUES (10164,'S18_4668',25,46.29,7);
INSERT INTO `order_detail` VALUES (10164,'S32_1268',24,91.49,1);
INSERT INTO `order_detail` VALUES (10164,'S32_3522',49,57.53,5);
INSERT INTO `order_detail` VALUES (10164,'S700_2824',39,86.99,4);
INSERT INTO `order_detail` VALUES (10165,'S12_1108',44,168.32,3);
INSERT INTO `order_detail` VALUES (10165,'S12_3148',34,123.89,4);
INSERT INTO `order_detail` VALUES (10165,'S12_3891',27,152.26,2);
INSERT INTO `order_detail` VALUES (10165,'S12_4473',48,109.02,12);
INSERT INTO `order_detail` VALUES (10165,'S18_2238',29,134.26,11);
INSERT INTO `order_detail` VALUES (10165,'S18_2319',46,120.28,15);
INSERT INTO `order_detail` VALUES (10165,'S18_2432',31,60.77,18);
INSERT INTO `order_detail` VALUES (10165,'S18_3232',47,154.10,16);
INSERT INTO `order_detail` VALUES (10165,'S18_3259',50,84.71,1);
INSERT INTO `order_detail` VALUES (10165,'S18_4027',28,123.51,6);
INSERT INTO `order_detail` VALUES (10165,'S24_1444',25,46.82,9);
INSERT INTO `order_detail` VALUES (10165,'S24_2300',32,117.57,17);
INSERT INTO `order_detail` VALUES (10165,'S24_2840',27,31.12,13);
INSERT INTO `order_detail` VALUES (10165,'S24_4048',24,106.45,8);
INSERT INTO `order_detail` VALUES (10165,'S32_2509',48,50.86,14);
INSERT INTO `order_detail` VALUES (10165,'S32_3207',44,55.30,7);
INSERT INTO `order_detail` VALUES (10165,'S50_1392',48,106.49,10);
INSERT INTO `order_detail` VALUES (10165,'S50_1514',38,49.21,5);
INSERT INTO `order_detail` VALUES (10166,'S18_3140',43,136.59,2);
INSERT INTO `order_detail` VALUES (10166,'S18_4522',26,72.85,1);
INSERT INTO `order_detail` VALUES (10166,'S700_1938',29,76.22,3);
INSERT INTO `order_detail` VALUES (10167,'S10_4757',44,123.76,9);
INSERT INTO `order_detail` VALUES (10167,'S18_1662',43,141.92,1);
INSERT INTO `order_detail` VALUES (10167,'S18_3029',46,69.68,7);
INSERT INTO `order_detail` VALUES (10167,'S18_3856',34,84.70,6);
INSERT INTO `order_detail` VALUES (10167,'S24_2011',33,110.60,16);
INSERT INTO `order_detail` VALUES (10167,'S24_2841',21,54.81,2);
INSERT INTO `order_detail` VALUES (10167,'S24_3151',20,77.00,11);
INSERT INTO `order_detail` VALUES (10167,'S24_3420',32,64.44,3);
INSERT INTO `order_detail` VALUES (10167,'S24_3816',29,73.80,8);
INSERT INTO `order_detail` VALUES (10167,'S700_1138',43,66.00,12);
INSERT INTO `order_detail` VALUES (10167,'S700_2047',29,87.80,5);
INSERT INTO `order_detail` VALUES (10167,'S700_2610',46,62.16,10);
INSERT INTO `order_detail` VALUES (10167,'S700_3505',24,85.14,13);
INSERT INTO `order_detail` VALUES (10167,'S700_3962',28,83.42,14);
INSERT INTO `order_detail` VALUES (10167,'S72_1253',40,42.71,4);
INSERT INTO `order_detail` VALUES (10167,'S72_3212',38,43.68,15);
INSERT INTO `order_detail` VALUES (10168,'S10_1678',36,94.74,1);
INSERT INTO `order_detail` VALUES (10168,'S10_2016',27,97.53,4);
INSERT INTO `order_detail` VALUES (10168,'S10_4698',20,160.74,3);
INSERT INTO `order_detail` VALUES (10168,'S18_2581',21,75.19,9);
INSERT INTO `order_detail` VALUES (10168,'S18_2625',46,49.06,5);
INSERT INTO `order_detail` VALUES (10168,'S24_1578',50,103.68,2);
INSERT INTO `order_detail` VALUES (10168,'S24_1785',49,93.01,11);
INSERT INTO `order_detail` VALUES (10168,'S24_2000',29,72.36,6);
INSERT INTO `order_detail` VALUES (10168,'S24_3949',27,57.32,18);
INSERT INTO `order_detail` VALUES (10168,'S24_4278',48,68.10,10);
INSERT INTO `order_detail` VALUES (10168,'S32_1374',28,89.90,7);
INSERT INTO `order_detail` VALUES (10168,'S32_4289',31,57.78,12);
INSERT INTO `order_detail` VALUES (10168,'S50_1341',48,39.71,13);
INSERT INTO `order_detail` VALUES (10168,'S700_1691',28,91.34,14);
INSERT INTO `order_detail` VALUES (10168,'S700_2466',31,87.75,16);
INSERT INTO `order_detail` VALUES (10168,'S700_2834',36,94.92,8);
INSERT INTO `order_detail` VALUES (10168,'S700_3167',48,72.00,15);
INSERT INTO `order_detail` VALUES (10168,'S700_4002',39,67.37,17);
INSERT INTO `order_detail` VALUES (10169,'S12_1099',30,163.44,2);
INSERT INTO `order_detail` VALUES (10169,'S12_2823',35,126.52,13);
INSERT INTO `order_detail` VALUES (10169,'S12_3990',36,71.82,3);
INSERT INTO `order_detail` VALUES (10169,'S18_3278',32,65.13,5);
INSERT INTO `order_detail` VALUES (10169,'S18_3482',36,136.70,4);
INSERT INTO `order_detail` VALUES (10169,'S18_3782',38,52.84,8);
INSERT INTO `order_detail` VALUES (10169,'S18_4721',33,120.53,7);
INSERT INTO `order_detail` VALUES (10169,'S24_2360',38,66.49,11);
INSERT INTO `order_detail` VALUES (10169,'S24_3371',34,53.27,1);
INSERT INTO `order_detail` VALUES (10169,'S24_4620',24,77.61,6);
INSERT INTO `order_detail` VALUES (10169,'S32_2206',26,37.01,9);
INSERT INTO `order_detail` VALUES (10169,'S32_4485',34,83.68,12);
INSERT INTO `order_detail` VALUES (10169,'S50_4713',48,75.66,10);
INSERT INTO `order_detail` VALUES (10170,'S12_3380',47,116.27,4);
INSERT INTO `order_detail` VALUES (10170,'S12_4675',41,93.28,3);
INSERT INTO `order_detail` VALUES (10170,'S18_1889',20,70.07,2);
INSERT INTO `order_detail` VALUES (10170,'S24_3856',34,130.60,1);
INSERT INTO `order_detail` VALUES (10171,'S18_1129',35,134.46,2);
INSERT INTO `order_detail` VALUES (10171,'S18_1984',35,128.03,1);
INSERT INTO `order_detail` VALUES (10171,'S18_3232',39,165.95,3);
INSERT INTO `order_detail` VALUES (10171,'S24_2972',36,34.74,4);
INSERT INTO `order_detail` VALUES (10172,'S18_1589',42,109.51,6);
INSERT INTO `order_detail` VALUES (10172,'S18_2870',39,117.48,7);
INSERT INTO `order_detail` VALUES (10172,'S18_3685',48,139.87,8);
INSERT INTO `order_detail` VALUES (10172,'S24_1046',32,61.00,3);
INSERT INTO `order_detail` VALUES (10172,'S24_1628',34,43.27,5);
INSERT INTO `order_detail` VALUES (10172,'S24_2766',22,79.97,1);
INSERT INTO `order_detail` VALUES (10172,'S24_3191',24,77.91,2);
INSERT INTO `order_detail` VALUES (10172,'S24_3432',22,87.81,4);
INSERT INTO `order_detail` VALUES (10173,'S18_1342',43,101.71,6);
INSERT INTO `order_detail` VALUES (10173,'S18_1367',48,51.75,5);
INSERT INTO `order_detail` VALUES (10173,'S18_1749',24,168.30,13);
INSERT INTO `order_detail` VALUES (10173,'S18_2248',26,55.09,12);
INSERT INTO `order_detail` VALUES (10173,'S18_2325',31,127.13,10);
INSERT INTO `order_detail` VALUES (10173,'S18_2795',22,140.06,7);
INSERT INTO `order_detail` VALUES (10173,'S18_2957',28,56.84,2);
INSERT INTO `order_detail` VALUES (10173,'S18_3136',31,86.92,1);
INSERT INTO `order_detail` VALUES (10173,'S18_3320',29,90.28,4);
INSERT INTO `order_detail` VALUES (10173,'S18_4409',21,77.31,14);
INSERT INTO `order_detail` VALUES (10173,'S18_4933',39,58.44,15);
INSERT INTO `order_detail` VALUES (10173,'S24_1937',31,29.87,9);
INSERT INTO `order_detail` VALUES (10173,'S24_2022',27,39.42,8);
INSERT INTO `order_detail` VALUES (10173,'S24_2887',23,98.65,16);
INSERT INTO `order_detail` VALUES (10173,'S24_3969',35,35.70,11);
INSERT INTO `order_detail` VALUES (10173,'S24_4258',22,93.49,3);
INSERT INTO `order_detail` VALUES (10174,'S10_1949',34,207.87,4);
INSERT INTO `order_detail` VALUES (10174,'S12_1666',43,113.44,1);
INSERT INTO `order_detail` VALUES (10174,'S18_1097',48,108.50,3);
INSERT INTO `order_detail` VALUES (10174,'S18_2949',46,100.30,5);
INSERT INTO `order_detail` VALUES (10174,'S18_4668',49,44.27,2);
INSERT INTO `order_detail` VALUES (10175,'S10_4962',33,119.67,9);
INSERT INTO `order_detail` VALUES (10175,'S12_4473',26,109.02,1);
INSERT INTO `order_detail` VALUES (10175,'S18_2319',48,101.87,4);
INSERT INTO `order_detail` VALUES (10175,'S18_2432',41,59.55,7);
INSERT INTO `order_detail` VALUES (10175,'S18_3232',29,150.71,5);
INSERT INTO `order_detail` VALUES (10175,'S18_4600',47,102.92,10);
INSERT INTO `order_detail` VALUES (10175,'S24_2300',28,121.40,6);
INSERT INTO `order_detail` VALUES (10175,'S24_2840',37,32.18,2);
INSERT INTO `order_detail` VALUES (10175,'S32_1268',22,89.57,8);
INSERT INTO `order_detail` VALUES (10175,'S32_2509',50,50.86,3);
INSERT INTO `order_detail` VALUES (10175,'S32_3522',29,56.24,12);
INSERT INTO `order_detail` VALUES (10175,'S700_2824',42,80.92,11);
INSERT INTO `order_detail` VALUES (10176,'S12_1108',33,166.24,2);
INSERT INTO `order_detail` VALUES (10176,'S12_3148',47,145.04,3);
INSERT INTO `order_detail` VALUES (10176,'S12_3891',50,160.91,1);
INSERT INTO `order_detail` VALUES (10176,'S18_2238',20,139.17,10);
INSERT INTO `order_detail` VALUES (10176,'S18_4027',36,140.75,5);
INSERT INTO `order_detail` VALUES (10176,'S24_1444',27,55.49,8);
INSERT INTO `order_detail` VALUES (10176,'S24_4048',29,101.72,7);
INSERT INTO `order_detail` VALUES (10176,'S32_3207',22,62.14,6);
INSERT INTO `order_detail` VALUES (10176,'S50_1392',23,109.96,9);
INSERT INTO `order_detail` VALUES (10176,'S50_1514',38,52.14,4);
INSERT INTO `order_detail` VALUES (10177,'S18_3140',23,113.37,9);
INSERT INTO `order_detail` VALUES (10177,'S18_3259',29,92.77,11);
INSERT INTO `order_detail` VALUES (10177,'S18_4522',35,82.50,8);
INSERT INTO `order_detail` VALUES (10177,'S24_2011',50,115.52,7);
INSERT INTO `order_detail` VALUES (10177,'S24_3151',45,79.66,2);
INSERT INTO `order_detail` VALUES (10177,'S700_1138',24,58.67,3);
INSERT INTO `order_detail` VALUES (10177,'S700_1938',31,77.95,10);
INSERT INTO `order_detail` VALUES (10177,'S700_2610',32,64.33,1);
INSERT INTO `order_detail` VALUES (10177,'S700_3505',44,88.15,4);
INSERT INTO `order_detail` VALUES (10177,'S700_3962',24,83.42,5);
INSERT INTO `order_detail` VALUES (10177,'S72_3212',40,52.96,6);
INSERT INTO `order_detail` VALUES (10178,'S10_4757',24,131.92,12);
INSERT INTO `order_detail` VALUES (10178,'S18_1662',42,127.73,4);
INSERT INTO `order_detail` VALUES (10178,'S18_3029',41,70.54,10);
INSERT INTO `order_detail` VALUES (10178,'S18_3856',48,104.81,9);
INSERT INTO `order_detail` VALUES (10178,'S24_2841',34,67.82,5);
INSERT INTO `order_detail` VALUES (10178,'S24_3420',27,65.75,6);
INSERT INTO `order_detail` VALUES (10178,'S24_3816',21,68.77,11);
INSERT INTO `order_detail` VALUES (10178,'S24_3949',30,64.15,3);
INSERT INTO `order_detail` VALUES (10178,'S700_2047',34,86.90,8);
INSERT INTO `order_detail` VALUES (10178,'S700_2466',22,91.74,1);
INSERT INTO `order_detail` VALUES (10178,'S700_4002',45,68.11,2);
INSERT INTO `order_detail` VALUES (10178,'S72_1253',45,41.71,7);
INSERT INTO `order_detail` VALUES (10179,'S18_2581',24,82.79,3);
INSERT INTO `order_detail` VALUES (10179,'S24_1785',47,105.04,5);
INSERT INTO `order_detail` VALUES (10179,'S24_4278',27,66.65,4);
INSERT INTO `order_detail` VALUES (10179,'S32_1374',45,86.90,1);
INSERT INTO `order_detail` VALUES (10179,'S32_4289',24,63.97,6);
INSERT INTO `order_detail` VALUES (10179,'S50_1341',34,43.20,7);
INSERT INTO `order_detail` VALUES (10179,'S700_1691',23,75.81,8);
INSERT INTO `order_detail` VALUES (10179,'S700_2834',25,98.48,2);
INSERT INTO `order_detail` VALUES (10179,'S700_3167',39,80.00,9);
INSERT INTO `order_detail` VALUES (10180,'S10_1678',29,76.56,9);
INSERT INTO `order_detail` VALUES (10180,'S10_2016',42,99.91,12);
INSERT INTO `order_detail` VALUES (10180,'S10_4698',41,164.61,11);
INSERT INTO `order_detail` VALUES (10180,'S12_2823',40,131.04,8);
INSERT INTO `order_detail` VALUES (10180,'S18_2625',25,48.46,13);
INSERT INTO `order_detail` VALUES (10180,'S18_3782',21,59.06,3);
INSERT INTO `order_detail` VALUES (10180,'S18_4721',44,147.31,2);
INSERT INTO `order_detail` VALUES (10180,'S24_1578',48,98.05,10);
INSERT INTO `order_detail` VALUES (10180,'S24_2000',28,61.70,14);
INSERT INTO `order_detail` VALUES (10180,'S24_2360',35,60.95,6);
INSERT INTO `order_detail` VALUES (10180,'S24_4620',28,68.71,1);
INSERT INTO `order_detail` VALUES (10180,'S32_2206',34,33.39,4);
INSERT INTO `order_detail` VALUES (10180,'S32_4485',22,102.05,7);
INSERT INTO `order_detail` VALUES (10180,'S50_4713',21,74.85,5);
INSERT INTO `order_detail` VALUES (10181,'S12_1099',27,155.66,14);
INSERT INTO `order_detail` VALUES (10181,'S12_3380',28,113.92,12);
INSERT INTO `order_detail` VALUES (10181,'S12_3990',20,67.03,15);
INSERT INTO `order_detail` VALUES (10181,'S12_4675',36,107.10,11);
INSERT INTO `order_detail` VALUES (10181,'S18_1129',44,124.56,6);
INSERT INTO `order_detail` VALUES (10181,'S18_1589',42,124.44,2);
INSERT INTO `order_detail` VALUES (10181,'S18_1889',22,74.69,10);
INSERT INTO `order_detail` VALUES (10181,'S18_1984',21,129.45,5);
INSERT INTO `order_detail` VALUES (10181,'S18_2870',27,130.68,3);
INSERT INTO `order_detail` VALUES (10181,'S18_3232',45,147.33,7);
INSERT INTO `order_detail` VALUES (10181,'S18_3278',30,73.17,17);
INSERT INTO `order_detail` VALUES (10181,'S18_3482',22,120.53,16);
INSERT INTO `order_detail` VALUES (10181,'S18_3685',39,137.04,4);
INSERT INTO `order_detail` VALUES (10181,'S24_1628',34,45.28,1);
INSERT INTO `order_detail` VALUES (10181,'S24_2972',37,32.85,8);
INSERT INTO `order_detail` VALUES (10181,'S24_3371',23,54.49,13);
INSERT INTO `order_detail` VALUES (10181,'S24_3856',25,122.17,9);
INSERT INTO `order_detail` VALUES (10182,'S18_1342',25,83.22,3);
INSERT INTO `order_detail` VALUES (10182,'S18_1367',32,44.21,2);
INSERT INTO `order_detail` VALUES (10182,'S18_1749',44,159.80,10);
INSERT INTO `order_detail` VALUES (10182,'S18_2248',38,54.49,9);
INSERT INTO `order_detail` VALUES (10182,'S18_2325',20,105.52,7);
INSERT INTO `order_detail` VALUES (10182,'S18_2795',21,135.00,4);
INSERT INTO `order_detail` VALUES (10182,'S18_3320',33,86.31,1);
INSERT INTO `order_detail` VALUES (10182,'S18_4409',36,88.35,11);
INSERT INTO `order_detail` VALUES (10182,'S18_4933',44,61.29,12);
INSERT INTO `order_detail` VALUES (10182,'S24_1046',47,63.20,16);
INSERT INTO `order_detail` VALUES (10182,'S24_1937',39,31.86,6);
INSERT INTO `order_detail` VALUES (10182,'S24_2022',31,39.87,5);
INSERT INTO `order_detail` VALUES (10182,'S24_2766',36,87.24,14);
INSERT INTO `order_detail` VALUES (10182,'S24_2887',20,116.27,13);
INSERT INTO `order_detail` VALUES (10182,'S24_3191',33,73.62,15);
INSERT INTO `order_detail` VALUES (10182,'S24_3432',49,95.30,17);
INSERT INTO `order_detail` VALUES (10182,'S24_3969',23,34.88,8);
INSERT INTO `order_detail` VALUES (10183,'S10_1949',23,180.01,8);
INSERT INTO `order_detail` VALUES (10183,'S10_4962',28,127.06,1);
INSERT INTO `order_detail` VALUES (10183,'S12_1666',41,114.80,5);
INSERT INTO `order_detail` VALUES (10183,'S18_1097',21,108.50,7);
INSERT INTO `order_detail` VALUES (10183,'S18_2949',37,91.18,9);
INSERT INTO `order_detail` VALUES (10183,'S18_2957',39,51.22,11);
INSERT INTO `order_detail` VALUES (10183,'S18_3136',22,90.06,10);
INSERT INTO `order_detail` VALUES (10183,'S18_4600',21,118.66,2);
INSERT INTO `order_detail` VALUES (10183,'S18_4668',40,42.26,6);
INSERT INTO `order_detail` VALUES (10183,'S24_4258',47,81.81,12);
INSERT INTO `order_detail` VALUES (10183,'S32_3522',49,52.36,4);
INSERT INTO `order_detail` VALUES (10183,'S700_2824',23,85.98,3);
INSERT INTO `order_detail` VALUES (10184,'S12_4473',37,105.47,6);
INSERT INTO `order_detail` VALUES (10184,'S18_2238',46,145.72,5);
INSERT INTO `order_detail` VALUES (10184,'S18_2319',46,119.05,9);
INSERT INTO `order_detail` VALUES (10184,'S18_2432',44,60.77,12);
INSERT INTO `order_detail` VALUES (10184,'S18_3232',28,165.95,10);
INSERT INTO `order_detail` VALUES (10184,'S24_1444',31,57.22,3);
INSERT INTO `order_detail` VALUES (10184,'S24_2300',24,117.57,11);
INSERT INTO `order_detail` VALUES (10184,'S24_2840',42,30.06,7);
INSERT INTO `order_detail` VALUES (10184,'S24_4048',49,114.73,2);
INSERT INTO `order_detail` VALUES (10184,'S32_1268',46,84.75,13);
INSERT INTO `order_detail` VALUES (10184,'S32_2509',33,52.49,8);
INSERT INTO `order_detail` VALUES (10184,'S32_3207',48,59.03,1);
INSERT INTO `order_detail` VALUES (10184,'S50_1392',45,92.60,4);
INSERT INTO `order_detail` VALUES (10185,'S12_1108',21,195.33,13);
INSERT INTO `order_detail` VALUES (10185,'S12_3148',33,146.55,14);
INSERT INTO `order_detail` VALUES (10185,'S12_3891',43,147.07,12);
INSERT INTO `order_detail` VALUES (10185,'S18_3140',28,124.30,9);
INSERT INTO `order_detail` VALUES (10185,'S18_3259',49,94.79,11);
INSERT INTO `order_detail` VALUES (10185,'S18_4027',39,127.82,16);
INSERT INTO `order_detail` VALUES (10185,'S18_4522',47,87.77,8);
INSERT INTO `order_detail` VALUES (10185,'S24_2011',30,105.69,7);
INSERT INTO `order_detail` VALUES (10185,'S24_3151',33,83.20,2);
INSERT INTO `order_detail` VALUES (10185,'S50_1514',20,46.86,15);
INSERT INTO `order_detail` VALUES (10185,'S700_1138',21,64.67,3);
INSERT INTO `order_detail` VALUES (10185,'S700_1938',30,79.68,10);
INSERT INTO `order_detail` VALUES (10185,'S700_2610',39,61.44,1);
INSERT INTO `order_detail` VALUES (10185,'S700_3505',37,99.17,4);
INSERT INTO `order_detail` VALUES (10185,'S700_3962',22,93.35,5);
INSERT INTO `order_detail` VALUES (10185,'S72_3212',28,47.50,6);
INSERT INTO `order_detail` VALUES (10186,'S10_4757',26,108.80,9);
INSERT INTO `order_detail` VALUES (10186,'S18_1662',32,137.19,1);
INSERT INTO `order_detail` VALUES (10186,'S18_3029',32,73.12,7);
INSERT INTO `order_detail` VALUES (10186,'S18_3856',46,98.46,6);
INSERT INTO `order_detail` VALUES (10186,'S24_2841',22,60.29,2);
INSERT INTO `order_detail` VALUES (10186,'S24_3420',21,59.83,3);
INSERT INTO `order_detail` VALUES (10186,'S24_3816',36,68.77,8);
INSERT INTO `order_detail` VALUES (10186,'S700_2047',24,80.56,5);
INSERT INTO `order_detail` VALUES (10186,'S72_1253',28,42.71,4);
INSERT INTO `order_detail` VALUES (10187,'S18_2581',45,70.12,1);
INSERT INTO `order_detail` VALUES (10187,'S24_1785',46,96.29,3);
INSERT INTO `order_detail` VALUES (10187,'S24_3949',43,55.96,10);
INSERT INTO `order_detail` VALUES (10187,'S24_4278',33,64.48,2);
INSERT INTO `order_detail` VALUES (10187,'S32_4289',31,61.22,4);
INSERT INTO `order_detail` VALUES (10187,'S50_1341',41,39.71,5);
INSERT INTO `order_detail` VALUES (10187,'S700_1691',34,84.95,6);
INSERT INTO `order_detail` VALUES (10187,'S700_2466',44,95.73,8);
INSERT INTO `order_detail` VALUES (10187,'S700_3167',34,72.00,7);
INSERT INTO `order_detail` VALUES (10187,'S700_4002',44,70.33,9);
INSERT INTO `order_detail` VALUES (10188,'S10_1678',48,95.70,1);
INSERT INTO `order_detail` VALUES (10188,'S10_2016',38,111.80,4);
INSERT INTO `order_detail` VALUES (10188,'S10_4698',45,182.04,3);
INSERT INTO `order_detail` VALUES (10188,'S18_2625',32,52.09,5);
INSERT INTO `order_detail` VALUES (10188,'S24_1578',25,95.80,2);
INSERT INTO `order_detail` VALUES (10188,'S24_2000',40,61.70,6);
INSERT INTO `order_detail` VALUES (10188,'S32_1374',44,81.91,7);
INSERT INTO `order_detail` VALUES (10188,'S700_2834',29,96.11,8);
INSERT INTO `order_detail` VALUES (10189,'S12_2823',28,138.57,1);
INSERT INTO `order_detail` VALUES (10190,'S24_2360',42,58.87,3);
INSERT INTO `order_detail` VALUES (10190,'S32_2206',46,38.62,1);
INSERT INTO `order_detail` VALUES (10190,'S32_4485',42,89.80,4);
INSERT INTO `order_detail` VALUES (10190,'S50_4713',40,67.53,2);
INSERT INTO `order_detail` VALUES (10191,'S12_1099',21,155.66,3);
INSERT INTO `order_detail` VALUES (10191,'S12_3380',40,104.52,1);
INSERT INTO `order_detail` VALUES (10191,'S12_3990',30,70.22,4);
INSERT INTO `order_detail` VALUES (10191,'S18_3278',36,75.59,6);
INSERT INTO `order_detail` VALUES (10191,'S18_3482',23,119.06,5);
INSERT INTO `order_detail` VALUES (10191,'S18_3782',43,60.93,9);
INSERT INTO `order_detail` VALUES (10191,'S18_4721',32,136.90,8);
INSERT INTO `order_detail` VALUES (10191,'S24_3371',48,53.27,2);
INSERT INTO `order_detail` VALUES (10191,'S24_4620',44,77.61,7);
INSERT INTO `order_detail` VALUES (10192,'S12_4675',27,99.04,16);
INSERT INTO `order_detail` VALUES (10192,'S18_1129',22,140.12,11);
INSERT INTO `order_detail` VALUES (10192,'S18_1589',29,100.80,7);
INSERT INTO `order_detail` VALUES (10192,'S18_1889',45,70.84,15);
INSERT INTO `order_detail` VALUES (10192,'S18_1984',47,128.03,10);
INSERT INTO `order_detail` VALUES (10192,'S18_2870',38,110.88,8);
INSERT INTO `order_detail` VALUES (10192,'S18_3232',26,137.17,12);
INSERT INTO `order_detail` VALUES (10192,'S18_3685',45,125.74,9);
INSERT INTO `order_detail` VALUES (10192,'S24_1046',37,72.02,4);
INSERT INTO `order_detail` VALUES (10192,'S24_1628',47,49.30,6);
INSERT INTO `order_detail` VALUES (10192,'S24_2766',46,86.33,2);
INSERT INTO `order_detail` VALUES (10192,'S24_2887',23,112.74,1);
INSERT INTO `order_detail` VALUES (10192,'S24_2972',30,33.23,13);
INSERT INTO `order_detail` VALUES (10192,'S24_3191',32,69.34,3);
INSERT INTO `order_detail` VALUES (10192,'S24_3432',46,93.16,5);
INSERT INTO `order_detail` VALUES (10192,'S24_3856',45,112.34,14);
INSERT INTO `order_detail` VALUES (10193,'S18_1342',28,92.47,7);
INSERT INTO `order_detail` VALUES (10193,'S18_1367',46,46.36,6);
INSERT INTO `order_detail` VALUES (10193,'S18_1749',21,153.00,14);
INSERT INTO `order_detail` VALUES (10193,'S18_2248',42,60.54,13);
INSERT INTO `order_detail` VALUES (10193,'S18_2325',44,115.69,11);
INSERT INTO `order_detail` VALUES (10193,'S18_2795',22,143.44,8);
INSERT INTO `order_detail` VALUES (10193,'S18_2949',28,87.13,1);
INSERT INTO `order_detail` VALUES (10193,'S18_2957',24,53.09,3);
INSERT INTO `order_detail` VALUES (10193,'S18_3136',23,97.39,2);
INSERT INTO `order_detail` VALUES (10193,'S18_3320',32,79.37,5);
INSERT INTO `order_detail` VALUES (10193,'S18_4409',24,92.03,15);
INSERT INTO `order_detail` VALUES (10193,'S18_4933',25,66.28,16);
INSERT INTO `order_detail` VALUES (10193,'S24_1937',26,32.19,10);
INSERT INTO `order_detail` VALUES (10193,'S24_2022',20,44.80,9);
INSERT INTO `order_detail` VALUES (10193,'S24_3969',22,38.16,12);
INSERT INTO `order_detail` VALUES (10193,'S24_4258',20,92.52,4);
INSERT INTO `order_detail` VALUES (10194,'S10_1949',42,203.59,11);
INSERT INTO `order_detail` VALUES (10194,'S10_4962',26,134.44,4);
INSERT INTO `order_detail` VALUES (10194,'S12_1666',38,124.37,8);
INSERT INTO `order_detail` VALUES (10194,'S18_1097',21,103.84,10);
INSERT INTO `order_detail` VALUES (10194,'S18_2432',45,51.05,2);
INSERT INTO `order_detail` VALUES (10194,'S18_4600',32,113.82,5);
INSERT INTO `order_detail` VALUES (10194,'S18_4668',41,47.79,9);
INSERT INTO `order_detail` VALUES (10194,'S24_2300',49,112.46,1);
INSERT INTO `order_detail` VALUES (10194,'S32_1268',37,77.05,3);
INSERT INTO `order_detail` VALUES (10194,'S32_3522',39,61.41,7);
INSERT INTO `order_detail` VALUES (10194,'S700_2824',26,80.92,6);
INSERT INTO `order_detail` VALUES (10195,'S12_4473',49,118.50,6);
INSERT INTO `order_detail` VALUES (10195,'S18_2238',27,139.17,5);
INSERT INTO `order_detail` VALUES (10195,'S18_2319',35,112.91,9);
INSERT INTO `order_detail` VALUES (10195,'S18_3232',50,150.71,10);
INSERT INTO `order_detail` VALUES (10195,'S24_1444',44,54.33,3);
INSERT INTO `order_detail` VALUES (10195,'S24_2840',32,31.82,7);
INSERT INTO `order_detail` VALUES (10195,'S24_4048',34,95.81,2);
INSERT INTO `order_detail` VALUES (10195,'S32_2509',32,51.95,8);
INSERT INTO `order_detail` VALUES (10195,'S32_3207',33,59.03,1);
INSERT INTO `order_detail` VALUES (10195,'S50_1392',49,97.23,4);
INSERT INTO `order_detail` VALUES (10196,'S12_1108',47,203.64,5);
INSERT INTO `order_detail` VALUES (10196,'S12_3148',24,151.08,6);
INSERT INTO `order_detail` VALUES (10196,'S12_3891',38,147.07,4);
INSERT INTO `order_detail` VALUES (10196,'S18_3140',49,127.03,1);
INSERT INTO `order_detail` VALUES (10196,'S18_3259',35,81.68,3);
INSERT INTO `order_detail` VALUES (10196,'S18_4027',27,126.39,8);
INSERT INTO `order_detail` VALUES (10196,'S50_1514',46,56.82,7);
INSERT INTO `order_detail` VALUES (10196,'S700_1938',50,84.88,2);
INSERT INTO `order_detail` VALUES (10197,'S10_4757',45,118.32,6);
INSERT INTO `order_detail` VALUES (10197,'S18_3029',46,83.44,4);
INSERT INTO `order_detail` VALUES (10197,'S18_3856',22,85.75,3);
INSERT INTO `order_detail` VALUES (10197,'S18_4522',50,78.99,14);
INSERT INTO `order_detail` VALUES (10197,'S24_2011',41,109.37,13);
INSERT INTO `order_detail` VALUES (10197,'S24_3151',47,83.20,8);
INSERT INTO `order_detail` VALUES (10197,'S24_3816',22,67.93,5);
INSERT INTO `order_detail` VALUES (10197,'S700_1138',23,60.00,9);
INSERT INTO `order_detail` VALUES (10197,'S700_2047',24,78.75,2);
INSERT INTO `order_detail` VALUES (10197,'S700_2610',50,66.50,7);
INSERT INTO `order_detail` VALUES (10197,'S700_3505',27,100.17,10);
INSERT INTO `order_detail` VALUES (10197,'S700_3962',35,88.39,11);
INSERT INTO `order_detail` VALUES (10197,'S72_1253',29,39.73,1);
INSERT INTO `order_detail` VALUES (10197,'S72_3212',42,48.59,12);
INSERT INTO `order_detail` VALUES (10198,'S18_1662',42,149.81,4);
INSERT INTO `order_detail` VALUES (10198,'S24_2841',48,60.97,5);
INSERT INTO `order_detail` VALUES (10198,'S24_3420',27,61.81,6);
INSERT INTO `order_detail` VALUES (10198,'S24_3949',43,65.51,3);
INSERT INTO `order_detail` VALUES (10198,'S700_2466',42,94.73,1);
INSERT INTO `order_detail` VALUES (10198,'S700_4002',40,74.03,2);
INSERT INTO `order_detail` VALUES (10199,'S50_1341',29,37.97,1);
INSERT INTO `order_detail` VALUES (10199,'S700_1691',48,81.29,2);
INSERT INTO `order_detail` VALUES (10199,'S700_3167',38,70.40,3);
INSERT INTO `order_detail` VALUES (10200,'S18_2581',28,74.34,3);
INSERT INTO `order_detail` VALUES (10200,'S24_1785',33,99.57,5);
INSERT INTO `order_detail` VALUES (10200,'S24_4278',39,70.28,4);
INSERT INTO `order_detail` VALUES (10200,'S32_1374',35,80.91,1);
INSERT INTO `order_detail` VALUES (10200,'S32_4289',27,65.35,6);
INSERT INTO `order_detail` VALUES (10200,'S700_2834',39,115.09,2);
INSERT INTO `order_detail` VALUES (10201,'S10_1678',22,82.30,2);
INSERT INTO `order_detail` VALUES (10201,'S10_2016',24,116.56,5);
INSERT INTO `order_detail` VALUES (10201,'S10_4698',49,191.72,4);
INSERT INTO `order_detail` VALUES (10201,'S12_2823',25,126.52,1);
INSERT INTO `order_detail` VALUES (10201,'S18_2625',30,48.46,6);
INSERT INTO `order_detail` VALUES (10201,'S24_1578',39,93.54,3);
INSERT INTO `order_detail` VALUES (10201,'S24_2000',25,66.27,7);
INSERT INTO `order_detail` VALUES (10202,'S18_3782',30,55.33,3);
INSERT INTO `order_detail` VALUES (10202,'S18_4721',43,124.99,2);
INSERT INTO `order_detail` VALUES (10202,'S24_2360',50,56.10,6);
INSERT INTO `order_detail` VALUES (10202,'S24_4620',50,75.18,1);
INSERT INTO `order_detail` VALUES (10202,'S32_2206',27,33.39,4);
INSERT INTO `order_detail` VALUES (10202,'S32_4485',31,81.64,7);
INSERT INTO `order_detail` VALUES (10202,'S50_4713',40,79.73,5);
INSERT INTO `order_detail` VALUES (10203,'S12_1099',20,161.49,8);
INSERT INTO `order_detail` VALUES (10203,'S12_3380',20,111.57,6);
INSERT INTO `order_detail` VALUES (10203,'S12_3990',44,63.84,9);
INSERT INTO `order_detail` VALUES (10203,'S12_4675',47,115.16,5);
INSERT INTO `order_detail` VALUES (10203,'S18_1889',45,73.15,4);
INSERT INTO `order_detail` VALUES (10203,'S18_3232',48,157.49,1);
INSERT INTO `order_detail` VALUES (10203,'S18_3278',33,66.74,11);
INSERT INTO `order_detail` VALUES (10203,'S18_3482',32,127.88,10);
INSERT INTO `order_detail` VALUES (10203,'S24_2972',21,33.23,2);
INSERT INTO `order_detail` VALUES (10203,'S24_3371',34,56.94,7);
INSERT INTO `order_detail` VALUES (10203,'S24_3856',47,140.43,3);
INSERT INTO `order_detail` VALUES (10204,'S18_1129',42,114.65,17);
INSERT INTO `order_detail` VALUES (10204,'S18_1589',40,113.24,13);
INSERT INTO `order_detail` VALUES (10204,'S18_1749',33,153.00,4);
INSERT INTO `order_detail` VALUES (10204,'S18_1984',38,133.72,16);
INSERT INTO `order_detail` VALUES (10204,'S18_2248',23,59.33,3);
INSERT INTO `order_detail` VALUES (10204,'S18_2325',26,119.50,1);
INSERT INTO `order_detail` VALUES (10204,'S18_2870',27,106.92,14);
INSERT INTO `order_detail` VALUES (10204,'S18_3685',35,132.80,15);
INSERT INTO `order_detail` VALUES (10204,'S18_4409',29,83.75,5);
INSERT INTO `order_detail` VALUES (10204,'S18_4933',45,69.84,6);
INSERT INTO `order_detail` VALUES (10204,'S24_1046',20,69.82,10);
INSERT INTO `order_detail` VALUES (10204,'S24_1628',45,46.79,12);
INSERT INTO `order_detail` VALUES (10204,'S24_2766',47,79.06,8);
INSERT INTO `order_detail` VALUES (10204,'S24_2887',42,112.74,7);
INSERT INTO `order_detail` VALUES (10204,'S24_3191',40,84.75,9);
INSERT INTO `order_detail` VALUES (10204,'S24_3432',48,104.94,11);
INSERT INTO `order_detail` VALUES (10204,'S24_3969',39,34.88,2);
INSERT INTO `order_detail` VALUES (10205,'S18_1342',36,98.63,2);
INSERT INTO `order_detail` VALUES (10205,'S18_1367',48,45.82,1);
INSERT INTO `order_detail` VALUES (10205,'S18_2795',40,138.38,3);
INSERT INTO `order_detail` VALUES (10205,'S24_1937',32,27.88,5);
INSERT INTO `order_detail` VALUES (10205,'S24_2022',24,36.74,4);
INSERT INTO `order_detail` VALUES (10206,'S10_1949',47,203.59,6);
INSERT INTO `order_detail` VALUES (10206,'S12_1666',28,109.34,3);
INSERT INTO `order_detail` VALUES (10206,'S18_1097',34,115.50,5);
INSERT INTO `order_detail` VALUES (10206,'S18_2949',37,98.27,7);
INSERT INTO `order_detail` VALUES (10206,'S18_2957',28,51.84,9);
INSERT INTO `order_detail` VALUES (10206,'S18_3136',30,102.63,8);
INSERT INTO `order_detail` VALUES (10206,'S18_3320',28,99.21,11);
INSERT INTO `order_detail` VALUES (10206,'S18_4668',21,45.78,4);
INSERT INTO `order_detail` VALUES (10206,'S24_4258',33,95.44,10);
INSERT INTO `order_detail` VALUES (10206,'S32_3522',36,54.94,2);
INSERT INTO `order_detail` VALUES (10206,'S700_2824',33,89.01,1);
INSERT INTO `order_detail` VALUES (10207,'S10_4962',31,125.58,15);
INSERT INTO `order_detail` VALUES (10207,'S12_4473',34,95.99,7);
INSERT INTO `order_detail` VALUES (10207,'S18_2238',44,140.81,6);
INSERT INTO `order_detail` VALUES (10207,'S18_2319',43,109.23,10);
INSERT INTO `order_detail` VALUES (10207,'S18_2432',37,60.77,13);
INSERT INTO `order_detail` VALUES (10207,'S18_3232',25,140.55,11);
INSERT INTO `order_detail` VALUES (10207,'S18_4027',40,143.62,1);
INSERT INTO `order_detail` VALUES (10207,'S18_4600',47,119.87,16);
INSERT INTO `order_detail` VALUES (10207,'S24_1444',49,57.80,4);
INSERT INTO `order_detail` VALUES (10207,'S24_2300',46,127.79,12);
INSERT INTO `order_detail` VALUES (10207,'S24_2840',42,30.76,8);
INSERT INTO `order_detail` VALUES (10207,'S24_4048',28,108.82,3);
INSERT INTO `order_detail` VALUES (10207,'S32_1268',49,84.75,14);
INSERT INTO `order_detail` VALUES (10207,'S32_2509',27,51.95,9);
INSERT INTO `order_detail` VALUES (10207,'S32_3207',45,55.30,2);
INSERT INTO `order_detail` VALUES (10207,'S50_1392',28,106.49,5);
INSERT INTO `order_detail` VALUES (10208,'S12_1108',46,176.63,13);
INSERT INTO `order_detail` VALUES (10208,'S12_3148',26,128.42,14);
INSERT INTO `order_detail` VALUES (10208,'S12_3891',20,152.26,12);
INSERT INTO `order_detail` VALUES (10208,'S18_3140',24,117.47,9);
INSERT INTO `order_detail` VALUES (10208,'S18_3259',48,96.81,11);
INSERT INTO `order_detail` VALUES (10208,'S18_4522',45,72.85,8);
INSERT INTO `order_detail` VALUES (10208,'S24_2011',35,122.89,7);
INSERT INTO `order_detail` VALUES (10208,'S24_3151',20,80.54,2);
INSERT INTO `order_detail` VALUES (10208,'S50_1514',30,57.99,15);
INSERT INTO `order_detail` VALUES (10208,'S700_1138',38,56.67,3);
INSERT INTO `order_detail` VALUES (10208,'S700_1938',40,73.62,10);
INSERT INTO `order_detail` VALUES (10208,'S700_2610',46,63.61,1);
INSERT INTO `order_detail` VALUES (10208,'S700_3505',37,95.16,4);
INSERT INTO `order_detail` VALUES (10208,'S700_3962',33,95.34,5);
INSERT INTO `order_detail` VALUES (10208,'S72_3212',42,48.05,6);
INSERT INTO `order_detail` VALUES (10209,'S10_4757',39,129.20,8);
INSERT INTO `order_detail` VALUES (10209,'S18_3029',28,82.58,6);
INSERT INTO `order_detail` VALUES (10209,'S18_3856',20,97.40,5);
INSERT INTO `order_detail` VALUES (10209,'S24_2841',43,66.45,1);
INSERT INTO `order_detail` VALUES (10209,'S24_3420',36,56.55,2);
INSERT INTO `order_detail` VALUES (10209,'S24_3816',22,79.67,7);
INSERT INTO `order_detail` VALUES (10209,'S700_2047',33,90.52,4);
INSERT INTO `order_detail` VALUES (10209,'S72_1253',48,44.20,3);
INSERT INTO `order_detail` VALUES (10210,'S10_2016',23,112.99,2);
INSERT INTO `order_detail` VALUES (10210,'S10_4698',34,189.79,1);
INSERT INTO `order_detail` VALUES (10210,'S18_1662',31,141.92,17);
INSERT INTO `order_detail` VALUES (10210,'S18_2581',50,68.43,7);
INSERT INTO `order_detail` VALUES (10210,'S18_2625',40,51.48,3);
INSERT INTO `order_detail` VALUES (10210,'S24_1785',27,100.67,9);
INSERT INTO `order_detail` VALUES (10210,'S24_2000',30,63.22,4);
INSERT INTO `order_detail` VALUES (10210,'S24_3949',29,56.64,16);
INSERT INTO `order_detail` VALUES (10210,'S24_4278',40,68.10,8);
INSERT INTO `order_detail` VALUES (10210,'S32_1374',46,84.91,5);
INSERT INTO `order_detail` VALUES (10210,'S32_4289',39,57.10,10);
INSERT INTO `order_detail` VALUES (10210,'S50_1341',43,43.20,11);
INSERT INTO `order_detail` VALUES (10210,'S700_1691',21,87.69,12);
INSERT INTO `order_detail` VALUES (10210,'S700_2466',26,93.74,14);
INSERT INTO `order_detail` VALUES (10210,'S700_2834',25,98.48,6);
INSERT INTO `order_detail` VALUES (10210,'S700_3167',31,64.00,13);
INSERT INTO `order_detail` VALUES (10210,'S700_4002',42,60.70,15);
INSERT INTO `order_detail` VALUES (10211,'S10_1678',41,90.92,14);
INSERT INTO `order_detail` VALUES (10211,'S12_1099',41,171.22,2);
INSERT INTO `order_detail` VALUES (10211,'S12_2823',36,126.52,13);
INSERT INTO `order_detail` VALUES (10211,'S12_3990',28,79.80,3);
INSERT INTO `order_detail` VALUES (10211,'S18_3278',35,73.17,5);
INSERT INTO `order_detail` VALUES (10211,'S18_3482',28,138.17,4);
INSERT INTO `order_detail` VALUES (10211,'S18_3782',46,60.30,8);
INSERT INTO `order_detail` VALUES (10211,'S18_4721',41,148.80,7);
INSERT INTO `order_detail` VALUES (10211,'S24_1578',25,109.32,15);
INSERT INTO `order_detail` VALUES (10211,'S24_2360',21,62.33,11);
INSERT INTO `order_detail` VALUES (10211,'S24_3371',48,52.66,1);
INSERT INTO `order_detail` VALUES (10211,'S24_4620',22,80.84,6);
INSERT INTO `order_detail` VALUES (10211,'S32_2206',41,39.83,9);
INSERT INTO `order_detail` VALUES (10211,'S32_4485',37,94.91,12);
INSERT INTO `order_detail` VALUES (10211,'S50_4713',40,70.78,10);
INSERT INTO `order_detail` VALUES (10212,'S12_3380',39,99.82,16);
INSERT INTO `order_detail` VALUES (10212,'S12_4675',33,110.55,15);
INSERT INTO `order_detail` VALUES (10212,'S18_1129',29,117.48,10);
INSERT INTO `order_detail` VALUES (10212,'S18_1589',38,105.77,6);
INSERT INTO `order_detail` VALUES (10212,'S18_1889',20,64.68,14);
INSERT INTO `order_detail` VALUES (10212,'S18_1984',41,133.72,9);
INSERT INTO `order_detail` VALUES (10212,'S18_2870',40,117.48,7);
INSERT INTO `order_detail` VALUES (10212,'S18_3232',40,155.79,11);
INSERT INTO `order_detail` VALUES (10212,'S18_3685',45,115.85,8);
INSERT INTO `order_detail` VALUES (10212,'S24_1046',41,61.73,3);
INSERT INTO `order_detail` VALUES (10212,'S24_1628',45,43.27,5);
INSERT INTO `order_detail` VALUES (10212,'S24_2766',45,81.78,1);
INSERT INTO `order_detail` VALUES (10212,'S24_2972',34,37.38,12);
INSERT INTO `order_detail` VALUES (10212,'S24_3191',27,77.91,2);
INSERT INTO `order_detail` VALUES (10212,'S24_3432',46,100.66,4);
INSERT INTO `order_detail` VALUES (10212,'S24_3856',49,117.96,13);
INSERT INTO `order_detail` VALUES (10213,'S18_4409',38,84.67,1);
INSERT INTO `order_detail` VALUES (10213,'S18_4933',25,58.44,2);
INSERT INTO `order_detail` VALUES (10213,'S24_2887',27,97.48,3);
INSERT INTO `order_detail` VALUES (10214,'S18_1749',30,166.60,7);
INSERT INTO `order_detail` VALUES (10214,'S18_2248',21,53.28,6);
INSERT INTO `order_detail` VALUES (10214,'S18_2325',27,125.86,4);
INSERT INTO `order_detail` VALUES (10214,'S18_2795',50,167.06,1);
INSERT INTO `order_detail` VALUES (10214,'S24_1937',20,32.19,3);
INSERT INTO `order_detail` VALUES (10214,'S24_2022',49,39.87,2);
INSERT INTO `order_detail` VALUES (10214,'S24_3969',44,38.57,5);
INSERT INTO `order_detail` VALUES (10215,'S10_1949',35,205.73,3);
INSERT INTO `order_detail` VALUES (10215,'S18_1097',46,100.34,2);
INSERT INTO `order_detail` VALUES (10215,'S18_1342',27,92.47,10);
INSERT INTO `order_detail` VALUES (10215,'S18_1367',33,53.91,9);
INSERT INTO `order_detail` VALUES (10215,'S18_2949',49,97.26,4);
INSERT INTO `order_detail` VALUES (10215,'S18_2957',31,56.21,6);
INSERT INTO `order_detail` VALUES (10215,'S18_3136',49,89.01,5);
INSERT INTO `order_detail` VALUES (10215,'S18_3320',41,84.33,8);
INSERT INTO `order_detail` VALUES (10215,'S18_4668',46,42.76,1);
INSERT INTO `order_detail` VALUES (10215,'S24_4258',39,94.47,7);
INSERT INTO `order_detail` VALUES (10216,'S12_1666',43,133.94,1);
INSERT INTO `order_detail` VALUES (10217,'S10_4962',48,132.97,4);
INSERT INTO `order_detail` VALUES (10217,'S18_2432',35,58.34,2);
INSERT INTO `order_detail` VALUES (10217,'S18_4600',38,118.66,5);
INSERT INTO `order_detail` VALUES (10217,'S24_2300',28,103.51,1);
INSERT INTO `order_detail` VALUES (10217,'S32_1268',21,78.97,3);
INSERT INTO `order_detail` VALUES (10217,'S32_3522',39,56.24,7);
INSERT INTO `order_detail` VALUES (10217,'S700_2824',31,90.02,6);
INSERT INTO `order_detail` VALUES (10218,'S18_2319',22,110.46,1);
INSERT INTO `order_detail` VALUES (10218,'S18_3232',34,152.41,2);
INSERT INTO `order_detail` VALUES (10219,'S12_4473',48,94.80,2);
INSERT INTO `order_detail` VALUES (10219,'S18_2238',43,132.62,1);
INSERT INTO `order_detail` VALUES (10219,'S24_2840',21,31.12,3);
INSERT INTO `order_detail` VALUES (10219,'S32_2509',35,47.62,4);
INSERT INTO `order_detail` VALUES (10220,'S12_1108',32,189.10,2);
INSERT INTO `order_detail` VALUES (10220,'S12_3148',30,151.08,3);
INSERT INTO `order_detail` VALUES (10220,'S12_3891',27,166.10,1);
INSERT INTO `order_detail` VALUES (10220,'S18_4027',50,126.39,5);
INSERT INTO `order_detail` VALUES (10220,'S24_1444',26,48.55,8);
INSERT INTO `order_detail` VALUES (10220,'S24_4048',37,101.72,7);
INSERT INTO `order_detail` VALUES (10220,'S32_3207',20,49.71,6);
INSERT INTO `order_detail` VALUES (10220,'S50_1392',37,92.60,9);
INSERT INTO `order_detail` VALUES (10220,'S50_1514',30,56.82,4);
INSERT INTO `order_detail` VALUES (10221,'S18_3140',33,133.86,3);
INSERT INTO `order_detail` VALUES (10221,'S18_3259',23,89.75,5);
INSERT INTO `order_detail` VALUES (10221,'S18_4522',39,84.26,2);
INSERT INTO `order_detail` VALUES (10221,'S24_2011',49,113.06,1);
INSERT INTO `order_detail` VALUES (10221,'S700_1938',23,69.29,4);
INSERT INTO `order_detail` VALUES (10222,'S10_4757',49,133.28,12);
INSERT INTO `order_detail` VALUES (10222,'S18_1662',49,137.19,4);
INSERT INTO `order_detail` VALUES (10222,'S18_3029',49,79.14,10);
INSERT INTO `order_detail` VALUES (10222,'S18_3856',45,88.93,9);
INSERT INTO `order_detail` VALUES (10222,'S24_2841',32,56.86,5);
INSERT INTO `order_detail` VALUES (10222,'S24_3151',47,74.35,14);
INSERT INTO `order_detail` VALUES (10222,'S24_3420',43,61.15,6);
INSERT INTO `order_detail` VALUES (10222,'S24_3816',46,77.99,11);
INSERT INTO `order_detail` VALUES (10222,'S24_3949',48,55.27,3);
INSERT INTO `order_detail` VALUES (10222,'S700_1138',31,58.67,15);
INSERT INTO `order_detail` VALUES (10222,'S700_2047',26,80.56,8);
INSERT INTO `order_detail` VALUES (10222,'S700_2466',37,90.75,1);
INSERT INTO `order_detail` VALUES (10222,'S700_2610',36,69.39,13);
INSERT INTO `order_detail` VALUES (10222,'S700_3505',38,84.14,16);
INSERT INTO `order_detail` VALUES (10222,'S700_3962',31,81.43,17);
INSERT INTO `order_detail` VALUES (10222,'S700_4002',43,66.63,2);
INSERT INTO `order_detail` VALUES (10222,'S72_1253',31,45.19,7);
INSERT INTO `order_detail` VALUES (10222,'S72_3212',36,48.59,18);
INSERT INTO `order_detail` VALUES (10223,'S10_1678',37,80.39,1);
INSERT INTO `order_detail` VALUES (10223,'S10_2016',47,110.61,4);
INSERT INTO `order_detail` VALUES (10223,'S10_4698',49,189.79,3);
INSERT INTO `order_detail` VALUES (10223,'S18_2581',47,67.58,9);
INSERT INTO `order_detail` VALUES (10223,'S18_2625',28,58.75,5);
INSERT INTO `order_detail` VALUES (10223,'S24_1578',32,104.81,2);
INSERT INTO `order_detail` VALUES (10223,'S24_1785',34,87.54,11);
INSERT INTO `order_detail` VALUES (10223,'S24_2000',38,60.94,6);
INSERT INTO `order_detail` VALUES (10223,'S24_4278',23,68.10,10);
INSERT INTO `order_detail` VALUES (10223,'S32_1374',21,90.90,7);
INSERT INTO `order_detail` VALUES (10223,'S32_4289',20,66.73,12);
INSERT INTO `order_detail` VALUES (10223,'S50_1341',41,41.02,13);
INSERT INTO `order_detail` VALUES (10223,'S700_1691',25,84.03,14);
INSERT INTO `order_detail` VALUES (10223,'S700_2834',29,113.90,8);
INSERT INTO `order_detail` VALUES (10223,'S700_3167',26,79.20,15);
INSERT INTO `order_detail` VALUES (10224,'S12_2823',43,141.58,6);
INSERT INTO `order_detail` VALUES (10224,'S18_3782',38,57.20,1);
INSERT INTO `order_detail` VALUES (10224,'S24_2360',37,60.26,4);
INSERT INTO `order_detail` VALUES (10224,'S32_2206',43,37.01,2);
INSERT INTO `order_detail` VALUES (10224,'S32_4485',30,94.91,5);
INSERT INTO `order_detail` VALUES (10224,'S50_4713',50,81.36,3);
INSERT INTO `order_detail` VALUES (10225,'S12_1099',27,157.60,9);
INSERT INTO `order_detail` VALUES (10225,'S12_3380',25,101.00,7);
INSERT INTO `order_detail` VALUES (10225,'S12_3990',37,64.64,10);
INSERT INTO `order_detail` VALUES (10225,'S12_4675',21,100.19,6);
INSERT INTO `order_detail` VALUES (10225,'S18_1129',32,116.06,1);
INSERT INTO `order_detail` VALUES (10225,'S18_1889',47,71.61,5);
INSERT INTO `order_detail` VALUES (10225,'S18_3232',43,162.57,2);
INSERT INTO `order_detail` VALUES (10225,'S18_3278',37,69.96,12);
INSERT INTO `order_detail` VALUES (10225,'S18_3482',27,119.06,11);
INSERT INTO `order_detail` VALUES (10225,'S18_4721',35,135.41,14);
INSERT INTO `order_detail` VALUES (10225,'S24_2972',42,34.74,3);
INSERT INTO `order_detail` VALUES (10225,'S24_3371',24,51.43,8);
INSERT INTO `order_detail` VALUES (10225,'S24_3856',40,130.60,4);
INSERT INTO `order_detail` VALUES (10225,'S24_4620',46,77.61,13);
INSERT INTO `order_detail` VALUES (10226,'S18_1589',38,108.26,4);
INSERT INTO `order_detail` VALUES (10226,'S18_1984',24,129.45,7);
INSERT INTO `order_detail` VALUES (10226,'S18_2870',24,125.40,5);
INSERT INTO `order_detail` VALUES (10226,'S18_3685',46,122.91,6);
INSERT INTO `order_detail` VALUES (10226,'S24_1046',21,65.41,1);
INSERT INTO `order_detail` VALUES (10226,'S24_1628',36,47.79,3);
INSERT INTO `order_detail` VALUES (10226,'S24_3432',48,95.30,2);
INSERT INTO `order_detail` VALUES (10227,'S18_1342',25,85.27,3);
INSERT INTO `order_detail` VALUES (10227,'S18_1367',31,50.14,2);
INSERT INTO `order_detail` VALUES (10227,'S18_1749',26,136.00,10);
INSERT INTO `order_detail` VALUES (10227,'S18_2248',28,59.93,9);
INSERT INTO `order_detail` VALUES (10227,'S18_2325',46,118.23,7);
INSERT INTO `order_detail` VALUES (10227,'S18_2795',29,146.81,4);
INSERT INTO `order_detail` VALUES (10227,'S18_3320',33,99.21,1);
INSERT INTO `order_detail` VALUES (10227,'S18_4409',34,87.43,11);
INSERT INTO `order_detail` VALUES (10227,'S18_4933',37,70.56,12);
INSERT INTO `order_detail` VALUES (10227,'S24_1937',42,27.22,6);
INSERT INTO `order_detail` VALUES (10227,'S24_2022',24,39.42,5);
INSERT INTO `order_detail` VALUES (10227,'S24_2766',47,84.51,14);
INSERT INTO `order_detail` VALUES (10227,'S24_2887',33,102.17,13);
INSERT INTO `order_detail` VALUES (10227,'S24_3191',40,78.76,15);
INSERT INTO `order_detail` VALUES (10227,'S24_3969',27,34.88,8);
INSERT INTO `order_detail` VALUES (10228,'S10_1949',29,214.30,2);
INSERT INTO `order_detail` VALUES (10228,'S18_1097',32,100.34,1);
INSERT INTO `order_detail` VALUES (10228,'S18_2949',24,101.31,3);
INSERT INTO `order_detail` VALUES (10228,'S18_2957',45,57.46,5);
INSERT INTO `order_detail` VALUES (10228,'S18_3136',31,100.53,4);
INSERT INTO `order_detail` VALUES (10228,'S24_4258',33,84.73,6);
INSERT INTO `order_detail` VALUES (10229,'S10_4962',50,138.88,9);
INSERT INTO `order_detail` VALUES (10229,'S12_1666',25,110.70,13);
INSERT INTO `order_detail` VALUES (10229,'S12_4473',36,95.99,1);
INSERT INTO `order_detail` VALUES (10229,'S18_2319',26,104.32,4);
INSERT INTO `order_detail` VALUES (10229,'S18_2432',28,53.48,7);
INSERT INTO `order_detail` VALUES (10229,'S18_3232',22,157.49,5);
INSERT INTO `order_detail` VALUES (10229,'S18_4600',41,119.87,10);
INSERT INTO `order_detail` VALUES (10229,'S18_4668',39,43.77,14);
INSERT INTO `order_detail` VALUES (10229,'S24_2300',48,115.01,6);
INSERT INTO `order_detail` VALUES (10229,'S24_2840',33,34.65,2);
INSERT INTO `order_detail` VALUES (10229,'S32_1268',25,78.97,8);
INSERT INTO `order_detail` VALUES (10229,'S32_2509',23,49.78,3);
INSERT INTO `order_detail` VALUES (10229,'S32_3522',30,52.36,12);
INSERT INTO `order_detail` VALUES (10229,'S700_2824',50,91.04,11);
INSERT INTO `order_detail` VALUES (10230,'S12_3148',43,128.42,1);
INSERT INTO `order_detail` VALUES (10230,'S18_2238',49,153.91,8);
INSERT INTO `order_detail` VALUES (10230,'S18_4027',42,142.18,3);
INSERT INTO `order_detail` VALUES (10230,'S24_1444',36,47.40,6);
INSERT INTO `order_detail` VALUES (10230,'S24_4048',45,99.36,5);
INSERT INTO `order_detail` VALUES (10230,'S32_3207',46,59.03,4);
INSERT INTO `order_detail` VALUES (10230,'S50_1392',34,100.70,7);
INSERT INTO `order_detail` VALUES (10230,'S50_1514',43,57.41,2);
INSERT INTO `order_detail` VALUES (10231,'S12_1108',42,193.25,2);
INSERT INTO `order_detail` VALUES (10231,'S12_3891',49,147.07,1);
INSERT INTO `order_detail` VALUES (10232,'S18_3140',22,133.86,6);
INSERT INTO `order_detail` VALUES (10232,'S18_3259',48,97.81,8);
INSERT INTO `order_detail` VALUES (10232,'S18_4522',23,78.12,5);
INSERT INTO `order_detail` VALUES (10232,'S24_2011',46,113.06,4);
INSERT INTO `order_detail` VALUES (10232,'S700_1938',26,84.88,7);
INSERT INTO `order_detail` VALUES (10232,'S700_3505',48,86.15,1);
INSERT INTO `order_detail` VALUES (10232,'S700_3962',35,81.43,2);
INSERT INTO `order_detail` VALUES (10232,'S72_3212',24,48.59,3);
INSERT INTO `order_detail` VALUES (10233,'S24_3151',40,70.81,2);
INSERT INTO `order_detail` VALUES (10233,'S700_1138',36,66.00,3);
INSERT INTO `order_detail` VALUES (10233,'S700_2610',29,67.94,1);
INSERT INTO `order_detail` VALUES (10234,'S10_4757',48,118.32,9);
INSERT INTO `order_detail` VALUES (10234,'S18_1662',50,146.65,1);
INSERT INTO `order_detail` VALUES (10234,'S18_3029',48,84.30,7);
INSERT INTO `order_detail` VALUES (10234,'S18_3856',39,85.75,6);
INSERT INTO `order_detail` VALUES (10234,'S24_2841',44,67.14,2);
INSERT INTO `order_detail` VALUES (10234,'S24_3420',25,65.09,3);
INSERT INTO `order_detail` VALUES (10234,'S24_3816',31,78.83,8);
INSERT INTO `order_detail` VALUES (10234,'S700_2047',29,83.28,5);
INSERT INTO `order_detail` VALUES (10234,'S72_1253',40,45.69,4);
INSERT INTO `order_detail` VALUES (10235,'S18_2581',24,81.95,3);
INSERT INTO `order_detail` VALUES (10235,'S24_1785',23,89.72,5);
INSERT INTO `order_detail` VALUES (10235,'S24_3949',33,55.27,12);
INSERT INTO `order_detail` VALUES (10235,'S24_4278',40,63.03,4);
INSERT INTO `order_detail` VALUES (10235,'S32_1374',41,90.90,1);
INSERT INTO `order_detail` VALUES (10235,'S32_4289',34,66.73,6);
INSERT INTO `order_detail` VALUES (10235,'S50_1341',41,37.09,7);
INSERT INTO `order_detail` VALUES (10235,'S700_1691',25,88.60,8);
INSERT INTO `order_detail` VALUES (10235,'S700_2466',38,92.74,10);
INSERT INTO `order_detail` VALUES (10235,'S700_2834',25,116.28,2);
INSERT INTO `order_detail` VALUES (10235,'S700_3167',32,73.60,9);
INSERT INTO `order_detail` VALUES (10235,'S700_4002',34,70.33,11);
INSERT INTO `order_detail` VALUES (10236,'S10_2016',22,105.86,1);
INSERT INTO `order_detail` VALUES (10236,'S18_2625',23,52.70,2);
INSERT INTO `order_detail` VALUES (10236,'S24_2000',36,65.51,3);
INSERT INTO `order_detail` VALUES (10237,'S10_1678',23,91.87,7);
INSERT INTO `order_detail` VALUES (10237,'S10_4698',39,158.80,9);
INSERT INTO `order_detail` VALUES (10237,'S12_2823',32,129.53,6);
INSERT INTO `order_detail` VALUES (10237,'S18_3782',26,49.74,1);
INSERT INTO `order_detail` VALUES (10237,'S24_1578',20,109.32,8);
INSERT INTO `order_detail` VALUES (10237,'S24_2360',26,62.33,4);
INSERT INTO `order_detail` VALUES (10237,'S32_2206',26,35.00,2);
INSERT INTO `order_detail` VALUES (10237,'S32_4485',27,94.91,5);
INSERT INTO `order_detail` VALUES (10237,'S50_4713',20,78.92,3);
INSERT INTO `order_detail` VALUES (10238,'S12_1099',28,161.49,3);
INSERT INTO `order_detail` VALUES (10238,'S12_3380',29,104.52,1);
INSERT INTO `order_detail` VALUES (10238,'S12_3990',20,73.42,4);
INSERT INTO `order_detail` VALUES (10238,'S18_3278',41,68.35,6);
INSERT INTO `order_detail` VALUES (10238,'S18_3482',49,144.05,5);
INSERT INTO `order_detail` VALUES (10238,'S18_4721',44,120.53,8);
INSERT INTO `order_detail` VALUES (10238,'S24_3371',47,53.88,2);
INSERT INTO `order_detail` VALUES (10238,'S24_4620',22,67.91,7);
INSERT INTO `order_detail` VALUES (10239,'S12_4675',21,100.19,5);
INSERT INTO `order_detail` VALUES (10239,'S18_1889',46,70.07,4);
INSERT INTO `order_detail` VALUES (10239,'S18_3232',47,135.47,1);
INSERT INTO `order_detail` VALUES (10239,'S24_2972',20,32.47,2);
INSERT INTO `order_detail` VALUES (10239,'S24_3856',29,133.41,3);
INSERT INTO `order_detail` VALUES (10240,'S18_1129',41,125.97,3);
INSERT INTO `order_detail` VALUES (10240,'S18_1984',37,136.56,2);
INSERT INTO `order_detail` VALUES (10240,'S18_3685',37,134.22,1);
INSERT INTO `order_detail` VALUES (10241,'S18_1589',21,119.46,11);
INSERT INTO `order_detail` VALUES (10241,'S18_1749',41,153.00,2);
INSERT INTO `order_detail` VALUES (10241,'S18_2248',33,55.70,1);
INSERT INTO `order_detail` VALUES (10241,'S18_2870',44,126.72,12);
INSERT INTO `order_detail` VALUES (10241,'S18_4409',42,77.31,3);
INSERT INTO `order_detail` VALUES (10241,'S18_4933',30,62.72,4);
INSERT INTO `order_detail` VALUES (10241,'S24_1046',22,72.02,8);
INSERT INTO `order_detail` VALUES (10241,'S24_1628',21,47.29,10);
INSERT INTO `order_detail` VALUES (10241,'S24_2766',47,89.05,6);
INSERT INTO `order_detail` VALUES (10241,'S24_2887',28,117.44,5);
INSERT INTO `order_detail` VALUES (10241,'S24_3191',26,69.34,7);
INSERT INTO `order_detail` VALUES (10241,'S24_3432',27,107.08,9);
INSERT INTO `order_detail` VALUES (10242,'S24_3969',46,36.52,1);
INSERT INTO `order_detail` VALUES (10243,'S18_2325',47,111.87,2);
INSERT INTO `order_detail` VALUES (10243,'S24_1937',33,30.87,1);
INSERT INTO `order_detail` VALUES (10244,'S18_1342',40,99.66,7);
INSERT INTO `order_detail` VALUES (10244,'S18_1367',20,48.52,6);
INSERT INTO `order_detail` VALUES (10244,'S18_2795',43,141.75,8);
INSERT INTO `order_detail` VALUES (10244,'S18_2949',30,87.13,1);
INSERT INTO `order_detail` VALUES (10244,'S18_2957',24,54.96,3);
INSERT INTO `order_detail` VALUES (10244,'S18_3136',29,85.87,2);
INSERT INTO `order_detail` VALUES (10244,'S18_3320',36,87.30,5);
INSERT INTO `order_detail` VALUES (10244,'S24_2022',39,42.11,9);
INSERT INTO `order_detail` VALUES (10244,'S24_4258',40,97.39,4);
INSERT INTO `order_detail` VALUES (10245,'S10_1949',34,195.01,9);
INSERT INTO `order_detail` VALUES (10245,'S10_4962',28,147.74,2);
INSERT INTO `order_detail` VALUES (10245,'S12_1666',38,120.27,6);
INSERT INTO `order_detail` VALUES (10245,'S18_1097',29,114.34,8);
INSERT INTO `order_detail` VALUES (10245,'S18_4600',21,111.39,3);
INSERT INTO `order_detail` VALUES (10245,'S18_4668',45,48.80,7);
INSERT INTO `order_detail` VALUES (10245,'S32_1268',37,81.86,1);
INSERT INTO `order_detail` VALUES (10245,'S32_3522',44,54.94,5);
INSERT INTO `order_detail` VALUES (10245,'S700_2824',44,81.93,4);
INSERT INTO `order_detail` VALUES (10246,'S12_4473',46,99.54,5);
INSERT INTO `order_detail` VALUES (10246,'S18_2238',40,144.08,4);
INSERT INTO `order_detail` VALUES (10246,'S18_2319',22,100.64,8);
INSERT INTO `order_detail` VALUES (10246,'S18_2432',30,57.73,11);
INSERT INTO `order_detail` VALUES (10246,'S18_3232',36,145.63,9);
INSERT INTO `order_detail` VALUES (10246,'S24_1444',44,46.24,2);
INSERT INTO `order_detail` VALUES (10246,'S24_2300',29,118.84,10);
INSERT INTO `order_detail` VALUES (10246,'S24_2840',49,34.65,6);
INSERT INTO `order_detail` VALUES (10246,'S24_4048',46,100.54,1);
INSERT INTO `order_detail` VALUES (10246,'S32_2509',35,45.45,7);
INSERT INTO `order_detail` VALUES (10246,'S50_1392',22,113.44,3);
INSERT INTO `order_detail` VALUES (10247,'S12_1108',44,195.33,2);
INSERT INTO `order_detail` VALUES (10247,'S12_3148',25,140.50,3);
INSERT INTO `order_detail` VALUES (10247,'S12_3891',27,167.83,1);
INSERT INTO `order_detail` VALUES (10247,'S18_4027',48,143.62,5);
INSERT INTO `order_detail` VALUES (10247,'S32_3207',40,58.41,6);
INSERT INTO `order_detail` VALUES (10247,'S50_1514',49,51.55,4);
INSERT INTO `order_detail` VALUES (10248,'S10_4757',20,126.48,3);
INSERT INTO `order_detail` VALUES (10248,'S18_3029',21,80.86,1);
INSERT INTO `order_detail` VALUES (10248,'S18_3140',32,133.86,12);
INSERT INTO `order_detail` VALUES (10248,'S18_3259',42,95.80,14);
INSERT INTO `order_detail` VALUES (10248,'S18_4522',42,87.77,11);
INSERT INTO `order_detail` VALUES (10248,'S24_2011',48,122.89,10);
INSERT INTO `order_detail` VALUES (10248,'S24_3151',30,85.85,5);
INSERT INTO `order_detail` VALUES (10248,'S24_3816',23,83.02,2);
INSERT INTO `order_detail` VALUES (10248,'S700_1138',36,66.00,6);
INSERT INTO `order_detail` VALUES (10248,'S700_1938',40,81.41,13);
INSERT INTO `order_detail` VALUES (10248,'S700_2610',32,69.39,4);
INSERT INTO `order_detail` VALUES (10248,'S700_3505',30,84.14,7);
INSERT INTO `order_detail` VALUES (10248,'S700_3962',35,92.36,8);
INSERT INTO `order_detail` VALUES (10248,'S72_3212',23,53.51,9);
INSERT INTO `order_detail` VALUES (10249,'S18_3856',46,88.93,5);
INSERT INTO `order_detail` VALUES (10249,'S24_2841',20,54.81,1);
INSERT INTO `order_detail` VALUES (10249,'S24_3420',25,65.75,2);
INSERT INTO `order_detail` VALUES (10249,'S700_2047',40,85.99,4);
INSERT INTO `order_detail` VALUES (10249,'S72_1253',32,49.16,3);
INSERT INTO `order_detail` VALUES (10250,'S18_1662',45,148.23,14);
INSERT INTO `order_detail` VALUES (10250,'S18_2581',27,84.48,4);
INSERT INTO `order_detail` VALUES (10250,'S24_1785',31,95.20,6);
INSERT INTO `order_detail` VALUES (10250,'S24_2000',32,63.22,1);
INSERT INTO `order_detail` VALUES (10250,'S24_3949',40,61.42,13);
INSERT INTO `order_detail` VALUES (10250,'S24_4278',37,72.45,5);
INSERT INTO `order_detail` VALUES (10250,'S32_1374',31,99.89,2);
INSERT INTO `order_detail` VALUES (10250,'S32_4289',50,62.60,7);
INSERT INTO `order_detail` VALUES (10250,'S50_1341',36,36.66,8);
INSERT INTO `order_detail` VALUES (10250,'S700_1691',31,91.34,9);
INSERT INTO `order_detail` VALUES (10250,'S700_2466',35,90.75,11);
INSERT INTO `order_detail` VALUES (10250,'S700_2834',44,98.48,3);
INSERT INTO `order_detail` VALUES (10250,'S700_3167',44,76.00,10);
INSERT INTO `order_detail` VALUES (10250,'S700_4002',38,65.89,12);
INSERT INTO `order_detail` VALUES (10251,'S10_1678',59,93.79,2);
INSERT INTO `order_detail` VALUES (10251,'S10_2016',44,115.37,5);
INSERT INTO `order_detail` VALUES (10251,'S10_4698',43,172.36,4);
INSERT INTO `order_detail` VALUES (10251,'S12_2823',46,129.53,1);
INSERT INTO `order_detail` VALUES (10251,'S18_2625',44,58.15,6);
INSERT INTO `order_detail` VALUES (10251,'S24_1578',50,91.29,3);
INSERT INTO `order_detail` VALUES (10252,'S18_3278',20,74.78,2);
INSERT INTO `order_detail` VALUES (10252,'S18_3482',41,145.52,1);
INSERT INTO `order_detail` VALUES (10252,'S18_3782',31,50.36,5);
INSERT INTO `order_detail` VALUES (10252,'S18_4721',26,127.97,4);
INSERT INTO `order_detail` VALUES (10252,'S24_2360',47,63.03,8);
INSERT INTO `order_detail` VALUES (10252,'S24_4620',38,69.52,3);
INSERT INTO `order_detail` VALUES (10252,'S32_2206',36,36.21,6);
INSERT INTO `order_detail` VALUES (10252,'S32_4485',25,93.89,9);
INSERT INTO `order_detail` VALUES (10252,'S50_4713',48,72.41,7);
INSERT INTO `order_detail` VALUES (10253,'S12_1099',24,157.60,13);
INSERT INTO `order_detail` VALUES (10253,'S12_3380',22,102.17,11);
INSERT INTO `order_detail` VALUES (10253,'S12_3990',25,67.03,14);
INSERT INTO `order_detail` VALUES (10253,'S12_4675',41,109.40,10);
INSERT INTO `order_detail` VALUES (10253,'S18_1129',26,130.22,5);
INSERT INTO `order_detail` VALUES (10253,'S18_1589',24,103.29,1);
INSERT INTO `order_detail` VALUES (10253,'S18_1889',23,67.76,9);
INSERT INTO `order_detail` VALUES (10253,'S18_1984',33,130.87,4);
INSERT INTO `order_detail` VALUES (10253,'S18_2870',37,114.84,2);
INSERT INTO `order_detail` VALUES (10253,'S18_3232',40,145.63,6);
INSERT INTO `order_detail` VALUES (10253,'S18_3685',31,139.87,3);
INSERT INTO `order_detail` VALUES (10253,'S24_2972',40,34.74,7);
INSERT INTO `order_detail` VALUES (10253,'S24_3371',24,50.82,12);
INSERT INTO `order_detail` VALUES (10253,'S24_3856',39,115.15,8);
INSERT INTO `order_detail` VALUES (10254,'S18_1749',49,137.70,5);
INSERT INTO `order_detail` VALUES (10254,'S18_2248',36,55.09,4);
INSERT INTO `order_detail` VALUES (10254,'S18_2325',41,102.98,2);
INSERT INTO `order_detail` VALUES (10254,'S18_4409',34,80.99,6);
INSERT INTO `order_detail` VALUES (10254,'S18_4933',30,59.87,7);
INSERT INTO `order_detail` VALUES (10254,'S24_1046',34,66.88,11);
INSERT INTO `order_detail` VALUES (10254,'S24_1628',32,43.27,13);
INSERT INTO `order_detail` VALUES (10254,'S24_1937',38,28.88,1);
INSERT INTO `order_detail` VALUES (10254,'S24_2766',31,85.42,9);
INSERT INTO `order_detail` VALUES (10254,'S24_2887',33,111.57,8);
INSERT INTO `order_detail` VALUES (10254,'S24_3191',42,69.34,10);
INSERT INTO `order_detail` VALUES (10254,'S24_3432',49,101.73,12);
INSERT INTO `order_detail` VALUES (10254,'S24_3969',20,39.80,3);
INSERT INTO `order_detail` VALUES (10255,'S18_2795',24,135.00,1);
INSERT INTO `order_detail` VALUES (10255,'S24_2022',37,37.63,2);
INSERT INTO `order_detail` VALUES (10256,'S18_1342',34,93.49,2);
INSERT INTO `order_detail` VALUES (10256,'S18_1367',29,52.83,1);
INSERT INTO `order_detail` VALUES (10257,'S18_2949',50,92.19,1);
INSERT INTO `order_detail` VALUES (10257,'S18_2957',49,59.34,3);
INSERT INTO `order_detail` VALUES (10257,'S18_3136',37,83.78,2);
INSERT INTO `order_detail` VALUES (10257,'S18_3320',26,91.27,5);
INSERT INTO `order_detail` VALUES (10257,'S24_4258',46,81.81,4);
INSERT INTO `order_detail` VALUES (10258,'S10_1949',32,177.87,6);
INSERT INTO `order_detail` VALUES (10258,'S12_1666',41,133.94,3);
INSERT INTO `order_detail` VALUES (10258,'S18_1097',41,113.17,5);
INSERT INTO `order_detail` VALUES (10258,'S18_4668',21,49.81,4);
INSERT INTO `order_detail` VALUES (10258,'S32_3522',20,62.70,2);
INSERT INTO `order_detail` VALUES (10258,'S700_2824',45,86.99,1);
INSERT INTO `order_detail` VALUES (10259,'S10_4962',26,121.15,12);
INSERT INTO `order_detail` VALUES (10259,'S12_4473',46,117.32,4);
INSERT INTO `order_detail` VALUES (10259,'S18_2238',30,134.26,3);
INSERT INTO `order_detail` VALUES (10259,'S18_2319',34,120.28,7);
INSERT INTO `order_detail` VALUES (10259,'S18_2432',30,59.55,10);
INSERT INTO `order_detail` VALUES (10259,'S18_3232',27,152.41,8);
INSERT INTO `order_detail` VALUES (10259,'S18_4600',41,107.76,13);
INSERT INTO `order_detail` VALUES (10259,'S24_1444',28,46.82,1);
INSERT INTO `order_detail` VALUES (10259,'S24_2300',47,121.40,9);
INSERT INTO `order_detail` VALUES (10259,'S24_2840',31,31.47,5);
INSERT INTO `order_detail` VALUES (10259,'S32_1268',45,95.35,11);
INSERT INTO `order_detail` VALUES (10259,'S32_2509',40,45.99,6);
INSERT INTO `order_detail` VALUES (10259,'S50_1392',29,105.33,2);
INSERT INTO `order_detail` VALUES (10260,'S12_1108',46,180.79,5);
INSERT INTO `order_detail` VALUES (10260,'S12_3148',30,140.50,6);
INSERT INTO `order_detail` VALUES (10260,'S12_3891',44,169.56,4);
INSERT INTO `order_detail` VALUES (10260,'S18_3140',32,121.57,1);
INSERT INTO `order_detail` VALUES (10260,'S18_3259',29,92.77,3);
INSERT INTO `order_detail` VALUES (10260,'S18_4027',23,137.88,8);
INSERT INTO `order_detail` VALUES (10260,'S24_4048',23,117.10,10);
INSERT INTO `order_detail` VALUES (10260,'S32_3207',27,55.30,9);
INSERT INTO `order_detail` VALUES (10260,'S50_1514',21,56.24,7);
INSERT INTO `order_detail` VALUES (10260,'S700_1938',33,80.55,2);
INSERT INTO `order_detail` VALUES (10261,'S10_4757',27,116.96,1);
INSERT INTO `order_detail` VALUES (10261,'S18_4522',20,80.75,9);
INSERT INTO `order_detail` VALUES (10261,'S24_2011',36,105.69,8);
INSERT INTO `order_detail` VALUES (10261,'S24_3151',22,79.66,3);
INSERT INTO `order_detail` VALUES (10261,'S700_1138',34,64.00,4);
INSERT INTO `order_detail` VALUES (10261,'S700_2610',44,58.55,2);
INSERT INTO `order_detail` VALUES (10261,'S700_3505',25,89.15,5);
INSERT INTO `order_detail` VALUES (10261,'S700_3962',50,88.39,6);
INSERT INTO `order_detail` VALUES (10261,'S72_3212',29,43.68,7);
INSERT INTO `order_detail` VALUES (10262,'S18_1662',49,157.69,9);
INSERT INTO `order_detail` VALUES (10262,'S18_3029',32,81.72,15);
INSERT INTO `order_detail` VALUES (10262,'S18_3856',34,85.75,14);
INSERT INTO `order_detail` VALUES (10262,'S24_1785',34,98.48,1);
INSERT INTO `order_detail` VALUES (10262,'S24_2841',24,63.71,10);
INSERT INTO `order_detail` VALUES (10262,'S24_3420',46,65.75,11);
INSERT INTO `order_detail` VALUES (10262,'S24_3816',49,82.18,16);
INSERT INTO `order_detail` VALUES (10262,'S24_3949',48,58.69,8);
INSERT INTO `order_detail` VALUES (10262,'S32_4289',40,63.97,2);
INSERT INTO `order_detail` VALUES (10262,'S50_1341',49,35.78,3);
INSERT INTO `order_detail` VALUES (10262,'S700_1691',40,87.69,4);
INSERT INTO `order_detail` VALUES (10262,'S700_2047',44,83.28,13);
INSERT INTO `order_detail` VALUES (10262,'S700_2466',33,81.77,6);
INSERT INTO `order_detail` VALUES (10262,'S700_3167',27,64.80,5);
INSERT INTO `order_detail` VALUES (10262,'S700_4002',35,64.41,7);
INSERT INTO `order_detail` VALUES (10262,'S72_1253',21,41.71,12);
INSERT INTO `order_detail` VALUES (10263,'S10_1678',34,89.00,2);
INSERT INTO `order_detail` VALUES (10263,'S10_2016',40,107.05,5);
INSERT INTO `order_detail` VALUES (10263,'S10_4698',41,193.66,4);
INSERT INTO `order_detail` VALUES (10263,'S12_2823',48,123.51,1);
INSERT INTO `order_detail` VALUES (10263,'S18_2581',33,67.58,10);
INSERT INTO `order_detail` VALUES (10263,'S18_2625',34,50.27,6);
INSERT INTO `order_detail` VALUES (10263,'S24_1578',42,109.32,3);
INSERT INTO `order_detail` VALUES (10263,'S24_2000',37,67.03,7);
INSERT INTO `order_detail` VALUES (10263,'S24_4278',24,59.41,11);
INSERT INTO `order_detail` VALUES (10263,'S32_1374',31,93.90,8);
INSERT INTO `order_detail` VALUES (10263,'S700_2834',47,117.46,9);
INSERT INTO `order_detail` VALUES (10264,'S18_3782',48,58.44,3);
INSERT INTO `order_detail` VALUES (10264,'S18_4721',20,124.99,2);
INSERT INTO `order_detail` VALUES (10264,'S24_2360',37,61.64,6);
INSERT INTO `order_detail` VALUES (10264,'S24_4620',47,75.18,1);
INSERT INTO `order_detail` VALUES (10264,'S32_2206',20,39.02,4);
INSERT INTO `order_detail` VALUES (10264,'S32_4485',34,100.01,7);
INSERT INTO `order_detail` VALUES (10264,'S50_4713',47,67.53,5);
INSERT INTO `order_detail` VALUES (10265,'S18_3278',45,74.78,2);
INSERT INTO `order_detail` VALUES (10265,'S18_3482',49,123.47,1);
INSERT INTO `order_detail` VALUES (10266,'S12_1099',44,188.73,14);
INSERT INTO `order_detail` VALUES (10266,'S12_3380',22,110.39,12);
INSERT INTO `order_detail` VALUES (10266,'S12_3990',35,67.83,15);
INSERT INTO `order_detail` VALUES (10266,'S12_4675',40,112.86,11);
INSERT INTO `order_detail` VALUES (10266,'S18_1129',21,131.63,6);
INSERT INTO `order_detail` VALUES (10266,'S18_1589',36,99.55,2);
INSERT INTO `order_detail` VALUES (10266,'S18_1889',33,77.00,10);
INSERT INTO `order_detail` VALUES (10266,'S18_1984',49,139.41,5);
INSERT INTO `order_detail` VALUES (10266,'S18_2870',20,113.52,3);
INSERT INTO `order_detail` VALUES (10266,'S18_3232',29,137.17,7);
INSERT INTO `order_detail` VALUES (10266,'S18_3685',33,127.15,4);
INSERT INTO `order_detail` VALUES (10266,'S24_1628',28,40.25,1);
INSERT INTO `order_detail` VALUES (10266,'S24_2972',34,35.12,8);
INSERT INTO `order_detail` VALUES (10266,'S24_3371',47,56.33,13);
INSERT INTO `order_detail` VALUES (10266,'S24_3856',24,119.37,9);
INSERT INTO `order_detail` VALUES (10267,'S18_4933',36,71.27,1);
INSERT INTO `order_detail` VALUES (10267,'S24_1046',40,72.02,5);
INSERT INTO `order_detail` VALUES (10267,'S24_2766',38,76.33,3);
INSERT INTO `order_detail` VALUES (10267,'S24_2887',43,93.95,2);
INSERT INTO `order_detail` VALUES (10267,'S24_3191',44,83.90,4);
INSERT INTO `order_detail` VALUES (10267,'S24_3432',43,98.51,6);
INSERT INTO `order_detail` VALUES (10268,'S18_1342',49,93.49,3);
INSERT INTO `order_detail` VALUES (10268,'S18_1367',26,45.82,2);
INSERT INTO `order_detail` VALUES (10268,'S18_1749',34,164.90,10);
INSERT INTO `order_detail` VALUES (10268,'S18_2248',31,60.54,9);
INSERT INTO `order_detail` VALUES (10268,'S18_2325',50,124.59,7);
INSERT INTO `order_detail` VALUES (10268,'S18_2795',35,148.50,4);
INSERT INTO `order_detail` VALUES (10268,'S18_3320',39,96.23,1);
INSERT INTO `order_detail` VALUES (10268,'S18_4409',35,84.67,11);
INSERT INTO `order_detail` VALUES (10268,'S24_1937',33,31.86,6);
INSERT INTO `order_detail` VALUES (10268,'S24_2022',40,36.29,5);
INSERT INTO `order_detail` VALUES (10268,'S24_3969',30,37.75,8);
INSERT INTO `order_detail` VALUES (10269,'S18_2957',32,57.46,1);
INSERT INTO `order_detail` VALUES (10269,'S24_4258',48,95.44,2);
INSERT INTO `order_detail` VALUES (10270,'S10_1949',21,171.44,9);
INSERT INTO `order_detail` VALUES (10270,'S10_4962',32,124.10,2);
INSERT INTO `order_detail` VALUES (10270,'S12_1666',28,135.30,6);
INSERT INTO `order_detail` VALUES (10270,'S18_1097',43,94.50,8);
INSERT INTO `order_detail` VALUES (10270,'S18_2949',31,81.05,10);
INSERT INTO `order_detail` VALUES (10270,'S18_3136',38,85.87,11);
INSERT INTO `order_detail` VALUES (10270,'S18_4600',38,107.76,3);
INSERT INTO `order_detail` VALUES (10270,'S18_4668',44,40.25,7);
INSERT INTO `order_detail` VALUES (10270,'S32_1268',32,93.42,1);
INSERT INTO `order_detail` VALUES (10270,'S32_3522',21,52.36,5);
INSERT INTO `order_detail` VALUES (10270,'S700_2824',46,101.15,4);
INSERT INTO `order_detail` VALUES (10271,'S12_4473',31,99.54,5);
INSERT INTO `order_detail` VALUES (10271,'S18_2238',50,147.36,4);
INSERT INTO `order_detail` VALUES (10271,'S18_2319',50,121.50,8);
INSERT INTO `order_detail` VALUES (10271,'S18_2432',25,59.55,11);
INSERT INTO `order_detail` VALUES (10271,'S18_3232',20,169.34,9);
INSERT INTO `order_detail` VALUES (10271,'S24_1444',45,49.71,2);
INSERT INTO `order_detail` VALUES (10271,'S24_2300',43,122.68,10);
INSERT INTO `order_detail` VALUES (10271,'S24_2840',38,28.64,6);
INSERT INTO `order_detail` VALUES (10271,'S24_4048',22,110.00,1);
INSERT INTO `order_detail` VALUES (10271,'S32_2509',35,51.95,7);
INSERT INTO `order_detail` VALUES (10271,'S50_1392',34,93.76,3);
INSERT INTO `order_detail` VALUES (10272,'S12_1108',35,187.02,2);
INSERT INTO `order_detail` VALUES (10272,'S12_3148',27,123.89,3);
INSERT INTO `order_detail` VALUES (10272,'S12_3891',39,148.80,1);
INSERT INTO `order_detail` VALUES (10272,'S18_4027',25,126.39,5);
INSERT INTO `order_detail` VALUES (10272,'S32_3207',45,56.55,6);
INSERT INTO `order_detail` VALUES (10272,'S50_1514',43,53.89,4);
INSERT INTO `order_detail` VALUES (10273,'S10_4757',30,136.00,4);
INSERT INTO `order_detail` VALUES (10273,'S18_3029',34,84.30,2);
INSERT INTO `order_detail` VALUES (10273,'S18_3140',40,117.47,13);
INSERT INTO `order_detail` VALUES (10273,'S18_3259',47,87.73,15);
INSERT INTO `order_detail` VALUES (10273,'S18_3856',50,105.87,1);
INSERT INTO `order_detail` VALUES (10273,'S18_4522',33,72.85,12);
INSERT INTO `order_detail` VALUES (10273,'S24_2011',22,103.23,11);
INSERT INTO `order_detail` VALUES (10273,'S24_3151',27,84.08,6);
INSERT INTO `order_detail` VALUES (10273,'S24_3816',48,83.86,3);
INSERT INTO `order_detail` VALUES (10273,'S700_1138',21,66.00,7);
INSERT INTO `order_detail` VALUES (10273,'S700_1938',21,77.95,14);
INSERT INTO `order_detail` VALUES (10273,'S700_2610',42,57.82,5);
INSERT INTO `order_detail` VALUES (10273,'S700_3505',40,91.15,8);
INSERT INTO `order_detail` VALUES (10273,'S700_3962',26,89.38,9);
INSERT INTO `order_detail` VALUES (10273,'S72_3212',37,51.32,10);
INSERT INTO `order_detail` VALUES (10274,'S18_1662',41,129.31,1);
INSERT INTO `order_detail` VALUES (10274,'S24_2841',40,56.86,2);
INSERT INTO `order_detail` VALUES (10274,'S24_3420',24,65.09,3);
INSERT INTO `order_detail` VALUES (10274,'S700_2047',24,75.13,5);
INSERT INTO `order_detail` VALUES (10274,'S72_1253',32,49.66,4);
INSERT INTO `order_detail` VALUES (10275,'S10_1678',45,81.35,1);
INSERT INTO `order_detail` VALUES (10275,'S10_2016',22,115.37,4);
INSERT INTO `order_detail` VALUES (10275,'S10_4698',36,154.93,3);
INSERT INTO `order_detail` VALUES (10275,'S18_2581',35,70.12,9);
INSERT INTO `order_detail` VALUES (10275,'S18_2625',37,52.09,5);
INSERT INTO `order_detail` VALUES (10275,'S24_1578',21,105.94,2);
INSERT INTO `order_detail` VALUES (10275,'S24_1785',25,97.38,11);
INSERT INTO `order_detail` VALUES (10275,'S24_2000',30,61.70,6);
INSERT INTO `order_detail` VALUES (10275,'S24_3949',41,58.00,18);
INSERT INTO `order_detail` VALUES (10275,'S24_4278',27,67.38,10);
INSERT INTO `order_detail` VALUES (10275,'S32_1374',23,89.90,7);
INSERT INTO `order_detail` VALUES (10275,'S32_4289',28,58.47,12);
INSERT INTO `order_detail` VALUES (10275,'S50_1341',38,40.15,13);
INSERT INTO `order_detail` VALUES (10275,'S700_1691',32,85.86,14);
INSERT INTO `order_detail` VALUES (10275,'S700_2466',39,82.77,16);
INSERT INTO `order_detail` VALUES (10275,'S700_2834',48,102.04,8);
INSERT INTO `order_detail` VALUES (10275,'S700_3167',43,72.00,15);
INSERT INTO `order_detail` VALUES (10275,'S700_4002',31,59.96,17);
INSERT INTO `order_detail` VALUES (10276,'S12_1099',50,184.84,3);
INSERT INTO `order_detail` VALUES (10276,'S12_2823',43,150.62,14);
INSERT INTO `order_detail` VALUES (10276,'S12_3380',47,104.52,1);
INSERT INTO `order_detail` VALUES (10276,'S12_3990',38,67.83,4);
INSERT INTO `order_detail` VALUES (10276,'S18_3278',38,78.00,6);
INSERT INTO `order_detail` VALUES (10276,'S18_3482',30,139.64,5);
INSERT INTO `order_detail` VALUES (10276,'S18_3782',33,54.71,9);
INSERT INTO `order_detail` VALUES (10276,'S18_4721',48,120.53,8);
INSERT INTO `order_detail` VALUES (10276,'S24_2360',46,61.64,12);
INSERT INTO `order_detail` VALUES (10276,'S24_3371',20,58.17,2);
INSERT INTO `order_detail` VALUES (10276,'S24_4620',48,67.10,7);
INSERT INTO `order_detail` VALUES (10276,'S32_2206',27,35.40,10);
INSERT INTO `order_detail` VALUES (10276,'S32_4485',38,94.91,13);
INSERT INTO `order_detail` VALUES (10276,'S50_4713',21,67.53,11);
INSERT INTO `order_detail` VALUES (10277,'S12_4675',28,93.28,1);
INSERT INTO `order_detail` VALUES (10278,'S18_1129',34,114.65,6);
INSERT INTO `order_detail` VALUES (10278,'S18_1589',23,107.02,2);
INSERT INTO `order_detail` VALUES (10278,'S18_1889',29,73.15,10);
INSERT INTO `order_detail` VALUES (10278,'S18_1984',29,118.07,5);
INSERT INTO `order_detail` VALUES (10278,'S18_2870',39,117.48,3);
INSERT INTO `order_detail` VALUES (10278,'S18_3232',42,167.65,7);
INSERT INTO `order_detail` VALUES (10278,'S18_3685',31,114.44,4);
INSERT INTO `order_detail` VALUES (10278,'S24_1628',35,48.80,1);
INSERT INTO `order_detail` VALUES (10278,'S24_2972',31,37.38,8);
INSERT INTO `order_detail` VALUES (10278,'S24_3856',25,136.22,9);
INSERT INTO `order_detail` VALUES (10279,'S18_4933',26,68.42,1);
INSERT INTO `order_detail` VALUES (10279,'S24_1046',32,68.35,5);
INSERT INTO `order_detail` VALUES (10279,'S24_2766',49,76.33,3);
INSERT INTO `order_detail` VALUES (10279,'S24_2887',48,106.87,2);
INSERT INTO `order_detail` VALUES (10279,'S24_3191',33,78.76,4);
INSERT INTO `order_detail` VALUES (10279,'S24_3432',48,95.30,6);
INSERT INTO `order_detail` VALUES (10280,'S10_1949',34,205.73,2);
INSERT INTO `order_detail` VALUES (10280,'S18_1097',24,98.00,1);
INSERT INTO `order_detail` VALUES (10280,'S18_1342',50,87.33,9);
INSERT INTO `order_detail` VALUES (10280,'S18_1367',27,47.44,8);
INSERT INTO `order_detail` VALUES (10280,'S18_1749',26,161.50,16);
INSERT INTO `order_detail` VALUES (10280,'S18_2248',25,53.28,15);
INSERT INTO `order_detail` VALUES (10280,'S18_2325',37,109.33,13);
INSERT INTO `order_detail` VALUES (10280,'S18_2795',22,158.63,10);
INSERT INTO `order_detail` VALUES (10280,'S18_2949',46,82.06,3);
INSERT INTO `order_detail` VALUES (10280,'S18_2957',43,54.34,5);
INSERT INTO `order_detail` VALUES (10280,'S18_3136',29,102.63,4);
INSERT INTO `order_detail` VALUES (10280,'S18_3320',34,99.21,7);
INSERT INTO `order_detail` VALUES (10280,'S18_4409',35,77.31,17);
INSERT INTO `order_detail` VALUES (10280,'S24_1937',20,29.87,12);
INSERT INTO `order_detail` VALUES (10280,'S24_2022',45,36.29,11);
INSERT INTO `order_detail` VALUES (10280,'S24_3969',33,35.29,14);
INSERT INTO `order_detail` VALUES (10280,'S24_4258',21,79.86,6);
INSERT INTO `order_detail` VALUES (10281,'S10_4962',44,132.97,9);
INSERT INTO `order_detail` VALUES (10281,'S12_1666',25,127.10,13);
INSERT INTO `order_detail` VALUES (10281,'S12_4473',41,98.36,1);
INSERT INTO `order_detail` VALUES (10281,'S18_2319',48,114.14,4);
INSERT INTO `order_detail` VALUES (10281,'S18_2432',29,56.52,7);
INSERT INTO `order_detail` VALUES (10281,'S18_3232',25,135.47,5);
INSERT INTO `order_detail` VALUES (10281,'S18_4600',25,96.86,10);
INSERT INTO `order_detail` VALUES (10281,'S18_4668',44,42.76,14);
INSERT INTO `order_detail` VALUES (10281,'S24_2300',25,112.46,6);
INSERT INTO `order_detail` VALUES (10281,'S24_2840',20,33.95,2);
INSERT INTO `order_detail` VALUES (10281,'S32_1268',29,80.90,8);
INSERT INTO `order_detail` VALUES (10281,'S32_2509',31,44.91,3);
INSERT INTO `order_detail` VALUES (10281,'S32_3522',36,59.47,12);
INSERT INTO `order_detail` VALUES (10281,'S700_2824',27,89.01,11);
INSERT INTO `order_detail` VALUES (10282,'S12_1108',41,176.63,5);
INSERT INTO `order_detail` VALUES (10282,'S12_3148',27,142.02,6);
INSERT INTO `order_detail` VALUES (10282,'S12_3891',24,169.56,4);
INSERT INTO `order_detail` VALUES (10282,'S18_2238',23,147.36,13);
INSERT INTO `order_detail` VALUES (10282,'S18_3140',43,122.93,1);
INSERT INTO `order_detail` VALUES (10282,'S18_3259',36,88.74,3);
INSERT INTO `order_detail` VALUES (10282,'S18_4027',31,132.13,8);
INSERT INTO `order_detail` VALUES (10282,'S24_1444',29,49.71,11);
INSERT INTO `order_detail` VALUES (10282,'S24_4048',39,96.99,10);
INSERT INTO `order_detail` VALUES (10282,'S32_3207',36,51.58,9);
INSERT INTO `order_detail` VALUES (10282,'S50_1392',38,114.59,12);
INSERT INTO `order_detail` VALUES (10282,'S50_1514',37,56.24,7);
INSERT INTO `order_detail` VALUES (10282,'S700_1938',43,77.95,2);
INSERT INTO `order_detail` VALUES (10283,'S10_4757',25,130.56,6);
INSERT INTO `order_detail` VALUES (10283,'S18_3029',21,78.28,4);
INSERT INTO `order_detail` VALUES (10283,'S18_3856',46,100.58,3);
INSERT INTO `order_detail` VALUES (10283,'S18_4522',34,71.97,14);
INSERT INTO `order_detail` VALUES (10283,'S24_2011',42,99.54,13);
INSERT INTO `order_detail` VALUES (10283,'S24_3151',34,80.54,8);
INSERT INTO `order_detail` VALUES (10283,'S24_3816',33,77.15,5);
INSERT INTO `order_detail` VALUES (10283,'S700_1138',45,62.00,9);
INSERT INTO `order_detail` VALUES (10283,'S700_2047',20,74.23,2);
INSERT INTO `order_detail` VALUES (10283,'S700_2610',47,68.67,7);
INSERT INTO `order_detail` VALUES (10283,'S700_3505',22,88.15,10);
INSERT INTO `order_detail` VALUES (10283,'S700_3962',38,85.41,11);
INSERT INTO `order_detail` VALUES (10283,'S72_1253',43,41.22,1);
INSERT INTO `order_detail` VALUES (10283,'S72_3212',33,49.14,12);
INSERT INTO `order_detail` VALUES (10284,'S18_1662',45,137.19,11);
INSERT INTO `order_detail` VALUES (10284,'S18_2581',31,68.43,1);
INSERT INTO `order_detail` VALUES (10284,'S24_1785',22,101.76,3);
INSERT INTO `order_detail` VALUES (10284,'S24_2841',30,65.08,12);
INSERT INTO `order_detail` VALUES (10284,'S24_3420',39,59.83,13);
INSERT INTO `order_detail` VALUES (10284,'S24_3949',21,65.51,10);
INSERT INTO `order_detail` VALUES (10284,'S24_4278',21,66.65,2);
INSERT INTO `order_detail` VALUES (10284,'S32_4289',50,60.54,4);
INSERT INTO `order_detail` VALUES (10284,'S50_1341',33,35.78,5);
INSERT INTO `order_detail` VALUES (10284,'S700_1691',24,87.69,6);
INSERT INTO `order_detail` VALUES (10284,'S700_2466',45,95.73,8);
INSERT INTO `order_detail` VALUES (10284,'S700_3167',25,68.00,7);
INSERT INTO `order_detail` VALUES (10284,'S700_4002',32,73.29,9);
INSERT INTO `order_detail` VALUES (10285,'S10_1678',36,95.70,6);
INSERT INTO `order_detail` VALUES (10285,'S10_2016',47,110.61,9);
INSERT INTO `order_detail` VALUES (10285,'S10_4698',27,166.55,8);
INSERT INTO `order_detail` VALUES (10285,'S12_2823',49,131.04,5);
INSERT INTO `order_detail` VALUES (10285,'S18_2625',20,50.88,10);
INSERT INTO `order_detail` VALUES (10285,'S24_1578',34,91.29,7);
INSERT INTO `order_detail` VALUES (10285,'S24_2000',39,61.70,11);
INSERT INTO `order_detail` VALUES (10285,'S24_2360',38,64.41,3);
INSERT INTO `order_detail` VALUES (10285,'S32_1374',37,82.91,12);
INSERT INTO `order_detail` VALUES (10285,'S32_2206',37,36.61,1);
INSERT INTO `order_detail` VALUES (10285,'S32_4485',26,100.01,4);
INSERT INTO `order_detail` VALUES (10285,'S50_4713',39,76.48,2);
INSERT INTO `order_detail` VALUES (10285,'S700_2834',45,102.04,13);
INSERT INTO `order_detail` VALUES (10286,'S18_3782',38,51.60,1);
INSERT INTO `order_detail` VALUES (10287,'S12_1099',21,190.68,12);
INSERT INTO `order_detail` VALUES (10287,'S12_3380',45,117.44,10);
INSERT INTO `order_detail` VALUES (10287,'S12_3990',41,74.21,13);
INSERT INTO `order_detail` VALUES (10287,'S12_4675',23,107.10,9);
INSERT INTO `order_detail` VALUES (10287,'S18_1129',41,113.23,4);
INSERT INTO `order_detail` VALUES (10287,'S18_1889',44,61.60,8);
INSERT INTO `order_detail` VALUES (10287,'S18_1984',24,123.76,3);
INSERT INTO `order_detail` VALUES (10287,'S18_2870',44,114.84,1);
INSERT INTO `order_detail` VALUES (10287,'S18_3232',36,137.17,5);
INSERT INTO `order_detail` VALUES (10287,'S18_3278',43,68.35,15);
INSERT INTO `order_detail` VALUES (10287,'S18_3482',40,127.88,14);
INSERT INTO `order_detail` VALUES (10287,'S18_3685',27,139.87,2);
INSERT INTO `order_detail` VALUES (10287,'S18_4721',34,119.04,17);
INSERT INTO `order_detail` VALUES (10287,'S24_2972',36,31.34,6);
INSERT INTO `order_detail` VALUES (10287,'S24_3371',20,58.17,11);
INSERT INTO `order_detail` VALUES (10287,'S24_3856',36,137.62,7);
INSERT INTO `order_detail` VALUES (10287,'S24_4620',40,79.22,16);
INSERT INTO `order_detail` VALUES (10288,'S18_1589',20,120.71,14);
INSERT INTO `order_detail` VALUES (10288,'S18_1749',32,168.30,5);
INSERT INTO `order_detail` VALUES (10288,'S18_2248',28,50.25,4);
INSERT INTO `order_detail` VALUES (10288,'S18_2325',31,102.98,2);
INSERT INTO `order_detail` VALUES (10288,'S18_4409',35,90.19,6);
INSERT INTO `order_detail` VALUES (10288,'S18_4933',23,57.02,7);
INSERT INTO `order_detail` VALUES (10288,'S24_1046',36,66.88,11);
INSERT INTO `order_detail` VALUES (10288,'S24_1628',50,49.30,13);
INSERT INTO `order_detail` VALUES (10288,'S24_1937',29,32.19,1);
INSERT INTO `order_detail` VALUES (10288,'S24_2766',35,81.78,9);
INSERT INTO `order_detail` VALUES (10288,'S24_2887',48,109.22,8);
INSERT INTO `order_detail` VALUES (10288,'S24_3191',34,76.19,10);
INSERT INTO `order_detail` VALUES (10288,'S24_3432',41,101.73,12);
INSERT INTO `order_detail` VALUES (10288,'S24_3969',33,37.75,3);
INSERT INTO `order_detail` VALUES (10289,'S18_1342',38,92.47,2);
INSERT INTO `order_detail` VALUES (10289,'S18_1367',24,44.75,1);
INSERT INTO `order_detail` VALUES (10289,'S18_2795',43,141.75,3);
INSERT INTO `order_detail` VALUES (10289,'S24_2022',45,41.22,4);
INSERT INTO `order_detail` VALUES (10290,'S18_3320',26,80.36,2);
INSERT INTO `order_detail` VALUES (10290,'S24_4258',45,83.76,1);
INSERT INTO `order_detail` VALUES (10291,'S10_1949',37,210.01,11);
INSERT INTO `order_detail` VALUES (10291,'S10_4962',30,141.83,4);
INSERT INTO `order_detail` VALUES (10291,'S12_1666',41,123.00,8);
INSERT INTO `order_detail` VALUES (10291,'S18_1097',41,96.84,10);
INSERT INTO `order_detail` VALUES (10291,'S18_2432',26,52.26,2);
INSERT INTO `order_detail` VALUES (10291,'S18_2949',47,99.28,12);
INSERT INTO `order_detail` VALUES (10291,'S18_2957',37,56.21,14);
INSERT INTO `order_detail` VALUES (10291,'S18_3136',23,93.20,13);
INSERT INTO `order_detail` VALUES (10291,'S18_4600',48,96.86,5);
INSERT INTO `order_detail` VALUES (10291,'S18_4668',29,45.28,9);
INSERT INTO `order_detail` VALUES (10291,'S24_2300',48,109.90,1);
INSERT INTO `order_detail` VALUES (10291,'S32_1268',26,82.83,3);
INSERT INTO `order_detail` VALUES (10291,'S32_3522',32,53.00,7);
INSERT INTO `order_detail` VALUES (10291,'S700_2824',28,86.99,6);
INSERT INTO `order_detail` VALUES (10292,'S12_4473',21,94.80,8);
INSERT INTO `order_detail` VALUES (10292,'S18_2238',26,140.81,7);
INSERT INTO `order_detail` VALUES (10292,'S18_2319',41,103.09,11);
INSERT INTO `order_detail` VALUES (10292,'S18_3232',21,147.33,12);
INSERT INTO `order_detail` VALUES (10292,'S18_4027',44,114.90,2);
INSERT INTO `order_detail` VALUES (10292,'S24_1444',40,48.55,5);
INSERT INTO `order_detail` VALUES (10292,'S24_2840',39,34.30,9);
INSERT INTO `order_detail` VALUES (10292,'S24_4048',27,113.55,4);
INSERT INTO `order_detail` VALUES (10292,'S32_2509',50,54.11,10);
INSERT INTO `order_detail` VALUES (10292,'S32_3207',31,59.65,3);
INSERT INTO `order_detail` VALUES (10292,'S50_1392',41,113.44,6);
INSERT INTO `order_detail` VALUES (10292,'S50_1514',35,49.79,1);
INSERT INTO `order_detail` VALUES (10293,'S12_1108',46,187.02,8);
INSERT INTO `order_detail` VALUES (10293,'S12_3148',24,129.93,9);
INSERT INTO `order_detail` VALUES (10293,'S12_3891',45,171.29,7);
INSERT INTO `order_detail` VALUES (10293,'S18_3140',24,110.64,4);
INSERT INTO `order_detail` VALUES (10293,'S18_3259',22,91.76,6);
INSERT INTO `order_detail` VALUES (10293,'S18_4522',49,72.85,3);
INSERT INTO `order_detail` VALUES (10293,'S24_2011',21,111.83,2);
INSERT INTO `order_detail` VALUES (10293,'S700_1938',29,77.95,5);
INSERT INTO `order_detail` VALUES (10293,'S72_3212',32,51.32,1);
INSERT INTO `order_detail` VALUES (10294,'S700_3962',45,98.32,1);
INSERT INTO `order_detail` VALUES (10295,'S10_4757',24,136.00,1);
INSERT INTO `order_detail` VALUES (10295,'S24_3151',46,84.08,3);
INSERT INTO `order_detail` VALUES (10295,'S700_1138',26,62.00,4);
INSERT INTO `order_detail` VALUES (10295,'S700_2610',44,71.56,2);
INSERT INTO `order_detail` VALUES (10295,'S700_3505',34,93.16,5);
INSERT INTO `order_detail` VALUES (10296,'S18_1662',36,146.65,7);
INSERT INTO `order_detail` VALUES (10296,'S18_3029',21,69.68,13);
INSERT INTO `order_detail` VALUES (10296,'S18_3856',22,105.87,12);
INSERT INTO `order_detail` VALUES (10296,'S24_2841',21,60.97,8);
INSERT INTO `order_detail` VALUES (10296,'S24_3420',31,63.78,9);
INSERT INTO `order_detail` VALUES (10296,'S24_3816',22,83.02,14);
INSERT INTO `order_detail` VALUES (10296,'S24_3949',32,63.46,6);
INSERT INTO `order_detail` VALUES (10296,'S50_1341',26,41.02,1);
INSERT INTO `order_detail` VALUES (10296,'S700_1691',42,75.81,2);
INSERT INTO `order_detail` VALUES (10296,'S700_2047',34,89.61,11);
INSERT INTO `order_detail` VALUES (10296,'S700_2466',24,96.73,4);
INSERT INTO `order_detail` VALUES (10296,'S700_3167',22,74.40,3);
INSERT INTO `order_detail` VALUES (10296,'S700_4002',47,61.44,5);
INSERT INTO `order_detail` VALUES (10296,'S72_1253',21,46.68,10);
INSERT INTO `order_detail` VALUES (10297,'S18_2581',25,81.95,4);
INSERT INTO `order_detail` VALUES (10297,'S24_1785',32,107.23,6);
INSERT INTO `order_detail` VALUES (10297,'S24_2000',32,70.08,1);
INSERT INTO `order_detail` VALUES (10297,'S24_4278',23,71.73,5);
INSERT INTO `order_detail` VALUES (10297,'S32_1374',26,88.90,2);
INSERT INTO `order_detail` VALUES (10297,'S32_4289',28,63.29,7);
INSERT INTO `order_detail` VALUES (10297,'S700_2834',35,111.53,3);
INSERT INTO `order_detail` VALUES (10298,'S10_2016',39,105.86,1);
INSERT INTO `order_detail` VALUES (10298,'S18_2625',32,60.57,2);
INSERT INTO `order_detail` VALUES (10299,'S10_1678',23,76.56,9);
INSERT INTO `order_detail` VALUES (10299,'S10_4698',29,164.61,11);
INSERT INTO `order_detail` VALUES (10299,'S12_2823',24,123.51,8);
INSERT INTO `order_detail` VALUES (10299,'S18_3782',39,62.17,3);
INSERT INTO `order_detail` VALUES (10299,'S18_4721',49,119.04,2);
INSERT INTO `order_detail` VALUES (10299,'S24_1578',47,107.07,10);
INSERT INTO `order_detail` VALUES (10299,'S24_2360',33,58.87,6);
INSERT INTO `order_detail` VALUES (10299,'S24_4620',32,66.29,1);
INSERT INTO `order_detail` VALUES (10299,'S32_2206',24,36.21,4);
INSERT INTO `order_detail` VALUES (10299,'S32_4485',38,84.70,7);
INSERT INTO `order_detail` VALUES (10299,'S50_4713',44,77.29,5);
INSERT INTO `order_detail` VALUES (10300,'S12_1099',33,184.84,5);
INSERT INTO `order_detail` VALUES (10300,'S12_3380',29,116.27,3);
INSERT INTO `order_detail` VALUES (10300,'S12_3990',22,76.61,6);
INSERT INTO `order_detail` VALUES (10300,'S12_4675',23,95.58,2);
INSERT INTO `order_detail` VALUES (10300,'S18_1889',41,63.14,1);
INSERT INTO `order_detail` VALUES (10300,'S18_3278',49,65.94,8);
INSERT INTO `order_detail` VALUES (10300,'S18_3482',23,144.05,7);
INSERT INTO `order_detail` VALUES (10300,'S24_3371',31,52.05,4);
INSERT INTO `order_detail` VALUES (10301,'S18_1129',37,114.65,8);
INSERT INTO `order_detail` VALUES (10301,'S18_1589',32,118.22,4);
INSERT INTO `order_detail` VALUES (10301,'S18_1984',47,119.49,7);
INSERT INTO `order_detail` VALUES (10301,'S18_2870',22,113.52,5);
INSERT INTO `order_detail` VALUES (10301,'S18_3232',23,135.47,9);
INSERT INTO `order_detail` VALUES (10301,'S18_3685',39,137.04,6);
INSERT INTO `order_detail` VALUES (10301,'S24_1046',27,64.67,1);
INSERT INTO `order_detail` VALUES (10301,'S24_1628',22,40.75,3);
INSERT INTO `order_detail` VALUES (10301,'S24_2972',48,32.10,10);
INSERT INTO `order_detail` VALUES (10301,'S24_3432',22,86.73,2);
INSERT INTO `order_detail` VALUES (10301,'S24_3856',50,122.17,11);
INSERT INTO `order_detail` VALUES (10302,'S18_1749',43,166.60,1);
INSERT INTO `order_detail` VALUES (10302,'S18_4409',38,82.83,2);
INSERT INTO `order_detail` VALUES (10302,'S18_4933',23,70.56,3);
INSERT INTO `order_detail` VALUES (10302,'S24_2766',49,75.42,5);
INSERT INTO `order_detail` VALUES (10302,'S24_2887',45,104.52,4);
INSERT INTO `order_detail` VALUES (10302,'S24_3191',48,74.48,6);
INSERT INTO `order_detail` VALUES (10303,'S18_2248',46,56.91,2);
INSERT INTO `order_detail` VALUES (10303,'S24_3969',24,35.70,1);
INSERT INTO `order_detail` VALUES (10304,'S10_1949',47,201.44,6);
INSERT INTO `order_detail` VALUES (10304,'S12_1666',39,117.54,3);
INSERT INTO `order_detail` VALUES (10304,'S18_1097',46,106.17,5);
INSERT INTO `order_detail` VALUES (10304,'S18_1342',37,95.55,13);
INSERT INTO `order_detail` VALUES (10304,'S18_1367',37,46.90,12);
INSERT INTO `order_detail` VALUES (10304,'S18_2325',24,102.98,17);
INSERT INTO `order_detail` VALUES (10304,'S18_2795',20,141.75,14);
INSERT INTO `order_detail` VALUES (10304,'S18_2949',46,98.27,7);
INSERT INTO `order_detail` VALUES (10304,'S18_2957',24,54.34,9);
INSERT INTO `order_detail` VALUES (10304,'S18_3136',26,90.06,8);
INSERT INTO `order_detail` VALUES (10304,'S18_3320',38,95.24,11);
INSERT INTO `order_detail` VALUES (10304,'S18_4668',34,44.27,4);
INSERT INTO `order_detail` VALUES (10304,'S24_1937',23,29.21,16);
INSERT INTO `order_detail` VALUES (10304,'S24_2022',44,42.11,15);
INSERT INTO `order_detail` VALUES (10304,'S24_4258',33,80.83,10);
INSERT INTO `order_detail` VALUES (10304,'S32_3522',36,52.36,2);
INSERT INTO `order_detail` VALUES (10304,'S700_2824',40,80.92,1);
INSERT INTO `order_detail` VALUES (10305,'S10_4962',38,130.01,13);
INSERT INTO `order_detail` VALUES (10305,'S12_4473',38,107.84,5);
INSERT INTO `order_detail` VALUES (10305,'S18_2238',27,132.62,4);
INSERT INTO `order_detail` VALUES (10305,'S18_2319',36,117.82,8);
INSERT INTO `order_detail` VALUES (10305,'S18_2432',41,58.95,11);
INSERT INTO `order_detail` VALUES (10305,'S18_3232',37,160.87,9);
INSERT INTO `order_detail` VALUES (10305,'S18_4600',22,112.60,14);
INSERT INTO `order_detail` VALUES (10305,'S24_1444',45,48.55,2);
INSERT INTO `order_detail` VALUES (10305,'S24_2300',24,107.34,10);
INSERT INTO `order_detail` VALUES (10305,'S24_2840',48,30.76,6);
INSERT INTO `order_detail` VALUES (10305,'S24_4048',36,118.28,1);
INSERT INTO `order_detail` VALUES (10305,'S32_1268',28,94.38,12);
INSERT INTO `order_detail` VALUES (10305,'S32_2509',40,48.70,7);
INSERT INTO `order_detail` VALUES (10305,'S50_1392',42,109.96,3);
INSERT INTO `order_detail` VALUES (10306,'S12_1108',31,182.86,13);
INSERT INTO `order_detail` VALUES (10306,'S12_3148',34,145.04,14);
INSERT INTO `order_detail` VALUES (10306,'S12_3891',20,145.34,12);
INSERT INTO `order_detail` VALUES (10306,'S18_3140',32,114.74,9);
INSERT INTO `order_detail` VALUES (10306,'S18_3259',40,83.70,11);
INSERT INTO `order_detail` VALUES (10306,'S18_4027',23,126.39,16);
INSERT INTO `order_detail` VALUES (10306,'S18_4522',39,85.14,8);
INSERT INTO `order_detail` VALUES (10306,'S24_2011',29,109.37,7);
INSERT INTO `order_detail` VALUES (10306,'S24_3151',31,76.12,2);
INSERT INTO `order_detail` VALUES (10306,'S32_3207',46,60.28,17);
INSERT INTO `order_detail` VALUES (10306,'S50_1514',34,51.55,15);
INSERT INTO `order_detail` VALUES (10306,'S700_1138',50,61.34,3);
INSERT INTO `order_detail` VALUES (10306,'S700_1938',38,73.62,10);
INSERT INTO `order_detail` VALUES (10306,'S700_2610',43,62.16,1);
INSERT INTO `order_detail` VALUES (10306,'S700_3505',32,99.17,4);
INSERT INTO `order_detail` VALUES (10306,'S700_3962',30,87.39,5);
INSERT INTO `order_detail` VALUES (10306,'S72_3212',35,48.05,6);
INSERT INTO `order_detail` VALUES (10307,'S10_4757',22,118.32,9);
INSERT INTO `order_detail` VALUES (10307,'S18_1662',39,135.61,1);
INSERT INTO `order_detail` VALUES (10307,'S18_3029',31,71.40,7);
INSERT INTO `order_detail` VALUES (10307,'S18_3856',48,92.11,6);
INSERT INTO `order_detail` VALUES (10307,'S24_2841',25,58.23,2);
INSERT INTO `order_detail` VALUES (10307,'S24_3420',22,64.44,3);
INSERT INTO `order_detail` VALUES (10307,'S24_3816',22,75.47,8);
INSERT INTO `order_detail` VALUES (10307,'S700_2047',34,81.47,5);
INSERT INTO `order_detail` VALUES (10307,'S72_1253',34,44.20,4);
INSERT INTO `order_detail` VALUES (10308,'S10_2016',34,115.37,2);
INSERT INTO `order_detail` VALUES (10308,'S10_4698',20,187.85,1);
INSERT INTO `order_detail` VALUES (10308,'S18_2581',27,81.95,7);
INSERT INTO `order_detail` VALUES (10308,'S18_2625',34,48.46,3);
INSERT INTO `order_detail` VALUES (10308,'S24_1785',31,99.57,9);
INSERT INTO `order_detail` VALUES (10308,'S24_2000',47,68.55,4);
INSERT INTO `order_detail` VALUES (10308,'S24_3949',43,58.00,16);
INSERT INTO `order_detail` VALUES (10308,'S24_4278',44,71.73,8);
INSERT INTO `order_detail` VALUES (10308,'S32_1374',24,99.89,5);
INSERT INTO `order_detail` VALUES (10308,'S32_4289',46,61.22,10);
INSERT INTO `order_detail` VALUES (10308,'S50_1341',47,37.09,11);
INSERT INTO `order_detail` VALUES (10308,'S700_1691',21,73.07,12);
INSERT INTO `order_detail` VALUES (10308,'S700_2466',35,88.75,14);
INSERT INTO `order_detail` VALUES (10308,'S700_2834',31,100.85,6);
INSERT INTO `order_detail` VALUES (10308,'S700_3167',21,79.20,13);
INSERT INTO `order_detail` VALUES (10308,'S700_4002',39,62.93,15);
INSERT INTO `order_detail` VALUES (10309,'S10_1678',41,94.74,5);
INSERT INTO `order_detail` VALUES (10309,'S12_2823',26,144.60,4);
INSERT INTO `order_detail` VALUES (10309,'S24_1578',21,96.92,6);
INSERT INTO `order_detail` VALUES (10309,'S24_2360',24,59.56,2);
INSERT INTO `order_detail` VALUES (10309,'S32_4485',50,93.89,3);
INSERT INTO `order_detail` VALUES (10309,'S50_4713',28,74.04,1);
INSERT INTO `order_detail` VALUES (10310,'S12_1099',33,165.38,10);
INSERT INTO `order_detail` VALUES (10310,'S12_3380',24,105.70,8);
INSERT INTO `order_detail` VALUES (10310,'S12_3990',49,77.41,11);
INSERT INTO `order_detail` VALUES (10310,'S12_4675',25,101.34,7);
INSERT INTO `order_detail` VALUES (10310,'S18_1129',37,128.80,2);
INSERT INTO `order_detail` VALUES (10310,'S18_1889',20,66.99,6);
INSERT INTO `order_detail` VALUES (10310,'S18_1984',24,129.45,1);
INSERT INTO `order_detail` VALUES (10310,'S18_3232',48,159.18,3);
INSERT INTO `order_detail` VALUES (10310,'S18_3278',27,70.76,13);
INSERT INTO `order_detail` VALUES (10310,'S18_3482',49,122.00,12);
INSERT INTO `order_detail` VALUES (10310,'S18_3782',42,59.06,16);
INSERT INTO `order_detail` VALUES (10310,'S18_4721',40,133.92,15);
INSERT INTO `order_detail` VALUES (10310,'S24_2972',33,33.23,4);
INSERT INTO `order_detail` VALUES (10310,'S24_3371',38,50.21,9);
INSERT INTO `order_detail` VALUES (10310,'S24_3856',45,139.03,5);
INSERT INTO `order_detail` VALUES (10310,'S24_4620',49,75.18,14);
INSERT INTO `order_detail` VALUES (10310,'S32_2206',36,38.62,17);
INSERT INTO `order_detail` VALUES (10311,'S18_1589',29,124.44,9);
INSERT INTO `order_detail` VALUES (10311,'S18_2870',43,114.84,10);
INSERT INTO `order_detail` VALUES (10311,'S18_3685',32,134.22,11);
INSERT INTO `order_detail` VALUES (10311,'S18_4409',41,92.03,1);
INSERT INTO `order_detail` VALUES (10311,'S18_4933',25,66.99,2);
INSERT INTO `order_detail` VALUES (10311,'S24_1046',26,70.55,6);
INSERT INTO `order_detail` VALUES (10311,'S24_1628',45,48.80,8);
INSERT INTO `order_detail` VALUES (10311,'S24_2766',28,89.05,4);
INSERT INTO `order_detail` VALUES (10311,'S24_2887',43,116.27,3);
INSERT INTO `order_detail` VALUES (10311,'S24_3191',25,85.61,5);
INSERT INTO `order_detail` VALUES (10311,'S24_3432',46,91.02,7);
INSERT INTO `order_detail` VALUES (10312,'S10_1949',48,214.30,3);
INSERT INTO `order_detail` VALUES (10312,'S18_1097',32,101.50,2);
INSERT INTO `order_detail` VALUES (10312,'S18_1342',43,102.74,10);
INSERT INTO `order_detail` VALUES (10312,'S18_1367',25,43.67,9);
INSERT INTO `order_detail` VALUES (10312,'S18_1749',48,146.20,17);
INSERT INTO `order_detail` VALUES (10312,'S18_2248',30,48.43,16);
INSERT INTO `order_detail` VALUES (10312,'S18_2325',31,111.87,14);
INSERT INTO `order_detail` VALUES (10312,'S18_2795',25,150.19,11);
INSERT INTO `order_detail` VALUES (10312,'S18_2949',37,91.18,4);
INSERT INTO `order_detail` VALUES (10312,'S18_2957',35,54.34,6);
INSERT INTO `order_detail` VALUES (10312,'S18_3136',38,93.20,5);
INSERT INTO `order_detail` VALUES (10312,'S18_3320',33,84.33,8);
INSERT INTO `order_detail` VALUES (10312,'S18_4668',39,44.27,1);
INSERT INTO `order_detail` VALUES (10312,'S24_1937',39,27.88,13);
INSERT INTO `order_detail` VALUES (10312,'S24_2022',23,43.46,12);
INSERT INTO `order_detail` VALUES (10312,'S24_3969',31,40.21,15);
INSERT INTO `order_detail` VALUES (10312,'S24_4258',44,96.42,7);
INSERT INTO `order_detail` VALUES (10313,'S10_4962',40,141.83,7);
INSERT INTO `order_detail` VALUES (10313,'S12_1666',21,131.20,11);
INSERT INTO `order_detail` VALUES (10313,'S18_2319',29,109.23,2);
INSERT INTO `order_detail` VALUES (10313,'S18_2432',34,52.87,5);
INSERT INTO `order_detail` VALUES (10313,'S18_3232',25,143.94,3);
INSERT INTO `order_detail` VALUES (10313,'S18_4600',28,110.18,8);
INSERT INTO `order_detail` VALUES (10313,'S24_2300',42,102.23,4);
INSERT INTO `order_detail` VALUES (10313,'S32_1268',27,96.31,6);
INSERT INTO `order_detail` VALUES (10313,'S32_2509',38,48.70,1);
INSERT INTO `order_detail` VALUES (10313,'S32_3522',34,55.59,10);
INSERT INTO `order_detail` VALUES (10313,'S700_2824',30,96.09,9);
INSERT INTO `order_detail` VALUES (10314,'S12_1108',38,176.63,5);
INSERT INTO `order_detail` VALUES (10314,'S12_3148',46,125.40,6);
INSERT INTO `order_detail` VALUES (10314,'S12_3891',36,169.56,4);
INSERT INTO `order_detail` VALUES (10314,'S12_4473',45,95.99,14);
INSERT INTO `order_detail` VALUES (10314,'S18_2238',42,135.90,13);
INSERT INTO `order_detail` VALUES (10314,'S18_3140',20,129.76,1);
INSERT INTO `order_detail` VALUES (10314,'S18_3259',23,84.71,3);
INSERT INTO `order_detail` VALUES (10314,'S18_4027',29,129.26,8);
INSERT INTO `order_detail` VALUES (10314,'S24_1444',44,51.44,11);
INSERT INTO `order_detail` VALUES (10314,'S24_2840',39,31.82,15);
INSERT INTO `order_detail` VALUES (10314,'S24_4048',38,111.18,10);
INSERT INTO `order_detail` VALUES (10314,'S32_3207',35,58.41,9);
INSERT INTO `order_detail` VALUES (10314,'S50_1392',28,115.75,12);
INSERT INTO `order_detail` VALUES (10314,'S50_1514',38,50.38,7);
INSERT INTO `order_detail` VALUES (10314,'S700_1938',23,83.15,2);
INSERT INTO `order_detail` VALUES (10315,'S18_4522',36,78.12,7);
INSERT INTO `order_detail` VALUES (10315,'S24_2011',35,111.83,6);
INSERT INTO `order_detail` VALUES (10315,'S24_3151',24,78.77,1);
INSERT INTO `order_detail` VALUES (10315,'S700_1138',41,60.67,2);
INSERT INTO `order_detail` VALUES (10315,'S700_3505',31,99.17,3);
INSERT INTO `order_detail` VALUES (10315,'S700_3962',37,88.39,4);
INSERT INTO `order_detail` VALUES (10315,'S72_3212',40,51.32,5);
INSERT INTO `order_detail` VALUES (10316,'S10_4757',33,126.48,17);
INSERT INTO `order_detail` VALUES (10316,'S18_1662',27,140.34,9);
INSERT INTO `order_detail` VALUES (10316,'S18_3029',21,72.26,15);
INSERT INTO `order_detail` VALUES (10316,'S18_3856',47,89.99,14);
INSERT INTO `order_detail` VALUES (10316,'S24_1785',25,93.01,1);
INSERT INTO `order_detail` VALUES (10316,'S24_2841',34,67.14,10);
INSERT INTO `order_detail` VALUES (10316,'S24_3420',47,55.23,11);
INSERT INTO `order_detail` VALUES (10316,'S24_3816',25,77.15,16);
INSERT INTO `order_detail` VALUES (10316,'S24_3949',30,67.56,8);
INSERT INTO `order_detail` VALUES (10316,'S32_4289',24,59.16,2);
INSERT INTO `order_detail` VALUES (10316,'S50_1341',34,36.66,3);
INSERT INTO `order_detail` VALUES (10316,'S700_1691',34,74.90,4);
INSERT INTO `order_detail` VALUES (10316,'S700_2047',45,73.32,13);
INSERT INTO `order_detail` VALUES (10316,'S700_2466',23,85.76,6);
INSERT INTO `order_detail` VALUES (10316,'S700_2610',48,67.22,18);
INSERT INTO `order_detail` VALUES (10316,'S700_3167',48,77.60,5);
INSERT INTO `order_detail` VALUES (10316,'S700_4002',44,68.11,7);
INSERT INTO `order_detail` VALUES (10316,'S72_1253',34,43.70,12);
INSERT INTO `order_detail` VALUES (10317,'S24_4278',35,69.55,1);
INSERT INTO `order_detail` VALUES (10318,'S10_1678',46,84.22,1);
INSERT INTO `order_detail` VALUES (10318,'S10_2016',45,102.29,4);
INSERT INTO `order_detail` VALUES (10318,'S10_4698',37,189.79,3);
INSERT INTO `order_detail` VALUES (10318,'S18_2581',31,81.95,9);
INSERT INTO `order_detail` VALUES (10318,'S18_2625',42,49.67,5);
INSERT INTO `order_detail` VALUES (10318,'S24_1578',48,93.54,2);
INSERT INTO `order_detail` VALUES (10318,'S24_2000',26,60.94,6);
INSERT INTO `order_detail` VALUES (10318,'S32_1374',47,81.91,7);
INSERT INTO `order_detail` VALUES (10318,'S700_2834',50,102.04,8);
INSERT INTO `order_detail` VALUES (10319,'S12_2823',30,134.05,9);
INSERT INTO `order_detail` VALUES (10319,'S18_3278',46,77.19,1);
INSERT INTO `order_detail` VALUES (10319,'S18_3782',44,54.71,4);
INSERT INTO `order_detail` VALUES (10319,'S18_4721',45,120.53,3);
INSERT INTO `order_detail` VALUES (10319,'S24_2360',31,65.80,7);
INSERT INTO `order_detail` VALUES (10319,'S24_4620',43,78.41,2);
INSERT INTO `order_detail` VALUES (10319,'S32_2206',29,35.00,5);
INSERT INTO `order_detail` VALUES (10319,'S32_4485',22,96.95,8);
INSERT INTO `order_detail` VALUES (10319,'S50_4713',45,79.73,6);
INSERT INTO `order_detail` VALUES (10320,'S12_1099',31,184.84,3);
INSERT INTO `order_detail` VALUES (10320,'S12_3380',35,102.17,1);
INSERT INTO `order_detail` VALUES (10320,'S12_3990',38,63.84,4);
INSERT INTO `order_detail` VALUES (10320,'S18_3482',25,139.64,5);
INSERT INTO `order_detail` VALUES (10320,'S24_3371',26,60.62,2);
INSERT INTO `order_detail` VALUES (10321,'S12_4675',24,105.95,15);
INSERT INTO `order_detail` VALUES (10321,'S18_1129',41,123.14,10);
INSERT INTO `order_detail` VALUES (10321,'S18_1589',44,120.71,6);
INSERT INTO `order_detail` VALUES (10321,'S18_1889',37,73.92,14);
INSERT INTO `order_detail` VALUES (10321,'S18_1984',25,142.25,9);
INSERT INTO `order_detail` VALUES (10321,'S18_2870',27,126.72,7);
INSERT INTO `order_detail` VALUES (10321,'S18_3232',33,164.26,11);
INSERT INTO `order_detail` VALUES (10321,'S18_3685',28,138.45,8);
INSERT INTO `order_detail` VALUES (10321,'S24_1046',30,68.35,3);
INSERT INTO `order_detail` VALUES (10321,'S24_1628',48,42.76,5);
INSERT INTO `order_detail` VALUES (10321,'S24_2766',30,74.51,1);
INSERT INTO `order_detail` VALUES (10321,'S24_2972',37,31.72,12);
INSERT INTO `order_detail` VALUES (10321,'S24_3191',39,81.33,2);
INSERT INTO `order_detail` VALUES (10321,'S24_3432',21,103.87,4);
INSERT INTO `order_detail` VALUES (10321,'S24_3856',26,137.62,13);
INSERT INTO `order_detail` VALUES (10322,'S10_1949',40,180.01,1);
INSERT INTO `order_detail` VALUES (10322,'S10_4962',46,141.83,8);
INSERT INTO `order_detail` VALUES (10322,'S12_1666',27,136.67,9);
INSERT INTO `order_detail` VALUES (10322,'S18_1097',22,101.50,10);
INSERT INTO `order_detail` VALUES (10322,'S18_1342',43,92.47,14);
INSERT INTO `order_detail` VALUES (10322,'S18_1367',41,44.21,5);
INSERT INTO `order_detail` VALUES (10322,'S18_2325',50,120.77,6);
INSERT INTO `order_detail` VALUES (10322,'S18_2432',35,57.12,11);
INSERT INTO `order_detail` VALUES (10322,'S18_2795',36,158.63,2);
INSERT INTO `order_detail` VALUES (10322,'S18_2949',33,100.30,12);
INSERT INTO `order_detail` VALUES (10322,'S18_2957',41,54.34,13);
INSERT INTO `order_detail` VALUES (10322,'S18_3136',48,90.06,7);
INSERT INTO `order_detail` VALUES (10322,'S24_1937',20,26.55,3);
INSERT INTO `order_detail` VALUES (10322,'S24_2022',30,40.77,4);
INSERT INTO `order_detail` VALUES (10323,'S18_3320',33,88.30,2);
INSERT INTO `order_detail` VALUES (10323,'S18_4600',47,96.86,1);
INSERT INTO `order_detail` VALUES (10324,'S12_3148',27,148.06,1);
INSERT INTO `order_detail` VALUES (10324,'S12_4473',26,100.73,7);
INSERT INTO `order_detail` VALUES (10324,'S18_2238',47,142.45,8);
INSERT INTO `order_detail` VALUES (10324,'S18_2319',33,105.55,10);
INSERT INTO `order_detail` VALUES (10324,'S18_3232',27,137.17,12);
INSERT INTO `order_detail` VALUES (10324,'S18_4027',49,120.64,13);
INSERT INTO `order_detail` VALUES (10324,'S18_4668',38,49.81,6);
INSERT INTO `order_detail` VALUES (10324,'S24_1444',25,49.71,14);
INSERT INTO `order_detail` VALUES (10324,'S24_2300',31,107.34,2);
INSERT INTO `order_detail` VALUES (10324,'S24_2840',30,29.35,9);
INSERT INTO `order_detail` VALUES (10324,'S24_4258',33,95.44,3);
INSERT INTO `order_detail` VALUES (10324,'S32_1268',20,91.49,11);
INSERT INTO `order_detail` VALUES (10324,'S32_3522',48,60.76,4);
INSERT INTO `order_detail` VALUES (10324,'S700_2824',34,80.92,5);
INSERT INTO `order_detail` VALUES (10325,'S10_4757',47,111.52,6);
INSERT INTO `order_detail` VALUES (10325,'S12_1108',42,193.25,8);
INSERT INTO `order_detail` VALUES (10325,'S12_3891',24,166.10,1);
INSERT INTO `order_detail` VALUES (10325,'S18_3140',24,114.74,9);
INSERT INTO `order_detail` VALUES (10325,'S24_4048',44,114.73,5);
INSERT INTO `order_detail` VALUES (10325,'S32_2509',38,44.37,3);
INSERT INTO `order_detail` VALUES (10325,'S32_3207',28,55.30,2);
INSERT INTO `order_detail` VALUES (10325,'S50_1392',38,99.55,4);
INSERT INTO `order_detail` VALUES (10325,'S50_1514',44,56.24,7);
INSERT INTO `order_detail` VALUES (10326,'S18_3259',32,94.79,6);
INSERT INTO `order_detail` VALUES (10326,'S18_4522',50,73.73,5);
INSERT INTO `order_detail` VALUES (10326,'S24_2011',41,120.43,4);
INSERT INTO `order_detail` VALUES (10326,'S24_3151',41,86.74,3);
INSERT INTO `order_detail` VALUES (10326,'S24_3816',20,81.34,2);
INSERT INTO `order_detail` VALUES (10326,'S700_1138',39,60.67,1);
INSERT INTO `order_detail` VALUES (10327,'S18_1662',25,154.54,6);
INSERT INTO `order_detail` VALUES (10327,'S18_2581',45,74.34,8);
INSERT INTO `order_detail` VALUES (10327,'S18_3029',25,74.84,5);
INSERT INTO `order_detail` VALUES (10327,'S700_1938',20,79.68,7);
INSERT INTO `order_detail` VALUES (10327,'S700_2610',21,65.05,1);
INSERT INTO `order_detail` VALUES (10327,'S700_3505',43,85.14,2);
INSERT INTO `order_detail` VALUES (10327,'S700_3962',37,83.42,3);
INSERT INTO `order_detail` VALUES (10327,'S72_3212',37,48.05,4);
INSERT INTO `order_detail` VALUES (10328,'S18_3856',34,104.81,6);
INSERT INTO `order_detail` VALUES (10328,'S24_1785',47,87.54,14);
INSERT INTO `order_detail` VALUES (10328,'S24_2841',48,67.82,1);
INSERT INTO `order_detail` VALUES (10328,'S24_3420',20,56.55,2);
INSERT INTO `order_detail` VALUES (10328,'S24_3949',35,55.96,3);
INSERT INTO `order_detail` VALUES (10328,'S24_4278',43,69.55,4);
INSERT INTO `order_detail` VALUES (10328,'S32_4289',24,57.10,5);
INSERT INTO `order_detail` VALUES (10328,'S50_1341',34,42.33,7);
INSERT INTO `order_detail` VALUES (10328,'S700_1691',27,84.03,8);
INSERT INTO `order_detail` VALUES (10328,'S700_2047',41,75.13,9);
INSERT INTO `order_detail` VALUES (10328,'S700_2466',37,95.73,10);
INSERT INTO `order_detail` VALUES (10328,'S700_2834',33,117.46,11);
INSERT INTO `order_detail` VALUES (10328,'S700_3167',33,71.20,13);
INSERT INTO `order_detail` VALUES (10328,'S700_4002',39,69.59,12);
INSERT INTO `order_detail` VALUES (10329,'S10_1678',42,80.39,1);
INSERT INTO `order_detail` VALUES (10329,'S10_2016',20,109.42,2);
INSERT INTO `order_detail` VALUES (10329,'S10_4698',26,164.61,3);
INSERT INTO `order_detail` VALUES (10329,'S12_1099',41,182.90,5);
INSERT INTO `order_detail` VALUES (10329,'S12_2823',24,128.03,6);
INSERT INTO `order_detail` VALUES (10329,'S12_3380',46,117.44,13);
INSERT INTO `order_detail` VALUES (10329,'S12_3990',33,74.21,14);
INSERT INTO `order_detail` VALUES (10329,'S12_4675',39,102.49,15);
INSERT INTO `order_detail` VALUES (10329,'S18_1889',29,66.22,9);
INSERT INTO `order_detail` VALUES (10329,'S18_2625',38,55.72,12);
INSERT INTO `order_detail` VALUES (10329,'S18_3278',38,65.13,10);
INSERT INTO `order_detail` VALUES (10329,'S24_1578',30,104.81,7);
INSERT INTO `order_detail` VALUES (10329,'S24_2000',37,71.60,4);
INSERT INTO `order_detail` VALUES (10329,'S32_1374',45,80.91,11);
INSERT INTO `order_detail` VALUES (10329,'S72_1253',44,41.22,8);
INSERT INTO `order_detail` VALUES (10330,'S18_3482',37,136.70,3);
INSERT INTO `order_detail` VALUES (10330,'S18_3782',29,59.06,2);
INSERT INTO `order_detail` VALUES (10330,'S18_4721',50,133.92,4);
INSERT INTO `order_detail` VALUES (10330,'S24_2360',42,56.10,1);
INSERT INTO `order_detail` VALUES (10331,'S18_1129',46,120.31,6);
INSERT INTO `order_detail` VALUES (10331,'S18_1589',44,99.55,14);
INSERT INTO `order_detail` VALUES (10331,'S18_1749',44,154.70,7);
INSERT INTO `order_detail` VALUES (10331,'S18_1984',30,135.14,8);
INSERT INTO `order_detail` VALUES (10331,'S18_2870',26,130.68,10);
INSERT INTO `order_detail` VALUES (10331,'S18_3232',27,169.34,11);
INSERT INTO `order_detail` VALUES (10331,'S18_3685',26,132.80,12);
INSERT INTO `order_detail` VALUES (10331,'S24_2972',27,37.00,13);
INSERT INTO `order_detail` VALUES (10331,'S24_3371',25,55.11,9);
INSERT INTO `order_detail` VALUES (10331,'S24_3856',21,139.03,1);
INSERT INTO `order_detail` VALUES (10331,'S24_4620',41,70.33,2);
INSERT INTO `order_detail` VALUES (10331,'S32_2206',28,33.39,3);
INSERT INTO `order_detail` VALUES (10331,'S32_4485',32,100.01,4);
INSERT INTO `order_detail` VALUES (10331,'S50_4713',20,74.04,5);
INSERT INTO `order_detail` VALUES (10332,'S18_1342',46,89.38,15);
INSERT INTO `order_detail` VALUES (10332,'S18_1367',27,51.21,16);
INSERT INTO `order_detail` VALUES (10332,'S18_2248',38,53.88,9);
INSERT INTO `order_detail` VALUES (10332,'S18_2325',35,116.96,8);
INSERT INTO `order_detail` VALUES (10332,'S18_2795',24,138.38,1);
INSERT INTO `order_detail` VALUES (10332,'S18_2957',26,53.09,17);
INSERT INTO `order_detail` VALUES (10332,'S18_3136',40,100.53,18);
INSERT INTO `order_detail` VALUES (10332,'S18_4409',50,92.03,2);
INSERT INTO `order_detail` VALUES (10332,'S18_4933',21,70.56,3);
INSERT INTO `order_detail` VALUES (10332,'S24_1046',23,61.73,4);
INSERT INTO `order_detail` VALUES (10332,'S24_1628',20,47.29,5);
INSERT INTO `order_detail` VALUES (10332,'S24_1937',45,29.87,6);
INSERT INTO `order_detail` VALUES (10332,'S24_2022',26,43.01,10);
INSERT INTO `order_detail` VALUES (10332,'S24_2766',39,84.51,7);
INSERT INTO `order_detail` VALUES (10332,'S24_2887',44,108.04,11);
INSERT INTO `order_detail` VALUES (10332,'S24_3191',45,77.91,12);
INSERT INTO `order_detail` VALUES (10332,'S24_3432',31,94.23,13);
INSERT INTO `order_detail` VALUES (10332,'S24_3969',41,34.47,14);
INSERT INTO `order_detail` VALUES (10333,'S10_1949',26,188.58,3);
INSERT INTO `order_detail` VALUES (10333,'S12_1666',33,121.64,6);
INSERT INTO `order_detail` VALUES (10333,'S18_1097',29,110.84,7);
INSERT INTO `order_detail` VALUES (10333,'S18_2949',31,95.23,5);
INSERT INTO `order_detail` VALUES (10333,'S18_3320',46,95.24,2);
INSERT INTO `order_detail` VALUES (10333,'S18_4668',24,42.26,8);
INSERT INTO `order_detail` VALUES (10333,'S24_4258',39,95.44,1);
INSERT INTO `order_detail` VALUES (10333,'S32_3522',33,62.05,4);
INSERT INTO `order_detail` VALUES (10334,'S10_4962',26,130.01,2);
INSERT INTO `order_detail` VALUES (10334,'S18_2319',46,108.00,6);
INSERT INTO `order_detail` VALUES (10334,'S18_2432',34,52.87,1);
INSERT INTO `order_detail` VALUES (10334,'S18_3232',20,147.33,3);
INSERT INTO `order_detail` VALUES (10334,'S18_4600',49,101.71,4);
INSERT INTO `order_detail` VALUES (10334,'S24_2300',42,117.57,5);
INSERT INTO `order_detail` VALUES (10335,'S24_2840',33,32.88,2);
INSERT INTO `order_detail` VALUES (10335,'S32_1268',44,77.05,1);
INSERT INTO `order_detail` VALUES (10335,'S32_2509',40,49.78,3);
INSERT INTO `order_detail` VALUES (10336,'S12_1108',33,176.63,10);
INSERT INTO `order_detail` VALUES (10336,'S12_3148',33,126.91,11);
INSERT INTO `order_detail` VALUES (10336,'S12_3891',49,141.88,1);
INSERT INTO `order_detail` VALUES (10336,'S12_4473',38,95.99,3);
INSERT INTO `order_detail` VALUES (10336,'S18_2238',49,153.91,6);
INSERT INTO `order_detail` VALUES (10336,'S18_3140',48,135.22,12);
INSERT INTO `order_detail` VALUES (10336,'S18_3259',21,100.84,7);
INSERT INTO `order_detail` VALUES (10336,'S24_1444',45,49.71,4);
INSERT INTO `order_detail` VALUES (10336,'S24_4048',31,113.55,5);
INSERT INTO `order_detail` VALUES (10336,'S32_3207',31,59.03,9);
INSERT INTO `order_detail` VALUES (10336,'S50_1392',23,109.96,8);
INSERT INTO `order_detail` VALUES (10336,'S700_2824',46,94.07,2);
INSERT INTO `order_detail` VALUES (10337,'S10_4757',25,131.92,8);
INSERT INTO `order_detail` VALUES (10337,'S18_4027',36,140.75,3);
INSERT INTO `order_detail` VALUES (10337,'S18_4522',29,76.36,2);
INSERT INTO `order_detail` VALUES (10337,'S24_2011',29,119.20,4);
INSERT INTO `order_detail` VALUES (10337,'S50_1514',21,54.48,6);
INSERT INTO `order_detail` VALUES (10337,'S700_1938',36,73.62,9);
INSERT INTO `order_detail` VALUES (10337,'S700_3505',31,84.14,1);
INSERT INTO `order_detail` VALUES (10337,'S700_3962',36,83.42,7);
INSERT INTO `order_detail` VALUES (10337,'S72_3212',42,49.14,5);
INSERT INTO `order_detail` VALUES (10338,'S18_1662',41,137.19,1);
INSERT INTO `order_detail` VALUES (10338,'S18_3029',28,80.86,3);
INSERT INTO `order_detail` VALUES (10338,'S18_3856',45,93.17,2);
INSERT INTO `order_detail` VALUES (10339,'S10_2016',40,117.75,4);
INSERT INTO `order_detail` VALUES (10339,'S10_4698',39,178.17,3);
INSERT INTO `order_detail` VALUES (10339,'S18_2581',27,79.41,2);
INSERT INTO `order_detail` VALUES (10339,'S18_2625',30,48.46,1);
INSERT INTO `order_detail` VALUES (10339,'S24_1578',27,96.92,10);
INSERT INTO `order_detail` VALUES (10339,'S24_1785',21,106.14,7);
INSERT INTO `order_detail` VALUES (10339,'S24_2841',55,67.82,12);
INSERT INTO `order_detail` VALUES (10339,'S24_3151',55,73.46,13);
INSERT INTO `order_detail` VALUES (10339,'S24_3420',29,57.86,14);
INSERT INTO `order_detail` VALUES (10339,'S24_3816',42,72.96,16);
INSERT INTO `order_detail` VALUES (10339,'S24_3949',45,57.32,11);
INSERT INTO `order_detail` VALUES (10339,'S700_1138',22,53.34,5);
INSERT INTO `order_detail` VALUES (10339,'S700_2047',55,86.90,15);
INSERT INTO `order_detail` VALUES (10339,'S700_2610',50,62.16,9);
INSERT INTO `order_detail` VALUES (10339,'S700_4002',50,66.63,8);
INSERT INTO `order_detail` VALUES (10339,'S72_1253',27,49.66,6);
INSERT INTO `order_detail` VALUES (10340,'S24_2000',55,62.46,8);
INSERT INTO `order_detail` VALUES (10340,'S24_4278',40,63.76,1);
INSERT INTO `order_detail` VALUES (10340,'S32_1374',55,95.89,2);
INSERT INTO `order_detail` VALUES (10340,'S32_4289',39,67.41,3);
INSERT INTO `order_detail` VALUES (10340,'S50_1341',40,37.09,4);
INSERT INTO `order_detail` VALUES (10340,'S700_1691',30,73.99,5);
INSERT INTO `order_detail` VALUES (10340,'S700_2466',55,81.77,7);
INSERT INTO `order_detail` VALUES (10340,'S700_2834',29,98.48,6);
INSERT INTO `order_detail` VALUES (10341,'S10_1678',41,84.22,9);
INSERT INTO `order_detail` VALUES (10341,'S12_1099',45,192.62,2);
INSERT INTO `order_detail` VALUES (10341,'S12_2823',55,120.50,8);
INSERT INTO `order_detail` VALUES (10341,'S12_3380',44,111.57,1);
INSERT INTO `order_detail` VALUES (10341,'S12_3990',36,77.41,10);
INSERT INTO `order_detail` VALUES (10341,'S12_4675',55,109.40,7);
INSERT INTO `order_detail` VALUES (10341,'S24_2360',32,63.03,6);
INSERT INTO `order_detail` VALUES (10341,'S32_4485',31,95.93,4);
INSERT INTO `order_detail` VALUES (10341,'S50_4713',38,78.11,3);
INSERT INTO `order_detail` VALUES (10341,'S700_3167',34,70.40,5);
INSERT INTO `order_detail` VALUES (10342,'S18_1129',40,118.89,2);
INSERT INTO `order_detail` VALUES (10342,'S18_1889',55,63.14,1);
INSERT INTO `order_detail` VALUES (10342,'S18_1984',22,115.22,3);
INSERT INTO `order_detail` VALUES (10342,'S18_3232',30,167.65,4);
INSERT INTO `order_detail` VALUES (10342,'S18_3278',25,76.39,5);
INSERT INTO `order_detail` VALUES (10342,'S18_3482',55,136.70,7);
INSERT INTO `order_detail` VALUES (10342,'S18_3782',26,57.82,8);
INSERT INTO `order_detail` VALUES (10342,'S18_4721',38,124.99,11);
INSERT INTO `order_detail` VALUES (10342,'S24_2972',39,30.59,9);
INSERT INTO `order_detail` VALUES (10342,'S24_3371',48,60.01,10);
INSERT INTO `order_detail` VALUES (10342,'S24_3856',42,112.34,6);
INSERT INTO `order_detail` VALUES (10343,'S18_1589',36,109.51,4);
INSERT INTO `order_detail` VALUES (10343,'S18_2870',25,118.80,3);
INSERT INTO `order_detail` VALUES (10343,'S18_3685',44,127.15,2);
INSERT INTO `order_detail` VALUES (10343,'S24_1628',27,44.78,6);
INSERT INTO `order_detail` VALUES (10343,'S24_4620',30,76.80,1);
INSERT INTO `order_detail` VALUES (10343,'S32_2206',29,37.41,5);
INSERT INTO `order_detail` VALUES (10344,'S18_1749',45,168.30,1);
INSERT INTO `order_detail` VALUES (10344,'S18_2248',40,49.04,2);
INSERT INTO `order_detail` VALUES (10344,'S18_2325',30,118.23,3);
INSERT INTO `order_detail` VALUES (10344,'S18_4409',21,80.99,4);
INSERT INTO `order_detail` VALUES (10344,'S18_4933',26,68.42,5);
INSERT INTO `order_detail` VALUES (10344,'S24_1046',29,61.00,7);
INSERT INTO `order_detail` VALUES (10344,'S24_1937',20,27.88,6);
INSERT INTO `order_detail` VALUES (10345,'S24_2022',43,38.98,1);
INSERT INTO `order_detail` VALUES (10346,'S18_1342',42,88.36,3);
INSERT INTO `order_detail` VALUES (10346,'S24_2766',25,87.24,1);
INSERT INTO `order_detail` VALUES (10346,'S24_2887',24,117.44,5);
INSERT INTO `order_detail` VALUES (10346,'S24_3191',24,80.47,2);
INSERT INTO `order_detail` VALUES (10346,'S24_3432',26,103.87,6);
INSERT INTO `order_detail` VALUES (10346,'S24_3969',22,38.57,4);
INSERT INTO `order_detail` VALUES (10347,'S10_1949',30,188.58,1);
INSERT INTO `order_detail` VALUES (10347,'S10_4962',27,132.97,2);
INSERT INTO `order_detail` VALUES (10347,'S12_1666',29,132.57,3);
INSERT INTO `order_detail` VALUES (10347,'S18_1097',42,113.17,5);
INSERT INTO `order_detail` VALUES (10347,'S18_1367',21,46.36,7);
INSERT INTO `order_detail` VALUES (10347,'S18_2432',50,51.05,8);
INSERT INTO `order_detail` VALUES (10347,'S18_2795',21,136.69,6);
INSERT INTO `order_detail` VALUES (10347,'S18_2949',48,84.09,9);
INSERT INTO `order_detail` VALUES (10347,'S18_2957',34,60.59,10);
INSERT INTO `order_detail` VALUES (10347,'S18_3136',45,95.30,11);
INSERT INTO `order_detail` VALUES (10347,'S18_3320',26,84.33,12);
INSERT INTO `order_detail` VALUES (10347,'S18_4600',45,115.03,4);
INSERT INTO `order_detail` VALUES (10348,'S12_1108',48,207.80,8);
INSERT INTO `order_detail` VALUES (10348,'S12_3148',47,122.37,4);
INSERT INTO `order_detail` VALUES (10348,'S18_4668',29,43.77,6);
INSERT INTO `order_detail` VALUES (10348,'S24_2300',37,107.34,1);
INSERT INTO `order_detail` VALUES (10348,'S24_4258',39,82.78,2);
INSERT INTO `order_detail` VALUES (10348,'S32_1268',42,90.53,3);
INSERT INTO `order_detail` VALUES (10348,'S32_3522',31,62.70,5);
INSERT INTO `order_detail` VALUES (10348,'S700_2824',32,100.14,7);
INSERT INTO `order_detail` VALUES (10349,'S12_3891',26,166.10,10);
INSERT INTO `order_detail` VALUES (10349,'S12_4473',48,114.95,9);
INSERT INTO `order_detail` VALUES (10349,'S18_2238',38,142.45,8);
INSERT INTO `order_detail` VALUES (10349,'S18_2319',38,117.82,7);
INSERT INTO `order_detail` VALUES (10349,'S18_3232',48,164.26,6);
INSERT INTO `order_detail` VALUES (10349,'S18_4027',34,140.75,5);
INSERT INTO `order_detail` VALUES (10349,'S24_1444',48,50.29,4);
INSERT INTO `order_detail` VALUES (10349,'S24_2840',36,31.47,3);
INSERT INTO `order_detail` VALUES (10349,'S24_4048',23,111.18,2);
INSERT INTO `order_detail` VALUES (10349,'S32_2509',33,44.37,1);
INSERT INTO `order_detail` VALUES (10350,'S10_4757',26,110.16,5);
INSERT INTO `order_detail` VALUES (10350,'S18_3029',43,84.30,6);
INSERT INTO `order_detail` VALUES (10350,'S18_3140',44,135.22,1);
INSERT INTO `order_detail` VALUES (10350,'S18_3259',41,94.79,2);
INSERT INTO `order_detail` VALUES (10350,'S18_4522',30,70.22,3);
INSERT INTO `order_detail` VALUES (10350,'S24_2011',34,98.31,7);
INSERT INTO `order_detail` VALUES (10350,'S24_3151',30,86.74,9);
INSERT INTO `order_detail` VALUES (10350,'S24_3816',25,77.15,10);
INSERT INTO `order_detail` VALUES (10350,'S32_3207',27,61.52,14);
INSERT INTO `order_detail` VALUES (10350,'S50_1392',31,104.18,8);
INSERT INTO `order_detail` VALUES (10350,'S50_1514',44,56.82,17);
INSERT INTO `order_detail` VALUES (10350,'S700_1138',46,56.00,11);
INSERT INTO `order_detail` VALUES (10350,'S700_1938',28,76.22,4);
INSERT INTO `order_detail` VALUES (10350,'S700_2610',29,68.67,12);
INSERT INTO `order_detail` VALUES (10350,'S700_3505',31,87.15,13);
INSERT INTO `order_detail` VALUES (10350,'S700_3962',25,97.32,16);
INSERT INTO `order_detail` VALUES (10350,'S72_3212',20,48.05,15);
INSERT INTO `order_detail` VALUES (10351,'S18_1662',39,143.50,1);
INSERT INTO `order_detail` VALUES (10351,'S18_3856',20,104.81,2);
INSERT INTO `order_detail` VALUES (10351,'S24_2841',25,64.40,5);
INSERT INTO `order_detail` VALUES (10351,'S24_3420',38,53.92,4);
INSERT INTO `order_detail` VALUES (10351,'S24_3949',34,68.24,3);
INSERT INTO `order_detail` VALUES (10352,'S700_2047',23,75.13,3);
INSERT INTO `order_detail` VALUES (10352,'S700_2466',49,87.75,2);
INSERT INTO `order_detail` VALUES (10352,'S700_4002',22,62.19,1);
INSERT INTO `order_detail` VALUES (10352,'S72_1253',49,46.18,4);
INSERT INTO `order_detail` VALUES (10353,'S18_2581',27,71.81,1);
INSERT INTO `order_detail` VALUES (10353,'S24_1785',28,107.23,2);
INSERT INTO `order_detail` VALUES (10353,'S24_4278',35,69.55,3);
INSERT INTO `order_detail` VALUES (10353,'S32_1374',46,86.90,5);
INSERT INTO `order_detail` VALUES (10353,'S32_4289',40,68.10,7);
INSERT INTO `order_detail` VALUES (10353,'S50_1341',40,35.78,8);
INSERT INTO `order_detail` VALUES (10353,'S700_1691',39,73.07,9);
INSERT INTO `order_detail` VALUES (10353,'S700_2834',48,98.48,4);
INSERT INTO `order_detail` VALUES (10353,'S700_3167',43,74.40,6);
INSERT INTO `order_detail` VALUES (10354,'S10_1678',42,84.22,6);
INSERT INTO `order_detail` VALUES (10354,'S10_2016',20,95.15,2);
INSERT INTO `order_detail` VALUES (10354,'S10_4698',42,178.17,3);
INSERT INTO `order_detail` VALUES (10354,'S12_1099',31,157.60,9);
INSERT INTO `order_detail` VALUES (10354,'S12_2823',35,141.58,4);
INSERT INTO `order_detail` VALUES (10354,'S12_3380',29,98.65,11);
INSERT INTO `order_detail` VALUES (10354,'S12_3990',23,76.61,12);
INSERT INTO `order_detail` VALUES (10354,'S12_4675',28,100.19,13);
INSERT INTO `order_detail` VALUES (10354,'S18_1889',21,76.23,8);
INSERT INTO `order_detail` VALUES (10354,'S18_2625',28,49.06,10);
INSERT INTO `order_detail` VALUES (10354,'S18_3278',36,69.15,7);
INSERT INTO `order_detail` VALUES (10354,'S24_1578',21,96.92,5);
INSERT INTO `order_detail` VALUES (10354,'S24_2000',28,62.46,1);
INSERT INTO `order_detail` VALUES (10355,'S18_3482',23,117.59,7);
INSERT INTO `order_detail` VALUES (10355,'S18_3782',31,60.30,1);
INSERT INTO `order_detail` VALUES (10355,'S18_4721',25,124.99,2);
INSERT INTO `order_detail` VALUES (10355,'S24_2360',41,56.10,3);
INSERT INTO `order_detail` VALUES (10355,'S24_2972',36,37.38,4);
INSERT INTO `order_detail` VALUES (10355,'S24_3371',44,60.62,6);
INSERT INTO `order_detail` VALUES (10355,'S24_3856',32,137.62,8);
INSERT INTO `order_detail` VALUES (10355,'S24_4620',28,75.18,9);
INSERT INTO `order_detail` VALUES (10355,'S32_2206',38,32.99,10);
INSERT INTO `order_detail` VALUES (10355,'S32_4485',40,93.89,5);
INSERT INTO `order_detail` VALUES (10356,'S18_1129',43,120.31,8);
INSERT INTO `order_detail` VALUES (10356,'S18_1342',50,82.19,9);
INSERT INTO `order_detail` VALUES (10356,'S18_1367',22,44.75,6);
INSERT INTO `order_detail` VALUES (10356,'S18_1984',27,130.87,2);
INSERT INTO `order_detail` VALUES (10356,'S18_2325',29,106.79,3);
INSERT INTO `order_detail` VALUES (10356,'S18_2795',30,158.63,1);
INSERT INTO `order_detail` VALUES (10356,'S24_1937',48,31.86,5);
INSERT INTO `order_detail` VALUES (10356,'S24_2022',26,42.11,7);
INSERT INTO `order_detail` VALUES (10356,'S50_4713',26,78.11,4);
INSERT INTO `order_detail` VALUES (10357,'S10_1949',32,199.30,10);
INSERT INTO `order_detail` VALUES (10357,'S10_4962',43,135.92,9);
INSERT INTO `order_detail` VALUES (10357,'S12_1666',49,109.34,8);
INSERT INTO `order_detail` VALUES (10357,'S18_1097',39,112.00,1);
INSERT INTO `order_detail` VALUES (10357,'S18_2432',41,58.95,7);
INSERT INTO `order_detail` VALUES (10357,'S18_2949',41,91.18,6);
INSERT INTO `order_detail` VALUES (10357,'S18_2957',49,59.34,5);
INSERT INTO `order_detail` VALUES (10357,'S18_3136',44,104.72,4);
INSERT INTO `order_detail` VALUES (10357,'S18_3320',25,84.33,3);
INSERT INTO `order_detail` VALUES (10357,'S18_4600',28,105.34,2);
INSERT INTO `order_detail` VALUES (10358,'S12_3148',49,129.93,5);
INSERT INTO `order_detail` VALUES (10358,'S12_4473',42,98.36,9);
INSERT INTO `order_detail` VALUES (10358,'S18_2238',20,142.45,10);
INSERT INTO `order_detail` VALUES (10358,'S18_2319',20,99.41,11);
INSERT INTO `order_detail` VALUES (10358,'S18_3232',32,137.17,12);
INSERT INTO `order_detail` VALUES (10358,'S18_4027',25,117.77,13);
INSERT INTO `order_detail` VALUES (10358,'S18_4668',30,46.29,8);
INSERT INTO `order_detail` VALUES (10358,'S24_1444',44,56.07,14);
INSERT INTO `order_detail` VALUES (10358,'S24_2300',41,127.79,7);
INSERT INTO `order_detail` VALUES (10358,'S24_2840',36,33.59,4);
INSERT INTO `order_detail` VALUES (10358,'S24_4258',41,88.62,6);
INSERT INTO `order_detail` VALUES (10358,'S32_1268',41,82.83,1);
INSERT INTO `order_detail` VALUES (10358,'S32_3522',36,51.71,2);
INSERT INTO `order_detail` VALUES (10358,'S700_2824',27,85.98,3);
INSERT INTO `order_detail` VALUES (10359,'S10_4757',48,122.40,6);
INSERT INTO `order_detail` VALUES (10359,'S12_1108',42,180.79,8);
INSERT INTO `order_detail` VALUES (10359,'S12_3891',49,162.64,5);
INSERT INTO `order_detail` VALUES (10359,'S24_4048',22,108.82,7);
INSERT INTO `order_detail` VALUES (10359,'S32_2509',36,45.45,3);
INSERT INTO `order_detail` VALUES (10359,'S32_3207',22,62.14,1);
INSERT INTO `order_detail` VALUES (10359,'S50_1392',46,99.55,2);
INSERT INTO `order_detail` VALUES (10359,'S50_1514',25,47.45,4);
INSERT INTO `order_detail` VALUES (10360,'S18_1662',50,126.15,12);
INSERT INTO `order_detail` VALUES (10360,'S18_2581',41,68.43,13);
INSERT INTO `order_detail` VALUES (10360,'S18_3029',46,71.40,14);
INSERT INTO `order_detail` VALUES (10360,'S18_3140',29,122.93,8);
INSERT INTO `order_detail` VALUES (10360,'S18_3259',29,94.79,18);
INSERT INTO `order_detail` VALUES (10360,'S18_3856',40,101.64,15);
INSERT INTO `order_detail` VALUES (10360,'S18_4522',40,76.36,1);
INSERT INTO `order_detail` VALUES (10360,'S24_1785',22,106.14,17);
INSERT INTO `order_detail` VALUES (10360,'S24_2011',31,100.77,2);
INSERT INTO `order_detail` VALUES (10360,'S24_2841',49,55.49,16);
INSERT INTO `order_detail` VALUES (10360,'S24_3151',36,70.81,3);
INSERT INTO `order_detail` VALUES (10360,'S24_3816',22,78.83,4);
INSERT INTO `order_detail` VALUES (10360,'S700_1138',32,64.67,5);
INSERT INTO `order_detail` VALUES (10360,'S700_1938',26,86.61,6);
INSERT INTO `order_detail` VALUES (10360,'S700_2610',30,70.11,7);
INSERT INTO `order_detail` VALUES (10360,'S700_3505',35,83.14,9);
INSERT INTO `order_detail` VALUES (10360,'S700_3962',31,92.36,10);
INSERT INTO `order_detail` VALUES (10360,'S72_3212',31,54.05,11);
INSERT INTO `order_detail` VALUES (10361,'S10_1678',20,92.83,13);
INSERT INTO `order_detail` VALUES (10361,'S10_2016',26,114.18,8);
INSERT INTO `order_detail` VALUES (10361,'S24_3420',34,62.46,6);
INSERT INTO `order_detail` VALUES (10361,'S24_3949',26,61.42,7);
INSERT INTO `order_detail` VALUES (10361,'S24_4278',25,68.83,1);
INSERT INTO `order_detail` VALUES (10361,'S32_4289',49,56.41,2);
INSERT INTO `order_detail` VALUES (10361,'S50_1341',33,35.78,3);
INSERT INTO `order_detail` VALUES (10361,'S700_1691',20,88.60,4);
INSERT INTO `order_detail` VALUES (10361,'S700_2047',24,85.99,14);
INSERT INTO `order_detail` VALUES (10361,'S700_2466',26,91.74,9);
INSERT INTO `order_detail` VALUES (10361,'S700_2834',44,107.97,5);
INSERT INTO `order_detail` VALUES (10361,'S700_3167',44,76.80,10);
INSERT INTO `order_detail` VALUES (10361,'S700_4002',35,62.19,11);
INSERT INTO `order_detail` VALUES (10361,'S72_1253',23,47.67,12);
INSERT INTO `order_detail` VALUES (10362,'S10_4698',22,182.04,4);
INSERT INTO `order_detail` VALUES (10362,'S12_2823',22,131.04,1);
INSERT INTO `order_detail` VALUES (10362,'S18_2625',23,53.91,3);
INSERT INTO `order_detail` VALUES (10362,'S24_1578',50,91.29,2);
INSERT INTO `order_detail` VALUES (10363,'S12_1099',33,180.95,3);
INSERT INTO `order_detail` VALUES (10363,'S12_3380',34,106.87,4);
INSERT INTO `order_detail` VALUES (10363,'S12_3990',34,68.63,5);
INSERT INTO `order_detail` VALUES (10363,'S12_4675',46,103.64,6);
INSERT INTO `order_detail` VALUES (10363,'S18_1889',22,61.60,7);
INSERT INTO `order_detail` VALUES (10363,'S18_3278',46,69.15,10);
INSERT INTO `order_detail` VALUES (10363,'S18_3482',24,124.94,11);
INSERT INTO `order_detail` VALUES (10363,'S18_3782',32,52.22,12);
INSERT INTO `order_detail` VALUES (10363,'S18_4721',28,123.50,13);
INSERT INTO `order_detail` VALUES (10363,'S24_2000',21,70.08,8);
INSERT INTO `order_detail` VALUES (10363,'S24_2360',43,56.10,14);
INSERT INTO `order_detail` VALUES (10363,'S24_3371',21,52.05,15);
INSERT INTO `order_detail` VALUES (10363,'S24_3856',31,113.75,1);
INSERT INTO `order_detail` VALUES (10363,'S24_4620',43,75.99,9);
INSERT INTO `order_detail` VALUES (10363,'S32_1374',50,92.90,2);
INSERT INTO `order_detail` VALUES (10364,'S32_2206',48,38.22,1);
INSERT INTO `order_detail` VALUES (10365,'S18_1129',30,116.06,1);
INSERT INTO `order_detail` VALUES (10365,'S32_4485',22,82.66,3);
INSERT INTO `order_detail` VALUES (10365,'S50_4713',44,68.34,2);
INSERT INTO `order_detail` VALUES (10366,'S18_1984',34,116.65,3);
INSERT INTO `order_detail` VALUES (10366,'S18_2870',49,105.60,2);
INSERT INTO `order_detail` VALUES (10366,'S18_3232',34,154.10,1);
INSERT INTO `order_detail` VALUES (10367,'S18_1589',49,105.77,1);
INSERT INTO `order_detail` VALUES (10367,'S18_1749',37,144.50,3);
INSERT INTO `order_detail` VALUES (10367,'S18_2248',45,50.25,4);
INSERT INTO `order_detail` VALUES (10367,'S18_2325',27,124.59,5);
INSERT INTO `order_detail` VALUES (10367,'S18_2795',32,140.06,7);
INSERT INTO `order_detail` VALUES (10367,'S18_3685',46,131.39,6);
INSERT INTO `order_detail` VALUES (10367,'S18_4409',43,77.31,8);
INSERT INTO `order_detail` VALUES (10367,'S18_4933',44,66.99,9);
INSERT INTO `order_detail` VALUES (10367,'S24_1046',21,72.76,10);
INSERT INTO `order_detail` VALUES (10367,'S24_1628',38,50.31,11);
INSERT INTO `order_detail` VALUES (10367,'S24_1937',23,29.54,13);
INSERT INTO `order_detail` VALUES (10367,'S24_2022',28,43.01,12);
INSERT INTO `order_detail` VALUES (10367,'S24_2972',36,36.25,2);
INSERT INTO `order_detail` VALUES (10368,'S24_2766',40,73.60,2);
INSERT INTO `order_detail` VALUES (10368,'S24_2887',31,115.09,5);
INSERT INTO `order_detail` VALUES (10368,'S24_3191',46,83.04,1);
INSERT INTO `order_detail` VALUES (10368,'S24_3432',20,93.16,4);
INSERT INTO `order_detail` VALUES (10368,'S24_3969',46,36.52,3);
INSERT INTO `order_detail` VALUES (10369,'S10_1949',41,195.01,2);
INSERT INTO `order_detail` VALUES (10369,'S18_1342',44,89.38,8);
INSERT INTO `order_detail` VALUES (10369,'S18_1367',32,46.36,7);
INSERT INTO `order_detail` VALUES (10369,'S18_2949',42,100.30,1);
INSERT INTO `order_detail` VALUES (10369,'S18_2957',28,51.84,6);
INSERT INTO `order_detail` VALUES (10369,'S18_3136',21,90.06,5);
INSERT INTO `order_detail` VALUES (10369,'S18_3320',45,80.36,4);
INSERT INTO `order_detail` VALUES (10369,'S24_4258',40,93.49,3);
INSERT INTO `order_detail` VALUES (10370,'S10_4962',35,128.53,4);
INSERT INTO `order_detail` VALUES (10370,'S12_1666',49,128.47,8);
INSERT INTO `order_detail` VALUES (10370,'S18_1097',27,100.34,1);
INSERT INTO `order_detail` VALUES (10370,'S18_2319',22,101.87,5);
INSERT INTO `order_detail` VALUES (10370,'S18_2432',22,60.16,7);
INSERT INTO `order_detail` VALUES (10370,'S18_3232',27,167.65,9);
INSERT INTO `order_detail` VALUES (10370,'S18_4600',29,105.34,6);
INSERT INTO `order_detail` VALUES (10370,'S18_4668',20,41.76,2);
INSERT INTO `order_detail` VALUES (10370,'S32_3522',25,63.99,3);
INSERT INTO `order_detail` VALUES (10371,'S12_1108',32,178.71,6);
INSERT INTO `order_detail` VALUES (10371,'S12_4473',49,104.28,4);
INSERT INTO `order_detail` VALUES (10371,'S18_2238',25,160.46,7);
INSERT INTO `order_detail` VALUES (10371,'S24_1444',25,53.75,12);
INSERT INTO `order_detail` VALUES (10371,'S24_2300',20,126.51,5);
INSERT INTO `order_detail` VALUES (10371,'S24_2840',45,35.01,8);
INSERT INTO `order_detail` VALUES (10371,'S24_4048',28,95.81,9);
INSERT INTO `order_detail` VALUES (10371,'S32_1268',26,82.83,1);
INSERT INTO `order_detail` VALUES (10371,'S32_2509',20,44.37,2);
INSERT INTO `order_detail` VALUES (10371,'S32_3207',30,53.44,11);
INSERT INTO `order_detail` VALUES (10371,'S50_1392',48,97.23,10);
INSERT INTO `order_detail` VALUES (10371,'S700_2824',34,83.95,3);
INSERT INTO `order_detail` VALUES (10372,'S12_3148',40,146.55,4);
INSERT INTO `order_detail` VALUES (10372,'S12_3891',34,140.15,1);
INSERT INTO `order_detail` VALUES (10372,'S18_3140',28,131.13,3);
INSERT INTO `order_detail` VALUES (10372,'S18_3259',25,91.76,5);
INSERT INTO `order_detail` VALUES (10372,'S18_4027',48,119.20,6);
INSERT INTO `order_detail` VALUES (10372,'S18_4522',41,78.99,7);
INSERT INTO `order_detail` VALUES (10372,'S24_2011',37,102.00,8);
INSERT INTO `order_detail` VALUES (10372,'S50_1514',24,56.82,9);
INSERT INTO `order_detail` VALUES (10372,'S700_1938',44,74.48,2);
INSERT INTO `order_detail` VALUES (10373,'S10_4757',39,118.32,3);
INSERT INTO `order_detail` VALUES (10373,'S18_1662',28,143.50,4);
INSERT INTO `order_detail` VALUES (10373,'S18_3029',22,75.70,5);
INSERT INTO `order_detail` VALUES (10373,'S18_3856',50,99.52,6);
INSERT INTO `order_detail` VALUES (10373,'S24_2841',38,58.92,7);
INSERT INTO `order_detail` VALUES (10373,'S24_3151',33,82.31,12);
INSERT INTO `order_detail` VALUES (10373,'S24_3420',46,53.92,11);
INSERT INTO `order_detail` VALUES (10373,'S24_3816',23,83.86,10);
INSERT INTO `order_detail` VALUES (10373,'S24_3949',39,62.10,13);
INSERT INTO `order_detail` VALUES (10373,'S700_1138',44,58.00,14);
INSERT INTO `order_detail` VALUES (10373,'S700_2047',32,76.94,15);
INSERT INTO `order_detail` VALUES (10373,'S700_2610',41,69.39,16);
INSERT INTO `order_detail` VALUES (10373,'S700_3505',34,94.16,2);
INSERT INTO `order_detail` VALUES (10373,'S700_3962',37,83.42,8);
INSERT INTO `order_detail` VALUES (10373,'S700_4002',45,68.11,17);
INSERT INTO `order_detail` VALUES (10373,'S72_1253',25,44.20,9);
INSERT INTO `order_detail` VALUES (10373,'S72_3212',29,48.05,1);
INSERT INTO `order_detail` VALUES (10374,'S10_2016',39,115.37,5);
INSERT INTO `order_detail` VALUES (10374,'S10_4698',22,158.80,1);
INSERT INTO `order_detail` VALUES (10374,'S18_2581',42,75.19,2);
INSERT INTO `order_detail` VALUES (10374,'S18_2625',22,48.46,4);
INSERT INTO `order_detail` VALUES (10374,'S24_1578',38,112.70,6);
INSERT INTO `order_detail` VALUES (10374,'S24_1785',46,107.23,3);
INSERT INTO `order_detail` VALUES (10375,'S10_1678',21,76.56,12);
INSERT INTO `order_detail` VALUES (10375,'S12_1099',45,184.84,7);
INSERT INTO `order_detail` VALUES (10375,'S12_2823',49,150.62,13);
INSERT INTO `order_detail` VALUES (10375,'S24_2000',23,67.03,9);
INSERT INTO `order_detail` VALUES (10375,'S24_2360',20,60.26,14);
INSERT INTO `order_detail` VALUES (10375,'S24_4278',43,60.13,2);
INSERT INTO `order_detail` VALUES (10375,'S32_1374',37,87.90,3);
INSERT INTO `order_detail` VALUES (10375,'S32_4289',44,59.85,4);
INSERT INTO `order_detail` VALUES (10375,'S32_4485',41,96.95,15);
INSERT INTO `order_detail` VALUES (10375,'S50_1341',49,36.22,5);
INSERT INTO `order_detail` VALUES (10375,'S50_4713',49,69.16,8);
INSERT INTO `order_detail` VALUES (10375,'S700_1691',37,86.77,6);
INSERT INTO `order_detail` VALUES (10375,'S700_2466',33,94.73,1);
INSERT INTO `order_detail` VALUES (10375,'S700_2834',25,98.48,10);
INSERT INTO `order_detail` VALUES (10375,'S700_3167',44,69.60,11);
INSERT INTO `order_detail` VALUES (10376,'S12_3380',35,98.65,1);
INSERT INTO `order_detail` VALUES (10377,'S12_3990',24,65.44,5);
INSERT INTO `order_detail` VALUES (10377,'S12_4675',50,112.86,1);
INSERT INTO `order_detail` VALUES (10377,'S18_1129',35,124.56,2);
INSERT INTO `order_detail` VALUES (10377,'S18_1889',31,61.60,4);
INSERT INTO `order_detail` VALUES (10377,'S18_1984',36,125.18,6);
INSERT INTO `order_detail` VALUES (10377,'S18_3232',39,143.94,3);
INSERT INTO `order_detail` VALUES (10378,'S18_1589',34,121.95,5);
INSERT INTO `order_detail` VALUES (10378,'S18_3278',22,66.74,4);
INSERT INTO `order_detail` VALUES (10378,'S18_3482',43,146.99,10);
INSERT INTO `order_detail` VALUES (10378,'S18_3782',28,60.30,9);
INSERT INTO `order_detail` VALUES (10378,'S18_4721',49,122.02,8);
INSERT INTO `order_detail` VALUES (10378,'S24_2972',41,30.59,7);
INSERT INTO `order_detail` VALUES (10378,'S24_3371',46,52.66,6);
INSERT INTO `order_detail` VALUES (10378,'S24_3856',33,129.20,3);
INSERT INTO `order_detail` VALUES (10378,'S24_4620',41,80.84,2);
INSERT INTO `order_detail` VALUES (10378,'S32_2206',40,35.80,1);
INSERT INTO `order_detail` VALUES (10379,'S18_1749',39,156.40,2);
INSERT INTO `order_detail` VALUES (10379,'S18_2248',27,50.85,1);
INSERT INTO `order_detail` VALUES (10379,'S18_2870',29,113.52,5);
INSERT INTO `order_detail` VALUES (10379,'S18_3685',32,134.22,4);
INSERT INTO `order_detail` VALUES (10379,'S24_1628',32,48.80,3);
INSERT INTO `order_detail` VALUES (10380,'S18_1342',27,88.36,13);
INSERT INTO `order_detail` VALUES (10380,'S18_2325',40,119.50,10);
INSERT INTO `order_detail` VALUES (10380,'S18_2795',21,156.94,8);
INSERT INTO `order_detail` VALUES (10380,'S18_4409',32,78.23,1);
INSERT INTO `order_detail` VALUES (10380,'S18_4933',24,66.99,2);
INSERT INTO `order_detail` VALUES (10380,'S24_1046',34,66.88,3);
INSERT INTO `order_detail` VALUES (10380,'S24_1937',32,29.87,4);
INSERT INTO `order_detail` VALUES (10380,'S24_2022',27,37.63,5);
INSERT INTO `order_detail` VALUES (10380,'S24_2766',36,77.24,6);
INSERT INTO `order_detail` VALUES (10380,'S24_2887',44,111.57,7);
INSERT INTO `order_detail` VALUES (10380,'S24_3191',44,77.05,9);
INSERT INTO `order_detail` VALUES (10380,'S24_3432',34,91.02,11);
INSERT INTO `order_detail` VALUES (10380,'S24_3969',43,32.82,12);
INSERT INTO `order_detail` VALUES (10381,'S10_1949',36,182.16,3);
INSERT INTO `order_detail` VALUES (10381,'S10_4962',37,138.88,6);
INSERT INTO `order_detail` VALUES (10381,'S12_1666',20,132.57,1);
INSERT INTO `order_detail` VALUES (10381,'S18_1097',48,114.34,2);
INSERT INTO `order_detail` VALUES (10381,'S18_1367',25,49.60,9);
INSERT INTO `order_detail` VALUES (10381,'S18_2432',35,60.77,7);
INSERT INTO `order_detail` VALUES (10381,'S18_2949',41,100.30,8);
INSERT INTO `order_detail` VALUES (10381,'S18_2957',40,51.22,4);
INSERT INTO `order_detail` VALUES (10381,'S18_3136',35,93.20,5);
INSERT INTO `order_detail` VALUES (10382,'S12_1108',34,166.24,10);
INSERT INTO `order_detail` VALUES (10382,'S12_3148',37,145.04,11);
INSERT INTO `order_detail` VALUES (10382,'S12_3891',34,143.61,12);
INSERT INTO `order_detail` VALUES (10382,'S12_4473',32,103.10,13);
INSERT INTO `order_detail` VALUES (10382,'S18_2238',25,160.46,5);
INSERT INTO `order_detail` VALUES (10382,'S18_3320',50,84.33,7);
INSERT INTO `order_detail` VALUES (10382,'S18_4600',39,115.03,1);
INSERT INTO `order_detail` VALUES (10382,'S18_4668',39,46.29,2);
INSERT INTO `order_detail` VALUES (10382,'S24_2300',20,120.12,3);
INSERT INTO `order_detail` VALUES (10382,'S24_4258',33,97.39,4);
INSERT INTO `order_detail` VALUES (10382,'S32_1268',26,85.72,6);
INSERT INTO `order_detail` VALUES (10382,'S32_3522',48,57.53,8);
INSERT INTO `order_detail` VALUES (10382,'S700_2824',34,101.15,9);
INSERT INTO `order_detail` VALUES (10383,'S18_2319',27,119.05,11);
INSERT INTO `order_detail` VALUES (10383,'S18_3140',24,125.66,9);
INSERT INTO `order_detail` VALUES (10383,'S18_3232',47,155.79,6);
INSERT INTO `order_detail` VALUES (10383,'S18_3259',26,83.70,12);
INSERT INTO `order_detail` VALUES (10383,'S18_4027',38,137.88,1);
INSERT INTO `order_detail` VALUES (10383,'S18_4522',28,77.24,7);
INSERT INTO `order_detail` VALUES (10383,'S24_1444',22,52.60,2);
INSERT INTO `order_detail` VALUES (10383,'S24_2840',40,33.24,3);
INSERT INTO `order_detail` VALUES (10383,'S24_4048',21,117.10,4);
INSERT INTO `order_detail` VALUES (10383,'S32_2509',32,53.57,5);
INSERT INTO `order_detail` VALUES (10383,'S32_3207',44,55.93,8);
INSERT INTO `order_detail` VALUES (10383,'S50_1392',29,94.92,13);
INSERT INTO `order_detail` VALUES (10383,'S50_1514',38,48.62,10);
INSERT INTO `order_detail` VALUES (10384,'S10_4757',34,129.20,4);
INSERT INTO `order_detail` VALUES (10384,'S24_2011',28,114.29,3);
INSERT INTO `order_detail` VALUES (10384,'S24_3151',43,71.69,2);
INSERT INTO `order_detail` VALUES (10384,'S700_1938',49,71.02,1);
INSERT INTO `order_detail` VALUES (10385,'S24_3816',37,78.83,2);
INSERT INTO `order_detail` VALUES (10385,'S700_1138',25,62.00,1);
INSERT INTO `order_detail` VALUES (10386,'S18_1662',25,130.88,7);
INSERT INTO `order_detail` VALUES (10386,'S18_2581',21,72.65,18);
INSERT INTO `order_detail` VALUES (10386,'S18_3029',37,73.12,5);
INSERT INTO `order_detail` VALUES (10386,'S18_3856',22,100.58,6);
INSERT INTO `order_detail` VALUES (10386,'S24_1785',33,101.76,11);
INSERT INTO `order_detail` VALUES (10386,'S24_2841',39,56.86,1);
INSERT INTO `order_detail` VALUES (10386,'S24_3420',35,54.57,9);
INSERT INTO `order_detail` VALUES (10386,'S24_3949',41,55.96,12);
INSERT INTO `order_detail` VALUES (10386,'S24_4278',50,71.73,8);
INSERT INTO `order_detail` VALUES (10386,'S700_2047',29,85.09,13);
INSERT INTO `order_detail` VALUES (10386,'S700_2466',37,90.75,14);
INSERT INTO `order_detail` VALUES (10386,'S700_2610',37,67.22,10);
INSERT INTO `order_detail` VALUES (10386,'S700_3167',32,68.00,17);
INSERT INTO `order_detail` VALUES (10386,'S700_3505',45,83.14,2);
INSERT INTO `order_detail` VALUES (10386,'S700_3962',30,80.44,3);
INSERT INTO `order_detail` VALUES (10386,'S700_4002',44,59.22,15);
INSERT INTO `order_detail` VALUES (10386,'S72_1253',50,47.67,16);
INSERT INTO `order_detail` VALUES (10386,'S72_3212',43,52.42,4);
INSERT INTO `order_detail` VALUES (10387,'S32_1374',44,79.91,1);
INSERT INTO `order_detail` VALUES (10388,'S10_1678',42,80.39,4);
INSERT INTO `order_detail` VALUES (10388,'S10_2016',50,118.94,5);
INSERT INTO `order_detail` VALUES (10388,'S10_4698',21,156.86,7);
INSERT INTO `order_detail` VALUES (10388,'S12_2823',44,125.01,6);
INSERT INTO `order_detail` VALUES (10388,'S32_4289',35,58.47,8);
INSERT INTO `order_detail` VALUES (10388,'S50_1341',27,41.02,1);
INSERT INTO `order_detail` VALUES (10388,'S700_1691',46,74.90,2);
INSERT INTO `order_detail` VALUES (10388,'S700_2834',50,111.53,3);
INSERT INTO `order_detail` VALUES (10389,'S12_1099',26,182.90,4);
INSERT INTO `order_detail` VALUES (10389,'S12_3380',25,95.13,6);
INSERT INTO `order_detail` VALUES (10389,'S12_3990',36,76.61,7);
INSERT INTO `order_detail` VALUES (10389,'S12_4675',47,102.49,8);
INSERT INTO `order_detail` VALUES (10389,'S18_1889',49,63.91,3);
INSERT INTO `order_detail` VALUES (10389,'S18_2625',39,52.09,5);
INSERT INTO `order_detail` VALUES (10389,'S24_1578',45,112.70,1);
INSERT INTO `order_detail` VALUES (10389,'S24_2000',49,61.70,2);
INSERT INTO `order_detail` VALUES (10390,'S18_1129',36,117.48,14);
INSERT INTO `order_detail` VALUES (10390,'S18_1984',34,132.29,15);
INSERT INTO `order_detail` VALUES (10390,'S18_2325',31,102.98,16);
INSERT INTO `order_detail` VALUES (10390,'S18_2795',26,162.00,7);
INSERT INTO `order_detail` VALUES (10390,'S18_3278',40,75.59,9);
INSERT INTO `order_detail` VALUES (10390,'S18_3482',50,135.23,1);
INSERT INTO `order_detail` VALUES (10390,'S18_3782',36,54.09,2);
INSERT INTO `order_detail` VALUES (10390,'S18_4721',49,122.02,3);
INSERT INTO `order_detail` VALUES (10390,'S24_2360',35,67.87,4);
INSERT INTO `order_detail` VALUES (10390,'S24_2972',37,35.87,5);
INSERT INTO `order_detail` VALUES (10390,'S24_3371',46,51.43,6);
INSERT INTO `order_detail` VALUES (10390,'S24_3856',45,134.81,8);
INSERT INTO `order_detail` VALUES (10390,'S24_4620',30,66.29,10);
INSERT INTO `order_detail` VALUES (10390,'S32_2206',41,39.02,11);
INSERT INTO `order_detail` VALUES (10390,'S32_4485',45,101.03,12);
INSERT INTO `order_detail` VALUES (10390,'S50_4713',22,81.36,13);
INSERT INTO `order_detail` VALUES (10391,'S10_1949',24,195.01,4);
INSERT INTO `order_detail` VALUES (10391,'S10_4962',37,121.15,7);
INSERT INTO `order_detail` VALUES (10391,'S12_1666',39,110.70,9);
INSERT INTO `order_detail` VALUES (10391,'S18_1097',29,114.34,10);
INSERT INTO `order_detail` VALUES (10391,'S18_1342',35,102.74,2);
INSERT INTO `order_detail` VALUES (10391,'S18_1367',42,47.44,3);
INSERT INTO `order_detail` VALUES (10391,'S18_2432',44,57.73,5);
INSERT INTO `order_detail` VALUES (10391,'S18_2949',32,99.28,6);
INSERT INTO `order_detail` VALUES (10391,'S24_1937',33,26.55,8);
INSERT INTO `order_detail` VALUES (10391,'S24_2022',24,36.29,1);
INSERT INTO `order_detail` VALUES (10392,'S18_2957',37,61.21,3);
INSERT INTO `order_detail` VALUES (10392,'S18_3136',29,103.67,2);
INSERT INTO `order_detail` VALUES (10392,'S18_3320',36,98.22,1);
INSERT INTO `order_detail` VALUES (10393,'S12_3148',35,145.04,8);
INSERT INTO `order_detail` VALUES (10393,'S12_4473',32,99.54,10);
INSERT INTO `order_detail` VALUES (10393,'S18_2238',20,137.53,11);
INSERT INTO `order_detail` VALUES (10393,'S18_2319',38,104.32,7);
INSERT INTO `order_detail` VALUES (10393,'S18_4600',30,106.55,9);
INSERT INTO `order_detail` VALUES (10393,'S18_4668',44,41.76,1);
INSERT INTO `order_detail` VALUES (10393,'S24_2300',33,112.46,2);
INSERT INTO `order_detail` VALUES (10393,'S24_4258',33,88.62,3);
INSERT INTO `order_detail` VALUES (10393,'S32_1268',38,84.75,4);
INSERT INTO `order_detail` VALUES (10393,'S32_3522',31,63.35,5);
INSERT INTO `order_detail` VALUES (10393,'S700_2824',21,83.95,6);
INSERT INTO `order_detail` VALUES (10394,'S18_3232',22,135.47,5);
INSERT INTO `order_detail` VALUES (10394,'S18_4027',37,124.95,1);
INSERT INTO `order_detail` VALUES (10394,'S24_1444',31,53.18,2);
INSERT INTO `order_detail` VALUES (10394,'S24_2840',46,35.36,6);
INSERT INTO `order_detail` VALUES (10394,'S24_4048',37,104.09,7);
INSERT INTO `order_detail` VALUES (10394,'S32_2509',36,47.08,3);
INSERT INTO `order_detail` VALUES (10394,'S32_3207',30,55.93,4);
INSERT INTO `order_detail` VALUES (10395,'S10_4757',32,125.12,2);
INSERT INTO `order_detail` VALUES (10395,'S12_1108',33,205.72,1);
INSERT INTO `order_detail` VALUES (10395,'S50_1392',46,98.39,4);
INSERT INTO `order_detail` VALUES (10395,'S50_1514',45,57.99,3);
INSERT INTO `order_detail` VALUES (10396,'S12_3891',33,155.72,3);
INSERT INTO `order_detail` VALUES (10396,'S18_3140',33,129.76,2);
INSERT INTO `order_detail` VALUES (10396,'S18_3259',24,91.76,4);
INSERT INTO `order_detail` VALUES (10396,'S18_4522',45,83.38,5);
INSERT INTO `order_detail` VALUES (10396,'S24_2011',49,100.77,6);
INSERT INTO `order_detail` VALUES (10396,'S24_3151',27,77.00,7);
INSERT INTO `order_detail` VALUES (10396,'S24_3816',37,77.99,8);
INSERT INTO `order_detail` VALUES (10396,'S700_1138',39,62.00,1);
INSERT INTO `order_detail` VALUES (10397,'S700_1938',32,69.29,5);
INSERT INTO `order_detail` VALUES (10397,'S700_2610',22,62.88,4);
INSERT INTO `order_detail` VALUES (10397,'S700_3505',48,86.15,3);
INSERT INTO `order_detail` VALUES (10397,'S700_3962',36,80.44,2);
INSERT INTO `order_detail` VALUES (10397,'S72_3212',34,52.96,1);
INSERT INTO `order_detail` VALUES (10398,'S18_1662',33,130.88,11);
INSERT INTO `order_detail` VALUES (10398,'S18_2581',34,82.79,15);
INSERT INTO `order_detail` VALUES (10398,'S18_3029',28,70.54,18);
INSERT INTO `order_detail` VALUES (10398,'S18_3856',45,92.11,17);
INSERT INTO `order_detail` VALUES (10398,'S24_1785',43,100.67,16);
INSERT INTO `order_detail` VALUES (10398,'S24_2841',28,60.29,3);
INSERT INTO `order_detail` VALUES (10398,'S24_3420',34,61.15,13);
INSERT INTO `order_detail` VALUES (10398,'S24_3949',41,56.64,2);
INSERT INTO `order_detail` VALUES (10398,'S24_4278',45,65.93,14);
INSERT INTO `order_detail` VALUES (10398,'S32_4289',22,60.54,4);
INSERT INTO `order_detail` VALUES (10398,'S50_1341',49,38.84,5);
INSERT INTO `order_detail` VALUES (10398,'S700_1691',47,78.55,6);
INSERT INTO `order_detail` VALUES (10398,'S700_2047',36,75.13,7);
INSERT INTO `order_detail` VALUES (10398,'S700_2466',22,98.72,8);
INSERT INTO `order_detail` VALUES (10398,'S700_2834',23,102.04,9);
INSERT INTO `order_detail` VALUES (10398,'S700_3167',29,76.80,10);
INSERT INTO `order_detail` VALUES (10398,'S700_4002',36,62.19,12);
INSERT INTO `order_detail` VALUES (10398,'S72_1253',34,41.22,1);
INSERT INTO `order_detail` VALUES (10399,'S10_1678',40,77.52,8);
INSERT INTO `order_detail` VALUES (10399,'S10_2016',51,99.91,7);
INSERT INTO `order_detail` VALUES (10399,'S10_4698',22,156.86,6);
INSERT INTO `order_detail` VALUES (10399,'S12_2823',29,123.51,5);
INSERT INTO `order_detail` VALUES (10399,'S18_2625',30,51.48,4);
INSERT INTO `order_detail` VALUES (10399,'S24_1578',57,104.81,3);
INSERT INTO `order_detail` VALUES (10399,'S24_2000',58,75.41,2);
INSERT INTO `order_detail` VALUES (10399,'S32_1374',32,97.89,1);
INSERT INTO `order_detail` VALUES (10400,'S10_4757',64,134.64,9);
INSERT INTO `order_detail` VALUES (10400,'S18_1662',34,129.31,1);
INSERT INTO `order_detail` VALUES (10400,'S18_3029',30,74.84,7);
INSERT INTO `order_detail` VALUES (10400,'S18_3856',58,88.93,6);
INSERT INTO `order_detail` VALUES (10400,'S24_2841',24,55.49,2);
INSERT INTO `order_detail` VALUES (10400,'S24_3420',38,59.18,3);
INSERT INTO `order_detail` VALUES (10400,'S24_3816',42,74.64,8);
INSERT INTO `order_detail` VALUES (10400,'S700_2047',46,82.37,5);
INSERT INTO `order_detail` VALUES (10400,'S72_1253',20,41.71,4);
INSERT INTO `order_detail` VALUES (10401,'S18_2581',42,75.19,3);
INSERT INTO `order_detail` VALUES (10401,'S24_1785',38,87.54,5);
INSERT INTO `order_detail` VALUES (10401,'S24_3949',64,59.37,12);
INSERT INTO `order_detail` VALUES (10401,'S24_4278',52,65.93,4);
INSERT INTO `order_detail` VALUES (10401,'S32_1374',49,81.91,1);
INSERT INTO `order_detail` VALUES (10401,'S32_4289',62,62.60,6);
INSERT INTO `order_detail` VALUES (10401,'S50_1341',56,41.46,7);
INSERT INTO `order_detail` VALUES (10401,'S700_1691',11,77.64,8);
INSERT INTO `order_detail` VALUES (10401,'S700_2466',85,98.72,10);
INSERT INTO `order_detail` VALUES (10401,'S700_2834',21,96.11,2);
INSERT INTO `order_detail` VALUES (10401,'S700_3167',77,73.60,9);
INSERT INTO `order_detail` VALUES (10401,'S700_4002',40,66.63,11);
INSERT INTO `order_detail` VALUES (10402,'S10_2016',45,118.94,1);
INSERT INTO `order_detail` VALUES (10402,'S18_2625',55,58.15,2);
INSERT INTO `order_detail` VALUES (10402,'S24_2000',59,61.70,3);
INSERT INTO `order_detail` VALUES (10403,'S10_1678',24,85.17,7);
INSERT INTO `order_detail` VALUES (10403,'S10_4698',66,174.29,9);
INSERT INTO `order_detail` VALUES (10403,'S12_2823',66,122.00,6);
INSERT INTO `order_detail` VALUES (10403,'S18_3782',36,55.33,1);
INSERT INTO `order_detail` VALUES (10403,'S24_1578',46,109.32,8);
INSERT INTO `order_detail` VALUES (10403,'S24_2360',27,57.49,4);
INSERT INTO `order_detail` VALUES (10403,'S32_2206',30,35.80,2);
INSERT INTO `order_detail` VALUES (10403,'S32_4485',45,88.78,5);
INSERT INTO `order_detail` VALUES (10403,'S50_4713',31,65.09,3);
INSERT INTO `order_detail` VALUES (10404,'S12_1099',64,163.44,3);
INSERT INTO `order_detail` VALUES (10404,'S12_3380',43,102.17,1);
INSERT INTO `order_detail` VALUES (10404,'S12_3990',77,67.03,4);
INSERT INTO `order_detail` VALUES (10404,'S18_3278',90,67.54,6);
INSERT INTO `order_detail` VALUES (10404,'S18_3482',28,127.88,5);
INSERT INTO `order_detail` VALUES (10404,'S18_4721',48,124.99,8);
INSERT INTO `order_detail` VALUES (10404,'S24_3371',49,53.27,2);
INSERT INTO `order_detail` VALUES (10404,'S24_4620',48,65.48,7);
INSERT INTO `order_detail` VALUES (10405,'S12_4675',97,115.16,5);
INSERT INTO `order_detail` VALUES (10405,'S18_1889',61,72.38,4);
INSERT INTO `order_detail` VALUES (10405,'S18_3232',55,147.33,1);
INSERT INTO `order_detail` VALUES (10405,'S24_2972',47,37.38,2);
INSERT INTO `order_detail` VALUES (10405,'S24_3856',76,127.79,3);
INSERT INTO `order_detail` VALUES (10406,'S18_1129',61,124.56,3);
INSERT INTO `order_detail` VALUES (10406,'S18_1984',48,133.72,2);
INSERT INTO `order_detail` VALUES (10406,'S18_3685',65,117.26,1);
INSERT INTO `order_detail` VALUES (10407,'S18_1589',59,114.48,11);
INSERT INTO `order_detail` VALUES (10407,'S18_1749',76,141.10,2);
INSERT INTO `order_detail` VALUES (10407,'S18_2248',42,58.12,1);
INSERT INTO `order_detail` VALUES (10407,'S18_2870',41,132.00,12);
INSERT INTO `order_detail` VALUES (10407,'S18_4409',6,91.11,3);
INSERT INTO `order_detail` VALUES (10407,'S18_4933',66,64.14,4);
INSERT INTO `order_detail` VALUES (10407,'S24_1046',26,68.35,8);
INSERT INTO `order_detail` VALUES (10407,'S24_1628',64,45.78,10);
INSERT INTO `order_detail` VALUES (10407,'S24_2766',76,81.78,6);
INSERT INTO `order_detail` VALUES (10407,'S24_2887',59,98.65,5);
INSERT INTO `order_detail` VALUES (10407,'S24_3191',13,77.05,7);
INSERT INTO `order_detail` VALUES (10407,'S24_3432',43,101.73,9);
INSERT INTO `order_detail` VALUES (10408,'S24_3969',15,41.03,1);
INSERT INTO `order_detail` VALUES (10409,'S18_2325',6,104.25,2);
INSERT INTO `order_detail` VALUES (10409,'S24_1937',61,27.88,1);
INSERT INTO `order_detail` VALUES (10410,'S18_1342',65,99.66,7);
INSERT INTO `order_detail` VALUES (10410,'S18_1367',44,51.21,6);
INSERT INTO `order_detail` VALUES (10410,'S18_2795',56,145.13,8);
INSERT INTO `order_detail` VALUES (10410,'S18_2949',47,93.21,1);
INSERT INTO `order_detail` VALUES (10410,'S18_2957',53,49.97,3);
INSERT INTO `order_detail` VALUES (10410,'S18_3136',34,84.82,2);
INSERT INTO `order_detail` VALUES (10410,'S18_3320',44,81.35,5);
INSERT INTO `order_detail` VALUES (10410,'S24_2022',31,42.56,9);
INSERT INTO `order_detail` VALUES (10410,'S24_4258',50,95.44,4);
INSERT INTO `order_detail` VALUES (10411,'S10_1949',23,205.73,9);
INSERT INTO `order_detail` VALUES (10411,'S10_4962',27,144.79,2);
INSERT INTO `order_detail` VALUES (10411,'S12_1666',40,110.70,6);
INSERT INTO `order_detail` VALUES (10411,'S18_1097',27,109.67,8);
INSERT INTO `order_detail` VALUES (10411,'S18_4600',46,106.55,3);
INSERT INTO `order_detail` VALUES (10411,'S18_4668',35,41.25,7);
INSERT INTO `order_detail` VALUES (10411,'S32_1268',26,78.01,1);
INSERT INTO `order_detail` VALUES (10411,'S32_3522',27,60.76,5);
INSERT INTO `order_detail` VALUES (10411,'S700_2824',34,89.01,4);
INSERT INTO `order_detail` VALUES (10412,'S12_4473',54,100.73,5);
INSERT INTO `order_detail` VALUES (10412,'S18_2238',41,150.63,4);
INSERT INTO `order_detail` VALUES (10412,'S18_2319',56,120.28,8);
INSERT INTO `order_detail` VALUES (10412,'S18_2432',47,49.83,11);
INSERT INTO `order_detail` VALUES (10412,'S18_3232',60,157.49,9);
INSERT INTO `order_detail` VALUES (10412,'S24_1444',21,47.40,2);
INSERT INTO `order_detail` VALUES (10412,'S24_2300',70,109.90,10);
INSERT INTO `order_detail` VALUES (10412,'S24_2840',30,32.88,6);
INSERT INTO `order_detail` VALUES (10412,'S24_4048',31,108.82,1);
INSERT INTO `order_detail` VALUES (10412,'S32_2509',19,50.86,7);
INSERT INTO `order_detail` VALUES (10412,'S50_1392',26,105.33,3);
INSERT INTO `order_detail` VALUES (10413,'S12_1108',36,201.57,2);
INSERT INTO `order_detail` VALUES (10413,'S12_3148',47,145.04,3);
INSERT INTO `order_detail` VALUES (10413,'S12_3891',22,173.02,1);
INSERT INTO `order_detail` VALUES (10413,'S18_4027',49,133.57,5);
INSERT INTO `order_detail` VALUES (10413,'S32_3207',24,56.55,6);
INSERT INTO `order_detail` VALUES (10413,'S50_1514',51,53.31,4);
INSERT INTO `order_detail` VALUES (10414,'S10_4757',49,114.24,3);
INSERT INTO `order_detail` VALUES (10414,'S18_3029',44,77.42,1);
INSERT INTO `order_detail` VALUES (10414,'S18_3140',41,128.39,12);
INSERT INTO `order_detail` VALUES (10414,'S18_3259',48,85.71,14);
INSERT INTO `order_detail` VALUES (10414,'S18_4522',56,83.38,11);
INSERT INTO `order_detail` VALUES (10414,'S24_2011',43,108.14,10);
INSERT INTO `order_detail` VALUES (10414,'S24_3151',60,72.58,5);
INSERT INTO `order_detail` VALUES (10414,'S24_3816',51,72.96,2);
INSERT INTO `order_detail` VALUES (10414,'S700_1138',37,62.00,6);
INSERT INTO `order_detail` VALUES (10414,'S700_1938',34,74.48,13);
INSERT INTO `order_detail` VALUES (10414,'S700_2610',31,61.44,4);
INSERT INTO `order_detail` VALUES (10414,'S700_3505',28,84.14,7);
INSERT INTO `order_detail` VALUES (10414,'S700_3962',40,84.41,8);
INSERT INTO `order_detail` VALUES (10414,'S72_3212',47,54.60,9);
INSERT INTO `order_detail` VALUES (10415,'S18_3856',51,86.81,5);
INSERT INTO `order_detail` VALUES (10415,'S24_2841',21,60.97,1);
INSERT INTO `order_detail` VALUES (10415,'S24_3420',18,59.83,2);
INSERT INTO `order_detail` VALUES (10415,'S700_2047',32,73.32,4);
INSERT INTO `order_detail` VALUES (10415,'S72_1253',42,43.20,3);
INSERT INTO `order_detail` VALUES (10416,'S18_1662',24,129.31,14);
INSERT INTO `order_detail` VALUES (10416,'S18_2581',15,70.96,4);
INSERT INTO `order_detail` VALUES (10416,'S24_1785',47,90.82,6);
INSERT INTO `order_detail` VALUES (10416,'S24_2000',32,62.46,1);
INSERT INTO `order_detail` VALUES (10416,'S24_3949',18,64.83,13);
INSERT INTO `order_detail` VALUES (10416,'S24_4278',48,70.28,5);
INSERT INTO `order_detail` VALUES (10416,'S32_1374',45,86.90,2);
INSERT INTO `order_detail` VALUES (10416,'S32_4289',26,68.10,7);
INSERT INTO `order_detail` VALUES (10416,'S50_1341',37,39.71,8);
INSERT INTO `order_detail` VALUES (10416,'S700_1691',23,88.60,9);
INSERT INTO `order_detail` VALUES (10416,'S700_2466',22,84.76,11);
INSERT INTO `order_detail` VALUES (10416,'S700_2834',41,98.48,3);
INSERT INTO `order_detail` VALUES (10416,'S700_3167',39,65.60,10);
INSERT INTO `order_detail` VALUES (10416,'S700_4002',43,63.67,12);
INSERT INTO `order_detail` VALUES (10417,'S10_1678',66,79.43,2);
INSERT INTO `order_detail` VALUES (10417,'S10_2016',45,116.56,5);
INSERT INTO `order_detail` VALUES (10417,'S10_4698',56,162.67,4);
INSERT INTO `order_detail` VALUES (10417,'S12_2823',21,144.60,1);
INSERT INTO `order_detail` VALUES (10417,'S18_2625',36,58.75,6);
INSERT INTO `order_detail` VALUES (10417,'S24_1578',35,109.32,3);
INSERT INTO `order_detail` VALUES (10418,'S18_3278',16,70.76,2);
INSERT INTO `order_detail` VALUES (10418,'S18_3482',27,139.64,1);
INSERT INTO `order_detail` VALUES (10418,'S18_3782',33,56.57,5);
INSERT INTO `order_detail` VALUES (10418,'S18_4721',28,120.53,4);
INSERT INTO `order_detail` VALUES (10418,'S24_2360',52,64.41,8);
INSERT INTO `order_detail` VALUES (10418,'S24_4620',10,66.29,3);
INSERT INTO `order_detail` VALUES (10418,'S32_2206',43,36.61,6);
INSERT INTO `order_detail` VALUES (10418,'S32_4485',50,100.01,9);
INSERT INTO `order_detail` VALUES (10418,'S50_4713',40,72.41,7);
INSERT INTO `order_detail` VALUES (10419,'S12_1099',12,182.90,13);
INSERT INTO `order_detail` VALUES (10419,'S12_3380',10,111.57,11);
INSERT INTO `order_detail` VALUES (10419,'S12_3990',34,64.64,14);
INSERT INTO `order_detail` VALUES (10419,'S12_4675',32,99.04,10);
INSERT INTO `order_detail` VALUES (10419,'S18_1129',38,117.48,5);
INSERT INTO `order_detail` VALUES (10419,'S18_1589',37,100.80,1);
INSERT INTO `order_detail` VALUES (10419,'S18_1889',39,67.76,9);
INSERT INTO `order_detail` VALUES (10419,'S18_1984',34,133.72,4);
INSERT INTO `order_detail` VALUES (10419,'S18_2870',55,116.16,2);
INSERT INTO `order_detail` VALUES (10419,'S18_3232',35,165.95,6);
INSERT INTO `order_detail` VALUES (10419,'S18_3685',43,114.44,3);
INSERT INTO `order_detail` VALUES (10419,'S24_2972',15,32.10,7);
INSERT INTO `order_detail` VALUES (10419,'S24_3371',55,52.66,12);
INSERT INTO `order_detail` VALUES (10419,'S24_3856',70,112.34,8);
INSERT INTO `order_detail` VALUES (10420,'S18_1749',37,153.00,5);
INSERT INTO `order_detail` VALUES (10420,'S18_2248',36,52.06,4);
INSERT INTO `order_detail` VALUES (10420,'S18_2325',45,116.96,2);
INSERT INTO `order_detail` VALUES (10420,'S18_4409',66,73.62,6);
INSERT INTO `order_detail` VALUES (10420,'S18_4933',36,68.42,7);
INSERT INTO `order_detail` VALUES (10420,'S24_1046',60,60.26,11);
INSERT INTO `order_detail` VALUES (10420,'S24_1628',37,48.80,13);
INSERT INTO `order_detail` VALUES (10420,'S24_1937',45,32.19,1);
INSERT INTO `order_detail` VALUES (10420,'S24_2766',39,76.33,9);
INSERT INTO `order_detail` VALUES (10420,'S24_2887',55,115.09,8);
INSERT INTO `order_detail` VALUES (10420,'S24_3191',35,77.05,10);
INSERT INTO `order_detail` VALUES (10420,'S24_3432',26,104.94,12);
INSERT INTO `order_detail` VALUES (10420,'S24_3969',15,35.29,3);
INSERT INTO `order_detail` VALUES (10421,'S18_2795',35,167.06,1);
INSERT INTO `order_detail` VALUES (10421,'S24_2022',40,44.80,2);
INSERT INTO `order_detail` VALUES (10422,'S18_1342',51,91.44,2);
INSERT INTO `order_detail` VALUES (10422,'S18_1367',25,47.44,1);
INSERT INTO `order_detail` VALUES (10423,'S18_2949',10,89.15,1);
INSERT INTO `order_detail` VALUES (10423,'S18_2957',31,56.21,3);
INSERT INTO `order_detail` VALUES (10423,'S18_3136',21,98.44,2);
INSERT INTO `order_detail` VALUES (10423,'S18_3320',21,80.36,5);
INSERT INTO `order_detail` VALUES (10423,'S24_4258',28,78.89,4);
INSERT INTO `order_detail` VALUES (10424,'S10_1949',50,201.44,6);
INSERT INTO `order_detail` VALUES (10424,'S12_1666',49,121.64,3);
INSERT INTO `order_detail` VALUES (10424,'S18_1097',54,108.50,5);
INSERT INTO `order_detail` VALUES (10424,'S18_4668',26,40.25,4);
INSERT INTO `order_detail` VALUES (10424,'S32_3522',44,54.94,2);
INSERT INTO `order_detail` VALUES (10424,'S700_2824',46,85.98,1);
INSERT INTO `order_detail` VALUES (10425,'S10_4962',38,131.49,12);
INSERT INTO `order_detail` VALUES (10425,'S12_4473',33,95.99,4);
INSERT INTO `order_detail` VALUES (10425,'S18_2238',28,147.36,3);
INSERT INTO `order_detail` VALUES (10425,'S18_2319',38,117.82,7);
INSERT INTO `order_detail` VALUES (10425,'S18_2432',19,48.62,10);
INSERT INTO `order_detail` VALUES (10425,'S18_3232',28,140.55,8);
INSERT INTO `order_detail` VALUES (10425,'S18_4600',38,107.76,13);
INSERT INTO `order_detail` VALUES (10425,'S24_1444',55,53.75,1);
INSERT INTO `order_detail` VALUES (10425,'S24_2300',49,127.79,9);
INSERT INTO `order_detail` VALUES (10425,'S24_2840',31,31.82,5);
INSERT INTO `order_detail` VALUES (10425,'S32_1268',41,83.79,11);
INSERT INTO `order_detail` VALUES (10425,'S32_2509',11,50.32,6);
INSERT INTO `order_detail` VALUES (10425,'S50_1392',18,94.92,2);
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `customer_number` int(11) NOT NULL,
  `check_number` varchar(50) NOT NULL,
  `payment_date` date NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`customer_number`,`check_number`),
  CONSTRAINT `payment_customer_customer_number_fk` FOREIGN KEY (`customer_number`) REFERENCES `customer` (`customer_number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (103,'HQ336336','2004-10-19',6066.78);
INSERT INTO `payment` VALUES (103,'JM555205','2003-06-05',14571.44);
INSERT INTO `payment` VALUES (103,'OM314933','2004-12-18',1676.14);
INSERT INTO `payment` VALUES (112,'BO864823','2004-12-17',14191.12);
INSERT INTO `payment` VALUES (112,'HQ55022','2003-06-06',32641.98);
INSERT INTO `payment` VALUES (112,'ND748579','2004-08-20',33347.88);
INSERT INTO `payment` VALUES (114,'GG31455','2003-05-20',45864.03);
INSERT INTO `payment` VALUES (114,'MA765515','2004-12-15',82261.22);
INSERT INTO `payment` VALUES (114,'NP603840','2003-05-31',7565.08);
INSERT INTO `payment` VALUES (114,'NR27552','2004-03-10',44894.74);
INSERT INTO `payment` VALUES (119,'DB933704','2004-11-14',19501.82);
INSERT INTO `payment` VALUES (119,'LN373447','2004-08-08',47924.19);
INSERT INTO `payment` VALUES (119,'NG94694','2005-02-22',49523.67);
INSERT INTO `payment` VALUES (121,'DB889831','2003-02-16',50218.95);
INSERT INTO `payment` VALUES (121,'FD317790','2003-10-28',1491.38);
INSERT INTO `payment` VALUES (121,'KI831359','2004-11-04',17876.32);
INSERT INTO `payment` VALUES (121,'MA302151','2004-11-28',34638.14);
INSERT INTO `payment` VALUES (124,'AE215433','2005-03-05',101244.59);
INSERT INTO `payment` VALUES (124,'BG255406','2004-08-28',85410.87);
INSERT INTO `payment` VALUES (124,'CQ287967','2003-04-11',11044.30);
INSERT INTO `payment` VALUES (124,'ET64396','2005-04-16',83598.04);
INSERT INTO `payment` VALUES (124,'HI366474','2004-12-27',47142.70);
INSERT INTO `payment` VALUES (124,'HR86578','2004-11-02',55639.66);
INSERT INTO `payment` VALUES (124,'KI131716','2003-08-15',111654.40);
INSERT INTO `payment` VALUES (124,'LF217299','2004-03-26',43369.30);
INSERT INTO `payment` VALUES (124,'NT141748','2003-11-25',45084.38);
INSERT INTO `payment` VALUES (128,'DI925118','2003-01-28',10549.01);
INSERT INTO `payment` VALUES (128,'FA465482','2003-10-18',24101.81);
INSERT INTO `payment` VALUES (128,'FH668230','2004-03-24',33820.62);
INSERT INTO `payment` VALUES (128,'IP383901','2004-11-18',7466.32);
INSERT INTO `payment` VALUES (129,'DM826140','2004-12-08',26248.78);
INSERT INTO `payment` VALUES (129,'ID449593','2003-12-11',23923.93);
INSERT INTO `payment` VALUES (129,'PI42991','2003-04-09',16537.85);
INSERT INTO `payment` VALUES (131,'CL442705','2003-03-12',22292.62);
INSERT INTO `payment` VALUES (131,'MA724562','2004-12-02',50025.35);
INSERT INTO `payment` VALUES (131,'NB445135','2004-09-11',35321.97);
INSERT INTO `payment` VALUES (141,'AU364101','2003-07-19',36251.03);
INSERT INTO `payment` VALUES (141,'DB583216','2004-11-01',36140.38);
INSERT INTO `payment` VALUES (141,'DL460618','2005-05-19',46895.48);
INSERT INTO `payment` VALUES (141,'HJ32686','2004-01-30',59830.55);
INSERT INTO `payment` VALUES (141,'ID10962','2004-12-31',116208.40);
INSERT INTO `payment` VALUES (141,'IN446258','2005-03-25',65071.26);
INSERT INTO `payment` VALUES (141,'JE105477','2005-03-18',120166.58);
INSERT INTO `payment` VALUES (141,'JN355280','2003-10-26',49539.37);
INSERT INTO `payment` VALUES (141,'JN722010','2003-02-25',40206.20);
INSERT INTO `payment` VALUES (141,'KT52578','2003-12-09',63843.55);
INSERT INTO `payment` VALUES (141,'MC46946','2004-07-09',35420.74);
INSERT INTO `payment` VALUES (141,'MF629602','2004-08-16',20009.53);
INSERT INTO `payment` VALUES (141,'NU627706','2004-05-17',26155.91);
INSERT INTO `payment` VALUES (144,'IR846303','2004-12-12',36005.71);
INSERT INTO `payment` VALUES (144,'LA685678','2003-04-09',7674.94);
INSERT INTO `payment` VALUES (145,'CN328545','2004-07-03',4710.73);
INSERT INTO `payment` VALUES (145,'ED39322','2004-04-26',28211.70);
INSERT INTO `payment` VALUES (145,'HR182688','2004-12-01',20564.86);
INSERT INTO `payment` VALUES (145,'JJ246391','2003-02-20',53959.21);
INSERT INTO `payment` VALUES (146,'FP549817','2004-03-18',40978.53);
INSERT INTO `payment` VALUES (146,'FU793410','2004-01-16',49614.72);
INSERT INTO `payment` VALUES (146,'LJ160635','2003-12-10',39712.10);
INSERT INTO `payment` VALUES (148,'BI507030','2003-04-22',44380.15);
INSERT INTO `payment` VALUES (148,'DD635282','2004-08-11',2611.84);
INSERT INTO `payment` VALUES (148,'KM172879','2003-12-26',105743.00);
INSERT INTO `payment` VALUES (148,'ME497970','2005-03-27',3516.04);
INSERT INTO `payment` VALUES (151,'BF686658','2003-12-22',58793.53);
INSERT INTO `payment` VALUES (151,'GB852215','2004-07-26',20314.44);
INSERT INTO `payment` VALUES (151,'IP568906','2003-06-18',58841.35);
INSERT INTO `payment` VALUES (151,'KI884577','2004-12-14',39964.63);
INSERT INTO `payment` VALUES (157,'HI618861','2004-11-19',35152.12);
INSERT INTO `payment` VALUES (157,'NN711988','2004-09-07',63357.13);
INSERT INTO `payment` VALUES (161,'BR352384','2004-11-14',2434.25);
INSERT INTO `payment` VALUES (161,'BR478494','2003-11-18',50743.65);
INSERT INTO `payment` VALUES (161,'KG644125','2005-02-02',12692.19);
INSERT INTO `payment` VALUES (161,'NI908214','2003-08-05',38675.13);
INSERT INTO `payment` VALUES (166,'BQ327613','2004-09-16',38785.48);
INSERT INTO `payment` VALUES (166,'DC979307','2004-07-07',44160.92);
INSERT INTO `payment` VALUES (166,'LA318629','2004-02-28',22474.17);
INSERT INTO `payment` VALUES (167,'ED743615','2004-09-19',12538.01);
INSERT INTO `payment` VALUES (167,'GN228846','2003-12-03',85024.46);
INSERT INTO `payment` VALUES (171,'GB878038','2004-03-15',18997.89);
INSERT INTO `payment` VALUES (171,'IL104425','2003-11-22',42783.81);
INSERT INTO `payment` VALUES (172,'AD832091','2004-09-09',1960.80);
INSERT INTO `payment` VALUES (172,'CE51751','2004-12-04',51209.58);
INSERT INTO `payment` VALUES (172,'EH208589','2003-04-20',33383.14);
INSERT INTO `payment` VALUES (173,'GP545698','2004-05-13',11843.45);
INSERT INTO `payment` VALUES (173,'IG462397','2004-03-29',20355.24);
INSERT INTO `payment` VALUES (175,'CITI3434344','2005-05-19',28500.78);
INSERT INTO `payment` VALUES (175,'IO448913','2003-11-19',24879.08);
INSERT INTO `payment` VALUES (175,'PI15215','2004-07-10',42044.77);
INSERT INTO `payment` VALUES (177,'AU750837','2004-04-17',15183.63);
INSERT INTO `payment` VALUES (177,'CI381435','2004-01-19',47177.59);
INSERT INTO `payment` VALUES (181,'CM564612','2004-04-25',22602.36);
INSERT INTO `payment` VALUES (181,'GQ132144','2003-01-30',5494.78);
INSERT INTO `payment` VALUES (181,'OH367219','2004-11-16',44400.50);
INSERT INTO `payment` VALUES (186,'AE192287','2005-03-10',23602.90);
INSERT INTO `payment` VALUES (186,'AK412714','2003-10-27',37602.48);
INSERT INTO `payment` VALUES (186,'KA602407','2004-10-21',34341.08);
INSERT INTO `payment` VALUES (187,'AM968797','2004-11-03',52825.29);
INSERT INTO `payment` VALUES (187,'BQ39062','2004-12-08',47159.11);
INSERT INTO `payment` VALUES (187,'KL124726','2003-03-27',48425.69);
INSERT INTO `payment` VALUES (189,'BO711618','2004-10-03',17359.53);
INSERT INTO `payment` VALUES (189,'NM916675','2004-03-01',32538.74);
INSERT INTO `payment` VALUES (198,'FI192930','2004-12-06',9658.74);
INSERT INTO `payment` VALUES (198,'HQ920205','2003-07-06',6036.96);
INSERT INTO `payment` VALUES (198,'IS946883','2004-09-21',5858.56);
INSERT INTO `payment` VALUES (201,'DP677013','2003-10-20',23908.24);
INSERT INTO `payment` VALUES (201,'OO846801','2004-06-15',37258.94);
INSERT INTO `payment` VALUES (202,'HI358554','2003-12-18',36527.61);
INSERT INTO `payment` VALUES (202,'IQ627690','2004-11-08',33594.58);
INSERT INTO `payment` VALUES (204,'GC697638','2004-08-13',51152.86);
INSERT INTO `payment` VALUES (204,'IS150005','2004-09-24',4424.40);
INSERT INTO `payment` VALUES (205,'GL756480','2003-12-04',3879.96);
INSERT INTO `payment` VALUES (205,'LL562733','2003-09-05',50342.74);
INSERT INTO `payment` VALUES (205,'NM739638','2005-02-06',39580.60);
INSERT INTO `payment` VALUES (209,'BOAF82044','2005-05-03',35157.75);
INSERT INTO `payment` VALUES (209,'ED520529','2004-06-21',4632.31);
INSERT INTO `payment` VALUES (209,'PH785937','2004-05-04',36069.26);
INSERT INTO `payment` VALUES (211,'BJ535230','2003-12-09',45480.79);
INSERT INTO `payment` VALUES (216,'BG407567','2003-05-09',3101.40);
INSERT INTO `payment` VALUES (216,'ML780814','2004-12-06',24945.21);
INSERT INTO `payment` VALUES (216,'MM342086','2003-12-14',40473.86);
INSERT INTO `payment` VALUES (219,'BN17870','2005-03-02',3452.75);
INSERT INTO `payment` VALUES (219,'BR941480','2003-10-18',4465.85);
INSERT INTO `payment` VALUES (227,'MQ413968','2003-10-31',36164.46);
INSERT INTO `payment` VALUES (227,'NU21326','2004-11-02',53745.34);
INSERT INTO `payment` VALUES (233,'BOFA23232','2005-05-20',29070.38);
INSERT INTO `payment` VALUES (233,'II180006','2004-07-01',22997.45);
INSERT INTO `payment` VALUES (233,'JG981190','2003-11-18',16909.84);
INSERT INTO `payment` VALUES (239,'NQ865547','2004-03-15',80375.24);
INSERT INTO `payment` VALUES (240,'IF245157','2004-11-16',46788.14);
INSERT INTO `payment` VALUES (240,'JO719695','2004-03-28',24995.61);
INSERT INTO `payment` VALUES (242,'AF40894','2003-11-22',33818.34);
INSERT INTO `payment` VALUES (242,'HR224331','2005-06-03',12432.32);
INSERT INTO `payment` VALUES (242,'KI744716','2003-07-21',14232.70);
INSERT INTO `payment` VALUES (249,'IJ399820','2004-09-19',33924.24);
INSERT INTO `payment` VALUES (249,'NE404084','2004-09-04',48298.99);
INSERT INTO `payment` VALUES (250,'EQ12267','2005-05-17',17928.09);
INSERT INTO `payment` VALUES (250,'HD284647','2004-12-30',26311.63);
INSERT INTO `payment` VALUES (250,'HN114306','2003-07-18',23419.47);
INSERT INTO `payment` VALUES (256,'EP227123','2004-02-10',5759.42);
INSERT INTO `payment` VALUES (256,'HE84936','2004-10-22',53116.99);
INSERT INTO `payment` VALUES (259,'EU280955','2004-11-06',61234.67);
INSERT INTO `payment` VALUES (259,'GB361972','2003-12-07',27988.47);
INSERT INTO `payment` VALUES (260,'IO164641','2004-08-30',37527.58);
INSERT INTO `payment` VALUES (260,'NH776924','2004-04-24',29284.42);
INSERT INTO `payment` VALUES (276,'EM979878','2005-02-09',27083.78);
INSERT INTO `payment` VALUES (276,'KM841847','2003-11-13',38547.19);
INSERT INTO `payment` VALUES (276,'LE432182','2003-09-28',41554.73);
INSERT INTO `payment` VALUES (276,'OJ819725','2005-04-30',29848.52);
INSERT INTO `payment` VALUES (278,'BJ483870','2004-12-05',37654.09);
INSERT INTO `payment` VALUES (278,'GP636783','2003-03-02',52151.81);
INSERT INTO `payment` VALUES (278,'NI983021','2003-11-24',37723.79);
INSERT INTO `payment` VALUES (282,'IA793562','2003-08-03',24013.52);
INSERT INTO `payment` VALUES (282,'JT819493','2004-08-02',35806.73);
INSERT INTO `payment` VALUES (282,'OD327378','2005-01-03',31835.36);
INSERT INTO `payment` VALUES (286,'DR578578','2004-10-28',47411.33);
INSERT INTO `payment` VALUES (286,'KH910279','2004-09-05',43134.04);
INSERT INTO `payment` VALUES (298,'AJ574927','2004-03-13',47375.92);
INSERT INTO `payment` VALUES (298,'LF501133','2004-09-18',61402.00);
INSERT INTO `payment` VALUES (299,'AD304085','2003-10-24',36798.88);
INSERT INTO `payment` VALUES (299,'NR157385','2004-09-05',32260.16);
INSERT INTO `payment` VALUES (311,'DG336041','2005-02-15',46770.52);
INSERT INTO `payment` VALUES (311,'FA728475','2003-10-06',32723.04);
INSERT INTO `payment` VALUES (311,'NQ966143','2004-04-25',16212.59);
INSERT INTO `payment` VALUES (314,'LQ244073','2004-08-09',45352.47);
INSERT INTO `payment` VALUES (314,'MD809704','2004-03-03',16901.38);
INSERT INTO `payment` VALUES (319,'HL685576','2004-11-06',42339.76);
INSERT INTO `payment` VALUES (319,'OM548174','2003-12-07',36092.40);
INSERT INTO `payment` VALUES (320,'GJ597719','2005-01-18',8307.28);
INSERT INTO `payment` VALUES (320,'HO576374','2003-08-20',41016.75);
INSERT INTO `payment` VALUES (320,'MU817160','2003-11-24',52548.49);
INSERT INTO `payment` VALUES (321,'DJ15149','2003-11-03',85559.12);
INSERT INTO `payment` VALUES (321,'LA556321','2005-03-15',46781.66);
INSERT INTO `payment` VALUES (323,'AL493079','2005-05-23',75020.13);
INSERT INTO `payment` VALUES (323,'ES347491','2004-06-24',37281.36);
INSERT INTO `payment` VALUES (323,'HG738664','2003-07-05',2880.00);
INSERT INTO `payment` VALUES (323,'PQ803830','2004-12-24',39440.59);
INSERT INTO `payment` VALUES (324,'DQ409197','2004-12-13',13671.82);
INSERT INTO `payment` VALUES (324,'FP443161','2003-07-07',29429.14);
INSERT INTO `payment` VALUES (324,'HB150714','2003-11-23',37455.77);
INSERT INTO `payment` VALUES (328,'EN930356','2004-04-16',7178.66);
INSERT INTO `payment` VALUES (328,'NR631421','2004-05-30',31102.85);
INSERT INTO `payment` VALUES (333,'HL209210','2003-11-15',23936.53);
INSERT INTO `payment` VALUES (333,'JK479662','2003-10-17',9821.32);
INSERT INTO `payment` VALUES (333,'NF959653','2005-03-01',21432.31);
INSERT INTO `payment` VALUES (334,'CS435306','2005-01-27',45785.34);
INSERT INTO `payment` VALUES (334,'HH517378','2003-08-16',29716.86);
INSERT INTO `payment` VALUES (334,'LF737277','2004-05-22',28394.54);
INSERT INTO `payment` VALUES (339,'AP286625','2004-10-24',23333.06);
INSERT INTO `payment` VALUES (339,'DA98827','2003-11-28',34606.28);
INSERT INTO `payment` VALUES (344,'AF246722','2003-11-24',31428.21);
INSERT INTO `payment` VALUES (344,'NJ906924','2004-04-02',15322.93);
INSERT INTO `payment` VALUES (347,'DG700707','2004-01-18',21053.69);
INSERT INTO `payment` VALUES (347,'LG808674','2003-10-24',20452.50);
INSERT INTO `payment` VALUES (350,'BQ602907','2004-12-11',18888.31);
INSERT INTO `payment` VALUES (350,'CI471510','2003-05-25',50824.66);
INSERT INTO `payment` VALUES (350,'OB648482','2005-01-29',1834.56);
INSERT INTO `payment` VALUES (353,'CO351193','2005-01-10',49705.52);
INSERT INTO `payment` VALUES (353,'ED878227','2003-07-21',13920.26);
INSERT INTO `payment` VALUES (353,'GT878649','2003-05-21',16700.47);
INSERT INTO `payment` VALUES (353,'HJ618252','2005-06-09',46656.94);
INSERT INTO `payment` VALUES (357,'AG240323','2003-12-16',20220.04);
INSERT INTO `payment` VALUES (357,'NB291497','2004-05-15',36442.34);
INSERT INTO `payment` VALUES (362,'FP170292','2004-07-11',18473.71);
INSERT INTO `payment` VALUES (362,'OG208861','2004-09-21',15059.76);
INSERT INTO `payment` VALUES (363,'HL575273','2004-11-17',50799.69);
INSERT INTO `payment` VALUES (363,'IS232033','2003-01-16',10223.83);
INSERT INTO `payment` VALUES (363,'PN238558','2003-12-05',55425.77);
INSERT INTO `payment` VALUES (379,'CA762595','2005-02-12',28322.83);
INSERT INTO `payment` VALUES (379,'FR499138','2003-09-16',32680.31);
INSERT INTO `payment` VALUES (379,'GB890854','2004-08-02',12530.51);
INSERT INTO `payment` VALUES (381,'BC726082','2004-12-03',12081.52);
INSERT INTO `payment` VALUES (381,'CC475233','2003-04-19',1627.56);
INSERT INTO `payment` VALUES (381,'GB117430','2005-02-03',14379.90);
INSERT INTO `payment` VALUES (381,'MS154481','2003-08-22',1128.20);
INSERT INTO `payment` VALUES (382,'CC871084','2003-05-12',35826.33);
INSERT INTO `payment` VALUES (382,'CT821147','2004-08-01',6419.84);
INSERT INTO `payment` VALUES (382,'PH29054','2004-11-27',42813.83);
INSERT INTO `payment` VALUES (385,'BN347084','2003-12-02',20644.24);
INSERT INTO `payment` VALUES (385,'CP804873','2004-11-19',15822.84);
INSERT INTO `payment` VALUES (385,'EK785462','2003-03-09',51001.22);
INSERT INTO `payment` VALUES (386,'DO106109','2003-11-18',38524.29);
INSERT INTO `payment` VALUES (386,'HG438769','2004-07-18',51619.02);
INSERT INTO `payment` VALUES (398,'AJ478695','2005-02-14',33967.73);
INSERT INTO `payment` VALUES (398,'DO787644','2004-06-21',22037.91);
INSERT INTO `payment` VALUES (398,'JPMR4544','2005-05-18',615.45);
INSERT INTO `payment` VALUES (398,'KB54275','2004-11-29',48927.64);
INSERT INTO `payment` VALUES (406,'BJMPR4545','2005-04-23',12190.85);
INSERT INTO `payment` VALUES (406,'HJ217687','2004-01-28',49165.16);
INSERT INTO `payment` VALUES (406,'NA197101','2004-06-17',25080.96);
INSERT INTO `payment` VALUES (412,'GH197075','2004-07-25',35034.57);
INSERT INTO `payment` VALUES (412,'PJ434867','2004-04-14',31670.37);
INSERT INTO `payment` VALUES (415,'ER54537','2004-09-28',31310.09);
INSERT INTO `payment` VALUES (424,'KF480160','2004-12-07',25505.98);
INSERT INTO `payment` VALUES (424,'LM271923','2003-04-16',21665.98);
INSERT INTO `payment` VALUES (424,'OA595449','2003-10-31',22042.37);
INSERT INTO `payment` VALUES (447,'AO757239','2003-09-15',6631.36);
INSERT INTO `payment` VALUES (447,'ER615123','2003-06-25',17032.29);
INSERT INTO `payment` VALUES (447,'OU516561','2004-12-17',26304.13);
INSERT INTO `payment` VALUES (448,'FS299615','2005-04-18',27966.54);
INSERT INTO `payment` VALUES (448,'KR822727','2004-09-30',48809.90);
INSERT INTO `payment` VALUES (450,'EF485824','2004-06-21',59551.38);
INSERT INTO `payment` VALUES (452,'ED473873','2003-11-15',27121.90);
INSERT INTO `payment` VALUES (452,'FN640986','2003-11-20',15130.97);
INSERT INTO `payment` VALUES (452,'HG635467','2005-05-03',8807.12);
INSERT INTO `payment` VALUES (455,'HA777606','2003-12-05',38139.18);
INSERT INTO `payment` VALUES (455,'IR662429','2004-05-12',32239.47);
INSERT INTO `payment` VALUES (456,'GJ715659','2004-11-13',27550.51);
INSERT INTO `payment` VALUES (456,'MO743231','2004-04-30',1679.92);
INSERT INTO `payment` VALUES (458,'DD995006','2004-11-15',33145.56);
INSERT INTO `payment` VALUES (458,'NA377824','2004-02-06',22162.61);
INSERT INTO `payment` VALUES (458,'OO606861','2003-06-13',57131.92);
INSERT INTO `payment` VALUES (462,'ED203908','2005-04-15',30293.77);
INSERT INTO `payment` VALUES (462,'GC60330','2003-11-08',9977.85);
INSERT INTO `payment` VALUES (462,'PE176846','2004-11-27',48355.87);
INSERT INTO `payment` VALUES (471,'AB661578','2004-07-28',9415.13);
INSERT INTO `payment` VALUES (471,'CO645196','2003-12-10',35505.63);
INSERT INTO `payment` VALUES (473,'LL427009','2004-02-17',7612.06);
INSERT INTO `payment` VALUES (473,'PC688499','2003-10-27',17746.26);
INSERT INTO `payment` VALUES (475,'JP113227','2003-12-09',7678.25);
INSERT INTO `payment` VALUES (475,'PB951268','2004-02-13',36070.47);
INSERT INTO `payment` VALUES (484,'GK294076','2004-10-26',3474.66);
INSERT INTO `payment` VALUES (484,'JH546765','2003-11-29',47513.19);
INSERT INTO `payment` VALUES (486,'BL66528','2004-04-14',5899.38);
INSERT INTO `payment` VALUES (486,'HS86661','2004-11-23',45994.07);
INSERT INTO `payment` VALUES (486,'JB117768','2003-03-20',25833.14);
INSERT INTO `payment` VALUES (487,'AH612904','2003-09-28',29997.09);
INSERT INTO `payment` VALUES (487,'PT550181','2004-02-29',12573.28);
INSERT INTO `payment` VALUES (489,'OC773849','2003-12-04',22275.73);
INSERT INTO `payment` VALUES (489,'PO860906','2004-01-31',7310.42);
INSERT INTO `payment` VALUES (495,'BH167026','2003-12-26',59265.14);
INSERT INTO `payment` VALUES (495,'FN155234','2004-05-14',6276.60);
INSERT INTO `payment` VALUES (496,'EU531600','2005-05-25',30253.75);
INSERT INTO `payment` VALUES (496,'MB342426','2003-07-16',32077.44);
INSERT INTO `payment` VALUES (496,'MN89921','2004-12-31',52166.00);
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `sku` varchar(15) NOT NULL,
  `name` varchar(70) NOT NULL,
  `product_line` varchar(50) NOT NULL,
  `scale` varchar(10) NOT NULL,
  `description` text NOT NULL,
  `quantity_in_stock` smallint(6) NOT NULL,
  `buy_price` decimal(10,2) NOT NULL,
  `msrp` decimal(10,2) NOT NULL,
  PRIMARY KEY (`sku`),
  KEY `product_product_line_index` (`product_line`),
  FULLTEXT KEY `product_description_ft` (`sku`,`name`,`product_line`,`description`),
  CONSTRAINT `product_product_line_product_line_fk` FOREIGN KEY (`product_line`) REFERENCES `product_line` (`product_line`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('S10_1678','1969 Harley Davidson Ultimate Chopper','Motorcycles','1:10','This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.',7933,48.81,95.70);
INSERT INTO `product` VALUES ('S10_1949','1952 Alpine Renault 1300','Classic Cars','1:10','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',7305,98.58,214.30);
INSERT INTO `product` VALUES ('S10_2016','1996 Moto Guzzi 1100i','Motorcycles','1:10','Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',6625,68.99,118.94);
INSERT INTO `product` VALUES ('S10_4698','2003 Harley-Davidson Eagle Drag Bike','Motorcycles','1:10','Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine',5582,91.02,193.66);
INSERT INTO `product` VALUES ('S10_4757','1972 Alfa Romeo GTA','Classic Cars','1:10','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',3252,85.68,136.00);
INSERT INTO `product` VALUES ('S10_4962','1962 LanciaA Delta 16V','Classic Cars','1:10','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',6791,103.42,147.74);
INSERT INTO `product` VALUES ('S12_1099','1968 Ford Mustang','Classic Cars','1:12','Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.',68,95.34,194.57);
INSERT INTO `product` VALUES ('S12_1108','2001 Ferrari Enzo','Classic Cars','1:12','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',3619,95.59,207.80);
INSERT INTO `product` VALUES ('S12_1666','1958 Setra Bus','Trucks and Buses','1:12','Model features 30 windows, skylights & glare resistant glass, working steering system, original logos',1579,77.90,136.67);
INSERT INTO `product` VALUES ('S12_2823','2002 Suzuki XREO','Motorcycles','1:12','Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',9997,66.27,150.62);
INSERT INTO `product` VALUES ('S12_3148','1969 Corvair Monza','Classic Cars','1:18','1:18 scale die-cast about 10\" long doors open, hood opens, trunk opens and wheels roll',6906,89.14,151.08);
INSERT INTO `product` VALUES ('S12_3380','1968 Dodge Charger','Classic Cars','1:12','1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black',9123,75.16,117.44);
INSERT INTO `product` VALUES ('S12_3891','1969 Ford Falcon','Classic Cars','1:12','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',1049,83.05,173.02);
INSERT INTO `product` VALUES ('S12_3990','1970 Plymouth Hemi Cuda','Classic Cars','1:12','Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.',5663,31.92,79.80);
INSERT INTO `product` VALUES ('S12_4473','1957 Chevy Pickup','Trucks and Buses','1:12','1:12 scale die-cast about 20\" long Hood opens, Rubber wheels',6125,55.70,118.50);
INSERT INTO `product` VALUES ('S12_4675','1969 Dodge Charger','Classic Cars','1:12','Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.',7323,58.73,115.16);
INSERT INTO `product` VALUES ('S18_1097','1940 Ford Pickup Truck','Trucks and Buses','1:18','This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood,  removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box',2613,58.33,116.67);
INSERT INTO `product` VALUES ('S18_1129','1993 Mazda RX-7','Classic Cars','1:18','This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color red.',3975,83.51,141.54);
INSERT INTO `product` VALUES ('S18_1342','1937 Lincoln Berline','Vintage Cars','1:18','Features opening engine cover, doors, trunk, and fuel filler cap. Color black',8693,60.62,102.74);
INSERT INTO `product` VALUES ('S18_1367','1936 Mercedes-Benz 500K Special Roadster','Vintage Cars','1:18','This 1:18 scale replica is constructed of heavy die-cast metal and has all the features of the original: working doors and rumble seat, independent spring suspension, detailed interior, working steering system, and a bifold hood that reveals an engine so accurate that it even includes the wiring. All this is topped off with a baked enamel finish. Color white.',8635,24.26,53.91);
INSERT INTO `product` VALUES ('S18_1589','1965 Aston Martin DB5','Classic Cars','1:18','Die-cast model of the silver 1965 Aston Martin DB5 in silver. This model includes full wire wheels and doors that open with fully detailed passenger compartment. In 1:18 scale, this model measures approximately 10 inches/20 cm long.',9042,65.96,124.44);
INSERT INTO `product` VALUES ('S18_1662','1980s Black Hawk Helicopter','Planes','1:18','1:18 scale replica of actual Army\'s UH-60L BLACK HAWK Helicopter. 100% hand-assembled. Features rotating rotor blades, propeller blades and rubber wheels.',5330,77.27,157.69);
INSERT INTO `product` VALUES ('S18_1749','1917 Grand Touring Sedan','Vintage Cars','1:18','This 1:18 scale replica of the 1917 Grand Touring car has all the features you would expect from museum quality reproductions: all four doors and bi-fold hood opening, detailed engine and instrument panel, chrome-look trim, and tufted upholstery, all topped off with a factory baked-enamel finish.',2724,86.70,170.00);
INSERT INTO `product` VALUES ('S18_1889','1948 Porsche 356-A Roadster','Classic Cars','1:18','This precision die-cast replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',8826,53.90,77.00);
INSERT INTO `product` VALUES ('S18_1984','1995 Honda Civic','Classic Cars','1:18','This model features, opening hood, opening doors, detailed engine, rear spoiler, opening trunk, working steering, tinted windows, baked enamel finish. Color yellow.',9772,93.89,142.25);
INSERT INTO `product` VALUES ('S18_2238','1998 Chrysler Plymouth Prowler','Classic Cars','1:18','Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',4724,101.51,163.73);
INSERT INTO `product` VALUES ('S18_2248','1911 Ford Town Car','Vintage Cars','1:18','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system.',540,33.30,60.54);
INSERT INTO `product` VALUES ('S18_2319','1964 Mercedes Tour Bus','Trucks and Buses','1:18','Exact replica. 100+ parts. working steering system, original logos',8258,74.86,122.73);
INSERT INTO `product` VALUES ('S18_2325','1932 Model A Ford J-Coupe','Vintage Cars','1:18','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine',9354,58.48,127.13);
INSERT INTO `product` VALUES ('S18_2432','1926 Ford Fire Engine','Trucks and Buses','1:18','Gleaming red handsome appearance. Everything is here the fire hoses, ladder, axes, bells, lanterns, ready to fight any inferno.',2018,24.92,60.77);
INSERT INTO `product` VALUES ('S18_2581','P-51-D Mustang','Planes','1:72','Has retractable wheels and comes with a stand',992,49.00,84.48);
INSERT INTO `product` VALUES ('S18_2625','1936 Harley Davidson El Knucklehead','Motorcycles','1:18','Intricately detailed with chrome accents and trim, official die-struck logos and baked enamel finish.',4357,24.23,60.57);
INSERT INTO `product` VALUES ('S18_2795','1928 Mercedes-Benz SSK','Vintage Cars','1:18','This 1:18 replica features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system, chrome-covered spare, opening doors, detailed and wired engine. Color black.',548,72.56,168.75);
INSERT INTO `product` VALUES ('S18_2870','1999 Indy 500 Monte Carlo SS','Classic Cars','1:18','Features include opening and closing doors. Color: Red',8164,56.76,132.00);
INSERT INTO `product` VALUES ('S18_2949','1913 Ford Model T Speedster','Vintage Cars','1:18','This 250 part reproduction includes moving handbrakes, clutch, throttle and foot pedals, squeezable horn, detailed wired engine, removable water, gas, and oil cans, pivoting monocle windshield, all topped with a baked enamel red finish. Each replica comes with an Owners Title and Certificate of Authenticity. Color red.',4189,60.78,101.31);
INSERT INTO `product` VALUES ('S18_2957','1934 Ford V8 Coupe','Vintage Cars','1:18','Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System',5649,34.35,62.46);
INSERT INTO `product` VALUES ('S18_3029','1999 Yamaha Speed Boat','Ships','1:18','Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.',4259,51.61,86.02);
INSERT INTO `product` VALUES ('S18_3136','18th Century Vintage Horse Carriage','Vintage Cars','1:18','Hand crafted diecast-like metal horse carriage is re-created in about 1:18 scale of antique horse carriage. This antique style metal Stagecoach is all hand-assembled with many different parts.\r\n\r\nThis collectible metal horse carriage is painted in classic Red, and features turning steering wheel and is entirely hand-finished.',5992,60.74,104.72);
INSERT INTO `product` VALUES ('S18_3140','1903 Ford Model A','Vintage Cars','1:18','Features opening trunk,  working steering system',3913,68.30,136.59);
INSERT INTO `product` VALUES ('S18_3232','1992 Ferrari 360 Spider red','Classic Cars','1:18','his replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',8347,77.90,169.34);
INSERT INTO `product` VALUES ('S18_3233','1985 Toyota Supra','Classic Cars','1:18','This model features soft rubber tires, working steering, rubber mud guards, authentic Ford logos, detailed undercarriage, opening doors and hood, removable split rear gate, full size spare mounted in bed, detailed interior with opening glove box',7733,57.01,107.57);
INSERT INTO `product` VALUES ('S18_3259','Collectable Wooden Train','Trains','1:18','Hand crafted wooden toy train set is in about 1:18 scale, 25 inches in total length including 2 additional carts, of actual vintage train. This antique style wooden toy train model set is all hand-assembled with 100% wood.',6450,67.56,100.84);
INSERT INTO `product` VALUES ('S18_3278','1969 Dodge Super Bee','Classic Cars','1:18','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',1917,49.05,80.41);
INSERT INTO `product` VALUES ('S18_3320','1917 Maxwell Touring Car','Vintage Cars','1:18','Features Gold Trim, Full Size Spare Tire, Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System',7913,57.54,99.21);
INSERT INTO `product` VALUES ('S18_3482','1976 Ford Gran Torino','Classic Cars','1:18','Highly detailed 1976 Ford Gran Torino \"Starsky and Hutch\" diecast model. Very well constructed and painted in red and white patterns.',9127,73.49,146.99);
INSERT INTO `product` VALUES ('S18_3685','1948 Porsche Type 356 Roadster','Classic Cars','1:18','This model features working front and rear suspension on accurately replicated and actuating shock absorbers as well as opening engine cover, rear stabilizer flap,  and 4 opening doors.',8990,62.16,141.28);
INSERT INTO `product` VALUES ('S18_3782','1957 Vespa GS150','Motorcycles','1:18','Features rotating wheels , working kick stand. Comes with stand.',7689,32.95,62.17);
INSERT INTO `product` VALUES ('S18_3856','1941 Chevrolet Special Deluxe Cabriolet','Vintage Cars','1:18','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system, leather upholstery. Color black.',2378,64.58,105.87);
INSERT INTO `product` VALUES ('S18_4027','1970 Triumph Spitfire','Classic Cars','1:18','Features include opening and closing doors. Color: White.',5545,91.92,143.62);
INSERT INTO `product` VALUES ('S18_4409','1932 Alfa Romeo 8C2300 Spider Sport','Vintage Cars','1:18','This 1:18 scale precision die cast replica features the 6 front headlights of the original, plus a detailed version of the 142 horsepower straight 8 engine, dual spares and their famous comprehensive dashboard. Color black.',6553,43.26,92.03);
INSERT INTO `product` VALUES ('S18_4522','1904 Buick Runabout','Vintage Cars','1:18','Features opening trunk,  working steering system',8290,52.66,87.77);
INSERT INTO `product` VALUES ('S18_4600','1940s Ford truck','Trucks and Buses','1:18','This 1940s Ford Pick-Up truck is re-created in 1:18 scale of original 1940s Ford truck. This antique style metal 1940s Ford Flatbed truck is all hand-assembled. This collectible 1940\'s Pick-Up truck is painted in classic dark green color, and features rotating wheels.',3128,84.76,121.08);
INSERT INTO `product` VALUES ('S18_4668','1939 Cadillac Limousine','Vintage Cars','1:18','Features completely detailed interior including Velvet flocked drapes,deluxe wood grain floor, and a wood grain casket with seperate chrome handles',6645,23.14,50.31);
INSERT INTO `product` VALUES ('S18_4721','1957 Corvette Convertible','Classic Cars','1:18','1957 die cast Corvette Convertible in Roman Red with white sides and whitewall tires. 1:18 scale quality die-cast with detailed engine and underbvody. Now you can own The Classic Corvette.',1249,69.93,148.80);
INSERT INTO `product` VALUES ('S18_4933','1957 Ford Thunderbird','Classic Cars','1:18','This 1:18 scale precision die-cast replica, with its optional porthole hardtop and factory baked-enamel Thunderbird Bronze finish, is a 100% accurate rendition of this American classic.',3209,34.21,71.27);
INSERT INTO `product` VALUES ('S24_1046','1970 Chevy Chevelle SS 454','Classic Cars','1:24','This model features rotating wheels, working streering system and opening doors. All parts are particularly delicate due to their precise scale and require special care and attention. It should not be picked up by the doors, roof, hood or trunk.',1005,49.24,73.49);
INSERT INTO `product` VALUES ('S24_1444','1970 Dodge Coronet','Classic Cars','1:24','1:24 scale die-cast about 18\" long doors open, hood opens and rubber wheels',4074,32.37,57.80);
INSERT INTO `product` VALUES ('S24_1578','1997 BMW R 1100 S','Motorcycles','1:24','Detailed scale replica with working suspension and constructed from over 70 parts',7003,60.86,112.70);
INSERT INTO `product` VALUES ('S24_1628','1966 Shelby Cobra 427 S/C','Classic Cars','1:24','This diecast model of the 1966 Shelby Cobra 427 S/C includes many authentic details and operating parts. The 1:24 scale model of this iconic lighweight sports car from the 1960s comes in silver and it\'s own display case.',8197,29.18,50.31);
INSERT INTO `product` VALUES ('S24_1785','1928 British Royal Navy Airplane','Planes','1:24','Official logos and insignias',3627,66.74,109.42);
INSERT INTO `product` VALUES ('S24_1937','1939 Chevrolet Deluxe Coupe','Vintage Cars','1:24','This 1:24 scale die-cast replica of the 1939 Chevrolet Deluxe Coupe has the same classy look as the original. Features opening trunk, hood and doors and a showroom quality baked enamel finish.',7332,22.57,33.19);
INSERT INTO `product` VALUES ('S24_2000','1960 BSA Gold Star DBD34','Motorcycles','1:24','Detailed scale replica with working suspension and constructed from over 70 parts',15,37.32,76.17);
INSERT INTO `product` VALUES ('S24_2011','18th century schooner','Ships','1:24','All wood with canvas sails. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with 4 masts, all square-rigged.',1898,82.34,122.89);
INSERT INTO `product` VALUES ('S24_2022','1938 Cadillac V-16 Presidential Limousine','Vintage Cars','1:24','This 1:24 scale precision die cast replica of the 1938 Cadillac V-16 Presidential Limousine has all the details of the original, from the flags on the front to an opening back seat compartment complete with telephone and rifle. Features factory baked-enamel black finish, hood goddess ornament, working jump seats.',2847,20.61,44.80);
INSERT INTO `product` VALUES ('S24_2300','1962 Volkswagen Microbus','Trucks and Buses','1:24','This 1:18 scale die cast replica of the 1962 Microbus is loaded with features: A working steering system, opening front doors and tailgate, and famous two-tone factory baked enamel finish, are all topped of by the sliding, real fabric, sunroof.',2327,61.34,127.79);
INSERT INTO `product` VALUES ('S24_2360','1982 Ducati 900 Monster','Motorcycles','1:24','Features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand',6840,47.10,69.26);
INSERT INTO `product` VALUES ('S24_2766','1949 Jaguar XK 120','Classic Cars','1:24','Precision-engineered from original Jaguar specification in perfect scale ratio. Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',2350,47.25,90.87);
INSERT INTO `product` VALUES ('S24_2840','1958 Chevy Corvette Limited Edition','Classic Cars','1:24','The operating parts of this 1958 Chevy Corvette Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, working streering, opening doors and trunk. Color dark green.',2542,15.91,35.36);
INSERT INTO `product` VALUES ('S24_2841','1900s Vintage Bi-Plane','Planes','1:24','Hand crafted diecast-like metal bi-plane is re-created in about 1:24 scale of antique pioneer airplane. All hand-assembled with many different parts. Hand-painted in classic yellow and features correct markings of original airplane.',5942,34.25,68.51);
INSERT INTO `product` VALUES ('S24_2887','1952 Citroen-15CV','Classic Cars','1:24','Precision crafted hand-assembled 1:18 scale reproduction of the 1952 15CV, with its independent spring suspension, working steering system, opening doors and hood, detailed engine and instrument panel, all topped of with a factory fresh baked enamel finish.',1452,72.82,117.44);
INSERT INTO `product` VALUES ('S24_2972','1982 Lamborghini Diablo','Classic Cars','1:24','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',7723,16.24,37.76);
INSERT INTO `product` VALUES ('S24_3151','1912 Ford Model T Delivery Wagon','Vintage Cars','1:24','This model features chrome trim and grille, opening hood, opening doors, opening trunk, detailed engine, working steering system. Color white.',9173,46.91,88.51);
INSERT INTO `product` VALUES ('S24_3191','1969 Chevrolet Camaro Z28','Classic Cars','1:24','1969 Z/28 Chevy Camaro 1:24 scale replica. The operating parts of this limited edition 1:24 scale diecast model car 1969 Chevy Camaro Z28- hood, trunk, wheels, streering, suspension and doors- are particularly delicate due to their precise scale and require special care and attention.',4695,50.51,85.61);
INSERT INTO `product` VALUES ('S24_3371','1971 Alpine Renault 1600s','Classic Cars','1:24','This 1971 Alpine Renault 1600s replica Features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',7995,38.58,61.23);
INSERT INTO `product` VALUES ('S24_3420','1937 Horch 930V Limousine','Vintage Cars','1:24','Features opening hood, opening doors, opening trunk, wide white wall tires, front door arm rests, working steering system',2902,26.30,65.75);
INSERT INTO `product` VALUES ('S24_3432','2002 Chevy Corvette','Classic Cars','1:24','The operating parts of this limited edition Diecast 2002 Chevy Corvette 50th Anniversary Pace car Limited Edition are particularly delicate due to their precise scale and require special care and attention. Features rotating wheels, poseable streering, opening doors and trunk.',9446,62.11,107.08);
INSERT INTO `product` VALUES ('S24_3816','1940 Ford Delivery Sedan','Vintage Cars','1:24','Chrome Trim, Chrome Grille, Opening Hood, Opening Doors, Opening Trunk, Detailed Engine, Working Steering System. Color black.',6621,48.64,83.86);
INSERT INTO `product` VALUES ('S24_3856','1956 Porsche 356A Coupe','Classic Cars','1:18','Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',6600,98.30,140.43);
INSERT INTO `product` VALUES ('S24_3949','Corsair F4U ( Bird Cage)','Planes','1:24','Has retractable wheels and comes with a stand. Official logos and insignias.',6812,29.34,68.24);
INSERT INTO `product` VALUES ('S24_3969','1936 Mercedes Benz 500k Roadster','Vintage Cars','1:24','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system and rubber wheels. Color black.',2081,21.75,41.03);
INSERT INTO `product` VALUES ('S24_4048','1992 Porsche Cayenne Turbo Silver','Classic Cars','1:24','This replica features opening doors, superb detail and craftsmanship, working steering system, opening forward compartment, opening rear trunk with removable spare, 4 wheel independent spring suspension as well as factory baked enamel finish.',6582,69.78,118.28);
INSERT INTO `product` VALUES ('S24_4258','1936 Chrysler Airflow','Vintage Cars','1:24','Features opening trunk,  working steering system. Color dark green.',4710,57.46,97.39);
INSERT INTO `product` VALUES ('S24_4278','1900s Vintage Tri-Plane','Planes','1:24','Hand crafted diecast-like metal Triplane is Re-created in about 1:24 scale of antique pioneer airplane. This antique style metal triplane is all hand-assembled with many different parts.',2756,36.23,72.45);
INSERT INTO `product` VALUES ('S24_4620','1961 Chevrolet Impala','Classic Cars','1:18','This 1:18 scale precision die-cast reproduction of the 1961 Chevrolet Impala has all the features-doors, hood and trunk that open; detailed 409 cubic-inch engine; chrome dashboard and stick shift, two-tone interior; working steering system; all topped of with a factory baked-enamel finish.',7869,32.33,80.84);
INSERT INTO `product` VALUES ('S32_1268','1980’s GM Manhattan Express','Trucks and Buses','1:32','This 1980’s era new look Manhattan express is still active, running from the Bronx to mid-town Manhattan. Has 35 opeining windows and working lights. Needs a battery.',5099,53.93,96.31);
INSERT INTO `product` VALUES ('S32_1374','1997 BMW F650 ST','Motorcycles','1:32','Features official die-struck logos and baked enamel finish. Comes with stand.',178,66.92,99.89);
INSERT INTO `product` VALUES ('S32_2206','1982 Ducati 996 R','Motorcycles','1:32','Features rotating wheels , working kick stand. Comes with stand.',9241,24.14,40.23);
INSERT INTO `product` VALUES ('S32_2509','1954 Greyhound Scenicruiser','Trucks and Buses','1:32','Model features bi-level seating, 50 windows, skylights & glare resistant glass, working steering system, original logos',2874,25.98,54.11);
INSERT INTO `product` VALUES ('S32_3207','1950\'s Chicago Surface Lines Streetcar','Trains','1:32','This streetcar is a joy to see. It has 80 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).',8601,26.72,62.14);
INSERT INTO `product` VALUES ('S32_3522','1996 Peterbilt 379 Stake Bed with Outrigger','Trucks and Buses','1:32','This model features, opening doors, detailed engine, working steering, tinted windows, detailed interior, die-struck logos, removable stakes operating outriggers, detachable second trailer, functioning 360-degree self loader, precision molded resin trailer and trim, baked enamel finish on cab',814,33.61,64.64);
INSERT INTO `product` VALUES ('S32_4289','1928 Ford Phaeton Deluxe','Vintage Cars','1:32','This model features grille-mounted chrome horn, lift-up louvered hood, fold-down rumble seat, working steering system',136,33.02,68.79);
INSERT INTO `product` VALUES ('S32_4485','1974 Ducati 350 Mk3 Desmo','Motorcycles','1:32','This model features two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand',3341,56.13,102.05);
INSERT INTO `product` VALUES ('S50_1341','1930 Buick Marquette Phaeton','Vintage Cars','1:50','Features opening trunk,  working steering system',7062,27.06,43.64);
INSERT INTO `product` VALUES ('S50_1392','Diamond T620 Semi-Skirted Tanker','Trucks and Buses','1:50','This limited edition model is licensed and perfectly scaled for Lionel Trains. The Diamond T620 has been produced in solid precision diecast and painted with a fire baked enamel finish. It comes with a removable tanker and is a perfect model to add authenticity to your static train or car layout or to just have on display.',1016,68.29,115.75);
INSERT INTO `product` VALUES ('S50_1514','1962 City of Detroit Streetcar','Trains','1:50','This streetcar is a joy to see. It has 99 separate windows, electric wire guides, detailed interiors with seats, poles and drivers controls, rolling and turning wheel assemblies, plus authentic factory baked-enamel finishes (Green Hornet for Chicago and Cream and Crimson for Boston).',1645,37.49,58.58);
INSERT INTO `product` VALUES ('S50_4713','2002 Yamaha YZR M1','Motorcycles','1:50','Features rotating wheels , working kick stand. Comes with stand.',600,34.17,81.36);
INSERT INTO `product` VALUES ('S700_1138','The Schooner Bluenose','Ships','1:700','All wood with canvas sails. Measures 31 1/2 inches in Length, 22 inches High and 4 3/4 inches Wide. Many extras.\r\nThe schooner Bluenose was built in Nova Scotia in 1921 to fish the rough waters off the coast of Newfoundland. Because of the Bluenose racing prowess she became the pride of all Canadians. Still featured on stamps and the Canadian dime, the Bluenose was lost off Haiti in 1946.',1897,34.00,66.67);
INSERT INTO `product` VALUES ('S700_1691','American Airlines: B767-300','Planes','1:700','Exact replia with official logos and insignias and retractable wheels',5841,51.15,91.34);
INSERT INTO `product` VALUES ('S700_1938','The Mayflower','Ships','1:700','Measures 31 1/2 inches Long x 25 1/2 inches High x 10 5/8 inches Wide\r\nAll wood with canvas sail. Extras include long boats, rigging, ladders, railing, anchors, side cannons, hand painted, etc.',737,43.30,86.61);
INSERT INTO `product` VALUES ('S700_2047','HMS Bounty','Ships','1:700','Measures 30 inches Long x 27 1/2 inches High x 4 3/4 inches Wide. \r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.',3501,39.83,90.52);
INSERT INTO `product` VALUES ('S700_2466','America West Airlines B757-200','Planes','1:700','Official logos and insignias. Working steering system. Rotating jet engines',9653,68.80,99.72);
INSERT INTO `product` VALUES ('S700_2610','The USS Constitution Ship','Ships','1:700','All wood with canvas sails. Measures 31 1/2\" Length x 22 3/8\" High x 8 1/4\" Width. Extras include 4 boats on deck, sea sprite on bow, anchors, copper railing, pilot houses, etc.',7083,33.97,72.28);
INSERT INTO `product` VALUES ('S700_2824','1982 Camaro Z28','Classic Cars','1:18','Features include opening and closing doors. Color: White. \r\nMeasures approximately 9 1/2\" Long.',6934,46.53,101.15);
INSERT INTO `product` VALUES ('S700_2834','ATA: B757-300','Planes','1:700','Exact replia with official logos and insignias and retractable wheels',7106,59.33,118.65);
INSERT INTO `product` VALUES ('S700_3167','F/A 18 Hornet 1/72','Planes','1:72','10\" Wingspan with retractable landing gears.Comes with pilot',551,54.40,80.00);
INSERT INTO `product` VALUES ('S700_3505','The Titanic','Ships','1:700','Completed model measures 19 1/2 inches long, 9 inches high, 3inches wide and is in barn red/black. All wood and metal.',1956,51.09,100.17);
INSERT INTO `product` VALUES ('S700_3962','The Queen Mary','Ships','1:700','Exact replica. Wood and Metal. Many extras including rigging, long boats, pilot house, anchors, etc. Comes with three masts, all square-rigged.',5088,53.63,99.31);
INSERT INTO `product` VALUES ('S700_4002','American Airlines: MD-11S','Planes','1:700','Polished finish. Exact replia with official logos and insignias and retractable wheels',8820,36.27,74.03);
INSERT INTO `product` VALUES ('S72_1253','Boeing X-32A JSF','Planes','1:72','10\" Wingspan with retractable landing gears.Comes with pilot',4857,32.77,49.66);
INSERT INTO `product` VALUES ('S72_3212','Pont Yacht','Ships','1:72','Measures 38 inches Long x 33 3/4 inches High. Includes a stand.\r\nMany extras including rigging, long boats, pilot house, anchors, etc. Comes with 2 masts, all square-rigged',414,33.30,54.60);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;

--
-- Table structure for table `product_line`
--

DROP TABLE IF EXISTS `product_line`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_line` (
  `product_line` varchar(50) NOT NULL,
  `text_description` varchar(4000) NOT NULL DEFAULT '',
  `html_description` mediumtext NOT NULL,
  `image` mediumblob NOT NULL,
  PRIMARY KEY (`product_line`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_line`
--

/*!40000 ALTER TABLE `product_line` DISABLE KEYS */;
INSERT INTO `product_line` VALUES ('Classic Cars','Attention car enthusiasts: Make your wildest car ownership dreams come true. Whether you are looking for classic muscle cars, dream sports cars or movie-inspired miniatures, you will find great choices in this category. These replicas feature superb attention to detail and craftsmanship and offer features such as working steering system, opening forward compartment, opening rear trunk with removable spare wheel, 4-wheel independent spring suspension, and so on. The models range in size from 1:10 to 1:24 scale and include numerous limited edition and several out-of-production vehicles. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.','',_binary '0');
INSERT INTO `product_line` VALUES ('Motorcycles','Our motorcycles are state of the art replicas of classic as well as contemporary motorcycle legends such as Harley Davidson, Ducati and Vespa. Models contain stunning details such as official logos, rotating wheels, working kickstand, front suspension, gear-shift lever, footbrake lever, and drive chain. Materials used include diecast and plastic. The models range in size from 1:10 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. All models come fully assembled and ready for display in the home or office. Most include a certificate of authenticity.','',_binary '0');
INSERT INTO `product_line` VALUES ('Planes','Unique, diecast airplane and helicopter replicas suitable for collections, as well as home, office or classroom decorations. Models contain stunning details such as official logos and insignias, rotating jet engines and propellers, retractable wheels, and so on. Most come fully assembled and with a certificate of authenticity from their manufacturers.','',_binary '0');
INSERT INTO `product_line` VALUES ('Ships','The perfect holiday or anniversary gift for executives, clients, friends, and family. These handcrafted model ships are unique, stunning works of art that will be treasured for generations! They come fully assembled and ready for display in the home or office. We guarantee the highest quality, and best value.','',_binary '0');
INSERT INTO `product_line` VALUES ('Trains','Model trains are a rewarding hobby for enthusiasts of all ages. Whether you\'re looking for collectible wooden trains, electric streetcars or locomotives, you\'ll find a number of great choices for any budget within this category. The interactive aspect of trains makes toy trains perfect for young children. The wooden train sets are ideal for children under the age of 5.','',_binary '0');
INSERT INTO `product_line` VALUES ('Trucks and Buses','The Truck and Bus models are realistic replicas of buses and specialized trucks produced from the early 1920s to present. The models range in size from 1:12 to 1:50 scale and include numerous limited edition and several out-of-production vehicles. Materials used include tin, diecast and plastic. All models include a certificate of authenticity from their manufacturers and are a perfect ornament for the home and office.','',_binary '0');
INSERT INTO `product_line` VALUES ('Vintage Cars','Our Vintage Car models realistically portray automobiles produced from the early 1900s through the 1940s. Materials used include Bakelite, diecast, plastic and wood. Most of the replicas are in the 1:18 and 1:24 scale sizes, which provide the optimum in detail and accuracy. Prices range from $30.00 up to $180.00 for some special limited edition replicas. All models include a certificate of authenticity from their manufacturers and come fully assembled and ready for display in the home or office.','',_binary '0');
/*!40000 ALTER TABLE `product_line` ENABLE KEYS */;

--
-- Temporary view structure for view `product_product_line`
--

DROP TABLE IF EXISTS `product_product_line`;
/*!50001 DROP VIEW IF EXISTS `product_product_line`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `product_product_line` AS SELECT 
 1 AS `sku`,
 1 AS `description`,
 1 AS `product_line`,
 1 AS `text_description`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product_supplier`
--

DROP TABLE IF EXISTS `product_supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product_supplier` (
  `sku` varchar(15) NOT NULL,
  `supplier_code` varchar(15) NOT NULL,
  PRIMARY KEY (`sku`,`supplier_code`),
  KEY `product_supplier_supplier_supplier_code_fk` (`supplier_code`),
  CONSTRAINT `product_supplier_product_code_fk` FOREIGN KEY (`sku`) REFERENCES `product` (`sku`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `product_supplier_supplier_supplier_code_fk` FOREIGN KEY (`supplier_code`) REFERENCES `supplier` (`supplier_code`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_supplier`
--

/*!40000 ALTER TABLE `product_supplier` DISABLE KEYS */;
INSERT INTO `product_supplier` VALUES ('S12_1099','ASD');
INSERT INTO `product_supplier` VALUES ('S18_2325','ASD');
INSERT INTO `product_supplier` VALUES ('S24_1578','ASD');
INSERT INTO `product_supplier` VALUES ('S24_2300','ASD');
INSERT INTO `product_supplier` VALUES ('S24_2841','ASD');
INSERT INTO `product_supplier` VALUES ('S24_3420','ASD');
INSERT INTO `product_supplier` VALUES ('S50_4713','ASD');
INSERT INTO `product_supplier` VALUES ('S700_1138','ASD');
INSERT INTO `product_supplier` VALUES ('S18_2432','CDL');
INSERT INTO `product_supplier` VALUES ('S18_2949','CDL');
INSERT INTO `product_supplier` VALUES ('S18_3259','CDL');
INSERT INTO `product_supplier` VALUES ('S24_1628','CDL');
INSERT INTO `product_supplier` VALUES ('S24_2011','CDL');
INSERT INTO `product_supplier` VALUES ('S24_2840','CDL');
INSERT INTO `product_supplier` VALUES ('S24_3816','CDL');
INSERT INTO `product_supplier` VALUES ('S700_2824','CDL');
INSERT INTO `product_supplier` VALUES ('S700_3505','CDL');
INSERT INTO `product_supplier` VALUES ('S10_1949','CMC');
INSERT INTO `product_supplier` VALUES ('S18_1589','CMC');
INSERT INTO `product_supplier` VALUES ('S18_4721','CMC');
INSERT INTO `product_supplier` VALUES ('S24_1785','CMC');
INSERT INTO `product_supplier` VALUES ('S24_2022','CMC');
INSERT INTO `product_supplier` VALUES ('S24_2766','CMC');
INSERT INTO `product_supplier` VALUES ('S24_3856','CMC');
INSERT INTO `product_supplier` VALUES ('S24_4620','CMC');
INSERT INTO `product_supplier` VALUES ('S32_2509','CMC');
INSERT INTO `product_supplier` VALUES ('S50_1514','CMC');
INSERT INTO `product_supplier` VALUES ('S12_4473','EXOTO');
INSERT INTO `product_supplier` VALUES ('S18_3320','EXOTO');
INSERT INTO `product_supplier` VALUES ('S18_3856','EXOTO');
INSERT INTO `product_supplier` VALUES ('S18_4409','EXOTO');
INSERT INTO `product_supplier` VALUES ('S18_4522','EXOTO');
INSERT INTO `product_supplier` VALUES ('S24_2887','EXOTO');
INSERT INTO `product_supplier` VALUES ('S24_3191','EXOTO');
INSERT INTO `product_supplier` VALUES ('S24_4048','EXOTO');
INSERT INTO `product_supplier` VALUES ('S32_1374','EXOTO');
INSERT INTO `product_supplier` VALUES ('S18_1889','GEARBOX');
INSERT INTO `product_supplier` VALUES ('S18_2238','GEARBOX');
INSERT INTO `product_supplier` VALUES ('S18_2581','GEARBOX');
INSERT INTO `product_supplier` VALUES ('S18_2795','GEARBOX');
INSERT INTO `product_supplier` VALUES ('S18_3482','GEARBOX');
INSERT INTO `product_supplier` VALUES ('S18_3685','GEARBOX');
INSERT INTO `product_supplier` VALUES ('S24_3432','GEARBOX');
INSERT INTO `product_supplier` VALUES ('S32_2206','GEARBOX');
INSERT INTO `product_supplier` VALUES ('S32_3207','GEARBOX');
INSERT INTO `product_supplier` VALUES ('S10_2016','HWY66');
INSERT INTO `product_supplier` VALUES ('S18_1129','HWY66');
INSERT INTO `product_supplier` VALUES ('S18_3233','HWY66');
INSERT INTO `product_supplier` VALUES ('S24_1444','HWY66');
INSERT INTO `product_supplier` VALUES ('S24_2000','HWY66');
INSERT INTO `product_supplier` VALUES ('S24_2360','HWY66');
INSERT INTO `product_supplier` VALUES ('S32_4289','HWY66');
INSERT INTO `product_supplier` VALUES ('S50_1392','HWY66');
INSERT INTO `product_supplier` VALUES ('S700_2834','HWY66');
INSERT INTO `product_supplier` VALUES ('S12_3990','M');
INSERT INTO `product_supplier` VALUES ('S18_1097','M');
INSERT INTO `product_supplier` VALUES ('S18_1367','M');
INSERT INTO `product_supplier` VALUES ('S18_3782','M');
INSERT INTO `product_supplier` VALUES ('S18_4668','M');
INSERT INTO `product_supplier` VALUES ('S18_4933','M');
INSERT INTO `product_supplier` VALUES ('S50_1341','M');
INSERT INTO `product_supplier` VALUES ('S700_1938','M');
INSERT INTO `product_supplier` VALUES ('S10_4757','MCAC');
INSERT INTO `product_supplier` VALUES ('S18_1342','MCAC');
INSERT INTO `product_supplier` VALUES ('S18_2248','MCAC');
INSERT INTO `product_supplier` VALUES ('S18_4600','MCAC');
INSERT INTO `product_supplier` VALUES ('S24_1937','MCAC');
INSERT INTO `product_supplier` VALUES ('S32_1268','MCAC');
INSERT INTO `product_supplier` VALUES ('S700_2466','MCAC');
INSERT INTO `product_supplier` VALUES ('S700_3167','MCAC');
INSERT INTO `product_supplier` VALUES ('S72_1253','MCAC');
INSERT INTO `product_supplier` VALUES ('S10_1678','MLD');
INSERT INTO `product_supplier` VALUES ('S18_1984','MLD');
INSERT INTO `product_supplier` VALUES ('S18_2957','MLD');
INSERT INTO `product_supplier` VALUES ('S18_3029','MLD');
INSERT INTO `product_supplier` VALUES ('S18_3278','MLD');
INSERT INTO `product_supplier` VALUES ('S18_4027','MLD');
INSERT INTO `product_supplier` VALUES ('S24_3151','MLD');
INSERT INTO `product_supplier` VALUES ('S700_1691','MLD');
INSERT INTO `product_supplier` VALUES ('S10_4698','RED');
INSERT INTO `product_supplier` VALUES ('S18_1662','RED');
INSERT INTO `product_supplier` VALUES ('S18_2870','RED');
INSERT INTO `product_supplier` VALUES ('S18_3136','RED');
INSERT INTO `product_supplier` VALUES ('S24_3969','RED');
INSERT INTO `product_supplier` VALUES ('S32_3522','RED');
INSERT INTO `product_supplier` VALUES ('S700_2610','RED');
INSERT INTO `product_supplier` VALUES ('S10_4962','SGD');
INSERT INTO `product_supplier` VALUES ('S12_1108','SGD');
INSERT INTO `product_supplier` VALUES ('S12_3891','SGD');
INSERT INTO `product_supplier` VALUES ('S24_2972','SGD');
INSERT INTO `product_supplier` VALUES ('S24_3949','SGD');
INSERT INTO `product_supplier` VALUES ('S24_4258','SGD');
INSERT INTO `product_supplier` VALUES ('S32_4485','SGD');
INSERT INTO `product_supplier` VALUES ('S700_4002','SGD');
INSERT INTO `product_supplier` VALUES ('S12_2823','UAG');
INSERT INTO `product_supplier` VALUES ('S18_2319','UAG');
INSERT INTO `product_supplier` VALUES ('S18_3140','UAG');
INSERT INTO `product_supplier` VALUES ('S18_3232','UAG');
INSERT INTO `product_supplier` VALUES ('S24_1046','UAG');
INSERT INTO `product_supplier` VALUES ('S24_4278','UAG');
INSERT INTO `product_supplier` VALUES ('S700_2047','UAG');
INSERT INTO `product_supplier` VALUES ('S72_3212','UAG');
INSERT INTO `product_supplier` VALUES ('S12_1666','WELLY');
INSERT INTO `product_supplier` VALUES ('S12_3148','WELLY');
INSERT INTO `product_supplier` VALUES ('S12_3380','WELLY');
INSERT INTO `product_supplier` VALUES ('S12_4675','WELLY');
INSERT INTO `product_supplier` VALUES ('S18_1749','WELLY');
INSERT INTO `product_supplier` VALUES ('S18_2625','WELLY');
INSERT INTO `product_supplier` VALUES ('S24_3371','WELLY');
INSERT INTO `product_supplier` VALUES ('S700_3962','WELLY');
/*!40000 ALTER TABLE `product_supplier` ENABLE KEYS */;

--
-- Table structure for table `supplier`
--

DROP TABLE IF EXISTS `supplier`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `supplier` (
  `supplier_code` varchar(15) NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`supplier_code`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `supplier`
--

/*!40000 ALTER TABLE `supplier` DISABLE KEYS */;
INSERT INTO `supplier` VALUES ('ASD','Autoart Studio Design','');
INSERT INTO `supplier` VALUES ('CDL','Carousel DieCast Legends','');
INSERT INTO `supplier` VALUES ('CMC','Classic Metal Creations','');
INSERT INTO `supplier` VALUES ('EXOTO','Exoto Designs','');
INSERT INTO `supplier` VALUES ('GEARBOX','Gearbox Collectibles','');
INSERT INTO `supplier` VALUES ('HWY66','Highway 66 Mini Classics','');
INSERT INTO `supplier` VALUES ('M','Studio M Art Models','');
INSERT INTO `supplier` VALUES ('MCAC','Motor City Art Classics','');
INSERT INTO `supplier` VALUES ('MLD','Min Lin Diecast','');
INSERT INTO `supplier` VALUES ('RED','Red Start Diecast','');
INSERT INTO `supplier` VALUES ('SGD','Second Gear Diecast','');
INSERT INTO `supplier` VALUES ('UAG','Unimax Art Galleries','');
INSERT INTO `supplier` VALUES ('WELLY','Welly Diecast Productions','');
/*!40000 ALTER TABLE `supplier` ENABLE KEYS */;

--
-- Table structure for table `tmp_docs`
--

DROP TABLE IF EXISTS `tmp_docs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tmp_docs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(100) NOT NULL DEFAULT 'toc',
  `name` varchar(200) NOT NULL DEFAULT 'toc',
  `line` varchar(4000) CHARACTER SET utf8mb4 DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=699 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tmp_docs`
--

/*!40000 ALTER TABLE `tmp_docs` DISABLE KEYS */;
INSERT INTO `tmp_docs` VALUES (1,'toc','toc','# DATABASEsqldoc');
INSERT INTO `tmp_docs` VALUES (2,'toc','toc','__Data Dictionary__');
INSERT INTO `tmp_docs` VALUES (3,'toc','toc','## Table of Contents');
INSERT INTO `tmp_docs` VALUES (4,'toc','toc','### Tables');
INSERT INTO `tmp_docs` VALUES (5,'toc','toc','| Name | Comment | Row Count|');
INSERT INTO `tmp_docs` VALUES (6,'toc','toc','| ---- | ------- | ---------: |');
INSERT INTO `tmp_docs` VALUES (7,'toc','toc','| [customer](table_customer.md) | Collection of existing customers | 122 |');
INSERT INTO `tmp_docs` VALUES (8,'toc','toc','| [customer_extension](table_customer_extension.md) | example of a 1 to 1 relationship | 0 |');
INSERT INTO `tmp_docs` VALUES (9,'toc','toc','| [employee](table_employee.md) |  | 24 |');
INSERT INTO `tmp_docs` VALUES (10,'toc','toc','| [employee_audit](table_employee_audit.md) |  | 48 |');
INSERT INTO `tmp_docs` VALUES (11,'toc','toc','| [employee_office](table_employee_office.md) | employee/office junction table | 26 |');
INSERT INTO `tmp_docs` VALUES (12,'toc','toc','| [inventory](table_inventory.md) | Quantity on hand and location | 110 |');
INSERT INTO `tmp_docs` VALUES (13,'toc','toc','| [office](table_office.md) |  | 7 |');
INSERT INTO `tmp_docs` VALUES (14,'toc','toc','| [order](table_order.md) |  | 326 |');
INSERT INTO `tmp_docs` VALUES (15,'toc','toc','| [order_detail](table_order_detail.md) |  | 2996 |');
INSERT INTO `tmp_docs` VALUES (16,'toc','toc','| [payment](table_payment.md) |  | 273 |');
INSERT INTO `tmp_docs` VALUES (17,'toc','toc','| [product](table_product.md) |  | 110 |');
INSERT INTO `tmp_docs` VALUES (18,'toc','toc','| [product_line](table_product_line.md) |  | 7 |');
INSERT INTO `tmp_docs` VALUES (19,'toc','toc','| [product_supplier](table_product_supplier.md) |  | 110 |');
INSERT INTO `tmp_docs` VALUES (20,'toc','toc','| [supplier](table_supplier.md) |  | 13 |');
INSERT INTO `tmp_docs` VALUES (21,'toc','toc','| [warehouse](table_warehouse.md) |  | 2 |');
INSERT INTO `tmp_docs` VALUES (22,'toc','toc','| [warehouse_bin](table_warehouse_bin.md) |  | 10 |');
INSERT INTO `tmp_docs` VALUES (38,'toc','toc','### Views ');
INSERT INTO `tmp_docs` VALUES (39,'toc','toc','| Name | Updatable | Definer |');
INSERT INTO `tmp_docs` VALUES (40,'toc','toc','| ---- |:---------:| ------- |');
INSERT INTO `tmp_docs` VALUES (41,'toc','toc','| [customer_payments](view_customer_payments.md) | &#9989; | root@% |');
INSERT INTO `tmp_docs` VALUES (42,'toc','toc','| [product_product_line](view_product_product_line.md) | &#9989; | root@% |');
INSERT INTO `tmp_docs` VALUES (44,'table','customer','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (45,'table','customer','# Table: customer');
INSERT INTO `tmp_docs` VALUES (46,'table','customer','Collection of existing customers');
INSERT INTO `tmp_docs` VALUES (47,'table','customer','');
INSERT INTO `tmp_docs` VALUES (48,'table','customer','');
INSERT INTO `tmp_docs` VALUES (49,'table','customer','## Properties');
INSERT INTO `tmp_docs` VALUES (50,'table','customer','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (51,'table','customer','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (52,'table','customer','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (53,'table','customer','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (54,'table','customer','| Row Count | 122 |');
INSERT INTO `tmp_docs` VALUES (55,'table','customer','| Average Row Length | 402 |');
INSERT INTO `tmp_docs` VALUES (56,'table','customer','| Index Length | 49152 |');
INSERT INTO `tmp_docs` VALUES (57,'table','customer','| Created | 2021-09-15 20:27:55 |');
INSERT INTO `tmp_docs` VALUES (58,'table','customer','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (59,'table','customer','## Columns');
INSERT INTO `tmp_docs` VALUES (60,'table','customer','');
INSERT INTO `tmp_docs` VALUES (61,'table','customer','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (62,'table','customer','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (63,'table','customer','| &#128273;  | customer_number | int(11) |  | &#128683; | Our assigned customer number |');
INSERT INTO `tmp_docs` VALUES (64,'table','customer','|   | customer_name | varchar(50) |  | &#128683; | Company or individual name |');
INSERT INTO `tmp_docs` VALUES (65,'table','customer','|   | contact_last_name | varchar(50) |  | &#128683; | Company contact\'s last name |');
INSERT INTO `tmp_docs` VALUES (66,'table','customer','|   | contact_first_name | varchar(50) |  | &#128683; | Company contact\'s first name |');
INSERT INTO `tmp_docs` VALUES (67,'table','customer','|   | email | varchar(254) |  | &#9989; | Customer\'s email if available. |');
INSERT INTO `tmp_docs` VALUES (68,'table','customer','|   | phone | varchar(50) |  | &#128683; | Company phone |');
INSERT INTO `tmp_docs` VALUES (69,'table','customer','|   | address_line_1 | varchar(50) |  | &#128683; | First line of Company address |');
INSERT INTO `tmp_docs` VALUES (70,'table','customer','|   | address_line_2 | varchar(50) | empty string | &#128683; | Second line of Company address |');
INSERT INTO `tmp_docs` VALUES (71,'table','customer','|   | city | varchar(50) | empty string | &#128683; | Company city |');
INSERT INTO `tmp_docs` VALUES (72,'table','customer','|   | state | varchar(50) | empty string | &#128683; | Company state |');
INSERT INTO `tmp_docs` VALUES (73,'table','customer','|   | postal_code | varchar(15) | empty string | &#128683; | Company zip or postal code |');
INSERT INTO `tmp_docs` VALUES (74,'table','customer','|   | country | varchar(50) | empty string | &#128683; | Company country |');
INSERT INTO `tmp_docs` VALUES (75,'table','customer','|  &#128477; | sales_rep_employee_number | int(11) | 0 | &#128683; | Employee number of associated sales rep |');
INSERT INTO `tmp_docs` VALUES (76,'table','customer','|   | credit_limit | decimal(10,2) | 0.00 | &#128683; | Amout of credit we are willing to extend to this customer |');
INSERT INTO `tmp_docs` VALUES (78,'table','customer','');
INSERT INTO `tmp_docs` VALUES (79,'table','customer','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (80,'table','customer','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (81,'table','customer','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (82,'table','customer','| customer_employee_employee_number_fk | sales_rep_employee_number --> employee.employee_number | RESTRICT | RESTRICT |');
INSERT INTO `tmp_docs` VALUES (83,'table','customer','');
INSERT INTO `tmp_docs` VALUES (84,'table','customer','## Indexes');
INSERT INTO `tmp_docs` VALUES (85,'table','customer','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (86,'table','customer','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (87,'table','customer','| customer_email_uindex | email | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (88,'table','customer','| PRIMARY | customer_number | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (89,'table','customer','| customer_contact_last_name_contact_first_name_index | contact_last_name, contact_first_name | &#128683; | &#128683; | Speed up search by last name, first name |');
INSERT INTO `tmp_docs` VALUES (90,'table','customer','| customer_sales_rep_employee_number_index | sales_rep_employee_number | &#128683; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (94,'table','customer_extension','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (95,'table','customer_extension','# Table: customer_extension');
INSERT INTO `tmp_docs` VALUES (96,'table','customer_extension','example of a 1 to 1 relationship');
INSERT INTO `tmp_docs` VALUES (97,'table','customer_extension','');
INSERT INTO `tmp_docs` VALUES (98,'table','customer_extension','');
INSERT INTO `tmp_docs` VALUES (99,'table','customer_extension','## Properties');
INSERT INTO `tmp_docs` VALUES (100,'table','customer_extension','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (101,'table','customer_extension','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (102,'table','customer_extension','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (103,'table','customer_extension','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (104,'table','customer_extension','| Row Count | 0 |');
INSERT INTO `tmp_docs` VALUES (105,'table','customer_extension','| Average Row Length | 0 |');
INSERT INTO `tmp_docs` VALUES (106,'table','customer_extension','| Index Length | 0 |');
INSERT INTO `tmp_docs` VALUES (107,'table','customer_extension','| Created | 2021-09-15 19:12:18 |');
INSERT INTO `tmp_docs` VALUES (108,'table','customer_extension','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (109,'table','customer_extension','## Columns');
INSERT INTO `tmp_docs` VALUES (110,'table','customer_extension','');
INSERT INTO `tmp_docs` VALUES (111,'table','customer_extension','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (112,'table','customer_extension','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (113,'table','customer_extension','| &#128273; &#128477; | customer_number | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (114,'table','customer_extension','|   | favorite_pet | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (115,'table','customer_extension','|   | favorite_color | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (116,'table','customer_extension','|   | favorite_movie | varchar(200) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (120,'table','customer_extension','');
INSERT INTO `tmp_docs` VALUES (121,'table','customer_extension','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (122,'table','customer_extension','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (123,'table','customer_extension','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (124,'table','customer_extension','| customer_extension_customer_customer_number_fk | customer_number --> customer.customer_number | CASCADE | CASCADE |');
INSERT INTO `tmp_docs` VALUES (125,'table','customer_extension','');
INSERT INTO `tmp_docs` VALUES (126,'table','customer_extension','## Indexes');
INSERT INTO `tmp_docs` VALUES (127,'table','customer_extension','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (128,'table','customer_extension','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (129,'table','customer_extension','| PRIMARY | customer_number | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (130,'table','employee','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (131,'table','employee','# Table: employee');
INSERT INTO `tmp_docs` VALUES (132,'table','employee','');
INSERT INTO `tmp_docs` VALUES (133,'table','employee','');
INSERT INTO `tmp_docs` VALUES (134,'table','employee','## Properties');
INSERT INTO `tmp_docs` VALUES (135,'table','employee','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (136,'table','employee','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (137,'table','employee','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (138,'table','employee','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (139,'table','employee','| Row Count | 24 |');
INSERT INTO `tmp_docs` VALUES (140,'table','employee','| Average Row Length | 682 |');
INSERT INTO `tmp_docs` VALUES (141,'table','employee','| Index Length | 32768 |');
INSERT INTO `tmp_docs` VALUES (142,'table','employee','| Created | 2021-09-15 19:14:58 |');
INSERT INTO `tmp_docs` VALUES (143,'table','employee','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (144,'table','employee','## Columns');
INSERT INTO `tmp_docs` VALUES (145,'table','employee','');
INSERT INTO `tmp_docs` VALUES (146,'table','employee','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (147,'table','employee','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (148,'table','employee','| &#128273;  | employee_number | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (149,'table','employee','|   | last_name | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (150,'table','employee','|   | first_name | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (151,'table','employee','|   | extension | varchar(10) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (152,'table','employee','|   | email | varchar(254) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (153,'table','employee','|  &#128477; | reports_to | int(11) | 0 | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (154,'table','employee','|   | job_title | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (155,'table','employee','');
INSERT INTO `tmp_docs` VALUES (156,'table','employee','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (157,'table','employee','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (158,'table','employee','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (159,'table','employee','| employee_employee_employee_number_fk | reports_to --> employee.employee_number | RESTRICT | RESTRICT |');
INSERT INTO `tmp_docs` VALUES (160,'table','employee','');
INSERT INTO `tmp_docs` VALUES (161,'table','employee','## Indexes');
INSERT INTO `tmp_docs` VALUES (162,'table','employee','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (163,'table','employee','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (164,'table','employee','| PRIMARY | employee_number | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (165,'table','employee','| employee_last_name_first_name_email_index | last_name, first_name, email | &#128683; | &#128683; | Fast search on last name, first name, email |');
INSERT INTO `tmp_docs` VALUES (166,'table','employee','| employee_reports_to_index | reports_to | &#128683; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (167,'table','employee','');
INSERT INTO `tmp_docs` VALUES (168,'table','employee','## Triggers');
INSERT INTO `tmp_docs` VALUES (169,'table','employee','### employee_ins');
INSERT INTO `tmp_docs` VALUES (170,'table','employee','| Timing | Event | Definer | Character Set | Collation | Created |');
INSERT INTO `tmp_docs` VALUES (171,'table','employee','| ------ | ----- | ------- | ------------- | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (172,'table','employee','| AFTER | INSERT | root@% | utf8mb4 | utf8mb4_general_ci | 2021-09-15 18:19:58.35 |');
INSERT INTO `tmp_docs` VALUES (173,'table','employee','');
INSERT INTO `tmp_docs` VALUES (174,'table','employee','```sql');
INSERT INTO `tmp_docs` VALUES (175,'table','employee','begin\r    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)\r    values (NEW.employee_number,\r            null,\r            json_object(\"last_name\", NEW.last_name, \"first_name\", NEW.first_name, \"extension\", NEW.extension, \"email\",\r                        NEW.email, \"office_code\", NEW.office_code, \"reports_to\", NEW.reports_to, \"job_title\",\r                        NEW.job_title),\r            \'INSERT\');\rend');
INSERT INTO `tmp_docs` VALUES (176,'table','employee','```');
INSERT INTO `tmp_docs` VALUES (177,'table','employee','### employee_upd');
INSERT INTO `tmp_docs` VALUES (178,'table','employee','| Timing | Event | Definer | Character Set | Collation | Created |');
INSERT INTO `tmp_docs` VALUES (179,'table','employee','| ------ | ----- | ------- | ------------- | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (180,'table','employee','| AFTER | UPDATE | root@% | utf8mb4 | utf8mb4_general_ci | 2021-09-15 18:19:58.37 |');
INSERT INTO `tmp_docs` VALUES (181,'table','employee','');
INSERT INTO `tmp_docs` VALUES (182,'table','employee','```sql');
INSERT INTO `tmp_docs` VALUES (183,'table','employee','begin\r    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)\r    values (NEW.employee_number,\r            json_object(\"last_name\", OLD.last_name, \"first_name\", OLD.first_name, \"extension\", OLD.extension, \"email\",\r                        OLD.email, \"office_code\", OLD.office_code, \"reports_to\", OLD.reports_to, \"job_title\",\r                        OLD.job_title),\r            json_object(\"last_name\", NEW.last_name, \"first_name\", NEW.first_name, \"extension\", NEW.extension, \"email\",\r                        NEW.email, \"office_code\", NEW.office_code, \"reports_to\", NEW.reports_to, \"job_title\",\r                        NEW.job_title),\r            \'UPDATE\');\rend');
INSERT INTO `tmp_docs` VALUES (184,'table','employee','```');
INSERT INTO `tmp_docs` VALUES (185,'table','employee','### employee_del');
INSERT INTO `tmp_docs` VALUES (186,'table','employee','| Timing | Event | Definer | Character Set | Collation | Created |');
INSERT INTO `tmp_docs` VALUES (187,'table','employee','| ------ | ----- | ------- | ------------- | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (188,'table','employee','| AFTER | DELETE | root@% | utf8mb4 | utf8mb4_general_ci | 2021-09-15 18:19:58.38 |');
INSERT INTO `tmp_docs` VALUES (189,'table','employee','');
INSERT INTO `tmp_docs` VALUES (190,'table','employee','```sql');
INSERT INTO `tmp_docs` VALUES (191,'table','employee','begin\r    insert into employee_audit (employee_number, old_row_data, new_row_data, operation)\r    values (OLD.employee_number,\r            json_object(\"last_name\", OLD.last_name, \"first_name\", OLD.first_name, \"extension\", OLD.extension, \"email\",\r                        OLD.email, \"office_code\", OLD.office_code, \"reports_to\", OLD.reports_to, \"job_title\",\r                        OLD.job_title),\r            null,\r            \'DELETE\');\rend');
INSERT INTO `tmp_docs` VALUES (192,'table','employee','```');
INSERT INTO `tmp_docs` VALUES (193,'table','employee_audit','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (194,'table','employee_audit','# Table: employee_audit');
INSERT INTO `tmp_docs` VALUES (195,'table','employee_audit','');
INSERT INTO `tmp_docs` VALUES (196,'table','employee_audit','');
INSERT INTO `tmp_docs` VALUES (197,'table','employee_audit','## Properties');
INSERT INTO `tmp_docs` VALUES (198,'table','employee_audit','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (199,'table','employee_audit','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (200,'table','employee_audit','| Engine | MyISAM |');
INSERT INTO `tmp_docs` VALUES (201,'table','employee_audit','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (202,'table','employee_audit','| Row Count | 48 |');
INSERT INTO `tmp_docs` VALUES (203,'table','employee_audit','| Average Row Length | 196 |');
INSERT INTO `tmp_docs` VALUES (204,'table','employee_audit','| Index Length | 2048 |');
INSERT INTO `tmp_docs` VALUES (205,'table','employee_audit','| Created | 2021-09-18 17:28:28 |');
INSERT INTO `tmp_docs` VALUES (206,'table','employee_audit','| Updated | 2021-09-18 17:28:28 |');
INSERT INTO `tmp_docs` VALUES (207,'table','employee_audit','## Columns');
INSERT INTO `tmp_docs` VALUES (208,'table','employee_audit','');
INSERT INTO `tmp_docs` VALUES (209,'table','employee_audit','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (210,'table','employee_audit','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (211,'table','employee_audit','| &#128273;  | employee_number | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (212,'table','employee_audit','|   | old_row_data | json |  | &#9989; |  |');
INSERT INTO `tmp_docs` VALUES (213,'table','employee_audit','|   | new_row_data | json |  | &#9989; |  |');
INSERT INTO `tmp_docs` VALUES (214,'table','employee_audit','| &#128273;  | operation | enum(\'INSERT\',\'UPDATE\',\'DELETE\') |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (215,'table','employee_audit','| &#128273;  | event_timestamp | timestamp | CURRENT_TIMESTAMP | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (218,'table','employee_audit','');
INSERT INTO `tmp_docs` VALUES (219,'table','employee_audit','## Indexes');
INSERT INTO `tmp_docs` VALUES (220,'table','employee_audit','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (221,'table','employee_audit','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (222,'table','employee_audit','| PRIMARY | employee_number, operation, event_timestamp | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (223,'table','employee_office','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (224,'table','employee_office','# Table: employee_office');
INSERT INTO `tmp_docs` VALUES (225,'table','employee_office','employee/office junction table');
INSERT INTO `tmp_docs` VALUES (226,'table','employee_office','');
INSERT INTO `tmp_docs` VALUES (227,'table','employee_office','');
INSERT INTO `tmp_docs` VALUES (228,'table','employee_office','## Properties');
INSERT INTO `tmp_docs` VALUES (229,'table','employee_office','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (230,'table','employee_office','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (231,'table','employee_office','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (232,'table','employee_office','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (233,'table','employee_office','| Row Count | 26 |');
INSERT INTO `tmp_docs` VALUES (234,'table','employee_office','| Average Row Length | 630 |');
INSERT INTO `tmp_docs` VALUES (235,'table','employee_office','| Index Length | 16384 |');
INSERT INTO `tmp_docs` VALUES (236,'table','employee_office','| Created | 2021-09-15 19:15:46 |');
INSERT INTO `tmp_docs` VALUES (237,'table','employee_office','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (238,'table','employee_office','## Columns');
INSERT INTO `tmp_docs` VALUES (239,'table','employee_office','');
INSERT INTO `tmp_docs` VALUES (240,'table','employee_office','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (241,'table','employee_office','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (242,'table','employee_office','| &#128273; &#128477; | employee_number | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (243,'table','employee_office','| &#128273; &#128477; | office_code | varchar(10) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (245,'table','employee_office','');
INSERT INTO `tmp_docs` VALUES (246,'table','employee_office','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (247,'table','employee_office','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (248,'table','employee_office','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (249,'table','employee_office','| employee_office_employee_employee_number_fk | employee_number --> employee.employee_number | CASCADE | CASCADE |');
INSERT INTO `tmp_docs` VALUES (250,'table','employee_office','| employee_office_office_office_code_fk | office_code --> office.office_code | CASCADE | CASCADE |');
INSERT INTO `tmp_docs` VALUES (252,'table','employee_office','');
INSERT INTO `tmp_docs` VALUES (253,'table','employee_office','## Indexes');
INSERT INTO `tmp_docs` VALUES (254,'table','employee_office','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (255,'table','employee_office','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (256,'table','employee_office','| PRIMARY | employee_number, office_code | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (257,'table','employee_office','| employee_office_office_code_index | office_code | &#128683; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (259,'table','inventory','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (260,'table','inventory','# Table: inventory');
INSERT INTO `tmp_docs` VALUES (261,'table','inventory','Quantity on hand and location');
INSERT INTO `tmp_docs` VALUES (262,'table','inventory','');
INSERT INTO `tmp_docs` VALUES (263,'table','inventory','');
INSERT INTO `tmp_docs` VALUES (264,'table','inventory','## Properties');
INSERT INTO `tmp_docs` VALUES (265,'table','inventory','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (266,'table','inventory','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (267,'table','inventory','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (268,'table','inventory','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (269,'table','inventory','| Row Count | 110 |');
INSERT INTO `tmp_docs` VALUES (270,'table','inventory','| Average Row Length | 148 |');
INSERT INTO `tmp_docs` VALUES (271,'table','inventory','| Index Length | 16384 |');
INSERT INTO `tmp_docs` VALUES (272,'table','inventory','| Created | 2021-09-16 01:39:29 |');
INSERT INTO `tmp_docs` VALUES (273,'table','inventory','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (274,'table','inventory','## Columns');
INSERT INTO `tmp_docs` VALUES (275,'table','inventory','');
INSERT INTO `tmp_docs` VALUES (276,'table','inventory','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (277,'table','inventory','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (278,'table','inventory','| &#128273; &#128477; | sku | varchar(15) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (279,'table','inventory','| &#128273; &#128477; | warehouse_id | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (280,'table','inventory','| &#128273; &#128477; | bin_id | varchar(10) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (281,'table','inventory','|   | quantity_in_stock | int(11) | 0 | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (285,'table','inventory','');
INSERT INTO `tmp_docs` VALUES (286,'table','inventory','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (287,'table','inventory','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (288,'table','inventory','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (289,'table','inventory','| inventory_product_sku_fk | sku --> product.sku | RESTRICT | RESTRICT |');
INSERT INTO `tmp_docs` VALUES (290,'table','inventory','| inventory_warehouse_bin_warehouse_id_bin_id_fk | warehouse_id --> warehouse_bin.warehouse_id, bin_id --> warehouse_bin.bin_id | RESTRICT | RESTRICT |');
INSERT INTO `tmp_docs` VALUES (292,'table','inventory','');
INSERT INTO `tmp_docs` VALUES (293,'table','inventory','## Indexes');
INSERT INTO `tmp_docs` VALUES (294,'table','inventory','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (295,'table','inventory','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (296,'table','inventory','| PRIMARY | sku, warehouse_id, bin_id | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (297,'table','inventory','| inventory_warehouse_bin_warehouse_id_bin_id_fk | warehouse_id, bin_id | &#128683; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (299,'table','office','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (300,'table','office','# Table: office');
INSERT INTO `tmp_docs` VALUES (301,'table','office','');
INSERT INTO `tmp_docs` VALUES (302,'table','office','');
INSERT INTO `tmp_docs` VALUES (303,'table','office','## Properties');
INSERT INTO `tmp_docs` VALUES (304,'table','office','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (305,'table','office','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (306,'table','office','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (307,'table','office','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (308,'table','office','| Row Count | 7 |');
INSERT INTO `tmp_docs` VALUES (309,'table','office','| Average Row Length | 2340 |');
INSERT INTO `tmp_docs` VALUES (310,'table','office','| Index Length | 0 |');
INSERT INTO `tmp_docs` VALUES (311,'table','office','| Created | 2021-09-15 18:44:52 |');
INSERT INTO `tmp_docs` VALUES (312,'table','office','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (313,'table','office','## Columns');
INSERT INTO `tmp_docs` VALUES (314,'table','office','');
INSERT INTO `tmp_docs` VALUES (315,'table','office','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (316,'table','office','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (317,'table','office','| &#128273;  | office_code | varchar(10) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (318,'table','office','|   | city | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (319,'table','office','|   | phone | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (320,'table','office','|   | address_line_1 | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (321,'table','office','|   | address_line_2 | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (322,'table','office','|   | state | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (323,'table','office','|   | country | varchar(50) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (324,'table','office','|   | postal_code | varchar(15) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (325,'table','office','|   | territory | varchar(10) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (332,'table','office','');
INSERT INTO `tmp_docs` VALUES (333,'table','office','## Indexes');
INSERT INTO `tmp_docs` VALUES (334,'table','office','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (335,'table','office','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (336,'table','office','| PRIMARY | office_code | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (337,'table','order','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (338,'table','order','# Table: order');
INSERT INTO `tmp_docs` VALUES (339,'table','order','');
INSERT INTO `tmp_docs` VALUES (340,'table','order','');
INSERT INTO `tmp_docs` VALUES (341,'table','order','## Properties');
INSERT INTO `tmp_docs` VALUES (342,'table','order','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (343,'table','order','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (344,'table','order','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (345,'table','order','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (346,'table','order','| Row Count | 326 |');
INSERT INTO `tmp_docs` VALUES (347,'table','order','| Average Row Length | 150 |');
INSERT INTO `tmp_docs` VALUES (348,'table','order','| Index Length | 16384 |');
INSERT INTO `tmp_docs` VALUES (349,'table','order','| Created | 2021-09-15 19:16:28 |');
INSERT INTO `tmp_docs` VALUES (350,'table','order','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (351,'table','order','## Columns');
INSERT INTO `tmp_docs` VALUES (352,'table','order','');
INSERT INTO `tmp_docs` VALUES (353,'table','order','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (354,'table','order','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (355,'table','order','| &#128273;  | order_number | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (356,'table','order','|   | order_date | date |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (357,'table','order','|   | required_date | date |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (358,'table','order','|   | shipped_date | date | 1900-01-01 | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (359,'table','order','|   | status | varchar(15) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (360,'table','order','|   | comment | text |  | &#9989; |  |');
INSERT INTO `tmp_docs` VALUES (361,'table','order','|  &#128477; | customer_number | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (362,'table','order','');
INSERT INTO `tmp_docs` VALUES (363,'table','order','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (364,'table','order','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (365,'table','order','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (366,'table','order','| order_customer_customer_number_fk | customer_number --> customer.customer_number | CASCADE | RESTRICT |');
INSERT INTO `tmp_docs` VALUES (367,'table','order','');
INSERT INTO `tmp_docs` VALUES (368,'table','order','## Indexes');
INSERT INTO `tmp_docs` VALUES (369,'table','order','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (370,'table','order','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (371,'table','order','| PRIMARY | order_number | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (372,'table','order','| order_customer_number_index | customer_number | &#128683; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (374,'table','order_detail','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (375,'table','order_detail','# Table: order_detail');
INSERT INTO `tmp_docs` VALUES (376,'table','order_detail','');
INSERT INTO `tmp_docs` VALUES (377,'table','order_detail','');
INSERT INTO `tmp_docs` VALUES (378,'table','order_detail','## Properties');
INSERT INTO `tmp_docs` VALUES (379,'table','order_detail','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (380,'table','order_detail','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (381,'table','order_detail','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (382,'table','order_detail','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (383,'table','order_detail','| Row Count | 2996 |');
INSERT INTO `tmp_docs` VALUES (384,'table','order_detail','| Average Row Length | 54 |');
INSERT INTO `tmp_docs` VALUES (385,'table','order_detail','| Index Length | 81920 |');
INSERT INTO `tmp_docs` VALUES (386,'table','order_detail','| Created | 2021-09-15 19:16:59 |');
INSERT INTO `tmp_docs` VALUES (387,'table','order_detail','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (388,'table','order_detail','## Columns');
INSERT INTO `tmp_docs` VALUES (389,'table','order_detail','');
INSERT INTO `tmp_docs` VALUES (390,'table','order_detail','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (391,'table','order_detail','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (392,'table','order_detail','| &#128273; &#128477; | order_number | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (393,'table','order_detail','| &#128273;  | product_code | varchar(15) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (394,'table','order_detail','|   | quantity_ordered | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (395,'table','order_detail','|   | price_each | decimal(10,2) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (396,'table','order_detail','|   | order_line_number | smallint(6) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (399,'table','order_detail','');
INSERT INTO `tmp_docs` VALUES (400,'table','order_detail','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (401,'table','order_detail','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (402,'table','order_detail','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (403,'table','order_detail','| order_detail_order_order_number_fk | order_number --> order.order_number | CASCADE | CASCADE |');
INSERT INTO `tmp_docs` VALUES (404,'table','order_detail','');
INSERT INTO `tmp_docs` VALUES (405,'table','order_detail','## Indexes');
INSERT INTO `tmp_docs` VALUES (406,'table','order_detail','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (407,'table','order_detail','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (408,'table','order_detail','| PRIMARY | order_number, product_code | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (409,'table','order_detail','| order_detail_product_code_index | product_code | &#128683; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (411,'table','payment','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (412,'table','payment','# Table: payment');
INSERT INTO `tmp_docs` VALUES (413,'table','payment','');
INSERT INTO `tmp_docs` VALUES (414,'table','payment','');
INSERT INTO `tmp_docs` VALUES (415,'table','payment','## Properties');
INSERT INTO `tmp_docs` VALUES (416,'table','payment','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (417,'table','payment','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (418,'table','payment','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (419,'table','payment','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (420,'table','payment','| Row Count | 273 |');
INSERT INTO `tmp_docs` VALUES (421,'table','payment','| Average Row Length | 60 |');
INSERT INTO `tmp_docs` VALUES (422,'table','payment','| Index Length | 0 |');
INSERT INTO `tmp_docs` VALUES (423,'table','payment','| Created | 2021-09-15 19:17:51 |');
INSERT INTO `tmp_docs` VALUES (424,'table','payment','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (425,'table','payment','## Columns');
INSERT INTO `tmp_docs` VALUES (426,'table','payment','');
INSERT INTO `tmp_docs` VALUES (427,'table','payment','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (428,'table','payment','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (429,'table','payment','| &#128273; &#128477; | customer_number | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (430,'table','payment','| &#128273;  | check_number | varchar(50) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (431,'table','payment','|   | payment_date | date |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (432,'table','payment','|   | amount | decimal(10,2) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (436,'table','payment','');
INSERT INTO `tmp_docs` VALUES (437,'table','payment','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (438,'table','payment','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (439,'table','payment','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (440,'table','payment','| payment_customer_customer_number_fk | customer_number --> customer.customer_number | RESTRICT | RESTRICT |');
INSERT INTO `tmp_docs` VALUES (441,'table','payment','');
INSERT INTO `tmp_docs` VALUES (442,'table','payment','## Indexes');
INSERT INTO `tmp_docs` VALUES (443,'table','payment','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (444,'table','payment','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (445,'table','payment','| PRIMARY | customer_number, check_number | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (446,'table','product','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (447,'table','product','# Table: product');
INSERT INTO `tmp_docs` VALUES (448,'table','product','');
INSERT INTO `tmp_docs` VALUES (449,'table','product','');
INSERT INTO `tmp_docs` VALUES (450,'table','product','## Properties');
INSERT INTO `tmp_docs` VALUES (451,'table','product','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (452,'table','product','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (453,'table','product','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (454,'table','product','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (455,'table','product','| Row Count | 110 |');
INSERT INTO `tmp_docs` VALUES (456,'table','product','| Average Row Length | 446 |');
INSERT INTO `tmp_docs` VALUES (457,'table','product','| Index Length | 32768 |');
INSERT INTO `tmp_docs` VALUES (458,'table','product','| Created | 2021-09-15 19:43:24 |');
INSERT INTO `tmp_docs` VALUES (459,'table','product','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (460,'table','product','## Columns');
INSERT INTO `tmp_docs` VALUES (461,'table','product','');
INSERT INTO `tmp_docs` VALUES (462,'table','product','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (463,'table','product','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (464,'table','product','| &#128273;  | sku | varchar(15) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (465,'table','product','|   | name | varchar(70) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (466,'table','product','|  &#128477; | product_line | varchar(50) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (467,'table','product','|   | scale | varchar(10) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (468,'table','product','|   | description | text |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (469,'table','product','|   | quantity_in_stock | smallint(6) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (470,'table','product','|   | buy_price | decimal(10,2) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (471,'table','product','|   | msrp | decimal(10,2) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (479,'table','product','');
INSERT INTO `tmp_docs` VALUES (480,'table','product','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (481,'table','product','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (482,'table','product','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (483,'table','product','| product_product_line_product_line_fk | product_line --> product_line.product_line | RESTRICT | RESTRICT |');
INSERT INTO `tmp_docs` VALUES (484,'table','product','');
INSERT INTO `tmp_docs` VALUES (485,'table','product','## Indexes');
INSERT INTO `tmp_docs` VALUES (486,'table','product','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (487,'table','product','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (488,'table','product','| PRIMARY | sku | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (489,'table','product','| product_description_ft | sku, name, product_line, description | &#128683; | &#9989; |  |');
INSERT INTO `tmp_docs` VALUES (490,'table','product','| product_product_line_index | product_line | &#128683; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (491,'table','product_line','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (492,'table','product_line','# Table: product_line');
INSERT INTO `tmp_docs` VALUES (493,'table','product_line','');
INSERT INTO `tmp_docs` VALUES (494,'table','product_line','');
INSERT INTO `tmp_docs` VALUES (495,'table','product_line','## Properties');
INSERT INTO `tmp_docs` VALUES (496,'table','product_line','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (497,'table','product_line','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (498,'table','product_line','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (499,'table','product_line','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (500,'table','product_line','| Row Count | 7 |');
INSERT INTO `tmp_docs` VALUES (501,'table','product_line','| Average Row Length | 2340 |');
INSERT INTO `tmp_docs` VALUES (502,'table','product_line','| Index Length | 0 |');
INSERT INTO `tmp_docs` VALUES (503,'table','product_line','| Created | 2021-09-16 00:24:17 |');
INSERT INTO `tmp_docs` VALUES (504,'table','product_line','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (505,'table','product_line','## Columns');
INSERT INTO `tmp_docs` VALUES (506,'table','product_line','');
INSERT INTO `tmp_docs` VALUES (507,'table','product_line','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (508,'table','product_line','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (509,'table','product_line','| &#128273;  | product_line | varchar(50) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (510,'table','product_line','|   | text_description | varchar(4000) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (511,'table','product_line','|   | html_description | mediumtext |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (512,'table','product_line','|   | image | mediumblob |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (516,'table','product_line','');
INSERT INTO `tmp_docs` VALUES (517,'table','product_line','## Indexes');
INSERT INTO `tmp_docs` VALUES (518,'table','product_line','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (519,'table','product_line','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (520,'table','product_line','| PRIMARY | product_line | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (521,'table','product_supplier','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (522,'table','product_supplier','# Table: product_supplier');
INSERT INTO `tmp_docs` VALUES (523,'table','product_supplier','');
INSERT INTO `tmp_docs` VALUES (524,'table','product_supplier','');
INSERT INTO `tmp_docs` VALUES (525,'table','product_supplier','## Properties');
INSERT INTO `tmp_docs` VALUES (526,'table','product_supplier','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (527,'table','product_supplier','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (528,'table','product_supplier','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (529,'table','product_supplier','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (530,'table','product_supplier','| Row Count | 110 |');
INSERT INTO `tmp_docs` VALUES (531,'table','product_supplier','| Average Row Length | 148 |');
INSERT INTO `tmp_docs` VALUES (532,'table','product_supplier','| Index Length | 16384 |');
INSERT INTO `tmp_docs` VALUES (533,'table','product_supplier','| Created | 2021-09-16 00:30:25 |');
INSERT INTO `tmp_docs` VALUES (534,'table','product_supplier','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (535,'table','product_supplier','## Columns');
INSERT INTO `tmp_docs` VALUES (536,'table','product_supplier','');
INSERT INTO `tmp_docs` VALUES (537,'table','product_supplier','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (538,'table','product_supplier','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (539,'table','product_supplier','| &#128273; &#128477; | sku | varchar(15) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (540,'table','product_supplier','| &#128273; &#128477; | supplier_code | varchar(15) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (542,'table','product_supplier','');
INSERT INTO `tmp_docs` VALUES (543,'table','product_supplier','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (544,'table','product_supplier','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (545,'table','product_supplier','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (546,'table','product_supplier','| product_supplier_product_code_fk | sku --> product.sku | CASCADE | CASCADE |');
INSERT INTO `tmp_docs` VALUES (547,'table','product_supplier','| product_supplier_supplier_supplier_code_fk | supplier_code --> supplier.supplier_code | CASCADE | CASCADE |');
INSERT INTO `tmp_docs` VALUES (549,'table','product_supplier','');
INSERT INTO `tmp_docs` VALUES (550,'table','product_supplier','## Indexes');
INSERT INTO `tmp_docs` VALUES (551,'table','product_supplier','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (552,'table','product_supplier','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (553,'table','product_supplier','| PRIMARY | sku, supplier_code | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (554,'table','product_supplier','| product_supplier_supplier_supplier_code_fk | supplier_code | &#128683; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (556,'table','supplier','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (557,'table','supplier','# Table: supplier');
INSERT INTO `tmp_docs` VALUES (558,'table','supplier','');
INSERT INTO `tmp_docs` VALUES (559,'table','supplier','');
INSERT INTO `tmp_docs` VALUES (560,'table','supplier','## Properties');
INSERT INTO `tmp_docs` VALUES (561,'table','supplier','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (562,'table','supplier','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (563,'table','supplier','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (564,'table','supplier','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (565,'table','supplier','| Row Count | 13 |');
INSERT INTO `tmp_docs` VALUES (566,'table','supplier','| Average Row Length | 1260 |');
INSERT INTO `tmp_docs` VALUES (567,'table','supplier','| Index Length | 0 |');
INSERT INTO `tmp_docs` VALUES (568,'table','supplier','| Created | 2021-09-15 19:28:01 |');
INSERT INTO `tmp_docs` VALUES (569,'table','supplier','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (570,'table','supplier','## Columns');
INSERT INTO `tmp_docs` VALUES (571,'table','supplier','');
INSERT INTO `tmp_docs` VALUES (572,'table','supplier','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (573,'table','supplier','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (574,'table','supplier','| &#128273;  | supplier_code | varchar(15) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (575,'table','supplier','|   | name | varchar(255) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (576,'table','supplier','|   | phone | varchar(15) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (577,'table','supplier','');
INSERT INTO `tmp_docs` VALUES (578,'table','supplier','## Indexes');
INSERT INTO `tmp_docs` VALUES (579,'table','supplier','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (580,'table','supplier','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (581,'table','supplier','| PRIMARY | supplier_code | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (582,'table','warehouse','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (583,'table','warehouse','# Table: warehouse');
INSERT INTO `tmp_docs` VALUES (584,'table','warehouse','');
INSERT INTO `tmp_docs` VALUES (585,'table','warehouse','');
INSERT INTO `tmp_docs` VALUES (586,'table','warehouse','## Properties');
INSERT INTO `tmp_docs` VALUES (587,'table','warehouse','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (588,'table','warehouse','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (589,'table','warehouse','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (590,'table','warehouse','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (591,'table','warehouse','| Row Count | 2 |');
INSERT INTO `tmp_docs` VALUES (592,'table','warehouse','| Average Row Length | 8192 |');
INSERT INTO `tmp_docs` VALUES (593,'table','warehouse','| Index Length | 0 |');
INSERT INTO `tmp_docs` VALUES (594,'table','warehouse','| Created | 2021-09-16 00:45:03 |');
INSERT INTO `tmp_docs` VALUES (595,'table','warehouse','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (596,'table','warehouse','## Columns');
INSERT INTO `tmp_docs` VALUES (597,'table','warehouse','');
INSERT INTO `tmp_docs` VALUES (598,'table','warehouse','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (599,'table','warehouse','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (600,'table','warehouse','| &#128273;  | warehouse_id | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (601,'table','warehouse','|   | name | varchar(50) |  | &#9989; |  |');
INSERT INTO `tmp_docs` VALUES (603,'table','warehouse','');
INSERT INTO `tmp_docs` VALUES (604,'table','warehouse','## Indexes');
INSERT INTO `tmp_docs` VALUES (605,'table','warehouse','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (606,'table','warehouse','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (607,'table','warehouse','| PRIMARY | warehouse_id | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (608,'table','warehouse_bin','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (609,'table','warehouse_bin','# Table: warehouse_bin');
INSERT INTO `tmp_docs` VALUES (610,'table','warehouse_bin','');
INSERT INTO `tmp_docs` VALUES (611,'table','warehouse_bin','');
INSERT INTO `tmp_docs` VALUES (612,'table','warehouse_bin','## Properties');
INSERT INTO `tmp_docs` VALUES (613,'table','warehouse_bin','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (614,'table','warehouse_bin','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (615,'table','warehouse_bin','| Engine | InnoDB |');
INSERT INTO `tmp_docs` VALUES (616,'table','warehouse_bin','| Collation | latin1_swedish_ci |');
INSERT INTO `tmp_docs` VALUES (617,'table','warehouse_bin','| Row Count | 10 |');
INSERT INTO `tmp_docs` VALUES (618,'table','warehouse_bin','| Average Row Length | 1638 |');
INSERT INTO `tmp_docs` VALUES (619,'table','warehouse_bin','| Index Length | 0 |');
INSERT INTO `tmp_docs` VALUES (620,'table','warehouse_bin','| Created | 2021-09-16 00:55:30 |');
INSERT INTO `tmp_docs` VALUES (621,'table','warehouse_bin','| Updated | - |');
INSERT INTO `tmp_docs` VALUES (622,'table','warehouse_bin','## Columns');
INSERT INTO `tmp_docs` VALUES (623,'table','warehouse_bin','');
INSERT INTO `tmp_docs` VALUES (624,'table','warehouse_bin','| Key  | Column | Type        | Default | Nullable | Comment |');
INSERT INTO `tmp_docs` VALUES (625,'table','warehouse_bin','| ---- | ------ | ----------- | ------- | -------- | ------- |');
INSERT INTO `tmp_docs` VALUES (626,'table','warehouse_bin','| &#128273; &#128477; | warehouse_id | int(11) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (627,'table','warehouse_bin','| &#128273;  | bin_id | varchar(10) |  | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (628,'table','warehouse_bin','|   | size | varchar(10) | empty string | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (629,'table','warehouse_bin','');
INSERT INTO `tmp_docs` VALUES (630,'table','warehouse_bin','## Foreign Keys');
INSERT INTO `tmp_docs` VALUES (631,'table','warehouse_bin','| Name | Columns | Update Rule | Delete Rule |');
INSERT INTO `tmp_docs` VALUES (632,'table','warehouse_bin','| ---- | ------- | ----------- | ----------- |');
INSERT INTO `tmp_docs` VALUES (633,'table','warehouse_bin','| warehouse_bin_warehouse_warehouse_id_fk | warehouse_id --> warehouse.warehouse_id | CASCADE | CASCADE |');
INSERT INTO `tmp_docs` VALUES (634,'table','warehouse_bin','');
INSERT INTO `tmp_docs` VALUES (635,'table','warehouse_bin','## Indexes');
INSERT INTO `tmp_docs` VALUES (636,'table','warehouse_bin','| Name | Columns | Unique | Full Text | Comment |');
INSERT INTO `tmp_docs` VALUES (637,'table','warehouse_bin','| ---- | ------- | ------ | --------- | ------- |');
INSERT INTO `tmp_docs` VALUES (638,'table','warehouse_bin','| PRIMARY | warehouse_id, bin_id | &#9989; | &#128683; |  |');
INSERT INTO `tmp_docs` VALUES (639,'view','customer_payments','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (640,'view','customer_payments','# View: customer_payments');
INSERT INTO `tmp_docs` VALUES (641,'view','customer_payments','');
INSERT INTO `tmp_docs` VALUES (642,'view','customer_payments','');
INSERT INTO `tmp_docs` VALUES (643,'view','customer_payments','## Properties');
INSERT INTO `tmp_docs` VALUES (644,'view','customer_payments','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (645,'view','customer_payments','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (646,'view','customer_payments','| Updatable | YES |');
INSERT INTO `tmp_docs` VALUES (647,'view','customer_payments','| Definer | root@% |');
INSERT INTO `tmp_docs` VALUES (648,'view','customer_payments','| Character Set | utf8mb4 |');
INSERT INTO `tmp_docs` VALUES (649,'view','customer_payments','| Collation | utf8mb4_general_ci |');
INSERT INTO `tmp_docs` VALUES (653,'view','customer_payments','## Columns');
INSERT INTO `tmp_docs` VALUES (654,'view','customer_payments','');
INSERT INTO `tmp_docs` VALUES (655,'view','customer_payments','| Column | Type        | Nullable |');
INSERT INTO `tmp_docs` VALUES (656,'view','customer_payments','| ------ | ----------- | -------- | ');
INSERT INTO `tmp_docs` VALUES (657,'view','customer_payments','| customer_name | varchar(50) | &#128683; |');
INSERT INTO `tmp_docs` VALUES (658,'view','customer_payments','| check_number | varchar(50) | &#128683; |');
INSERT INTO `tmp_docs` VALUES (659,'view','customer_payments','| payment_date | date | &#128683; |');
INSERT INTO `tmp_docs` VALUES (660,'view','customer_payments','| amount | decimal(10,2) | &#128683; |');
INSERT INTO `tmp_docs` VALUES (664,'view','customer_payments','## Definition');
INSERT INTO `tmp_docs` VALUES (665,'view','customer_payments','');
INSERT INTO `tmp_docs` VALUES (666,'view','customer_payments','```sql');
INSERT INTO `tmp_docs` VALUES (667,'view','customer_payments','select `sqldoc`.`customer`.`customer_name` AS `customer_name`,`sqldoc`.`payment`.`check_number` AS `check_number`,`sqldoc`.`payment`.`payment_date` AS `payment_date`,`sqldoc`.`payment`.`amount` AS `amount` from (`sqldoc`.`customer` join `sqldoc`.`payment` on((`sqldoc`.`customer`.`customer_number` = `sqldoc`.`payment`.`customer_number`)))');
INSERT INTO `tmp_docs` VALUES (668,'table','customer_payments','```');
INSERT INTO `tmp_docs` VALUES (669,'view','product_product_line','[index.md](index.md)');
INSERT INTO `tmp_docs` VALUES (670,'view','product_product_line','# View: product_product_line');
INSERT INTO `tmp_docs` VALUES (671,'view','product_product_line','');
INSERT INTO `tmp_docs` VALUES (672,'view','product_product_line','');
INSERT INTO `tmp_docs` VALUES (673,'view','product_product_line','## Properties');
INSERT INTO `tmp_docs` VALUES (674,'view','product_product_line','| Property | Value |');
INSERT INTO `tmp_docs` VALUES (675,'view','product_product_line','| ---- | ------- |');
INSERT INTO `tmp_docs` VALUES (676,'view','product_product_line','| Updatable | YES |');
INSERT INTO `tmp_docs` VALUES (677,'view','product_product_line','| Definer | root@% |');
INSERT INTO `tmp_docs` VALUES (678,'view','product_product_line','| Character Set | utf8mb4 |');
INSERT INTO `tmp_docs` VALUES (679,'view','product_product_line','| Collation | utf8mb4_general_ci |');
INSERT INTO `tmp_docs` VALUES (683,'view','product_product_line','## Columns');
INSERT INTO `tmp_docs` VALUES (684,'view','product_product_line','');
INSERT INTO `tmp_docs` VALUES (685,'view','product_product_line','| Column | Type        | Nullable |');
INSERT INTO `tmp_docs` VALUES (686,'view','product_product_line','| ------ | ----------- | -------- | ');
INSERT INTO `tmp_docs` VALUES (687,'view','product_product_line','| sku | varchar(15) | &#128683; |');
INSERT INTO `tmp_docs` VALUES (688,'view','product_product_line','| description | text | &#128683; |');
INSERT INTO `tmp_docs` VALUES (689,'view','product_product_line','| product_line | varchar(50) | &#128683; |');
INSERT INTO `tmp_docs` VALUES (690,'view','product_product_line','| text_description | varchar(4000) | &#128683; |');
INSERT INTO `tmp_docs` VALUES (694,'view','product_product_line','## Definition');
INSERT INTO `tmp_docs` VALUES (695,'view','product_product_line','');
INSERT INTO `tmp_docs` VALUES (696,'view','product_product_line','```sql');
INSERT INTO `tmp_docs` VALUES (697,'view','product_product_line','select `p`.`sku` AS `sku`,`p`.`description` AS `description`,`pl`.`product_line` AS `product_line`,`pl`.`text_description` AS `text_description` from (`sqldoc`.`product` `p` join `sqldoc`.`product_line` `pl` on((`p`.`product_line` = `pl`.`product_line`)))');
INSERT INTO `tmp_docs` VALUES (698,'table','product_product_line','```');
/*!40000 ALTER TABLE `tmp_docs` ENABLE KEYS */;

--
-- Table structure for table `warehouse`
--

DROP TABLE IF EXISTS `warehouse`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse` (
  `warehouse_id` int(11) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`warehouse_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse`
--

/*!40000 ALTER TABLE `warehouse` DISABLE KEYS */;
INSERT INTO `warehouse` VALUES (1,'Warehouse 1');
INSERT INTO `warehouse` VALUES (2,'East End Warehouse');
INSERT INTO `warehouse` VALUES (3,'22nd Street Warehouse');
/*!40000 ALTER TABLE `warehouse` ENABLE KEYS */;

--
-- Table structure for table `warehouse_bin`
--

DROP TABLE IF EXISTS `warehouse_bin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `warehouse_bin` (
  `warehouse_id` int(11) NOT NULL,
  `bin_id` varchar(10) NOT NULL,
  `size` varchar(10) NOT NULL DEFAULT '',
  PRIMARY KEY (`warehouse_id`,`bin_id`),
  CONSTRAINT `warehouse_bin_warehouse_warehouse_id_fk` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouse` (`warehouse_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `warehouse_bin`
--

/*!40000 ALTER TABLE `warehouse_bin` DISABLE KEYS */;
INSERT INTO `warehouse_bin` VALUES (1,'1','small');
INSERT INTO `warehouse_bin` VALUES (1,'2','small');
INSERT INTO `warehouse_bin` VALUES (1,'3','large');
INSERT INTO `warehouse_bin` VALUES (2,'1','medium');
INSERT INTO `warehouse_bin` VALUES (2,'2a','small');
INSERT INTO `warehouse_bin` VALUES (2,'2b','small');
INSERT INTO `warehouse_bin` VALUES (2,'c','large');
INSERT INTO `warehouse_bin` VALUES (3,'1','large');
INSERT INTO `warehouse_bin` VALUES (3,'2','large');
INSERT INTO `warehouse_bin` VALUES (3,'3','large');
/*!40000 ALTER TABLE `warehouse_bin` ENABLE KEYS */;

--
-- Dumping routines for database 'sqldoc'
--
/*!50003 DROP FUNCTION IF EXISTS `CustomerLevel` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` FUNCTION `CustomerLevel`(credit decimal(10, 2)) RETURNS varchar(20) CHARSET latin1
    DETERMINISTIC
begin
    declare customerLevel VARCHAR(20);

    if credit > 50000 then
        set customerLevel = 'PLATINUM';
    elseif (credit >= 10000 and credit <= 50000) then
        set customerLevel = 'GOLD';
    elseif credit < 10000 then
        set customerLevel = 'SILVER';
    end if;
    -- return the customer level
    return (customerLevel);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetCustomerShipping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetCustomerShipping`(in pCustomerNUmber int, out pShipping varchar(50))
    COMMENT 'Returns the shipping length of a particular customer.'
BEGIN
    DECLARE customerCountry VARCHAR(100);

SELECT
    country
INTO customerCountry FROM
    customer
WHERE
    customer_number = pCustomerNUmber;

    CASE customerCountry
		WHEN  'USA' THEN
		   SET pShipping = '2-day Shipping';
		WHEN 'Canada' THEN
		   SET pShipping = '3-day Shipping';
		ELSE
		   SET pShipping = '5-day Shipping';
	END CASE;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GetTotalOrder` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `GetTotalOrder`()
BEGIN
	DECLARE totalOrder INT DEFAULT 0;

    SELECT COUNT(*)
    INTO totalOrder
    FROM `order`;

    SELECT totalOrder;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_export` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_export`()
begin
    table_block:
    begin
        declare table_cursor_finished INT default 0;
        declare tname varchar(64);

        declare table_cursor cursor for select table_name
                                        from information_schema.tables
                                        where table_schema = database()
                                          and table_type = 'BASE TABLE'
                                          and table_name not in ('tmp_docs', 'tmp_table');

        declare continue handler for not found set table_cursor_finished = 1;

        select line
        from tmp_docs
        where type = 'toc'
          and name = 'toc'
        order by id
        into outfile '/var/lib/mysql-files/index.md' lines terminated by '\n';

        open table_cursor;

        tableloop:
        loop
            fetch table_cursor into tname;
            if table_cursor_finished = 1 then leave tableloop; end if;

            set @out_text = concat('select line from tmp_docs where type = \'table\' and name = \'', tname,
                                   '\' order by id into outfile \'/var/lib/mysql-files/table_', tname, '.md\'',
                                   ' lines terminated by \'\n\'');

            prepare s1 from @out_text;
            execute s1;
            drop prepare s1;

        end loop tableloop;
        close table_cursor;
    end table_block;

    view_block:
    begin

        declare view_cursor_finished INT default 0;
        declare vname varchar(64);

        declare view_cursor cursor for select table_name
                                       from information_schema.TABLES
                                       where table_schema = database() and table_type = 'view';
        declare continue handler for not found set view_cursor_finished = 1;

        open view_cursor;

        viewloop:
        loop
            fetch view_cursor into vname;
            if view_cursor_finished = 1 then leave viewloop; end if;


            set @out_text2 = concat('select line from tmp_docs where type = \'view\' and name = \'', vname,
                                    '\' order by id into outfile \'/var/lib/mysql-files/view_', vname, '.md\'',
                                    ' lines terminated by \'\n\'');

            prepare s2 from @out_text2;
            execute s2;
            drop prepare s2;

        end loop viewloop;
        close view_cursor;
    end view_block;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_foreign_keys` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_foreign_keys`(
    in tname varchar(200)
)
begin
    declare foreign_key_count int;

    set foreign_key_count = ( select count(*)
                              from information_schema.TABLE_CONSTRAINTS
                              where CONSTRAINT_TYPE = 'FOREIGN KEY'
                                and table_schema = database()
                                and table_name = tname );

    if foreign_key_count > 0 then
        call sqldoc_line('table', tname, '');

        call sqldoc_line('table', tname, '## Foreign Keys');
        call sqldoc_line('table', tname, '| Name | Columns | Update Rule | Delete Rule |');
        call sqldoc_line('table', tname, '| ---- | ------- | ----------- | ----------- |');

        insert into tmp_docs (type, name, line)
        select 'table',
               tname,
               concat('| ', tc.constraint_name, ' | ', group_concat(
                       concat(k.column_name, ' --> ', k.REFERENCED_TABLE_NAME, '.', k.REFERENCED_COLUMN_NAME) separator
                       ', '), ' | ', rc.update_rule, ' | ', rc.delete_rule, ' |')
        from information_schema.TABLE_CONSTRAINTS tc
                 join information_schema.KEY_COLUMN_USAGE k on tc.CONSTRAINT_NAME = k.CONSTRAINT_NAME
                 join information_schema.REFERENTIAL_CONSTRAINTS rc
                      on tc.CONSTRAINT_SCHEMA = rc.CONSTRAINT_SCHEMA and tc.CONSTRAINT_NAME = rc.CONSTRAINT_NAME
        where tc.TABLE_SCHEMA = database()
          and tc.TABLE_NAME = tname
          and CONSTRAINT_TYPE = 'FOREIGN KEY'
        group by tc.constraint_name, k.TABLE_NAME, rc.UPDATE_RULE, rc.DELETE_RULE;

    end if;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_indexes` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_indexes`(
    in tname varchar(200)
)
begin

    declare indexcount int;

    set indexcount = ( select count(*)
                       from information_schema.STATISTICS
                       where table_schema = database() and table_name = tname );

    if indexcount > 0 then

        call sqldoc_line('table', tname, '');

        call sqldoc_line('table', tname, '## Indexes');
        call sqldoc_line('table', tname, '| Name | Columns | Unique | Full Text | Comment |');
        call sqldoc_line('table', tname, '| ---- | ------- | ------ | --------- | ------- |');

        insert into tmp_docs (type, name, line)
        select 'table',
               tname,
               concat('| ', index_name, ' | ', group_concat(distinct column_name order by seq_in_index separator ', '),
                      ' | ', if(NON_UNIQUE = 1, '&#128683;', '&#9989;'), ' | ',
                      if(INDEX_TYPE = 'FULLTEXT', '&#9989;', '&#128683;'), ' | ', index_comment, ' |')
        from information_schema.STATISTICS
        where TABLE_SCHEMA = database()
          and TABLE_NAME = tname
        group by index_name, NON_UNIQUE, INDEX_TYPE, INDEX_COMMENT
        order by NON_UNIQUE, index_name;

    end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_line` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_line`(
in type varchar(100),
in name varchar(200),
in line varchar(4000)
)
begin
    insert into tmp_docs (type, name, line) values (type, name, line);
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_main` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_main`(
    in export boolean,
    in diagrams boolean
)
begin

    drop table if exists tmp_docs;

    create table tmp_docs
    (
        id   int auto_increment,
        type varchar(100) not null         default 'toc',
        name varchar(200) not null         default 'toc',
        line varchar(4000) charset utf8mb4 default '' null,
        constraint tmp_docs_pk primary key (id)
    );

    drop table if exists tmp_table;

    create table tmp_table
    (
        id         int         not null default 1,
        table_name varchar(64) not null default ''
    );

    call sqldoc_toc();
    call sqldoc_tables(diagrams);
    call sqldoc_views();

    if (export = true) then call sqldoc_export(); end if;

    -- drop table if exists tmp_docs;
    drop table if exists tmp_table;
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_mermaid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_mermaid`(
    in tname varchar(200)
)
begin
    declare keycount boolean;
    declare mermaid_cursor_done int default 0;
    declare fk_table varchar(64);
    declare mermaid_cursor cursor for select table_name as fk_table
                                      from tmp_table
                                      where id = 1
                                      union
                                      select REFERENCED_TABLE_NAME as fk_table
                                      from information_schema.KEY_COLUMN_USAGE k
                                               join tmp_table tt on k.TABLE_NAME = tt.table_name
                                      where CONSTRAINT_SCHEMA = database()
                                        and REFERENCED_TABLE_NAME is not null
                                      union
                                      select k.TABLE_NAME as fk_table
                                      from information_schema.KEY_COLUMN_USAGE k
                                               join tmp_table tt2 on k.REFERENCED_TABLE_NAME = tt2.table_name
                                      where CONSTRAINT_SCHEMA = database()
                                        and REFERENCED_TABLE_NAME is not null;
    declare continue handler for not found set mermaid_cursor_done = true;

    set keycount = ( select count(*)
                     from information_schema.KEY_COLUMN_USAGE
                     where table_schema = 'sqldoc' and TABLE_NAME = tname and REFERENCED_TABLE_NAME is not null and
                           table_name = tname
                        or REFERENCED_TABLE_NAME = tname );

    call sqldoc_line('table', tname, '```mermaid');
    call sqldoc_line('table', tname,
                     '%%{init: {\'theme\': \'base\', \'themeVariables\': {\'darkMode\': false, \'mainBkg\': \'#cfc\',\'primaryBorderColor\': \'#696\',\'primaryTextColor\': \'#353\',\'lineColor\': \'#787\'}}}%%');

    call sqldoc_line('table', tname, '   erDiagram');
    if keycount = 0 then
        call sqldoc_line('table', tname, concat('   ', tname));
        call sqldoc_line('table', tname, concat('   ', tname, '   {'));

        insert into tmp_docs (type, name, line)
        select 'table', tname, concat('      ', DATA_TYPE, ' ', COLUMN_NAME)
        from information_schema.COLUMNS
        where TABLE_SCHEMA = database()
          and TABLE_NAME = tname
        order by ORDINAL_POSITION;

        call sqldoc_line('table', tname, '   }');
    else
        insert into tmp_docs (type, name, line)
        select 'table', tname, concat(table_name, ' }|--|| ', REFERENCED_TABLE_NAME, ' : ""')
        from information_schema.KEY_COLUMN_USAGE
        where table_schema = database()
          and REFERENCED_TABLE_NAME is not null
          and (table_name = tname or REFERENCED_TABLE_NAME = tname);

        open mermaid_cursor;
        mermaid_loop:
        loop
            fetch mermaid_cursor into fk_table;
            if mermaid_cursor_done = 1 then leave mermaid_loop; end if;

            call sqldoc_line('table', tname, fk_table);
            call sqldoc_line('table', tname, concat(fk_table, ' {'));

            insert into tmp_docs (type, name, line)
            select 'table', tname, concat('      ', DATA_TYPE, ' ', COLUMN_NAME)
            from information_schema.COLUMNS
            where TABLE_SCHEMA = database()
              and TABLE_NAME = fk_table
            order by ORDINAL_POSITION;

            call sqldoc_line('table', tname, '}');
        end loop mermaid_loop;
        close mermaid_cursor;
    end if;
    call sqldoc_line('table', tname, '```');
end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_tables` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_tables`(
    in diagrams boolean
)
begin

    declare table_cursor_finished int default 0;
    declare tname varchar(64);
    declare tcomment varchar(2048);

    declare table_cursor cursor for select table_name, table_comment
                                    from information_schema.tables
                                    where table_schema = database()
                                      and table_type = 'BASE TABLE'
                                      and table_name not in ('tmp_docs', 'tmp_table');

    declare continue handler for not found set table_cursor_finished = 1;

    open table_cursor;

    tableloop:
    loop
        fetch table_cursor into tname, tcomment;
        if table_cursor_finished = 1 then leave tableloop; end if;

        call sqldoc_line('table', tname, '[index.md](index.md)');
        call sqldoc_line('table', tname, concat('# Table: ', tname));

        if tcomment <> '' then call sqldoc_line('table', tname, tcomment); end if;

        if diagrams = 1 then
            delete from tmp_table;
            insert into tmp_table (id, table_name) values (1, tname);
            -- diagram
            call sqldoc_mermaid(tname);
        end if;

        call sqldoc_line('table', tname, '');

        -- properties
        call sqldoc_table_properties(tname);

        -- columns
        call sqldoc_line('table', tname, '## Columns');
        call sqldoc_line('table', tname, '');

        call sqldoc_line('table', tname, '| Key  | Column | Type        | Default | Nullable | Comment |');
        call sqldoc_line('table', tname, '| ---- | ------ | ----------- | ------- | -------- | ------- |');

        insert into tmp_docs (type, name, line)
        select 'table'                                                                                 as type,
               tname                                                                                   as name,
               concat('| ', ifnull(( select if(kc.ORDINAL_POSITION is null, '', '&#128273;')
                                     from information_schema.KEY_COLUMN_USAGE kc
                                     where c.TABLE_SCHEMA = kc.TABLE_SCHEMA
                                       and c.TABLE_NAME = kc.TABLE_NAME
                                       and c.COLUMN_NAME = kc.COLUMN_NAME
                                       and kc.CONSTRAINT_NAME = 'PRIMARY' ), ''), ' ',
                      ifnull(( select distinct if(kc.COLUMN_NAME is null, '', '&#128477;')
                               from information_schema.KEY_COLUMN_USAGE kc
                               where c.TABLE_SCHEMA = kc.TABLE_SCHEMA
                                 and c.TABLE_NAME = kc.TABLE_NAME
                                 and c.COLUMN_NAME = kc.COLUMN_NAME
                                 and kc.referenced_table_schema <> 'null'
                                 and kc.CONSTRAINT_NAME <> 'PRIMARY' ), ''), ' | ', c.column_name, ' | ', c.column_type,
                      ' | ', if(c.column_default = '', 'empty string', ifnull(c.column_default, '')), ' | ',
                      if(c.is_nullable = 'NO', '&#128683;', '&#9989;'), ' | ', c.column_comment, ' |') as line
        from information_schema.COLUMNS c
        where c.TABLE_SCHEMA = database()
          and c.TABLE_NAME = tname
        order by c.ORDINAL_POSITION;

        -- foreign keys
        call sqldoc_foreign_keys(tname);

        -- indexes
        call sqldoc_indexes(tname);

        -- triggers
        call sqldoc_triggers(tname);


    end loop tableloop;
    close table_cursor;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_table_properties` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_table_properties`(
    in tname varchar(64)
)
begin

    call sqldoc_line('table', tname, '');

    call sqldoc_line('table', tname, '## Properties');
    call sqldoc_line('table', tname, '| Property | Value |');
    call sqldoc_line('table', tname, '| ---- | ------- |');

    insert into tmp_docs (type, name, line)
    select 'table', tname, concat('| Engine | ', engine, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Collation | ', TABLE_COLLATION, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Row Count | ', table_rows, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Average Row Length | ', AVG_ROW_LENGTH, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Index Length | ', INDEX_LENGTH, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Created | ', CREATE_TIME, ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname
    union
    select 'table', tname, concat('| Updated | ', ifnull(UPDATE_TIME,'-'), ' |') as line
    from information_schema.TABLES
    where TABLE_SCHEMA = database()
      and TABLE_NAME = tname;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_toc` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_toc`()
begin

    call sqldoc_line('toc', 'toc', concat('# DATABASE', database()));
    call sqldoc_line('toc', 'toc', '__Data Dictionary__');
    call sqldoc_line('toc', 'toc', '## Table of Contents');
    call sqldoc_line('toc', 'toc', '### Tables');
    call sqldoc_line('toc', 'toc', '| Name | Comment | Row Count|');
    call sqldoc_line('toc', 'toc', '| ---- | ------- | ---------: |');

    insert into tmp_docs (type, name, line)
    select 'toc',
           'toc',
           concat('| [', table_name, '](table_', table_name, '.md) | ', table_comment, ' | ', table_rows, ' |')
    from information_schema.tables
    where table_schema = database()
      and table_type = 'BASE TABLE'
      and table_name not in ('tmp_docs', 'tmp_table');

    -- views
    call sqldoc_line('toc', 'toc', '### Views ');
    call sqldoc_line('toc', 'toc', '| Name | Updatable | Definer |');
    call sqldoc_line('toc', 'toc', '| ---- |:---------:| ------- |');

    insert into tmp_docs (type, name, line)
    select 'toc',
           'toc',
           concat('| [', t.TABLE_NAME, '](view_', t.table_name, '.md) | ',
if(v.IS_UPDATABLE = 'YES', '&#9989;', '&#128683;'), ' | ', v.DEFINER, ' |')
    from information_schema.TABLES t
    join
         information_schema.VIEWS v on t.TABLE_SCHEMA = v.TABLE_SCHEMA and t.TABLE_NAME = v.TABLE_NAME
    where t.table_schema = database()
      and table_type = 'VIEW';

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_triggers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_triggers`(
    in tname varchar(64)
)
begin
    declare v_trigger_cursor_finished int default 0;
    declare v_trigger_name varchar(64);
    declare v_event_manipulation, v_action_timing varchar(6);
    declare v_action_statement longtext;
    declare v_created datetime(2);
    declare v_definer varchar(93);
    declare v_character_set_client, v_collation_connection varchar(32);
    declare trigger_count int;

    declare trigger_cursor cursor for select TRIGGER_NAME,
                                             ACTION_TIMING,
                                             EVENT_MANIPULATION,
                                             DEFINER,
                                             CHARACTER_SET_CLIENT,
                                             COLLATION_CONNECTION,
                                             CREATED,
                                             ACTION_STATEMENT
                                      from information_schema.triggers
                                      where EVENT_OBJECT_SCHEMA = database()
                                        and EVENT_OBJECT_TABLE = tname;

    declare continue handler for not found set v_trigger_cursor_finished = 1;

    set trigger_count = ( select count(*)
                          from information_schema.triggers
                          where EVENT_OBJECT_SCHEMA = database() and EVENT_OBJECT_TABLE = tname
    );

    if trigger_count > 0 then

    call sqldoc_line('table', tname, '');
    call sqldoc_line('table', tname, '## Triggers');

    open trigger_cursor;

    triggerloop:
    loop

        fetch trigger_cursor into v_trigger_name, v_action_timing, v_event_manipulation, v_definer, v_character_set_client, v_collation_connection, v_created, v_action_statement;
        if v_trigger_cursor_finished = 1 then leave triggerloop; end if;

        call sqldoc_line('table', tname, concat('### ', v_trigger_name));

        call sqldoc_line('table', tname, '| Timing | Event | Definer | Character Set | Collation | Created |');
        call sqldoc_line('table', tname, '| ------ | ----- | ------- | ------------- | --------- | ------- |');

        insert into tmp_docs (type, name, line)
        select 'table',
               tname,
               concat('| ', v_action_timing, ' | ', v_event_manipulation, ' | ', v_definer, ' | ',
                      v_character_set_client, ' | ', v_collation_connection, ' | ', v_created, ' |');

        call sqldoc_line('table', tname, '');
        call sqldoc_line('table', tname, '```sql');
        call sqldoc_line('table', tname, replace(v_action_statement, '\n', '\r'));
        call sqldoc_line('table', tname, '```');

    end loop triggerloop;
    close trigger_cursor;

    end if;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_views` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_views`()
begin

    declare view_cursor_finished int default 0;
    declare vname varchar(64);
    declare v_body longtext;

    declare view_cursor cursor for select t.table_name, v.VIEW_DEFINITION
                                   from information_schema.tables t
                                            join information_schema.VIEWS v
                                                 on t.TABLE_SCHEMA = v.TABLE_SCHEMA and t.TABLE_NAME = v.TABLE_NAME
                                   where table_type = 'VIEW'
                                     and t.TABLE_SCHEMA = database();

    declare continue handler for not found set view_cursor_finished = 1;

    open view_cursor;

    viewloop:
    loop
        fetch view_cursor into vname, v_body;
        if view_cursor_finished = 1 then leave viewloop; end if;

        call sqldoc_line('view', vname, '[index.md](index.md)');
        call sqldoc_line('view', vname, concat('# View: ', vname));

        call sqldoc_line('view', vname, '');

        -- properties
        call sqldoc_view_properties(vname);

        -- columns
        call sqldoc_line('view', vname, '## Columns');
        call sqldoc_line('view', vname, '');

        call sqldoc_line('view', vname, '| Column | Type        | Nullable |');
        call sqldoc_line('view', vname, '| ------ | ----------- | -------- | ');

        insert into tmp_docs (type, name, line)
        select 'view'                                                         as type,
               vname                                                          as name,
               concat('| ', c.column_name, ' | ', c.column_type, ' | ',
                      if(c.is_nullable = 'NO', '&#128683;', '&#9989;'), ' |') as line
        from information_schema.COLUMNS c
        where c.TABLE_SCHEMA = database()
          and c.TABLE_NAME = vname
        order by c.ORDINAL_POSITION;

        call sqldoc_line('view', vname, '## Definition');

        call sqldoc_line('view', vname, '');
        call sqldoc_line('view', vname, '```sql');
        call sqldoc_line('view', vname, replace(v_body, '\n', '\r'));
        call sqldoc_line('table', vname, '```');

    end loop viewloop;
    close view_cursor;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sqldoc_view_properties` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`%` PROCEDURE `sqldoc_view_properties`(
    in vname varchar(64)
)
begin

    call sqldoc_line('view', vname, '');

    call sqldoc_line('view', vname, '## Properties');
    call sqldoc_line('view', vname, '| Property | Value |');
    call sqldoc_line('view', vname, '| ---- | ------- |');

    insert into tmp_docs (type, name, line)
    select 'view', vname, concat('| Updatable | ', IS_UPDATABLE, ' |') as line
    from information_schema.VIEWS
    where TABLE_SCHEMA = database()
      and TABLE_NAME = vname
    union
    select 'view', vname, concat('| Definer | ', DEFINER, ' |') as line
    from information_schema.VIEWS
    where TABLE_SCHEMA = database()
      and TABLE_NAME = vname
    union
    select 'view', vname, concat('| Character Set | ', CHARACTER_SET_CLIENT, ' |') as line
    from information_schema.VIEWS
    where TABLE_SCHEMA = database()
      and TABLE_NAME = vname
    union
    select 'view', vname, concat('| Collation | ', COLLATION_CONNECTION, ' |') as line
    from information_schema.VIEWS
    where TABLE_SCHEMA = database()
      and TABLE_NAME = vname;

end ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `customer_payments`
--

/*!50001 DROP VIEW IF EXISTS `customer_payments`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `customer_payments` AS select `customer`.`customer_name` AS `customer_name`,`payment`.`check_number` AS `check_number`,`payment`.`payment_date` AS `payment_date`,`payment`.`amount` AS `amount` from (`customer` join `payment` on((`customer`.`customer_number` = `payment`.`customer_number`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_product_line`
--

/*!50001 DROP VIEW IF EXISTS `product_product_line`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `product_product_line` AS select `p`.`sku` AS `sku`,`p`.`description` AS `description`,`pl`.`product_line` AS `product_line`,`pl`.`text_description` AS `text_description` from (`product` `p` join `product_line` `pl` on((`p`.`product_line` = `pl`.`product_line`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-09-25 15:35:48
