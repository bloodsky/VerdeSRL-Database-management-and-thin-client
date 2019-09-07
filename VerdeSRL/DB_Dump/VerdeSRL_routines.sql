-- MariaDB dump 10.17  Distrib 10.4.6-MariaDB, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: VerdeSRL
-- ------------------------------------------------------
-- Server version	10.4.6-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping routines for database 'VerdeSRL'
--
/*!50003 DROP FUNCTION IF EXISTS `p1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `p1`() RETURNS int(11)
    NO SQL
    DETERMINISTIC
return @p1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `p2` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `p2`() RETURNS int(11)
    NO SQL
    DETERMINISTIC
return @p2 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `u1` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `u1`() RETURNS int(11)
    NO SQL
    DETERMINISTIC
return @u1 ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `modify_addr` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `modify_addr`(IN codice_cliente INT, IN new_addr VARCHAR(50),OUT success BOOL)
BEGIN
	START TRANSACTION;
        UPDATE Indirizzi SET IndSpedizione = new_addr where CodiceCliente = codice_cliente;
		SET success = TRUE;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `move_plant` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `move_plant`(IN codice_pacco INT, IN codice_pianta INT, OUT success BOOL)
BEGIN
	
    DECLARE quantity INT;
    DECLARE inP INT;
    DECLARE outP INT;
    
	START TRANSACTION;
		
        SELECT Quantità INTO quantity FROM Pacchi WHERE CodicePacco = codice_pacco;
		SELECT COUNT(*) AS goin_plant INTO outP FROM PianteDaInserire WHERE CodicePacco = codice_pacco AND CodPianta = codice_pianta FOR UPDATE;    
		SELECT COUNT(*) AS in_plant INTO inP FROM PianteContenute WHERE CodicePacco = codice_pacco AND CodPianta = codice_pianta FOR UPDATE;
		
        IF quantity - inP >= 1 THEN 
			DELETE FROM PianteDaInserire WHERE CodicePacco = codice_pacco AND CodPianta = codice_pianta LIMIT 1; 
			INSERT INTO PianteContenute (CodPianta, CodicePacco) VALUES (codice_pianta, codice_pacco);
			SET success = TRUE;
		ELSE 
			SET success = FALSE;
		END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_price` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,ERROR_FOR_DIVISION_BY_ZERO,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_price`(IN amount NUMERIC(10,2),IN codice_pianta INT, OUT success BOOL)
BEGIN
	START TRANSACTION;
        IF amount > 2.0 THEN
			UPDATE Listino SET Prezzo = amount, Inizio=now(),Fine = NULL where CodicePianta=codice_pianta;
            SET success = TRUE;
		ELSE
			SET success = FALSE;
		END IF;
    COMMIT;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary table structure for view `insert_piante`
--

DROP TABLE IF EXISTS `insert_piante`;
/*!50001 DROP VIEW IF EXISTS `insert_piante`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `insert_piante` (
  `CodPianta` tinyint NOT NULL,
  `NomeComune` tinyint NOT NULL,
  `NomeLatino` tinyint NOT NULL,
  `Count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `listino_prezzi`
--

DROP TABLE IF EXISTS `listino_prezzi`;
/*!50001 DROP VIEW IF EXISTS `listino_prezzi`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `listino_prezzi` (
  `Prezzo` tinyint NOT NULL,
  `NomeComune` tinyint NOT NULL,
  `NomeLatino` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `inside_piante`
--

DROP TABLE IF EXISTS `inside_piante`;
/*!50001 DROP VIEW IF EXISTS `inside_piante`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `inside_piante` (
  `CodPianta` tinyint NOT NULL,
  `NomeComune` tinyint NOT NULL,
  `NomeLatino` tinyint NOT NULL,
  `Count` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `stock_client`
--

DROP TABLE IF EXISTS `stock_client`;
/*!50001 DROP VIEW IF EXISTS `stock_client`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `stock_client` (
  `PIva` tinyint NOT NULL,
  `NomeRef` tinyint NOT NULL,
  `CognomeRef` tinyint NOT NULL,
  `MezzoDiComunicazioneRef` tinyint NOT NULL,
  `Nome` tinyint NOT NULL,
  `MezzoPreferito` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `update_price_plant`
--

DROP TABLE IF EXISTS `update_price_plant`;
/*!50001 DROP VIEW IF EXISTS `update_price_plant`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `update_price_plant` (
  `Inizio` tinyint NOT NULL,
  `Fine` tinyint NOT NULL,
  `Prezzo` tinyint NOT NULL,
  `NomeComune` tinyint NOT NULL,
  `NomeLatino` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `private_client`
--

DROP TABLE IF EXISTS `private_client`;
/*!50001 DROP VIEW IF EXISTS `private_client`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `private_client` (
  `CodiceFiscale` tinyint NOT NULL,
  `Nome` tinyint NOT NULL,
  `MezzoPreferito` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `contact_and_address`
--

DROP TABLE IF EXISTS `contact_and_address`;
/*!50001 DROP VIEW IF EXISTS `contact_and_address`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `contact_and_address` (
  `Contatto` tinyint NOT NULL,
  `Nome` tinyint NOT NULL,
  `CodiceCliente` tinyint NOT NULL,
  `IndFatturazione` tinyint NOT NULL,
  `IndResidenza` tinyint NOT NULL,
  `IndSpedizione` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `fornitori_piante`
--

DROP TABLE IF EXISTS `fornitori_piante`;
/*!50001 DROP VIEW IF EXISTS `fornitori_piante`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE TABLE `fornitori_piante` (
  `Nome` tinyint NOT NULL,
  `Indirizzo` tinyint NOT NULL,
  `NomeComune` tinyint NOT NULL,
  `NomeLatino` tinyint NOT NULL
) ENGINE=MyISAM */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `insert_piante`
--

