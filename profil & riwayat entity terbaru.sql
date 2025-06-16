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

create table if not exists rfojk_python.dm_inner_join_all_data as
--create view rfojk_python.vw_inner_join_all as
select 
	a.application as profil_application,
	a.institutionprofileid as profil_institutionprofileid,
	a.idorigin as profil_idorigin,
	a.institutionname as profil_institutionname,
	a.companyemail as profil_companyemail,
	a.headofficeaddress as profil_headofficeaddress,
	a.npwp as profil_npwp,
	a.webaddress as profil_webaddress,
	b.sector as pendirian_sector,
	b.subsector as pendirian_subsector,
	b.subsubsector as pendirian_subsubsector,
	b.legalentity as pendirian_legalentity,
	b.licensedate as pendirian_licensedate,
	b.licensenumber as pendirian_licensenumber,
	b.licensetype as pendirian_licensetype,
	b.statusljk as pendirian_statusljk,
	c.commissionername as dirkom_commissionername,
	c.commissionernationality as dirkom_commissionernationality,
	c.commissionernik as dirkom_commissionernik,
	c.commissionerpassport as dirkom_commissionerpassport,
	c.position as dirkom_position,
	c.officiateeffectivedate as dirkom_officiateeffectivedate,
	c.officiateenddate as dirkom_officiateenddate,
	c.officiateinactivedate as dirkom_officiateinactivedate,
	d.individualownername as saham_individualownername,
	d.individualownernik as saham_individualownernik,
	d.individualownernpwp as saham_individualownernpwp,
	d.ownershippercentage as saham_ownershippercentage,
	d.ownershipvalue as saham_ownershipvalue,
	e.productname,
	e.producttype,
	e.productstatus,
	e.produteffectivedate,
	e.letterdate as produk_letterdate,
	e.letternumber as produk_letternumber,
	f.shariasupervisoryboardname as dps_shariasupervisoryboardname,
	f.shariasupervisoryboardnationality as dps_shariasupervisoryboardnationality,
	f.shariasupervisoryboardnik as dps_shariasupervisoryboardnik,
	f.shariasupervisoryboardpassport as dps_shariasupervisoryboardpassport,
	f."position" as dps_position,
	f.officiateeffectivedate as dps_effectivedate,
	f.officiateinactivedate as dps_officiateinactivedate
from rfojk_python.dm_profil_entity_union a
inner join rfojk_python.dm_riwayat_pendirian_union b using (institutionprofileid)
inner join rfojk_python.dm_riwayat_direksi_komisaris_union c using (institutionprofileid)
inner join rfojk_python.dm_riwayat_pemegang_saham_union d using (institutionprofileid)
inner join rfojk_python.dm_riwayat_produk_aktivitas_union e using (institutionprofileid)
inner join rfojk_python.dm_riwayat_dps_union f using (institutionprofileid);

select *
from rfojk_python.vw_inner_join_all vija ;

select *
from rfojk_python.dm_riwayat_direksi_komisaris_union drdku
where institutionprofileid in ('PRMRY|981', 'PRMRY|975');


--- INNER JOIN 
create view rfojk_python.vw_profil_entity_agg_relations as
with 
pendirian as (
    select institutionprofileid, count(*) as jml_pendirian
    from rfojk_python.dm_riwayat_pendirian_union
    group by institutionprofileid
),
direksi as (
    select institutionprofileid, count(*) as jml_direksi_komisaris
    from rfojk_python.dm_riwayat_direksi_komisaris_union
    group by institutionprofileid
),
pemegang as (
    select institutionprofileid, count(*) as jml_pemegang_saham
    from rfojk_python.dm_riwayat_pemegang_saham_union
    group by institutionprofileid
),
produk as (
    select institutionprofileid, count(*) as jml_produk_aktivitas
    from rfojk_python.dm_riwayat_produk_aktivitas_union
    group by institutionprofileid
),
dps as (
    select institutionprofileid, count(*) as jml_dps
    from rfojk_python.dm_riwayat_dps_union
    group by institutionprofileid
)
select 
	a. *,
    coalesce(b.jml_pendirian, 0) as jml_match_pendirian,
    coalesce(c.jml_direksi_komisaris, 0) as jml_match_direksi_komisaris,
    coalesce(d.jml_pemegang_saham, 0) as jml_match_pemegang_saham,
    coalesce(e.jml_produk_aktivitas, 0) as jml_match_produk_aktivitas,
    coalesce(f.jml_dps, 0) as jml_match_dps
