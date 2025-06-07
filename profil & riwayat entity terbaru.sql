/* Entity Profile & Riwayat Terbaru */


-- Profil print
select *
from "rfojk-terbaru".profil_entity_sprint pes ;

-- Profil dapok
select *
from "rfojk-terbaru".profil_entity_dapok ped;

-- Profil sipm
select *
from "rfojk-terbaru".profil_entity_sipm;

-- Profil apkap
select *
from "rfojk-terbaru".profil_entity_apkap;


DROP VIEW IF EXISTS "rfojk-terbaru".vw_profil_entity_union;

CREATE VIEW "rfojk-terbaru".vw_profil_entity_union AS
SELECT
    'SPRINT' AS "Application",
    "InstitutionProfileID",
    "InstitutionName",
    "IDOrigin",
    "NPWP",
    "CompanyEmail",
    "HeadOfficeAddress",
    "WebAddress"
FROM "rfojk-terbaru".profil_entity_sprint
UNION
SELECT
    'DAPOK' AS "Application",
    "InstitutionProfileID",
    "InstitutionName",
    "IDOrigin",
    "NPWP",
    "CompanyEmail",
    "HeadOfficeAddress",
    "WebAddress"
FROM "rfojk-terbaru".profil_entity_dapok
UNION
SELECT
    'SIPM' AS "Application",
    "InstitutionProfileID",
    "InstitutionName",
    "IDOrigin",
    "NPWP",
    "CompanyEmail",
    "HeadOfficeAddress",
    "WebAddress"
FROM "rfojk-terbaru".profil_entity_sipm
UNION
SELECT
    'APKAP' AS "Application",
    "InstitutionProfileID",
    "InstitutionName",
    "IDOrigin",
    "NPWP",
    "CompanyEmail",
    "HeadOfficeAddress",
    "WebAddress"
FROM "rfojk-terbaru".profil_entity_apkap;

-- 2. Buat datamart dengan semua kolom VARCHAR
DROP TABLE IF EXISTS "rfojk-terbaru".dm_profil_entity_union;

CREATE TABLE "rfojk-terbaru".dm_profil_entity_union (
    "Application" VARCHAR,
    "InstitutionProfileID" VARCHAR,
    "InstitutionName" VARCHAR,
    "IDOrigin" VARCHAR,
    "NPWP" VARCHAR,
    "CompanyEmail" VARCHAR,
    "HeadOfficeAddress" VARCHAR,
    "WebAddress" VARCHAR
);

-- 3. Masukkan data dari temp ke datamart
INSERT INTO "rfojk-terbaru".dm_profil_entity_union
SELECT
    "Application"::VARCHAR,
    "InstitutionProfileID"::VARCHAR,
    "InstitutionName"::VARCHAR,
    "IDOrigin"::VARCHAR,
    "NPWP"::VARCHAR,
    "CompanyEmail"::VARCHAR,
    "HeadOfficeAddress"::VARCHAR,
    "WebAddress"::VARCHAR
FROM "rfojk-terbaru".vw_profil_entity_union;


----------------------------------------------------------
-- riwayat pendirian sprint
select *
from "rfojk-terbaru".riwayat_pendirian_sprint rps ;

-- riwayat pendirian dapok
select *
from "rfojk-terbaru".riwayat_pendirian_dapok rpd;

-- riwayat pendirian sipm
select *
from "rfojk-terbaru".riwayat_pendirian_sipm rpsi;

-- riwayat pendirian apkap
select *
from "rfojk-terbaru".riwayat_pendirian_apkap rpa; 

-- union 
-- riwayat pendirian sprint
DROP VIEW IF EXISTS "rfojk-terbaru".vw_riwayat_pendirian_union;

CREATE VIEW "rfojk-terbaru".vw_riwayat_pendirian_union AS
select
	'SPRINT' as "Application",
	"InstitutionProfileID",
	"IDOrigin" ,
	"Sector" ,
	"SubSector" ,
	"SubSubSector" ,
	"LegalEntity" ,
	"LicenseType" ,
	"LicenseNumber" ,
	"LicenseDate" 
from "rfojk-terbaru".riwayat_pendirian_sprint rps
union
-- riwayat pendirian dapok
select
	'DAPOK' as "Application",
	"InstitutionProfileID",
	"IDOrigin" ,
	"Sector" ,
	"SubSector" ,
	"SubSubSector" ,
	"LegalEntity" ,
	"LicenseType" ,
	"LicenseNumber" ,
	"LicenseDate" 