/*!50001 DROP TABLE IF EXISTS `insert_piante`*/;
/*!50001 DROP VIEW IF EXISTS `insert_piante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `insert_piante` AS select `pi`.`CodPianta` AS `CodPianta`,`p`.`NomeComune` AS `NomeComune`,`p`.`NomeLatino` AS `NomeLatino`,count(0) AS `Count` from (`PianteDaInserire` `pi` join `Piante` `p` on(`pi`.`CodPianta` = `p`.`CodicePianta`)) where `pi`.`CodicePacco` = `p1`() group by `pi`.`CodPianta`,`p`.`NomeComune`,`p`.`NomeLatino` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `listino_prezzi`
--

/*!50001 DROP TABLE IF EXISTS `listino_prezzi`*/;
/*!50001 DROP VIEW IF EXISTS `listino_prezzi`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `listino_prezzi` AS select `l`.`Prezzo` AS `Prezzo`,`p`.`NomeComune` AS `NomeComune`,`p`.`NomeLatino` AS `NomeLatino` from (`Listino` `l` join `Piante` `p` on(`l`.`CodicePianta` = `p`.`CodicePianta`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inside_piante`
--

/*!50001 DROP TABLE IF EXISTS `inside_piante`*/;
/*!50001 DROP VIEW IF EXISTS `inside_piante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inside_piante` AS select `pc`.`CodPianta` AS `CodPianta`,`p`.`NomeComune` AS `NomeComune`,`p`.`NomeLatino` AS `NomeLatino`,count(0) AS `Count` from (`PianteContenute` `pc` join `Piante` `p` on(`pc`.`CodPianta` = `p`.`CodicePianta`)) where `pc`.`CodicePacco` = `p2`() group by `pc`.`CodPianta`,`p`.`NomeComune`,`p`.`NomeLatino` order by count(0) desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `stock_client`
--

/*!50001 DROP TABLE IF EXISTS `stock_client`*/;
/*!50001 DROP VIEW IF EXISTS `stock_client`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `stock_client` AS select `r`.`PIva` AS `PIva`,`r`.`NomeRef` AS `NomeRef`,`r`.`CognomeRef` AS `CognomeRef`,`r`.`MezzoDiComunicazioneRef` AS `MezzoDiComunicazioneRef`,`c`.`Nome` AS `Nome`,`c`.`MezzoPreferito` AS `MezzoPreferito` from (`Rivenditori` `r` join `Clienti` `c` on(`r`.`CodiceCliente` = `c`.`CodiceCliente`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `update_price_plant`
--

/*!50001 DROP TABLE IF EXISTS `update_price_plant`*/;
/*!50001 DROP VIEW IF EXISTS `update_price_plant`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `update_price_plant` AS select `l`.`Inizio` AS `Inizio`,`l`.`Fine` AS `Fine`,`l`.`Prezzo` AS `Prezzo`,`p`.`NomeComune` AS `NomeComune`,`p`.`NomeLatino` AS `NomeLatino` from (`Listino` `l` join `Piante` `p` on(`l`.`CodicePianta` = `p`.`CodicePianta`)) where `l`.`CodicePianta` = `u1`() */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `private_client`
--

/*!50001 DROP TABLE IF EXISTS `private_client`*/;
/*!50001 DROP VIEW IF EXISTS `private_client`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `private_client` AS select `p`.`CodiceFiscale` AS `CodiceFiscale`,`c`.`Nome` AS `Nome`,`c`.`MezzoPreferito` AS `MezzoPreferito` from (`Privati` `p` join `Clienti` `c` on(`p`.`CodiceCliente` = `c`.`CodiceCliente`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `contact_and_address`
--

/*!50001 DROP TABLE IF EXISTS `contact_and_address`*/;
/*!50001 DROP VIEW IF EXISTS `contact_and_address`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `contact_and_address` AS select `ct`.`Contatto` AS `Contatto`,`cl`.`Nome` AS `Nome`,`ct`.`CodiceCliente` AS `CodiceCliente`,`i`.`IndFatturazione` AS `IndFatturazione`,`i`.`IndResidenza` AS `IndResidenza`,`i`.`IndSpedizione` AS `IndSpedizione` from ((`Contatti` `ct` join `Clienti` `cl` on(`ct`.`CodiceCliente` = `cl`.`CodiceCliente`)) join `Indirizzi` `i` on(`i`.`CodiceCliente` = `ct`.`CodiceCliente`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fornitori_piante`
--

/*!50001 DROP TABLE IF EXISTS `fornitori_piante`*/;
/*!50001 DROP VIEW IF EXISTS `fornitori_piante`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=MERGE */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fornitori_piante` AS select `f`.`Nome` AS `Nome`,`f`.`Indirizzo` AS `Indirizzo`,`p`.`NomeComune` AS `NomeComune`,`p`.`NomeLatino` AS `NomeLatino` from (`Fornitori` `f` join `Piante` `p` on(`f`.`CodiceFornitori` = `p`.`CodFornitore`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Dumping events for database 'VerdeSRL'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-26 15:49:44