from rfojk_python.dm_profil_entity_union a
left join pendirian b using (institutionprofileid)
left join direksi c using (institutionprofileid)
left join pemegang d using (institutionprofileid)
left join produk e using (institutionprofileid)
left join dps f using (institutionprofileid);



-- PROFIL ENTITY
create view rfojk_python.vw_profil_entity_agg_relations as
with 
pendirian as (
    select institutionprofileid, count(*) as jml_pendirian
    from rfojk_python.dm_riwayat_pendirian_union
    group by institutionprofileid
),
direksi as (
    select institutionprofileid, count(*) as jml_direksi_komisaris
    from rfojk_python.dm_riwayat_direksi_komisaris_union
    group by institutionprofileid
),
pemegang as (
    select institutionprofileid, count(*) as jml_pemegang_saham
    from rfojk_python.dm_riwayat_pemegang_saham_union
    group by institutionprofileid
),
produk as (
    select institutionprofileid, count(*) as jml_produk_aktivitas
    from rfojk_python.dm_riwayat_produk_aktivitas_union
    group by institutionprofileid
),
dps as (
    select institutionprofileid, count(*) as jml_dps
    from rfojk_python.dm_riwayat_dps_union
    group by institutionprofileid
)
select 
	a. *,
    coalesce(b.jml_pendirian, 0) as jml_match_pendirian,
    coalesce(c.jml_direksi_komisaris, 0) as jml_match_direksi_komisaris,
    coalesce(d.jml_pemegang_saham, 0) as jml_match_pemegang_saham,
    coalesce(e.jml_produk_aktivitas, 0) as jml_match_produk_aktivitas,
    coalesce(f.jml_dps, 0) as jml_match_dps
from rfojk_python.dm_profil_entity_union a
left join pendirian b using (institutionprofileid)
left join direksi c using (institutionprofileid)
left join pemegang d using (institutionprofileid)
left join produk e using (institutionprofileid)
left join dps f using (institutionprofileid);

-- Riwayat Pendirian
create view rfojk_python.vw_riwayat_pendirian_agg_relations as
with 
profil as (
    select institutionprofileid, count(*) as jml_profil
    from rfojk_python.dm_profil_entity_union
    group by institutionprofileid
),
direksi as (
    select institutionprofileid, count(*) as jml_direksi_komisaris
    from rfojk_python.dm_riwayat_direksi_komisaris_union
    group by institutionprofileid
),
pemegang as (
    select institutionprofileid, count(*) as jml_pemegang_saham
    from rfojk_python.dm_riwayat_pemegang_saham_union
    group by institutionprofileid
),
produk as (
    select institutionprofileid, count(*) as jml_produk_aktivitas
    from rfojk_python.dm_riwayat_produk_aktivitas_union
    group by institutionprofileid
),
dps as (
    select institutionprofileid, count(*) as jml_dps
    from rfojk_python.dm_riwayat_dps_union
    group by institutionprofileid
)
select 
	a. *,
    coalesce(b.jml_profil, 0) as jml_match_profil
    coalesce(c.jml_direksi_komisaris, 0) as jml_match_direksi_komisaris,
    coalesce(d.jml_pemegang_saham, 0) as jml_match_pemegang_saham,
    coalesce(e.jml_produk_aktivitas, 0) as jml_match_produk_aktivitas,
    coalesce(f.jml_dps, 0) as jml_match_dps
from rfojk_python.dm_riwayat_pendirian_union a
left join pendirian b using (institutionprofileid)
left join direksi c using (institutionprofileid)
left join pemegang d using (institutionprofileid)
left join produk e using (institutionprofileid)
left join dps f using (institutionprofileid);