from "rfojk-terbaru".riwayat_pendirian_dapok rpd
union
-- riwayat pendirian sipm
select
	'SIPM' as "Application",	
	"InstitutionProfileID",
	"IDOrigin" ,
	"Sector" ,
	"SubSector" ,
	"SubSubSector" ,
	"LegalEntity" ,
	"LicenseType" ,
	"LicenseNumber" ,
	"LicenseDate" 
from "rfojk-terbaru".riwayat_pendirian_sipm rpsi
union
-- riwayat pendirian apkap
select
	'APKAP' as "Application",
	"InstitutionProfileID",
	"IDOrigin" ,
	"Sector" ,
	"SubSector" ,
	"SubSubSector" ,
	"LegalEntity" ,
	"LicenseType" ,
	"LicenseNumber" ,
	"LicenseDate" 
from "rfojk-terbaru".riwayat_pendirian_apkap rpa; 

-- 2. Buat datamart dengan semua kolom VARCHAR
DROP TABLE IF EXISTS "rfojk-terbaru".dm_riwayat_pendirian_union;

CREATE TABLE "rfojk-terbaru".dm_riwayat_pendirian_union (
    "Application" VARCHAR,
	"InstitutionProfileID" VARCHAR,
	"IDOrigin" VARCHAR,
	"Sector" VARCHAR,
	"SubSector" VARCHAR,
	"SubSubSector" VARCHAR,
	"LegalEntity" VARCHAR,
	"LicenseType"VARCHAR ,
	"LicenseNumber" VARCHAR,
	"LicenseDate" VARCHAR
);

-- 3. Masukkan data dari temp ke datamart
INSERT INTO "rfojk-terbaru".dm_riwayat_pendirian_union
SELECT
    "Application" :: VARCHAR,
	"InstitutionProfileID" :: VARCHAR,
	"IDOrigin" ::VARCHAR,
	"Sector" ::VARCHAR,
	"SubSector" ::VARCHAR,
	"SubSubSector" ::VARCHAR,
	"LegalEntity" ::VARCHAR,
	"LicenseType" ::VARCHAR ,
	"LicenseNumber" ::VARCHAR,
	"LicenseDate" ::VARCHAR
FROM "rfojk-terbaru".vw_riwayat_pendirian_union;


select *
from "rfojk-terbaru".vw_riwayat_pendirian_union ;
select *
from "rfojk-terbaru".dm_riwayat_pendirian_union drpu ;


--------------------------------------------------
-- riwayat direksi
select *
from "rfojk-terbaru".riwayat_direksi_sprint rds ;

select *
from "rfojk-terbaru".riwayat_direksi_dapok rdd ;

select *
from "rfojk-terbaru".riwayat_direksi_sipm rds ;

select *
from "rfojk-terbaru".riwayat_komisaris_sprint rks ;

select *
from "rfojk-terbaru".riwayat_komisaris_dapok rkd ;

select *
from "rfojk-terbaru".riwayat_komisaris_sipm rks ;

-- union 
-- riwayat direksi & komisaris
DROP VIEW IF EXISTS "rfojk-terbaru".vw_riwayat_direksi_komisaris_union;

CREATE VIEW "rfojk-terbaru".vw_riwayat_direksi_komisaris_union AS
select
	'SPRINT' as "Application",
	'Direktur' as position_name,
	"InstitutionProfileID" ,
	"CommissionerName" ,
	"CommissionerNationality" ,
	"CommissionerNIK" ,
	"CommissionerPassport" ,
	"Position" ,
	"OfficiateEffectiveDate" ,
	"OfficiateEndDate" ,
	"OfficiateInactiveDate" 
from "rfojk-terbaru".riwayat_direksi_sprint rds
union
select
	'DAPOK' as "Application",
	'Direktur' as position_name,
	"InstitutionProfileID" ,
	"CommissionerName" ,
	"CommissionerNationality" ,
	"CommissionerNIK" ,
	"CommissionerPassport" ,
	"Position" ,
	"OfficiateEffectiveDate" ,
	"OfficiateEndDate" ,
	"OfficiateInactiveDate" 
from "rfojk-terbaru".riwayat_direksi_dapok rdd
union
select
	'SIPM' as "Application",
	'Direktur' as position_name,
	"InstitutionProfileID" ,
	"CommissionerName" ,
	"CommissionerNationality" ,
	"CommissionerNIK" ,
	"CommissionerPassport" ,
	"Position" ,
	"OfficiateEffectiveDate" ,
	"OfficiateEndDate" ,
	"OfficiateInactiveDate" 
