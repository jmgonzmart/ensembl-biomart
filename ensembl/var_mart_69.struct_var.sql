-- Copyright [2009-2014] EMBL-European Bioinformatics Institute
-- 
-- Licensed under the Apache License, Version 2.0 (the "License");
-- you may not use this file except in compliance with the License.
-- You may obtain a copy of the License at
-- 
--      http://www.apache.org/licenses/LICENSE-2.0
-- 
-- Unless required by applicable law or agreed to in writing, software
-- distributed under the License is distributed on an "AS IS" BASIS,
-- WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
-- See the License for the specific language governing permissions and
-- limitations under the License.

create table VAR_MART_DB.TEMP0 as select a.validation_status as validation_status_2072,a.variation_name as variation_name_2072,a.structural_variation_id as structural_variation_id_2072_key,a.source_id as source_id_2072,a.study_id as study_id_2072,a.is_evidence as is_evidence_2072,a.somatic as somatic_2072,a.class_attrib_id as class_attrib_id_2072 from VAR_DB.structural_variation as a where a.is_evidence=0 and a.somatic=0;
create index I_0 on VAR_MART_DB.TEMP0(source_id_2072);
create table VAR_MART_DB.TEMP1 as select a.*,b.description as description_2021,b.name as name_2021,b.somatic_status as somatic_status_2021,b.type as type_2021,b.version as version_2021 from VAR_MART_DB.TEMP0 as a left join VAR_DB.source as b on a.source_id_2072=b.source_id;
drop table VAR_MART_DB.TEMP0;
create index I_1 on VAR_MART_DB.TEMP1(class_attrib_id_2072);
create table VAR_MART_DB.TEMP3 as select a.*,b.value as value_2092,b.attrib_type_id as attrib_type_id_2092 from VAR_MART_DB.TEMP1 as a left join VAR_DB.attrib as b on a.class_attrib_id_2072=b.attrib_id;
drop table VAR_MART_DB.TEMP1;
create index I_2 on VAR_MART_DB.TEMP3(attrib_type_id_2092);
create table VAR_MART_DB.TEMP5 as select a.*,b.description as description_2094,b.name as name_2094,b.code as code_2094 from VAR_MART_DB.TEMP3 as a left join VAR_DB.attrib_type as b on a.attrib_type_id_2092=b.attrib_type_id;
drop table VAR_MART_DB.TEMP3;
create index I_3 on VAR_MART_DB.TEMP5(study_id_2072);
create table VAR_MART_DB.TEMP6 as select a.*,b.external_reference as external_reference_20100,b.source_id as source_id_20100,b.description as description_20100,b.name as name_20100,b.study_type as study_type_20100,b.url as url_20100 from VAR_MART_DB.TEMP5 as a left join VAR_DB.study as b on a.study_id_2072=b.study_id;
drop table VAR_MART_DB.TEMP5;
create index I_4 on VAR_MART_DB.TEMP6(source_id_20100);
create table VAR_MART_DB.TEMP7 as select a.*,b.description as description_2021_r1,b.name as name_2021_r1,b.somatic_status as somatic_status_2021_r1,b.type as type_2021_r1,b.url as url_2021_r1,b.version as version_2021_r1 from VAR_MART_DB.TEMP6 as a left join VAR_DB.source as b on a.source_id_20100=b.source_id;
drop table VAR_MART_DB.TEMP6;
rename table VAR_MART_DB.TEMP7 to VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main;
create index I_5 on VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP9 as select a.structural_variation_id_2072_key from VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main as a;
create index I_6 on VAR_MART_DB.TEMP9(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP10 as select a.*,b.variation_set_id as variation_set_id_20115 from VAR_MART_DB.TEMP9 as a inner join VAR_DB.variation_set_structural_variation as b on a.structural_variation_id_2072_key=b.structural_variation_id;
drop table VAR_MART_DB.TEMP9;
create index I_7 on VAR_MART_DB.TEMP10(variation_set_id_20115);
create table VAR_MART_DB.TEMP11 as select a.*,b.description as description_2077,b.name as name_2077,b.short_name_attrib_id as short_name_attrib_id_2077 from VAR_MART_DB.TEMP10 as a inner join VAR_DB.variation_set as b on a.variation_set_id_20115=b.variation_set_id;
drop table VAR_MART_DB.TEMP10;
create index I_8 on VAR_MART_DB.TEMP11(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP12 as select a.structural_variation_id_2072_key,b.short_name_attrib_id_2077,b.description_2077,b.name_2077,b.variation_set_id_20115 from VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main as a left join VAR_MART_DB.TEMP11 as b on a.structural_variation_id_2072_key=b.structural_variation_id_2072_key;
drop table VAR_MART_DB.TEMP11;
rename table VAR_MART_DB.TEMP12 to VAR_MART_DB.SPECIES_ABBREV_eg_structvar__variation_set_structural_variation__dm;
create index I_9 on VAR_MART_DB.SPECIES_ABBREV_eg_structvar__variation_set_structural_variation__dm(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP13 as select a.structural_variation_id_2072_key from VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main as a;
create index I_10 on VAR_MART_DB.TEMP13(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP14 as select a.*,b.clinical_attrib_id as clinical_attrib_id_20113,b.structural_variation_annotation_id as structural_variation_annotation_id_20113,b.strain_id as strain_id_20113,b.sample_id as sample_id_20113,b.phenotype_id as phenotype_id_20113 from VAR_MART_DB.TEMP13 as a inner join VAR_DB.structural_variation_annotation as b on a.structural_variation_id_2072_key=b.structural_variation_id;
drop table VAR_MART_DB.TEMP13;
create index I_11 on VAR_MART_DB.TEMP14(strain_id_20113);
create table VAR_MART_DB.TEMP17 as select a.*,b.description as description_2019,b.name as name_2019,b.display as display_2019,b.size as size_2019 from VAR_MART_DB.TEMP14 as a inner join VAR_DB.sample as b on a.strain_id_20113=b.sample_id;
drop table VAR_MART_DB.TEMP14;
create index I_12 on VAR_MART_DB.TEMP17(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP18 as select a.structural_variation_id_2072_key,b.size_2019,b.display_2019,b.name_2019,b.description_2019,b.strain_id_20113,b.clinical_attrib_id_20113,b.structural_variation_annotation_id_20113,b.phenotype_id_20113,b.sample_id_20113 from VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main as a left join VAR_MART_DB.TEMP17 as b on a.structural_variation_id_2072_key=b.structural_variation_id_2072_key;
drop table VAR_MART_DB.TEMP17;
rename table VAR_MART_DB.TEMP18 to VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation_annotation__dm;
create index I_13 on VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation_annotation__dm(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP19 as select a.structural_variation_id_2072_key from VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main as a;
create index I_14 on VAR_MART_DB.TEMP19(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP20 as select a.*,b.inner_start as inner_start_20116,b.outer_start as outer_start_20116,b.clinical_significance as clinical_significance_20116,b.variation_name as variation_name_20116,b.strain_name as strain_name_20116,b.phenotype as phenotype_20116,b.class_name as class_name_20116,b.sample_name as sample_name_20116,b.seq_region_end as seq_region_end_20116,b.inner_end as inner_end_20116,b.seq_region_start as seq_region_start_20116,b.seq_region_name as seq_region_name_20116,b.outer_end as outer_end_20116,b.supporting_structural_variation_id as supporting_structural_variation_id_20116,b.seq_region_strand as seq_region_strand_20116 from VAR_MART_DB.TEMP19 as a inner join VAR_DB.MTMP_supporting_structural_variation as b on a.structural_variation_id_2072_key=b.structural_variation_id;
drop table VAR_MART_DB.TEMP19;
create index I_15 on VAR_MART_DB.TEMP20(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP21 as select a.structural_variation_id_2072_key,b.outer_start_20116,b.seq_region_name_20116,b.inner_end_20116,b.variation_name_20116,b.inner_start_20116,b.sample_name_20116,b.seq_region_end_20116,b.seq_region_strand_20116,b.clinical_significance_20116,b.outer_end_20116,b.supporting_structural_variation_id_20116,b.strain_name_20116,b.class_name_20116,b.seq_region_start_20116,b.phenotype_20116 from VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main as a left join VAR_MART_DB.TEMP20 as b on a.structural_variation_id_2072_key=b.structural_variation_id_2072_key;
drop table VAR_MART_DB.TEMP20;
rename table VAR_MART_DB.TEMP21 to VAR_MART_DB.SPECIES_ABBREV_eg_structvar__supporting_structural_variation__dm;
create index I_16 on VAR_MART_DB.SPECIES_ABBREV_eg_structvar__supporting_structural_variation__dm(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP22 as select a.description_2021,a.attrib_type_id_2092,a.url_2021_r1,a.source_id_20100,a.name_2094,a.study_id_2072,a.somatic_status_2021_r1,a.type_2021_r1,a.is_evidence_2072,a.study_type_20100,a.variation_name_2072,a.name_20100,a.somatic_status_2021,a.value_2092,a.version_2021,a.validation_status_2072,a.class_attrib_id_2072,a.name_2021,a.name_2021_r1,a.external_reference_20100,a.somatic_2072,a.version_2021_r1,a.description_2021_r1,a.source_id_2072,a.type_2021,a.description_2094,a.structural_variation_id_2072_key,a.code_2094,a.description_20100,a.url_20100 from VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main as a;
create index I_17 on VAR_MART_DB.TEMP22(structural_variation_id_2072_key);
create table VAR_MART_DB.TEMP23 as select a.*,b.inner_start as inner_start_20104,b.outer_start as outer_start_20104,b.seq_region_id as seq_region_id_20104,b.breakpoint_order as breakpoint_order_20104,b.variation_name as variation_name_20104,b.source_id as source_id_20104,b.somatic as somatic_20104,b.is_evidence as is_evidence_20104,b.variation_set_id as variation_set_id_20104,b.seq_region_end as seq_region_end_20104,b.allele_string as allele_string_20104,b.structural_variation_feature_id as structural_variation_feature_id_20104_key,b.inner_end as inner_end_20104,b.seq_region_start as seq_region_start_20104,b.outer_end as outer_end_20104,b.class_attrib_id as class_attrib_id_20104,b.seq_region_strand as seq_region_strand_20104 from VAR_MART_DB.TEMP22 as a left join VAR_DB.structural_variation_feature as b on a.structural_variation_id_2072_key=b.structural_variation_id;
drop table VAR_MART_DB.TEMP22;
create index I_18 on VAR_MART_DB.TEMP23(seq_region_id_20104);
create table VAR_MART_DB.TEMP25 as select a.*,b.name as name_2034,b.coord_system_id as coord_system_id_2034 from VAR_MART_DB.TEMP23 as a left join VAR_DB.seq_region as b on a.seq_region_id_20104=b.seq_region_id;
drop table VAR_MART_DB.TEMP23;
rename table VAR_MART_DB.TEMP25 to VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation_feature__main;
create index I_19 on VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation_feature__main(structural_variation_id_2072_key);
create index I_20 on VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation_feature__main(structural_variation_feature_id_20104_key);
alter table VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main add column (structural_variation_feature_count integer default 0);
update VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main a set structural_variation_feature_count=(select count(1) from VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation_feature__main b where a.structural_variation_id_2072_key=b.structural_variation_id_2072_key and not (b.description_2021 is null and b.url_2021_r1 is null and b.source_id_20100 is null and b.inner_end_20104 is null and b.study_id_2072 is null and b.coord_system_id_2034 is null and b.source_id_20104 is null and b.type_2021_r1 is null and b.variation_set_id_20104 is null and b.seq_region_start_20104 is null and b.is_evidence_2072 is null and b.name_20100 is null and b.seq_region_id_20104 is null and b.seq_region_strand_20104 is null and b.variation_name_20104 is null and b.somatic_status_2021 is null and b.value_2092 is null and b.outer_start_20104 is null and b.breakpoint_order_20104 is null and b.validation_status_2072 is null and b.seq_region_end_20104 is null and b.class_attrib_id_2072 is null and b.name_2034 is null and b.name_2021_r1 is null and b.version_2021_r1 is null and b.somatic_20104 is null and b.description_2094 is null and b.url_20100 is null and b.attrib_type_id_2092 is null and b.name_2094 is null and b.somatic_status_2021_r1 is null and b.allele_string_20104 is null and b.study_type_20100 is null and b.variation_name_2072 is null and b.version_2021 is null and b.inner_start_20104 is null and b.name_2021 is null and b.is_evidence_20104 is null and b.structural_variation_feature_id_20104_key is null and b.external_reference_20100 is null and b.description_2021_r1 is null and b.somatic_2072 is null and b.outer_end_20104 is null and b.source_id_2072 is null and b.type_2021 is null and b.code_2094 is null and b.class_attrib_id_20104 is null and b.description_20100 is null));
create index I_21 on VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main(structural_variation_feature_count);
alter table VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation_feature__main add column (structural_variation_feature_count integer default 0);
update VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation_feature__main a set structural_variation_feature_count=(select max(structural_variation_feature_count) from VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation__main b where a.structural_variation_id_2072_key=b.structural_variation_id_2072_key);
create index I_22 on VAR_MART_DB.SPECIES_ABBREV_eg_structvar__structural_variation_feature__main(structural_variation_feature_count);