--Riwayat Direksi & Komisaris
create view rfojk_python.vw_riwayat_direksi_komisaris_agg_relations as
with 
profil as (
    select institutionprofileid, count(*) as jml_profil
    from rfojk_python.dm_profil_entity_union
    group by institutionprofileid
),
pendirian as (
    select institutionprofileid, count(*) as jml_pendirian
    from rfojk_python.dm_riwayat_pendirian_union
    group by institutionprofileid
),
pemegang as (
    select institutionprofileid, count(*) as jml_pemegang_saham
    from rfojk_python.dm_riwayat_pemegang_saham_union
    group by institutionprofileid
),
produk as (
    select institutionprofileid, count(*) as jml_produk_aktivitas
    from rfojk_python.dm_riwayat_produk_aktivitas_union
    group by institutionprofileid
),
dps as (
    select institutionprofileid, count(*) as jml_dps
    from rfojk_python.dm_riwayat_dps_union
    group by institutionprofileid
)
select 
	a. *,
    coalesce(b.jml_profil, 0) as jml_match_profil,
    coalesce(c.jml_pendirian, 0) as jml_match_pendirian,
    coalesce(d.jml_pemegang_saham, 0) as jml_match_pemegang_saham,
    coalesce(e.jml_produk_aktivitas, 0) as jml_match_produk_aktivitas,
    coalesce(f.jml_dps, 0) as jml_match_dps
from rfojk_python.dm_riwayat_direksi_komisaris_union a
left join profil b using (institutionprofileid)
left join pendirian c using (institutionprofileid)
left join pemegang d using (institutionprofileid)
left join produk e using (institutionprofileid)
left join dps f using (institutionprofileid);


--Riwayat Pemegang Saham
create view rfojk_python.vw_riwayat_pemegang_saham_agg_relations as
with 
profil as (
    select institutionprofileid, count(*) as jml_profil
    from rfojk_python.dm_profil_entity_union
    group by institutionprofileid
),
pendirian as (
    select institutionprofileid, count(*) as jml_pendirian
    from rfojk_python.dm_riwayat_pendirian_union
    group by institutionprofileid
),
dirkom as (
    select institutionprofileid, count(*) as jml_direksi_komisaris
    from rfojk_python.dm_riwayat_direksi_komisaris_union
    group by institutionprofileid
),
produk as (
    select institutionprofileid, count(*) as jml_produk_aktivitas
    from rfojk_python.dm_riwayat_produk_aktivitas_union
    group by institutionprofileid
),
dps as (
    select institutionprofileid, count(*) as jml_dps
    from rfojk_python.dm_riwayat_dps_union
    group by institutionprofileid
)
select 
	a. *,
    coalesce(b.jml_profil, 0) as jml_match_profil,
    coalesce(c.jml_pendirian, 0) as jml_match_pendirian,
    coalesce(d.jml_direksi_komisaris, 0) as jml_match_direksi_komisaris,
    coalesce(e.jml_produk_aktivitas, 0) as jml_match_produk_aktivitas,
    coalesce(f.jml_dps, 0) as jml_match_dps
from rfojk_python.dm_riwayat_pemegang_saham_union a
left join profil b using (institutionprofileid)
left join pendirian c using (institutionprofileid)
left join dirkom d using (institutionprofileid)
left join produk e using (institutionprofileid)
left join dps f using (institutionprofileid);

--Riwayat Produk & Aktivitas
create view rfojk_python.vw_riwayat_produk_altivitas_agg_relations as
with 
profil as (
    select institutionprofileid, count(*) as jml_profil
    from rfojk_python.dm_profil_entity_union
    group by institutionprofileid
),
pendirian as (
    select institutionprofileid, count(*) as jml_pendirian
    from rfojk_python.dm_riwayat_pendirian_union
    group by institutionprofileid
),
dirkom as (
    select institutionprofileid, count(*) as jml_direksi_komisaris
    from rfojk_python.dm_riwayat_direksi_komisaris_union
    group by institutionprofileid
),
saham as (
    select institutionprofileid, count(*) as jml_pemegang_saham
    from rfojk_python.dm_riwayat_pemegang_saham_union
    group by institutionprofileid
),
dps as (
    select institutionprofileid, count(*) as jml_dps
    from rfojk_python.dm_riwayat_dps_union
    group by institutionprofileid
)
select 
	a. *,
    coalesce(b.jml_profil, 0) as jml_match_profil,
    coalesce(c.jml_pendirian, 0) as jml_match_pendirian,
    coalesce(d.jml_direksi_komisaris, 0) as jml_match_direksi_komisaris,
    coalesce(e.jml_pemegang_saham, 0) as jml_match_pemegang_saham,
    coalesce(f.jml_dps, 0) as jml_match_dps