from "rfojk-terbaru".riwayat_direksi_sipm rds
union
select
	'SPRINT' as "Application",
	'Komisaris' as position_name,
	"InstitutionProfileID" ,
	"CommissionerName" ,
	"CommissionerNationality" ,
	"CommissionerNIK" ,
	"CommissionerPassport" ,
	"Position" ,
	"OfficiateEffectiveDate" ,
	"OfficiateEndDate" ,
	"OfficiateInactiveDate" 
from "rfojk-terbaru".riwayat_komisaris_sprint rks
union
select
	'DAPOK' as "Application",
	'Komisaris' as position_name,
	"InstitutionProfileID" ,
	"CommissionerName" ,
	"CommissionerNationality" ,
	"CommissionerNIK" ,
	"CommissionerPassport" ,
	"Position" ,
	"OfficiateEffectiveDate" ,
	"OfficiateEndDate" ,
	"OfficiateInactiveDate" 
from "rfojk-terbaru".riwayat_komisaris_dapok rkd
union
select
	'SIPM' as "Application",
	'Komisaris' as position_name,
	"InstitutionProfileID" ,
	"CommissionerName" ,
	"CommissionerNationality" ,
	"CommissionerNIK" ,
	"CommissionerPassport" ,
	"Position" ,
	"OfficiateEffectiveDate" ,
	"OfficiateEndDate" ,
	"OfficiateInactiveDate" 
from "rfojk-terbaru".riwayat_komisaris_sipm rks ;

-- 2. Buat datamart dengan semua kolom VARCHAR
DROP TABLE IF EXISTS "rfojk-terbaru".dm_riwayat_direksi_komisaris_union;

CREATE TABLE "rfojk-terbaru".dm_riwayat_direksi_komisaris_union (
    "Application" VARCHAR,
	position_name VARCHAR,
	"InstitutionProfileID" VARCHAR,
	"CommissionerName" VARCHAR,
	"CommissionerNationality" VARCHAR,
	"CommissionerNIK" VARCHAR,
	"CommissionerPassport" VARCHAR,
	"Position" VARCHAR,
	"OfficiateEffectiveDate" VARCHAR,
	"OfficiateEndDate" VARCHAR,
	"OfficiateInactiveDate" VARCHAR
);

-- 3. Masukkan data dari temp ke datamart
INSERT INTO "rfojk-terbaru".dm_riwayat_direksi_komisaris_union
SELECT
    "Application" ::VARCHAR,
	position_name ::VARCHAR,
	"InstitutionProfileID" ::VARCHAR,
	"CommissionerName" ::VARCHAR,
	"CommissionerNationality" ::VARCHAR,
	"CommissionerNIK" ::VARCHAR,
	"CommissionerPassport" ::VARCHAR,
	"Position" ::VARCHAR,
	"OfficiateEffectiveDate" ::VARCHAR,
	"OfficiateEndDate" ::VARCHAR,
	"OfficiateInactiveDate" ::VARCHAR
FROM "rfojk-terbaru".vw_riwayat_direksi_komisaris_union;

select *
from "rfojk-terbaru".vw_riwayat_direksi_komisaris_union;

select *
from "rfojk-terbaru".dm_riwayat_direksi_komisaris_union;

--------------------------------------------------
select *
from "rfojk-terbaru".riwayat_pemegang_saham_dapok rpsd ;

select *
from "rfojk-terbaru".riwayat_pemegang_saham_sipm rpss ;

-- union
DROP VIEW IF EXISTS "rfojk-terbaru".vw_riwayat_pemegang_saham_union;

CREATE VIEW "rfojk-terbaru".vw_riwayat_pemegang_saham_union AS
select
	'DAPOK' as "Application",
	"InstitutionProfileID" ,
	"IndividualOwnerName",
	"IndividualOwnerNIK",
	"IndividualOwnerNPWP",
	"OwnershipValue",
	"OwnershipPercentage"
from "rfojk-terbaru".riwayat_pemegang_saham_dapok rpsd
union 
select
	'SIPM' as "Application",
	"InstitutionProfileID" ,
	"IndividualOwnerName",
	"IndividualOwnerNIK",
	"IndividualOwnerNPWP",
	"OwnershipValue",
	"OwnershipPercentage"
from "rfojk-terbaru".riwayat_pemegang_saham_sipm rpss ;


drop table if exists "rfojk-terbaru".dm_riwayat_pemegang_saham_union;

