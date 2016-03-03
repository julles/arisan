/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : arisan

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2016-03-03 14:01:28
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `account`
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `id` int(11) NOT NULL,
  `account_code` varchar(20) DEFAULT NULL,
  `account_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO account VALUES ('1', '00', 'Kas Bank');
INSERT INTO account VALUES ('2', '01', 'Kas Arisan');

-- ----------------------------
-- Table structure for `actions`
-- ----------------------------
DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `label` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `actions_code_index` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of actions
-- ----------------------------
INSERT INTO actions VALUES ('1', 'index', 'Index', null, null);
INSERT INTO actions VALUES ('2', 'create', 'Create', null, null);
INSERT INTO actions VALUES ('3', 'update', 'Update', null, null);
INSERT INTO actions VALUES ('6', 'view', 'View', '2016-02-28 17:10:11', '2016-02-28 17:10:11');
INSERT INTO actions VALUES ('7', 'delete', 'Delete', '2016-02-28 17:40:33', '2016-02-28 17:40:33');

-- ----------------------------
-- Table structure for `arisanmember`
-- ----------------------------
DROP TABLE IF EXISTS `arisanmember`;
CREATE TABLE `arisanmember` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `arisanid` int(11) DEFAULT NULL,
  `joindate` datetime DEFAULT NULL,
  `rule` smallint(6) NOT NULL DEFAULT '1' COMMENT '1:anggota\r\n2:bandar\r\n3:bendahara',
  `nomor_urut` smallint(6) DEFAULT NULL,
  `last_win` date DEFAULT NULL COMMENT 'tgl_terkahir dapat arisan',
  `last_deposit` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- ----------------------------
-- Records of arisanmember
-- ----------------------------

-- ----------------------------
-- Table structure for `arisans`
-- ----------------------------
DROP TABLE IF EXISTS `arisans`;
CREATE TABLE `arisans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `due_date` int(11) NOT NULL,
  `deposit` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `arisans_deposit_index` (`deposit`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of arisans
-- ----------------------------

-- ----------------------------
-- Table structure for `arisan_details`
-- ----------------------------
DROP TABLE IF EXISTS `arisan_details`;
CREATE TABLE `arisan_details` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `arisan_id` int(10) unsigned NOT NULL,
  `user_id` int(10) unsigned NOT NULL,
  `urutan_pemenang` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `arisan_details_arisan_id_foreign` (`arisan_id`),
  KEY `arisan_details_user_id_foreign` (`user_id`),
  CONSTRAINT `arisan_details_arisan_id_foreign` FOREIGN KEY (`arisan_id`) REFERENCES `arisans` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `arisan_details_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of arisan_details
-- ----------------------------

-- ----------------------------
-- Table structure for `city`
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `code_city` varchar(10) NOT NULL,
  `code_state` varchar(10) DEFAULT NULL,
  `kind_city` varchar(50) DEFAULT NULL,
  `name_city` varchar(100) DEFAULT NULL,
  `is_departure` bit(1) DEFAULT NULL,
  `is_destination` bit(1) DEFAULT NULL,
  PRIMARY KEY (`code_city`) USING BTREE,
  KEY `FK_state_has_city_new` (`code_state`) USING BTREE,
  CONSTRAINT `FK_state_has_city_new` FOREIGN KEY (`code_state`) REFERENCES `state` (`code_state`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=148;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO city VALUES ('AC-LGS', 'AC', 'Kota', 'Langsa ', '', '');
INSERT INTO city VALUES ('ADL', 'SG', 'Kabupaten', 'Konawe Selatan', '', '');
INSERT INTO city VALUES ('AFT', 'PB', 'Kota', 'Maybrat', '', '');
INSERT INTO city VALUES ('AGM', 'BE', 'Kabupaten', 'Bengkulu Utara', '', '');
INSERT INTO city VALUES ('AGT', 'PA', 'Kabupaten', 'Asmat', '', '');
INSERT INTO city VALUES ('AKK', 'SU', 'Kabupaten', 'Labuhanbatu Utara', '', '');
INSERT INTO city VALUES ('AMB', 'MA', 'Kota', 'Ambon', '', '');
INSERT INTO city VALUES ('AMR', 'SA', 'Kabupaten', 'Minahasa Selatan', '', '');
INSERT INTO city VALUES ('AMS', 'PB', 'Kabupaten', 'Sorong', '', '');
INSERT INTO city VALUES ('AMT', 'KS', 'Kabupaten', 'Hulu sungai Utara', '', '');
INSERT INTO city VALUES ('APN', 'ST', 'Kabupaten', 'Tojo Una Una', '', '');
INSERT INTO city VALUES ('ARM', 'SA', 'Kabupaten', 'Minahasa Utara', '', '');
INSERT INTO city VALUES ('ARS', 'SB', 'Kabupaten', 'Solok', '', '');
INSERT INTO city VALUES ('ASDF', 'MU', 'KOTA', 'TualASDF', '', '');
INSERT INTO city VALUES ('ATB', 'NT', 'Kabupaten', 'Belu', '', '');
INSERT INTO city VALUES ('BAA', 'NT', 'Kabupaten', 'Rote Ndao', '', '');
INSERT INTO city VALUES ('BALI', 'BA', 'KOTA', 'BANGLITAS', '', '');
INSERT INTO city VALUES ('BAN', 'SN', 'Kabupaten', 'Bantaeng', '', '');
INSERT INTO city VALUES ('BAR', 'SN', 'Kabupaten', 'Barru', '', '');
INSERT INTO city VALUES ('BAU', 'SG', 'Kota', 'Bau Bau', '', '');
INSERT INTO city VALUES ('BBL', 'JT', 'Kabupaten', 'Brebes', '', '');
INSERT INTO city VALUES ('BBU', 'LA', 'Kabupaten', 'Way kanan', '', '');
INSERT INTO city VALUES ('BDG', 'JB', 'Kota', 'Bandung', '', '');
INSERT INTO city VALUES ('BDL', 'LA', 'Kota', 'Bandar Lampung', '', '');
INSERT INTO city VALUES ('BDW', 'JI', 'Kabupaten', 'Bondowoso', '', '');
INSERT INTO city VALUES ('BEK', 'KB', 'Kabupaten', 'Bengkayang', '', '');
INSERT INTO city VALUES ('BEN', 'SN', 'Kabupaten', 'Kepulauan Selayar', '', '');
INSERT INTO city VALUES ('BGK', 'ST', 'Kabupaten', 'Morowali', '', '');
INSERT INTO city VALUES ('BGL', 'BE', 'Kota', 'Bengkulu', '', '');
INSERT INTO city VALUES ('BGR', 'JB', 'Kota', 'Bogor', '', '');
INSERT INTO city VALUES ('BHN', 'BE', 'Kabupaten', 'Kaur', '', '');
INSERT INTO city VALUES ('BIK', 'PA', 'Kabupaten', 'Biak Numfor', '', '');
INSERT INTO city VALUES ('BIM', 'NB', 'Kota', 'Bima', '', '');
INSERT INTO city VALUES ('BIR', 'AC', 'Kabupaten', 'Birueun', '', '');
INSERT INTO city VALUES ('BIT', 'SA', 'Kota', 'Bitung', '', '');
INSERT INTO city VALUES ('BJB', 'KS', 'Kota', 'Banjarbaru', '', '');
INSERT INTO city VALUES ('BJM', 'KS', 'Kota', 'Banjarmasin', '', '');
INSERT INTO city VALUES ('BJN', 'JI', 'Kabupaten', 'Bojonegoro', '', '');
INSERT INTO city VALUES ('BJR', 'JB', 'Kota', 'Banjar', '', '');
INSERT INTO city VALUES ('BJW', 'NT', 'Kabupaten', 'Ngada', '', '');
INSERT INTO city VALUES ('BKJ', 'AC', 'Kabupaten', 'Gayo Lues', '', '');
INSERT INTO city VALUES ('BKL', 'JI', 'Kabupaten', 'Bangkalan', '', '');
INSERT INTO city VALUES ('BKN', 'RI', 'Kabupaten', 'Kampar', '', '');
INSERT INTO city VALUES ('BKO', 'JA', 'Kabupaten', 'Merangin', '', '');
INSERT INTO city VALUES ('BKS', 'JB', 'Kota', 'Bekasi', '', '');
INSERT INTO city VALUES ('BKT', 'SB', 'Kota', 'Bukittinggi', '', '');
INSERT INTO city VALUES ('BLA', 'JT', 'Kabupaten', 'Blora', '', '');
INSERT INTO city VALUES ('BLG', 'SU', 'Kabupaten', 'Toba Samosir', '', '');
INSERT INTO city VALUES ('BLI', 'BA', 'Kabupaten', 'Bangli', '', '');
INSERT INTO city VALUES ('BLN', 'KS', 'Kabupaten', 'Tanah Bumbu', '', '');
INSERT INTO city VALUES ('BLS', 'RI', 'Kabupaten', 'Bengkalis', '', '');
INSERT INTO city VALUES ('BLT', 'JI', 'Kota', 'Blitar', '', '');
INSERT INTO city VALUES ('BLU', 'SA', 'Kabupaten', 'Bolaang Mongondow Selatan', '', '');
INSERT INTO city VALUES ('BNA', 'AC', 'Kota', 'Banda Aceh', '', '');
INSERT INTO city VALUES ('BNG', 'SG', 'Kabupaten', 'Buton Utara', '', '');
INSERT INTO city VALUES ('BNJ', 'SU', 'Kota', 'Binjai', '', '');
INSERT INTO city VALUES ('BNR', 'JT', 'Kabupaten', 'Banjarnegara', '', '');
INSERT INTO city VALUES ('BNT', 'KT', 'Kabupaten', 'Barito Selatan', '', '');
INSERT INTO city VALUES ('BON', 'KI', 'Kota', 'Bontang', '', '');
INSERT INTO city VALUES ('BPD', 'AC', 'Kabupaten', 'Aceh Barat Daya', '', '');
INSERT INTO city VALUES ('BPP', 'KI', 'Kota', 'Balikpapan', '', '');
INSERT INTO city VALUES ('BRB', 'KS', 'Kabupaten', 'Hulu Sungai tengah', '', '');
INSERT INTO city VALUES ('BRG', 'NT', 'Kabupaten', 'Manggarai Timur', '', '');
INSERT INTO city VALUES ('BRK', 'SA', 'Kabupaten', 'Bolaang Mongondow Utara', '', '');
INSERT INTO city VALUES ('BRM', 'PA', 'Kabupaten', 'Mamberamo Raya', '', '');
INSERT INTO city VALUES ('BSB', 'KR', 'Kabupaten', 'Bintan', '', '');
INSERT INTO city VALUES ('BSK', 'SB', 'Kabupaten', 'Tanah Datar', '', '');
INSERT INTO city VALUES ('BT-SRG', 'BT', 'Kota', 'Serang ', '', '');
INSERT INTO city VALUES ('BTA', 'SS', 'Kabupaten', 'Ogan Komering Ulu', '', '');
INSERT INTO city VALUES ('BTG', 'JT', 'Kabupaten', 'Batang', '', '');
INSERT INTO city VALUES ('BTI', 'PB', 'Kota', 'Teluk Bintuni', '', '');
INSERT INTO city VALUES ('BTL', 'YO', 'Kabupaten', 'Bantul', '', '');
INSERT INTO city VALUES ('BTM', 'KR', 'Kota', 'Batam', '', '');
INSERT INTO city VALUES ('BTU', 'JI', 'Kota', 'Batu', '', '');
INSERT INTO city VALUES ('BTW', 'PA', 'Kabupaten', 'Waropen', '', '');
INSERT INTO city VALUES ('BUL', 'ST', 'Kabupaten', 'Buol', '', '');
INSERT INTO city VALUES ('BYL', 'JT', 'Kabupaten', 'Boyolali', '', '');
INSERT INTO city VALUES ('BYW', 'JI', 'Kabupaten', 'Banyuwangi', '', '');
INSERT INTO city VALUES ('CAG', 'AC', 'Kabupaten', 'Aceh Jaya', '', '');
INSERT INTO city VALUES ('CBI', 'JB', 'Kabupaten', 'Bogor', '', '');
INSERT INTO city VALUES ('CBN', 'JB', 'Kota', 'Cirebon', '', '');
INSERT INTO city VALUES ('CJR', 'JB', 'Kabupaten', 'Cianjur', '', '');
INSERT INTO city VALUES ('CKG', 'JK', 'Kota', 'Jakarta Timur', '', '');
INSERT INTO city VALUES ('CKR', 'JB', 'Kabupaten', 'Bekasi', '', '');
INSERT INTO city VALUES ('CLG', 'BT', 'Kota', 'Cilegon', '', '');
INSERT INTO city VALUES ('CLP', 'JT', 'Kabupaten', 'Cilacap', '', '');
INSERT INTO city VALUES ('CMH', 'JB', 'Kota', 'Cimahi', '', '');
INSERT INTO city VALUES ('CMS', 'JB', 'Kabupaten', 'Ciamis', '', '');
INSERT INTO city VALUES ('CPT', 'BT', 'Kota', 'Tangerang Selatan', '', '');
INSERT INTO city VALUES ('CRP', 'BE', 'Kabupaten', 'Rejang Lebong', '', '');
INSERT INTO city VALUES ('DGL', 'ST', 'Kabupaten', 'Donggala', '', '');
INSERT INTO city VALUES ('DKL', 'KR', 'Kabupaten', 'Lingga', '', '');
INSERT INTO city VALUES ('DLS', 'SU', 'Kabupaten', 'Humbang Hasundutan', '', '');
INSERT INTO city VALUES ('DMK', 'JT', 'Kabupaten', 'Demak', '', '');
INSERT INTO city VALUES ('DOB', 'MA', 'Kabupaten', 'Kepulauan Aru', '', '');
INSERT INTO city VALUES ('DP', 'BA', 'Kota', 'Denpasar ', '', '');
INSERT INTO city VALUES ('DPK', 'JB', 'Kota', 'Depok', '', '');
INSERT INTO city VALUES ('DPU', 'NB', 'Kabupaten', 'Dompu', '', '');
INSERT INTO city VALUES ('DRH', 'MA', 'Kabupaten', 'Seram Bagian barat', '', '');
INSERT INTO city VALUES ('DTH', 'MA', 'Kabupaten', 'Seram Bagian Timur', '', '');
INSERT INTO city VALUES ('DUM', 'RI', 'Kota', 'Dumai', '', '');
INSERT INTO city VALUES ('ELL', 'PA', 'Kabupaten', 'Yalimo', '', '');
INSERT INTO city VALUES ('END', 'NT', 'Kabupaten', 'Ende', '', '');
INSERT INTO city VALUES ('ENR', 'SN', 'Kabupaten', 'Enrekang', '', '');
INSERT INTO city VALUES ('ERT', 'PA', 'Kabupaten', 'Paniai', '', '');
INSERT INTO city VALUES ('FEF', 'PB', 'Kabupaten', 'Tambrauw', '', '');
INSERT INTO city VALUES ('FFK', 'PB', 'Kabupaten', 'Fak Fak', '', '');
INSERT INTO city VALUES ('GDT', 'LA', 'Kabupaten', 'Pesawaran', '', '');
INSERT INTO city VALUES ('GGP', 'JK', 'Kota', 'Jakarta Barat', '', '');
INSERT INTO city VALUES ('GIN', 'BA', 'Kabupaten', 'Gianyar', '', '');
INSERT INTO city VALUES ('GNS', 'LA', 'Kabupaten', 'Lampung Tengah', '', '');
INSERT INTO city VALUES ('GNT', 'SU', 'Kabupaten', 'Padang Lawas Utara', '', '');
INSERT INTO city VALUES ('GO-GTO', 'GO', 'Kota', 'Gorontalo', '', '');
INSERT INTO city VALUES ('GRG', 'NB', 'Kabupaten', 'Lombok Barat', '', '');
INSERT INTO city VALUES ('GRT', 'JB', 'Kabupaten', 'Garut', '', '');
INSERT INTO city VALUES ('GSK', 'JI', 'Kabupaten', 'Gresik', '', '');
INSERT INTO city VALUES ('GST', 'SU', 'Kabupaten', 'Nias', '', '');
INSERT INTO city VALUES ('GTO', 'GO', 'Kabupaten', 'Gorontalo', '', '');
INSERT INTO city VALUES ('IDL', 'SS', 'Kabupaten', 'Ogan Ilir', '', '');
INSERT INTO city VALUES ('IDM', 'JB', 'Kabupaten', 'Indramayu', '', '');
INSERT INTO city VALUES ('ILG', 'PA', 'Kabupaten', 'Puncak', '', '');
INSERT INTO city VALUES ('JA-SPN', 'JA', 'Kota', 'Sungai Penuh ', '', '');
INSERT INTO city VALUES ('JAP', 'PA', 'Kabupaten', 'Jayapura', '', '');
INSERT INTO city VALUES ('JBG', 'JI', 'Kabupaten', 'Jombang', '', '');
INSERT INTO city VALUES ('JI-KDR', 'JI', 'Kota', 'Kediri ', '', '');
INSERT INTO city VALUES ('JI-MJK', 'JI', 'Kota', 'Mojokerto ', '', '');
INSERT INTO city VALUES ('JLL', 'MU', 'Kabupaten', 'Halmahera Barat', '', '');
INSERT INTO city VALUES ('JMB', 'JA', 'Kota', 'Jambi', '', '');
INSERT INTO city VALUES ('JMR', 'JI', 'Kabupaten', 'Jember', '', '');
INSERT INTO city VALUES ('JNP', 'SN', 'Kabupaten', 'Jeneponto', '', '');
INSERT INTO city VALUES ('JPA', 'JT', 'Kabupaten', 'Jepara', '', '');
INSERT INTO city VALUES ('JTH', 'AC', 'Kabupaten', 'Aceh Besar', '', '');
INSERT INTO city VALUES ('KAG', 'SS', 'Kabupaten', 'Ogan Komering Ilir', '', '');
INSERT INTO city VALUES ('KBA', 'BB', 'Kabupaten', 'Bangka Selatan', '', '');
INSERT INTO city VALUES ('KBG', 'PA', 'Kabupaten', 'Tolikara', '', '');
INSERT INTO city VALUES ('KBJ', 'SU', 'Kabupaten', 'Karo', '', '');
INSERT INTO city VALUES ('KBK', 'PA', 'Kabupaten', 'Mamberamo Tengah', '', '');
INSERT INTO city VALUES ('KBR', 'KS', 'Kabupaten', 'Kotabaru', '', '');
INSERT INTO city VALUES ('KDI', 'SG', 'Kota', 'Kendari', '', '');
INSERT INTO city VALUES ('KDL', 'JT', 'Kabupaten', 'Kendal', '', '');
INSERT INTO city VALUES ('KDR', 'JI', 'Kabupaten', 'Kediri', '', '');
INSERT INTO city VALUES ('KDS', 'JT', 'Kabupaten', 'Kudus', '', '');
INSERT INTO city VALUES ('KEP', 'PA', 'Kabupaten', 'Mappi', '', '');
INSERT INTO city VALUES ('KFM', 'NT', 'Kabupaten', 'Timor Tengah Utara', '', '');
INSERT INTO city VALUES ('KGM', 'PA', 'Kabupaten', 'Dogiyai', '', '');
INSERT INTO city VALUES ('KGN', 'KS', 'Kabupaten', 'Hulu Sungai Selatan', '', '');
INSERT INTO city VALUES ('KIS ', 'SU', 'Kabupaten', 'Asahan', '', '');
INSERT INTO city VALUES ('KJN', 'JT', 'Kabupaten', 'Pekalongan', '', '');
INSERT INTO city VALUES ('KKA', 'SG', 'Kota', 'Kolaka', '', '');
INSERT INTO city VALUES ('KKN', 'KT', 'Kabupaten', 'Gunung Mas', '', '');
INSERT INTO city VALUES ('KLA', 'LA', 'Kabupaten', 'Lampung Selatan', '', '');
INSERT INTO city VALUES ('KLB', 'NT', 'Kabupaten', 'Alor', '', '');
INSERT INTO city VALUES ('KLK', 'KT', 'Kabupaten', 'Kapuas', '', '');
INSERT INTO city VALUES ('KLN', 'JT', 'Kabupaten', 'Klaten', '', '');
INSERT INTO city VALUES ('KLP', 'KT', 'Kabupaten', 'Seruyan', '', '');
INSERT INTO city VALUES ('KLT', 'JA', 'Kabupaten', 'Tanjung Jabung Barat', '', '');
INSERT INTO city VALUES ('KMN', 'PB', 'Kota', 'Kaimana', '', '');
INSERT INTO city VALUES ('KNG', 'JB', 'Kabupaten', 'Kuningan', '', '');
INSERT INTO city VALUES ('KNR', 'JI', 'Kabupaten', 'Blitar', '', '');
INSERT INTO city VALUES ('KOT', 'LA', 'Kabupaten', 'Tanggamus', '', '');
INSERT INTO city VALUES ('KPG', 'NT', 'Kabupaten', 'Kupang', '', '');
INSERT INTO city VALUES ('KPH', 'BE', 'Kabupaten', 'Kepahiang', '', '');
INSERT INTO city VALUES ('KPI', 'SU', 'Kabupaten', 'Labuhanbatu Selatan', '', '');
INSERT INTO city VALUES ('KPN', 'JI', 'Kabupaten', 'Kepanjen', '', '');
INSERT INTO city VALUES ('KRA', 'BA', 'Kabupaten', 'Karangasem', '', '');
INSERT INTO city VALUES ('KRB', 'AC', 'Kabupaten', 'Aceh Tamiang', '', '');
INSERT INTO city VALUES ('KRG', 'JT', 'Kabupaten', 'Karanganyar', '', '');
INSERT INTO city VALUES ('KRS', 'JI', 'Kabupaten', 'Probolinggo', '', '');
INSERT INTO city VALUES ('KRT', 'BE', 'Kabupaten', 'Bengkulu Tengah', '', '');
INSERT INTO city VALUES ('KSN', 'KT', 'Kabupaten', 'Katingan', '', '');
INSERT INTO city VALUES ('KSU', 'JK', 'Kabupaten', 'Kepulauan Seribu', '', '');
INSERT INTO city VALUES ('KTB', 'LA', 'Kabupaten', 'Lampung Utara', '', '');
INSERT INTO city VALUES ('KTG', 'SA', 'Kota', 'Kotamobagu', '', '');
INSERT INTO city VALUES ('KTN', 'AC', 'Kabupaten', 'Aceh Tenggara', '', '');
INSERT INTO city VALUES ('KTP', 'KB', 'Kabupaten', 'Ketapang', '', '');
INSERT INTO city VALUES ('KWD', 'GO', 'Kabupaten', 'Gorontalo Utara', '', '');
INSERT INTO city VALUES ('KWG', 'JB', 'Kabupaten', 'Karawang', '', '');
INSERT INTO city VALUES ('KYB', 'JK', 'Kota', 'Jakarta Selatan', '', '');
INSERT INTO city VALUES ('KYM', 'PA', 'Kabupaten', 'Nduga', '', '');
INSERT INTO city VALUES ('LBA', 'MU', 'Kabupaten', 'Halmahera Selatan', '', '');
INSERT INTO city VALUES ('LBB', 'SB', 'Kabupaten', 'Agam', '', '');
INSERT INTO city VALUES ('LBJ', 'NT', 'Kabupaten', 'Manggarai Barat', '', '');
INSERT INTO city VALUES ('LBP', 'SU', 'Kabupaten', 'Deli serdang', '', '');
INSERT INTO city VALUES ('LBS', 'SB', 'Kabupaten', 'Pasaman', '', '');
INSERT INTO city VALUES ('LGS', 'AC', 'Kabupaten', 'Aceh Timur', '', '');
INSERT INTO city VALUES ('LHM', 'SU', 'Kabupaten', 'Nias Barat', '', '');
INSERT INTO city VALUES ('LHT', 'SS', 'Kabupaten', 'Lahat', '', '');
INSERT INTO city VALUES ('LIW', 'LA', 'Kabupaten', 'Lampung Barat', '', '');
INSERT INTO city VALUES ('LLG', 'SS', 'Kota', 'Lubuk Linggau', '', '');
INSERT INTO city VALUES ('LLK', 'SA', 'Kabupaten', 'Bolaang Mongondow', '', '');
INSERT INTO city VALUES ('LLS', 'SG', 'Kabupaten', 'Kolaka Utara', '', '');
INSERT INTO city VALUES ('LMG', 'JI', 'Kabupaten', 'Lamongan', '', '');
INSERT INTO city VALUES ('LMJ', 'JI', 'Kabupaten', 'Lumajang', '', '');
INSERT INTO city VALUES ('LMP', 'SU', 'Kabupaten', 'Batu Bara', '', '');
INSERT INTO city VALUES ('LRT', 'NT', 'Kabupaten', 'Flores Timur', '', '');
INSERT INTO city VALUES ('LSK', 'AC', 'Kabupaten', 'Aceh Utara', '', '');
INSERT INTO city VALUES ('LSM', 'AC', 'Kota', 'Lhokseumawe', '', '');
INSERT INTO city VALUES ('LTU', 'SU', 'Kabupaten', 'Nias Utara', '', '');
INSERT INTO city VALUES ('LWK', 'ST', 'Kabupaten', 'Banggai', '', '');
INSERT INTO city VALUES ('LWL', 'NT', 'Kabupaten', 'Lembata', '', '');
INSERT INTO city VALUES ('MA-TUL', 'MA', 'Kota', 'Tual', '', '');
INSERT INTO city VALUES ('MAB', 'MU', 'Kabupaten', 'Halmahera Timur', '', '');
INSERT INTO city VALUES ('MAD', 'JI', 'Kota', 'Madiun', '', '');
INSERT INTO city VALUES ('MAK', 'SN', 'Kabupaten', 'Tana Toraja', '', '');
INSERT INTO city VALUES ('MAM', 'SR', 'Kabupaten', 'Mamuju', '', '');
INSERT INTO city VALUES ('MAR', 'GO', 'Kabupaten', 'Pahuwato', '', '');
INSERT INTO city VALUES ('MBN', 'JA', 'Kabupaten', 'Batanghari', '', '');
INSERT INTO city VALUES ('MBO', 'AC', 'Kabupaten', 'Aceh Barat', '', '');
INSERT INTO city VALUES ('MBY', 'NT', 'Kabupaten', 'Nagekeo', '', '');
INSERT INTO city VALUES ('MDN', 'SU', 'Kota', 'Medan', '', '');
INSERT INTO city VALUES ('MET', 'LA', 'Kota', 'Metro', '', '');
INSERT INTO city VALUES ('MGL', 'JT', 'Kota', 'Magelang', '', '');
INSERT INTO city VALUES ('MGN', 'SA', 'Kabupaten', 'Kepulauan Talaud', '', '');
INSERT INTO city VALUES ('MGR', 'BB', 'Kabupaten', 'Belitung Timur', '', '');
INSERT INTO city VALUES ('MGT', 'JI', 'Kabupaten', 'Magetan', '', '');
INSERT INTO city VALUES ('MGW', 'BA', 'Kabupaten', 'Badung', '', '');
INSERT INTO city VALUES ('MJK', 'JI', 'Kabupaten', 'Mojokerto', '', '');
INSERT INTO city VALUES ('MJL', 'JB', 'Kabupaten', 'Majalengka', '', '');
INSERT INTO city VALUES ('MJN', 'SR', 'Kabupaten', 'Majene', '', '');
INSERT INTO city VALUES ('MJY', 'JI', 'Kabupaten', 'Madiun', '', '');
INSERT INTO city VALUES ('MKM', 'BE', 'Kabupaten', 'Muko Muko', '', '');
INSERT INTO city VALUES ('MKS', 'SN', 'Kota', 'Makassar', '', '');
INSERT INTO city VALUES ('MLB', 'SS', 'Kabupaten', 'Musi Rawas', '', '');
INSERT INTO city VALUES ('MLG', 'JI', 'Kota', 'Malang', '', '');
INSERT INTO city VALUES ('MLL', 'SN', 'Kabupaten', 'Luwu Timur', '', '');
INSERT INTO city VALUES ('MLN', 'KU', 'Kabupaten', 'Malinau', '', '');
INSERT INTO city VALUES ('MME', 'NT', 'Kabupaten', 'Sikka', '', '');
INSERT INTO city VALUES ('MNA', 'BE', 'Kabupaten', 'Bengkulu Selatan', '', '');
INSERT INTO city VALUES ('MND', 'SA', 'Kota', 'Manado', '', '');
INSERT INTO city VALUES ('MNK', 'PB', 'Kabupaten', 'Manokwari', '', '');
INSERT INTO city VALUES ('MPR', 'SS', 'Kabupaten', 'Oku Timur', '', '');
INSERT INTO city VALUES ('MPW', 'KB', 'Kabupaten', 'Pontianak', '', '');
INSERT INTO city VALUES ('MRB', 'JA', 'Kabupaten', 'Bungo', '', '');
INSERT INTO city VALUES ('MRD', 'SS', 'Kabupaten', 'Oku Selatan', '', '');
INSERT INTO city VALUES ('MRE', 'SS', 'Kabupaten', 'Muara Enim', '', '');
INSERT INTO city VALUES ('MRH', 'KS', 'Kabupaten', 'Barito Kuala', '', '');
INSERT INTO city VALUES ('MRJ', 'SB', 'Kabupaten', 'Sijunjung', '', '');
INSERT INTO city VALUES ('MRK', 'PA', 'Kabupaten', 'Merauke', '', '');
INSERT INTO city VALUES ('MRN', 'AC', 'Kabupaten', 'Pidie Jaya', '', '');
INSERT INTO city VALUES ('MRS', 'SN', 'Kabupaten', 'Maros', '', '');
INSERT INTO city VALUES ('MRT', 'JA', 'Kabupaten', 'Tebo', '', '');
INSERT INTO city VALUES ('MSB', 'SN', 'Kabupaten', 'Luwu Utara', '', '');
INSERT INTO city VALUES ('MSH', 'MA', 'Kabupaten', 'Maluku Tengah', '', '');
INSERT INTO city VALUES ('MSJ', 'LA', 'Kabupaten', 'Mesuji', '', '');
INSERT INTO city VALUES ('MSK', 'JA', 'Kabupaten', 'Tanjung Jabung Timur', '', '');
INSERT INTO city VALUES ('MTK', 'BB', 'Kabupaten', 'Bangka Barat', '', '');
INSERT INTO city VALUES ('MTP', 'KS', 'Kabupaten', 'Banjar', '', '');
INSERT INTO city VALUES ('MTR', 'NB', 'Kota', 'Mataram', '', '');
INSERT INTO city VALUES ('MTS', 'MU', 'Kabupaten', 'Pulau Morotai', '', '');
INSERT INTO city VALUES ('MTW', 'KT', 'Kabupaten', 'Barito Utara', '', '');
INSERT INTO city VALUES ('MUL', 'PA', 'Kabupaten', 'Puncak Jaya', '', '');
INSERT INTO city VALUES ('NAB', 'PA', 'Kabupaten', 'Nabire', '', '');
INSERT INTO city VALUES ('NBA', 'KB', 'Kabupaten', 'Landak', '', '');
INSERT INTO city VALUES ('NGA', 'BA', 'Kabupaten', 'Jembrana', '', '');
INSERT INTO city VALUES ('NGW', 'JI', 'Kabupaten', 'Ngawi', '', '');
INSERT INTO city VALUES ('NJK', 'JI', 'Kabupaten', 'Nganjuk', '', '');
INSERT INTO city VALUES ('NLA', 'MA', 'Kabupaten', 'Buru', '', '');
INSERT INTO city VALUES ('NMR', 'MA', 'Kabupaten', 'Buru Selatan', '', '');
INSERT INTO city VALUES ('NNK', 'KU', 'Kabupaten', 'Nunukan', '', '');
INSERT INTO city VALUES ('NPH', 'JB', 'Kabupaten', 'Bandung Barat', '', '');
INSERT INTO city VALUES ('NT-KPG', 'NT', 'Kota', 'Kupang', '', '');
INSERT INTO city VALUES ('OSB', 'PA', 'Kabupaten', 'Pegunungan Bintang', '', '');
INSERT INTO city VALUES ('PA-JAP', 'PA', 'Kota', 'Jayapura', '', '');
INSERT INTO city VALUES ('PAD', 'SB', 'Kota', 'Padang', '', '');
INSERT INTO city VALUES ('PAL', 'ST', 'Kota', 'Palu', '', '');
INSERT INTO city VALUES ('PBG', 'JT', 'Kabupaten', 'Purbalingga', '', '');
INSERT INTO city VALUES ('PBL', 'JI', 'Kota', 'Probolinggo', '', '');
INSERT INTO city VALUES ('PBM', 'SS', 'Kota', 'Prabumulih', '', '');
INSERT INTO city VALUES ('PBR', 'RI', 'Kota', 'Pekanbaru', '', '');
INSERT INTO city VALUES ('PBU', 'KT', 'Kabupaten', 'Kotawaringin Barat', '', '');
INSERT INTO city VALUES ('PCT', 'JI', 'Kabupaten', 'Pacitan', '', '');
INSERT INTO city VALUES ('PDA', 'SB', 'Kabupaten', 'Solok Selatan', '', '');
INSERT INTO city VALUES ('PDG', 'BT', 'Kabupaten', 'Pandeglang', '', '');
INSERT INTO city VALUES ('PDP', 'SB', 'Kota', 'Padang Panjang', '', '');
INSERT INTO city VALUES ('PGA', 'SS', 'Kota', 'Pagar Alam', '', '');
INSERT INTO city VALUES ('PGP', 'BB', 'Kota', 'Pangkal Pinang', '', '');
INSERT INTO city VALUES ('PIN', 'SN', 'Kabupaten', 'Pinrang', '', '');
INSERT INTO city VALUES ('PKB', 'SS', 'Kabupaten', 'Banyuasin', '', '');
INSERT INTO city VALUES ('PKJ', 'SN', 'Kabupaten', 'Pangkajene Kepulauan', '', '');
INSERT INTO city VALUES ('PKK', 'RI', 'Kabupaten', 'Pelalawan', '', '');
INSERT INTO city VALUES ('PKL', 'JT', 'Kota', 'Pekalongan', '', '');
INSERT INTO city VALUES ('PKY', 'SR', 'Kabupaten', 'Mamuju Utara', '', '');
INSERT INTO city VALUES ('PLG', 'SS', 'Kota', 'Palembang', '', '');
INSERT INTO city VALUES ('PLI', 'KS', 'Kabupaten', 'Tanah Laut', '', '');
INSERT INTO city VALUES ('PLJ', 'SB', 'Kabupaten', 'Dharmasraya', '', '');
INSERT INTO city VALUES ('PLK', 'KT', 'Kota', 'Palangkaraya', '', '');
INSERT INTO city VALUES ('PLP', 'SN', 'Kabupaten', 'Luwu', '', '');
INSERT INTO city VALUES ('PLW', 'SR', 'Kabupaten', 'Polewali Mandar', '', '');
INSERT INTO city VALUES ('PMK', 'JI', 'Kabupaten', 'Pamekasan', '', '');
INSERT INTO city VALUES ('PML', 'JT', 'Kabupaten', 'Pemalang', '', '');
INSERT INTO city VALUES ('PMN', 'SB', 'Kota', 'Pariaman', '', '');
INSERT INTO city VALUES ('PMS', 'SU', 'Kabupaten', 'Simalungun', '', '');
INSERT INTO city VALUES ('PNG', 'JI', 'Kabupaten', 'Ponorogo', '', '');
INSERT INTO city VALUES ('PNJ', 'KI', 'Kabupaten', 'Penajam Paser Utara', '', '');
INSERT INTO city VALUES ('PNM', 'SB', 'Kabupaten', 'Padang Pariaman', '', '');
INSERT INTO city VALUES ('PNR', 'SB', 'Kabupaten', 'Pesisir Selatan', '', '');
INSERT INTO city VALUES ('PPS', 'KT', 'Kabupaten', 'Pulang pisau', '', '');
INSERT INTO city VALUES ('PRC', 'KT', 'Kabupaten', 'Murung Raya', '', '');
INSERT INTO city VALUES ('PRE', 'SN', 'Kota', 'Pare Pare', '', '');
INSERT INTO city VALUES ('PRG', 'ST', 'Kabupaten', 'Parigi Moutong', '', '');
INSERT INTO city VALUES ('PRN', 'KS', 'Kabupaten', 'Balangan', '', '');
INSERT INTO city VALUES ('PRP', 'RI', 'Kabupaten', 'Rokan Hulu', '', '');
INSERT INTO city VALUES ('PRR', 'SU', 'Kabupaten', 'Samosir', '', '');
INSERT INTO city VALUES ('PRW', 'LA', 'Kabupaten', 'Pringsewu', '', '');
INSERT INTO city VALUES ('PSN', 'JI', 'Kota', 'Pasuruan', '', '');
INSERT INTO city VALUES ('PSO', 'ST', 'Kabupaten', 'Poso', '', '');
INSERT INTO city VALUES ('PSP', 'SU', 'Kabupaten', 'Tapanuli Selatan', '', '');
INSERT INTO city VALUES ('PSR', 'JI', 'Kabupaten', 'Pasuruan', '', '');
INSERT INTO city VALUES ('PSW', 'SG', 'Kabupaten', 'Buton', '', '');
INSERT INTO city VALUES ('PTI', 'JT', 'Kabupaten', 'Pati', '', '');
INSERT INTO city VALUES ('PTK', 'KB', 'Kota', 'Pontianak', '', '');
INSERT INTO city VALUES ('PTS', 'KB', 'Kabupaten', 'Kapuas Hulu', '', '');
INSERT INTO city VALUES ('PWD', 'JT', 'Kabupaten', 'Grobogan', '', '');
INSERT INTO city VALUES ('PWK', 'JB', 'Kabupaten', 'Purwakarta', '', '');
INSERT INTO city VALUES ('PWR', 'JT', 'Kabupaten', 'Purworejo', '', '');
INSERT INTO city VALUES ('PYA', 'NB', 'Kabupaten', 'Lombok Tengah', '', '');
INSERT INTO city VALUES ('PYB', 'SU', 'Kabupaten', 'Mandailing Natal', '', '');
INSERT INTO city VALUES ('PYH', 'SB', 'Kota', 'Payakumbuh', '', '');
INSERT INTO city VALUES ('RAN', 'KR', 'Kabupaten', 'Natuna', '', '');
INSERT INTO city VALUES ('RAP', 'SU', 'Kabupaten', 'Labuhanbatu', '', '');
INSERT INTO city VALUES ('RAS', 'PB', 'Kota', 'Teluk Wondama', '', '');
INSERT INTO city VALUES ('RBG', 'JT', 'Kabupaten', 'Rembang', '', '');
INSERT INTO city VALUES ('RGB', 'KT', 'Kabupaten', 'Lamandau', '', '');
INSERT INTO city VALUES ('RGT', 'RI', 'Kabupaten', 'Indragiri Hulu', '', '');
INSERT INTO city VALUES ('RKB', 'BT', 'Kabupaten', 'Lebak', '', '');
INSERT INTO city VALUES ('RMB', 'SG', 'Kabupaten', 'Bombana', '', '');
INSERT INTO city VALUES ('RTA', 'KS', 'Kabupaten', 'Tapin', '', '');
INSERT INTO city VALUES ('RTG', 'NT', 'Kabupaten', 'Manggarai', '', '');
INSERT INTO city VALUES ('RTN', 'SA', 'Kabupaten', 'Minahasa Tenggara', '', '');
INSERT INTO city VALUES ('RTP', 'SN', 'Kabupaten', 'Toraja Utara', '', '');
INSERT INTO city VALUES ('SAB', 'AC', 'Kota', 'Sabang', '', '');
INSERT INTO city VALUES ('SAG', 'KB', 'Kabupaten', 'Sanggau', '', '');
INSERT INTO city VALUES ('SAK', 'RI', 'Kabupaten', 'Siak', '', '');
INSERT INTO city VALUES ('SAL ', 'SU', 'Kabupaten', 'Pakpak Bharat', '', '');
INSERT INTO city VALUES ('SBB', 'NT', 'Kabupaten', 'Sibu Raijua', '', '');
INSERT INTO city VALUES ('SBG', 'SU', 'Kabupaten', 'Tapanuli Tengah', '', '');
INSERT INTO city VALUES ('SBH', 'SU', 'Kabupaten', 'Padang Lawas', '', '');
INSERT INTO city VALUES ('SBM', 'JB', 'Kabupaten', 'Sukabumi', '', '');
INSERT INTO city VALUES ('SBR', 'JB', 'Kabupaten', 'Cirebon', '', '');
INSERT INTO city VALUES ('SBS', 'KB', 'Kabupaten', 'Sambas', '', '');
INSERT INTO city VALUES ('SBW', 'NB', 'Kabupaten', 'Sumbawa', '', '');
INSERT INTO city VALUES ('SBY', 'JI', 'Kota', 'Surabaya', '', '');
INSERT INTO city VALUES ('SBY-01', 'JI', 'Kota', 'Dalam Kota Surabaya', '', '');
INSERT INTO city VALUES ('SDA', 'JI', 'Kabupaten', 'Sidoarjo', '', '');
INSERT INTO city VALUES ('SDK', 'SU', 'Kabupaten', 'Dairi', '', '');
INSERT INTO city VALUES ('SDN', 'LA', 'Kabupaten', 'Lampung Timur', '', '');
INSERT INTO city VALUES ('SDR', 'SN', 'Kabupaten', 'Sidenreng Rappang', '', '');
INSERT INTO city VALUES ('SDW', 'KI', 'Kabupaten', 'Kutai barat', '', '');
INSERT INTO city VALUES ('SED', 'KB', 'Kabupaten', 'Sedakau', '', '');
INSERT INTO city VALUES ('SEL', 'NB', 'Kabupaten', 'Lombok Timur', '', '');
INSERT INTO city VALUES ('SGB', 'ST', 'Kabupaten', 'Sigi', '', '');
INSERT INTO city VALUES ('SGI', 'AC', 'Kabupaten', 'Pidie', '', '');
INSERT INTO city VALUES ('SGL', 'BB', 'Kabupaten', 'Bangka', '', '');
INSERT INTO city VALUES ('SGM', 'SN', 'Kabupaten', 'Gowa', '', '');
INSERT INTO city VALUES ('SGN', 'JT', 'Kabupaten', 'Sragen', '', '');
INSERT INTO city VALUES ('SGP', 'PA', 'Kabupaten', 'Intan Jaya', '', '');
INSERT INTO city VALUES ('SGR', 'BA', 'Kabupaten', 'Buleleng', '', '');
INSERT INTO city VALUES ('SGT', 'KI', 'Kabupaten', 'Kutai Timur', '', '');
INSERT INTO city VALUES ('SIT', 'JI', 'Kabupaten', 'Situbondo', '', '');
INSERT INTO city VALUES ('SKB', 'JB', 'Kota', 'Sukabumi', '', '');
INSERT INTO city VALUES ('SKD', 'KB', 'Kabupaten', 'Kayong Utara', '', '');
INSERT INTO city VALUES ('SKG', 'SN', 'Kabupaten', 'Wajo', '', '');
INSERT INTO city VALUES ('SKH', 'JT', 'Kabupaten', 'Sukoharjo', '', '');
INSERT INTO city VALUES ('SKL', 'AC', 'Kabupaten', 'Aceh Singkil', '', '');
INSERT INTO city VALUES ('SKM', 'AC', 'Kabupaten', 'Nagan Raya', '', '');
INSERT INTO city VALUES ('SKN', 'ST', 'Kabupaten', 'Banggai Kepulauan', '', '');
INSERT INTO city VALUES ('SKR', 'KT', 'Kabupaten', 'Sukamara', '', '');
INSERT INTO city VALUES ('SKT', 'JT', 'Kota', 'Surakarta', '', '');
INSERT INTO city VALUES ('SKW', 'KB', 'Kota', 'Singkawang', '', '');
INSERT INTO city VALUES ('SKY', 'SS', 'Kabupaten', 'Musi Banyuasin', '', '');
INSERT INTO city VALUES ('SLK', 'SB', 'Kota', 'Solok', '', '');
INSERT INTO city VALUES ('SLT', 'JT', 'Kota', 'Salatiga', '', '');
INSERT INTO city VALUES ('SLW', 'JT', 'Kabupaten', 'Tegal', '', '');
INSERT INTO city VALUES ('SMD', 'JB', 'Kabupaten', 'Sumedang', '', '');
INSERT INTO city VALUES ('SMG', 'JT', 'Kota', 'Semarang', '', '');
INSERT INTO city VALUES ('SMH', 'PA', 'Kabupaten', 'Yahukimo', '', '');
INSERT INTO city VALUES ('SMI', 'PA', 'Kabupaten', 'Sarmi', '', '');
INSERT INTO city VALUES ('SML', 'MA', 'Kabupaten', 'Maluku Tenggara Barat', '', '');
INSERT INTO city VALUES ('SMN', 'YO', 'Kabupaten', 'Sleman', '', '');
INSERT INTO city VALUES ('SMR', 'KI', 'Kota', 'Samarinda', '', '');
INSERT INTO city VALUES ('SN-PLP', 'SN', 'Kota', 'Palopo', '', '');
INSERT INTO city VALUES ('SNB', 'AC', 'Kabupaten', 'Simeulue', '', '');
INSERT INTO city VALUES ('SNG', 'JB', 'Kabupaten', 'Subang', '', '');
INSERT INTO city VALUES ('SNJ', 'SN', 'Kabupaten', 'Sinjai', '', '');
INSERT INTO city VALUES ('SNN', 'MU', 'Kabupaten', 'Kepulauan Sula', '', '');
INSERT INTO city VALUES ('SNT', 'JA', 'Kabupaten', 'Muaro Jambi', '', '');
INSERT INTO city VALUES ('SOE', 'NT', 'Kabupaten', 'Timor Tengah Selatan', '', '');
INSERT INTO city VALUES ('SON', 'PB', 'Kota', 'Sorong', '', '');
INSERT INTO city VALUES ('SPA', 'JB', 'Kabupaten', 'Tasikmalaya', '', '');
INSERT INTO city VALUES ('SPE', 'SB', 'Kabupaten', 'Pasaman Barat', '', '');
INSERT INTO city VALUES ('SPG', 'JI', 'Kabupaten', 'Sampang', '', '');
INSERT INTO city VALUES ('SPN', 'JA', 'Kabupaten', 'Kerinci', '', '');
INSERT INTO city VALUES ('SPT', 'KT', 'Kabupaten', 'Kotawaringin Timur', '', '');
INSERT INTO city VALUES ('SRG', 'BT', 'Kabupaten', 'Serang', '', '');
INSERT INTO city VALUES ('SRH', 'SU', 'Kabupaten', 'Serdang Bedagai', '', '');
INSERT INTO city VALUES ('SRK', 'SB', 'Kabupaten', 'Lima Puluh Kota', '', '');
INSERT INTO city VALUES ('SRL', 'JA', 'Kabupaten', 'Sorolangun', '', '');
INSERT INTO city VALUES ('SRP', 'BA', 'Kabupaten', 'Klungkung', '', '');
INSERT INTO city VALUES ('SRU', 'PA', 'Kabupaten', 'Kepulauan Yapen', '', '');
INSERT INTO city VALUES ('SRW', 'PA', 'Kabupaten', 'Supiori', '', '');
INSERT INTO city VALUES ('SRY', 'KB', 'Kabupaten', 'Kubu Raya', '', '');
INSERT INTO city VALUES ('STB', 'SU', 'Kabupaten', 'Langkat', '', '');
INSERT INTO city VALUES ('STG', 'KB', 'Kabupaten', 'Sintang', '', '');
INSERT INTO city VALUES ('STR', 'AC', 'Kabupaten', 'Bener Meriah', '', '');
INSERT INTO city VALUES ('SU-GST', 'SU', 'Kota', 'Gunungsitoli', '', '');
INSERT INTO city VALUES ('SU-PMS', 'SU', 'Kota', 'Pematangsiantar', '', '');
INSERT INTO city VALUES ('SU-PSP', 'SU', 'Kota', 'Padang Sidempuan', '', '');
INSERT INTO city VALUES ('SU-SBG', 'SU', 'Kota', 'Sibolga', '', '');
INSERT INTO city VALUES ('SUS', 'AC', 'Kota', 'Subulussalam', '', '');
INSERT INTO city VALUES ('SWL', 'SB', 'Kota', 'Sawahlunto', '', '');
INSERT INTO city VALUES ('SWW', 'GO', 'Kabupaten', 'Bone bolango', '', '');
INSERT INTO city VALUES ('TAB', 'BA', 'Kabupaten', 'Tabanan', '', '');
INSERT INTO city VALUES ('TAM', 'NT', 'Kabupaten', 'Sumba Barat Daya', '', '');
INSERT INTO city VALUES ('TAR', 'KU', 'Kota', 'Tarakan', '', '');
INSERT INTO city VALUES ('TAS', 'BE', 'Kabupaten', 'Seluma', '', '');
INSERT INTO city VALUES ('TBG', 'SS', 'Kabupaten', 'Empat lawang', '', '');
INSERT INTO city VALUES ('TBH', 'RI', 'Kabupaten', 'Indragiri Hilir', '', '');
INSERT INTO city VALUES ('TBK', 'KR', 'Kabupaten', 'Karimun', '', '');
INSERT INTO city VALUES ('TBL', 'BB', 'Kabupaten', 'Bangka Selatan', '', '');
INSERT INTO city VALUES ('TBN', 'JI', 'Kabupaten', 'Tuban', '', '');
INSERT INTO city VALUES ('TBT', 'SU', 'Kota', 'Tebing Tinggi', '', '');
INSERT INTO city VALUES ('TDN', 'BB', 'Kabupaten', 'Belitung', '', '');
INSERT INTO city VALUES ('TDP', 'KU', 'Kabupaten', 'Tana Kidung', '', '');
INSERT INTO city VALUES ('TDR', 'MU', 'Kota', 'Tidore', '', '');
INSERT INTO city VALUES ('TGL', 'JT', 'Kota', 'Tegal', '', '');
INSERT INTO city VALUES ('TGR', 'BT', 'Kabupaten', 'Tangerang', '', '');
INSERT INTO city VALUES ('TGT', 'KI', 'Kabupaten', 'Paser', '', '');
INSERT INTO city VALUES ('THN', 'SA', 'Kabupaten', 'Kepulauan Sangihe', '', '');
INSERT INTO city VALUES ('TIG', 'PA', 'Kabupaten', 'Dieyai', '', '');
INSERT INTO city VALUES ('TIM', 'PA', 'Kabupaten', 'Mimika', '', '');
INSERT INTO city VALUES ('TJB', 'SU', 'Kota', 'Tanjung Balai', '', '');
INSERT INTO city VALUES ('TJG', 'KS', 'Kabupaten', 'Tabalong', '', '');
INSERT INTO city VALUES ('TJN', 'NB', 'Kabupaten', 'Lombok Utara', '', '');
INSERT INTO city VALUES ('TJP', 'JK', 'Kota', 'Jakarta Utara', '', '');
INSERT INTO city VALUES ('TJS', 'KU', 'Kabupaten', 'Bulungan', '', '');
INSERT INTO city VALUES ('TKA', 'SN', 'Kabupaten', 'Takalar', '', '');
INSERT INTO city VALUES ('TKN', 'AC', 'Kabupaten', 'Aceh Tengah', '', '');
INSERT INTO city VALUES ('TKR', 'MA', 'Kabupaten', 'Maluku Barat Daya', '', '');
INSERT INTO city VALUES ('TLD', 'SU', 'Kabupaten', 'Nias Selatan', '', '');
INSERT INTO city VALUES ('TLG', 'JI', 'Kabupaten', 'Tulungagung', '', '');
INSERT INTO city VALUES ('TLI', 'ST', 'Kabupaten', 'Toli Toli', '', '');
INSERT INTO city VALUES ('TLK', 'RI', 'Kabupaten', 'Kuantan Singingi', '', '');
INSERT INTO city VALUES ('TLW', 'NB', 'Kabupaten', 'Sumbawa Barat', '', '');
INSERT INTO city VALUES ('TMB', 'PB', 'Kabupaten', 'Sorong Selatan', '', '');
INSERT INTO city VALUES ('TMG', 'JT', 'Kabupaten', 'Temanggung', '', '');
INSERT INTO city VALUES ('TMH', 'SA', 'Kota', 'Tomohon', '', '');
INSERT INTO city VALUES ('TML', 'KS', 'Kabupaten', 'Barito Timur', '', '');
INSERT INTO city VALUES ('TMR', 'PA', 'Kabupaten', 'Boven Digoel', '', '');
INSERT INTO city VALUES ('TMT', 'GO', 'Kabupaten', 'Boalemo', '', '');
INSERT INTO city VALUES ('TNA', 'JK', 'Kota', 'Jakarta Pusat', '', '');
INSERT INTO city VALUES ('TNG', 'BT', 'Kota', 'Tangerang', '', '');
INSERT INTO city VALUES ('TNN', 'SA', 'Kabupaten', 'Minahasa', '', '');
INSERT INTO city VALUES ('TNR', 'KI', 'Kabupaten', 'Berau', '', '');
INSERT INTO city VALUES ('TOB', 'MU', 'Kabupaten', 'Halmahera Utara', '', '');
INSERT INTO city VALUES ('TOM', 'PA', 'Kabupaten', 'Lanny Jaya', '', '');
INSERT INTO city VALUES ('TPG', 'KR', 'Kota', 'Tanjung Pinang', '', '');
INSERT INTO city VALUES ('TPT', 'SB', 'Kabupaten', 'Kepulauan Mentawai', '', '');
INSERT INTO city VALUES ('TRG', 'KI', 'Kabupaten', 'Kutai Kertanegara', '', '');
INSERT INTO city VALUES ('TRK', 'JI', 'Kabupaten', 'Trenggalek', '', '');
INSERT INTO city VALUES ('TRP', 'KR', 'Kabupaten', 'Kepulauan Anambas', '', '');
INSERT INTO city VALUES ('TSM', 'JB', 'Kota', 'Tasikmalaya', '', '');
INSERT INTO city VALUES ('TTE', 'MU', 'Kota', 'Ternate', '', '');
INSERT INTO city VALUES ('TTG', 'RI', 'Kabupaten', 'Kepulauan Meranti', '', '');
INSERT INTO city VALUES ('TTN', 'AC', 'Kabupaten', 'Aceh Selatan', '', '');
INSERT INTO city VALUES ('TUB', 'BE', 'Kabupaten', 'Lebong', '', '');
INSERT INTO city VALUES ('TUL', 'MA', 'Kabupaten', 'Maluku Tenggara', '', '');
INSERT INTO city VALUES ('TWG', 'LA', 'Kabupaten', 'Tulang bawang Barat', '', '');
INSERT INTO city VALUES ('UJT', 'RI', 'Kabupaten', 'Rokan Hilir', '', '');
INSERT INTO city VALUES ('UNH', 'SG', 'Kabupaten', 'Konawe', '', '');
INSERT INTO city VALUES ('UNR', 'JT', 'Kabupaten', 'Semarang', '', '');
INSERT INTO city VALUES ('WAM', 'PA', 'Kabupaten', 'Jayawijaya', '', '');
INSERT INTO city VALUES ('WAS', 'PB', 'Kabupaten', 'Raja Ampat', '', '');
INSERT INTO city VALUES ('WAT', 'YO', 'Kabupaten', 'Kulon Progo', '', '');
INSERT INTO city VALUES ('WBL', 'NT', 'Kabupaten', 'Sumba Tengah', '', '');
INSERT INTO city VALUES ('WED', 'MU', 'Kabupaten', 'Halmahera Tengah', '', '');
INSERT INTO city VALUES ('WGD', 'SG', 'Kabupaten', 'Konawe Utara', '', '');
INSERT INTO city VALUES ('WGP', 'NT', 'Kabupaten', 'Sumba Timur', '', '');
INSERT INTO city VALUES ('WGW', 'SG', 'Kabupaten', 'Wakatobi', '', '');
INSERT INTO city VALUES ('WHO', 'NB', 'Kabupaten', 'Bima', '', '');
INSERT INTO city VALUES ('WKB', 'NT', 'Kabupaten', 'Sumba Barat', '', '');
INSERT INTO city VALUES ('WNG', 'JT', 'Kabupaten', 'Wonogiri', '', '');
INSERT INTO city VALUES ('WNO', 'YO', 'Kabupaten', 'Gunung Kidul', '', '');
INSERT INTO city VALUES ('WNS', 'SN', 'Kabupaten', 'Sopeng', '', '');
INSERT INTO city VALUES ('WRS', 'PA', 'Kabupaten', 'Keerom', '', '');
INSERT INTO city VALUES ('WSB', 'JT', 'Kabupaten', 'Wonosobo', '', '');
INSERT INTO city VALUES ('YYK', 'YO', 'Kota', 'Yogyakarta', '', '');

-- ----------------------------
-- Table structure for `country`
-- ----------------------------
DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `code_country` varchar(5) NOT NULL,
  `name_country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_country`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=1365;

-- ----------------------------
-- Records of country
-- ----------------------------
INSERT INTO country VALUES ('AUS', 'Australia');
INSERT INTO country VALUES ('CHN', 'China');
INSERT INTO country VALUES ('DEU', 'Jerman');
INSERT INTO country VALUES ('ENG', 'Inggris');
INSERT INTO country VALUES ('FRA', 'Perancis');
INSERT INTO country VALUES ('IDN', 'Indonesia');
INSERT INTO country VALUES ('ITA', 'Italia');
INSERT INTO country VALUES ('JPN', 'Jepang');
INSERT INTO country VALUES ('KOR', 'Republik Korea');
INSERT INTO country VALUES ('MYS', 'Malaysia');
INSERT INTO country VALUES ('SWE', 'Swedia');
INSERT INTO country VALUES ('USA', 'Amerika Serikat');

-- ----------------------------
-- Table structure for `cruds`
-- ----------------------------
DROP TABLE IF EXISTS `cruds`;
CREATE TABLE `cruds` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `gender` enum('men','woman') COLLATE utf8_unicode_ci NOT NULL,
  `photo` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cruds
-- ----------------------------
INSERT INTO cruds VALUES ('1', 'Dr. Jackeline Veum', 'Frami, Windler and Glover', 'woman', '', null, null);
INSERT INTO cruds VALUES ('2', 'Dorris Davis', 'Huel, Green and Steuber', 'men', '', null, null);
INSERT INTO cruds VALUES ('3', 'Prof. Mariana Sanford', 'Kassulke, O\'Keefe and Schuster', 'men', '', null, null);
INSERT INTO cruds VALUES ('5', 'Dr. Khalil Stoltenberg', 'Bartell-Witting', 'men', '', null, null);
INSERT INTO cruds VALUES ('6', 'Karianne Kertzmann', 'Smith, Prosacco and Koch', 'woman', '', null, null);
INSERT INTO cruds VALUES ('7', 'Alec Lemke', 'Roberts Inc', 'woman', '', null, null);
INSERT INTO cruds VALUES ('8', 'Prof. Kristin Collier DDS', 'Yundt Ltd', 'men', '', null, null);
INSERT INTO cruds VALUES ('9', 'Ms. Alexandra Witting', 'Gleason Ltd', 'woman', '', null, null);
INSERT INTO cruds VALUES ('10', 'Anastasia Satterfield', 'Olson, DuBuque and Hettinger', 'men', '', null, null);
INSERT INTO cruds VALUES ('11', 'tes', 'tes', 'men', 'm1p0Ty9BEt20160301181504.jpg', '2016-03-01 18:15:04', '2016-03-01 18:15:04');

-- ----------------------------
-- Table structure for `grouparisan`
-- ----------------------------
DROP TABLE IF EXISTS `grouparisan`;
CREATE TABLE `grouparisan` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `arisan_nama` varchar(100) NOT NULL,
  `arisan_createddate` datetime DEFAULT NULL,
  `arisan_createdby` int(11) DEFAULT NULL,
  `arisan_startdate` date NOT NULL,
  `arisan_numberperson` smallint(6) DEFAULT '10' COMMENT 'Jumlah peserta',
  `arisan_rulenumberperson` smallint(6) DEFAULT '1' COMMENT 'minimal jumlah yang dapat arisan',
  `arisan_repeatrule` smallint(6) DEFAULT '3' COMMENT '1:per hari\r\n2:per minggu\r\n3:per bulan',
  `arisan_bandar` int(11) NOT NULL DEFAULT '1' COMMENT 'yang menjadi bandar arisan',
  `arisan_bendahara` int(11) DEFAULT NULL COMMENT 'yang menjadi bendahara',
  `arisan_besararisan` decimal(11,0) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- ----------------------------
-- Records of grouparisan
-- ----------------------------

-- ----------------------------
-- Table structure for `journal`
-- ----------------------------
DROP TABLE IF EXISTS `journal`;
CREATE TABLE `journal` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `account_id` smallint(6) NOT NULL DEFAULT '1' COMMENT 'kode Akun',
  `journal_code` varchar(20) NOT NULL COMMENT 'kode transaksi',
  `journal_date` datetime DEFAULT NULL,
  `amount` decimal(11,2) DEFAULT '0.00',
  `journal_type` smallint(6) NOT NULL DEFAULT '1' COMMENT '1:Kredit\r\n2:Debit',
  `userid` int(11) DEFAULT NULL COMMENT 'yang melakukan transaksi',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 PACK_KEYS=0;

-- ----------------------------
-- Records of journal
-- ----------------------------

-- ----------------------------
-- Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `title` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `permalink` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `icon` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `controller` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menus_parent_id_index` (`parent_id`),
  KEY `menus_permalink_index` (`permalink`),
  KEY `menus_controller_index` (`controller`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO menus VALUES ('1', '0', 'Dashboard', 'dashboard', 'fa fa-dashboard', 'Backend\\DashboardController', '0', null, null);
INSERT INTO menus VALUES ('2', '0', 'User', '#', 'fa fa-user', '#', '1', null, null);
INSERT INTO menus VALUES ('3', '0', 'Sandbox', '#', 'fa fa-caret-square-o-right', '#', '99', null, null);
INSERT INTO menus VALUES ('4', '3', 'Crud Example', 'crud-example', '', 'Backend\\CrudController', '1', null, null);
INSERT INTO menus VALUES ('5', '2', 'Role ', 'role', '', 'Backend\\RoleController', '1', null, null);
INSERT INTO menus VALUES ('6', '2', 'User or Member', 'user', '', 'Backend\\UserController', '1', null, '2016-03-03 04:59:35');
INSERT INTO menus VALUES ('7', '3', 'Action Management', 'action-management', '', 'Backend\\ActionController', '2', null, null);
INSERT INTO menus VALUES ('8', '3', 'Menu Management', 'menu-management', '', 'Backend\\MenuController', '3', null, null);
INSERT INTO menus VALUES ('11', '0', 'Arisan Management', '', 'fa fa-file', '#', '1', '2016-03-03 05:31:32', '2016-03-03 05:31:32');
INSERT INTO menus VALUES ('12', '11', 'Create Arisan', 'create-arisan', '', 'Backend\\ArisanController', '1', '2016-03-03 05:31:54', '2016-03-03 05:31:54');

-- ----------------------------
-- Table structure for `menu_actions`
-- ----------------------------
DROP TABLE IF EXISTS `menu_actions`;
CREATE TABLE `menu_actions` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned NOT NULL,
  `action_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_actions_menu_id_foreign` (`menu_id`),
  KEY `menu_actions_action_id_foreign` (`action_id`),
  CONSTRAINT `menu_actions_action_id_foreign` FOREIGN KEY (`action_id`) REFERENCES `actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `menu_actions_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of menu_actions
-- ----------------------------
INSERT INTO menu_actions VALUES ('19', '5', '1', '2016-02-28 17:40:43', '2016-02-28 17:40:43');
INSERT INTO menu_actions VALUES ('20', '5', '2', '2016-02-28 17:40:43', '2016-02-28 17:40:43');
INSERT INTO menu_actions VALUES ('21', '5', '3', '2016-02-28 17:40:43', '2016-02-28 17:40:43');
INSERT INTO menu_actions VALUES ('22', '5', '6', '2016-02-28 17:40:43', '2016-02-28 17:40:43');
INSERT INTO menu_actions VALUES ('23', '5', '7', '2016-02-28 17:40:43', '2016-02-28 17:40:43');
INSERT INTO menu_actions VALUES ('24', '6', '1', '2016-02-28 17:40:55', '2016-02-28 17:40:55');
INSERT INTO menu_actions VALUES ('25', '6', '2', '2016-02-28 17:40:55', '2016-02-28 17:40:55');
INSERT INTO menu_actions VALUES ('26', '6', '3', '2016-02-28 17:40:55', '2016-02-28 17:40:55');
INSERT INTO menu_actions VALUES ('27', '6', '7', '2016-02-28 17:40:55', '2016-02-28 17:40:55');
INSERT INTO menu_actions VALUES ('28', '1', '1', '2016-02-28 17:41:16', '2016-02-28 17:41:16');
INSERT INTO menu_actions VALUES ('42', '4', '1', '2016-02-28 17:42:12', '2016-02-28 17:42:12');
INSERT INTO menu_actions VALUES ('43', '4', '2', '2016-02-28 17:42:12', '2016-02-28 17:42:12');
INSERT INTO menu_actions VALUES ('44', '4', '3', '2016-02-28 17:42:12', '2016-02-28 17:42:12');
INSERT INTO menu_actions VALUES ('45', '4', '7', '2016-02-28 17:42:12', '2016-02-28 17:42:12');
INSERT INTO menu_actions VALUES ('46', '7', '1', '2016-02-28 17:42:43', '2016-02-28 17:42:43');
INSERT INTO menu_actions VALUES ('47', '7', '2', '2016-02-28 17:42:43', '2016-02-28 17:42:43');
INSERT INTO menu_actions VALUES ('48', '7', '3', '2016-02-28 17:42:44', '2016-02-28 17:42:44');
INSERT INTO menu_actions VALUES ('49', '7', '7', '2016-02-28 17:42:44', '2016-02-28 17:42:44');
INSERT INTO menu_actions VALUES ('50', '8', '1', '2016-02-28 17:42:55', '2016-02-28 17:42:55');
INSERT INTO menu_actions VALUES ('51', '8', '2', '2016-02-28 17:42:55', '2016-02-28 17:42:55');
INSERT INTO menu_actions VALUES ('52', '8', '3', '2016-02-28 17:42:55', '2016-02-28 17:42:55');
INSERT INTO menu_actions VALUES ('53', '8', '6', '2016-02-28 17:42:55', '2016-02-28 17:42:55');
INSERT INTO menu_actions VALUES ('54', '8', '7', '2016-02-28 17:42:55', '2016-02-28 17:42:55');
INSERT INTO menu_actions VALUES ('69', '12', '1', '2016-03-03 06:36:40', '2016-03-03 06:36:40');
INSERT INTO menu_actions VALUES ('70', '12', '2', '2016-03-03 06:36:40', '2016-03-03 06:36:40');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO migrations VALUES ('2016_02_17_182212_create_roles_table', '1');
INSERT INTO migrations VALUES ('2016_02_17_182518_create_users_table', '1');
INSERT INTO migrations VALUES ('2016_02_17_183316_create_menus_table', '1');
INSERT INTO migrations VALUES ('2016_02_17_184125_update_users_table_add_facebook', '1');
INSERT INTO migrations VALUES ('2016_02_19_173350_create_cruds_table', '1');
INSERT INTO migrations VALUES ('2016_02_21_134953_create_actions_table', '1');
INSERT INTO migrations VALUES ('2016_02_23_171459_update_users_table_add_remember_token', '1');
INSERT INTO migrations VALUES ('2016_02_25_185321_create_menu_actions_table', '1');
INSERT INTO migrations VALUES ('2016_02_28_183253_create_rights_table', '1');
INSERT INTO migrations VALUES ('2016_03_03_050545_add_field_users_version1', '2');
INSERT INTO migrations VALUES ('2016_03_03_053514_create_arisans_table', '3');
INSERT INTO migrations VALUES ('2016_03_03_053837_create_arisan_details_table', '4');

-- ----------------------------
-- Table structure for `person`
-- ----------------------------
DROP TABLE IF EXISTS `person`;
CREATE TABLE `person` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `person_nik` varchar(50) DEFAULT NULL,
  `person_name` varchar(100) DEFAULT NULL,
  `person_address` text,
  `person_city` varchar(5) DEFAULT NULL,
  `person_postal_code` int(11) DEFAULT NULL,
  `person_phone` varchar(20) DEFAULT NULL,
  `person_birthday` date DEFAULT NULL,
  `person_birthplace` varchar(50) DEFAULT NULL,
  `person_sex` char(1) DEFAULT NULL,
  `person_marital` tinyint(4) DEFAULT NULL COMMENT '1: Belum Menikah\r\n2: Menikah\r\n3: Janda/Duda',
  `person_job` varchar(100) DEFAULT NULL,
  `person_status` tinyint(1) DEFAULT '1',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 AVG_ROW_LENGTH=8192;

-- ----------------------------
-- Records of person
-- ----------------------------
INSERT INTO person VALUES ('1', '2', '123456', 'Ibnu Triyardi', 'cilodong', 'depok', '12345', '12345', '1992-08-13', 'jakarta', 'M', '1', '8', '1', null, null);
INSERT INTO person VALUES ('2', '3', '2134818', 'anang fahmi syarif', 'jl. bslsjds', 'surab', '61122', '081231411833', '2002-02-19', 'Gresik ', 'M', '2', '8', '1', null, null);

-- ----------------------------
-- Table structure for `rights`
-- ----------------------------
DROP TABLE IF EXISTS `rights`;
CREATE TABLE `rights` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `menu_action_id` int(10) unsigned NOT NULL,
  `role_id` int(10) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `rights_menu_action_id_foreign` (`menu_action_id`),
  KEY `rights_role_id_foreign` (`role_id`),
  CONSTRAINT `rights_menu_action_id_foreign` FOREIGN KEY (`menu_action_id`) REFERENCES `menu_actions` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rights_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=126 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of rights
-- ----------------------------
INSERT INTO rights VALUES ('102', '42', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('103', '43', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('104', '44', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('105', '45', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('106', '46', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('107', '47', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('108', '48', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('109', '49', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('110', '50', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('111', '51', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('112', '52', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('113', '53', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('114', '54', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('115', '19', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('116', '20', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('117', '21', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('118', '22', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('119', '23', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('120', '24', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('121', '25', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('122', '26', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('123', '27', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('124', '69', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');
INSERT INTO rights VALUES ('125', '70', '1', '2016-03-03 06:37:17', '2016-03-03 06:37:17');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(225) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO roles VALUES ('1', 'Super Admin', null, null);
INSERT INTO roles VALUES ('3', 'Anggota', '2016-03-02 20:16:09', '2016-03-02 20:16:09');

-- ----------------------------
-- Table structure for `state`
-- ----------------------------
DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `code_state` varchar(10) NOT NULL,
  `code_country` varchar(5) DEFAULT NULL,
  `name_state` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`code_state`) USING BTREE,
  KEY `FK_state_has_brand` (`code_country`) USING BTREE,
  CONSTRAINT `FK_State_Has_County_new` FOREIGN KEY (`code_country`) REFERENCES `country` (`code_country`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AVG_ROW_LENGTH=481;

-- ----------------------------
-- Records of state
-- ----------------------------
INSERT INTO state VALUES ('AC', 'IDN', 'Nanggroe Aceh Darussalam');
INSERT INTO state VALUES ('BA', 'IDN', 'Bali');
INSERT INTO state VALUES ('BB', 'IDN', 'Bangka Belitung');
INSERT INTO state VALUES ('BE', 'IDN', 'Bengkulu');
INSERT INTO state VALUES ('BT', 'IDN', 'Banten');
INSERT INTO state VALUES ('GO', 'IDN', 'Gorontalo');
INSERT INTO state VALUES ('JA', 'IDN', 'Jambi');
INSERT INTO state VALUES ('JB', 'IDN', 'Jawa barat');
INSERT INTO state VALUES ('JI', 'IDN', 'Jawa Timur');
INSERT INTO state VALUES ('JK', 'IDN', 'DKI Jakarta');
INSERT INTO state VALUES ('JT', 'IDN', 'Jawa Tengah');
INSERT INTO state VALUES ('KB', 'IDN', 'Kalimantan Barat');
INSERT INTO state VALUES ('KI', 'IDN', 'Kalimantan Timur');
INSERT INTO state VALUES ('KR', 'IDN', 'Kepulauan Riau');
INSERT INTO state VALUES ('KS', 'IDN', 'Kalimantan Selatan');
INSERT INTO state VALUES ('KT', 'IDN', 'Kalimantan Tengah');
INSERT INTO state VALUES ('KU', 'IDN', 'Kalimantan Utara');
INSERT INTO state VALUES ('LA', 'IDN', 'Lampung');
INSERT INTO state VALUES ('MA', 'IDN', 'Maluku');
INSERT INTO state VALUES ('MU', 'IDN', 'Maluku Utara');
INSERT INTO state VALUES ('NB', 'IDN', 'Nusa Tenggara Barat');
INSERT INTO state VALUES ('NT', 'IDN', 'Nusa Tenggara Timur');
INSERT INTO state VALUES ('PA', 'IDN', 'Papua');
INSERT INTO state VALUES ('PB', 'IDN', 'Papua barat');
INSERT INTO state VALUES ('RI', 'IDN', 'Riau');
INSERT INTO state VALUES ('SA', 'IDN', 'Sulawesi utara');
INSERT INTO state VALUES ('SB', 'IDN', 'Sumatera Barat');
INSERT INTO state VALUES ('SG', 'IDN', 'Sulawesi Tenggara');
INSERT INTO state VALUES ('SN', 'IDN', 'Sulawesi Selatan');
INSERT INTO state VALUES ('SR', 'IDN', 'Sulawesi Barat');
INSERT INTO state VALUES ('SS', 'IDN', 'Sumatera Selatan');
INSERT INTO state VALUES ('ST', 'IDN', 'Sulawesi tengah');
INSERT INTO state VALUES ('SU', 'IDN', 'Sumatera Utara');
INSERT INTO state VALUES ('YO', 'IDN', 'Daerah Istimewa Yogyakarta (DIY)');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` int(10) unsigned NOT NULL,
  `twitter_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `facebook_id` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` enum('y','n') COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `remember_token` text COLLATE utf8_unicode_ci NOT NULL,
  `nik` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `address` text COLLATE utf8_unicode_ci NOT NULL,
  `postal_code` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `birthday` datetime NOT NULL,
  `birthplace` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `sex` enum('Male','Female') COLLATE utf8_unicode_ci NOT NULL,
  `marital` enum('Single','Married') COLLATE utf8_unicode_ci NOT NULL,
  `job` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `users_role_id_foreign` (`role_id`),
  KEY `users_username_index` (`username`),
  KEY `users_email_index` (`email`),
  KEY `users_facebook_id_index` (`facebook_id`),
  KEY `users_twitter_id_index` (`twitter_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO users VALUES ('1', '1', '', '', 'reza', '$2y$10$XbAZjQh5E1xWuoaP0Q6NcuCBpTgeMW0fT9FNF45RZ0ocvxGGDBdJ6', 'Muhamad Reza AR', 'reza.wikrama3@gmail.com', 'T0aM3XnkPK20160223163453.jpg', 'y', null, '2016-03-01 18:30:04', 'nZfArdLkdVCBzJT9BQiErwKXaiivUvgcXOgz2LA8L9t2YvqXj2eGtAcQR57J', '', '', '', '', '0000-00-00 00:00:00', '', 'Male', 'Single', '');
INSERT INTO users VALUES ('8', '3', '', '', 'asdf', '$2y$10$c6oEnZqnYWzSAKZG34Y8b.ELZLpiCJv2DZBPe0zyFhSJUPSRxB11W', 'asdf', 'asdf@asdf.com', 'atM8T85YHZ20160303052633.jpg', 'y', '2016-03-03 05:26:34', '2016-03-03 05:26:34', '', 'asdf', 'sadf', '546', '464', '2012-12-12 00:00:00', 'bogor', '', '', 'asdfjldsjflds');
INSERT INTO users VALUES ('9', '3', '', '', 'linggar', '$2y$10$dDTZBJvKAExXD4q3Y5ax4OrJnTizfVerT26YH66FOnxAm5GybDfbG', 'Linggar Pangestu', 'linggar@linggar.com', 'ZO9VtOGcnw20160303053043.png', 'y', '2016-03-03 05:30:44', '2016-03-03 05:30:44', '', '10902366', 'garut', '111', '1111', '2012-12-12 00:00:00', 'garut', '', '', 'SEM');