from rfojk_python.dm_riwayat_produk_aktivitas_union a
left join profil b using (institutionprofileid)
left join pendirian c using (institutionprofileid)
left join dirkom d using (institutionprofileid)
left join saham e using (institutionprofileid)
left join dps f using (institutionprofileid);

--Riwayat DPS
create view rfojk_python.vw_riwayat_dps_agg_relations as
with 
profil as (
    select institutionprofileid, count(*) as jml_profil
    from rfojk_python.dm_profil_entity_union
    group by institutionprofileid
),
pendirian as (
    select institutionprofileid, count(*) as jml_pendirian
    from rfojk_python.dm_riwayat_pendirian_union
    group by institutionprofileid
),
dirkom as (
    select institutionprofileid, count(*) as jml_direksi_komisaris
    from rfojk_python.dm_riwayat_direksi_komisaris_union
    group by institutionprofileid
),
saham as (
    select institutionprofileid, count(*) as jml_pemegang_saham
    from rfojk_python.dm_riwayat_pemegang_saham_union
    group by institutionprofileid
),
produk as (
    select institutionprofileid, count(*) as jml_produk
    from rfojk_python.dm_riwayat_produk_aktivitas_union
    group by institutionprofileid
)
select 
	a. *,
    coalesce(b.jml_profil, 0) as jml_match_profil,
    coalesce(c.jml_pendirian, 0) as jml_match_pendirian,
    coalesce(d.jml_direksi_komisaris, 0) as jml_match_direksi_komisaris,
    coalesce(e.jml_pemegang_saham, 0) as jml_match_pemegang_saham,
    coalesce(f.jml_produk, 0) as jml_match_produk
from rfojk_python.dm_riwayat_dps_union a
left join profil b using (institutionprofileid)
left join pendirian c using (institutionprofileid)
left join dirkom d using (institutionprofileid)
left join saham e using (institutionprofileid)
left join produk f using (institutionprofileid);


select *
from rfojk_python.riwayat_dps_apkap drdu  ;

select count(*)
from rfojk_python.vw_profile_entity_agg_relations;