create table "rfojk-terbaru".dm_riwayat_pemegang_saham_union (
	"Application" VARCHAR,
	"InstitutionProfileID" VARCHAR,
	"IndividualOwnerName" VARCHAR,
	"IndividualOwnerNIK" VARCHAR,
	"IndividualOwnerNPWP" VARCHAR,
	"OwnershipValue" VARCHAR,
	"OwnershipPercentage" VARCHAR
);

insert into "rfojk-terbaru".dm_riwayat_pemegang_saham_union
select 
	"Application" ::VARCHAR,
	"InstitutionProfileID" ::VARCHAR,
	"IndividualOwnerName" ::VARCHAR,
	"IndividualOwnerNIK" ::VARCHAR,
	"IndividualOwnerNPWP" ::VARCHAR,
	"OwnershipValue" ::VARCHAR,
	"OwnershipPercentage" ::VARCHAR
from "rfojk-terbaru".vw_riwayat_pemegang_saham_union;




-----------------------------------------------------
select *
from "rfojk-terbaru".riwayat_produk_aktivitas_sprint rpas ;

select *
from "rfojk-terbaru".riwayat_produk_aktivitas_dapok rpad2 ;

-- union 
drop view if exists "rfojk-terbaru".vw_riwayat_produk_aktivitas_union;

create view "rfojk-terbaru".vw_riwayat_produk_aktivitas_union as
select
	'SPRINT' as "Application",
	"InstitutionProfileID" ,
	"ProductName",
	"ProductDescription",
	"ProductType",
	"LetterNumber",
	"LetterDate",
	"ProdutEffectiveDate",
	"ProductStatus"
from "rfojk-terbaru".riwayat_produk_aktivitas_sprint rpas
union
select
	'DAPOK' as "Application",
	"InstitutionProfileID" ,
	"ProductName",
	"ProductDescription",
	"ProductType",
	"LetterNumber",
	"LetterDate",
	"ProdutEffectiveDate",
	"ProductStatus"
from "rfojk-terbaru".riwayat_produk_aktivitas_dapok rpad2 ;


drop table if exists "rfojk-terbaru".dm_riwayat_produk_aktivitas_union;

create table "rfojk-terbaru".dm_riwayat_produk_aktivitas_union (
	"Application" VARCHAR,
	"InstitutionProfileID" VARCHAR,
	"ProductName" VARCHAR,
	"ProductDescription" VARCHAR,
	"ProductType" VARCHAR,
	"LetterNumber" VARCHAR,
	"LetterDate" VARCHAR,
	"ProdutEffectiveDate" VARCHAR,
	"ProductStatus" VARCHAR
);

insert into "rfojk-terbaru".dm_riwayat_produk_aktivitas_union 
select 
	"Application" ::VARCHAR,
	"InstitutionProfileID" ::VARCHAR,
	"ProductName" ::VARCHAR,
	"ProductDescription" ::VARCHAR,
	"ProductType" ::VARCHAR,
	"LetterNumber" ::VARCHAR,
	"LetterDate" ::VARCHAR,
	"ProdutEffectiveDate" ::VARCHAR,
	"ProductStatus" ::VARCHAR
from "rfojk-terbaru".vw_riwayat_produk_aktivitas_union;


------------------------DPS------------------------
select *
from "rfojk-terbaru".riwayat_dps_dapok rdd ;


drop view if exists "rfojk-terbaru".vw_riwayat_dps_union;

create view "rfojk-terbaru".vw_riwayat_dps_union as 
select 
	'DAPOK' as "Application",
	"InstitutionProfileID" ,
	"Position",
	"ShariaSupervisoryBoardName",
	"ShariaSupervisoryBoardNationality",
	"ShariaSupervisoryBoardNIK",
	"ShariaSupervisoryBoardPassport",
	"OfficiateEffectiveDate",
	"OfficiateEndDate",
	"OfficiateInactiveDate"
from "rfojk-terbaru".riwayat_dps_dapok rdd ;


drop table if exists "rfojk-terbaru".dm_riwayat_dps_union;

create table "rfojk-terbaru".dm_riwayat_dps_union (
	"Application" VARCHAR,
	"InstitutionProfileID" VARCHAR,
	"Position" VARCHAR,
	"ShariaSupervisoryBoardName" VARCHAR,
	"ShariaSupervisoryBoardNationality" VARCHAR,
	"ShariaSupervisoryBoardNIK" VARCHAR,
	"ShariaSupervisoryBoardPassport" VARCHAR,
	"OfficiateEffectiveDate" VARCHAR,
	"OfficiateEndDate" VARCHAR,
	"OfficiateInactiveDate" VARCHAR
)

