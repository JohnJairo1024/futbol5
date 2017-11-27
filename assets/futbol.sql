/*
Navicat MySQL Data Transfer

Source Server         : Mysql
Source Server Version : 50711
Source Host           : localhost:3306
Source Database       : futbol

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2017-11-26 20:53:09
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for butacas
-- ----------------------------
DROP TABLE IF EXISTS `butacas`;
CREATE TABLE `butacas` (
  `IdButaca` int(11) NOT NULL AUTO_INCREMENT,
  `IdFuncion` int(11) NOT NULL,
  `Fila` int(11) DEFAULT NULL,
  `Columna` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdButaca`,`IdFuncion`),
  KEY `IdFuncion` (`IdFuncion`),
  CONSTRAINT `butacas_ibfk_1` FOREIGN KEY (`IdFuncion`) REFERENCES `funciones` (`IdFuncion`)
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of butacas
-- ----------------------------
INSERT INTO `butacas` VALUES ('39', '26', '1', '1', '0');
INSERT INTO `butacas` VALUES ('40', '26', '2', '2', '0');
INSERT INTO `butacas` VALUES ('41', '26', '3', '3', '0');
INSERT INTO `butacas` VALUES ('42', '26', '4', '4', '0');
INSERT INTO `butacas` VALUES ('43', '26', '5', '5', '0');
INSERT INTO `butacas` VALUES ('44', '27', '1', '1', '0');
INSERT INTO `butacas` VALUES ('45', '27', '1', '2', '0');
INSERT INTO `butacas` VALUES ('46', '28', '1', '1', '0');
INSERT INTO `butacas` VALUES ('47', '28', '2', '1', '0');
INSERT INTO `butacas` VALUES ('48', '28', '1', '2', '0');
INSERT INTO `butacas` VALUES ('49', '28', '2', '2', '0');
INSERT INTO `butacas` VALUES ('50', '28', '5', '1', '0');
INSERT INTO `butacas` VALUES ('51', '28', '6', '1', '0');
INSERT INTO `butacas` VALUES ('52', '28', '9', '5', '0');
INSERT INTO `butacas` VALUES ('53', '28', '10', '5', '0');
INSERT INTO `butacas` VALUES ('54', '28', '1', '5', '0');
INSERT INTO `butacas` VALUES ('55', '28', '2', '5', '0');
INSERT INTO `butacas` VALUES ('56', '28', '3', '5', '0');
INSERT INTO `butacas` VALUES ('57', '5', '7', '2', '0');
INSERT INTO `butacas` VALUES ('58', '5', '8', '4', '0');
INSERT INTO `butacas` VALUES ('59', '5', '9', '3', '0');
INSERT INTO `butacas` VALUES ('60', '5', '9', '4', '0');
INSERT INTO `butacas` VALUES ('61', '24', '1', '3', '0');
INSERT INTO `butacas` VALUES ('62', '27', '7', '5', '0');
INSERT INTO `butacas` VALUES ('63', '18', '1', '3', '0');
INSERT INTO `butacas` VALUES ('64', '18', '2', '3', '0');
INSERT INTO `butacas` VALUES ('65', '20', '4', '5', '0');
INSERT INTO `butacas` VALUES ('66', '20', '5', '5', '0');

-- ----------------------------
-- Table structure for cancha
-- ----------------------------
DROP TABLE IF EXISTS `cancha`;
CREATE TABLE `cancha` (
  `IdCancha` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Descripcion` varchar(1000) CHARACTER SET latin1 DEFAULT NULL,
  `Ubicacion` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Imagen` varchar(500) CHARACTER SET latin1 DEFAULT NULL,
  `IdVideo` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdCancha`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of cancha
-- ----------------------------
INSERT INTO `cancha` VALUES ('1', 'Arsenal', 'Observacion', 'Calle 13 # 80 a - 83 - 320 3068887', 'https://mx.habcdn.com/photos/business/120/canchas-de-futbol-pasto-sintetico_64603.jpg', '52001', '1');
INSERT INTO `cancha` VALUES ('2', 'PSG', 'Observacion', 'Av. La esperanza # 50 esquina', 'https://cl.habcdn.com/photos/business/120/cancha-pasto-sintetico-2_54853.jpg', '52002', '1');
INSERT INTO `cancha` VALUES ('3', 'San lorenzo', 'Observacion', 'Calle 12b # 71d – 61 piso 3 c.c 320 852 8482', 'https://s-media-cache-ak0.pinimg.com/736x/1e/c8/9f/1ec89f89f84646f971d89938353d8c07.jpg', '52003', '1');
INSERT INTO `cancha` VALUES ('4', 'Emelec', 'Observacion', 'Calle 23sur # 69-17', 'http://www.perbox.cl/galeria/23s.jpg', '52004', '1');
INSERT INTO `cancha` VALUES ('5', 'Barcelona', 'Observacion', 'Calle 90 #13-63', 'http://www.scoregol.com/galerias/redes-perimetrales-canchas/redes-perimetrales-canchas-secciones-120x120-1.jpg', '52005', '1');
INSERT INTO `cancha` VALUES ('6', 'Bayer munich', 'Observacion', 'Calle 60 a sur carrera 105                        ', 'http://www.scoregol.com/galerias/redes-perimetrales-canchas-futbol/redes-perimetrales-canchas-futbol-panorama-120x120-1.jpg', '52006', '1');
INSERT INTO `cancha` VALUES ('7', 'Monaco', 'Observacion', 'Cra 5 no. 30-51', 'http://www.scoregol.com/galerias/redes-perimetrales-canchas/redes-perimetrales-canchas-area-deportiva-120x120-1.jpg', '52007', '1');
INSERT INTO `cancha` VALUES ('8', 'Manchester', 'Observacion', 'Transversal 18 numero 78 80                       ', 'https://mx.habcdn.com/photos/business/120/canchas-de-futbol-pasto-sintetico_64603.jpg', '52008', '1');
INSERT INTO `cancha` VALUES ('9', 'Sevilla', 'Observacion', 'Calle 71 a no 6-30 piso 17                        ', 'https://mx.habcdn.com/photos/business/120/canchas-de-tenis_64602.jpg', '52009', '1');
INSERT INTO `cancha` VALUES ('10', 'Dortmund', 'Observacion', 'Pie del cerro calle 30 no. 17-206', 'https://mx.habcdn.com/photos/business/120/canchas-de-basquetbol_64623.jpg', '52010', '1');
INSERT INTO `cancha` VALUES ('11', 'Roma', 'Observacion', 'Calle 11 35-36                                    ', 'http://www.scoregol.com/galerias/redes-perimetrales-canchas/redes-perimetrales-canchas-division-areas-deportivas-120x120-1.jpg', '52011', '1');
INSERT INTO `cancha` VALUES ('12', 'Santos', 'Observacion', 'Calle 98 no. 22 64 piso 11', 'https://pleximundo.com/wp-content/uploads/2017/03/grama-natural-02-120x120.jpg', '52012', '1');
INSERT INTO `cancha` VALUES ('13', 'Palmeiras', 'Observacion', 'B/grande cra.3 edif.ejecutivo of.702', 'https://5d18315bdf5632bdde16-d2eeb53de1ac1c53deb326509a4eead6.ssl.cf1.rackcdn.com/204ba7732194c7f045912d4e18da8604.120x120.jpg', '52013', '1');
INSERT INTO `cancha` VALUES ('14', 'Chapecoense', 'Observacion', 'Cra 42 a # 1 sur 16                               ', 'https://5d18315bdf5632bdde16-d2eeb53de1ac1c53deb326509a4eead6.ssl.cf1.rackcdn.com/8dbb7e61fa134b20956ba11fb650696e.120x120.jpg', '52014', '1');
INSERT INTO `cancha` VALUES ('15', 'Rosario Central', 'Observacion', 'Calle 103 no. 23-32', 'https://mx.habcdn.com/photos/business/120/cancha-futbol-7-2_8741.jpg', '52015', '1');
INSERT INTO `cancha` VALUES ('16', 'Racing', 'Observacion', 'Transversal 3 no. 56-19                           ', 'http://www.scoregol.com/galerias/redes-perimetrales-canchas-futbol/redes-perimetrales-canchas-futbol-perfil-120x120-1.jpg', '52016', '1');
INSERT INTO `cancha` VALUES ('17', 'Tijuana', 'Observacion', 'Calle 22 127 51 in 4 bg 2 ps 2                    ', 'https://pleximundo.com/wp-content/uploads/2017/03/grama-sintetica512-02-120x120.jpg', '52017', '1');
INSERT INTO `cancha` VALUES ('18', 'Colon', 'Observacion', 'Carrera 8a n. 99-51 torre a ofic.60', 'https://pleximundo.com/wp-content/uploads/2017/03/02-banco-de-la-republica-club-choquenza-bogota512-120x120.jpg', '52018', '1');
INSERT INTO `cancha` VALUES ('19', 'Shangai', 'Observacion', 'Carrera 8a no.99-51 of.405                        ', 'https://image.jimcdn.com/app/cms/image/transf/dimension=120x120:mode=crop:format=jpg/path/s7becb09e19a768d4/image/iedef159f79c194f4/version/1400183119/image.jpg', '52019', '1');
INSERT INTO `cancha` VALUES ('20', 'Liverpool', 'Observacion', 'Calle 83 n0 12-26', 'https://diadelsur.com/wp-content/uploads/2016/11/cesped-sintetico-120x120.jpg', '52020', '1');
INSERT INTO `cancha` VALUES ('21', 'Malaga', 'Observacion', 'Calle 36 n.17-56 local 3-2                        ', 'https://s-media-cache-ak0.pinimg.com/736x/e8/17/e8/e817e8fd42791b2a5281d0ec140783f0.jpg', '52021', '1');
INSERT INTO `cancha` VALUES ('22', 'Monterrey', 'Observacion', 'Carrera 5 no. 30-61', 'https://a02.t26.net/avatares/3/0/9/3/120x120_nr_3093595.jpg?970507', '52022', '1');
INSERT INTO `cancha` VALUES ('23', 'Valencia', 'Observacion', 'Calle 17 #43f-122', 'https://www.presidencia.gob.pa/tmp/post/1364/thumbnails/tn_IMG-20160828-WA0052.jpg', '52023', '1');
INSERT INTO `cancha` VALUES ('24', 'Milan', 'Observacion', 'Carrera 42 no. 29 a 71                            ', 'https://a11.t26.net/avatares/7/2/9/1/120x120_nr_7291656.jpg?685112', '52024', '1');
INSERT INTO `cancha` VALUES ('25', 'Montevideo', 'Observacion', 'Carrera 50 nro 52-22 of 902', 'https://a15.t26.net/avatares/1/9/3/3/120x120_nr_19333424.jpg?520936', '52025', '1');
INSERT INTO `cancha` VALUES ('26', 'Gijon', 'Observacion', 'Cra 40 no 105-25                                  ', 'https://a13.t26.net/avatares/1/3/9/9/120x120_120_139969.jpg', '52026', '1');
INSERT INTO `cancha` VALUES ('27', 'Hamburg', 'Observacion', 'Carrera 17e  59-57', 'https://a16.t26.net/avatares/2/0/4/0/120x120_nr_20406307.jpg?435084', '52027', '1');
INSERT INTO `cancha` VALUES ('28', 'Torino', 'Observacion', 'Carrera 43 a # 7-50 a of. 304', 'https://image.jimcdn.com/app/cms/image/transf/dimension=120x120:mode=crop:format=jpg/path/s88e8e36c1079c298/image/icb2b89aac04790d6/version/1486395744/image.jpg', '52028', '1');

-- ----------------------------
-- Table structure for funciones
-- ----------------------------
DROP TABLE IF EXISTS `funciones`;
CREATE TABLE `funciones` (
  `IdFuncion` int(11) NOT NULL AUTO_INCREMENT,
  `IdSede` int(11) NOT NULL,
  `IdCancha` int(11) NOT NULL,
  `Horario` time NOT NULL,
  `Fecha` date NOT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdFuncion`,`IdSede`,`IdCancha`,`Horario`,`Fecha`),
  KEY `IdSede` (`IdSede`),
  KEY `IdCancha` (`IdCancha`),
  KEY `Horario` (`Horario`),
  CONSTRAINT `funciones_ibfk_1` FOREIGN KEY (`IdSede`) REFERENCES `sede` (`IdSede`),
  CONSTRAINT `funciones_ibfk_2` FOREIGN KEY (`IdCancha`) REFERENCES `cancha` (`IdCancha`),
  CONSTRAINT `funciones_ibfk_3` FOREIGN KEY (`Horario`) REFERENCES `horarios` (`Horario`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of funciones
-- ----------------------------
INSERT INTO `funciones` VALUES ('1', '1', '1', '07:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('2', '2', '2', '08:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('3', '3', '3', '09:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('4', '4', '4', '10:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('5', '5', '5', '11:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('6', '6', '6', '12:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('7', '7', '7', '13:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('8', '8', '8', '14:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('9', '9', '9', '15:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('10', '10', '10', '16:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('11', '11', '11', '17:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('12', '12', '12', '18:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('13', '13', '13', '19:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('14', '14', '14', '20:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('15', '15', '15', '21:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('16', '16', '16', '22:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('17', '17', '17', '07:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('18', '18', '18', '08:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('19', '19', '19', '09:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('20', '20', '20', '10:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('21', '21', '21', '11:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('22', '22', '22', '12:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('23', '23', '23', '13:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('24', '24', '24', '14:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('25', '25', '25', '15:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('26', '26', '26', '16:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('27', '27', '27', '17:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('28', '28', '28', '18:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('29', '2', '1', '21:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('30', '3', '1', '09:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('31', '1', '1', '08:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('32', '1', '1', '09:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('33', '1', '1', '15:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('34', '1', '1', '11:00:00', '2017-05-01', '1');
INSERT INTO `funciones` VALUES ('35', '1', '1', '12:00:00', '2017-05-01', '1');

-- ----------------------------
-- Table structure for horarios
-- ----------------------------
DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
  `Horario` time NOT NULL,
  `Precio` double(8,2) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`Horario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of horarios
-- ----------------------------
INSERT INTO `horarios` VALUES ('07:00:00', '50000.00', '1');
INSERT INTO `horarios` VALUES ('08:00:00', '50000.00', '1');
INSERT INTO `horarios` VALUES ('09:00:00', '50000.00', '1');
INSERT INTO `horarios` VALUES ('10:00:00', '50000.00', '1');
INSERT INTO `horarios` VALUES ('11:00:00', '50000.00', '1');
INSERT INTO `horarios` VALUES ('12:00:00', '50000.00', '1');
INSERT INTO `horarios` VALUES ('13:00:00', '60000.00', '1');
INSERT INTO `horarios` VALUES ('14:00:00', '60000.00', '1');
INSERT INTO `horarios` VALUES ('15:00:00', '60000.00', '1');
INSERT INTO `horarios` VALUES ('16:00:00', '60000.00', '1');
INSERT INTO `horarios` VALUES ('17:00:00', '60000.00', '1');
INSERT INTO `horarios` VALUES ('18:00:00', '60000.00', '1');
INSERT INTO `horarios` VALUES ('19:00:00', '70000.00', '1');
INSERT INTO `horarios` VALUES ('20:00:00', '70000.00', '1');
INSERT INTO `horarios` VALUES ('21:00:00', '70000.00', '1');
INSERT INTO `horarios` VALUES ('22:00:00', '70000.00', '1');

-- ----------------------------
-- Table structure for reservas
-- ----------------------------
DROP TABLE IF EXISTS `reservas`;
CREATE TABLE `reservas` (
  `IdReserva` int(11) NOT NULL AUTO_INCREMENT,
  `Horario` time NOT NULL,
  `IdFuncion` int(11) NOT NULL,
  `IdSede` int(11) NOT NULL,
  `IdCancha` int(11) NOT NULL,
  `IdUsuario` int(11) NOT NULL,
  `Nombre` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `FechaReserva` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Fecha` date NOT NULL,
  `Precio` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdReserva`),
  KEY `IdUsuario` (`IdUsuario`),
  KEY `IdFuncion` (`IdFuncion`,`IdSede`,`IdCancha`,`Horario`,`Fecha`),
  CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`),
  CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`IdFuncion`, `IdSede`, `IdCancha`, `Horario`, `Fecha`) REFERENCES `funciones` (`IdFuncion`, `IdSede`, `IdCancha`, `Horario`, `Fecha`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of reservas
-- ----------------------------
INSERT INTO `reservas` VALUES ('12', '16:00:00', '26', '26', '26', '4', 'Juan Jose Herrera', '2017-05-18 16:54:31', '2017-05-01', '300000', '1');
INSERT INTO `reservas` VALUES ('13', '17:00:00', '27', '27', '27', '16', 'test 123', '2017-11-26 13:04:11', '2017-05-01', '120000', '1');
INSERT INTO `reservas` VALUES ('14', '18:00:00', '28', '28', '28', '16', 'test1111', '2017-11-26 14:42:25', '2017-05-01', '120000', '1');
INSERT INTO `reservas` VALUES ('15', '18:00:00', '28', '28', '28', '16', 'Test 123456', '2017-11-26 14:50:40', '2017-05-01', '120000', '1');
INSERT INTO `reservas` VALUES ('16', '18:00:00', '28', '28', '28', '16', 'Test nueva reserva', '2017-11-26 14:53:26', '2017-05-01', '180000', '1');
INSERT INTO `reservas` VALUES ('17', '11:00:00', '5', '5', '5', '16', 'Ultima reserva', '2017-11-26 15:04:22', '2017-05-01', '200000', '1');
INSERT INTO `reservas` VALUES ('18', '14:00:00', '24', '24', '24', '16', 'Tets', '2017-11-26 15:31:14', '2017-05-01', '60000', '1');
INSERT INTO `reservas` VALUES ('19', '17:00:00', '27', '27', '27', '16', 'Nueva reserva', '2017-11-26 18:26:23', '2017-05-01', '60000', '1');
INSERT INTO `reservas` VALUES ('20', '08:00:00', '18', '18', '18', '19', 'Tesssssss', '2017-11-26 20:48:41', '2017-05-01', '100000', '1');
INSERT INTO `reservas` VALUES ('21', '10:00:00', '20', '20', '20', '20', 'Lorem ipsum is amet', '2017-11-26 20:50:13', '2017-05-01', '100000', '1');

-- ----------------------------
-- Table structure for sede
-- ----------------------------
DROP TABLE IF EXISTS `sede`;
CREATE TABLE `sede` (
  `IdSede` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Zona` int(11) DEFAULT NULL,
  `Punto` int(11) DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdSede`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of sede
-- ----------------------------
INSERT INTO `sede` VALUES ('1', 'Verbenal', '10', '5', '1');
INSERT INTO `sede` VALUES ('2', 'La Uribe', '10', '5', '1');
INSERT INTO `sede` VALUES ('3', 'San Cristobal Norte', '10', '5', '1');
INSERT INTO `sede` VALUES ('4', 'Toberin', '10', '5', '1');
INSERT INTO `sede` VALUES ('5', 'Los Cedros', '10', '5', '1');
INSERT INTO `sede` VALUES ('6', 'Usaquen', '10', '5', '1');
INSERT INTO `sede` VALUES ('7', 'Country Club', '10', '5', '1');
INSERT INTO `sede` VALUES ('8', 'Santa Barbara ', '10', '5', '1');
INSERT INTO `sede` VALUES ('9', 'UPR Usaquén', '10', '5', '1');
INSERT INTO `sede` VALUES ('10', 'El Refugio', '10', '5', '1');
INSERT INTO `sede` VALUES ('11', 'San Isidro Patios', '10', '5', '1');
INSERT INTO `sede` VALUES ('12', 'Pardo Rubio', '10', '5', '1');
INSERT INTO `sede` VALUES ('13', 'Chicó Lago', '10', '5', '1');
INSERT INTO `sede` VALUES ('14', 'Chapinero', '10', '5', '1');
INSERT INTO `sede` VALUES ('15', 'UPR Chapinero', '10', '5', '1');
INSERT INTO `sede` VALUES ('16', 'Sagrado Corazón', '10', '5', '1');
INSERT INTO `sede` VALUES ('17', 'La Macarena', '10', '5', '1');
INSERT INTO `sede` VALUES ('18', 'Las Nieves', '10', '5', '1');
INSERT INTO `sede` VALUES ('19', 'Las Cruces', '10', '5', '1');
INSERT INTO `sede` VALUES ('20', 'Lourdes', '10', '5', '1');
INSERT INTO `sede` VALUES ('21', 'UPR Santa Fe', '10', '5', '1');
INSERT INTO `sede` VALUES ('22', 'San Blas', '10', '5', '1');
INSERT INTO `sede` VALUES ('23', 'Sosiego', '10', '5', '1');
INSERT INTO `sede` VALUES ('24', 'Veinte de Julio', '10', '5', '1');
INSERT INTO `sede` VALUES ('25', 'La Gloria', '10', '5', '1');
INSERT INTO `sede` VALUES ('26', 'Los Libertadores ', '10', '5', '1');
INSERT INTO `sede` VALUES ('27', 'UPR San Cristóbal', '10', '5', '1');
INSERT INTO `sede` VALUES ('28', 'La Flora', '10', '5', '1');

-- ----------------------------
-- Table structure for usuarios
-- ----------------------------
DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Usuario` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Password` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Nombre` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `Apellido` varchar(50) CHARACTER SET latin1 DEFAULT NULL,
  `DNI` int(11) DEFAULT NULL,
  `FechaAlta` datetime DEFAULT NULL,
  `TipoUsuario` varchar(20) CHARACTER SET latin1 DEFAULT NULL,
  `Estado` int(11) DEFAULT '1',
  PRIMARY KEY (`IdUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of usuarios
-- ----------------------------
INSERT INTO `usuarios` VALUES ('1', 'admin', '202cb962ac59075b964b07152d234b70', 'Administrador', 'Administrador', '123', '0000-00-00 00:00:00', 'Administrador', '1');
INSERT INTO `usuarios` VALUES ('2', 'john', '202cb962ac59075b964b07152d234b70', 'John Jairo', 'Ochoa Mesa', '1024462247', '0000-00-00 00:00:00', 'Administrador', '1');
INSERT INTO `usuarios` VALUES ('3', 'tomas', '202cb962ac59075b964b07152d234b70', 'Tomas Alberto', 'Mengual Aragon', '1024462248', '0000-00-00 00:00:00', 'Administrador', '1');
INSERT INTO `usuarios` VALUES ('4', 'juan', '202cb962ac59075b964b07152d234b70', 'Juan Jose', 'Herrera', '1024462249', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('5', 'jose', '202cb962ac59075b964b07152d234b70', 'Jose', 'Rojas', '1024462250', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('6', 'diana', '202cb962ac59075b964b07152d234b70', 'Diana Stephania', 'Perdomo', '1024462251', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('7', 'angely', '202cb962ac59075b964b07152d234b70', 'Angely', 'Blanco', '1024462252', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('8', 'natalia', '202cb962ac59075b964b07152d234b70', 'Natalia', 'Rojas', '1024462253', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('9', 'javier', '202cb962ac59075b964b07152d234b70', 'Javier', 'Calderon', '1024462254', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('10', 'edwin', '202cb962ac59075b964b07152d234b70', 'Edwin', 'Sanchez', '1024462255', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('11', 'cesar', '202cb962ac59075b964b07152d234b70', 'Cesar', 'Aroca', '1024462256', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('12', 'pablo', '202cb962ac59075b964b07152d234b70', 'Pablo', 'Perez', '1024462257', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('13', 'hernan', '202cb962ac59075b964b07152d234b70', 'Hernan', 'Caicedo', '1024462258', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('14', 'camilo', '202cb962ac59075b964b07152d234b70', 'Camilo', 'Hernandez', '1024462259', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('15', 'ferney', '202cb962ac59075b964b07152d234b70', 'Ferney', 'Ocampo', '1024462260', '0000-00-00 00:00:00', 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('16', 'lguerrero', '1a1dc91c907325c69271ddf0c944bc72', 'Luis', 'Guerrero', '1012350897', null, 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('17', 'lguerrero89', '1a1dc91c907325c69271ddf0c944bc72', 'Luis', 'Guerra', '10123', null, 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('18', 'lguerrero90', '1a1dc91c907325c69271ddf0c944bc72', 'Luigi', 'Tuuuu', '3131213', null, 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('19', 'lguerrero91', '1a1dc91c907325c69271ddf0c944bc72', 'Luis 2', 'Guerrero2 ', '10123', null, 'Usuario', '1');
INSERT INTO `usuarios` VALUES ('20', 'lguerrero92', '81dc9bdb52d04dc20036dbd8313ed055', 'Luis 3', 'Guerrero 3', '1012350897', null, 'Usuario', '1');