-------------------
CREATE OR REPLACE VIEW rfojk_python.vw_helper_parameter_column_options AS
SELECT * FROM (
    -- Profil Entity
    VALUES
        ('Profil Entity', 'profil_application'),
        ('Profil Entity', 'profil_institutionprofileid'),
        ('Profil Entity', 'profil_idorigin'),
        ('Profil Entity', 'profil_institutionname'),
        ('Profil Entity', 'profil_companyemail'),
        ('Profil Entity', 'profil_headofficeaddress'),
        ('Profil Entity', 'profil_npwp'),
        ('Profil Entity', 'profil_webaddress'),
    -- Riwayat Pendirian
        ('Riwayat Pendirian', 'pendirian_sector'),
        ('Riwayat Pendirian', 'pendirian_subsector'),
        ('Riwayat Pendirian', 'pendirian_subsubsector'),
        ('Riwayat Pendirian', 'pendirian_legalentity'),
        ('Riwayat Pendirian', 'pendirian_licensedate'),
        ('Riwayat Pendirian', 'pendirian_licensenumber'),
        ('Riwayat Pendirian', 'pendirian_licensetype'),
        ('Riwayat Pendirian', 'pendirian_statusljk'),
    -- Direksi & Komisaris
        ('Direksi dan Komisaris', 'dirkom_commissionername'),
        ('Direksi dan Komisaris', 'dirkom_commissionernationality'),
        ('Direksi dan Komisaris', 'dirkom_commissionernik'),
        ('Direksi dan Komisaris', 'dirkom_commissionerpassport'),
        ('Direksi dan Komisaris', 'dirkom_position'),
        ('Direksi dan Komisaris', 'dirkom_officiateeffectivedate'),
        ('Direksi dan Komisaris', 'dirkom_officiateenddate'),
        ('Direksi dan Komisaris', 'dirkom_officiateinactivedate'),
    -- Pemegang Saham
        ('Pemegang Saham', 'saham_individualownername'),
        ('Pemegang Saham', 'saham_individualownernik'),
        ('Pemegang Saham', 'saham_individualownernpwp'),
        ('Pemegang Saham', 'saham_ownershippercentage'),
        ('Pemegang Saham', 'saham_ownershipvalue'),
    -- Produk
        ('Produk', 'productname'),
        ('Produk', 'producttype'),
        ('Produk', 'productstatus'),
        ('Produk', 'produteffectivedate'),
        ('Produk', 'produk_letterdate'),
        ('Produk', 'produk_letternumber'),
    -- DPS
        ('Dewan Pengawas Syariah', 'dps_shariasupervisoryboardname'),
        ('Dewan Pengawas Syariah', 'dps_shariasupervisoryboardnationality'),
        ('Dewan Pengawas Syariah', 'dps_shariasupervisoryboardnik'),
        ('Dewan Pengawas Syariah', 'dps_shariasupervisoryboardpassport'),
        ('Dewan Pengawas Syariah', 'dps_position'),
        ('Dewan Pengawas Syariah', 'dps_effectivedate'),
        ('Dewan Pengawas Syariah', 'dps_officiateinactivedate')
) AS column_options(data_source, column_name);

select *
from rfojk_python.vw_helper_parameter_column_options vhpco ;
-------------------------------------------------------------------------------------------------------------------------------------------------------------------
/* Jumat 20250613 */ 
select *
from "rfojk-terbaru".profil_entity_dapok ped ;

select *
from "rfojk-terbaru".profil_entity_sipm pes ;

select *
from "rfojk-terbaru".profil_entity_sprint pes ;

select *
from "rfojk-terbaru".riwayat_pendirian_sipm rps ;

select *
from rfojk_python.dm_profil_entity_union dpeu ;

-- DM Profil
create table if not exists "rfojk-terbaru".dm_profile_entity_union_f as
select
	'DAPOK' as application,
	"InstitutionProfileID" as institutionprofileid ,
	"InstitutionName" as institutionname,
	"IDOrigin" as idorigin,
	"NPWP" as npwp,
	"CompanyEmail" as companyemail,
	"HeadOfficeAddress" as headofficeaddress,
	"WebAddress" as webaddress
from "rfojk-terbaru".profil_entity_dapok ped
union
select 
	'SIPM' as application,
	"InstitutionProfileID" as institutionprofileid ,
	"InstitutionName" as institutionname,
	"IDOrigin" as idorigin,
	"NPWP" as npwp,
	"CompanyEmail" as companyemail,
	"HeadOfficeAddress" as headofficeaddress,
	"WebAddress" as webaddress
from "rfojk-terbaru".profil_entity_sipm pes
union
select
	'SPRINT' as application,
	"InstitutionProfileID" as institutionprofileid ,
	"InstitutionName" as institutionname,
	"IDOrigin" as idorigin,
	"NPWP" as npwp,
	"CompanyEmail" as companyemail,
	"HeadOfficeAddress" as headofficeaddress,
	"WebAddress" as webaddress
from "rfojk-terbaru".profil_entity_sprint pes ;



--------------------
SELECT column_name
FROM information_schema.columns
WHERE table_schema = 'rfojk_python'
  AND table_name = 'riwayat_produk_aktivitas_sipm';

SELECT * FROM information_schema.tables 
WHERE table_schema = 'rfojk_python' 
AND table_name ILIKE 'riwayat_%'