insert into "rfojk-terbaru".dm_riwayat_dps_union
select 
	"Application" :: VARCHAR,
	"InstitutionProfileID" :: VARCHAR,
	"Position" :: VARCHAR,
	"ShariaSupervisoryBoardName" ::VARCHAR,
	"ShariaSupervisoryBoardNationality" ::VARCHAR,
	"ShariaSupervisoryBoardNIK" ::VARCHAR,
	"ShariaSupervisoryBoardPassport" ::VARCHAR,
	"OfficiateEffectiveDate" ::VARCHAR,
	"OfficiateEndDate" ::VARCHAR,
	"OfficiateInactiveDate" ::VARCHAR
from "rfojk-terbaru".vw_riwayat_dps_union;




----------------------------------------------------------------------------------------------

----------------------------------------------------------------------------------------------
select count(*)
from "rfojk-terbaru".profil_entity_sprint pes ;

select *
from "rfojk-python".profil_entity_sprint pes ;


--------------------
select *
from rfojk_python.profil_entity_apkap pea ;

select *
from rfojk_python.profil_entity_dapok ped ;

select *
from rfojk_python.profil_entity_sipm pes ;

select *
from rfojk_python.profil_entity_sprint pes;


-------------------
select *
from rfojk_python.riwayat_pendirian_apkap pea ;

select *
from rfojk_python.riwayat_pendirian_dapok ped ;

select *
from rfojk_python.riwayat_pendirian_sipm pes ;

select *
from rfojk_python.riwayat_pendirian_sprint pes;

-------------------
select *
from rfojk_python.riwayat_direksi_apkap pea ;

select *
from rfojk_python.riwayat_direksi_dapok ped ;

select *
from rfojk_python.riwayat_direksi_sipm pes ;

select *
from rfojk_python.riwayat_direksi_sprint pes;


------------------
select *
from rfojk_python.dm_profil_entity_union;

select *
from rfojk_python.dm_riwayat_direksi_komisaris_union drdku ;

select *
from rfojk_python.dm_riwayat_pendirian_union drpu ;

select *
from rfojk_python.dm_riwayat_pemegang_saham_union drpsu ;

select *
from rfojk_python.dm_riwayat_produk_aktivitas_union drpau ;

select *
from rfojk_python.dm_riwayat_dps_union drdu ;


-------------------
/* LEFT JOIN */

create table if not exists rfojk_python.dm_left_join_all_data as
select 
	a.application,
	a.institutionprofileid,
	a.institutionname,
	a.companyemail,
	a.headofficeaddress,
	a.npwp,
	a.webaddress,
	b.sector,
	b.subsector,
	b.subsubsector,
	b.legalentity,
	b.licensedate,
	b.licensenumber,
	b.licensetype,
	b.statusljk,
	c.commissionername,
	c.commissionernationality,
	c.commissionernik,
	c.commissionerpassport,
	c."position" as position_commissioner,
	c.officiateeffectivedate,
	c.officiateenddate,
	c.officiateinactivedate as officiateinactivedate_commissioner,
	d.individualownername,
	d.individualownernik,
	d.individualownernpwp,
	d.ownershippercentage,
	d.ownershipvalue,
	e.productname,
	e.producttype,
	e.productstatus,
	e.produteffectivedate,
	e.letterdate,
	e.letternumber,
	f.shariasupervisoryboardname,
	f.shariasupervisoryboardnationality,
	f.shariasupervisoryboardnik,
	f.shariasupervisoryboardpassport,
	f."position" as position_dps,
	f.officiateeffectivedate as effectivedate_dps,
	f.officiateinactivedate as officiateinactivedate_dps
from rfojk_python.dm_profil_entity_union a
left join rfojk_python.dm_riwayat_pendirian_union b using (institutionprofileid)
left join rfojk_python.dm_riwayat_direksi_komisaris_union c using (institutionprofileid)
left join rfojk_python.dm_riwayat_pemegang_saham_union d using (institutionprofileid)
left join rfojk_python.dm_riwayat_produk_aktivitas_union e using (institutionprofileid)
left join rfojk_python.dm_riwayat_dps_union f using (institutionprofileid);


create view rfojk_python.vw_dm_left_join_sample as
select distinct *
from rfojk_python.dm_left_join_all_data dljad 
where institutionprofileid = 'ENT|4376' ;


--------------------
SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'rfojk_python'
  AND table_name = 'riwayat_produk_aktivitas_sipm';

SELECT * FROM information_schema.tables 
WHERE table_schema = 'rfojk_python' 
AND table_name ILIKE 'riwayat_%'

