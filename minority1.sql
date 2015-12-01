/*
Navicat PGSQL Data Transfer

Source Server         : localhost
Source Server Version : 90305
Source Host           : localhost:5432
Source Database       : minority1
Source Schema         : public

Target Server Type    : PGSQL
Target Server Version : 90305
File Encoding         : 65001

Date: 2015-12-02 03:31:45
*/


-- ----------------------------
-- Sequence structure for account_group_id_seq
-- ----------------------------
DROP SEQUENCE "public"."account_group_id_seq";
CREATE SEQUENCE "public"."account_group_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 17
 CACHE 1;
SELECT setval('"public"."account_group_id_seq"', 17, true);

-- ----------------------------
-- Sequence structure for account_infos_id_seq
-- ----------------------------
DROP SEQUENCE "public"."account_infos_id_seq";
CREATE SEQUENCE "public"."account_infos_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 19
 CACHE 1;
SELECT setval('"public"."account_infos_id_seq"', 19, true);

-- ----------------------------
-- Sequence structure for account_loggers_id_seq
-- ----------------------------
DROP SEQUENCE "public"."account_loggers_id_seq";
CREATE SEQUENCE "public"."account_loggers_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 319
 CACHE 1;
SELECT setval('"public"."account_loggers_id_seq"', 319, true);

-- ----------------------------
-- Sequence structure for account_plan_history_id_seq
-- ----------------------------
DROP SEQUENCE "public"."account_plan_history_id_seq";
CREATE SEQUENCE "public"."account_plan_history_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."account_plan_history_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for account_plans_id_seq
-- ----------------------------
DROP SEQUENCE "public"."account_plans_id_seq";
CREATE SEQUENCE "public"."account_plans_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 23
 CACHE 1;
SELECT setval('"public"."account_plans_id_seq"', 23, true);

-- ----------------------------
-- Sequence structure for admin_accounts_id_seq
-- ----------------------------
DROP SEQUENCE "public"."admin_accounts_id_seq";
CREATE SEQUENCE "public"."admin_accounts_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for annotation_ranges_id_seq
-- ----------------------------
DROP SEQUENCE "public"."annotation_ranges_id_seq";
CREATE SEQUENCE "public"."annotation_ranges_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for annotations_id_seq
-- ----------------------------
DROP SEQUENCE "public"."annotations_id_seq";
CREATE SEQUENCE "public"."annotations_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for billing_info_cards_id_seq
-- ----------------------------
DROP SEQUENCE "public"."billing_info_cards_id_seq";
CREATE SEQUENCE "public"."billing_info_cards_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for billing_infos_id_seq
-- ----------------------------
DROP SEQUENCE "public"."billing_infos_id_seq";
CREATE SEQUENCE "public"."billing_infos_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for bills_id_seq
-- ----------------------------
DROP SEQUENCE "public"."bills_id_seq";
CREATE SEQUENCE "public"."bills_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."bills_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for bploggers_id_seq
-- ----------------------------
DROP SEQUENCE "public"."bploggers_id_seq";
CREATE SEQUENCE "public"."bploggers_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 315
 CACHE 1;
SELECT setval('"public"."bploggers_id_seq"', 315, true);

-- ----------------------------
-- Sequence structure for bprocesses_id_seq
-- ----------------------------
DROP SEQUENCE "public"."bprocesses_id_seq";
CREATE SEQUENCE "public"."bprocesses_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 18
 CACHE 1;
SELECT setval('"public"."bprocesses_id_seq"', 18, true);

-- ----------------------------
-- Sequence structure for bpsessions_id_seq
-- ----------------------------
DROP SEQUENCE "public"."bpsessions_id_seq";
CREATE SEQUENCE "public"."bpsessions_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 100
 CACHE 1;
SELECT setval('"public"."bpsessions_id_seq"', 100, true);

-- ----------------------------
-- Sequence structure for bpspaces_id_seq
-- ----------------------------
DROP SEQUENCE "public"."bpspaces_id_seq";
CREATE SEQUENCE "public"."bpspaces_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 16
 CACHE 1;
SELECT setval('"public"."bpspaces_id_seq"', 16, true);

-- ----------------------------
-- Sequence structure for bpstates_id_seq
-- ----------------------------
DROP SEQUENCE "public"."bpstates_id_seq";
CREATE SEQUENCE "public"."bpstates_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 196
 CACHE 1;
SELECT setval('"public"."bpstates_id_seq"', 196, true);

-- ----------------------------
-- Sequence structure for bpstation_loggers_id_seq
-- ----------------------------
DROP SEQUENCE "public"."bpstation_loggers_id_seq";
CREATE SEQUENCE "public"."bpstation_loggers_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1990
 CACHE 1;
SELECT setval('"public"."bpstation_loggers_id_seq"', 1990, true);

-- ----------------------------
-- Sequence structure for bpstations_id_seq
-- ----------------------------
DROP SEQUENCE "public"."bpstations_id_seq";
CREATE SEQUENCE "public"."bpstations_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 100
 CACHE 1;
SELECT setval('"public"."bpstations_id_seq"', 100, true);

-- ----------------------------
-- Sequence structure for bpswitchers_id_seq
-- ----------------------------
DROP SEQUENCE "public"."bpswitchers_id_seq";
CREATE SEQUENCE "public"."bpswitchers_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 142
 CACHE 1;
SELECT setval('"public"."bpswitchers_id_seq"', 142, true);

-- ----------------------------
-- Sequence structure for business_services_id_seq
-- ----------------------------
DROP SEQUENCE "public"."business_services_id_seq";
CREATE SEQUENCE "public"."business_services_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 6
 CACHE 1;
SELECT setval('"public"."business_services_id_seq"', 6, true);

-- ----------------------------
-- Sequence structure for business_walks_id_seq
-- ----------------------------
DROP SEQUENCE "public"."business_walks_id_seq";
CREATE SEQUENCE "public"."business_walks_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for businesses_id_seq
-- ----------------------------
DROP SEQUENCE "public"."businesses_id_seq";
CREATE SEQUENCE "public"."businesses_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 96
 CACHE 1;
SELECT setval('"public"."businesses_id_seq"', 96, true);

-- ----------------------------
-- Sequence structure for client_observers_id_seq
-- ----------------------------
DROP SEQUENCE "public"."client_observers_id_seq";
CREATE SEQUENCE "public"."client_observers_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for elem_topologs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."elem_topologs_id_seq";
CREATE SEQUENCE "public"."elem_topologs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 81
 CACHE 1;
SELECT setval('"public"."elem_topologs_id_seq"', 81, true);

-- ----------------------------
-- Sequence structure for element_resources_id_seq
-- ----------------------------
DROP SEQUENCE "public"."element_resources_id_seq";
CREATE SEQUENCE "public"."element_resources_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 6
 CACHE 1;
SELECT setval('"public"."element_resources_id_seq"', 6, true);

-- ----------------------------
-- Sequence structure for employees_id_seq
-- ----------------------------
DROP SEQUENCE "public"."employees_id_seq";
CREATE SEQUENCE "public"."employees_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 109
 CACHE 1;
SELECT setval('"public"."employees_id_seq"', 109, true);

-- ----------------------------
-- Sequence structure for groups_id_seq
-- ----------------------------
DROP SEQUENCE "public"."groups_id_seq";
CREATE SEQUENCE "public"."groups_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 27
 CACHE 1;
SELECT setval('"public"."groups_id_seq"', 27, true);

-- ----------------------------
-- Sequence structure for input_id_seq
-- ----------------------------
DROP SEQUENCE "public"."input_id_seq";
CREATE SEQUENCE "public"."input_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 18
 CACHE 1;
SELECT setval('"public"."input_id_seq"', 18, true);

-- ----------------------------
-- Sequence structure for input_loggers_id_seq
-- ----------------------------
DROP SEQUENCE "public"."input_loggers_id_seq";
CREATE SEQUENCE "public"."input_loggers_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 39
 CACHE 1;
SELECT setval('"public"."input_loggers_id_seq"', 39, true);

-- ----------------------------
-- Sequence structure for input_loggers_input_id_seq
-- ----------------------------
DROP SEQUENCE "public"."input_loggers_input_id_seq";
CREATE SEQUENCE "public"."input_loggers_input_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 39
 CACHE 1;
SELECT setval('"public"."input_loggers_input_id_seq"', 39, true);

-- ----------------------------
-- Sequence structure for launch_element_slats_id_seq
-- ----------------------------
DROP SEQUENCE "public"."launch_element_slats_id_seq";
CREATE SEQUENCE "public"."launch_element_slats_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for observers_id_seq
-- ----------------------------
DROP SEQUENCE "public"."observers_id_seq";
CREATE SEQUENCE "public"."observers_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for plans_id_seq
-- ----------------------------
DROP SEQUENCE "public"."plans_id_seq";
CREATE SEQUENCE "public"."plans_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."plans_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for proc_element_reflections_id_seq
-- ----------------------------
DROP SEQUENCE "public"."proc_element_reflections_id_seq";
CREATE SEQUENCE "public"."proc_element_reflections_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."proc_element_reflections_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for proc_elements_id_seq
-- ----------------------------
DROP SEQUENCE "public"."proc_elements_id_seq";
CREATE SEQUENCE "public"."proc_elements_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 60
 CACHE 1;
SELECT setval('"public"."proc_elements_id_seq"', 60, true);

-- ----------------------------
-- Sequence structure for process_histories_id_seq
-- ----------------------------
DROP SEQUENCE "public"."process_histories_id_seq";
CREATE SEQUENCE "public"."process_histories_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 137
 CACHE 1;
SELECT setval('"public"."process_histories_id_seq"', 137, true);

-- ----------------------------
-- Sequence structure for process_permissions_id_seq
-- ----------------------------
DROP SEQUENCE "public"."process_permissions_id_seq";
CREATE SEQUENCE "public"."process_permissions_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8
 CACHE 1;
SELECT setval('"public"."process_permissions_id_seq"', 8, true);

-- ----------------------------
-- Sequence structure for reaction_refs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."reaction_refs_id_seq";
CREATE SEQUENCE "public"."reaction_refs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."reaction_refs_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for reaction_state_out_refs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."reaction_state_out_refs_id_seq";
CREATE SEQUENCE "public"."reaction_state_out_refs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."reaction_state_out_refs_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for reaction_state_outs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."reaction_state_outs_id_seq";
CREATE SEQUENCE "public"."reaction_state_outs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 45
 CACHE 1;
SELECT setval('"public"."reaction_state_outs_id_seq"', 45, true);

-- ----------------------------
-- Sequence structure for reactions_id_seq
-- ----------------------------
DROP SEQUENCE "public"."reactions_id_seq";
CREATE SEQUENCE "public"."reactions_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 45
 CACHE 1;
SELECT setval('"public"."reactions_id_seq"', 45, true);

-- ----------------------------
-- Sequence structure for reflected_elem_topologs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."reflected_elem_topologs_id_seq";
CREATE SEQUENCE "public"."reflected_elem_topologs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."reflected_elem_topologs_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for refs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."refs_id_seq";
CREATE SEQUENCE "public"."refs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."refs_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for resources_id_seq
-- ----------------------------
DROP SEQUENCE "public"."resources_id_seq";
CREATE SEQUENCE "public"."resources_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 8
 CACHE 1;
SELECT setval('"public"."resources_id_seq"', 8, true);

-- ----------------------------
-- Sequence structure for session_elem_topologs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_elem_topologs_id_seq";
CREATE SEQUENCE "public"."session_elem_topologs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 97
 CACHE 1;
SELECT setval('"public"."session_elem_topologs_id_seq"', 97, true);

-- ----------------------------
-- Sequence structure for session_element_resources_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_element_resources_id_seq";
CREATE SEQUENCE "public"."session_element_resources_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 3
 CACHE 1;
SELECT setval('"public"."session_element_resources_id_seq"', 3, true);

-- ----------------------------
-- Sequence structure for session_initial_states_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_initial_states_id_seq";
CREATE SEQUENCE "public"."session_initial_states_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 294
 CACHE 1;
SELECT setval('"public"."session_initial_states_id_seq"', 294, true);

-- ----------------------------
-- Sequence structure for session_proc_elements_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_proc_elements_id_seq";
CREATE SEQUENCE "public"."session_proc_elements_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 72
 CACHE 1;
SELECT setval('"public"."session_proc_elements_id_seq"', 72, true);

-- ----------------------------
-- Sequence structure for session_reaction_state_outs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_reaction_state_outs_id_seq";
CREATE SEQUENCE "public"."session_reaction_state_outs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 43
 CACHE 1;
SELECT setval('"public"."session_reaction_state_outs_id_seq"', 43, true);

-- ----------------------------
-- Sequence structure for session_reactions_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_reactions_id_seq";
CREATE SEQUENCE "public"."session_reactions_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 43
 CACHE 1;
SELECT setval('"public"."session_reactions_id_seq"', 43, true);

-- ----------------------------
-- Sequence structure for session_space_elements_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_space_elements_id_seq";
CREATE SEQUENCE "public"."session_space_elements_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 27
 CACHE 1;
SELECT setval('"public"."session_space_elements_id_seq"', 27, true);

-- ----------------------------
-- Sequence structure for session_spaces_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_spaces_id_seq";
CREATE SEQUENCE "public"."session_spaces_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 28
 CACHE 1;
SELECT setval('"public"."session_spaces_id_seq"', 28, true);

-- ----------------------------
-- Sequence structure for session_state_logs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_state_logs_id_seq";
CREATE SEQUENCE "public"."session_state_logs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 396
 CACHE 1;
SELECT setval('"public"."session_state_logs_id_seq"', 396, true);

-- ----------------------------
-- Sequence structure for session_switchers_id_seq
-- ----------------------------
DROP SEQUENCE "public"."session_switchers_id_seq";
CREATE SEQUENCE "public"."session_switchers_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 167
 CACHE 1;
SELECT setval('"public"."session_switchers_id_seq"', 167, true);

-- ----------------------------
-- Sequence structure for sessionstates_id_seq
-- ----------------------------
DROP SEQUENCE "public"."sessionstates_id_seq";
CREATE SEQUENCE "public"."sessionstates_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 596
 CACHE 1;
SELECT setval('"public"."sessionstates_id_seq"', 596, true);

-- ----------------------------
-- Sequence structure for space_element_reflections_id_seq
-- ----------------------------
DROP SEQUENCE "public"."space_element_reflections_id_seq";
CREATE SEQUENCE "public"."space_element_reflections_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for space_elements_id_seq
-- ----------------------------
DROP SEQUENCE "public"."space_elements_id_seq";
CREATE SEQUENCE "public"."space_elements_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 21
 CACHE 1;
SELECT setval('"public"."space_elements_id_seq"', 21, true);

-- ----------------------------
-- Sequence structure for space_refs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."space_refs_id_seq";
CREATE SEQUENCE "public"."space_refs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;
SELECT setval('"public"."space_refs_id_seq"', 1, true);

-- ----------------------------
-- Sequence structure for state_refs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."state_refs_id_seq";
CREATE SEQUENCE "public"."state_refs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."state_refs_id_seq"', 5, true);

-- ----------------------------
-- Sequence structure for switcher_refs_id_seq
-- ----------------------------
DROP SEQUENCE "public"."switcher_refs_id_seq";
CREATE SEQUENCE "public"."switcher_refs_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."switcher_refs_id_seq"', 5, true);

-- ----------------------------
-- Sequence structure for table_data3_serial_seq
-- ----------------------------
DROP SEQUENCE "public"."table_data3_serial_seq";
CREATE SEQUENCE "public"."table_data3_serial_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 5
 CACHE 1;
SELECT setval('"public"."table_data3_serial_seq"', 5, true);

-- ----------------------------
-- Sequence structure for user_annotations_id_seq
-- ----------------------------
DROP SEQUENCE "public"."user_annotations_id_seq";
CREATE SEQUENCE "public"."user_annotations_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Sequence structure for walks_id_seq
-- ----------------------------
DROP SEQUENCE "public"."walks_id_seq";
CREATE SEQUENCE "public"."walks_id_seq"
 INCREMENT 1
 MINVALUE 1
 MAXVALUE 9223372036854775807
 START 1
 CACHE 1;

-- ----------------------------
-- Table structure for account_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_group";
CREATE TABLE "public"."account_group" (
"id" int4 DEFAULT nextval('account_group_id_seq'::regclass) NOT NULL,
"account_id" varchar COLLATE "default" NOT NULL,
"group_id" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of account_group
-- ----------------------------
INSERT INTO "public"."account_group" VALUES ('14', 'tete@tete.ru', '2', '2015-09-03 19:12:50.693+06', '2015-09-03 19:12:50.693+06');
INSERT INTO "public"."account_group" VALUES ('15', 'iamjacke@gmail.com', '2', '2015-09-03 19:12:50.693+06', '2015-09-03 19:12:50.693+06');
INSERT INTO "public"."account_group" VALUES ('17', 'tete@tete.ru', '25', '2015-09-03 19:13:34.203+06', '2015-09-03 19:13:34.203+06');

-- ----------------------------
-- Table structure for account_infos
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_infos";
CREATE TABLE "public"."account_infos" (
"id" int4 DEFAULT nextval('account_infos_id_seq'::regclass) NOT NULL,
"uid" varchar COLLATE "default" NOT NULL,
"created_at" timestamp(6) NOT NULL,
"early_access" bool DEFAULT false NOT NULL,
"pro_features" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of account_infos
-- ----------------------------
INSERT INTO "public"."account_infos" VALUES ('1', 'totes@blah.com', '2015-08-28 16:08:48.769', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('2', 'totes2@toto.ru', '2015-08-28 17:03:09.912', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('3', 'tetete@tt.ru', '2015-08-28 18:24:12.378', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('4', 'totes@totes.com', '2015-08-29 11:40:02.595', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('5', 'totes@totes.ru', '2015-08-29 23:21:32.412', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('6', 'lebua@yahoo.com', '2015-08-31 23:06:41.061', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('7', 'employee1@minorityapp.com', '2015-09-01 04:04:53.97', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('8', 'myakush@zurob.in', '2015-09-01 06:04:09.135', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('9', 'habizn@zurob.in', '2015-09-01 06:10:50.937', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('10', 'employee3@minorityapp.com', '2015-09-01 16:19:43.85', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('11', 'employee4@minorityapp.com', '2015-09-01 16:30:36.994', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('12', 'iamjacke@gmail.com', '2015-09-01 16:45:41.059', 'f', 't');
INSERT INTO "public"."account_infos" VALUES ('13', 'employee7@minorityapp.com', '2015-09-01 17:05:22.201', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('14', 'analytics1@minorityapp.com', '2015-09-01 18:04:34.583', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('15', 'analytics_helper@minorityapp.com', '2015-09-01 18:07:06.292', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('16', 'analytic_helper2@minorityapp.com', '2015-09-01 18:16:20.073', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('17', 'test7777@minorityapp.com', '2015-09-25 07:10:46.259', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('18', 'test333333@minorityapp.com', '2015-09-25 07:17:25.836', 'f', 'f');
INSERT INTO "public"."account_infos" VALUES ('19', 'L.Rzcnq@example.com', '2015-11-29 14:48:08.054', 'f', 'f');

-- ----------------------------
-- Table structure for account_loggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_loggers";
CREATE TABLE "public"."account_loggers" (
"id" int4 DEFAULT nextval('account_loggers_id_seq'::regclass) NOT NULL,
"ip" varchar COLLATE "default" NOT NULL,
"user_agent" varchar COLLATE "default" NOT NULL,
"email" varchar COLLATE "default",
"date" timestamptz(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of account_loggers
-- ----------------------------
INSERT INTO "public"."account_loggers" VALUES ('1', '192.168.1.100', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', null, '2015-06-20 17:33:57.505+06');
INSERT INTO "public"."account_loggers" VALUES ('2', '192.168.1.100', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', 'iamjacke@gmail.com', '2015-06-20 17:33:59.422+06');
INSERT INTO "public"."account_loggers" VALUES ('3', '192.168.1.100', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', null, '2015-06-21 11:14:54.023+06');
INSERT INTO "public"."account_loggers" VALUES ('4', '192.168.1.100', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.124 Safari/537.36', 'iamjacke@gmail.com', '2015-06-21 11:14:59.585+06');
INSERT INTO "public"."account_loggers" VALUES ('5', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', null, '2015-07-24 22:05:14.699+06');
INSERT INTO "public"."account_loggers" VALUES ('6', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', 'iamjacke@gmail.com', '2015-07-24 22:05:17.49+06');
INSERT INTO "public"."account_loggers" VALUES ('7', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', null, '2015-07-25 15:58:42.448+06');
INSERT INTO "public"."account_loggers" VALUES ('8', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', 'iamjacke@gmail.com', '2015-07-25 15:58:44.003+06');
INSERT INTO "public"."account_loggers" VALUES ('9', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', null, '2015-07-26 01:12:14.002+06');
INSERT INTO "public"."account_loggers" VALUES ('10', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', 'iamjacke@gmail.com', '2015-07-26 01:12:16.462+06');
INSERT INTO "public"."account_loggers" VALUES ('11', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', null, '2015-07-26 02:08:51.044+06');
INSERT INTO "public"."account_loggers" VALUES ('12', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', 'iamjacke@gmail.com', '2015-07-26 02:08:52.651+06');
INSERT INTO "public"."account_loggers" VALUES ('13', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', null, '2015-07-26 14:32:16.944+06');
INSERT INTO "public"."account_loggers" VALUES ('14', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.89 Safari/537.36', 'iamjacke@gmail.com', '2015-07-26 14:32:19.386+06');
INSERT INTO "public"."account_loggers" VALUES ('15', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-07-28 20:25:52.354+06');
INSERT INTO "public"."account_loggers" VALUES ('16', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-07-28 20:25:58.494+06');
INSERT INTO "public"."account_loggers" VALUES ('17', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-07-30 16:35:48.234+06');
INSERT INTO "public"."account_loggers" VALUES ('18', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-07-30 16:35:48.067+06');
INSERT INTO "public"."account_loggers" VALUES ('19', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-07-30 16:35:52.655+06');
INSERT INTO "public"."account_loggers" VALUES ('20', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-07-30 16:35:53.163+06');
INSERT INTO "public"."account_loggers" VALUES ('21', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-07-31 04:40:32.025+06');
INSERT INTO "public"."account_loggers" VALUES ('22', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-07-31 04:40:34.018+06');
INSERT INTO "public"."account_loggers" VALUES ('23', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-01 03:20:50.035+06');
INSERT INTO "public"."account_loggers" VALUES ('24', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-01 03:20:52.304+06');
INSERT INTO "public"."account_loggers" VALUES ('25', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-04 05:13:05.136+06');
INSERT INTO "public"."account_loggers" VALUES ('26', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-04 05:13:08.506+06');
INSERT INTO "public"."account_loggers" VALUES ('27', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-05 00:33:18.84+06');
INSERT INTO "public"."account_loggers" VALUES ('28', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-05 00:33:20.837+06');
INSERT INTO "public"."account_loggers" VALUES ('29', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-05 20:24:18.547+06');
INSERT INTO "public"."account_loggers" VALUES ('30', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-05 20:24:20.28+06');
INSERT INTO "public"."account_loggers" VALUES ('31', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-06 12:34:15.768+06');
INSERT INTO "public"."account_loggers" VALUES ('32', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-06 12:34:18.305+06');
INSERT INTO "public"."account_loggers" VALUES ('33', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-07 00:53:23.771+06');
INSERT INTO "public"."account_loggers" VALUES ('34', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-07 00:53:30.475+06');
INSERT INTO "public"."account_loggers" VALUES ('35', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-07 13:03:15.952+06');
INSERT INTO "public"."account_loggers" VALUES ('36', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-07 13:03:17.952+06');
INSERT INTO "public"."account_loggers" VALUES ('37', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-08 02:03:14.804+06');
INSERT INTO "public"."account_loggers" VALUES ('38', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-08 02:03:16.421+06');
INSERT INTO "public"."account_loggers" VALUES ('39', '192.168.1.101', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/44.0.2403.67 Mobile/13A4305g Safari/600.1.4', null, '2015-08-08 07:00:25.092+06');
INSERT INTO "public"."account_loggers" VALUES ('40', '192.168.1.101', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_0 like Mac OS X) AppleWebKit/600.1.4 (KHTML, like Gecko) CriOS/44.0.2403.67 Mobile/13A4305g Safari/600.1.4', 'iamjacke@gmail.com', '2015-08-08 07:00:26.496+06');
INSERT INTO "public"."account_loggers" VALUES ('41', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-08 07:00:29.788+06');
INSERT INTO "public"."account_loggers" VALUES ('42', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-08 07:00:30.651+06');
INSERT INTO "public"."account_loggers" VALUES ('43', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-09 09:08:25.462+06');
INSERT INTO "public"."account_loggers" VALUES ('44', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-09 09:08:27.574+06');
INSERT INTO "public"."account_loggers" VALUES ('45', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-09 22:46:41.278+06');
INSERT INTO "public"."account_loggers" VALUES ('46', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-09 22:46:44.304+06');
INSERT INTO "public"."account_loggers" VALUES ('47', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-09 23:02:04.722+06');
INSERT INTO "public"."account_loggers" VALUES ('48', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-09 23:02:06.133+06');
INSERT INTO "public"."account_loggers" VALUES ('49', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', null, '2015-08-11 07:08:59.885+06');
INSERT INTO "public"."account_loggers" VALUES ('50', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.107 Safari/537.36', 'iamjacke@gmail.com', '2015-08-11 07:09:01.749+06');
INSERT INTO "public"."account_loggers" VALUES ('51', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-11 19:18:48.124+06');
INSERT INTO "public"."account_loggers" VALUES ('52', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-11 19:18:50.267+06');
INSERT INTO "public"."account_loggers" VALUES ('53', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-12 16:02:42.53+06');
INSERT INTO "public"."account_loggers" VALUES ('54', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-12 16:02:46.014+06');
INSERT INTO "public"."account_loggers" VALUES ('55', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-13 13:58:13.718+06');
INSERT INTO "public"."account_loggers" VALUES ('56', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-13 13:58:16.946+06');
INSERT INTO "public"."account_loggers" VALUES ('57', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-14 03:51:01.304+06');
INSERT INTO "public"."account_loggers" VALUES ('58', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-14 03:51:04.431+06');
INSERT INTO "public"."account_loggers" VALUES ('59', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-14 21:18:40.742+06');
INSERT INTO "public"."account_loggers" VALUES ('60', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-14 21:18:42.066+06');
INSERT INTO "public"."account_loggers" VALUES ('61', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-15 23:04:14.316+06');
INSERT INTO "public"."account_loggers" VALUES ('62', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-15 23:04:15.772+06');
INSERT INTO "public"."account_loggers" VALUES ('63', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-16 11:47:13.043+06');
INSERT INTO "public"."account_loggers" VALUES ('64', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-16 11:47:16.315+06');
INSERT INTO "public"."account_loggers" VALUES ('65', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-19 06:05:54.335+06');
INSERT INTO "public"."account_loggers" VALUES ('66', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-19 06:05:56.42+06');
INSERT INTO "public"."account_loggers" VALUES ('67', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-19 22:20:03.712+06');
INSERT INTO "public"."account_loggers" VALUES ('68', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-19 22:20:06.296+06');
INSERT INTO "public"."account_loggers" VALUES ('69', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-21 05:11:09.689+06');
INSERT INTO "public"."account_loggers" VALUES ('70', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-21 05:11:12.001+06');
INSERT INTO "public"."account_loggers" VALUES ('71', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-21 23:36:09.037+06');
INSERT INTO "public"."account_loggers" VALUES ('72', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-21 23:36:14.912+06');
INSERT INTO "public"."account_loggers" VALUES ('73', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-22 20:52:36.103+06');
INSERT INTO "public"."account_loggers" VALUES ('74', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-22 20:52:37.974+06');
INSERT INTO "public"."account_loggers" VALUES ('75', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-23 08:55:46.622+06');
INSERT INTO "public"."account_loggers" VALUES ('76', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-23 08:55:50.279+06');
INSERT INTO "public"."account_loggers" VALUES ('77', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-23 10:05:34.283+06');
INSERT INTO "public"."account_loggers" VALUES ('78', '127.0.0.1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-23 10:05:35.505+06');
INSERT INTO "public"."account_loggers" VALUES ('79', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-23 11:53:17.648+06');
INSERT INTO "public"."account_loggers" VALUES ('80', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-23 11:53:19.247+06');
INSERT INTO "public"."account_loggers" VALUES ('81', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-23 13:09:09.229+06');
INSERT INTO "public"."account_loggers" VALUES ('82', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'test1@minorityapp.com', '2015-08-23 13:09:10.513+06');
INSERT INTO "public"."account_loggers" VALUES ('83', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-23 13:23:44.682+06');
INSERT INTO "public"."account_loggers" VALUES ('84', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-23 13:23:45.396+06');
INSERT INTO "public"."account_loggers" VALUES ('85', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-23 14:33:11.831+06');
INSERT INTO "public"."account_loggers" VALUES ('86', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-23 14:33:13.614+06');
INSERT INTO "public"."account_loggers" VALUES ('87', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-24 12:10:41.313+06');
INSERT INTO "public"."account_loggers" VALUES ('88', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-24 12:10:44.938+06');
INSERT INTO "public"."account_loggers" VALUES ('89', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-26 11:47:30.469+06');
INSERT INTO "public"."account_loggers" VALUES ('90', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-26 11:47:40.948+06');
INSERT INTO "public"."account_loggers" VALUES ('91', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-27 22:40:59.568+06');
INSERT INTO "public"."account_loggers" VALUES ('92', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-27 22:41:02.501+06');
INSERT INTO "public"."account_loggers" VALUES ('93', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-28 13:17:58.643+06');
INSERT INTO "public"."account_loggers" VALUES ('94', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-28 13:18:00.392+06');
INSERT INTO "public"."account_loggers" VALUES ('95', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-28 18:22:56.479+06');
INSERT INTO "public"."account_loggers" VALUES ('96', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-28 18:22:57.933+06');
INSERT INTO "public"."account_loggers" VALUES ('97', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-29 22:49:04.827+06');
INSERT INTO "public"."account_loggers" VALUES ('98', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-29 22:55:27.313+06');
INSERT INTO "public"."account_loggers" VALUES ('99', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-29 22:55:31.679+06');
INSERT INTO "public"."account_loggers" VALUES ('100', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-08-30 15:57:13.268+06');
INSERT INTO "public"."account_loggers" VALUES ('101', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'iamjacke@gmail.com', '2015-08-30 15:57:16.248+06');
INSERT INTO "public"."account_loggers" VALUES ('102', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-09-01 04:30:14.244+06');
INSERT INTO "public"."account_loggers" VALUES ('103', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'employee1@minorityapp.com', '2015-09-01 04:30:16.573+06');
INSERT INTO "public"."account_loggers" VALUES ('104', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-09-01 16:29:11.069+06');
INSERT INTO "public"."account_loggers" VALUES ('105', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'habizn@zurob.in', '2015-09-01 16:29:12.488+06');
INSERT INTO "public"."account_loggers" VALUES ('106', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-09-01 16:33:44.254+06');
INSERT INTO "public"."account_loggers" VALUES ('107', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'habizn@zurob.in', '2015-09-01 16:33:45.083+06');
INSERT INTO "public"."account_loggers" VALUES ('108', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-09-01 17:01:29.91+06');
INSERT INTO "public"."account_loggers" VALUES ('109', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'habizn@zurob.in', '2015-09-01 17:01:31.224+06');
INSERT INTO "public"."account_loggers" VALUES ('110', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', null, '2015-09-01 18:12:39.557+06');
INSERT INTO "public"."account_loggers" VALUES ('111', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.130 Safari/537.36', 'analytics1@minorityapp.com', '2015-09-01 18:12:42.022+06');
INSERT INTO "public"."account_loggers" VALUES ('112', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', null, '2015-09-02 04:39:37.619+06');
INSERT INTO "public"."account_loggers" VALUES ('113', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'iamjacke@gmail.com', '2015-09-02 04:39:39.348+06');
INSERT INTO "public"."account_loggers" VALUES ('114', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', null, '2015-09-02 18:01:55.327+06');
INSERT INTO "public"."account_loggers" VALUES ('115', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'iamjacke@gmail.com', '2015-09-02 18:01:56.568+06');
INSERT INTO "public"."account_loggers" VALUES ('116', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', null, '2015-09-03 11:28:56.565+06');
INSERT INTO "public"."account_loggers" VALUES ('117', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'iamjacke@gmail.com', '2015-09-03 11:28:57.961+06');
INSERT INTO "public"."account_loggers" VALUES ('118', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', null, '2015-09-04 20:20:47.617+06');
INSERT INTO "public"."account_loggers" VALUES ('119', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'iamjacke@gmail.com', '2015-09-04 20:20:48.956+06');
INSERT INTO "public"."account_loggers" VALUES ('120', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', null, '2015-09-05 09:20:00.453+06');
INSERT INTO "public"."account_loggers" VALUES ('121', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'iamjacke@gmail.com', '2015-09-05 09:20:02.065+06');
INSERT INTO "public"."account_loggers" VALUES ('122', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', null, '2015-09-05 09:41:49.37+06');
INSERT INTO "public"."account_loggers" VALUES ('123', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'iamjacke@gmail.com', '2015-09-05 09:41:50.259+06');
INSERT INTO "public"."account_loggers" VALUES ('124', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', null, '2015-09-06 02:18:00.913+06');
INSERT INTO "public"."account_loggers" VALUES ('125', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'iamjacke@gmail.com', '2015-09-06 02:18:01.93+06');
INSERT INTO "public"."account_loggers" VALUES ('126', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', null, '2015-09-06 18:56:34.167+06');
INSERT INTO "public"."account_loggers" VALUES ('127', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/44.0.2403.157 Safari/537.36', 'iamjacke@gmail.com', '2015-09-06 18:56:36.057+06');
INSERT INTO "public"."account_loggers" VALUES ('128', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', null, '2015-09-07 02:35:04.383+06');
INSERT INTO "public"."account_loggers" VALUES ('129', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101 Firefox/38.0', 'iamjacke@gmail.com', '2015-09-07 02:35:06.001+06');
INSERT INTO "public"."account_loggers" VALUES ('130', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-08 06:18:51.118+06');
INSERT INTO "public"."account_loggers" VALUES ('131', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-08 06:18:53.54+06');
INSERT INTO "public"."account_loggers" VALUES ('132', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-08 06:25:07.148+06');
INSERT INTO "public"."account_loggers" VALUES ('133', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-08 06:25:09.349+06');
INSERT INTO "public"."account_loggers" VALUES ('134', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-09 08:38:30.584+06');
INSERT INTO "public"."account_loggers" VALUES ('135', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-09 08:38:32.398+06');
INSERT INTO "public"."account_loggers" VALUES ('136', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-09 23:15:39.895+06');
INSERT INTO "public"."account_loggers" VALUES ('137', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-09 23:15:41.524+06');
INSERT INTO "public"."account_loggers" VALUES ('138', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-11 05:17:38.615+06');
INSERT INTO "public"."account_loggers" VALUES ('139', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-11 05:17:40.315+06');
INSERT INTO "public"."account_loggers" VALUES ('140', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-12 16:04:04.77+06');
INSERT INTO "public"."account_loggers" VALUES ('141', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-12 16:04:07.922+06');
INSERT INTO "public"."account_loggers" VALUES ('142', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-13 07:34:45.208+06');
INSERT INTO "public"."account_loggers" VALUES ('143', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-13 07:34:47.926+06');
INSERT INTO "public"."account_loggers" VALUES ('144', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-17 01:35:15.221+06');
INSERT INTO "public"."account_loggers" VALUES ('145', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-17 01:35:17.626+06');
INSERT INTO "public"."account_loggers" VALUES ('146', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-18 08:19:56.059+06');
INSERT INTO "public"."account_loggers" VALUES ('147', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-18 08:19:58.582+06');
INSERT INTO "public"."account_loggers" VALUES ('148', '192.168.1.101', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1', null, '2015-09-18 08:29:00.235+06');
INSERT INTO "public"."account_loggers" VALUES ('149', '192.168.1.101', 'Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B5110e Safari/601.1', 'iamjacke@gmail.com', '2015-09-18 08:29:00.99+06');
INSERT INTO "public"."account_loggers" VALUES ('150', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-19 00:12:16.249+06');
INSERT INTO "public"."account_loggers" VALUES ('151', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-19 00:12:17.759+06');
INSERT INTO "public"."account_loggers" VALUES ('152', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-19 20:27:42.487+06');
INSERT INTO "public"."account_loggers" VALUES ('153', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-19 20:27:45.099+06');
INSERT INTO "public"."account_loggers" VALUES ('154', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', null, '2015-09-20 11:24:13.269+06');
INSERT INTO "public"."account_loggers" VALUES ('155', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.85 Safari/537.36', 'iamjacke@gmail.com', '2015-09-20 11:24:15.365+06');
INSERT INTO "public"."account_loggers" VALUES ('156', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', null, '2015-09-20 23:56:36.515+06');
INSERT INTO "public"."account_loggers" VALUES ('157', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 'iamjacke@gmail.com', '2015-09-20 23:56:39.749+06');
INSERT INTO "public"."account_loggers" VALUES ('158', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', null, '2015-09-21 14:44:06.264+06');
INSERT INTO "public"."account_loggers" VALUES ('159', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 'iamjacke@gmail.com', '2015-09-21 14:44:08.633+06');
INSERT INTO "public"."account_loggers" VALUES ('160', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', null, '2015-09-22 11:51:15.014+06');
INSERT INTO "public"."account_loggers" VALUES ('161', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 'iamjacke@gmail.com', '2015-09-22 11:51:16.098+06');
INSERT INTO "public"."account_loggers" VALUES ('162', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', null, '2015-09-22 18:32:09.664+06');
INSERT INTO "public"."account_loggers" VALUES ('163', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 'iamjacke@gmail.com', '2015-09-22 18:32:12.112+06');
INSERT INTO "public"."account_loggers" VALUES ('164', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', null, '2015-09-23 15:14:16.856+06');
INSERT INTO "public"."account_loggers" VALUES ('165', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 'iamjacke@gmail.com', '2015-09-23 15:14:19.827+06');
INSERT INTO "public"."account_loggers" VALUES ('166', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', null, '2015-09-24 04:49:52.232+06');
INSERT INTO "public"."account_loggers" VALUES ('167', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 'iamjacke@gmail.com', '2015-09-24 04:49:53.251+06');
INSERT INTO "public"."account_loggers" VALUES ('168', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', null, '2015-09-24 21:47:31.223+06');
INSERT INTO "public"."account_loggers" VALUES ('169', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.93 Safari/537.36', 'iamjacke@gmail.com', '2015-09-24 21:47:34.759+06');
INSERT INTO "public"."account_loggers" VALUES ('170', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', null, '2015-09-26 08:37:32.562+06');
INSERT INTO "public"."account_loggers" VALUES ('171', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'iamjacke@gmail.com', '2015-09-26 08:37:33.998+06');
INSERT INTO "public"."account_loggers" VALUES ('172', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', null, '2015-09-29 10:55:28.154+06');
INSERT INTO "public"."account_loggers" VALUES ('173', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.99 Safari/537.36', 'iamjacke@gmail.com', '2015-09-29 10:55:30.326+06');
INSERT INTO "public"."account_loggers" VALUES ('174', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-09-30 16:09:20.488+06');
INSERT INTO "public"."account_loggers" VALUES ('175', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-09-30 16:09:22.668+06');
INSERT INTO "public"."account_loggers" VALUES ('176', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-03 21:54:38.825+06');
INSERT INTO "public"."account_loggers" VALUES ('177', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-03 21:54:40.75+06');
INSERT INTO "public"."account_loggers" VALUES ('178', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-04 10:00:28.544+06');
INSERT INTO "public"."account_loggers" VALUES ('179', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-04 10:00:30.811+06');
INSERT INTO "public"."account_loggers" VALUES ('180', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-05 08:40:06.176+06');
INSERT INTO "public"."account_loggers" VALUES ('181', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-05 08:40:08.697+06');
INSERT INTO "public"."account_loggers" VALUES ('182', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-06 14:08:37.66+06');
INSERT INTO "public"."account_loggers" VALUES ('183', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-06 14:08:40.308+06');
INSERT INTO "public"."account_loggers" VALUES ('184', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-07 09:07:37.889+06');
INSERT INTO "public"."account_loggers" VALUES ('185', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-07 09:07:40.985+06');
INSERT INTO "public"."account_loggers" VALUES ('186', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-07 22:56:53.844+06');
INSERT INTO "public"."account_loggers" VALUES ('187', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-07 22:56:56.036+06');
INSERT INTO "public"."account_loggers" VALUES ('188', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-09 10:31:48.883+06');
INSERT INTO "public"."account_loggers" VALUES ('189', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-09 10:31:50.581+06');
INSERT INTO "public"."account_loggers" VALUES ('190', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-09 22:40:57.937+06');
INSERT INTO "public"."account_loggers" VALUES ('191', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-09 22:41:00.886+06');
INSERT INTO "public"."account_loggers" VALUES ('192', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-10 20:09:06.831+06');
INSERT INTO "public"."account_loggers" VALUES ('193', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-10 20:09:10.834+06');
INSERT INTO "public"."account_loggers" VALUES ('194', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-11 14:14:04.171+06');
INSERT INTO "public"."account_loggers" VALUES ('195', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-11 14:14:07.372+06');
INSERT INTO "public"."account_loggers" VALUES ('196', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-11 17:24:57.714+06');
INSERT INTO "public"."account_loggers" VALUES ('197', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-11 17:25:00.044+06');
INSERT INTO "public"."account_loggers" VALUES ('198', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-12 06:21:24.361+06');
INSERT INTO "public"."account_loggers" VALUES ('199', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-12 06:21:28.814+06');
INSERT INTO "public"."account_loggers" VALUES ('200', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-12 20:17:33.921+06');
INSERT INTO "public"."account_loggers" VALUES ('201', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-12 20:17:35.812+06');
INSERT INTO "public"."account_loggers" VALUES ('202', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-13 21:47:00.631+06');
INSERT INTO "public"."account_loggers" VALUES ('203', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-13 21:47:04.135+06');
INSERT INTO "public"."account_loggers" VALUES ('204', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-14 00:52:58.707+06');
INSERT INTO "public"."account_loggers" VALUES ('205', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-14 00:53:03.98+06');
INSERT INTO "public"."account_loggers" VALUES ('206', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-14 18:46:21.387+06');
INSERT INTO "public"."account_loggers" VALUES ('207', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-14 18:46:23.947+06');
INSERT INTO "public"."account_loggers" VALUES ('208', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-15 07:36:42.634+06');
INSERT INTO "public"."account_loggers" VALUES ('209', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-15 07:36:45.257+06');
INSERT INTO "public"."account_loggers" VALUES ('210', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-16 15:32:22.081+06');
INSERT INTO "public"."account_loggers" VALUES ('211', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-16 15:32:24.503+06');
INSERT INTO "public"."account_loggers" VALUES ('212', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-17 17:39:08.611+06');
INSERT INTO "public"."account_loggers" VALUES ('213', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-17 17:39:08.482+06');
INSERT INTO "public"."account_loggers" VALUES ('214', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-17 17:39:12.502+06');
INSERT INTO "public"."account_loggers" VALUES ('215', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-17 17:39:12.829+06');
INSERT INTO "public"."account_loggers" VALUES ('216', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-18 17:28:54.338+06');
INSERT INTO "public"."account_loggers" VALUES ('217', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-18 17:28:57.275+06');
INSERT INTO "public"."account_loggers" VALUES ('218', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-20 10:24:24.779+06');
INSERT INTO "public"."account_loggers" VALUES ('219', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-20 10:24:28.492+06');
INSERT INTO "public"."account_loggers" VALUES ('220', '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-21 03:43:01.03+06');
INSERT INTO "public"."account_loggers" VALUES ('221', '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-21 03:43:04.263+06');
INSERT INTO "public"."account_loggers" VALUES ('222', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', null, '2015-10-21 04:17:59.693+06');
INSERT INTO "public"."account_loggers" VALUES ('223', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/45.0.2454.101 Safari/537.36', 'iamjacke@gmail.com', '2015-10-21 04:18:00.295+06');
INSERT INTO "public"."account_loggers" VALUES ('224', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-21 21:50:46.12+06');
INSERT INTO "public"."account_loggers" VALUES ('225', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-21 21:50:47.292+06');
INSERT INTO "public"."account_loggers" VALUES ('226', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-23 00:06:47.239+06');
INSERT INTO "public"."account_loggers" VALUES ('227', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-23 00:06:50.067+06');
INSERT INTO "public"."account_loggers" VALUES ('228', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-24 14:47:27.006+06');
INSERT INTO "public"."account_loggers" VALUES ('229', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-24 14:47:33.244+06');
INSERT INTO "public"."account_loggers" VALUES ('230', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-25 03:10:14.649+06');
INSERT INTO "public"."account_loggers" VALUES ('231', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-25 03:10:17.499+06');
INSERT INTO "public"."account_loggers" VALUES ('232', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-26 08:00:46.305+06');
INSERT INTO "public"."account_loggers" VALUES ('233', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-26 08:00:47.678+06');
INSERT INTO "public"."account_loggers" VALUES ('234', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-27 04:54:46.215+06');
INSERT INTO "public"."account_loggers" VALUES ('235', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-27 04:54:50.707+06');
INSERT INTO "public"."account_loggers" VALUES ('236', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-29 11:26:04.298+06');
INSERT INTO "public"."account_loggers" VALUES ('237', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-29 11:26:12.493+06');
INSERT INTO "public"."account_loggers" VALUES ('238', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-30 06:35:45.361+06');
INSERT INTO "public"."account_loggers" VALUES ('239', '192.168.1.101', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-30 06:35:51.494+06');
INSERT INTO "public"."account_loggers" VALUES ('240', '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', null, '2015-10-30 08:18:45.343+06');
INSERT INTO "public"."account_loggers" VALUES ('241', '192.168.1.101', 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.71 Safari/537.36', 'iamjacke@gmail.com', '2015-10-30 08:18:48.071+06');
INSERT INTO "public"."account_loggers" VALUES ('242', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-02 22:03:41.336+06');
INSERT INTO "public"."account_loggers" VALUES ('243', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-02 22:03:43.829+06');
INSERT INTO "public"."account_loggers" VALUES ('244', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-03 15:32:59.486+06');
INSERT INTO "public"."account_loggers" VALUES ('245', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-03 15:33:02.75+06');
INSERT INTO "public"."account_loggers" VALUES ('246', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-04 11:21:42.762+06');
INSERT INTO "public"."account_loggers" VALUES ('247', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-04 11:21:49.627+06');
INSERT INTO "public"."account_loggers" VALUES ('248', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-04 23:24:52.338+06');
INSERT INTO "public"."account_loggers" VALUES ('249', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-04 23:24:54.242+06');
INSERT INTO "public"."account_loggers" VALUES ('250', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-05 20:54:15.131+06');
INSERT INTO "public"."account_loggers" VALUES ('251', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-05 20:54:16.972+06');
INSERT INTO "public"."account_loggers" VALUES ('252', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-06 17:37:09.45+06');
INSERT INTO "public"."account_loggers" VALUES ('253', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-06 17:37:10.59+06');
INSERT INTO "public"."account_loggers" VALUES ('254', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-07 06:08:26.557+06');
INSERT INTO "public"."account_loggers" VALUES ('255', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-07 06:08:29.513+06');
INSERT INTO "public"."account_loggers" VALUES ('256', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-07 19:10:58.307+06');
INSERT INTO "public"."account_loggers" VALUES ('257', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-07 19:11:01.404+06');
INSERT INTO "public"."account_loggers" VALUES ('258', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-08 16:55:38.935+06');
INSERT INTO "public"."account_loggers" VALUES ('259', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-08 16:55:40.889+06');
INSERT INTO "public"."account_loggers" VALUES ('260', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-09 17:48:19.017+06');
INSERT INTO "public"."account_loggers" VALUES ('261', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-09 17:48:22.21+06');
INSERT INTO "public"."account_loggers" VALUES ('262', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-10 17:46:45.919+06');
INSERT INTO "public"."account_loggers" VALUES ('263', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-10 17:46:50.697+06');
INSERT INTO "public"."account_loggers" VALUES ('264', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-11 19:04:15.906+06');
INSERT INTO "public"."account_loggers" VALUES ('265', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-11 19:04:18.957+06');
INSERT INTO "public"."account_loggers" VALUES ('266', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-12 07:32:46.966+06');
INSERT INTO "public"."account_loggers" VALUES ('267', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-12 07:32:48.679+06');
INSERT INTO "public"."account_loggers" VALUES ('268', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', null, '2015-11-12 19:48:19.246+06');
INSERT INTO "public"."account_loggers" VALUES ('269', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36', 'iamjacke@gmail.com', '2015-11-12 19:48:23.041+06');
INSERT INTO "public"."account_loggers" VALUES ('270', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-15 23:33:33.818+06');
INSERT INTO "public"."account_loggers" VALUES ('271', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-15 23:33:36.744+06');
INSERT INTO "public"."account_loggers" VALUES ('272', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-16 11:59:28.005+06');
INSERT INTO "public"."account_loggers" VALUES ('273', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-16 11:59:33.904+06');
INSERT INTO "public"."account_loggers" VALUES ('274', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-17 04:06:48.362+06');
INSERT INTO "public"."account_loggers" VALUES ('275', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-17 04:06:50.049+06');
INSERT INTO "public"."account_loggers" VALUES ('276', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-17 16:13:00.236+06');
INSERT INTO "public"."account_loggers" VALUES ('277', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-17 16:13:01.171+06');
INSERT INTO "public"."account_loggers" VALUES ('278', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-19 08:10:46.709+06');
INSERT INTO "public"."account_loggers" VALUES ('279', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-19 08:10:48.605+06');
INSERT INTO "public"."account_loggers" VALUES ('280', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-19 20:14:09.787+06');
INSERT INTO "public"."account_loggers" VALUES ('281', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-19 20:14:11.972+06');
INSERT INTO "public"."account_loggers" VALUES ('282', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-21 16:01:01.171+06');
INSERT INTO "public"."account_loggers" VALUES ('283', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-21 16:01:03.393+06');
INSERT INTO "public"."account_loggers" VALUES ('284', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-22 09:07:42.801+06');
INSERT INTO "public"."account_loggers" VALUES ('285', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-22 09:07:47.552+06');
INSERT INTO "public"."account_loggers" VALUES ('286', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-23 01:54:27.507+06');
INSERT INTO "public"."account_loggers" VALUES ('287', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-23 01:54:30.426+06');
INSERT INTO "public"."account_loggers" VALUES ('288', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-23 13:59:53.192+06');
INSERT INTO "public"."account_loggers" VALUES ('289', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-23 13:59:55.812+06');
INSERT INTO "public"."account_loggers" VALUES ('290', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-24 10:17:08.325+06');
INSERT INTO "public"."account_loggers" VALUES ('291', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-24 10:17:12.823+06');
INSERT INTO "public"."account_loggers" VALUES ('292', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-25 16:01:00.964+06');
INSERT INTO "public"."account_loggers" VALUES ('293', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-25 16:01:03.559+06');
INSERT INTO "public"."account_loggers" VALUES ('294', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-26 13:01:04.965+06');
INSERT INTO "public"."account_loggers" VALUES ('295', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-26 13:01:08.338+06');
INSERT INTO "public"."account_loggers" VALUES ('296', '127.0.0.1', '', null, '2015-11-29 14:48:06.79+06');
INSERT INTO "public"."account_loggers" VALUES ('297', '127.0.0.1', '', 'L.Rzcnq@example.com', '2015-11-29 14:48:09.471+06');
INSERT INTO "public"."account_loggers" VALUES ('298', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-30 05:38:12.646+06');
INSERT INTO "public"."account_loggers" VALUES ('299', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-30 05:38:13.965+06');
INSERT INTO "public"."account_loggers" VALUES ('300', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-30 05:53:00.472+06');
INSERT INTO "public"."account_loggers" VALUES ('301', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-30 05:53:01.868+06');
INSERT INTO "public"."account_loggers" VALUES ('302', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-11-30 06:06:33.129+06');
INSERT INTO "public"."account_loggers" VALUES ('303', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-11-30 06:06:34.488+06');
INSERT INTO "public"."account_loggers" VALUES ('304', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-12-01 06:25:26.759+06');
INSERT INTO "public"."account_loggers" VALUES ('305', '192.168.1.102', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-12-01 06:25:28.227+06');
INSERT INTO "public"."account_loggers" VALUES ('306', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-12-01 06:39:23.749+06');
INSERT INTO "public"."account_loggers" VALUES ('307', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-12-01 06:39:25.238+06');
INSERT INTO "public"."account_loggers" VALUES ('308', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-12-01 06:48:17.907+06');
INSERT INTO "public"."account_loggers" VALUES ('309', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-12-01 06:48:18.858+06');
INSERT INTO "public"."account_loggers" VALUES ('310', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-12-01 06:57:12.248+06');
INSERT INTO "public"."account_loggers" VALUES ('311', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-12-01 06:57:13.582+06');
INSERT INTO "public"."account_loggers" VALUES ('312', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-12-01 14:30:23.903+06');
INSERT INTO "public"."account_loggers" VALUES ('313', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-12-01 14:30:25.898+06');
INSERT INTO "public"."account_loggers" VALUES ('314', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-12-01 14:36:13.995+06');
INSERT INTO "public"."account_loggers" VALUES ('315', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-12-01 14:36:16.098+06');
INSERT INTO "public"."account_loggers" VALUES ('316', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-12-01 14:40:14.055+06');
INSERT INTO "public"."account_loggers" VALUES ('317', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-12-01 14:40:15.9+06');
INSERT INTO "public"."account_loggers" VALUES ('318', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', null, '2015-12-01 14:42:51.046+06');
INSERT INTO "public"."account_loggers" VALUES ('319', '0:0:0:0:0:0:0:1', 'Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.86 Safari/537.36', 'iamjacke@gmail.com', '2015-12-01 14:42:52.263+06');

-- ----------------------------
-- Table structure for account_plan_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_plan_history";
CREATE TABLE "public"."account_plan_history" (
"id" int4 DEFAULT nextval('account_plan_history_id_seq'::regclass) NOT NULL,
"account_plan_id" int4 NOT NULL,
"limit_diff" int4 NOT NULL,
"plan_diff" int4 NOT NULL,
"bill_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of account_plan_history
-- ----------------------------
INSERT INTO "public"."account_plan_history" VALUES ('1', '1', '-1', '3', '3');

-- ----------------------------
-- Table structure for account_plans
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_plans";
CREATE TABLE "public"."account_plans" (
"id" int4 DEFAULT nextval('account_plans_id_seq'::regclass) NOT NULL,
"business_id" int4,
"master_acc" varchar COLLATE "default" NOT NULL,
"plan_id" int4 NOT NULL,
"expired_at" timestamptz(6) NOT NULL,
"active" bool NOT NULL,
"limit" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of account_plans
-- ----------------------------
INSERT INTO "public"."account_plans" VALUES ('1', null, 'iamjacke@gmail.com', '3', '2015-12-23 22:32:00.344+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('2', null, 'juices.woo@gmail.com', '2', '2015-09-01 04:39:16.024+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('3', null, 'R.Peht@example.com', '1', '2015-09-01 04:39:16.024+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('4', null, 'N.As@example.com', '1', '2015-09-01 04:39:16.024+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('5', null, 'B.Olxxo@example.com', '1', '2015-09-01 04:39:16.024+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('6', null, 'O.Qekwxza@example.com', '1', '2015-09-01 04:39:16.024+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('7', null, 'X.Rrwydyywt@example.com', '1', '2015-09-01 04:39:16.024+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('8', null, 'test1@minorityapp.com', '1', '2015-09-01 04:39:16.024+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('9', null, 'totes@blah.com', '1', '2015-09-02 16:09:31.35+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('10', null, 'totes2@toto.ru', '1', '2015-09-02 17:03:13.161+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('11', null, 'tetete@tt.ru', '1', '2015-09-02 18:24:15.575+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('12', null, 'totes@totes.com', '1', '2015-09-03 11:40:08.546+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('13', null, 'totes@totes.ru', '1', '2015-09-03 23:21:35.891+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('14', null, 'lebua@yahoo.com', '1', '2015-09-05 23:06:51.581+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('15', null, 'employee1@minorityapp.com', '1', '2015-09-06 04:04:59.005+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('16', null, 'myakush@zurob.in', '1', '2015-09-06 06:04:12.869+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('17', null, 'habizn@zurob.in', '1', '2015-09-06 06:10:52.726+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('21', '94', 'analytics1@minorityapp.com', '1', '2015-09-06 18:04:38.777+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('22', '95', 'test7777@minorityapp.com', '1', '2015-09-30 07:10:51.595+06', 't', '5');
INSERT INTO "public"."account_plans" VALUES ('23', '96', 'test333333@minorityapp.com', '1', '2015-09-30 07:17:29.495+06', 't', '5');

-- ----------------------------
-- Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS "public"."accounts";
CREATE TABLE "public"."accounts" (
"providerId" varchar COLLATE "default" NOT NULL,
"userId" varchar COLLATE "default" NOT NULL,
"firstName" varchar COLLATE "default",
"lastName" varchar COLLATE "default",
"fullName" varchar COLLATE "default",
"email" varchar COLLATE "default",
"avatarUrl" varchar COLLATE "default",
"authMethod" varchar COLLATE "default" NOT NULL,
"token" varchar COLLATE "default",
"secret" varchar COLLATE "default",
"accessToken" varchar COLLATE "default",
"tokenType" varchar COLLATE "default",
"expiresIn" int4,
"refreshToken" varchar COLLATE "default",
"hasher" varchar COLLATE "default" NOT NULL,
"password" varchar COLLATE "default" NOT NULL,
"salt" varchar COLLATE "default",
"lang" varchar COLLATE "default" NOT NULL,
"country" varchar COLLATE "default",
"phone" varchar COLLATE "default",
"nickname" varchar COLLATE "default",
"created_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of accounts
-- ----------------------------
INSERT INTO "public"."accounts" VALUES ('userpass', 'A.Vbmgt@example.com', 'Affvam', 'Vbmgt', 'Affvam Vbmgt', 'A.Vbmgt@example.com', '', 'openId', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'analytic_helper2@minorityapp.com', 'Analytic', 'helper 2', 'Analytic helper 2', 'analytic_helper2@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$JQO46n1BveonSiTPWJ/oDe.TRC0nA2RlmaFwC8FJU1lCxYKtRXaxi', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'analytics_helper@minorityapp.com', 'Analytic', 'helper', 'Analytic helper', 'analytics_helper@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$8H84oMHpwxeb.eCYX3wMwOrl/CxXEZEH4E7yDcaM/itXmS1Y7Fcn6', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'analytics1@minorityapp.com', 'Demo', 'Analytics', 'Demo Analytics', 'analytics1@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$6xn0NF9byUUoYwAnSwrqA.fXVub6lUIw9AcNDXJ2f.rldxVZ93bAa', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'B.Olxxo@example.com', 'Bs', 'Olxxo', 'Bs Olxxo', 'B.Olxxo@example.com', '', 'userPassword', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'employee1@minorityapp.com', 'Lebua', 'Employee', 'Lebua Employee', 'employee1@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$rgOB3VYS4eNWw/LYsSyy8.ov/PJxYAWrcHTiN5TpehwUYZcaaLgo6', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'employee3@minorityapp.com', 'employee 3', 'employee 3', 'employee 3 employee 3', 'employee3@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$YVH78pLAXM43xEKzdjTR5uW0lz5VZi9c8Hn2.ITl8rWJwIzsMPr3G', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'employee4@minorityapp.com', 'Employee', '4', 'Employee 4', 'employee4@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$Wh/RSs4e0rBb.TlBSw//YOLQKQayTEHMT1nEU4wIyvLD8D6vplTO6', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'employee6@minorityapp.com', 'employee 6', '6', 'employee 6 6', 'employee6@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$L3lmGkreNVG9L.W3pywtmuEDQb.GrxNJUTU3WeOMpMSojdrZLDFpK', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'employee7@minorityapp.com', 'employee 8', '8', 'employee 8 8', 'employee7@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$6ElLRRkfCSj2XxrKOocqNuhvl3iM5ed67hT5p7B0m9U1kFw9QVM8m', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'habizn@zurob.in', 'habiz', 'zuro', 'habiz zuro', 'habizn@zurob.in', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$gWFZQrmVJsAVPKCABufBPeNg1n.mLqJQx1g.Ae/tgUEPjKbzXoFEq', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'iamjacke@gmail.com', 'Steve', 'Jobs', 'Steve Jobs', 'iamjacke@gmail.com', 'http://www.gravatar.com/avatar/651ec554c78e46fe3e36cb98dacb31a5?d=404', 'userPassword', '', '', '', '', null, '', 'bcrypt', '$2a$10$ENARefhlAASkLkf7j4gQ1.efeDzHXkYW/N5r7eM8bnncKIhCsYQa.', '', 'en', '', '', 'jobs', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'juices.woo@gmail.com', 'Pavel', 'Chekmaryov', 'Pavel Chekmaryov', 'juices.woo@gmail.com', '', 'userPassword', '', '', '', '', null, '', 'bcrypt', '$2a$10$xCou9.MY1yK/lkhoAUwO5uM0AEx9aHx1U0.OQhPrWh4hDYBxQHcya', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('H.Ci@example.com', 'Kuhgjzfh', 'Hzasvm', 'Ci', 'Hzasvm Ci', 'H.Ci@example.com', '', 'userPassword', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'L.Rzcnq@example.com', 'Lm', 'Rzcnq', 'Lm Rzcnq', 'L.Rzcnq@example.com', null, 'oauth1', null, null, null, null, null, null, '', '', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'lebua@yahoo.com', 'Lebua', 'Francis', 'Lebua Francis', 'lebua@yahoo.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$O/kQosAGNdkK5fld0wqqXef2X30Mm37vUpOZ8YYpUmVI2IRQYrNL.', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'myakush@zurob.in', 'Muakush', 'Zurob', 'Muakush Zurob', 'myakush@zurob.in', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$ibK584g.x7VEv5TKriKIUuG7gboEnWxNNy1M/L07CUNxpoEF8V6u.', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'N.As@example.com', 'Nu', 'As', 'Nu As', 'N.As@example.com', '', 'oauth2', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('Yhhdogllmxm', 'Nsoqfjr', 'Sjtxh', 'Ypps', 'Sjtxh Ypps', 'S.Ypps@example.com', '', 'openId', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'O.Qekwxza@example.com', 'Ojkvecldwx', 'Qekwxza', 'Ojkvecldwx Qekwxza', 'O.Qekwxza@example.com', '', 'oauth2', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('D.Zm@example.com', 'Opvhfgtd', 'Dl', 'Zm', 'Dl Zm', 'D.Zm@example.com', '', 'oauth2', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('K.La@example.com', 'Ovo@example.com', 'Kjgbsqddsu', 'La', 'Kjgbsqddsu La', 'K.La@example.com', '', 'openId', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'R.Peht@example.com', 'Rsnhn', 'Peht', 'Rsnhn Peht', 'R.Peht@example.com', '', 'oauth2', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('Wfchixf', 'Rtfu', 'Sxemk', 'Vkd', 'Sxemk Vkd', 'S.Vkd@example.com', '', 'userPassword', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('Kofkwrs', 'Sstjmyeazm', 'Vxfeu', 'Ybjpkdkorao', 'Vxfeu Ybjpkdkorao', 'V.Ybjpkdkorao@example.com', '', 'openId', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'test1@minorityapp.com', 'fsafa', 'fsafa', 'fsafa fsafa', 'test1@minorityapp.com', '', 'userPassword', '', '', '', '', null, '', 'bcrypt', '$2a$10$tGwBR6z0M32yFfUfCyV7neD8vODtEN6igRCDk3vAoXmz.iG25HWwi', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'test333333@minorityapp.com', 'fsdfsf', 'sfsdfsfs', 'fsdfsf sfsdfsfs', 'test333333@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$E99JeizHv45dIO9JjDaCqedZjs.0zqsmpAPsZWirVw24akVJWKEQq', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'test7777@minorityapp.com', 'fsafaf', 'afsafas', 'fsafaf afsafas', 'test7777@minorityapp.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$oLtvNkEA/SuZWB5vkp8Z7eA9wtzlat3MBhYO2/1/XLgwLu75dm61G', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('Z.Cnzjxooh@example.com', 'tete@tete.ru', 'Zrjl', 'Cnzjxooh', 'Zrjl Cnzjxooh', 'tete@tete.ru', '', 'oauth1', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'tetete@tt.ru', 'fdsfsfdsf', 'fsdfsdsd', 'fdsfsfdsf fsdfsdsd', 'tetete@tt.ru', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$h0FtTo5WUBKN99AlUiLDLeabthBmG3KN1imw7YXx7095Fcry1Uhhq', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'totes@blah.com', 'tetww', 'fsdfsdfsd', 'tetww fsdfsdfsd', 'totes@blah.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$WThOKlIc1sLCq1ULjZFdCu9y9rgLqSsC37RryAoqg47qkjYKX/NHu', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'totes@totes.com', 'Lopster', 'iamjacke@gmail.com', 'Lopster iamjacke@gmail.com', 'totes@totes.com', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$Ic8SlO9UCkSsOeGjBZCpgOKrw547v2FZet53xVNUdDEeJXqMgMbKm', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'totes@totes.ru', 'tttttttt', 'ttttttttt', 'tttttttt ttttttttt', 'totes@totes.ru', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$JnwzyMwLIgsYshpeaHwIVuYqXdvYWyQ2iApptDL7aJaN/BaNKnnOS', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'totes2@toto.ru', 'trewtwe', 'fdsfsdfsdf', 'trewtwe fdsfsdfsdf', 'totes2@toto.ru', null, 'userPassword', null, null, null, null, null, null, 'bcrypt', '$2a$10$E6gWOSFy10uoFym7/KhWOO.6cGPeOUDiBnWrKQVFjtMzJR04iy2Wi', null, 'en', null, null, null, null);
INSERT INTO "public"."accounts" VALUES ('G.Izuymc@example.com', 'userpass', 'Gr', 'Izuymc', 'Gr Izuymc', 'G.Izuymc@example.com', '', 'oauth2', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'W.Ffk@example.com', 'Wokr', 'Ffk', 'Wokr Ffk', 'W.Ffk@example.com', '', 'oauth2', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('J.Tuvrwjltww@example.com', 'Wyeunaiu', 'Jxedsjidch', 'Tuvrwjltww', 'Jxedsjidch Tuvrwjltww', 'J.Tuvrwjltww@example.com', '', 'userPassword', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('userpass', 'X.Rrwydyywt@example.com', 'Xr', 'Rrwydyywt', 'Xr Rrwydyywt', 'X.Rrwydyywt@example.com', '', 'openId', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);
INSERT INTO "public"."accounts" VALUES ('L.Btucabz@example.com', 'Znyq', 'Lfc', 'Btucabz', 'Lfc Btucabz', 'L.Btucabz@example.com', '', 'oauth1', '', '', '', '', null, '', '', '', '', 'en', '', '', '', null);

-- ----------------------------
-- Table structure for admin_accounts
-- ----------------------------
DROP TABLE IF EXISTS "public"."admin_accounts";
CREATE TABLE "public"."admin_accounts" (
"id" int4 DEFAULT nextval('admin_accounts_id_seq'::regclass) NOT NULL,
"account_id" varchar COLLATE "default" NOT NULL,
"sudo" bool NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of admin_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for annotation_ranges
-- ----------------------------
DROP TABLE IF EXISTS "public"."annotation_ranges";
CREATE TABLE "public"."annotation_ranges" (
"id" int4 DEFAULT nextval('annotation_ranges_id_seq'::regclass) NOT NULL,
"annotation_id" int4 NOT NULL,
"proc_elem_start" int4,
"proc_elem_end" int4,
"space_elem_start" int4,
"space_elem_end" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of annotation_ranges
-- ----------------------------

-- ----------------------------
-- Table structure for annotations
-- ----------------------------
DROP TABLE IF EXISTS "public"."annotations";
CREATE TABLE "public"."annotations" (
"id" int4 DEFAULT nextval('annotations_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"content" varchar COLLATE "default" NOT NULL,
"process" int4 NOT NULL,
"station" int4 NOT NULL,
"is_private" bool NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of annotations
-- ----------------------------

-- ----------------------------
-- Table structure for billing_info_cards
-- ----------------------------
DROP TABLE IF EXISTS "public"."billing_info_cards";
CREATE TABLE "public"."billing_info_cards" (
"id" int4 DEFAULT nextval('billing_info_cards_id_seq'::regclass) NOT NULL,
"billing_info_id" int4 NOT NULL,
"number" varchar COLLATE "default" NOT NULL,
"expire_month" varchar COLLATE "default" NOT NULL,
"expire_year" varchar COLLATE "default" NOT NULL,
"first_name" varchar COLLATE "default" NOT NULL,
"last_name" varchar COLLATE "default" NOT NULL,
"cvv2" varchar COLLATE "default",
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of billing_info_cards
-- ----------------------------

-- ----------------------------
-- Table structure for billing_infos
-- ----------------------------
DROP TABLE IF EXISTS "public"."billing_infos";
CREATE TABLE "public"."billing_infos" (
"id" int4 DEFAULT nextval('billing_infos_id_seq'::regclass) NOT NULL,
"business_id" int4 NOT NULL,
"firstname" varchar COLLATE "default" NOT NULL,
"lastname" varchar COLLATE "default" NOT NULL,
"address" varchar COLLATE "default" NOT NULL,
"zipcode" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6) NOT NULL,
"updated_at" timestamptz(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of billing_infos
-- ----------------------------

-- ----------------------------
-- Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS "public"."bills";
CREATE TABLE "public"."bills" (
"id" int4 DEFAULT nextval('bills_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"master_acc" varchar COLLATE "default" NOT NULL,
"assigned" timestamptz(6) NOT NULL,
"approved" bool NOT NULL,
"expired" timestamptz(6) NOT NULL,
"sum" numeric(21,2) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of bills
-- ----------------------------
INSERT INTO "public"."bills" VALUES ('3', 'Bill 2015-11-23T15:38:35.680+05:00', 'iamjacke@gmail.com', '2015-12-23 16:38:35.68+06', 't', '2015-11-23 16:38:35.68+06', '169.99');

-- ----------------------------
-- Table structure for bploggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."bploggers";
CREATE TABLE "public"."bploggers" (
"id" int4 DEFAULT nextval('bploggers_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"proc_element_id" int4,
"space_element_id" int4,
"order" int4 NOT NULL,
"space_id" int4,
"station_id" int4 NOT NULL,
"invoked" bool NOT NULL,
"expanded" bool NOT NULL,
"container" bool NOT NULL,
"date" timestamptz(6) NOT NULL,
"step" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of bploggers
-- ----------------------------
INSERT INTO "public"."bploggers" VALUES ('213', '10', '23', null, '1', null, '81', 't', 'f', 'f', '2015-09-24 01:04:58.062+06', '1');
INSERT INTO "public"."bploggers" VALUES ('214', '10', '23', null, '1', null, '81', 't', 'f', 'f', '2015-09-24 01:05:32.557+06', '1');
INSERT INTO "public"."bploggers" VALUES ('215', '10', '24', null, '1', null, '82', 't', 'f', 'f', '2015-09-24 01:08:27.925+06', '1');
INSERT INTO "public"."bploggers" VALUES ('216', '10', '24', null, '1', null, '82', 't', 'f', 'f', '2015-09-24 01:08:56.192+06', '1');
INSERT INTO "public"."bploggers" VALUES ('217', '11', '25', null, '1', null, '83', 't', 'f', 'f', '2015-09-30 16:14:04.338+06', '1');
INSERT INTO "public"."bploggers" VALUES ('218', '11', null, '9', '1', null, '83', 't', 'f', 'f', '2015-09-30 16:14:04.532+06', '2');
INSERT INTO "public"."bploggers" VALUES ('219', '14', '26', null, '1', null, '84', 't', 'f', 'f', '2015-10-10 23:33:12.477+06', '1');
INSERT INTO "public"."bploggers" VALUES ('220', '14', '26', null, '1', null, '84', 't', 'f', 'f', '2015-10-10 23:40:16.599+06', '1');
INSERT INTO "public"."bploggers" VALUES ('221', '14', '27', null, '2', null, '84', 't', 'f', 'f', '2015-10-10 23:40:16.691+06', '2');
INSERT INTO "public"."bploggers" VALUES ('222', '14', null, '10', '1', null, '84', 't', 'f', 'f', '2015-10-10 23:40:16.874+06', '3');
INSERT INTO "public"."bploggers" VALUES ('223', '14', '26', null, '1', null, '84', 't', 'f', 'f', '2015-10-10 23:41:07.965+06', '1');
INSERT INTO "public"."bploggers" VALUES ('224', '14', '27', null, '2', null, '84', 't', 'f', 'f', '2015-10-10 23:41:07.968+06', '2');
INSERT INTO "public"."bploggers" VALUES ('225', '14', null, '10', '1', null, '84', 't', 'f', 'f', '2015-10-10 23:41:07.988+06', '3');
INSERT INTO "public"."bploggers" VALUES ('226', '14', '28', null, '3', null, '84', 't', 'f', 'f', '2015-10-10 23:41:08.023+06', '4');
INSERT INTO "public"."bploggers" VALUES ('227', '14', '26', null, '1', null, '84', 't', 'f', 'f', '2015-10-10 23:41:43.292+06', '1');
INSERT INTO "public"."bploggers" VALUES ('228', '14', '27', null, '2', null, '84', 't', 'f', 'f', '2015-10-10 23:41:43.296+06', '2');
INSERT INTO "public"."bploggers" VALUES ('229', '14', null, '10', '1', null, '84', 't', 'f', 'f', '2015-10-10 23:41:43.344+06', '3');
INSERT INTO "public"."bploggers" VALUES ('230', '14', '28', null, '3', null, '84', 't', 'f', 'f', '2015-10-10 23:41:43.356+06', '4');
INSERT INTO "public"."bploggers" VALUES ('231', '15', '29', null, '1', null, '85', 't', 'f', 'f', '2015-10-11 14:36:38.422+06', '1');
INSERT INTO "public"."bploggers" VALUES ('232', '15', '29', null, '1', null, '85', 't', 'f', 'f', '2015-10-11 14:37:06.57+06', '1');
INSERT INTO "public"."bploggers" VALUES ('233', '15', '30', null, '2', null, '85', 't', 'f', 'f', '2015-10-11 14:37:06.647+06', '2');
INSERT INTO "public"."bploggers" VALUES ('234', '15', null, '11', '1', null, '85', 't', 'f', 'f', '2015-10-11 14:37:06.74+06', '3');
INSERT INTO "public"."bploggers" VALUES ('235', '15', '29', null, '1', null, '85', 't', 'f', 'f', '2015-10-11 14:37:33.855+06', '1');
INSERT INTO "public"."bploggers" VALUES ('236', '15', '30', null, '2', null, '85', 't', 'f', 'f', '2015-10-11 14:37:33.859+06', '2');
INSERT INTO "public"."bploggers" VALUES ('237', '15', null, '11', '1', null, '85', 't', 'f', 'f', '2015-10-11 14:37:33.87+06', '3');
INSERT INTO "public"."bploggers" VALUES ('238', '15', '31', null, '3', null, '85', 't', 'f', 'f', '2015-10-11 14:37:33.937+06', '4');
INSERT INTO "public"."bploggers" VALUES ('239', '15', '32', null, '1', null, '86', 't', 'f', 'f', '2015-10-11 14:39:12.874+06', '1');
INSERT INTO "public"."bploggers" VALUES ('240', '15', '32', null, '1', null, '86', 't', 'f', 'f', '2015-10-11 14:39:48.226+06', '1');
INSERT INTO "public"."bploggers" VALUES ('241', '15', '33', null, '2', null, '86', 't', 'f', 'f', '2015-10-11 14:39:48.229+06', '2');
INSERT INTO "public"."bploggers" VALUES ('242', '15', null, '13', '1', null, '86', 't', 'f', 'f', '2015-10-11 14:39:48.309+06', '3');
INSERT INTO "public"."bploggers" VALUES ('243', '15', '32', null, '1', null, '86', 't', 'f', 'f', '2015-10-11 14:40:29.922+06', '1');
INSERT INTO "public"."bploggers" VALUES ('244', '15', '33', null, '2', null, '86', 't', 'f', 'f', '2015-10-11 14:40:29.925+06', '2');
INSERT INTO "public"."bploggers" VALUES ('245', '15', null, '13', '1', null, '86', 't', 'f', 'f', '2015-10-11 14:40:29.932+06', '3');
INSERT INTO "public"."bploggers" VALUES ('246', '15', '34', null, '3', null, '86', 't', 'f', 'f', '2015-10-11 14:40:29.939+06', '4');
INSERT INTO "public"."bploggers" VALUES ('247', '14', '36', null, '1', null, '87', 't', 'f', 'f', '2015-10-11 14:41:09.434+06', '1');
INSERT INTO "public"."bploggers" VALUES ('248', '14', '35', null, '1', null, '88', 't', 'f', 'f', '2015-10-11 14:41:10.175+06', '1');
INSERT INTO "public"."bploggers" VALUES ('249', '16', '41', null, '1', null, '89', 't', 'f', 'f', '2015-10-11 16:46:22.571+06', '1');
INSERT INTO "public"."bploggers" VALUES ('250', '16', '42', null, '2', null, '89', 't', 'f', 'f', '2015-10-11 16:46:22.978+06', '2');
INSERT INTO "public"."bploggers" VALUES ('251', '16', null, '17', '1', null, '89', 't', 'f', 'f', '2015-10-11 16:46:23.372+06', '3');
INSERT INTO "public"."bploggers" VALUES ('252', '16', '43', null, '3', null, '89', 't', 'f', 'f', '2015-10-11 16:46:24.16+06', '4');
INSERT INTO "public"."bploggers" VALUES ('253', '16', '44', null, '1', null, '90', 't', 'f', 'f', '2015-10-11 16:53:59.095+06', '1');
INSERT INTO "public"."bploggers" VALUES ('254', '16', '45', null, '2', null, '90', 't', 'f', 'f', '2015-10-11 16:53:59.101+06', '2');
INSERT INTO "public"."bploggers" VALUES ('255', '16', null, '18', '1', null, '90', 't', 'f', 'f', '2015-10-11 16:53:59.114+06', '3');
INSERT INTO "public"."bploggers" VALUES ('256', '16', '46', null, '3', null, '90', 't', 'f', 'f', '2015-10-11 16:53:59.129+06', '4');
INSERT INTO "public"."bploggers" VALUES ('257', '16', '47', null, '1', null, '91', 't', 'f', 'f', '2015-10-11 16:58:21.787+06', '1');
INSERT INTO "public"."bploggers" VALUES ('258', '16', '48', null, '2', null, '91', 't', 'f', 'f', '2015-10-11 16:58:31.176+06', '2');
INSERT INTO "public"."bploggers" VALUES ('259', '16', null, '19', '1', null, '91', 't', 'f', 'f', '2015-10-11 16:58:31.194+06', '3');
INSERT INTO "public"."bploggers" VALUES ('260', '16', '49', null, '3', null, '91', 't', 'f', 'f', '2015-10-11 16:58:31.205+06', '4');
INSERT INTO "public"."bploggers" VALUES ('261', '16', '50', null, '1', null, '92', 't', 'f', 'f', '2015-10-11 17:01:12.655+06', '1');
INSERT INTO "public"."bploggers" VALUES ('262', '16', '51', null, '2', null, '92', 't', 'f', 'f', '2015-10-11 17:01:20.709+06', '2');
INSERT INTO "public"."bploggers" VALUES ('263', '16', null, '20', '1', null, '92', 't', 'f', 'f', '2015-10-11 17:01:23.634+06', '3');
INSERT INTO "public"."bploggers" VALUES ('264', '16', '52', null, '3', null, '92', 't', 'f', 'f', '2015-10-11 17:01:32.401+06', '4');
INSERT INTO "public"."bploggers" VALUES ('265', '16', '53', null, '1', null, '93', 't', 'f', 'f', '2015-10-11 17:09:59.614+06', '1');
INSERT INTO "public"."bploggers" VALUES ('266', '16', '54', null, '2', null, '93', 't', 'f', 'f', '2015-10-11 17:10:04.871+06', '2');
INSERT INTO "public"."bploggers" VALUES ('267', '16', null, '21', '1', null, '93', 't', 'f', 'f', '2015-10-11 17:10:07.13+06', '3');
INSERT INTO "public"."bploggers" VALUES ('268', '16', '55', null, '3', null, '93', 't', 'f', 'f', '2015-10-11 17:12:16.224+06', '4');
INSERT INTO "public"."bploggers" VALUES ('269', '16', '56', null, '1', null, '94', 't', 'f', 'f', '2015-10-11 22:20:32.302+06', '1');
INSERT INTO "public"."bploggers" VALUES ('270', '16', '57', null, '2', null, '94', 't', 'f', 'f', '2015-10-11 22:20:32.338+06', '2');
INSERT INTO "public"."bploggers" VALUES ('271', '16', null, '22', '1', null, '94', 't', 'f', 'f', '2015-10-11 22:20:32.399+06', '3');
INSERT INTO "public"."bploggers" VALUES ('272', '16', '58', null, '3', null, '94', 't', 'f', 'f', '2015-10-11 22:20:32.535+06', '4');
INSERT INTO "public"."bploggers" VALUES ('273', '14', '35', null, '1', null, '88', 't', 'f', 'f', '2015-10-11 22:24:22.535+06', '1');
INSERT INTO "public"."bploggers" VALUES ('274', '14', '38', null, '2', null, '88', 't', 'f', 'f', '2015-10-11 22:24:22.538+06', '2');
INSERT INTO "public"."bploggers" VALUES ('275', '14', null, '15', '1', null, '88', 't', 'f', 'f', '2015-10-11 22:24:22.549+06', '3');
INSERT INTO "public"."bploggers" VALUES ('276', '14', '35', null, '1', null, '88', 't', 'f', 'f', '2015-10-11 23:59:19.385+06', '1');
INSERT INTO "public"."bploggers" VALUES ('277', '14', '38', null, '2', null, '88', 't', 'f', 'f', '2015-10-11 23:59:19.422+06', '2');
INSERT INTO "public"."bploggers" VALUES ('278', '14', null, '15', '1', null, '88', 't', 'f', 'f', '2015-10-11 23:59:19.518+06', '3');
INSERT INTO "public"."bploggers" VALUES ('279', '14', '39', null, '3', null, '88', 't', 'f', 'f', '2015-10-11 23:59:20.182+06', '4');
INSERT INTO "public"."bploggers" VALUES ('280', '14', '36', null, '1', null, '87', 't', 'f', 'f', '2015-10-12 00:54:18.059+06', '1');
INSERT INTO "public"."bploggers" VALUES ('281', '14', '37', null, '2', null, '87', 't', 'f', 'f', '2015-10-12 00:54:18.127+06', '2');
INSERT INTO "public"."bploggers" VALUES ('282', '14', null, '16', '1', null, '87', 't', 'f', 'f', '2015-10-12 00:54:18.226+06', '3');
INSERT INTO "public"."bploggers" VALUES ('283', '14', '36', null, '1', null, '87', 't', 'f', 'f', '2015-10-12 08:30:49.996+06', '1');
INSERT INTO "public"."bploggers" VALUES ('284', '14', '37', null, '2', null, '87', 't', 'f', 'f', '2015-10-12 08:30:50.042+06', '2');
INSERT INTO "public"."bploggers" VALUES ('285', '14', null, '16', '1', null, '87', 't', 'f', 'f', '2015-10-12 08:30:50.115+06', '3');
INSERT INTO "public"."bploggers" VALUES ('286', '14', '40', null, '3', null, '87', 't', 'f', 'f', '2015-10-12 08:30:50.312+06', '4');
INSERT INTO "public"."bploggers" VALUES ('287', '14', '36', null, '1', null, '87', 't', 'f', 'f', '2015-10-12 08:31:55.357+06', '1');
INSERT INTO "public"."bploggers" VALUES ('288', '14', '37', null, '2', null, '87', 't', 'f', 'f', '2015-10-12 08:31:55.373+06', '2');
INSERT INTO "public"."bploggers" VALUES ('289', '14', null, '16', '1', null, '87', 't', 'f', 'f', '2015-10-12 08:31:55.38+06', '3');
INSERT INTO "public"."bploggers" VALUES ('290', '14', '40', null, '3', null, '87', 't', 'f', 'f', '2015-10-12 08:31:55.585+06', '4');
INSERT INTO "public"."bploggers" VALUES ('291', '14', '35', null, '1', null, '88', 't', 'f', 'f', '2015-10-12 20:19:34.246+06', '1');
INSERT INTO "public"."bploggers" VALUES ('292', '14', '38', null, '2', null, '88', 't', 'f', 'f', '2015-10-12 20:19:34.258+06', '2');
INSERT INTO "public"."bploggers" VALUES ('293', '14', null, '15', '1', null, '88', 't', 'f', 'f', '2015-10-12 20:19:34.267+06', '3');
INSERT INTO "public"."bploggers" VALUES ('294', '14', '39', null, '3', null, '88', 't', 'f', 'f', '2015-10-12 20:19:34.534+06', '4');
INSERT INTO "public"."bploggers" VALUES ('295', '11', '25', null, '1', null, '83', 't', 'f', 'f', '2015-10-12 20:58:29.369+06', '1');
INSERT INTO "public"."bploggers" VALUES ('296', '11', null, '9', '1', null, '83', 't', 'f', 'f', '2015-10-12 20:58:29.445+06', '2');
INSERT INTO "public"."bploggers" VALUES ('297', '15', '59', null, '1', null, '95', 't', 'f', 'f', '2015-10-12 21:00:40.581+06', '1');
INSERT INTO "public"."bploggers" VALUES ('298', '15', '59', null, '1', null, '95', 't', 'f', 'f', '2015-10-12 21:02:16.828+06', '1');
INSERT INTO "public"."bploggers" VALUES ('299', '15', '60', null, '2', null, '95', 't', 'f', 'f', '2015-10-12 21:02:16.86+06', '2');
INSERT INTO "public"."bploggers" VALUES ('300', '15', null, '23', '1', null, '95', 't', 'f', 'f', '2015-10-12 21:02:16.867+06', '3');
INSERT INTO "public"."bploggers" VALUES ('301', '15', '59', null, '1', null, '95', 't', 'f', 'f', '2015-10-12 21:04:33.414+06', '1');
INSERT INTO "public"."bploggers" VALUES ('302', '15', '60', null, '2', null, '95', 't', 'f', 'f', '2015-10-12 21:04:33.417+06', '2');
INSERT INTO "public"."bploggers" VALUES ('303', '15', null, '23', '1', null, '95', 't', 'f', 'f', '2015-10-12 21:04:33.426+06', '3');
INSERT INTO "public"."bploggers" VALUES ('304', '15', '61', null, '3', null, '95', 't', 'f', 'f', '2015-10-12 21:04:33.434+06', '4');
INSERT INTO "public"."bploggers" VALUES ('305', '16', '64', null, '1', null, '96', 't', 'f', 'f', '2015-10-20 10:28:50.192+06', '1');
INSERT INTO "public"."bploggers" VALUES ('306', '16', '62', null, '2', null, '96', 't', 'f', 'f', '2015-10-20 10:28:50.282+06', '2');
INSERT INTO "public"."bploggers" VALUES ('307', '16', null, '25', '1', null, '96', 't', 'f', 'f', '2015-10-20 10:28:50.389+06', '3');
INSERT INTO "public"."bploggers" VALUES ('308', '16', '63', null, '3', null, '96', 't', 'f', 'f', '2015-10-20 10:28:50.748+06', '4');
INSERT INTO "public"."bploggers" VALUES ('309', '16', '67', null, '1', null, '97', 't', 'f', 'f', '2015-10-20 10:39:28.501+06', '1');
INSERT INTO "public"."bploggers" VALUES ('310', '16', '65', null, '2', null, '97', 't', 'f', 'f', '2015-10-20 10:39:28.54+06', '2');
INSERT INTO "public"."bploggers" VALUES ('311', '16', null, '26', '1', null, '97', 't', 'f', 'f', '2015-10-20 10:39:28.578+06', '3');
INSERT INTO "public"."bploggers" VALUES ('312', '16', '66', null, '3', null, '97', 't', 'f', 'f', '2015-10-20 10:39:28.729+06', '4');
INSERT INTO "public"."bploggers" VALUES ('313', '17', '68', null, '1', null, '98', 't', 'f', 'f', '2015-10-25 03:12:49.899+06', '1');
INSERT INTO "public"."bploggers" VALUES ('314', '14', '69', null, '1', null, '99', 't', 'f', 'f', '2015-10-30 08:54:08.648+06', '1');
INSERT INTO "public"."bploggers" VALUES ('315', '17', '72', null, '1', null, '100', 't', 'f', 'f', '2015-11-11 23:51:58.33+06', '1');

-- ----------------------------
-- Table structure for bprocesses
-- ----------------------------
DROP TABLE IF EXISTS "public"."bprocesses";
CREATE TABLE "public"."bprocesses" (
"id" int4 DEFAULT nextval('bprocesses_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"service_id" int4 NOT NULL,
"business_id" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"version" int8 DEFAULT 1 NOT NULL,
"state_machine_type" varchar COLLATE "default" DEFAULT 'base'::character varying NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of bprocesses
-- ----------------------------
INSERT INTO "public"."bprocesses" VALUES ('6', 'tewtw', '2', '15', null, null, '1', 'base');
INSERT INTO "public"."bprocesses" VALUES ('7', 'Tete', '3', '17', null, null, '1', 'base');
INSERT INTO "public"."bprocesses" VALUES ('8', 'tetwtew', '4', '20', null, null, '1', 'base');
INSERT INTO "public"."bprocesses" VALUES ('10', 'new state', '1', '2', null, null, '1', 'base');
INSERT INTO "public"."bprocesses" VALUES ('11', 'space', '1', '2', null, null, '1', 'base');
INSERT INTO "public"."bprocesses" VALUES ('14', 'test cn launch', '1', '2', null, null, '1', 'base');
INSERT INTO "public"."bprocesses" VALUES ('15', 'test cn launch 2', '1', '2', null, null, '1', 'base');
INSERT INTO "public"."bprocesses" VALUES ('16', 'cn ph', '1', '2', null, null, '1', 'base');
INSERT INTO "public"."bprocesses" VALUES ('17', 'Test Cost', '1', '2', null, null, '1', 'base');
INSERT INTO "public"."bprocesses" VALUES ('18', 'jkjk', '1', '2', null, null, '1', 'base');

-- ----------------------------
-- Table structure for bpsessions
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpsessions";
CREATE TABLE "public"."bpsessions" (
"id" int4 DEFAULT nextval('bpsessions_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"active_listed" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of bpsessions
-- ----------------------------
INSERT INTO "public"."bpsessions" VALUES ('81', '10', '2015-09-24 01:04:51.751+06', '2015-09-24 01:04:51.751+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('82', '10', '2015-09-24 01:08:19.422+06', '2015-09-24 01:08:19.422+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('83', '11', '2015-09-30 16:13:54.099+06', '2015-09-30 16:13:54.099+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('84', '14', '2015-10-10 23:32:57.482+06', '2015-10-10 23:32:57.482+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('85', '15', '2015-10-11 14:36:29.187+06', '2015-10-11 14:36:29.187+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('86', '15', '2015-10-11 14:39:04.589+06', '2015-10-11 14:39:04.589+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('87', '14', '2015-10-11 14:41:03.582+06', '2015-10-11 14:41:03.582+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('88', '14', '2015-10-11 14:41:03.504+06', '2015-10-11 14:41:03.504+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('89', '16', '2015-10-11 16:45:53.086+06', '2015-10-11 16:45:53.086+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('90', '16', '2015-10-11 16:53:54.517+06', '2015-10-11 16:53:54.517+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('91', '16', '2015-10-11 16:58:19.221+06', '2015-10-11 16:58:19.221+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('92', '16', '2015-10-11 17:01:02.153+06', '2015-10-11 17:01:02.153+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('93', '16', '2015-10-11 17:09:44.794+06', '2015-10-11 17:09:44.794+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('94', '16', '2015-10-11 22:20:22.016+06', '2015-10-11 22:20:22.016+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('95', '15', '2015-10-12 21:00:31.237+06', '2015-10-12 21:00:31.237+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('96', '16', '2015-10-20 10:28:37.445+06', '2015-10-20 10:28:37.445+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('97', '16', '2015-10-20 10:39:19.529+06', '2015-10-20 10:39:19.529+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('98', '17', '2015-10-25 03:12:39.728+06', '2015-10-25 03:12:39.728+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('99', '14', '2015-10-30 08:54:00.639+06', '2015-10-30 08:54:00.639+06', 't');
INSERT INTO "public"."bpsessions" VALUES ('100', '17', '2015-11-11 23:51:48.366+06', '2015-11-11 23:51:48.366+06', 't');

-- ----------------------------
-- Table structure for bpspaces
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpspaces";
CREATE TABLE "public"."bpspaces" (
"id" int4 DEFAULT nextval('bpspaces_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"index" int4 NOT NULL,
"container" bool DEFAULT false NOT NULL,
"subbrick" bool DEFAULT false NOT NULL,
"brick_front_id" int4,
"brick_nested_id" int4,
"nesting_level" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of bpspaces
-- ----------------------------
INSERT INTO "public"."bpspaces" VALUES ('11', '11', '1', 't', 'f', '43', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."bpspaces" VALUES ('12', '14', '1', 't', 'f', '45', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."bpspaces" VALUES ('13', '15', '1', 't', 'f', '48', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."bpspaces" VALUES ('14', '15', '1', 't', 'f', '49', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."bpspaces" VALUES ('15', '16', '1', 't', 'f', '51', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."bpspaces" VALUES ('16', '10', '1', 't', 'f', '53', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');

-- ----------------------------
-- Table structure for bpstates
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpstates";
CREATE TABLE "public"."bpstates" (
"id" int4 DEFAULT nextval('bpstates_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"neutral" varchar COLLATE "default" NOT NULL,
"is_process_state" bool DEFAULT false NOT NULL,
"on" bool DEFAULT false NOT NULL,
"on_rate" int4 DEFAULT 0 NOT NULL,
"front_elem_id" int4,
"space_elem_id" int4,
"space_id" int4,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"lang" varchar COLLATE "default" DEFAULT 'en'::character varying NOT NULL,
"middle" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"middleable" bool DEFAULT false NOT NULL,
"oposite" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"opositable" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of bpstates
-- ----------------------------
INSERT INTO "public"."bpstates" VALUES ('102', '6', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-08-29 13:45:30.465+06', '2015-08-29 13:45:30.465+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('103', '6', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-08-29 13:45:30.656+06', '2015-08-29 13:45:30.656+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('104', '6', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-08-29 13:45:30.656+06', '2015-08-29 13:45:30.656+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('105', '6', 'invoked', 'uninvoked', 'f', 'f', '0', '34', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('106', '7', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-08-31 23:08:21.116+06', '2015-08-31 23:08:21.116+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('107', '7', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-08-31 23:08:21.135+06', '2015-08-31 23:08:21.135+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('108', '7', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-08-31 23:08:21.135+06', '2015-08-31 23:08:21.135+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('109', '7', 'invoked', 'uninvoked', 'f', 'f', '0', '35', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('110', '7', 'confirmed', 'unconfirmed', 'f', 'f', '0', '35', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('111', '8', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-09-01 06:06:03.507+06', '2015-09-01 06:06:03.507+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('112', '8', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-09-01 06:06:03.529+06', '2015-09-01 06:06:03.529+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('113', '8', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-09-01 06:06:03.529+06', '2015-09-01 06:06:03.529+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('114', '8', 'invoked', 'uninvoked', 'f', 'f', '0', '36', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('115', '8', 'confirmed', 'unconfirmed', 'f', 'f', '0', '36', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('118', '8', 'invoked', 'uninvoked', 'f', 'f', '0', '38', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('119', '8', 'confirmed', 'unconfirmed', 'f', 'f', '0', '38', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('128', '10', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-09-08 08:11:55.67+06', '2015-09-08 08:11:55.67+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('129', '10', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-09-08 08:11:55.67+06', '2015-09-08 08:11:55.67+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('130', '10', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-09-08 08:11:55.67+06', '2015-09-08 08:11:55.67+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('131', '10', 'invoked', 'uninvoked', 'f', 'f', '0', '42', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('132', '10', 'confirmed', 'unconfirmed', 'f', 'f', '0', '42', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('133', '11', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-09-22 18:47:48.618+06', '2015-09-22 18:47:48.618+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('134', '11', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-09-22 18:47:48.618+06', '2015-09-22 18:47:48.618+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('135', '11', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-09-22 18:47:48.618+06', '2015-09-22 18:47:48.618+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('136', '11', 'invoked', 'uninvoked', 'f', 'f', '0', '43', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('137', '11', 'lap', 'unlap', 'f', 'f', '0', null, null, '11', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('138', '11', 'invoked', 'uninvoked', 'f', 'f', '0', null, '15', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('139', '11', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '15', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('146', '14', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.302+06', '2015-10-10 22:47:01.302+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('147', '14', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('148', '14', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('149', '14', 'invoked', 'uninvoked', 'f', 'f', '0', '44', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('150', '14', 'confirmed', 'unconfirmed', 'f', 'f', '0', '44', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('151', '14', 'invoked', 'uninvoked', 'f', 'f', '0', '45', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('152', '14', 'lap', 'unlap', 'f', 'f', '0', null, null, '12', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('153', '14', 'invoked', 'uninvoked', 'f', 'f', '0', null, '16', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('154', '14', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '16', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('155', '14', 'invoked', 'uninvoked', 'f', 'f', '0', '46', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('156', '14', 'confirmed', 'unconfirmed', 'f', 'f', '0', '46', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('157', '15', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('158', '15', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('159', '15', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('160', '15', 'invoked', 'uninvoked', 'f', 'f', '0', '47', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('161', '15', 'confirmed', 'unconfirmed', 'f', 'f', '0', '47', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('162', '15', 'invoked', 'uninvoked', 'f', 'f', '0', '48', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('163', '15', 'lap', 'unlap', 'f', 'f', '0', null, null, '13', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('164', '15', 'invoked', 'uninvoked', 'f', 'f', '0', null, '17', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('165', '15', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '17', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('166', '15', 'invoked', 'uninvoked', 'f', 'f', '0', '49', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('167', '15', 'lap', 'unlap', 'f', 'f', '0', null, null, '14', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('168', '15', 'invoked', 'uninvoked', 'f', 'f', '0', null, '18', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('169', '16', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('170', '16', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('171', '16', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('172', '16', 'invoked', 'uninvoked', 'f', 'f', '0', '50', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('173', '16', 'invoked', 'uninvoked', 'f', 'f', '0', '51', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('174', '16', 'lap', 'unlap', 'f', 'f', '0', null, null, '15', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('175', '16', 'invoked', 'uninvoked', 'f', 'f', '0', null, '19', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('177', '10', 'invoked', 'uninvoked', 'f', 'f', '0', '53', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('178', '10', 'lap', 'unlap', 'f', 'f', '0', null, null, '16', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('179', '10', 'invoked', 'uninvoked', 'f', 'f', '0', null, '20', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('180', '10', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '20', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('181', '10', 'invoked', 'uninvoked', 'f', 'f', '0', null, '21', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('182', '10', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '21', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('184', '16', 'invoked', 'uninvoked', 'f', 'f', '0', '55', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('185', '16', 'invoked', 'uninvoked', 'f', 'f', '0', '56', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('186', '16', 'invoked', 'uninvoked', 'f', 'f', '0', '57', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('187', '16', 'invoked', 'uninvoked', 'f', 'f', '0', '58', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('188', '17', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-24 14:48:43.171+06', '2015-10-24 14:48:43.171+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('189', '17', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-24 14:48:43.187+06', '2015-10-24 14:48:43.187+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('190', '17', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-24 14:48:43.187+06', '2015-10-24 14:48:43.187+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('191', '17', 'invoked', 'uninvoked', 'f', 'f', '0', '59', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('192', '17', 'confirmed', 'unconfirmed', 'f', 'f', '0', '59', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('193', '10', 'invoked', 'uninvoked', 'f', 'f', '0', '60', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('194', '18', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-11-17 16:22:30.778+06', '2015-11-17 16:22:30.778+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('195', '18', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-11-17 16:22:30.778+06', '2015-11-17 16:22:30.778+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."bpstates" VALUES ('196', '18', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-11-17 16:22:30.778+06', '2015-11-17 16:22:30.778+06', 'en', 'finishing', 't', '', 'f');

-- ----------------------------
-- Table structure for bpstation_loggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpstation_loggers";
CREATE TABLE "public"."bpstation_loggers" (
"id" int4 DEFAULT nextval('bpstation_loggers_id_seq'::regclass) NOT NULL,
"station_id" int4 NOT NULL,
"process_id" int4 NOT NULL,
"sygnal" varchar COLLATE "default" NOT NULL,
"date" timestamptz(6) NOT NULL,
"state" bool NOT NULL,
"step" int4 NOT NULL,
"space" int4 NOT NULL,
"container_step" int4[] NOT NULL,
"expand_step" int4[] NOT NULL,
"spaces_ids" int4[] NOT NULL,
"started" bool NOT NULL,
"finished" bool NOT NULL,
"inspace" bool NOT NULL,
"incontainer" bool NOT NULL,
"inexpands" bool NOT NULL,
"paused" bool NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of bpstation_loggers
-- ----------------------------
INSERT INTO "public"."bpstation_loggers" VALUES ('1', '1', '1', 'start', '2015-06-20 02:51:58.453+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('2', '1', '1', 'moving', '2015-06-20 02:51:58.461+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('3', '1', '1', 'prepareinvoking', '2015-06-20 02:51:59.728+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('4', '1', '1', 'invoked', '2015-06-20 02:52:00.062+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('5', '1', '1', 'moving', '2015-06-20 02:52:00.063+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('6', '1', '1', 'paused', '2015-06-20 02:52:00.063+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('7', '2', '2', 'start', '2015-06-21 12:55:26.687+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('8', '2', '2', 'moving', '2015-06-21 12:55:26.694+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('9', '2', '2', 'prepareinvoking', '2015-06-21 12:55:27.867+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('10', '2', '2', 'invoked', '2015-06-21 12:55:28.082+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('11', '2', '2', 'moving', '2015-06-21 12:55:28.082+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('12', '2', '2', 'paused', '2015-06-21 12:55:28.083+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('13', '2', '2', 'start', '2015-06-21 13:33:16.636+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('14', '2', '2', 'moving', '2015-06-21 13:33:16.637+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('15', '2', '2', 'prepareinvoking', '2015-06-21 13:33:16.641+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('16', '2', '2', 'invoked', '2015-06-21 13:33:16.687+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('17', '2', '2', 'moving', '2015-06-21 13:33:16.687+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('18', '2', '2', 'end', '2015-06-21 13:33:16.687+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('19', '3', '2', 'start', '2015-07-29 04:18:33.059+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('20', '3', '2', 'moving', '2015-07-29 04:18:33.068+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('21', '3', '2', 'prepareinvoking', '2015-07-29 04:18:33.249+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('22', '3', '2', 'invoked', '2015-07-29 04:18:33.324+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('23', '3', '2', 'moving', '2015-07-29 04:18:33.324+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('24', '3', '2', 'paused', '2015-07-29 04:18:33.324+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('25', '4', '2', 'start', '2015-07-29 04:18:54.089+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('26', '4', '2', 'moving', '2015-07-29 04:18:54.089+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('27', '4', '2', 'prepareinvoking', '2015-07-29 04:18:54.089+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('28', '4', '2', 'invoked', '2015-07-29 04:18:54.089+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('29', '4', '2', 'moving', '2015-07-29 04:18:54.089+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('30', '4', '2', 'paused', '2015-07-29 04:18:54.09+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('31', '5', '3', 'start', '2015-07-29 04:19:48.988+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('32', '5', '3', 'moving', '2015-07-29 04:19:48.988+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('33', '5', '3', 'prepareinvoking', '2015-07-29 04:19:48.988+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('34', '5', '3', 'invoked', '2015-07-29 04:19:48.989+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('35', '5', '3', 'moving', '2015-07-29 04:19:48.989+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('36', '5', '3', 'paused', '2015-07-29 04:19:48.99+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('37', '6', '3', 'start', '2015-07-29 04:20:22.016+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('38', '6', '3', 'moving', '2015-07-29 04:20:22.016+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('39', '6', '3', 'prepareinvoking', '2015-07-29 04:20:22.017+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('40', '6', '3', 'invoked', '2015-07-29 04:20:22.017+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('41', '6', '3', 'moving', '2015-07-29 04:20:22.017+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('42', '6', '3', 'paused', '2015-07-29 04:20:22.017+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('43', '7', '3', 'start', '2015-07-29 04:20:30.5+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('44', '7', '3', 'moving', '2015-07-29 04:20:30.5+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('45', '7', '3', 'prepareinvoking', '2015-07-29 04:20:30.5+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('46', '7', '3', 'invoked', '2015-07-29 04:20:30.501+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('47', '7', '3', 'moving', '2015-07-29 04:20:30.501+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('48', '7', '3', 'paused', '2015-07-29 04:20:30.501+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('49', '8', '3', 'start', '2015-07-29 04:59:19.659+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('50', '8', '3', 'moving', '2015-07-29 04:59:19.67+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('51', '8', '3', 'prepareinvoking', '2015-07-29 04:59:19.886+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('52', '8', '3', 'invoked', '2015-07-29 04:59:19.939+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('53', '8', '3', 'moving', '2015-07-29 04:59:19.939+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('54', '8', '3', 'paused', '2015-07-29 04:59:19.939+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('55', '8', '3', 'start', '2015-08-01 08:10:22.285+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('56', '8', '3', 'moving', '2015-08-01 08:10:22.301+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('57', '8', '3', 'prepareinvoking', '2015-08-01 08:10:24.362+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('58', '8', '3', 'invoked', '2015-08-01 08:10:24.416+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('59', '8', '3', 'moving', '2015-08-01 08:10:24.417+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('60', '8', '3', 'prepareinvoking', '2015-08-01 08:10:24.417+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('61', '8', '3', 'invoked', '2015-08-01 08:10:24.417+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('62', '8', '3', 'moving', '2015-08-01 08:10:24.417+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('63', '8', '3', 'paused', '2015-08-01 08:10:24.417+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('64', '9', '3', 'start', '2015-08-13 23:05:03.478+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('65', '9', '3', 'moving', '2015-08-13 23:05:03.513+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('66', '9', '3', 'prepareinvoking', '2015-08-13 23:05:09.115+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('67', '9', '3', 'invoked', '2015-08-13 23:05:09.169+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('68', '9', '3', 'moving', '2015-08-13 23:05:09.169+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('69', '9', '3', 'paused', '2015-08-13 23:05:09.169+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('70', '10', '3', 'start', '2015-08-23 02:49:32.837+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('71', '10', '3', 'moving', '2015-08-23 02:49:32.861+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('72', '10', '3', 'prepareinvoking', '2015-08-23 02:49:33.434+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('73', '10', '3', 'invoked', '2015-08-23 02:49:33.512+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('74', '10', '3', 'moving', '2015-08-23 02:49:33.512+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('75', '10', '3', 'paused', '2015-08-23 02:49:33.514+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('76', '11', '3', 'start', '2015-08-23 12:35:50.818+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('77', '11', '3', 'moving', '2015-08-23 12:35:50.83+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('78', '11', '3', 'prepareinvoking', '2015-08-23 12:35:51.23+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('79', '11', '3', 'invoked', '2015-08-23 12:35:51.267+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('80', '11', '3', 'moving', '2015-08-23 12:35:51.267+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('81', '11', '3', 'paused', '2015-08-23 12:35:51.268+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('82', '11', '3', 'start', '2015-08-23 12:36:37.891+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('83', '11', '3', 'moving', '2015-08-23 12:36:37.891+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('84', '11', '3', 'prepareinvoking', '2015-08-23 12:36:37.894+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('85', '11', '3', 'invoked', '2015-08-23 12:36:37.894+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('86', '11', '3', 'moving', '2015-08-23 12:36:37.894+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('87', '11', '3', 'end', '2015-08-23 12:36:37.895+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('88', '12', '3', 'start', '2015-08-23 12:39:19.901+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('89', '12', '3', 'moving', '2015-08-23 12:39:19.901+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('90', '12', '3', 'prepareinvoking', '2015-08-23 12:39:19.902+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('91', '12', '3', 'invoked', '2015-08-23 12:39:19.902+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('92', '12', '3', 'moving', '2015-08-23 12:39:19.902+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('93', '12', '3', 'paused', '2015-08-23 12:39:19.902+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('94', '12', '3', 'start', '2015-08-23 12:39:34.221+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('95', '12', '3', 'moving', '2015-08-23 12:39:34.221+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('96', '12', '3', 'prepareinvoking', '2015-08-23 12:39:34.222+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('97', '12', '3', 'invoked', '2015-08-23 12:39:34.222+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('98', '12', '3', 'moving', '2015-08-23 12:39:34.222+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('99', '12', '3', 'end', '2015-08-23 12:39:34.222+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('100', '13', '3', 'start', '2015-08-23 12:44:59.492+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('101', '13', '3', 'moving', '2015-08-23 12:44:59.492+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('102', '13', '3', 'prepareinvoking', '2015-08-23 12:44:59.493+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('103', '13', '3', 'invoked', '2015-08-23 12:44:59.494+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('104', '13', '3', 'moving', '2015-08-23 12:44:59.494+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('105', '13', '3', 'paused', '2015-08-23 12:44:59.494+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('106', '14', '5', 'start', '2015-08-26 12:48:36.597+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('107', '14', '5', 'moving', '2015-08-26 12:48:36.617+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('108', '14', '5', 'prepareinvoking', '2015-08-26 12:48:36.906+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('109', '14', '5', 'invoked', '2015-08-26 12:48:36.985+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('110', '14', '5', 'moving', '2015-08-26 12:48:36.985+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('111', '14', '5', 'paused', '2015-08-26 12:48:36.986+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('112', '15', '5', 'start', '2015-08-26 13:03:07.6+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('113', '15', '5', 'moving', '2015-08-26 13:03:07.6+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('114', '15', '5', 'prepareinvoking', '2015-08-26 13:03:07.602+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('115', '15', '5', 'invoked', '2015-08-26 13:03:07.603+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('116', '15', '5', 'moving', '2015-08-26 13:03:07.603+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('117', '15', '5', 'paused', '2015-08-26 13:03:07.603+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('118', '15', '5', 'start', '2015-08-26 15:14:18.32+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('119', '15', '5', 'moving', '2015-08-26 15:14:18.333+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('120', '15', '5', 'prepareinvoking', '2015-08-26 15:14:18.439+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('121', '15', '5', 'invoked', '2015-08-26 15:14:18.495+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('122', '15', '5', 'moving', '2015-08-26 15:14:18.495+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('123', '15', '5', 'prepareinvoking', '2015-08-26 15:14:18.496+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('124', '15', '5', 'invoked', '2015-08-26 15:14:18.497+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('125', '15', '5', 'moving', '2015-08-26 15:14:18.497+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('126', '15', '5', 'paused', '2015-08-26 15:14:18.503+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('127', '15', '5', 'start', '2015-08-26 15:14:54.771+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('128', '15', '5', 'moving', '2015-08-26 15:14:54.771+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('129', '15', '5', 'prepareinvoking', '2015-08-26 15:14:54.771+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('130', '15', '5', 'invoked', '2015-08-26 15:14:54.774+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('131', '15', '5', 'moving', '2015-08-26 15:14:54.774+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('132', '15', '5', 'prepareinvoking', '2015-08-26 15:14:54.775+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('133', '15', '5', 'invoked', '2015-08-26 15:14:54.777+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('134', '15', '5', 'moving', '2015-08-26 15:14:54.777+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('135', '15', '5', 'prepareinvoking', '2015-08-26 15:14:54.78+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('136', '15', '5', 'preparemovetospace', '2015-08-26 15:14:54.793+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('137', '15', '5', 'movetospace', '2015-08-26 15:14:54.793+06', 't', '2', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('138', '15', '5', 'preparemovetocontainer', '2015-08-26 15:14:54.793+06', 't', '2', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('139', '15', '5', 'movetocontainer', '2015-08-26 15:14:54.793+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('140', '15', '5', 'invoked', '2015-08-26 15:14:54.795+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('141', '15', '5', 'moving', '2015-08-26 15:14:54.796+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('142', '15', '5', 'prepareinvokinginspace', '2015-08-26 15:14:54.814+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('143', '15', '5', 'prepareinvoking', '2015-08-26 15:14:54.815+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('144', '15', '5', 'invoked', '2015-08-26 15:14:54.818+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('145', '15', '5', 'invokinginspace', '2015-08-26 15:14:54.818+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('146', '15', '5', 'prepareinvokinginspace', '2015-08-26 15:14:54.818+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('147', '15', '5', 'prepareinvoking', '2015-08-26 15:14:54.818+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('148', '15', '5', 'invoked', '2015-08-26 15:14:54.82+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('149', '15', '5', 'invokinginspace', '2015-08-26 15:14:54.82+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('150', '15', '5', 'prepareinvoking', '2015-08-26 15:14:54.833+06', 't', '2', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('151', '15', '5', 'moving', '2015-08-26 15:14:54.887+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('152', '15', '5', 'paused', '2015-08-26 15:14:54.887+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('153', '15', '5', 'moving', '2015-08-26 15:14:54.887+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('154', '15', '5', 'paused', '2015-08-26 15:14:54.887+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('155', '16', '5', 'start', '2015-08-26 15:16:24.121+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('156', '16', '5', 'moving', '2015-08-26 15:16:24.123+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('157', '16', '5', 'prepareinvoking', '2015-08-26 15:16:24.123+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('158', '16', '5', 'invoked', '2015-08-26 15:16:24.135+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('159', '16', '5', 'moving', '2015-08-26 15:16:24.135+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('160', '16', '5', 'paused', '2015-08-26 15:16:24.136+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('161', '16', '5', 'start', '2015-08-26 15:17:08.838+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('162', '16', '5', 'moving', '2015-08-26 15:17:08.838+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('163', '16', '5', 'prepareinvoking', '2015-08-26 15:17:08.838+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('164', '16', '5', 'invoked', '2015-08-26 15:17:08.838+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('165', '16', '5', 'moving', '2015-08-26 15:17:08.839+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('166', '16', '5', 'prepareinvoking', '2015-08-26 15:17:08.839+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('167', '16', '5', 'invoked', '2015-08-26 15:17:08.839+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('168', '16', '5', 'moving', '2015-08-26 15:17:08.839+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('169', '16', '5', 'paused', '2015-08-26 15:17:08.839+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('170', '15', '5', 'start', '2015-08-26 15:18:17.026+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('171', '15', '5', 'moving', '2015-08-26 15:18:17.026+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('172', '15', '5', 'prepareinvoking', '2015-08-26 15:18:17.027+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('173', '15', '5', 'invoked', '2015-08-26 15:18:17.027+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('174', '15', '5', 'moving', '2015-08-26 15:18:17.027+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('175', '15', '5', 'prepareinvoking', '2015-08-26 15:18:17.027+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('176', '15', '5', 'invoked', '2015-08-26 15:18:17.027+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('177', '15', '5', 'moving', '2015-08-26 15:18:17.027+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('178', '15', '5', 'prepareinvoking', '2015-08-26 15:18:17.027+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('179', '15', '5', 'preparemovetospace', '2015-08-26 15:18:17.028+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('180', '15', '5', 'movetospace', '2015-08-26 15:18:17.028+06', 't', '2', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('181', '15', '5', 'preparemovetocontainer', '2015-08-26 15:18:17.028+06', 't', '2', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('182', '15', '5', 'movetocontainer', '2015-08-26 15:18:17.028+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('183', '15', '5', 'invoked', '2015-08-26 15:18:17.028+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('184', '15', '5', 'moving', '2015-08-26 15:18:17.028+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('185', '15', '5', 'prepareinvokinginspace', '2015-08-26 15:18:17.028+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('186', '15', '5', 'prepareinvoking', '2015-08-26 15:18:17.028+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('187', '15', '5', 'invoked', '2015-08-26 15:18:17.029+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('188', '15', '5', 'invokinginspace', '2015-08-26 15:18:17.029+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('189', '15', '5', 'prepareinvokinginspace', '2015-08-26 15:18:17.029+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('190', '15', '5', 'prepareinvoking', '2015-08-26 15:18:17.029+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('191', '15', '5', 'invoked', '2015-08-26 15:18:17.029+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('192', '15', '5', 'invokinginspace', '2015-08-26 15:18:17.029+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('193', '15', '5', 'prepareinvoking', '2015-08-26 15:18:17.029+06', 't', '2', '1', '{4}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('194', '15', '5', 'moving', '2015-08-26 15:18:17.029+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('195', '15', '5', 'paused', '2015-08-26 15:18:17.03+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('196', '15', '5', 'moving', '2015-08-26 15:18:17.03+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('197', '15', '5', 'paused', '2015-08-26 15:18:17.03+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('198', '15', '5', 'start', '2015-08-26 15:19:05.066+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('199', '15', '5', 'moving', '2015-08-26 15:19:05.067+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('200', '15', '5', 'prepareinvoking', '2015-08-26 15:19:05.091+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('201', '15', '5', 'invoked', '2015-08-26 15:19:05.096+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('202', '15', '5', 'moving', '2015-08-26 15:19:05.096+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('203', '15', '5', 'prepareinvoking', '2015-08-26 15:19:05.096+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('204', '15', '5', 'invoked', '2015-08-26 15:19:05.097+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('205', '15', '5', 'moving', '2015-08-26 15:19:05.097+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('206', '15', '5', 'prepareinvoking', '2015-08-26 15:19:05.1+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('207', '15', '5', 'preparemovetospace', '2015-08-26 15:19:05.102+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('208', '15', '5', 'movetospace', '2015-08-26 15:19:05.102+06', 't', '2', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('209', '15', '5', 'preparemovetocontainer', '2015-08-26 15:19:05.102+06', 't', '2', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('210', '15', '5', 'movetocontainer', '2015-08-26 15:19:05.102+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('211', '15', '5', 'invoked', '2015-08-26 15:19:05.102+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('212', '15', '5', 'moving', '2015-08-26 15:19:05.103+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('213', '15', '5', 'prepareinvokinginspace', '2015-08-26 15:19:05.107+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('214', '15', '5', 'prepareinvoking', '2015-08-26 15:19:05.108+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('215', '15', '5', 'invoked', '2015-08-26 15:19:05.108+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('216', '15', '5', 'invokinginspace', '2015-08-26 15:19:05.109+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('217', '15', '5', 'prepareinvokinginspace', '2015-08-26 15:19:05.111+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('218', '15', '5', 'prepareinvoking', '2015-08-26 15:19:05.111+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('219', '15', '5', 'invoked', '2015-08-26 15:19:05.119+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('220', '15', '5', 'invokinginspace', '2015-08-26 15:19:05.119+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('221', '15', '5', 'prepareinvoking', '2015-08-26 15:19:05.119+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('222', '15', '5', 'moving', '2015-08-26 15:19:05.125+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('223', '15', '5', 'prepareinvoking', '2015-08-26 15:19:05.126+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('224', '15', '5', 'invoked', '2015-08-26 15:19:05.126+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('225', '15', '5', 'moving', '2015-08-26 15:19:05.126+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('226', '15', '5', 'paused', '2015-08-26 15:19:05.126+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('227', '15', '5', 'moving', '2015-08-26 15:19:05.126+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('228', '15', '5', 'paused', '2015-08-26 15:19:05.126+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('229', '15', '5', 'start', '2015-08-26 15:19:32.444+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('230', '15', '5', 'moving', '2015-08-26 15:19:32.444+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('231', '15', '5', 'prepareinvoking', '2015-08-26 15:19:32.444+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('232', '15', '5', 'invoked', '2015-08-26 15:19:32.445+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('233', '15', '5', 'moving', '2015-08-26 15:19:32.445+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('234', '15', '5', 'prepareinvoking', '2015-08-26 15:19:32.445+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('235', '15', '5', 'invoked', '2015-08-26 15:19:32.445+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('236', '15', '5', 'moving', '2015-08-26 15:19:32.445+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('237', '15', '5', 'prepareinvoking', '2015-08-26 15:19:32.445+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('238', '15', '5', 'preparemovetospace', '2015-08-26 15:19:32.445+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('239', '15', '5', 'movetospace', '2015-08-26 15:19:32.445+06', 't', '2', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('240', '15', '5', 'preparemovetocontainer', '2015-08-26 15:19:32.445+06', 't', '2', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('241', '15', '5', 'movetocontainer', '2015-08-26 15:19:32.445+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('242', '15', '5', 'invoked', '2015-08-26 15:19:32.445+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('243', '15', '5', 'moving', '2015-08-26 15:19:32.445+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('244', '15', '5', 'prepareinvokinginspace', '2015-08-26 15:19:32.446+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('245', '15', '5', 'prepareinvoking', '2015-08-26 15:19:32.446+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('246', '15', '5', 'invoked', '2015-08-26 15:19:32.446+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('247', '15', '5', 'invokinginspace', '2015-08-26 15:19:32.446+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('248', '15', '5', 'prepareinvokinginspace', '2015-08-26 15:19:32.446+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('249', '15', '5', 'prepareinvoking', '2015-08-26 15:19:32.446+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('250', '15', '5', 'invoked', '2015-08-26 15:19:32.446+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('251', '15', '5', 'invokinginspace', '2015-08-26 15:19:32.446+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('252', '15', '5', 'prepareinvoking', '2015-08-26 15:19:32.446+06', 't', '2', '1', '{5}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('253', '15', '5', 'moving', '2015-08-26 15:19:32.447+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('254', '15', '5', 'prepareinvoking', '2015-08-26 15:19:32.447+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('255', '15', '5', 'invoked', '2015-08-26 15:19:32.447+06', 't', '4', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('256', '15', '5', 'moving', '2015-08-26 15:19:32.447+06', 't', '4', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('257', '15', '5', 'end', '2015-08-26 15:19:32.447+06', 't', '4', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('258', '15', '5', 'moving', '2015-08-26 15:19:32.447+06', 't', '4', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('259', '15', '5', 'end', '2015-08-26 15:19:32.447+06', 't', '4', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('260', '17', '4', 'start', '2015-08-26 15:45:02.705+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('261', '17', '4', 'moving', '2015-08-26 15:45:02.706+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('262', '17', '4', 'prepareinvoking', '2015-08-26 15:45:02.706+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('263', '17', '4', 'invoked', '2015-08-26 15:45:02.751+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('264', '17', '4', 'moving', '2015-08-26 15:45:02.751+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('265', '17', '4', 'prepareinvoking', '2015-08-26 15:45:02.752+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('266', '17', '4', 'invoked', '2015-08-26 15:45:02.752+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('267', '17', '4', 'moving', '2015-08-26 15:45:02.752+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('268', '17', '4', 'prepareinvoking', '2015-08-26 15:45:02.752+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('269', '17', '4', 'invoked', '2015-08-26 15:45:02.752+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('270', '17', '4', 'moving', '2015-08-26 15:45:02.752+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('271', '17', '4', 'paused', '2015-08-26 15:45:02.752+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('272', '17', '4', 'start', '2015-08-26 15:45:31.642+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('273', '17', '4', 'moving', '2015-08-26 15:45:31.642+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('274', '17', '4', 'prepareinvoking', '2015-08-26 15:45:31.642+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('275', '17', '4', 'invoked', '2015-08-26 15:45:31.643+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('276', '17', '4', 'moving', '2015-08-26 15:45:31.643+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('277', '17', '4', 'prepareinvoking', '2015-08-26 15:45:31.643+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('278', '17', '4', 'invoked', '2015-08-26 15:45:31.643+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('279', '17', '4', 'moving', '2015-08-26 15:45:31.643+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('280', '17', '4', 'prepareinvoking', '2015-08-26 15:45:31.643+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('281', '17', '4', 'invoked', '2015-08-26 15:45:31.644+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('282', '17', '4', 'moving', '2015-08-26 15:45:31.644+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('283', '17', '4', 'end', '2015-08-26 15:45:31.644+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('284', '21', '4', 'start', '2015-08-26 16:32:06.856+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('285', '21', '4', 'moving', '2015-08-26 16:32:06.865+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('286', '21', '4', 'prepareinvoking', '2015-08-26 16:32:06.959+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('287', '21', '4', 'preparemovetospace', '2015-08-26 16:32:07.028+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('288', '21', '4', 'movetospace', '2015-08-26 16:32:07.028+06', 't', '0', '1', '{}', '{}', '{10}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('289', '21', '4', 'preparemovetocontainer', '2015-08-26 16:32:07.028+06', 't', '0', '1', '{}', '{}', '{10}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('290', '21', '4', 'movetocontainer', '2015-08-26 16:32:07.03+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('291', '21', '4', 'invoked', '2015-08-26 16:32:07.031+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('292', '21', '4', 'moving', '2015-08-26 16:32:07.031+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('293', '21', '4', 'prepareinvokinginspace', '2015-08-26 16:32:07.158+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('294', '21', '4', 'prepareinvoking', '2015-08-26 16:32:07.158+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('295', '21', '4', 'invoked', '2015-08-26 16:32:07.159+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('296', '21', '4', 'invokinginspace', '2015-08-26 16:32:07.159+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('297', '21', '4', 'prepareinvoking', '2015-08-26 16:32:07.168+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('298', '21', '4', 'moving', '2015-08-26 16:32:07.344+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('299', '21', '4', 'end', '2015-08-26 16:32:07.345+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('300', '21', '4', 'moving', '2015-08-26 16:32:07.345+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('301', '21', '4', 'end', '2015-08-26 16:32:07.345+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('302', '22', '7', 'start', '2015-08-31 23:15:42.339+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('303', '22', '7', 'moving', '2015-08-31 23:15:42.355+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('304', '22', '7', 'prepareinvoking', '2015-08-31 23:15:42.59+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('305', '22', '7', 'invoked', '2015-08-31 23:15:42.63+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('306', '22', '7', 'moving', '2015-08-31 23:15:42.632+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('307', '22', '7', 'paused', '2015-08-31 23:15:42.643+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('308', '22', '7', 'start', '2015-08-31 23:40:25.683+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('309', '22', '7', 'moving', '2015-08-31 23:40:25.718+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('310', '22', '7', 'prepareinvoking', '2015-08-31 23:40:25.928+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('311', '22', '7', 'invoked', '2015-08-31 23:40:26.044+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('312', '22', '7', 'moving', '2015-08-31 23:40:26.046+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('313', '22', '7', 'end', '2015-08-31 23:40:26.047+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('314', '34', '10', 'start', '2015-09-08 17:05:05.997+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('315', '34', '10', 'moving', '2015-09-08 17:05:05.997+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('316', '34', '10', 'prepareinvoking', '2015-09-08 17:05:05.999+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('317', '34', '10', 'invoked', '2015-09-08 17:05:06+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('318', '34', '10', 'moving', '2015-09-08 17:05:06+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('319', '34', '10', 'paused', '2015-09-08 17:05:06.001+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('320', '35', '10', 'start', '2015-09-08 17:11:31.548+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('321', '35', '10', 'moving', '2015-09-08 17:11:31.549+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('322', '35', '10', 'prepareinvoking', '2015-09-08 17:11:31.551+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('323', '35', '10', 'invoked', '2015-09-08 17:11:31.552+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('324', '35', '10', 'moving', '2015-09-08 17:11:31.559+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('325', '35', '10', 'paused', '2015-09-08 17:11:31.56+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('326', '42', '10', 'start', '2015-09-09 09:42:02.225+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('327', '42', '10', 'moving', '2015-09-09 09:42:02.272+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('328', '42', '10', 'prepareinvoking', '2015-09-09 09:42:12.129+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('329', '42', '10', 'invoked', '2015-09-09 09:42:12.224+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('330', '42', '10', 'moving', '2015-09-09 09:42:12.226+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('331', '42', '10', 'paused', '2015-09-09 09:42:25.205+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('332', '43', '10', 'start', '2015-09-10 06:41:13.684+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('333', '43', '10', 'moving', '2015-09-10 06:41:13.697+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('334', '43', '10', 'prepareinvoking', '2015-09-10 06:43:32.88+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('335', '43', '10', 'invoked', '2015-09-10 06:43:32.944+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('336', '43', '10', 'moving', '2015-09-10 06:43:32.947+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('337', '43', '10', 'paused', '2015-09-10 06:43:34.488+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('338', '44', '10', 'start', '2015-09-11 05:33:20.17+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('339', '44', '10', 'moving', '2015-09-11 05:33:20.182+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('340', '44', '10', 'prepareinvoking', '2015-09-11 05:33:20.423+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('341', '44', '10', 'invoked', '2015-09-11 05:33:20.52+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('342', '44', '10', 'moving', '2015-09-11 05:33:20.521+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('343', '44', '10', 'paused', '2015-09-11 05:33:20.522+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('344', '55', '10', 'start', '2015-09-11 12:18:42.911+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('345', '55', '10', 'moving', '2015-09-11 12:18:42.965+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('346', '55', '10', 'prepareinvoking', '2015-09-11 12:18:43.194+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('347', '55', '10', 'invoked', '2015-09-11 12:18:43.394+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('348', '55', '10', 'moving', '2015-09-11 12:18:43.398+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('349', '55', '10', 'paused', '2015-09-11 12:18:43.399+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('350', '56', '10', 'start', '2015-09-13 12:58:45.755+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('351', '56', '10', 'moving', '2015-09-13 12:58:45.796+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('352', '56', '10', 'prepareinvoking', '2015-09-13 12:58:46.078+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('353', '56', '10', 'invoked', '2015-09-13 12:58:46.304+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('354', '56', '10', 'moving', '2015-09-13 12:58:46.313+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('355', '56', '10', 'paused', '2015-09-13 12:58:46.314+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('356', '58', '10', 'start', '2015-09-13 13:54:33.345+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('357', '58', '10', 'moving', '2015-09-13 13:54:33.365+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('358', '58', '10', 'prepareinvoking', '2015-09-13 13:54:33.605+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('359', '58', '10', 'invoked', '2015-09-13 13:54:33.687+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('360', '58', '10', 'moving', '2015-09-13 13:54:33.69+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('361', '58', '10', 'paused', '2015-09-13 13:54:33.69+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('362', '60', '10', 'start', '2015-09-17 02:46:58.864+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('363', '60', '10', 'moving', '2015-09-17 02:46:58.885+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('364', '60', '10', 'prepareinvoking', '2015-09-17 02:46:59.03+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('365', '60', '10', 'invoked', '2015-09-17 02:46:59.132+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('366', '60', '10', 'moving', '2015-09-17 02:46:59.138+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('367', '60', '10', 'prepareinvoking', '2015-09-17 02:46:59.246+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('368', '60', '10', 'invoked', '2015-09-17 02:46:59.247+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('369', '60', '10', 'moving', '2015-09-17 02:46:59.248+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('370', '60', '10', 'prepareinvoking', '2015-09-17 02:46:59.251+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('371', '60', '10', 'invoked', '2015-09-17 02:46:59.251+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('372', '60', '10', 'moving', '2015-09-17 02:46:59.437+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('373', '60', '10', 'prepareinvoking', '2015-09-17 02:46:59.447+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('374', '60', '10', 'invoked', '2015-09-17 02:46:59.469+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('375', '60', '10', 'moving', '2015-09-17 02:46:59.499+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('376', '60', '10', 'end', '2015-09-17 02:46:59.502+06', 't', '0', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('377', '61', '10', 'start', '2015-09-17 03:02:34.817+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('378', '61', '10', 'moving', '2015-09-17 03:02:34.833+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('379', '61', '10', 'prepareinvoking', '2015-09-17 03:02:35.048+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('380', '61', '10', 'invoked', '2015-09-17 03:02:35.128+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('381', '61', '10', 'moving', '2015-09-17 03:02:35.134+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('382', '61', '10', 'prepareinvoking', '2015-09-17 03:02:35.145+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('383', '61', '10', 'invoked', '2015-09-17 03:02:35.15+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('384', '61', '10', 'moving', '2015-09-17 03:02:35.159+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('385', '61', '10', 'prepareinvoking', '2015-09-17 03:02:35.164+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('386', '61', '10', 'invoked', '2015-09-17 03:02:35.169+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('387', '61', '10', 'moving', '2015-09-17 03:02:35.173+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('388', '61', '10', 'prepareinvoking', '2015-09-17 03:02:35.175+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('389', '61', '10', 'invoked', '2015-09-17 03:02:35.176+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('390', '61', '10', 'moving', '2015-09-17 03:02:35.177+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('391', '61', '10', 'end', '2015-09-17 03:02:35.177+06', 't', '0', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('392', '64', '10', 'start', '2015-09-17 06:11:07.599+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('393', '64', '10', 'moving', '2015-09-17 06:11:07.64+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('394', '64', '10', 'prepareinvoking', '2015-09-17 06:11:16.992+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('395', '64', '10', 'invoked', '2015-09-17 06:11:17.216+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('396', '64', '10', 'moving', '2015-09-17 06:11:17.226+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('397', '64', '10', 'paused', '2015-09-17 06:11:17.227+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('398', '65', '10', 'start', '2015-09-17 07:23:48.291+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('399', '65', '10', 'moving', '2015-09-17 07:23:48.299+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('400', '65', '10', 'prepareinvoking', '2015-09-17 07:23:48.578+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('401', '65', '10', 'invoked', '2015-09-17 07:23:48.643+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('402', '65', '10', 'moving', '2015-09-17 07:23:48.648+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('403', '65', '10', 'paused', '2015-09-17 07:23:48.649+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('404', '65', '10', 'start', '2015-09-17 07:24:30.521+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('405', '65', '10', 'moving', '2015-09-17 07:24:30.524+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('406', '65', '10', 'prepareinvoking', '2015-09-17 07:24:30.533+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('407', '65', '10', 'invoked', '2015-09-17 07:24:30.534+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('408', '65', '10', 'moving', '2015-09-17 07:24:30.535+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('409', '65', '10', 'end', '2015-09-17 07:24:30.536+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('410', '66', '10', 'start', '2015-09-17 07:41:40.502+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('411', '66', '10', 'moving', '2015-09-17 07:41:40.505+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('412', '66', '10', 'prepareinvoking', '2015-09-17 07:41:40.506+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('413', '66', '10', 'invoked', '2015-09-17 07:41:40.507+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('414', '66', '10', 'moving', '2015-09-17 07:41:40.54+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('415', '66', '10', 'paused', '2015-09-17 07:41:40.54+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('416', '67', '11', 'start', '2015-09-22 21:05:27.219+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('417', '67', '11', 'moving', '2015-09-22 21:05:27.234+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('418', '67', '11', 'end', '2015-09-22 21:05:27.249+06', 't', '0', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('419', '68', '10', 'start', '2015-09-22 21:19:46.838+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('420', '68', '10', 'moving', '2015-09-22 21:19:46.839+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('421', '68', '10', 'end', '2015-09-22 21:19:46.839+06', 't', '0', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('422', '69', '10', 'start', '2015-09-22 21:24:00.884+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('423', '69', '10', 'moving', '2015-09-22 21:24:00.897+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('424', '69', '10', 'end', '2015-09-22 21:24:00.898+06', 't', '0', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('425', '70', '10', 'start', '2015-09-22 21:47:54.08+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('426', '70', '10', 'moving', '2015-09-22 21:47:54.093+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('427', '70', '10', 'prepareinvoking', '2015-09-22 21:47:54.482+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('428', '70', '10', 'invoked', '2015-09-22 21:47:54.728+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('429', '70', '10', 'moving', '2015-09-22 21:47:54.735+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('430', '70', '10', 'paused', '2015-09-22 21:47:54.735+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('431', '71', '11', 'start', '2015-09-22 21:48:26.763+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('432', '71', '11', 'moving', '2015-09-22 21:48:26.766+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('433', '71', '11', 'prepareinvoking', '2015-09-22 21:48:26.781+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('434', '71', '11', 'preparemovetospace', '2015-09-22 21:48:26.88+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('435', '71', '11', 'movetospace', '2015-09-22 21:48:26.88+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('436', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:26.88+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('437', '71', '11', 'movetocontainer', '2015-09-22 21:48:26.907+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('438', '71', '11', 'invoked', '2015-09-22 21:48:26.907+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('439', '71', '11', 'moving', '2015-09-22 21:48:26.922+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('440', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:27.088+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('441', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.089+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('442', '71', '11', 'invoked', '2015-09-22 21:48:27.089+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('443', '71', '11', 'invokinginspace', '2015-09-22 21:48:27.09+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('444', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.136+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('445', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:27.154+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('446', '71', '11', 'moveupfront', '2015-09-22 21:48:27.208+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('447', '71', '11', 'moving', '2015-09-22 21:48:27.21+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('448', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.212+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('449', '71', '11', 'preparemovetospace', '2015-09-22 21:48:27.213+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('450', '71', '11', 'movetospace', '2015-09-22 21:48:27.213+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('451', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:27.213+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('452', '71', '11', 'movetocontainer', '2015-09-22 21:48:27.213+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('453', '71', '11', 'invoked', '2015-09-22 21:48:27.213+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('454', '71', '11', 'moving', '2015-09-22 21:48:27.214+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('455', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:27.225+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('456', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.226+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('457', '71', '11', 'invoked', '2015-09-22 21:48:27.226+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('458', '71', '11', 'invokinginspace', '2015-09-22 21:48:27.226+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('459', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.227+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('460', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:27.229+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('461', '71', '11', 'moveupfront', '2015-09-22 21:48:27.229+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('462', '71', '11', 'moving', '2015-09-22 21:48:27.23+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('463', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.232+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('464', '71', '11', 'preparemovetospace', '2015-09-22 21:48:27.233+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('465', '71', '11', 'movetospace', '2015-09-22 21:48:27.233+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('466', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:27.233+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('467', '71', '11', 'movetocontainer', '2015-09-22 21:48:27.233+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('468', '71', '11', 'invoked', '2015-09-22 21:48:27.234+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('469', '71', '11', 'moving', '2015-09-22 21:48:27.235+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('470', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:27.238+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('471', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.239+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('472', '71', '11', 'invoked', '2015-09-22 21:48:27.239+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('473', '71', '11', 'invokinginspace', '2015-09-22 21:48:27.28+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('474', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.282+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('475', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:27.282+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('476', '71', '11', 'moveupfront', '2015-09-22 21:48:27.283+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('477', '71', '11', 'moving', '2015-09-22 21:48:27.284+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('478', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.285+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('479', '71', '11', 'preparemovetospace', '2015-09-22 21:48:27.286+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('480', '71', '11', 'movetospace', '2015-09-22 21:48:27.286+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('481', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:27.286+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('482', '71', '11', 'movetocontainer', '2015-09-22 21:48:27.286+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('483', '71', '11', 'invoked', '2015-09-22 21:48:27.286+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('484', '71', '11', 'moving', '2015-09-22 21:48:27.287+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('485', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:27.291+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('486', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.291+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('487', '71', '11', 'invoked', '2015-09-22 21:48:27.291+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('488', '71', '11', 'invokinginspace', '2015-09-22 21:48:27.292+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('489', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.292+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('490', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:27.293+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('491', '71', '11', 'moveupfront', '2015-09-22 21:48:27.293+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('492', '71', '11', 'moving', '2015-09-22 21:48:27.294+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('493', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.295+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('494', '71', '11', 'preparemovetospace', '2015-09-22 21:48:27.296+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('495', '71', '11', 'movetospace', '2015-09-22 21:48:27.296+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('496', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:27.296+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('497', '71', '11', 'movetocontainer', '2015-09-22 21:48:27.296+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('498', '71', '11', 'invoked', '2015-09-22 21:48:27.296+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('499', '71', '11', 'moving', '2015-09-22 21:48:27.297+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('500', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:27.431+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('501', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.434+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('502', '71', '11', 'invoked', '2015-09-22 21:48:27.434+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('503', '71', '11', 'invokinginspace', '2015-09-22 21:48:27.434+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('504', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.435+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('505', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:27.436+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('506', '71', '11', 'moveupfront', '2015-09-22 21:48:27.436+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('507', '71', '11', 'moving', '2015-09-22 21:48:27.437+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('508', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.442+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('509', '71', '11', 'preparemovetospace', '2015-09-22 21:48:27.443+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('510', '71', '11', 'movetospace', '2015-09-22 21:48:27.443+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('511', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:27.443+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('512', '71', '11', 'movetocontainer', '2015-09-22 21:48:27.443+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('513', '71', '11', 'invoked', '2015-09-22 21:48:27.443+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('514', '71', '11', 'moving', '2015-09-22 21:48:27.444+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('515', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:27.451+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('516', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.452+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('517', '71', '11', 'invoked', '2015-09-22 21:48:27.452+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('518', '71', '11', 'invokinginspace', '2015-09-22 21:48:27.453+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('519', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.454+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('520', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:27.455+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('521', '71', '11', 'moveupfront', '2015-09-22 21:48:27.455+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('522', '71', '11', 'moving', '2015-09-22 21:48:27.456+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('523', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.458+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('524', '71', '11', 'preparemovetospace', '2015-09-22 21:48:27.458+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('525', '71', '11', 'movetospace', '2015-09-22 21:48:27.458+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('526', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:27.458+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('527', '71', '11', 'movetocontainer', '2015-09-22 21:48:27.459+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('528', '71', '11', 'invoked', '2015-09-22 21:48:27.459+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('529', '71', '11', 'moving', '2015-09-22 21:48:27.46+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('530', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:27.741+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('531', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.742+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('532', '71', '11', 'invoked', '2015-09-22 21:48:27.743+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('533', '71', '11', 'invokinginspace', '2015-09-22 21:48:27.743+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('534', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.744+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('535', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:27.745+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('536', '71', '11', 'moveupfront', '2015-09-22 21:48:27.745+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('537', '71', '11', 'moving', '2015-09-22 21:48:27.747+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('538', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.848+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('539', '71', '11', 'preparemovetospace', '2015-09-22 21:48:27.849+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('540', '71', '11', 'movetospace', '2015-09-22 21:48:27.849+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('541', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:27.849+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('542', '71', '11', 'movetocontainer', '2015-09-22 21:48:27.849+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('543', '71', '11', 'invoked', '2015-09-22 21:48:27.849+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('544', '71', '11', 'moving', '2015-09-22 21:48:27.85+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('545', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:27.854+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('546', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.854+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('547', '71', '11', 'invoked', '2015-09-22 21:48:27.854+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('548', '71', '11', 'invokinginspace', '2015-09-22 21:48:27.855+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('549', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.855+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('550', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:27.856+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('551', '71', '11', 'moveupfront', '2015-09-22 21:48:27.856+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('552', '71', '11', 'moving', '2015-09-22 21:48:27.857+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('553', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.859+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('554', '71', '11', 'preparemovetospace', '2015-09-22 21:48:27.86+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('555', '71', '11', 'movetospace', '2015-09-22 21:48:27.86+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('556', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:27.86+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('557', '71', '11', 'movetocontainer', '2015-09-22 21:48:27.86+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('558', '71', '11', 'invoked', '2015-09-22 21:48:27.86+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('559', '71', '11', 'moving', '2015-09-22 21:48:27.861+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('560', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:27.864+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('561', '71', '11', 'prepareinvoking', '2015-09-22 21:48:27.864+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('562', '71', '11', 'invoked', '2015-09-22 21:48:27.864+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('563', '71', '11', 'invokinginspace', '2015-09-22 21:48:27.865+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('564', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.054+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('565', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:28.075+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('566', '71', '11', 'moveupfront', '2015-09-22 21:48:28.075+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('567', '71', '11', 'moving', '2015-09-22 21:48:28.076+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('568', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.077+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('569', '71', '11', 'preparemovetospace', '2015-09-22 21:48:28.079+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('570', '71', '11', 'movetospace', '2015-09-22 21:48:28.079+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('571', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:28.079+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('572', '71', '11', 'movetocontainer', '2015-09-22 21:48:28.079+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('573', '71', '11', 'invoked', '2015-09-22 21:48:28.079+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('574', '71', '11', 'moving', '2015-09-22 21:48:28.08+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('575', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:28.085+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('576', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.086+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('577', '71', '11', 'invoked', '2015-09-22 21:48:28.086+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('578', '71', '11', 'invokinginspace', '2015-09-22 21:48:28.086+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('579', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.087+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('580', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:28.088+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('581', '71', '11', 'moveupfront', '2015-09-22 21:48:28.088+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('582', '71', '11', 'moving', '2015-09-22 21:48:28.089+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('583', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.091+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('584', '71', '11', 'preparemovetospace', '2015-09-22 21:48:28.091+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('585', '71', '11', 'movetospace', '2015-09-22 21:48:28.092+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('586', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:28.092+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('587', '71', '11', 'movetocontainer', '2015-09-22 21:48:28.092+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('588', '71', '11', 'invoked', '2015-09-22 21:48:28.092+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('589', '71', '11', 'moving', '2015-09-22 21:48:28.099+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('590', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:28.3+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('591', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.305+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('592', '71', '11', 'invoked', '2015-09-22 21:48:28.305+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('593', '71', '11', 'invokinginspace', '2015-09-22 21:48:28.352+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('594', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.354+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('595', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:28.355+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('596', '71', '11', 'moveupfront', '2015-09-22 21:48:28.356+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('597', '71', '11', 'moving', '2015-09-22 21:48:28.357+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('598', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.394+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('599', '71', '11', 'preparemovetospace', '2015-09-22 21:48:28.42+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('600', '71', '11', 'movetospace', '2015-09-22 21:48:28.42+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('601', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:28.42+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('602', '71', '11', 'movetocontainer', '2015-09-22 21:48:28.42+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('603', '71', '11', 'invoked', '2015-09-22 21:48:28.42+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('604', '71', '11', 'moving', '2015-09-22 21:48:28.422+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('605', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:28.427+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('606', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.429+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('607', '71', '11', 'invoked', '2015-09-22 21:48:28.429+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('608', '71', '11', 'invokinginspace', '2015-09-22 21:48:28.43+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('609', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.431+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('610', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:28.432+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('611', '71', '11', 'moveupfront', '2015-09-22 21:48:28.432+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('612', '71', '11', 'moving', '2015-09-22 21:48:28.433+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('613', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.435+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('614', '71', '11', 'preparemovetospace', '2015-09-22 21:48:28.457+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('615', '71', '11', 'movetospace', '2015-09-22 21:48:28.457+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('616', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:28.457+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('617', '71', '11', 'movetocontainer', '2015-09-22 21:48:28.457+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('618', '71', '11', 'invoked', '2015-09-22 21:48:28.457+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('619', '71', '11', 'moving', '2015-09-22 21:48:28.478+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('620', '71', '11', 'prepareinvokinginspace', '2015-09-22 21:48:28.537+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('621', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.539+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('622', '71', '11', 'invoked', '2015-09-22 21:48:28.539+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('623', '71', '11', 'invokinginspace', '2015-09-22 21:48:28.539+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('624', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.559+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('625', '71', '11', 'preparemoveupfront', '2015-09-22 21:48:28.56+06', 't', '0', '1', '{2}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('626', '71', '11', 'moveupfront', '2015-09-22 21:48:28.561+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('627', '71', '11', 'moving', '2015-09-22 21:48:28.562+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('628', '71', '11', 'prepareinvoking', '2015-09-22 21:48:28.601+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('629', '71', '11', 'preparemovetospace', '2015-09-22 21:48:28.604+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('630', '71', '11', 'movetospace', '2015-09-22 21:48:28.604+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('631', '71', '11', 'preparemovetocontainer', '2015-09-22 21:48:28.604+06', 't', '0', '1', '{}', '{}', '{2}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('632', '71', '11', 'movetocontainer', '2015-09-22 21:48:28.604+06', 't', '0', '1', '{1}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('633', '71', '11', 'invoked', '2015-09-22 21:48:28.604+06', 't', '0', '1', '{1}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('634', '71', '11', 'moving', '2015-09-22 21:48:28.606+06', 't', '0', '1', '{1}', '{}', '{2}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('635', '71', '11', 'end', '2015-09-22 21:48:28.638+06', 't', '0', '1', '{1}', '{}', '{2}', 't', 't', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('636', '66', '10', 'start', '2015-09-22 21:51:33.12+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('637', '66', '10', 'moving', '2015-09-22 21:51:33.121+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('638', '66', '10', 'prepareinvoking', '2015-09-22 21:51:33.124+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('639', '66', '10', 'invoked', '2015-09-22 21:51:33.125+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('640', '66', '10', 'moving', '2015-09-22 21:51:33.126+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('641', '66', '10', 'end', '2015-09-22 21:51:33.126+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('642', '72', '11', 'start', '2015-09-22 23:07:31.336+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('643', '72', '11', 'moving', '2015-09-22 23:07:31.364+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('644', '72', '11', 'prepareinvoking', '2015-09-22 23:07:31.659+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('645', '72', '11', 'preparemovetospace', '2015-09-22 23:07:31.793+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('646', '72', '11', 'movetospace', '2015-09-22 23:07:31.793+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('647', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:31.793+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('648', '72', '11', 'movetocontainer', '2015-09-22 23:07:31.795+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('649', '72', '11', 'invoked', '2015-09-22 23:07:31.796+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('650', '72', '11', 'moving', '2015-09-22 23:07:31.803+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('651', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:31.894+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('652', '72', '11', 'prepareinvoking', '2015-09-22 23:07:31.895+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('653', '72', '11', 'invoked', '2015-09-22 23:07:31.896+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('654', '72', '11', 'invokinginspace', '2015-09-22 23:07:31.9+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('655', '72', '11', 'prepareinvoking', '2015-09-22 23:07:31.918+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('656', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:31.926+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('657', '72', '11', 'moveupfront', '2015-09-22 23:07:31.954+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('658', '72', '11', 'moving', '2015-09-22 23:07:31.956+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('659', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.018+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('660', '72', '11', 'preparemovetospace', '2015-09-22 23:07:32.019+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('661', '72', '11', 'movetospace', '2015-09-22 23:07:32.019+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('662', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:32.019+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('663', '72', '11', 'movetocontainer', '2015-09-22 23:07:32.019+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('664', '72', '11', 'invoked', '2015-09-22 23:07:32.02+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('665', '72', '11', 'moving', '2015-09-22 23:07:32.021+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('666', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:32.024+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('667', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.025+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('668', '72', '11', 'invoked', '2015-09-22 23:07:32.025+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('669', '72', '11', 'invokinginspace', '2015-09-22 23:07:32.025+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('670', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.026+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('671', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:32.034+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('672', '72', '11', 'moveupfront', '2015-09-22 23:07:32.035+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('673', '72', '11', 'moving', '2015-09-22 23:07:32.078+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('674', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.08+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('675', '72', '11', 'preparemovetospace', '2015-09-22 23:07:32.148+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('676', '72', '11', 'movetospace', '2015-09-22 23:07:32.148+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('677', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:32.148+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('678', '72', '11', 'movetocontainer', '2015-09-22 23:07:32.148+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('679', '72', '11', 'invoked', '2015-09-22 23:07:32.148+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('680', '72', '11', 'moving', '2015-09-22 23:07:32.15+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('681', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:32.154+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('682', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.155+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('683', '72', '11', 'invoked', '2015-09-22 23:07:32.155+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('684', '72', '11', 'invokinginspace', '2015-09-22 23:07:32.157+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('685', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.158+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('686', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:32.159+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('687', '72', '11', 'moveupfront', '2015-09-22 23:07:32.16+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('688', '72', '11', 'moving', '2015-09-22 23:07:32.16+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('689', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.162+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('690', '72', '11', 'preparemovetospace', '2015-09-22 23:07:32.174+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('691', '72', '11', 'movetospace', '2015-09-22 23:07:32.175+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('692', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:32.175+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('693', '72', '11', 'movetocontainer', '2015-09-22 23:07:32.175+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('694', '72', '11', 'invoked', '2015-09-22 23:07:32.175+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('695', '72', '11', 'moving', '2015-09-22 23:07:32.177+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('696', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:32.182+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('697', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.184+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('698', '72', '11', 'invoked', '2015-09-22 23:07:32.184+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('699', '72', '11', 'invokinginspace', '2015-09-22 23:07:32.185+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('700', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.186+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('701', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:32.187+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('702', '72', '11', 'moveupfront', '2015-09-22 23:07:32.187+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('703', '72', '11', 'moving', '2015-09-22 23:07:32.188+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('704', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.19+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('705', '72', '11', 'preparemovetospace', '2015-09-22 23:07:32.191+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('706', '72', '11', 'movetospace', '2015-09-22 23:07:32.191+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('707', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:32.191+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('708', '72', '11', 'movetocontainer', '2015-09-22 23:07:32.191+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('709', '72', '11', 'invoked', '2015-09-22 23:07:32.191+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('710', '72', '11', 'moving', '2015-09-22 23:07:32.192+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('711', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:32.2+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('712', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.201+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('713', '72', '11', 'invoked', '2015-09-22 23:07:32.201+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('714', '72', '11', 'invokinginspace', '2015-09-22 23:07:32.201+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('715', '72', '11', 'prepareinvoking', '2015-09-22 23:07:32.211+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('716', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:32.224+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('717', '72', '11', 'moveupfront', '2015-09-22 23:07:32.224+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('718', '72', '11', 'moving', '2015-09-22 23:07:32.226+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('719', '72', '11', 'prepareinvoking', '2015-09-22 23:07:33.386+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('720', '72', '11', 'preparemovetospace', '2015-09-22 23:07:33.389+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('721', '72', '11', 'movetospace', '2015-09-22 23:07:33.389+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('722', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:33.389+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('723', '72', '11', 'movetocontainer', '2015-09-22 23:07:33.389+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('724', '72', '11', 'invoked', '2015-09-22 23:07:33.389+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('725', '72', '11', 'moving', '2015-09-22 23:07:33.399+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('726', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:33.408+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('727', '72', '11', 'prepareinvoking', '2015-09-22 23:07:33.408+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('728', '72', '11', 'invoked', '2015-09-22 23:07:33.409+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('729', '72', '11', 'invokinginspace', '2015-09-22 23:07:33.409+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('730', '72', '11', 'prepareinvoking', '2015-09-22 23:07:33.413+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('731', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:33.414+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('732', '72', '11', 'moveupfront', '2015-09-22 23:07:33.414+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('733', '72', '11', 'moving', '2015-09-22 23:07:33.419+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('734', '72', '11', 'prepareinvoking', '2015-09-22 23:07:33.422+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('735', '72', '11', 'preparemovetospace', '2015-09-22 23:07:33.423+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('736', '72', '11', 'movetospace', '2015-09-22 23:07:33.423+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('737', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:33.423+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('738', '72', '11', 'movetocontainer', '2015-09-22 23:07:33.423+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('739', '72', '11', 'invoked', '2015-09-22 23:07:33.423+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('740', '72', '11', 'moving', '2015-09-22 23:07:33.426+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('741', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:33.433+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('742', '72', '11', 'prepareinvoking', '2015-09-22 23:07:33.434+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('743', '72', '11', 'invoked', '2015-09-22 23:07:33.434+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('744', '72', '11', 'invokinginspace', '2015-09-22 23:07:33.434+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('745', '72', '11', 'prepareinvoking', '2015-09-22 23:07:33.438+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('746', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:33.44+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('747', '72', '11', 'moveupfront', '2015-09-22 23:07:33.442+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('748', '72', '11', 'moving', '2015-09-22 23:07:33.447+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('749', '72', '11', 'prepareinvoking', '2015-09-22 23:07:34.302+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('750', '72', '11', 'preparemovetospace', '2015-09-22 23:07:34.304+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('751', '72', '11', 'movetospace', '2015-09-22 23:07:34.304+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('752', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:34.304+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('753', '72', '11', 'movetocontainer', '2015-09-22 23:07:34.304+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('754', '72', '11', 'invoked', '2015-09-22 23:07:34.304+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('755', '72', '11', 'moving', '2015-09-22 23:07:34.309+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('756', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:34.357+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('757', '72', '11', 'prepareinvoking', '2015-09-22 23:07:34.373+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('758', '72', '11', 'invoked', '2015-09-22 23:07:34.373+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('759', '72', '11', 'invokinginspace', '2015-09-22 23:07:34.374+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('760', '72', '11', 'prepareinvoking', '2015-09-22 23:07:34.375+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('761', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:34.377+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('762', '72', '11', 'moveupfront', '2015-09-22 23:07:34.377+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('763', '72', '11', 'moving', '2015-09-22 23:07:34.379+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('764', '72', '11', 'prepareinvoking', '2015-09-22 23:07:34.38+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('765', '72', '11', 'preparemovetospace', '2015-09-22 23:07:34.382+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('766', '72', '11', 'movetospace', '2015-09-22 23:07:34.382+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('767', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:34.382+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('768', '72', '11', 'movetocontainer', '2015-09-22 23:07:34.382+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('769', '72', '11', 'invoked', '2015-09-22 23:07:34.383+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('770', '72', '11', 'moving', '2015-09-22 23:07:34.385+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('771', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:34.393+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('772', '72', '11', 'prepareinvoking', '2015-09-22 23:07:34.394+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('773', '72', '11', 'invoked', '2015-09-22 23:07:34.394+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('774', '72', '11', 'invokinginspace', '2015-09-22 23:07:34.397+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('775', '72', '11', 'prepareinvoking', '2015-09-22 23:07:34.398+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('776', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:34.399+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('777', '72', '11', 'moveupfront', '2015-09-22 23:07:34.4+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('778', '72', '11', 'moving', '2015-09-22 23:07:34.4+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('779', '72', '11', 'prepareinvoking', '2015-09-22 23:07:34.402+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('780', '72', '11', 'preparemovetospace', '2015-09-22 23:07:35.537+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('781', '72', '11', 'movetospace', '2015-09-22 23:07:35.538+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('782', '72', '11', 'preparemovetocontainer', '2015-09-22 23:07:35.538+06', 't', '0', '1', '{}', '{}', '{3}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('783', '72', '11', 'movetocontainer', '2015-09-22 23:07:35.538+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('784', '72', '11', 'invoked', '2015-09-22 23:07:35.538+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('785', '72', '11', 'moving', '2015-09-22 23:07:35.54+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('786', '72', '11', 'prepareinvokinginspace', '2015-09-22 23:07:35.546+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('787', '72', '11', 'prepareinvoking', '2015-09-22 23:07:35.547+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('788', '72', '11', 'invoked', '2015-09-22 23:07:35.547+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('789', '72', '11', 'invokinginspace', '2015-09-22 23:07:35.547+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('790', '72', '11', 'prepareinvoking', '2015-09-22 23:07:35.549+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('791', '72', '11', 'preparemoveupfront', '2015-09-22 23:07:35.551+06', 't', '0', '1', '{2}', '{}', '{3}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('792', '72', '11', 'moveupfront', '2015-09-22 23:07:35.551+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('793', '72', '11', 'moving', '2015-09-22 23:07:35.554+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('794', '72', '11', 'prepareinvoking', '2015-09-22 23:07:35.564+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('795', '73', '11', 'start', '2015-09-22 23:30:07.74+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('796', '73', '11', 'moving', '2015-09-22 23:30:07.757+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('797', '73', '11', 'prepareinvoking', '2015-09-22 23:30:07.965+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('798', '73', '11', 'preparemovetospace', '2015-09-22 23:30:08.109+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('799', '73', '11', 'movetospace', '2015-09-22 23:30:08.11+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('800', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:08.11+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('801', '73', '11', 'movetocontainer', '2015-09-22 23:30:08.112+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('802', '73', '11', 'invoked', '2015-09-22 23:30:08.112+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('803', '73', '11', 'moving', '2015-09-22 23:30:08.117+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('804', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:08.164+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('805', '73', '11', 'prepareinvoking', '2015-09-22 23:30:08.165+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('806', '73', '11', 'invoked', '2015-09-22 23:30:08.165+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('807', '73', '11', 'invokinginspace', '2015-09-22 23:30:08.188+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('808', '73', '11', 'prepareinvoking', '2015-09-22 23:30:08.2+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('809', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:08.209+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('810', '73', '11', 'moveupfront', '2015-09-22 23:30:08.238+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('811', '73', '11', 'moving', '2015-09-22 23:30:08.239+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('812', '73', '11', 'prepareinvoking', '2015-09-22 23:30:08.245+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('813', '73', '11', 'preparemovetospace', '2015-09-22 23:30:08.246+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('814', '73', '11', 'movetospace', '2015-09-22 23:30:08.246+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('815', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:08.247+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('816', '73', '11', 'movetocontainer', '2015-09-22 23:30:08.247+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('817', '73', '11', 'invoked', '2015-09-22 23:30:08.253+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('818', '73', '11', 'moving', '2015-09-22 23:30:08.259+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('819', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:08.29+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('820', '73', '11', 'prepareinvoking', '2015-09-22 23:30:08.293+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('821', '73', '11', 'invoked', '2015-09-22 23:30:08.293+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('822', '73', '11', 'invokinginspace', '2015-09-22 23:30:08.294+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('823', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.229+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('824', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:09.234+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('825', '73', '11', 'moveupfront', '2015-09-22 23:30:09.234+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('826', '73', '11', 'moving', '2015-09-22 23:30:09.235+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('827', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.251+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('828', '73', '11', 'preparemovetospace', '2015-09-22 23:30:09.253+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('829', '73', '11', 'movetospace', '2015-09-22 23:30:09.253+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('830', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:09.253+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('831', '73', '11', 'movetocontainer', '2015-09-22 23:30:09.253+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('832', '73', '11', 'invoked', '2015-09-22 23:30:09.253+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('833', '73', '11', 'moving', '2015-09-22 23:30:09.254+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('834', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:09.321+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('835', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.322+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('836', '73', '11', 'invoked', '2015-09-22 23:30:09.322+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('837', '73', '11', 'invokinginspace', '2015-09-22 23:30:09.323+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('838', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.325+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('839', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:09.329+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('840', '73', '11', 'moveupfront', '2015-09-22 23:30:09.329+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('841', '73', '11', 'moving', '2015-09-22 23:30:09.33+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('842', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.333+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('843', '73', '11', 'preparemovetospace', '2015-09-22 23:30:09.335+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('844', '73', '11', 'movetospace', '2015-09-22 23:30:09.335+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('845', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:09.335+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('846', '73', '11', 'movetocontainer', '2015-09-22 23:30:09.335+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('847', '73', '11', 'invoked', '2015-09-22 23:30:09.339+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('848', '73', '11', 'moving', '2015-09-22 23:30:09.341+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('849', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:09.348+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('850', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.349+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('851', '73', '11', 'invoked', '2015-09-22 23:30:09.349+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('852', '73', '11', 'invokinginspace', '2015-09-22 23:30:09.349+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('853', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.561+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('854', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:09.572+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('855', '73', '11', 'moveupfront', '2015-09-22 23:30:09.58+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('856', '73', '11', 'moving', '2015-09-22 23:30:09.582+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('857', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.584+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('858', '73', '11', 'preparemovetospace', '2015-09-22 23:30:09.586+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('859', '73', '11', 'movetospace', '2015-09-22 23:30:09.587+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('860', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:09.587+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('861', '73', '11', 'movetocontainer', '2015-09-22 23:30:09.587+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('862', '73', '11', 'invoked', '2015-09-22 23:30:09.587+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('863', '73', '11', 'moving', '2015-09-22 23:30:09.59+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('864', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:09.621+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('865', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.622+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('866', '73', '11', 'invoked', '2015-09-22 23:30:09.622+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('867', '73', '11', 'invokinginspace', '2015-09-22 23:30:09.623+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('868', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.625+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('869', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:09.626+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('870', '73', '11', 'moveupfront', '2015-09-22 23:30:09.626+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('871', '73', '11', 'moving', '2015-09-22 23:30:09.629+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('872', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.636+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('873', '73', '11', 'preparemovetospace', '2015-09-22 23:30:09.637+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('874', '73', '11', 'movetospace', '2015-09-22 23:30:09.637+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('875', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:09.637+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('876', '73', '11', 'movetocontainer', '2015-09-22 23:30:09.637+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('877', '73', '11', 'invoked', '2015-09-22 23:30:09.638+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('878', '73', '11', 'moving', '2015-09-22 23:30:09.639+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('879', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:09.645+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('880', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.646+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('881', '73', '11', 'invoked', '2015-09-22 23:30:09.646+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('882', '73', '11', 'invokinginspace', '2015-09-22 23:30:09.646+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('883', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.649+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('884', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:09.652+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('885', '73', '11', 'moveupfront', '2015-09-22 23:30:09.652+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('886', '73', '11', 'moving', '2015-09-22 23:30:09.653+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('887', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.656+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('888', '73', '11', 'preparemovetospace', '2015-09-22 23:30:09.657+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('889', '73', '11', 'movetospace', '2015-09-22 23:30:09.657+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('890', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:09.657+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('891', '73', '11', 'movetocontainer', '2015-09-22 23:30:09.657+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('892', '73', '11', 'invoked', '2015-09-22 23:30:09.657+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('893', '73', '11', 'moving', '2015-09-22 23:30:09.661+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('894', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:09.667+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('895', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.668+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('896', '73', '11', 'invoked', '2015-09-22 23:30:09.668+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('897', '73', '11', 'invokinginspace', '2015-09-22 23:30:09.668+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('898', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.671+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('899', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:09.915+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('900', '73', '11', 'moveupfront', '2015-09-22 23:30:09.916+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('901', '73', '11', 'moving', '2015-09-22 23:30:09.919+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('902', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.922+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('903', '73', '11', 'preparemovetospace', '2015-09-22 23:30:09.933+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('904', '73', '11', 'movetospace', '2015-09-22 23:30:09.933+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('905', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:09.933+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('906', '73', '11', 'movetocontainer', '2015-09-22 23:30:09.934+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('907', '73', '11', 'invoked', '2015-09-22 23:30:09.934+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('908', '73', '11', 'moving', '2015-09-22 23:30:09.936+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('909', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:09.942+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('910', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.943+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('911', '73', '11', 'invoked', '2015-09-22 23:30:09.944+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('912', '73', '11', 'invokinginspace', '2015-09-22 23:30:09.946+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('913', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.947+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('914', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:09.951+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('915', '73', '11', 'moveupfront', '2015-09-22 23:30:09.951+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('916', '73', '11', 'moving', '2015-09-22 23:30:09.956+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('917', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.963+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('918', '73', '11', 'preparemovetospace', '2015-09-22 23:30:09.969+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('919', '73', '11', 'movetospace', '2015-09-22 23:30:09.969+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('920', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:09.969+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('921', '73', '11', 'movetocontainer', '2015-09-22 23:30:09.969+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('922', '73', '11', 'invoked', '2015-09-22 23:30:09.969+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('923', '73', '11', 'moving', '2015-09-22 23:30:09.971+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('924', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:09.975+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('925', '73', '11', 'prepareinvoking', '2015-09-22 23:30:09.976+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('926', '73', '11', 'invoked', '2015-09-22 23:30:09.976+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('927', '73', '11', 'invokinginspace', '2015-09-22 23:30:10.321+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('928', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.323+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('929', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:10.327+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('930', '73', '11', 'moveupfront', '2015-09-22 23:30:10.327+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('931', '73', '11', 'moving', '2015-09-22 23:30:10.328+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('932', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.331+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('933', '73', '11', 'preparemovetospace', '2015-09-22 23:30:10.332+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('934', '73', '11', 'movetospace', '2015-09-22 23:30:10.332+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('935', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:10.332+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('936', '73', '11', 'movetocontainer', '2015-09-22 23:30:10.332+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('937', '73', '11', 'invoked', '2015-09-22 23:30:10.332+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('938', '73', '11', 'moving', '2015-09-22 23:30:10.334+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('939', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:10.338+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('940', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.339+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('941', '73', '11', 'invoked', '2015-09-22 23:30:10.339+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('942', '73', '11', 'invokinginspace', '2015-09-22 23:30:10.34+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('943', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.341+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('944', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:10.342+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('945', '73', '11', 'moveupfront', '2015-09-22 23:30:10.342+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('946', '73', '11', 'moving', '2015-09-22 23:30:10.343+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('947', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.345+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('948', '73', '11', 'preparemovetospace', '2015-09-22 23:30:10.347+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('949', '73', '11', 'movetospace', '2015-09-22 23:30:10.347+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('950', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:10.347+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('951', '73', '11', 'movetocontainer', '2015-09-22 23:30:10.347+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('952', '73', '11', 'invoked', '2015-09-22 23:30:10.347+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('953', '73', '11', 'moving', '2015-09-22 23:30:10.349+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('954', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:10.907+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('955', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.909+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('956', '73', '11', 'invoked', '2015-09-22 23:30:10.909+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('957', '73', '11', 'invokinginspace', '2015-09-22 23:30:10.91+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('958', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.911+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('959', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:10.912+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('960', '73', '11', 'moveupfront', '2015-09-22 23:30:10.912+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('961', '73', '11', 'moving', '2015-09-22 23:30:10.913+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('962', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.923+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('963', '73', '11', 'preparemovetospace', '2015-09-22 23:30:10.925+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('964', '73', '11', 'movetospace', '2015-09-22 23:30:10.925+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('965', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:10.925+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('966', '73', '11', 'movetocontainer', '2015-09-22 23:30:10.925+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('967', '73', '11', 'invoked', '2015-09-22 23:30:10.925+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('968', '73', '11', 'moving', '2015-09-22 23:30:10.927+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('969', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:10.937+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('970', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.939+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('971', '73', '11', 'invoked', '2015-09-22 23:30:10.939+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('972', '73', '11', 'invokinginspace', '2015-09-22 23:30:10.939+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('973', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.94+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('974', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:10.941+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('975', '73', '11', 'moveupfront', '2015-09-22 23:30:10.941+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('976', '73', '11', 'moving', '2015-09-22 23:30:10.942+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('977', '73', '11', 'prepareinvoking', '2015-09-22 23:30:10.944+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('978', '73', '11', 'preparemovetospace', '2015-09-22 23:30:10.945+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('979', '73', '11', 'movetospace', '2015-09-22 23:30:10.945+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('980', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:10.945+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('981', '73', '11', 'movetocontainer', '2015-09-22 23:30:10.945+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('982', '73', '11', 'invoked', '2015-09-22 23:30:10.945+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('983', '73', '11', 'moving', '2015-09-22 23:30:10.947+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('984', '73', '11', 'prepareinvokinginspace', '2015-09-22 23:30:10.961+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('985', '73', '11', 'prepareinvoking', '2015-09-22 23:30:11.299+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('986', '73', '11', 'invoked', '2015-09-22 23:30:11.299+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('987', '73', '11', 'invokinginspace', '2015-09-22 23:30:11.302+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('988', '73', '11', 'prepareinvoking', '2015-09-22 23:30:11.304+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('989', '73', '11', 'preparemoveupfront', '2015-09-22 23:30:11.305+06', 't', '0', '1', '{2}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('990', '73', '11', 'moveupfront', '2015-09-22 23:30:11.305+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('991', '73', '11', 'moving', '2015-09-22 23:30:11.308+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('992', '73', '11', 'prepareinvoking', '2015-09-22 23:30:11.312+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('993', '73', '11', 'preparemovetospace', '2015-09-22 23:30:11.313+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('994', '73', '11', 'movetospace', '2015-09-22 23:30:11.313+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('995', '73', '11', 'preparemovetocontainer', '2015-09-22 23:30:11.313+06', 't', '0', '1', '{}', '{}', '{4}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('996', '73', '11', 'movetocontainer', '2015-09-22 23:30:11.313+06', 't', '0', '1', '{1}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('997', '73', '11', 'invoked', '2015-09-22 23:30:11.314+06', 't', '0', '1', '{1}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('998', '73', '11', 'moving', '2015-09-22 23:30:11.316+06', 't', '0', '1', '{1}', '{}', '{4}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('999', '73', '11', 'end', '2015-09-22 23:30:11.319+06', 't', '0', '1', '{1}', '{}', '{4}', 't', 't', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1000', '74', '11', 'start', '2015-09-22 23:40:27.623+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1001', '74', '11', 'moving', '2015-09-22 23:40:27.624+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1002', '74', '11', 'prepareinvoking', '2015-09-22 23:40:27.627+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1003', '74', '11', 'preparemovetospace', '2015-09-22 23:40:27.628+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1004', '74', '11', 'movetospace', '2015-09-22 23:40:27.628+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1005', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:27.628+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1006', '74', '11', 'movetocontainer', '2015-09-22 23:40:27.628+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1007', '74', '11', 'invoked', '2015-09-22 23:40:27.629+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1008', '74', '11', 'moving', '2015-09-22 23:40:27.63+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1009', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:27.633+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1010', '74', '11', 'prepareinvoking', '2015-09-22 23:40:27.633+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1011', '74', '11', 'invoked', '2015-09-22 23:40:27.633+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1012', '74', '11', 'invokinginspace', '2015-09-22 23:40:27.634+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1013', '74', '11', 'prepareinvoking', '2015-09-22 23:40:27.634+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1014', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:27.635+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1015', '74', '11', 'moveupfront', '2015-09-22 23:40:27.636+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1016', '74', '11', 'moving', '2015-09-22 23:40:27.637+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1017', '74', '11', 'prepareinvoking', '2015-09-22 23:40:27.638+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1018', '74', '11', 'preparemovetospace', '2015-09-22 23:40:27.647+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1019', '74', '11', 'movetospace', '2015-09-22 23:40:27.647+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1020', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:27.647+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1021', '74', '11', 'movetocontainer', '2015-09-22 23:40:27.647+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1022', '74', '11', 'invoked', '2015-09-22 23:40:27.647+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1023', '74', '11', 'moving', '2015-09-22 23:40:27.648+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1024', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:27.651+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1025', '74', '11', 'prepareinvoking', '2015-09-22 23:40:27.653+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1026', '74', '11', 'invoked', '2015-09-22 23:40:27.653+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1027', '74', '11', 'invokinginspace', '2015-09-22 23:40:27.653+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1028', '74', '11', 'prepareinvoking', '2015-09-22 23:40:27.654+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1029', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:27.655+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1030', '74', '11', 'moveupfront', '2015-09-22 23:40:27.655+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1031', '74', '11', 'moving', '2015-09-22 23:40:27.658+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1032', '74', '11', 'prepareinvoking', '2015-09-22 23:40:27.66+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1033', '74', '11', 'preparemovetospace', '2015-09-22 23:40:27.661+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1034', '74', '11', 'movetospace', '2015-09-22 23:40:27.661+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1035', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:27.661+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1036', '74', '11', 'movetocontainer', '2015-09-22 23:40:27.661+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1037', '74', '11', 'invoked', '2015-09-22 23:40:27.661+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1038', '74', '11', 'moving', '2015-09-22 23:40:27.661+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1039', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:27.667+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1040', '74', '11', 'prepareinvoking', '2015-09-22 23:40:27.668+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1041', '74', '11', 'invoked', '2015-09-22 23:40:27.668+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1042', '74', '11', 'invokinginspace', '2015-09-22 23:40:27.668+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1043', '74', '11', 'prepareinvoking', '2015-09-22 23:40:27.669+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1044', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:27.67+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1045', '74', '11', 'moveupfront', '2015-09-22 23:40:27.67+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1046', '74', '11', 'moving', '2015-09-22 23:40:28.296+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1047', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.301+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1048', '74', '11', 'preparemovetospace', '2015-09-22 23:40:28.302+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1049', '74', '11', 'movetospace', '2015-09-22 23:40:28.302+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1050', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:28.303+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1051', '74', '11', 'movetocontainer', '2015-09-22 23:40:28.308+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1052', '74', '11', 'invoked', '2015-09-22 23:40:28.309+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1053', '74', '11', 'moving', '2015-09-22 23:40:28.31+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1054', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:28.318+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1055', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.321+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1056', '74', '11', 'invoked', '2015-09-22 23:40:28.321+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1057', '74', '11', 'invokinginspace', '2015-09-22 23:40:28.321+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1058', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.322+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1059', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:28.323+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1060', '74', '11', 'moveupfront', '2015-09-22 23:40:28.323+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1061', '74', '11', 'moving', '2015-09-22 23:40:28.324+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1062', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.327+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1063', '74', '11', 'preparemovetospace', '2015-09-22 23:40:28.33+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1064', '74', '11', 'movetospace', '2015-09-22 23:40:28.33+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1065', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:28.33+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1066', '74', '11', 'movetocontainer', '2015-09-22 23:40:28.331+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1067', '74', '11', 'invoked', '2015-09-22 23:40:28.331+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1068', '74', '11', 'moving', '2015-09-22 23:40:28.332+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1069', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:28.34+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1070', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.341+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1071', '74', '11', 'invoked', '2015-09-22 23:40:28.341+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1072', '74', '11', 'invokinginspace', '2015-09-22 23:40:28.341+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1073', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.904+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1074', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:28.905+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1075', '74', '11', 'moveupfront', '2015-09-22 23:40:28.905+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1076', '74', '11', 'moving', '2015-09-22 23:40:28.906+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1077', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.908+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1078', '74', '11', 'preparemovetospace', '2015-09-22 23:40:28.911+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1079', '74', '11', 'movetospace', '2015-09-22 23:40:28.911+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1080', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:28.911+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1081', '74', '11', 'movetocontainer', '2015-09-22 23:40:28.911+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1082', '74', '11', 'invoked', '2015-09-22 23:40:28.911+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1083', '74', '11', 'moving', '2015-09-22 23:40:28.912+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1084', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:28.917+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1085', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.918+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1086', '74', '11', 'invoked', '2015-09-22 23:40:28.918+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1087', '74', '11', 'invokinginspace', '2015-09-22 23:40:28.918+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1088', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.919+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1089', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:28.92+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1090', '74', '11', 'moveupfront', '2015-09-22 23:40:28.92+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1091', '74', '11', 'moving', '2015-09-22 23:40:28.921+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1092', '74', '11', 'prepareinvoking', '2015-09-22 23:40:28.922+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1093', '74', '11', 'preparemovetospace', '2015-09-22 23:40:28.923+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1094', '74', '11', 'movetospace', '2015-09-22 23:40:28.923+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1095', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:28.923+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1096', '74', '11', 'movetocontainer', '2015-09-22 23:40:28.923+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1097', '74', '11', 'invoked', '2015-09-22 23:40:28.923+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1098', '74', '11', 'moving', '2015-09-22 23:40:28.925+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1099', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:30.019+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1100', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.022+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1101', '74', '11', 'invoked', '2015-09-22 23:40:30.022+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1102', '74', '11', 'invokinginspace', '2015-09-22 23:40:30.023+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1103', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.023+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1104', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:30.025+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1105', '74', '11', 'moveupfront', '2015-09-22 23:40:30.025+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1106', '74', '11', 'moving', '2015-09-22 23:40:30.026+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1107', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.028+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1108', '74', '11', 'preparemovetospace', '2015-09-22 23:40:30.029+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1109', '74', '11', 'movetospace', '2015-09-22 23:40:30.03+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1110', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:30.03+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1111', '74', '11', 'movetocontainer', '2015-09-22 23:40:30.03+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1112', '74', '11', 'invoked', '2015-09-22 23:40:30.03+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1113', '74', '11', 'moving', '2015-09-22 23:40:30.031+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1114', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:30.035+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1115', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.036+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1116', '74', '11', 'invoked', '2015-09-22 23:40:30.036+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1117', '74', '11', 'invokinginspace', '2015-09-22 23:40:30.036+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1118', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.037+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1119', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:30.038+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1120', '74', '11', 'moveupfront', '2015-09-22 23:40:30.038+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1121', '74', '11', 'moving', '2015-09-22 23:40:30.039+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1122', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.04+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1123', '74', '11', 'preparemovetospace', '2015-09-22 23:40:30.041+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1124', '74', '11', 'movetospace', '2015-09-22 23:40:30.041+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1125', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:30.041+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1126', '74', '11', 'movetocontainer', '2015-09-22 23:40:30.041+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1127', '74', '11', 'invoked', '2015-09-22 23:40:30.041+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1128', '74', '11', 'moving', '2015-09-22 23:40:30.042+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1129', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:30.046+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1130', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.058+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1131', '74', '11', 'invoked', '2015-09-22 23:40:30.058+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1132', '74', '11', 'invokinginspace', '2015-09-22 23:40:30.058+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1133', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.059+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1134', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:30.06+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1135', '74', '11', 'moveupfront', '2015-09-22 23:40:30.06+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1136', '74', '11', 'moving', '2015-09-22 23:40:30.061+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1137', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.064+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1138', '74', '11', 'preparemovetospace', '2015-09-22 23:40:30.065+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1139', '74', '11', 'movetospace', '2015-09-22 23:40:30.065+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1140', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:30.065+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1141', '74', '11', 'movetocontainer', '2015-09-22 23:40:30.065+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1142', '74', '11', 'invoked', '2015-09-22 23:40:30.065+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1143', '74', '11', 'moving', '2015-09-22 23:40:30.066+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1144', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:30.071+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1145', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.072+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1146', '74', '11', 'invoked', '2015-09-22 23:40:30.072+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1147', '74', '11', 'invokinginspace', '2015-09-22 23:40:30.073+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1148', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.074+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1149', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:30.075+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1150', '74', '11', 'moveupfront', '2015-09-22 23:40:30.075+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1151', '74', '11', 'moving', '2015-09-22 23:40:30.076+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1152', '74', '11', 'prepareinvoking', '2015-09-22 23:40:30.078+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1153', '74', '11', 'preparemovetospace', '2015-09-22 23:40:30.079+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1154', '74', '11', 'movetospace', '2015-09-22 23:40:30.079+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1155', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:30.079+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1156', '74', '11', 'movetocontainer', '2015-09-22 23:40:30.079+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1157', '74', '11', 'invoked', '2015-09-22 23:40:32.075+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1158', '74', '11', 'moving', '2015-09-22 23:40:32.076+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1159', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:32.082+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1160', '74', '11', 'prepareinvoking', '2015-09-22 23:40:32.082+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1161', '74', '11', 'invoked', '2015-09-22 23:40:32.082+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1162', '74', '11', 'invokinginspace', '2015-09-22 23:40:32.083+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1163', '74', '11', 'prepareinvoking', '2015-09-22 23:40:32.085+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1164', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:32.086+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1165', '74', '11', 'moveupfront', '2015-09-22 23:40:32.086+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1166', '74', '11', 'moving', '2015-09-22 23:40:32.087+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1167', '74', '11', 'prepareinvoking', '2015-09-22 23:40:32.09+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1168', '74', '11', 'preparemovetospace', '2015-09-22 23:40:32.091+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1169', '74', '11', 'movetospace', '2015-09-22 23:40:32.091+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1170', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:32.091+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1171', '74', '11', 'movetocontainer', '2015-09-22 23:40:32.091+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1172', '74', '11', 'invoked', '2015-09-22 23:40:32.091+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1173', '74', '11', 'moving', '2015-09-22 23:40:32.092+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1174', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:32.097+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1175', '74', '11', 'prepareinvoking', '2015-09-22 23:40:32.098+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1176', '74', '11', 'invoked', '2015-09-22 23:40:32.098+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1177', '74', '11', 'invokinginspace', '2015-09-22 23:40:32.099+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1178', '74', '11', 'prepareinvoking', '2015-09-22 23:40:32.1+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1179', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:32.101+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1180', '74', '11', 'moveupfront', '2015-09-22 23:40:32.101+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1181', '74', '11', 'moving', '2015-09-22 23:40:32.102+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1182', '74', '11', 'prepareinvoking', '2015-09-22 23:40:32.103+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1183', '74', '11', 'preparemovetospace', '2015-09-22 23:40:32.105+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1184', '74', '11', 'movetospace', '2015-09-22 23:40:32.105+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1185', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:32.105+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1186', '74', '11', 'movetocontainer', '2015-09-22 23:40:32.105+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1187', '74', '11', 'invoked', '2015-09-22 23:40:32.105+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1188', '74', '11', 'moving', '2015-09-22 23:40:32.106+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1189', '74', '11', 'prepareinvokinginspace', '2015-09-22 23:40:32.109+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1190', '74', '11', 'prepareinvoking', '2015-09-22 23:40:32.11+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1191', '74', '11', 'invoked', '2015-09-22 23:40:32.11+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1192', '74', '11', 'invokinginspace', '2015-09-22 23:40:32.11+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1193', '74', '11', 'prepareinvoking', '2015-09-22 23:40:33.448+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1194', '74', '11', 'preparemoveupfront', '2015-09-22 23:40:33.449+06', 't', '0', '1', '{2}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1195', '74', '11', 'moveupfront', '2015-09-22 23:40:33.45+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1196', '74', '11', 'moving', '2015-09-22 23:40:33.451+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1197', '74', '11', 'prepareinvoking', '2015-09-22 23:40:33.453+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1198', '74', '11', 'preparemovetospace', '2015-09-22 23:40:33.453+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1199', '74', '11', 'movetospace', '2015-09-22 23:40:33.453+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1200', '74', '11', 'preparemovetocontainer', '2015-09-22 23:40:33.453+06', 't', '0', '1', '{}', '{}', '{5}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1201', '74', '11', 'movetocontainer', '2015-09-22 23:40:33.453+06', 't', '0', '1', '{1}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1202', '74', '11', 'invoked', '2015-09-22 23:40:33.454+06', 't', '0', '1', '{1}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1203', '74', '11', 'moving', '2015-09-22 23:40:33.455+06', 't', '0', '1', '{1}', '{}', '{5}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1204', '74', '11', 'end', '2015-09-22 23:40:33.456+06', 't', '0', '1', '{1}', '{}', '{5}', 't', 't', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1205', '76', '11', 'start', '2015-09-23 00:01:33.526+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1206', '76', '11', 'moving', '2015-09-23 00:01:33.544+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1207', '76', '11', 'prepareinvoking', '2015-09-23 00:01:33.677+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1208', '76', '11', 'preparemovetospace', '2015-09-23 00:01:33.797+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1209', '76', '11', 'movetospace', '2015-09-23 00:01:33.797+06', 't', '0', '1', '{}', '{}', '{7}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1210', '76', '11', 'preparemovetocontainer', '2015-09-23 00:01:33.797+06', 't', '0', '1', '{}', '{}', '{7}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1211', '76', '11', 'movetocontainer', '2015-09-23 00:01:33.812+06', 't', '0', '1', '{2}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1212', '76', '11', 'invoked', '2015-09-23 00:01:33.812+06', 't', '0', '1', '{2}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1213', '76', '11', 'moving', '2015-09-23 00:01:33.818+06', 't', '0', '1', '{2}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1214', '76', '11', 'prepareinvokinginspace', '2015-09-23 00:01:33.881+06', 't', '0', '1', '{2}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1215', '76', '11', 'prepareinvoking', '2015-09-23 00:01:33.884+06', 't', '0', '1', '{2}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1216', '76', '11', 'invoked', '2015-09-23 00:01:33.891+06', 't', '0', '1', '{2}', '{}', '{7}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1217', '76', '11', 'invokinginspace', '2015-09-23 00:01:33.892+06', 't', '0', '1', '{2}', '{}', '{7}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1218', '76', '11', 'prepareinvoking', '2015-09-23 00:01:33.926+06', 't', '0', '1', '{2}', '{}', '{7}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1219', '76', '11', 'moving', '2015-09-23 00:01:34.018+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1220', '76', '11', 'paused', '2015-09-23 00:01:34.018+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1221', '76', '11', 'moving', '2015-09-23 00:01:34.019+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1222', '76', '11', 'paused', '2015-09-23 00:01:34.019+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1223', '76', '11', 'start', '2015-09-23 00:05:12.709+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1224', '76', '11', 'moving', '2015-09-23 00:05:12.719+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1225', '76', '11', 'prepareinvoking', '2015-09-23 00:05:12.72+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1226', '76', '11', 'preparemovetospace', '2015-09-23 00:05:12.724+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1227', '76', '11', 'movetospace', '2015-09-23 00:05:12.724+06', 't', '0', '1', '{}', '{}', '{7}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1228', '76', '11', 'preparemovetocontainer', '2015-09-23 00:05:12.724+06', 't', '0', '1', '{}', '{}', '{7}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1229', '76', '11', 'movetocontainer', '2015-09-23 00:05:12.724+06', 't', '0', '1', '{3}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1230', '76', '11', 'invoked', '2015-09-23 00:05:12.724+06', 't', '0', '1', '{3}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1231', '76', '11', 'moving', '2015-09-23 00:05:12.725+06', 't', '0', '1', '{3}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1232', '76', '11', 'prepareinvokinginspace', '2015-09-23 00:05:12.728+06', 't', '0', '1', '{3}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1233', '76', '11', 'prepareinvoking', '2015-09-23 00:05:12.729+06', 't', '0', '1', '{3}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1234', '76', '11', 'invoked', '2015-09-23 00:05:12.731+06', 't', '0', '1', '{3}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1235', '76', '11', 'invokinginspace', '2015-09-23 00:05:12.732+06', 't', '0', '1', '{3}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1236', '76', '11', 'prepareinvoking', '2015-09-23 00:05:12.734+06', 't', '0', '1', '{3}', '{}', '{7}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1237', '76', '11', 'moving', '2015-09-23 00:05:12.738+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1238', '76', '11', 'end', '2015-09-23 00:05:12.739+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1239', '76', '11', 'moving', '2015-09-23 00:05:12.769+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1240', '76', '11', 'end', '2015-09-23 00:05:12.771+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1241', '77', '11', 'start', '2015-09-23 00:16:16.273+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1242', '77', '11', 'moving', '2015-09-23 00:16:16.275+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1243', '77', '11', 'prepareinvoking', '2015-09-23 00:16:16.287+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1244', '77', '11', 'preparemovetospace', '2015-09-23 00:16:16.288+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1245', '77', '11', 'movetospace', '2015-09-23 00:16:16.288+06', 't', '0', '1', '{}', '{}', '{8}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1246', '77', '11', 'preparemovetocontainer', '2015-09-23 00:16:16.288+06', 't', '0', '1', '{}', '{}', '{8}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1247', '77', '11', 'movetocontainer', '2015-09-23 00:16:16.288+06', 't', '0', '1', '{2}', '{}', '{8}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1248', '77', '11', 'invoked', '2015-09-23 00:16:16.288+06', 't', '0', '1', '{2}', '{}', '{8}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1249', '77', '11', 'moving', '2015-09-23 00:16:16.289+06', 't', '0', '1', '{2}', '{}', '{8}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1250', '77', '11', 'prepareinvokinginspace', '2015-09-23 00:16:16.292+06', 't', '0', '1', '{2}', '{}', '{8}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1251', '77', '11', 'prepareinvoking', '2015-09-23 00:16:16.294+06', 't', '0', '1', '{2}', '{}', '{8}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1252', '77', '11', 'invoked', '2015-09-23 00:16:16.295+06', 't', '0', '1', '{2}', '{}', '{8}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1253', '77', '11', 'invokinginspace', '2015-09-23 00:16:16.296+06', 't', '0', '1', '{2}', '{}', '{8}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1254', '77', '11', 'prepareinvoking', '2015-09-23 00:16:16.304+06', 't', '0', '1', '{2}', '{}', '{8}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1255', '77', '11', 'moving', '2015-09-23 00:16:16.318+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1256', '77', '11', 'paused', '2015-09-23 00:16:16.319+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1257', '77', '11', 'moving', '2015-09-23 00:16:16.32+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1258', '77', '11', 'paused', '2015-09-23 00:16:16.32+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1259', '78', '11', 'start', '2015-09-23 20:53:12.276+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1260', '78', '11', 'moving', '2015-09-23 20:53:12.295+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1261', '78', '11', 'prepareinvoking', '2015-09-23 20:53:12.488+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1262', '78', '11', 'preparemovetospace', '2015-09-23 20:53:12.562+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1263', '78', '11', 'movetospace', '2015-09-23 20:53:12.563+06', 't', '0', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1264', '78', '11', 'preparemovetocontainer', '2015-09-23 20:53:12.563+06', 't', '0', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1265', '78', '11', 'movetocontainer', '2015-09-23 20:53:12.573+06', 't', '0', '1', '{2}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1266', '78', '11', 'invoked', '2015-09-23 20:53:12.573+06', 't', '0', '1', '{2}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1267', '78', '11', 'moving', '2015-09-23 20:53:12.575+06', 't', '0', '1', '{2}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1268', '78', '11', 'prepareinvokinginspace', '2015-09-23 20:53:12.599+06', 't', '0', '1', '{2}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1269', '78', '11', 'prepareinvoking', '2015-09-23 20:53:12.604+06', 't', '0', '1', '{2}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1270', '78', '11', 'invoked', '2015-09-23 20:53:12.605+06', 't', '0', '1', '{2}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1271', '78', '11', 'invokinginspace', '2015-09-23 20:53:12.606+06', 't', '0', '1', '{2}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1272', '78', '11', 'prepareinvoking', '2015-09-23 20:53:12.639+06', 't', '0', '1', '{2}', '{}', '{9}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1273', '78', '11', 'moving', '2015-09-23 20:53:12.706+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1274', '78', '11', 'paused', '2015-09-23 20:53:12.707+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1275', '78', '11', 'moving', '2015-09-23 20:53:12.709+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1276', '78', '11', 'paused', '2015-09-23 20:53:12.709+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1277', '78', '11', 'start', '2015-09-23 20:54:11.648+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1278', '78', '11', 'moving', '2015-09-23 20:54:11.649+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1279', '78', '11', 'prepareinvoking', '2015-09-23 20:54:11.65+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1280', '78', '11', 'preparemovetospace', '2015-09-23 20:54:11.651+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1281', '78', '11', 'movetospace', '2015-09-23 20:54:11.651+06', 't', '0', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1282', '78', '11', 'preparemovetocontainer', '2015-09-23 20:54:11.651+06', 't', '0', '1', '{}', '{}', '{9}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1283', '78', '11', 'movetocontainer', '2015-09-23 20:54:11.651+06', 't', '0', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1284', '78', '11', 'invoked', '2015-09-23 20:54:11.651+06', 't', '0', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1285', '78', '11', 'moving', '2015-09-23 20:54:11.652+06', 't', '0', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1286', '78', '11', 'prepareinvokinginspace', '2015-09-23 20:54:11.655+06', 't', '0', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1287', '78', '11', 'prepareinvoking', '2015-09-23 20:54:11.657+06', 't', '0', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1288', '78', '11', 'invoked', '2015-09-23 20:54:11.659+06', 't', '0', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1289', '78', '11', 'invokinginspace', '2015-09-23 20:54:11.659+06', 't', '0', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1290', '78', '11', 'prepareinvoking', '2015-09-23 20:54:11.66+06', 't', '0', '1', '{3}', '{}', '{9}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1291', '78', '11', 'moving', '2015-09-23 20:54:11.663+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1292', '78', '11', 'end', '2015-09-23 20:54:11.665+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1293', '78', '11', 'moving', '2015-09-23 20:54:11.666+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1294', '78', '11', 'end', '2015-09-23 20:54:11.667+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1295', '79', '10', 'start', '2015-09-23 23:22:35.357+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1296', '79', '10', 'moving', '2015-09-23 23:22:35.38+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1297', '79', '10', 'prepareinvoking', '2015-09-23 23:22:35.721+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1298', '79', '10', 'invoked', '2015-09-23 23:22:36.281+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1299', '79', '10', 'moving', '2015-09-23 23:22:36.284+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1300', '79', '10', 'paused', '2015-09-23 23:22:36.284+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1301', '79', '10', 'start', '2015-09-23 23:23:31.73+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1302', '79', '10', 'moving', '2015-09-23 23:23:31.731+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1303', '79', '10', 'prepareinvoking', '2015-09-23 23:23:31.733+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1304', '79', '10', 'invoked', '2015-09-23 23:23:31.735+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1305', '79', '10', 'moving', '2015-09-23 23:23:31.736+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1306', '79', '10', 'end', '2015-09-23 23:23:31.737+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1307', '80', '10', 'start', '2015-09-24 00:50:09.036+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1308', '80', '10', 'moving', '2015-09-24 00:50:09.079+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1309', '80', '10', 'prepareinvoking', '2015-09-24 00:50:09.427+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1310', '80', '10', 'invoked', '2015-09-24 00:50:09.642+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1311', '80', '10', 'moving', '2015-09-24 00:50:09.643+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1312', '80', '10', 'paused', '2015-09-24 00:50:09.643+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1313', '80', '10', 'start', '2015-09-24 00:53:19.551+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1314', '80', '10', 'moving', '2015-09-24 00:53:19.553+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1315', '80', '10', 'prepareinvoking', '2015-09-24 00:53:19.555+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1316', '80', '10', 'invoked', '2015-09-24 00:53:19.557+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1317', '80', '10', 'moving', '2015-09-24 00:53:19.558+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1318', '80', '10', 'end', '2015-09-24 00:53:19.559+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1319', '81', '10', 'start', '2015-09-24 01:04:57.837+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1320', '81', '10', 'moving', '2015-09-24 01:04:57.857+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1321', '81', '10', 'prepareinvoking', '2015-09-24 01:04:57.974+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1322', '81', '10', 'invoked', '2015-09-24 01:04:58.062+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1323', '81', '10', 'moving', '2015-09-24 01:04:58.064+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1324', '81', '10', 'paused', '2015-09-24 01:04:58.064+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1325', '81', '10', 'start', '2015-09-24 01:05:32.544+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1326', '81', '10', 'moving', '2015-09-24 01:05:32.546+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1327', '81', '10', 'prepareinvoking', '2015-09-24 01:05:32.548+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1328', '81', '10', 'invoked', '2015-09-24 01:05:32.557+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1329', '81', '10', 'moving', '2015-09-24 01:05:32.558+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1330', '81', '10', 'end', '2015-09-24 01:05:32.558+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1331', '82', '10', 'start', '2015-09-24 01:08:27.386+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1332', '82', '10', 'moving', '2015-09-24 01:08:27.415+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1333', '82', '10', 'prepareinvoking', '2015-09-24 01:08:27.662+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1334', '82', '10', 'invoked', '2015-09-24 01:08:27.92+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1335', '82', '10', 'moving', '2015-09-24 01:08:27.926+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1336', '82', '10', 'paused', '2015-09-24 01:08:27.926+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1337', '82', '10', 'start', '2015-09-24 01:08:56.176+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1338', '82', '10', 'moving', '2015-09-24 01:08:56.182+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1339', '82', '10', 'prepareinvoking', '2015-09-24 01:08:56.19+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1340', '82', '10', 'invoked', '2015-09-24 01:08:56.192+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1341', '82', '10', 'moving', '2015-09-24 01:08:56.193+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1342', '82', '10', 'end', '2015-09-24 01:08:56.194+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1343', '83', '11', 'start', '2015-09-30 16:14:03.9+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1344', '83', '11', 'moving', '2015-09-30 16:14:03.922+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1345', '83', '11', 'prepareinvoking', '2015-09-30 16:14:04.181+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1346', '83', '11', 'preparemovetospace', '2015-09-30 16:14:04.326+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1347', '83', '11', 'movetospace', '2015-09-30 16:14:04.326+06', 't', '0', '1', '{}', '{}', '{10}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1348', '83', '11', 'preparemovetocontainer', '2015-09-30 16:14:04.326+06', 't', '0', '1', '{}', '{}', '{10}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1349', '83', '11', 'movetocontainer', '2015-09-30 16:14:04.336+06', 't', '0', '1', '{2}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1350', '83', '11', 'invoked', '2015-09-30 16:14:04.337+06', 't', '0', '1', '{2}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1351', '83', '11', 'moving', '2015-09-30 16:14:04.341+06', 't', '0', '1', '{2}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1352', '83', '11', 'prepareinvokinginspace', '2015-09-30 16:14:04.527+06', 't', '0', '1', '{2}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1353', '83', '11', 'prepareinvoking', '2015-09-30 16:14:04.531+06', 't', '0', '1', '{2}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1354', '83', '11', 'invoked', '2015-09-30 16:14:04.532+06', 't', '0', '1', '{2}', '{}', '{10}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1355', '83', '11', 'invokinginspace', '2015-09-30 16:14:04.532+06', 't', '0', '1', '{2}', '{}', '{10}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1356', '83', '11', 'prepareinvoking', '2015-09-30 16:14:04.687+06', 't', '0', '1', '{2}', '{}', '{10}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1357', '83', '11', 'moving', '2015-09-30 16:14:04.953+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1358', '83', '11', 'paused', '2015-09-30 16:14:04.954+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1359', '83', '11', 'moving', '2015-09-30 16:14:05.035+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1360', '83', '11', 'paused', '2015-09-30 16:14:05.038+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1361', '84', '14', 'start', '2015-10-10 23:33:11.777+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1362', '84', '14', 'moving', '2015-10-10 23:33:11.806+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1363', '84', '14', 'prepareinvoking', '2015-10-10 23:33:12.275+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1364', '84', '14', 'invoked', '2015-10-10 23:33:12.476+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1365', '84', '14', 'moving', '2015-10-10 23:33:12.488+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1366', '84', '14', 'paused', '2015-10-10 23:33:12.488+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1367', '84', '14', 'start', '2015-10-10 23:40:16.57+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1368', '84', '14', 'moving', '2015-10-10 23:40:16.573+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1369', '84', '14', 'prepareinvoking', '2015-10-10 23:40:16.597+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1370', '84', '14', 'invoked', '2015-10-10 23:40:16.599+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1371', '84', '14', 'moving', '2015-10-10 23:40:16.6+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1372', '84', '14', 'prepareinvoking', '2015-10-10 23:40:16.603+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1373', '84', '14', 'preparemovetospace', '2015-10-10 23:40:16.646+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1374', '84', '14', 'movetospace', '2015-10-10 23:40:16.646+06', 't', '1', '1', '{}', '{}', '{11}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1375', '84', '14', 'preparemovetocontainer', '2015-10-10 23:40:16.646+06', 't', '1', '1', '{}', '{}', '{11}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1376', '84', '14', 'movetocontainer', '2015-10-10 23:40:16.691+06', 't', '1', '1', '{2}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1377', '84', '14', 'invoked', '2015-10-10 23:40:16.691+06', 't', '1', '1', '{2}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1378', '84', '14', 'moving', '2015-10-10 23:40:16.692+06', 't', '1', '1', '{2}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1379', '84', '14', 'prepareinvokinginspace', '2015-10-10 23:40:16.87+06', 't', '1', '1', '{2}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1380', '84', '14', 'prepareinvoking', '2015-10-10 23:40:16.872+06', 't', '1', '1', '{2}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1381', '84', '14', 'invoked', '2015-10-10 23:40:16.873+06', 't', '1', '1', '{2}', '{}', '{11}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1382', '84', '14', 'invokinginspace', '2015-10-10 23:40:16.874+06', 't', '1', '1', '{2}', '{}', '{11}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1383', '84', '14', 'prepareinvoking', '2015-10-10 23:40:17.358+06', 't', '1', '1', '{2}', '{}', '{11}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1384', '84', '14', 'moving', '2015-10-10 23:40:17.452+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1385', '84', '14', 'paused', '2015-10-10 23:40:17.452+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1386', '84', '14', 'moving', '2015-10-10 23:40:17.453+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1387', '84', '14', 'paused', '2015-10-10 23:40:17.453+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1388', '84', '14', 'start', '2015-10-10 23:41:07.959+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1389', '84', '14', 'moving', '2015-10-10 23:41:07.96+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1390', '84', '14', 'prepareinvoking', '2015-10-10 23:41:07.964+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1391', '84', '14', 'invoked', '2015-10-10 23:41:07.965+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1392', '84', '14', 'moving', '2015-10-10 23:41:07.966+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1393', '84', '14', 'prepareinvoking', '2015-10-10 23:41:07.967+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1394', '84', '14', 'preparemovetospace', '2015-10-10 23:41:07.968+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1395', '84', '14', 'movetospace', '2015-10-10 23:41:07.968+06', 't', '1', '1', '{}', '{}', '{11}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1396', '84', '14', 'preparemovetocontainer', '2015-10-10 23:41:07.968+06', 't', '1', '1', '{}', '{}', '{11}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1397', '84', '14', 'movetocontainer', '2015-10-10 23:41:07.968+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1398', '84', '14', 'invoked', '2015-10-10 23:41:07.968+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1399', '84', '14', 'moving', '2015-10-10 23:41:07.969+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1400', '84', '14', 'prepareinvokinginspace', '2015-10-10 23:41:07.972+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1401', '84', '14', 'prepareinvoking', '2015-10-10 23:41:07.986+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1402', '84', '14', 'invoked', '2015-10-10 23:41:07.988+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1403', '84', '14', 'invokinginspace', '2015-10-10 23:41:07.989+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1404', '84', '14', 'prepareinvoking', '2015-10-10 23:41:07.99+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1405', '84', '14', 'moving', '2015-10-10 23:41:07.998+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1406', '84', '14', 'prepareinvoking', '2015-10-10 23:41:08.006+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1407', '84', '14', 'invoked', '2015-10-10 23:41:08.012+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1408', '84', '14', 'moving', '2015-10-10 23:41:08.025+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1409', '84', '14', 'paused', '2015-10-10 23:41:08.026+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1410', '84', '14', 'moving', '2015-10-10 23:41:08.028+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1411', '84', '14', 'paused', '2015-10-10 23:41:08.028+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1412', '84', '14', 'start', '2015-10-10 23:41:43.287+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1413', '84', '14', 'moving', '2015-10-10 23:41:43.288+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1414', '84', '14', 'prepareinvoking', '2015-10-10 23:41:43.29+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1415', '84', '14', 'invoked', '2015-10-10 23:41:43.291+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1416', '84', '14', 'moving', '2015-10-10 23:41:43.292+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1417', '84', '14', 'prepareinvoking', '2015-10-10 23:41:43.295+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1418', '84', '14', 'preparemovetospace', '2015-10-10 23:41:43.296+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1419', '84', '14', 'movetospace', '2015-10-10 23:41:43.296+06', 't', '1', '1', '{}', '{}', '{11}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1420', '84', '14', 'preparemovetocontainer', '2015-10-10 23:41:43.296+06', 't', '1', '1', '{}', '{}', '{11}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1421', '84', '14', 'movetocontainer', '2015-10-10 23:41:43.296+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1422', '84', '14', 'invoked', '2015-10-10 23:41:43.296+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1423', '84', '14', 'moving', '2015-10-10 23:41:43.297+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1424', '84', '14', 'prepareinvokinginspace', '2015-10-10 23:41:43.339+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1425', '84', '14', 'prepareinvoking', '2015-10-10 23:41:43.342+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1426', '84', '14', 'invoked', '2015-10-10 23:41:43.344+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1427', '84', '14', 'invokinginspace', '2015-10-10 23:41:43.344+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1428', '84', '14', 'prepareinvoking', '2015-10-10 23:41:43.348+06', 't', '1', '1', '{3}', '{}', '{11}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1429', '84', '14', 'moving', '2015-10-10 23:41:43.35+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1430', '84', '14', 'prepareinvoking', '2015-10-10 23:41:43.355+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1431', '84', '14', 'invoked', '2015-10-10 23:41:43.356+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1432', '84', '14', 'moving', '2015-10-10 23:41:43.356+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1433', '84', '14', 'end', '2015-10-10 23:41:43.357+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1434', '84', '14', 'moving', '2015-10-10 23:41:43.358+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1435', '84', '14', 'end', '2015-10-10 23:41:43.359+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1436', '85', '15', 'start', '2015-10-11 14:36:38.097+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1437', '85', '15', 'moving', '2015-10-11 14:36:38.137+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1438', '85', '15', 'prepareinvoking', '2015-10-11 14:36:38.329+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1439', '85', '15', 'invoked', '2015-10-11 14:36:38.421+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1440', '85', '15', 'moving', '2015-10-11 14:36:38.423+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1441', '85', '15', 'paused', '2015-10-11 14:36:38.423+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1442', '85', '15', 'start', '2015-10-11 14:37:06.56+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1443', '85', '15', 'moving', '2015-10-11 14:37:06.561+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1444', '85', '15', 'prepareinvoking', '2015-10-11 14:37:06.564+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1445', '85', '15', 'invoked', '2015-10-11 14:37:06.57+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1446', '85', '15', 'moving', '2015-10-11 14:37:06.571+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1447', '85', '15', 'prepareinvoking', '2015-10-11 14:37:06.573+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1448', '85', '15', 'preparemovetospace', '2015-10-11 14:37:06.622+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1449', '85', '15', 'movetospace', '2015-10-11 14:37:06.622+06', 't', '1', '1', '{}', '{}', '{12}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1450', '85', '15', 'preparemovetocontainer', '2015-10-11 14:37:06.622+06', 't', '1', '1', '{}', '{}', '{12}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1451', '85', '15', 'movetocontainer', '2015-10-11 14:37:06.646+06', 't', '1', '1', '{2}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1452', '85', '15', 'invoked', '2015-10-11 14:37:06.646+06', 't', '1', '1', '{2}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1453', '85', '15', 'moving', '2015-10-11 14:37:06.649+06', 't', '1', '1', '{2}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1454', '85', '15', 'prepareinvokinginspace', '2015-10-11 14:37:06.733+06', 't', '1', '1', '{2}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1455', '85', '15', 'prepareinvoking', '2015-10-11 14:37:06.736+06', 't', '1', '1', '{2}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1456', '85', '15', 'invoked', '2015-10-11 14:37:06.74+06', 't', '1', '1', '{2}', '{}', '{12}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1457', '85', '15', 'invokinginspace', '2015-10-11 14:37:06.74+06', 't', '1', '1', '{2}', '{}', '{12}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1458', '85', '15', 'prepareinvoking', '2015-10-11 14:37:06.793+06', 't', '1', '1', '{2}', '{}', '{12}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1459', '85', '15', 'moving', '2015-10-11 14:37:06.929+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1460', '85', '15', 'paused', '2015-10-11 14:37:06.93+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1461', '85', '15', 'moving', '2015-10-11 14:37:06.931+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1462', '85', '15', 'paused', '2015-10-11 14:37:06.931+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1463', '85', '15', 'start', '2015-10-11 14:37:33.85+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1464', '85', '15', 'moving', '2015-10-11 14:37:33.851+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1465', '85', '15', 'prepareinvoking', '2015-10-11 14:37:33.853+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1466', '85', '15', 'invoked', '2015-10-11 14:37:33.855+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1467', '85', '15', 'moving', '2015-10-11 14:37:33.856+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1468', '85', '15', 'prepareinvoking', '2015-10-11 14:37:33.857+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1469', '85', '15', 'preparemovetospace', '2015-10-11 14:37:33.858+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1470', '85', '15', 'movetospace', '2015-10-11 14:37:33.858+06', 't', '1', '1', '{}', '{}', '{12}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1471', '85', '15', 'preparemovetocontainer', '2015-10-11 14:37:33.858+06', 't', '1', '1', '{}', '{}', '{12}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1472', '85', '15', 'movetocontainer', '2015-10-11 14:37:33.858+06', 't', '1', '1', '{3}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1473', '85', '15', 'invoked', '2015-10-11 14:37:33.858+06', 't', '1', '1', '{3}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1474', '85', '15', 'moving', '2015-10-11 14:37:33.859+06', 't', '1', '1', '{3}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1475', '85', '15', 'prepareinvokinginspace', '2015-10-11 14:37:33.865+06', 't', '1', '1', '{3}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1476', '85', '15', 'prepareinvoking', '2015-10-11 14:37:33.867+06', 't', '1', '1', '{3}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1477', '85', '15', 'invoked', '2015-10-11 14:37:33.869+06', 't', '1', '1', '{3}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1478', '85', '15', 'invokinginspace', '2015-10-11 14:37:33.87+06', 't', '1', '1', '{3}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1479', '85', '15', 'prepareinvoking', '2015-10-11 14:37:33.872+06', 't', '1', '1', '{3}', '{}', '{12}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1480', '85', '15', 'moving', '2015-10-11 14:37:33.933+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1481', '85', '15', 'prepareinvoking', '2015-10-11 14:37:33.936+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1482', '85', '15', 'preparemovetospace', '2015-10-11 14:37:33.937+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1483', '85', '15', 'movetospace', '2015-10-11 14:37:33.937+06', 't', '2', '1', '{}', '{}', '{13}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1484', '85', '15', 'preparemovetocontainer', '2015-10-11 14:37:33.937+06', 't', '2', '1', '{}', '{}', '{13}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1485', '85', '15', 'movetocontainer', '2015-10-11 14:37:33.937+06', 't', '2', '1', '{1}', '{}', '{13}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1486', '85', '15', 'invoked', '2015-10-11 14:37:33.937+06', 't', '2', '1', '{1}', '{}', '{13}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1487', '85', '15', 'moving', '2015-10-11 14:37:33.938+06', 't', '2', '1', '{1}', '{}', '{13}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1488', '85', '15', 'prepareinvoking', '2015-10-11 14:37:33.942+06', 't', '2', '1', '{1}', '{}', '{13}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1489', '85', '15', 'moving', '2015-10-11 14:37:33.946+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1490', '85', '15', 'end', '2015-10-11 14:37:33.947+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1491', '85', '15', 'moving', '2015-10-11 14:37:33.952+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1492', '85', '15', 'end', '2015-10-11 14:37:33.953+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1493', '85', '15', 'moving', '2015-10-11 14:37:33.954+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1494', '85', '15', 'end', '2015-10-11 14:37:33.955+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1495', '86', '15', 'start', '2015-10-11 14:39:12.87+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1496', '86', '15', 'moving', '2015-10-11 14:39:12.871+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1497', '86', '15', 'prepareinvoking', '2015-10-11 14:39:12.873+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1498', '86', '15', 'invoked', '2015-10-11 14:39:12.874+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1499', '86', '15', 'moving', '2015-10-11 14:39:12.875+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1500', '86', '15', 'paused', '2015-10-11 14:39:12.875+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1501', '86', '15', 'start', '2015-10-11 14:39:48.222+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1502', '86', '15', 'moving', '2015-10-11 14:39:48.222+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1503', '86', '15', 'prepareinvoking', '2015-10-11 14:39:48.224+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1504', '86', '15', 'invoked', '2015-10-11 14:39:48.225+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1505', '86', '15', 'moving', '2015-10-11 14:39:48.226+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1506', '86', '15', 'prepareinvoking', '2015-10-11 14:39:48.228+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1507', '86', '15', 'preparemovetospace', '2015-10-11 14:39:48.229+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1508', '86', '15', 'movetospace', '2015-10-11 14:39:48.229+06', 't', '1', '1', '{}', '{}', '{14}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1509', '86', '15', 'preparemovetocontainer', '2015-10-11 14:39:48.229+06', 't', '1', '1', '{}', '{}', '{14}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1510', '86', '15', 'movetocontainer', '2015-10-11 14:39:48.229+06', 't', '1', '1', '{2}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1511', '86', '15', 'invoked', '2015-10-11 14:39:48.229+06', 't', '1', '1', '{2}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1512', '86', '15', 'moving', '2015-10-11 14:39:48.23+06', 't', '1', '1', '{2}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1513', '86', '15', 'prepareinvokinginspace', '2015-10-11 14:39:48.235+06', 't', '1', '1', '{2}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1514', '86', '15', 'prepareinvoking', '2015-10-11 14:39:48.308+06', 't', '1', '1', '{2}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1515', '86', '15', 'invoked', '2015-10-11 14:39:48.309+06', 't', '1', '1', '{2}', '{}', '{14}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1516', '86', '15', 'invokinginspace', '2015-10-11 14:39:48.309+06', 't', '1', '1', '{2}', '{}', '{14}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1517', '86', '15', 'prepareinvoking', '2015-10-11 14:39:48.314+06', 't', '1', '1', '{2}', '{}', '{14}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1518', '86', '15', 'moving', '2015-10-11 14:39:48.316+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1519', '86', '15', 'paused', '2015-10-11 14:39:48.316+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1520', '86', '15', 'moving', '2015-10-11 14:39:48.318+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1521', '86', '15', 'paused', '2015-10-11 14:39:48.318+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1522', '86', '15', 'start', '2015-10-11 14:40:29.918+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1523', '86', '15', 'moving', '2015-10-11 14:40:29.919+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1524', '86', '15', 'prepareinvoking', '2015-10-11 14:40:29.921+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1525', '86', '15', 'invoked', '2015-10-11 14:40:29.922+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1526', '86', '15', 'moving', '2015-10-11 14:40:29.922+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1527', '86', '15', 'prepareinvoking', '2015-10-11 14:40:29.924+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1528', '86', '15', 'preparemovetospace', '2015-10-11 14:40:29.925+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1529', '86', '15', 'movetospace', '2015-10-11 14:40:29.925+06', 't', '1', '1', '{}', '{}', '{14}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1530', '86', '15', 'preparemovetocontainer', '2015-10-11 14:40:29.925+06', 't', '1', '1', '{}', '{}', '{14}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1531', '86', '15', 'movetocontainer', '2015-10-11 14:40:29.925+06', 't', '1', '1', '{3}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1532', '86', '15', 'invoked', '2015-10-11 14:40:29.925+06', 't', '1', '1', '{3}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1533', '86', '15', 'moving', '2015-10-11 14:40:29.925+06', 't', '1', '1', '{3}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1534', '86', '15', 'prepareinvokinginspace', '2015-10-11 14:40:29.929+06', 't', '1', '1', '{3}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1535', '86', '15', 'prepareinvoking', '2015-10-11 14:40:29.931+06', 't', '1', '1', '{3}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1536', '86', '15', 'invoked', '2015-10-11 14:40:29.932+06', 't', '1', '1', '{3}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1537', '86', '15', 'invokinginspace', '2015-10-11 14:40:29.933+06', 't', '1', '1', '{3}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1538', '86', '15', 'prepareinvoking', '2015-10-11 14:40:29.934+06', 't', '1', '1', '{3}', '{}', '{14}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1539', '86', '15', 'moving', '2015-10-11 14:40:29.936+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1540', '86', '15', 'prepareinvoking', '2015-10-11 14:40:29.938+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1541', '86', '15', 'preparemovetospace', '2015-10-11 14:40:29.939+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1542', '86', '15', 'movetospace', '2015-10-11 14:40:29.939+06', 't', '2', '1', '{}', '{}', '{15}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1543', '86', '15', 'preparemovetocontainer', '2015-10-11 14:40:29.939+06', 't', '2', '1', '{}', '{}', '{15}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1544', '86', '15', 'movetocontainer', '2015-10-11 14:40:29.939+06', 't', '2', '1', '{1}', '{}', '{15}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1545', '86', '15', 'invoked', '2015-10-11 14:40:29.939+06', 't', '2', '1', '{1}', '{}', '{15}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1546', '86', '15', 'moving', '2015-10-11 14:40:29.94+06', 't', '2', '1', '{1}', '{}', '{15}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1547', '86', '15', 'prepareinvoking', '2015-10-11 14:40:30.18+06', 't', '2', '1', '{1}', '{}', '{15}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1548', '86', '15', 'moving', '2015-10-11 14:40:30.184+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1549', '86', '15', 'end', '2015-10-11 14:40:30.185+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1550', '86', '15', 'moving', '2015-10-11 14:40:30.186+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1551', '86', '15', 'end', '2015-10-11 14:40:30.186+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1552', '86', '15', 'moving', '2015-10-11 14:40:30.187+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1553', '86', '15', 'end', '2015-10-11 14:40:30.188+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1554', '87', '14', 'start', '2015-10-11 14:41:09.43+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1555', '87', '14', 'moving', '2015-10-11 14:41:09.431+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1556', '87', '14', 'prepareinvoking', '2015-10-11 14:41:09.433+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1557', '87', '14', 'invoked', '2015-10-11 14:41:09.434+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1558', '87', '14', 'moving', '2015-10-11 14:41:09.435+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1559', '87', '14', 'paused', '2015-10-11 14:41:09.435+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1560', '88', '14', 'start', '2015-10-11 14:41:10.17+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1561', '88', '14', 'moving', '2015-10-11 14:41:10.171+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1562', '88', '14', 'prepareinvoking', '2015-10-11 14:41:10.173+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1563', '88', '14', 'invoked', '2015-10-11 14:41:10.175+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1564', '88', '14', 'moving', '2015-10-11 14:41:10.176+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1565', '88', '14', 'paused', '2015-10-11 14:41:10.176+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1566', '89', '16', 'start', '2015-10-11 16:46:21.717+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1567', '89', '16', 'moving', '2015-10-11 16:46:21.762+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1568', '89', '16', 'prepareinvoking', '2015-10-11 16:46:22.455+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1569', '89', '16', 'invoked', '2015-10-11 16:46:22.57+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1570', '89', '16', 'moving', '2015-10-11 16:46:22.572+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1571', '89', '16', 'prepareinvoking', '2015-10-11 16:46:22.576+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1572', '89', '16', 'preparemovetospace', '2015-10-11 16:46:22.6+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1573', '89', '16', 'movetospace', '2015-10-11 16:46:22.619+06', 't', '1', '1', '{}', '{}', '{18}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1574', '89', '16', 'preparemovetocontainer', '2015-10-11 16:46:22.619+06', 't', '1', '1', '{}', '{}', '{18}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1575', '89', '16', 'movetocontainer', '2015-10-11 16:46:22.975+06', 't', '1', '1', '{3}', '{}', '{18}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1576', '89', '16', 'invoked', '2015-10-11 16:46:22.977+06', 't', '1', '1', '{3}', '{}', '{18}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1577', '89', '16', 'moving', '2015-10-11 16:46:22.979+06', 't', '1', '1', '{3}', '{}', '{18}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1578', '89', '16', 'prepareinvokinginspace', '2015-10-11 16:46:23.369+06', 't', '1', '1', '{3}', '{}', '{18}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1579', '89', '16', 'prepareinvoking', '2015-10-11 16:46:23.37+06', 't', '1', '1', '{3}', '{}', '{18}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1580', '89', '16', 'invoked', '2015-10-11 16:46:23.372+06', 't', '1', '1', '{3}', '{}', '{18}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1581', '89', '16', 'invokinginspace', '2015-10-11 16:46:23.372+06', 't', '1', '1', '{3}', '{}', '{18}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1582', '89', '16', 'prepareinvoking', '2015-10-11 16:46:23.446+06', 't', '1', '1', '{3}', '{}', '{18}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1583', '89', '16', 'moving', '2015-10-11 16:46:24.134+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1584', '89', '16', 'prepareinvoking', '2015-10-11 16:46:24.158+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1585', '89', '16', 'invoked', '2015-10-11 16:46:24.159+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1586', '89', '16', 'moving', '2015-10-11 16:46:24.16+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1587', '89', '16', 'end', '2015-10-11 16:46:24.161+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1588', '89', '16', 'moving', '2015-10-11 16:46:24.162+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1589', '89', '16', 'end', '2015-10-11 16:46:24.163+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1590', '90', '16', 'start', '2015-10-11 16:53:59.087+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1591', '90', '16', 'moving', '2015-10-11 16:53:59.09+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1592', '90', '16', 'prepareinvoking', '2015-10-11 16:53:59.092+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1593', '90', '16', 'invoked', '2015-10-11 16:53:59.094+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1594', '90', '16', 'moving', '2015-10-11 16:53:59.096+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1595', '90', '16', 'prepareinvoking', '2015-10-11 16:53:59.098+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1596', '90', '16', 'preparemovetospace', '2015-10-11 16:53:59.099+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1597', '90', '16', 'movetospace', '2015-10-11 16:53:59.099+06', 't', '1', '1', '{}', '{}', '{19}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1598', '90', '16', 'preparemovetocontainer', '2015-10-11 16:53:59.099+06', 't', '1', '1', '{}', '{}', '{19}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1599', '90', '16', 'movetocontainer', '2015-10-11 16:53:59.1+06', 't', '1', '1', '{3}', '{}', '{19}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1600', '90', '16', 'invoked', '2015-10-11 16:53:59.1+06', 't', '1', '1', '{3}', '{}', '{19}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1601', '90', '16', 'moving', '2015-10-11 16:53:59.102+06', 't', '1', '1', '{3}', '{}', '{19}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1602', '90', '16', 'prepareinvokinginspace', '2015-10-11 16:53:59.108+06', 't', '1', '1', '{3}', '{}', '{19}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1603', '90', '16', 'prepareinvoking', '2015-10-11 16:53:59.111+06', 't', '1', '1', '{3}', '{}', '{19}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1604', '90', '16', 'invoked', '2015-10-11 16:53:59.113+06', 't', '1', '1', '{3}', '{}', '{19}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1605', '90', '16', 'invokinginspace', '2015-10-11 16:53:59.114+06', 't', '1', '1', '{3}', '{}', '{19}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1606', '90', '16', 'prepareinvoking', '2015-10-11 16:53:59.116+06', 't', '1', '1', '{3}', '{}', '{19}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1607', '90', '16', 'moving', '2015-10-11 16:53:59.121+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1608', '90', '16', 'prepareinvoking', '2015-10-11 16:53:59.125+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1609', '90', '16', 'invoked', '2015-10-11 16:53:59.128+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1610', '90', '16', 'moving', '2015-10-11 16:53:59.13+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1611', '90', '16', 'end', '2015-10-11 16:53:59.131+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1612', '90', '16', 'moving', '2015-10-11 16:53:59.133+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1613', '90', '16', 'end', '2015-10-11 16:53:59.135+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1614', '91', '16', 'start', '2015-10-11 16:58:21.783+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1615', '91', '16', 'moving', '2015-10-11 16:58:21.784+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1616', '91', '16', 'prepareinvoking', '2015-10-11 16:58:21.785+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1617', '91', '16', 'invoked', '2015-10-11 16:58:21.786+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1618', '91', '16', 'moving', '2015-10-11 16:58:21.787+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1619', '91', '16', 'prepareinvoking', '2015-10-11 16:58:21.789+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1620', '91', '16', 'preparemovetospace', '2015-10-11 16:58:31.172+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1621', '91', '16', 'movetospace', '2015-10-11 16:58:31.172+06', 't', '1', '1', '{}', '{}', '{20}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1622', '91', '16', 'preparemovetocontainer', '2015-10-11 16:58:31.172+06', 't', '1', '1', '{}', '{}', '{20}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1623', '91', '16', 'movetocontainer', '2015-10-11 16:58:31.172+06', 't', '1', '1', '{3}', '{}', '{20}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1624', '91', '16', 'invoked', '2015-10-11 16:58:31.173+06', 't', '1', '1', '{3}', '{}', '{20}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1625', '91', '16', 'moving', '2015-10-11 16:58:31.177+06', 't', '1', '1', '{3}', '{}', '{20}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1626', '91', '16', 'prepareinvokinginspace', '2015-10-11 16:58:31.186+06', 't', '1', '1', '{3}', '{}', '{20}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1627', '91', '16', 'prepareinvoking', '2015-10-11 16:58:31.192+06', 't', '1', '1', '{3}', '{}', '{20}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1628', '91', '16', 'invoked', '2015-10-11 16:58:31.193+06', 't', '1', '1', '{3}', '{}', '{20}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1629', '91', '16', 'invokinginspace', '2015-10-11 16:58:31.194+06', 't', '1', '1', '{3}', '{}', '{20}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1630', '91', '16', 'prepareinvoking', '2015-10-11 16:58:31.195+06', 't', '1', '1', '{3}', '{}', '{20}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1631', '91', '16', 'moving', '2015-10-11 16:58:31.197+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1632', '91', '16', 'prepareinvoking', '2015-10-11 16:58:31.2+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1633', '91', '16', 'invoked', '2015-10-11 16:58:31.205+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1634', '91', '16', 'moving', '2015-10-11 16:58:31.206+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1635', '91', '16', 'end', '2015-10-11 16:58:31.207+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1636', '91', '16', 'moving', '2015-10-11 16:58:31.207+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1637', '91', '16', 'end', '2015-10-11 16:58:31.208+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1638', '92', '16', 'start', '2015-10-11 17:01:05.92+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1639', '92', '16', 'moving', '2015-10-11 17:01:05.92+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1640', '92', '16', 'prepareinvoking', '2015-10-11 17:01:05.923+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1641', '92', '16', 'invoked', '2015-10-11 17:01:12.651+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1642', '92', '16', 'moving', '2015-10-11 17:01:12.656+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1643', '92', '16', 'prepareinvoking', '2015-10-11 17:01:12.657+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1644', '92', '16', 'preparemovetospace', '2015-10-11 17:01:20.697+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1645', '92', '16', 'movetospace', '2015-10-11 17:01:20.697+06', 't', '1', '1', '{}', '{}', '{21}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1646', '92', '16', 'preparemovetocontainer', '2015-10-11 17:01:20.697+06', 't', '1', '1', '{}', '{}', '{21}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1647', '92', '16', 'movetocontainer', '2015-10-11 17:01:20.698+06', 't', '1', '1', '{3}', '{}', '{21}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1648', '92', '16', 'invoked', '2015-10-11 17:01:20.7+06', 't', '1', '1', '{3}', '{}', '{21}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1649', '92', '16', 'moving', '2015-10-11 17:01:20.71+06', 't', '1', '1', '{3}', '{}', '{21}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1650', '92', '16', 'prepareinvokinginspace', '2015-10-11 17:01:20.714+06', 't', '1', '1', '{3}', '{}', '{21}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1651', '92', '16', 'prepareinvoking', '2015-10-11 17:01:20.715+06', 't', '1', '1', '{3}', '{}', '{21}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1652', '92', '16', 'invoked', '2015-10-11 17:01:23.633+06', 't', '1', '1', '{3}', '{}', '{21}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1653', '92', '16', 'invokinginspace', '2015-10-11 17:01:23.634+06', 't', '1', '1', '{3}', '{}', '{21}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1654', '92', '16', 'prepareinvoking', '2015-10-11 17:01:23.646+06', 't', '1', '1', '{3}', '{}', '{21}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1655', '92', '16', 'moving', '2015-10-11 17:01:30.357+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1656', '92', '16', 'prepareinvoking', '2015-10-11 17:01:30.36+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1657', '92', '16', 'invoked', '2015-10-11 17:01:32.396+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1658', '92', '16', 'moving', '2015-10-11 17:01:32.402+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1659', '92', '16', 'end', '2015-10-11 17:01:32.402+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1660', '92', '16', 'moving', '2015-10-11 17:01:32.403+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1661', '92', '16', 'end', '2015-10-11 17:01:32.403+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1662', '93', '16', 'start', '2015-10-11 17:09:50.6+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1663', '93', '16', 'moving', '2015-10-11 17:09:50.602+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1664', '93', '16', 'prepareinvoking', '2015-10-11 17:09:50.603+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1665', '93', '16', 'invoked', '2015-10-11 17:09:59.609+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1666', '93', '16', 'moving', '2015-10-11 17:09:59.615+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1667', '93', '16', 'prepareinvoking', '2015-10-11 17:09:59.619+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1668', '93', '16', 'preparemovetospace', '2015-10-11 17:10:04.868+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1669', '93', '16', 'movetospace', '2015-10-11 17:10:04.869+06', 't', '1', '1', '{}', '{}', '{22}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1670', '93', '16', 'preparemovetocontainer', '2015-10-11 17:10:04.869+06', 't', '1', '1', '{}', '{}', '{22}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1671', '93', '16', 'movetocontainer', '2015-10-11 17:10:04.869+06', 't', '1', '1', '{3}', '{}', '{22}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1672', '93', '16', 'invoked', '2015-10-11 17:10:04.87+06', 't', '1', '1', '{3}', '{}', '{22}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1673', '93', '16', 'moving', '2015-10-11 17:10:04.872+06', 't', '1', '1', '{3}', '{}', '{22}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1674', '93', '16', 'prepareinvokinginspace', '2015-10-11 17:10:04.876+06', 't', '1', '1', '{3}', '{}', '{22}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1675', '93', '16', 'prepareinvoking', '2015-10-11 17:10:04.878+06', 't', '1', '1', '{3}', '{}', '{22}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1676', '93', '16', 'invoked', '2015-10-11 17:10:07.129+06', 't', '1', '1', '{3}', '{}', '{22}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1677', '93', '16', 'invokinginspace', '2015-10-11 17:10:07.13+06', 't', '1', '1', '{3}', '{}', '{22}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1678', '93', '16', 'prepareinvoking', '2015-10-11 17:10:07.132+06', 't', '1', '1', '{3}', '{}', '{22}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1679', '93', '16', 'moving', '2015-10-11 17:12:09.127+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1680', '93', '16', 'prepareinvoking', '2015-10-11 17:12:09.128+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1681', '93', '16', 'invoked', '2015-10-11 17:12:16.215+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1682', '93', '16', 'moving', '2015-10-11 17:12:16.225+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1683', '93', '16', 'end', '2015-10-11 17:12:16.225+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1684', '93', '16', 'moving', '2015-10-11 17:12:16.226+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1685', '93', '16', 'end', '2015-10-11 17:12:16.227+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1686', '94', '16', 'start', '2015-10-11 22:20:31.903+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1687', '94', '16', 'moving', '2015-10-11 22:20:31.918+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1688', '94', '16', 'prepareinvoking', '2015-10-11 22:20:32.04+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1689', '94', '16', 'invoked', '2015-10-11 22:20:32.299+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1690', '94', '16', 'moving', '2015-10-11 22:20:32.303+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1691', '94', '16', 'prepareinvoking', '2015-10-11 22:20:32.305+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1692', '94', '16', 'preparemovetospace', '2015-10-11 22:20:32.333+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1693', '94', '16', 'movetospace', '2015-10-11 22:20:32.334+06', 't', '1', '1', '{}', '{}', '{23}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1694', '94', '16', 'preparemovetocontainer', '2015-10-11 22:20:32.334+06', 't', '1', '1', '{}', '{}', '{23}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1695', '94', '16', 'movetocontainer', '2015-10-11 22:20:32.337+06', 't', '1', '1', '{3}', '{}', '{23}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1696', '94', '16', 'invoked', '2015-10-11 22:20:32.337+06', 't', '1', '1', '{3}', '{}', '{23}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1697', '94', '16', 'moving', '2015-10-11 22:20:32.34+06', 't', '1', '1', '{3}', '{}', '{23}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1698', '94', '16', 'prepareinvokinginspace', '2015-10-11 22:20:32.393+06', 't', '1', '1', '{3}', '{}', '{23}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1699', '94', '16', 'prepareinvoking', '2015-10-11 22:20:32.396+06', 't', '1', '1', '{3}', '{}', '{23}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1700', '94', '16', 'invoked', '2015-10-11 22:20:32.398+06', 't', '1', '1', '{3}', '{}', '{23}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1701', '94', '16', 'invokinginspace', '2015-10-11 22:20:32.399+06', 't', '1', '1', '{3}', '{}', '{23}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1702', '94', '16', 'prepareinvoking', '2015-10-11 22:20:32.427+06', 't', '1', '1', '{3}', '{}', '{23}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1703', '94', '16', 'moving', '2015-10-11 22:20:32.532+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1704', '94', '16', 'prepareinvoking', '2015-10-11 22:20:32.534+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1705', '94', '16', 'invoked', '2015-10-11 22:20:32.535+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1706', '94', '16', 'moving', '2015-10-11 22:20:32.536+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1707', '94', '16', 'end', '2015-10-11 22:20:32.536+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1708', '94', '16', 'moving', '2015-10-11 22:20:32.538+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1709', '94', '16', 'end', '2015-10-11 22:20:32.538+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1710', '88', '14', 'start', '2015-10-11 22:24:22.528+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1711', '88', '14', 'moving', '2015-10-11 22:24:22.532+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1712', '88', '14', 'prepareinvoking', '2015-10-11 22:24:22.533+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1713', '88', '14', 'invoked', '2015-10-11 22:24:22.535+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1714', '88', '14', 'moving', '2015-10-11 22:24:22.536+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1715', '88', '14', 'prepareinvoking', '2015-10-11 22:24:22.537+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1716', '88', '14', 'preparemovetospace', '2015-10-11 22:24:22.538+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1717', '88', '14', 'movetospace', '2015-10-11 22:24:22.538+06', 't', '1', '1', '{}', '{}', '{17}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1718', '88', '14', 'preparemovetocontainer', '2015-10-11 22:24:22.538+06', 't', '1', '1', '{}', '{}', '{17}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1719', '88', '14', 'movetocontainer', '2015-10-11 22:24:22.538+06', 't', '1', '1', '{2}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1720', '88', '14', 'invoked', '2015-10-11 22:24:22.538+06', 't', '1', '1', '{2}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1721', '88', '14', 'moving', '2015-10-11 22:24:22.539+06', 't', '1', '1', '{2}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1722', '88', '14', 'prepareinvokinginspace', '2015-10-11 22:24:22.546+06', 't', '1', '1', '{2}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1723', '88', '14', 'prepareinvoking', '2015-10-11 22:24:22.548+06', 't', '1', '1', '{2}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1724', '88', '14', 'invoked', '2015-10-11 22:24:22.549+06', 't', '1', '1', '{2}', '{}', '{17}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1725', '88', '14', 'invokinginspace', '2015-10-11 22:24:22.549+06', 't', '1', '1', '{2}', '{}', '{17}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1726', '88', '14', 'prepareinvoking', '2015-10-11 22:24:22.567+06', 't', '1', '1', '{2}', '{}', '{17}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1727', '88', '14', 'moving', '2015-10-11 22:24:22.593+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1728', '88', '14', 'paused', '2015-10-11 22:24:22.593+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1729', '88', '14', 'moving', '2015-10-11 22:24:22.594+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1730', '88', '14', 'paused', '2015-10-11 22:24:22.595+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1731', '88', '14', 'start', '2015-10-11 23:59:19.085+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1732', '88', '14', 'moving', '2015-10-11 23:59:19.105+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1733', '88', '14', 'prepareinvoking', '2015-10-11 23:59:19.286+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1734', '88', '14', 'invoked', '2015-10-11 23:59:19.384+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1735', '88', '14', 'moving', '2015-10-11 23:59:19.387+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1736', '88', '14', 'prepareinvoking', '2015-10-11 23:59:19.389+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1737', '88', '14', 'preparemovetospace', '2015-10-11 23:59:19.405+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1738', '88', '14', 'movetospace', '2015-10-11 23:59:19.405+06', 't', '1', '1', '{}', '{}', '{17}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1739', '88', '14', 'preparemovetocontainer', '2015-10-11 23:59:19.405+06', 't', '1', '1', '{}', '{}', '{17}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1740', '88', '14', 'movetocontainer', '2015-10-11 23:59:19.421+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1741', '88', '14', 'invoked', '2015-10-11 23:59:19.421+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1742', '88', '14', 'moving', '2015-10-11 23:59:19.424+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1743', '88', '14', 'prepareinvokinginspace', '2015-10-11 23:59:19.504+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1744', '88', '14', 'prepareinvoking', '2015-10-11 23:59:19.516+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1745', '88', '14', 'invoked', '2015-10-11 23:59:19.517+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1746', '88', '14', 'invokinginspace', '2015-10-11 23:59:19.518+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1747', '88', '14', 'prepareinvoking', '2015-10-11 23:59:19.601+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1748', '88', '14', 'moving', '2015-10-11 23:59:20.157+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1749', '88', '14', 'prepareinvoking', '2015-10-11 23:59:20.174+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1750', '88', '14', 'invoked', '2015-10-11 23:59:20.18+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1751', '88', '14', 'moving', '2015-10-11 23:59:20.183+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1752', '88', '14', 'paused', '2015-10-11 23:59:20.183+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1753', '88', '14', 'moving', '2015-10-11 23:59:20.185+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1754', '88', '14', 'paused', '2015-10-11 23:59:20.185+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1755', '87', '14', 'start', '2015-10-12 00:54:17.708+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1756', '87', '14', 'moving', '2015-10-12 00:54:17.722+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1757', '87', '14', 'prepareinvoking', '2015-10-12 00:54:17.934+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1758', '87', '14', 'invoked', '2015-10-12 00:54:18.058+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1759', '87', '14', 'moving', '2015-10-12 00:54:18.06+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1760', '87', '14', 'prepareinvoking', '2015-10-12 00:54:18.069+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1761', '87', '14', 'preparemovetospace', '2015-10-12 00:54:18.086+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1762', '87', '14', 'movetospace', '2015-10-12 00:54:18.086+06', 't', '1', '1', '{}', '{}', '{16}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1763', '87', '14', 'preparemovetocontainer', '2015-10-12 00:54:18.086+06', 't', '1', '1', '{}', '{}', '{16}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1764', '87', '14', 'movetocontainer', '2015-10-12 00:54:18.126+06', 't', '1', '1', '{2}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1765', '87', '14', 'invoked', '2015-10-12 00:54:18.126+06', 't', '1', '1', '{2}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1766', '87', '14', 'moving', '2015-10-12 00:54:18.128+06', 't', '1', '1', '{2}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1767', '87', '14', 'prepareinvokinginspace', '2015-10-12 00:54:18.211+06', 't', '1', '1', '{2}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1768', '87', '14', 'prepareinvoking', '2015-10-12 00:54:18.222+06', 't', '1', '1', '{2}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1769', '87', '14', 'invoked', '2015-10-12 00:54:18.225+06', 't', '1', '1', '{2}', '{}', '{16}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1770', '87', '14', 'invokinginspace', '2015-10-12 00:54:18.227+06', 't', '1', '1', '{2}', '{}', '{16}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1771', '87', '14', 'prepareinvoking', '2015-10-12 00:54:18.295+06', 't', '1', '1', '{2}', '{}', '{16}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1772', '87', '14', 'moving', '2015-10-12 00:54:18.446+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1773', '87', '14', 'paused', '2015-10-12 00:54:18.446+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1774', '87', '14', 'moving', '2015-10-12 00:54:18.447+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1775', '87', '14', 'paused', '2015-10-12 00:54:18.447+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1776', '87', '14', 'start', '2015-10-12 08:30:49.727+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1777', '87', '14', 'moving', '2015-10-12 08:30:49.743+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1778', '87', '14', 'prepareinvoking', '2015-10-12 08:30:49.887+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1779', '87', '14', 'invoked', '2015-10-12 08:30:49.995+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1780', '87', '14', 'moving', '2015-10-12 08:30:49.997+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1781', '87', '14', 'prepareinvoking', '2015-10-12 08:30:50.004+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1782', '87', '14', 'preparemovetospace', '2015-10-12 08:30:50.026+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1783', '87', '14', 'movetospace', '2015-10-12 08:30:50.026+06', 't', '1', '1', '{}', '{}', '{16}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1784', '87', '14', 'preparemovetocontainer', '2015-10-12 08:30:50.026+06', 't', '1', '1', '{}', '{}', '{16}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1785', '87', '14', 'movetocontainer', '2015-10-12 08:30:50.041+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1786', '87', '14', 'invoked', '2015-10-12 08:30:50.041+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1787', '87', '14', 'moving', '2015-10-12 08:30:50.043+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1788', '87', '14', 'prepareinvokinginspace', '2015-10-12 08:30:50.11+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1789', '87', '14', 'prepareinvoking', '2015-10-12 08:30:50.113+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1790', '87', '14', 'invoked', '2015-10-12 08:30:50.114+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1791', '87', '14', 'invokinginspace', '2015-10-12 08:30:50.115+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1792', '87', '14', 'prepareinvoking', '2015-10-12 08:30:50.192+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1793', '87', '14', 'moving', '2015-10-12 08:30:50.305+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1794', '87', '14', 'prepareinvoking', '2015-10-12 08:30:50.31+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1795', '87', '14', 'invoked', '2015-10-12 08:30:50.311+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1796', '87', '14', 'moving', '2015-10-12 08:30:50.312+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1797', '87', '14', 'paused', '2015-10-12 08:30:50.313+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1798', '87', '14', 'moving', '2015-10-12 08:30:50.314+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1799', '87', '14', 'paused', '2015-10-12 08:30:50.314+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1800', '87', '14', 'start', '2015-10-12 08:31:55.346+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1801', '87', '14', 'moving', '2015-10-12 08:31:55.353+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1802', '87', '14', 'prepareinvoking', '2015-10-12 08:31:55.355+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1803', '87', '14', 'invoked', '2015-10-12 08:31:55.356+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1804', '87', '14', 'moving', '2015-10-12 08:31:55.367+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1805', '87', '14', 'prepareinvoking', '2015-10-12 08:31:55.371+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1806', '87', '14', 'preparemovetospace', '2015-10-12 08:31:55.372+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1807', '87', '14', 'movetospace', '2015-10-12 08:31:55.372+06', 't', '1', '1', '{}', '{}', '{16}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1808', '87', '14', 'preparemovetocontainer', '2015-10-12 08:31:55.372+06', 't', '1', '1', '{}', '{}', '{16}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1809', '87', '14', 'movetocontainer', '2015-10-12 08:31:55.372+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1810', '87', '14', 'invoked', '2015-10-12 08:31:55.372+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1811', '87', '14', 'moving', '2015-10-12 08:31:55.373+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1812', '87', '14', 'prepareinvokinginspace', '2015-10-12 08:31:55.376+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1813', '87', '14', 'prepareinvoking', '2015-10-12 08:31:55.378+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1814', '87', '14', 'invoked', '2015-10-12 08:31:55.379+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1815', '87', '14', 'invokinginspace', '2015-10-12 08:31:55.38+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1816', '87', '14', 'prepareinvoking', '2015-10-12 08:31:55.381+06', 't', '1', '1', '{3}', '{}', '{16}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1817', '87', '14', 'moving', '2015-10-12 08:31:55.384+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1818', '87', '14', 'prepareinvoking', '2015-10-12 08:31:55.58+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1819', '87', '14', 'invoked', '2015-10-12 08:31:55.584+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1820', '87', '14', 'moving', '2015-10-12 08:31:55.586+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1821', '87', '14', 'end', '2015-10-12 08:31:55.586+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1822', '87', '14', 'moving', '2015-10-12 08:31:55.588+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1823', '87', '14', 'end', '2015-10-12 08:31:55.588+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1824', '88', '14', 'start', '2015-10-12 20:19:34.24+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1825', '88', '14', 'moving', '2015-10-12 20:19:34.241+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1826', '88', '14', 'prepareinvoking', '2015-10-12 20:19:34.244+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1827', '88', '14', 'invoked', '2015-10-12 20:19:34.246+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1828', '88', '14', 'moving', '2015-10-12 20:19:34.247+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1829', '88', '14', 'prepareinvoking', '2015-10-12 20:19:34.248+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1830', '88', '14', 'preparemovetospace', '2015-10-12 20:19:34.249+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1831', '88', '14', 'movetospace', '2015-10-12 20:19:34.249+06', 't', '1', '1', '{}', '{}', '{17}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1832', '88', '14', 'preparemovetocontainer', '2015-10-12 20:19:34.249+06', 't', '1', '1', '{}', '{}', '{17}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1833', '88', '14', 'movetocontainer', '2015-10-12 20:19:34.257+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1834', '88', '14', 'invoked', '2015-10-12 20:19:34.257+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1835', '88', '14', 'moving', '2015-10-12 20:19:34.259+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1836', '88', '14', 'prepareinvokinginspace', '2015-10-12 20:19:34.261+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1837', '88', '14', 'prepareinvoking', '2015-10-12 20:19:34.265+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1838', '88', '14', 'invoked', '2015-10-12 20:19:34.266+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1839', '88', '14', 'invokinginspace', '2015-10-12 20:19:34.267+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1840', '88', '14', 'prepareinvoking', '2015-10-12 20:19:34.514+06', 't', '1', '1', '{3}', '{}', '{17}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1841', '88', '14', 'moving', '2015-10-12 20:19:34.531+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1842', '88', '14', 'prepareinvoking', '2015-10-12 20:19:34.533+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1843', '88', '14', 'invoked', '2015-10-12 20:19:34.534+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1844', '88', '14', 'moving', '2015-10-12 20:19:34.535+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1845', '88', '14', 'end', '2015-10-12 20:19:34.536+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1846', '88', '14', 'moving', '2015-10-12 20:19:34.537+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1847', '88', '14', 'end', '2015-10-12 20:19:34.537+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1848', '83', '11', 'start', '2015-10-12 20:58:28.76+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1849', '83', '11', 'moving', '2015-10-12 20:58:28.777+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1850', '83', '11', 'prepareinvoking', '2015-10-12 20:58:29.254+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1851', '83', '11', 'preparemovetospace', '2015-10-12 20:58:29.358+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1852', '83', '11', 'movetospace', '2015-10-12 20:58:29.358+06', 't', '0', '1', '{}', '{}', '{10}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1853', '83', '11', 'preparemovetocontainer', '2015-10-12 20:58:29.358+06', 't', '0', '1', '{}', '{}', '{10}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1854', '83', '11', 'movetocontainer', '2015-10-12 20:58:29.368+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1855', '83', '11', 'invoked', '2015-10-12 20:58:29.369+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1856', '83', '11', 'moving', '2015-10-12 20:58:29.374+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1857', '83', '11', 'prepareinvokinginspace', '2015-10-12 20:58:29.439+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1858', '83', '11', 'prepareinvoking', '2015-10-12 20:58:29.442+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1859', '83', '11', 'invoked', '2015-10-12 20:58:29.445+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1860', '83', '11', 'invokinginspace', '2015-10-12 20:58:29.445+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1861', '83', '11', 'prepareinvoking', '2015-10-12 20:58:29.506+06', 't', '0', '1', '{3}', '{}', '{10}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1862', '83', '11', 'moving', '2015-10-12 20:58:29.649+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1863', '83', '11', 'end', '2015-10-12 20:58:29.65+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1864', '83', '11', 'moving', '2015-10-12 20:58:29.653+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1865', '83', '11', 'end', '2015-10-12 20:58:29.66+06', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1866', '95', '15', 'start', '2015-10-12 21:00:40.567+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1867', '95', '15', 'moving', '2015-10-12 21:00:40.568+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1868', '95', '15', 'prepareinvoking', '2015-10-12 21:00:40.578+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1869', '95', '15', 'invoked', '2015-10-12 21:00:40.581+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1870', '95', '15', 'moving', '2015-10-12 21:00:40.584+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1871', '95', '15', 'paused', '2015-10-12 21:00:40.585+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1872', '95', '15', 'start', '2015-10-12 21:02:16.823+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1873', '95', '15', 'moving', '2015-10-12 21:02:16.824+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1874', '95', '15', 'prepareinvoking', '2015-10-12 21:02:16.826+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1875', '95', '15', 'invoked', '2015-10-12 21:02:16.827+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1876', '95', '15', 'moving', '2015-10-12 21:02:16.829+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1877', '95', '15', 'prepareinvoking', '2015-10-12 21:02:16.831+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1878', '95', '15', 'preparemovetospace', '2015-10-12 21:02:16.859+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1879', '95', '15', 'movetospace', '2015-10-12 21:02:16.859+06', 't', '1', '1', '{}', '{}', '{24}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1880', '95', '15', 'preparemovetocontainer', '2015-10-12 21:02:16.859+06', 't', '1', '1', '{}', '{}', '{24}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1881', '95', '15', 'movetocontainer', '2015-10-12 21:02:16.859+06', 't', '1', '1', '{2}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1882', '95', '15', 'invoked', '2015-10-12 21:02:16.859+06', 't', '1', '1', '{2}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1883', '95', '15', 'moving', '2015-10-12 21:02:16.86+06', 't', '1', '1', '{2}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1884', '95', '15', 'prepareinvokinginspace', '2015-10-12 21:02:16.863+06', 't', '1', '1', '{2}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1885', '95', '15', 'prepareinvoking', '2015-10-12 21:02:16.866+06', 't', '1', '1', '{2}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1886', '95', '15', 'invoked', '2015-10-12 21:02:16.867+06', 't', '1', '1', '{2}', '{}', '{24}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1887', '95', '15', 'invokinginspace', '2015-10-12 21:02:16.868+06', 't', '1', '1', '{2}', '{}', '{24}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1888', '95', '15', 'prepareinvoking', '2015-10-12 21:02:16.869+06', 't', '1', '1', '{2}', '{}', '{24}', 't', 'f', 't', 't', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1889', '95', '15', 'moving', '2015-10-12 21:02:16.872+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1890', '95', '15', 'paused', '2015-10-12 21:02:16.872+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1891', '95', '15', 'moving', '2015-10-12 21:02:16.873+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1892', '95', '15', 'paused', '2015-10-12 21:02:16.873+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1893', '95', '15', 'start', '2015-10-12 21:04:33.409+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1894', '95', '15', 'moving', '2015-10-12 21:04:33.41+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1895', '95', '15', 'prepareinvoking', '2015-10-12 21:04:33.412+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1896', '95', '15', 'invoked', '2015-10-12 21:04:33.413+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1897', '95', '15', 'moving', '2015-10-12 21:04:33.414+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1898', '95', '15', 'prepareinvoking', '2015-10-12 21:04:33.415+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1899', '95', '15', 'preparemovetospace', '2015-10-12 21:04:33.416+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1900', '95', '15', 'movetospace', '2015-10-12 21:04:33.416+06', 't', '1', '1', '{}', '{}', '{24}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1901', '95', '15', 'preparemovetocontainer', '2015-10-12 21:04:33.416+06', 't', '1', '1', '{}', '{}', '{24}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1902', '95', '15', 'movetocontainer', '2015-10-12 21:04:33.416+06', 't', '1', '1', '{3}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1903', '95', '15', 'invoked', '2015-10-12 21:04:33.417+06', 't', '1', '1', '{3}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1904', '95', '15', 'moving', '2015-10-12 21:04:33.417+06', 't', '1', '1', '{3}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1905', '95', '15', 'prepareinvokinginspace', '2015-10-12 21:04:33.42+06', 't', '1', '1', '{3}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1906', '95', '15', 'prepareinvoking', '2015-10-12 21:04:33.422+06', 't', '1', '1', '{3}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1907', '95', '15', 'invoked', '2015-10-12 21:04:33.425+06', 't', '1', '1', '{3}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1908', '95', '15', 'invokinginspace', '2015-10-12 21:04:33.426+06', 't', '1', '1', '{3}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1909', '95', '15', 'prepareinvoking', '2015-10-12 21:04:33.428+06', 't', '1', '1', '{3}', '{}', '{24}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1910', '95', '15', 'moving', '2015-10-12 21:04:33.431+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1911', '95', '15', 'prepareinvoking', '2015-10-12 21:04:33.432+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1912', '95', '15', 'preparemovetospace', '2015-10-12 21:04:33.433+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1913', '95', '15', 'movetospace', '2015-10-12 21:04:33.433+06', 't', '2', '1', '{}', '{}', '{25}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1914', '95', '15', 'preparemovetocontainer', '2015-10-12 21:04:33.433+06', 't', '2', '1', '{}', '{}', '{25}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1915', '95', '15', 'movetocontainer', '2015-10-12 21:04:33.433+06', 't', '2', '1', '{1}', '{}', '{25}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1916', '95', '15', 'invoked', '2015-10-12 21:04:33.433+06', 't', '2', '1', '{1}', '{}', '{25}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1917', '95', '15', 'moving', '2015-10-12 21:04:33.435+06', 't', '2', '1', '{1}', '{}', '{25}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1918', '95', '15', 'prepareinvoking', '2015-10-12 21:04:33.439+06', 't', '2', '1', '{1}', '{}', '{25}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1919', '95', '15', 'moving', '2015-10-12 21:04:33.476+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1920', '95', '15', 'end', '2015-10-12 21:04:33.477+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1921', '95', '15', 'moving', '2015-10-12 21:04:33.484+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1922', '95', '15', 'end', '2015-10-12 21:04:33.485+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1923', '95', '15', 'moving', '2015-10-12 21:04:33.487+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1924', '95', '15', 'end', '2015-10-12 21:04:33.488+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1925', '96', '16', 'start', '2015-10-20 10:28:49.59+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1926', '96', '16', 'moving', '2015-10-20 10:28:49.641+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1927', '96', '16', 'prepareinvoking', '2015-10-20 10:28:50.031+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1928', '96', '16', 'invoked', '2015-10-20 10:28:50.191+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1929', '96', '16', 'moving', '2015-10-20 10:28:50.194+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1930', '96', '16', 'prepareinvoking', '2015-10-20 10:28:50.202+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1931', '96', '16', 'preparemovetospace', '2015-10-20 10:28:50.236+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1932', '96', '16', 'movetospace', '2015-10-20 10:28:50.237+06', 't', '1', '1', '{}', '{}', '{26}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1933', '96', '16', 'preparemovetocontainer', '2015-10-20 10:28:50.237+06', 't', '1', '1', '{}', '{}', '{26}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1934', '96', '16', 'movetocontainer', '2015-10-20 10:28:50.28+06', 't', '1', '1', '{3}', '{}', '{26}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1935', '96', '16', 'invoked', '2015-10-20 10:28:50.281+06', 't', '1', '1', '{3}', '{}', '{26}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1936', '96', '16', 'moving', '2015-10-20 10:28:50.283+06', 't', '1', '1', '{3}', '{}', '{26}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1937', '96', '16', 'prepareinvokinginspace', '2015-10-20 10:28:50.384+06', 't', '1', '1', '{3}', '{}', '{26}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1938', '96', '16', 'prepareinvoking', '2015-10-20 10:28:50.387+06', 't', '1', '1', '{3}', '{}', '{26}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1939', '96', '16', 'invoked', '2015-10-20 10:28:50.389+06', 't', '1', '1', '{3}', '{}', '{26}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1940', '96', '16', 'invokinginspace', '2015-10-20 10:28:50.389+06', 't', '1', '1', '{3}', '{}', '{26}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1941', '96', '16', 'prepareinvoking', '2015-10-20 10:28:50.513+06', 't', '1', '1', '{3}', '{}', '{26}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1942', '96', '16', 'moving', '2015-10-20 10:28:50.728+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1943', '96', '16', 'prepareinvoking', '2015-10-20 10:28:50.743+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1944', '96', '16', 'invoked', '2015-10-20 10:28:50.746+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1945', '96', '16', 'moving', '2015-10-20 10:28:50.75+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1946', '96', '16', 'end', '2015-10-20 10:28:50.753+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1947', '96', '16', 'moving', '2015-10-20 10:28:50.754+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1948', '96', '16', 'end', '2015-10-20 10:28:50.756+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1949', '97', '16', 'start', '2015-10-20 10:39:28.226+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1950', '97', '16', 'moving', '2015-10-20 10:39:28.242+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1951', '97', '16', 'prepareinvoking', '2015-10-20 10:39:28.382+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1952', '97', '16', 'invoked', '2015-10-20 10:39:28.5+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1953', '97', '16', 'moving', '2015-10-20 10:39:28.502+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1954', '97', '16', 'prepareinvoking', '2015-10-20 10:39:28.506+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1955', '97', '16', 'preparemovetospace', '2015-10-20 10:39:28.529+06', 't', '1', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1956', '97', '16', 'movetospace', '2015-10-20 10:39:28.53+06', 't', '1', '1', '{}', '{}', '{27}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1957', '97', '16', 'preparemovetocontainer', '2015-10-20 10:39:28.53+06', 't', '1', '1', '{}', '{}', '{27}', 't', 'f', 't', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1958', '97', '16', 'movetocontainer', '2015-10-20 10:39:28.538+06', 't', '1', '1', '{3}', '{}', '{27}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1959', '97', '16', 'invoked', '2015-10-20 10:39:28.539+06', 't', '1', '1', '{3}', '{}', '{27}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1960', '97', '16', 'moving', '2015-10-20 10:39:28.542+06', 't', '1', '1', '{3}', '{}', '{27}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1961', '97', '16', 'prepareinvokinginspace', '2015-10-20 10:39:28.574+06', 't', '1', '1', '{3}', '{}', '{27}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1962', '97', '16', 'prepareinvoking', '2015-10-20 10:39:28.577+06', 't', '1', '1', '{3}', '{}', '{27}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1963', '97', '16', 'invoked', '2015-10-20 10:39:28.578+06', 't', '1', '1', '{3}', '{}', '{27}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1964', '97', '16', 'invokinginspace', '2015-10-20 10:39:28.578+06', 't', '1', '1', '{3}', '{}', '{27}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1965', '97', '16', 'prepareinvoking', '2015-10-20 10:39:28.622+06', 't', '1', '1', '{3}', '{}', '{27}', 't', 'f', 't', 't', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1966', '97', '16', 'moving', '2015-10-20 10:39:28.72+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1967', '97', '16', 'prepareinvoking', '2015-10-20 10:39:28.722+06', 't', '2', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1968', '97', '16', 'invoked', '2015-10-20 10:39:28.727+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1969', '97', '16', 'moving', '2015-10-20 10:39:28.731+06', 't', '3', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1970', '97', '16', 'end', '2015-10-20 10:39:28.732+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1971', '97', '16', 'moving', '2015-10-20 10:39:28.734+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1972', '97', '16', 'end', '2015-10-20 10:39:28.735+06', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1973', '98', '17', 'start', '2015-10-25 03:12:49.016+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1974', '98', '17', 'moving', '2015-10-25 03:12:49.051+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1975', '98', '17', 'prepareinvoking', '2015-10-25 03:12:49.755+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1976', '98', '17', 'invoked', '2015-10-25 03:12:49.898+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1977', '98', '17', 'moving', '2015-10-25 03:12:49.9+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1978', '98', '17', 'paused', '2015-10-25 03:12:49.9+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1979', '99', '14', 'start', '2015-10-30 08:54:08.003+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1980', '99', '14', 'moving', '2015-10-30 08:54:08.043+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1981', '99', '14', 'prepareinvoking', '2015-10-30 08:54:08.414+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1982', '99', '14', 'invoked', '2015-10-30 08:54:08.644+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1983', '99', '14', 'moving', '2015-10-30 08:54:08.649+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1984', '99', '14', 'paused', '2015-10-30 08:54:08.649+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1985', '100', '17', 'start', '2015-11-11 23:51:57.909+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1986', '100', '17', 'moving', '2015-11-11 23:51:57.919+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1987', '100', '17', 'prepareinvoking', '2015-11-11 23:51:58.235+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 'f');
INSERT INTO "public"."bpstation_loggers" VALUES ('1988', '100', '17', 'invoked', '2015-11-11 23:51:58.329+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1989', '100', '17', 'moving', '2015-11-11 23:51:58.34+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');
INSERT INTO "public"."bpstation_loggers" VALUES ('1990', '100', '17', 'paused', '2015-11-11 23:51:58.341+06', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't');

-- ----------------------------
-- Table structure for bpstations
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpstations";
CREATE TABLE "public"."bpstations" (
"id" int4 DEFAULT nextval('bpstations_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"state" bool NOT NULL,
"step" int4 NOT NULL,
"space" int4 NOT NULL,
"container_step" int4[] NOT NULL,
"expand_step" int4[] NOT NULL,
"spaces_ids" int4[] NOT NULL,
"started" bool NOT NULL,
"finished" bool NOT NULL,
"inspace" bool NOT NULL,
"incontainer" bool NOT NULL,
"inexpands" bool NOT NULL,
"paused" bool NOT NULL,
"note" varchar COLLATE "default",
"canceled" bool DEFAULT false NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"session_id" int4 NOT NULL,
"front" bool NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of bpstations
-- ----------------------------
INSERT INTO "public"."bpstations" VALUES ('81', '10', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-09-24 01:05:33.387+06', '2015-09-24 01:05:33.387+06', '81', 't');
INSERT INTO "public"."bpstations" VALUES ('82', '10', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-09-24 01:08:57.19+06', '2015-09-24 01:08:57.19+06', '82', 't');
INSERT INTO "public"."bpstations" VALUES ('83', '11', 't', '1', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-12 20:58:31.307+06', '2015-10-12 20:58:31.307+06', '83', 't');
INSERT INTO "public"."bpstations" VALUES ('84', '14', 't', '4', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-10 23:41:45.798+06', '2015-10-10 23:41:45.798+06', '84', 't');
INSERT INTO "public"."bpstations" VALUES ('85', '15', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-11 14:37:36.012+06', '2015-10-11 14:37:36.012+06', '85', 't');
INSERT INTO "public"."bpstations" VALUES ('86', '15', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-11 14:40:31.781+06', '2015-10-11 14:40:31.781+06', '86', 't');
INSERT INTO "public"."bpstations" VALUES ('87', '14', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-12 08:31:58.396+06', '2015-10-12 08:31:58.396+06', '87', 't');
INSERT INTO "public"."bpstations" VALUES ('88', '14', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-12 20:19:37.601+06', '2015-10-12 20:19:37.601+06', '88', 't');
INSERT INTO "public"."bpstations" VALUES ('89', '16', 't', '4', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-11 16:46:28.637+06', '2015-10-11 16:46:28.637+06', '89', 't');
INSERT INTO "public"."bpstations" VALUES ('90', '16', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-11 16:54:01.156+06', '2015-10-11 16:54:01.156+06', '90', 't');
INSERT INTO "public"."bpstations" VALUES ('91', '16', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-11 16:58:32.37+06', '2015-10-11 16:58:32.37+06', '91', 't');
INSERT INTO "public"."bpstations" VALUES ('92', '16', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-11 17:01:33.962+06', '2015-10-11 17:01:33.962+06', '92', 't');
INSERT INTO "public"."bpstations" VALUES ('93', '16', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-11 17:12:17.254+06', '2015-10-11 17:12:17.254+06', '93', 't');
INSERT INTO "public"."bpstations" VALUES ('94', '16', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-11 22:20:33.735+06', '2015-10-11 22:20:33.735+06', '94', 't');
INSERT INTO "public"."bpstations" VALUES ('95', '15', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-12 21:04:37.753+06', '2015-10-12 21:04:37.753+06', '95', 't');
INSERT INTO "public"."bpstations" VALUES ('96', '16', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-20 10:28:53.137+06', '2015-10-20 10:28:53.137+06', '96', 't');
INSERT INTO "public"."bpstations" VALUES ('97', '16', 't', '3', '0', '{}', '{}', '{}', 't', 't', 'f', 'f', 'f', 'f', null, 'f', '2015-10-20 10:39:32.343+06', '2015-10-20 10:39:32.343+06', '97', 't');
INSERT INTO "public"."bpstations" VALUES ('98', '17', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't', null, 'f', '2015-10-25 03:12:51.921+06', '2015-10-25 03:12:51.921+06', '98', 't');
INSERT INTO "public"."bpstations" VALUES ('99', '14', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't', null, 'f', '2015-10-30 08:54:09.526+06', '2015-10-30 08:54:09.526+06', '99', 't');
INSERT INTO "public"."bpstations" VALUES ('100', '17', 't', '0', '0', '{}', '{}', '{}', 't', 'f', 'f', 'f', 'f', 't', null, 'f', '2015-11-11 23:52:00.088+06', '2015-11-11 23:52:00.088+06', '100', 't');

-- ----------------------------
-- Table structure for bpswitchers
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpswitchers";
CREATE TABLE "public"."bpswitchers" (
"id" int4 DEFAULT nextval('bpswitchers_id_seq'::regclass) NOT NULL,
"bprocess_id" int4 NOT NULL,
"switch_type" varchar COLLATE "default" NOT NULL,
"priority" int4 DEFAULT 2 NOT NULL,
"state_id" int4 NOT NULL,
"session_state" int4,
"fn" varchar COLLATE "default" NOT NULL,
"target" varchar COLLATE "default" NOT NULL,
"override_group" int4 DEFAULT 0 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of bpswitchers
-- ----------------------------
INSERT INTO "public"."bpswitchers" VALUES ('87', '6', 'n', '2', '105', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."bpswitchers" VALUES ('88', '7', 'p', '2', '109', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('89', '7', 'n', '2', '110', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('90', '8', 'p', '2', '114', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('91', '8', 'n', '2', '115', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('94', '8', 'p', '2', '118', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('95', '8', 'n', '2', '119', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('101', '10', 'p', '2', '131', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('102', '10', 'n', '2', '132', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('103', '11', 'inn', '2', '136', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."bpswitchers" VALUES ('104', '11', 'outn', '2', '137', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."bpswitchers" VALUES ('105', '11', 'p', '2', '138', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('106', '11', 'n', '2', '139', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('107', '14', 'p', '2', '149', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('108', '14', 'n', '2', '150', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('109', '14', 'inn', '2', '151', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."bpswitchers" VALUES ('110', '14', 'outn', '2', '152', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."bpswitchers" VALUES ('111', '14', 'p', '2', '153', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('112', '14', 'n', '2', '154', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('113', '14', 'p', '2', '155', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('114', '14', 'n', '2', '156', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('115', '15', 'p', '2', '160', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('116', '15', 'n', '2', '161', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('117', '15', 'inn', '2', '162', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."bpswitchers" VALUES ('118', '15', 'outn', '2', '163', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."bpswitchers" VALUES ('119', '15', 'p', '2', '164', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('120', '15', 'n', '2', '165', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('121', '15', 'inn', '2', '166', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."bpswitchers" VALUES ('122', '15', 'outn', '2', '167', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."bpswitchers" VALUES ('123', '15', 'n', '2', '168', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."bpswitchers" VALUES ('124', '16', 'n', '2', '172', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."bpswitchers" VALUES ('125', '16', 'inn', '2', '173', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."bpswitchers" VALUES ('126', '16', 'outn', '2', '174', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."bpswitchers" VALUES ('127', '16', 'n', '2', '175', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."bpswitchers" VALUES ('129', '10', 'inn', '2', '177', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."bpswitchers" VALUES ('130', '10', 'outn', '2', '178', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."bpswitchers" VALUES ('131', '10', 'p', '2', '179', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('132', '10', 'n', '2', '180', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('133', '10', 'p', '2', '181', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('134', '10', 'n', '2', '182', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('136', '16', 'n', '2', '184', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."bpswitchers" VALUES ('137', '16', 'n', '2', '185', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."bpswitchers" VALUES ('138', '16', 'n', '2', '186', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."bpswitchers" VALUES ('139', '16', 'n', '2', '187', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."bpswitchers" VALUES ('140', '17', 'p', '2', '191', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."bpswitchers" VALUES ('141', '17', 'n', '2', '192', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."bpswitchers" VALUES ('142', '10', 'n', '2', '193', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');

-- ----------------------------
-- Table structure for business_services
-- ----------------------------
DROP TABLE IF EXISTS "public"."business_services";
CREATE TABLE "public"."business_services" (
"id" int4 DEFAULT nextval('business_services_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"business_id" int4 NOT NULL,
"master_acc" varchar COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of business_services
-- ----------------------------
INSERT INTO "public"."business_services" VALUES ('1', 'ttt', '2', 'iamjacke@gmail.com');
INSERT INTO "public"."business_services" VALUES ('2', 'Default service', '15', 'totes@totes.com');
INSERT INTO "public"."business_services" VALUES ('3', 'Teeee', '17', 'lebua@yahoo.com');
INSERT INTO "public"."business_services" VALUES ('4', 'tetete', '20', 'habizn@zurob.in');
INSERT INTO "public"."business_services" VALUES ('5', 'Common', '96', 'test333333@minorityapp.com');
INSERT INTO "public"."business_services" VALUES ('6', 'Adverts', '2', 'iamjacke@gmail.com');

-- ----------------------------
-- Table structure for business_walks
-- ----------------------------
DROP TABLE IF EXISTS "public"."business_walks";
CREATE TABLE "public"."business_walks" (
"id" int4 DEFAULT nextval('business_walks_id_seq'::regclass) NOT NULL,
"business_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of business_walks
-- ----------------------------

-- ----------------------------
-- Table structure for businesses
-- ----------------------------
DROP TABLE IF EXISTS "public"."businesses";
CREATE TABLE "public"."businesses" (
"id" int4 DEFAULT nextval('businesses_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"phone" varchar COLLATE "default",
"website" varchar COLLATE "default",
"country" varchar COLLATE "default" NOT NULL,
"city" varchar COLLATE "default" NOT NULL,
"address" varchar COLLATE "default",
"nickname" varchar COLLATE "default",
"walkthrough" bool NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of businesses
-- ----------------------------
INSERT INTO "public"."businesses" VALUES ('1', 'default business', null, null, '', '', null, null, 'f', null, null);
INSERT INTO "public"."businesses" VALUES ('2', 'Empire InCloud', '+79090860451', '', 'Россия', 'Saint-Petersburg', '', null, 't', '2015-06-19 22:40:04+06', '2015-06-19 22:40:04+06');
INSERT INTO "public"."businesses" VALUES ('3', 'Empire', '7002858852', 'haha.co', 'Espano', 'Huhuiawei', 'tete', null, 't', '2015-06-19 22:40:04+06', '2015-06-19 22:40:04+06');
INSERT INTO "public"."businesses" VALUES ('4', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('5', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('6', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('7', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('8', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('9', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('10', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('11', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('12', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('13', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('14', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('15', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('16', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('17', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('18', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('19', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('20', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('53', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('54', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('55', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('57', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('58', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('94', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('95', 'Your Company', null, null, '', '', null, null, 't', null, null);
INSERT INTO "public"."businesses" VALUES ('96', 'Your Company', null, null, '', '', null, null, 't', null, null);

-- ----------------------------
-- Table structure for client_observers
-- ----------------------------
DROP TABLE IF EXISTS "public"."client_observers";
CREATE TABLE "public"."client_observers" (
"id" int4 DEFAULT nextval('client_observers_id_seq'::regclass) NOT NULL,
"uid" varchar COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of client_observers
-- ----------------------------

-- ----------------------------
-- Table structure for databasechangeloglock
-- ----------------------------
DROP TABLE IF EXISTS "public"."databasechangeloglock";
CREATE TABLE "public"."databasechangeloglock" (
"id" int4 NOT NULL,
"locked" bool NOT NULL,
"lockgranted" timestamp(6),
"lockedby" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of databasechangeloglock
-- ----------------------------
INSERT INTO "public"."databasechangeloglock" VALUES ('1', 'f', null, null);

-- ----------------------------
-- Table structure for elem_topologs
-- ----------------------------
DROP TABLE IF EXISTS "public"."elem_topologs";
CREATE TABLE "public"."elem_topologs" (
"id" int4 DEFAULT nextval('elem_topologs_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"front_elem_id" int4,
"space_elem_id" int4,
"hash" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"space_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of elem_topologs
-- ----------------------------
INSERT INTO "public"."elem_topologs" VALUES ('48', '6', '34', null, '', '2015-08-29 14:26:24.119+06', '2015-08-29 14:26:24.119+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('49', '7', '35', null, '', '2015-08-31 23:09:21.921+06', '2015-08-31 23:09:21.921+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('50', '8', '36', null, '', '2015-09-01 06:08:23.827+06', '2015-09-01 06:08:23.827+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('52', '8', '38', null, '', '2015-09-01 15:52:45.89+06', '2015-09-01 15:52:45.89+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('56', '10', '42', null, '', '2015-09-08 08:13:50.427+06', '2015-09-08 08:13:50.427+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('57', '11', '43', null, '', '2015-09-22 21:04:28.147+06', '2015-09-22 21:04:28.148+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('58', '11', null, '15', '', '2015-09-22 21:04:47.436+06', '2015-09-22 21:04:47.436+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('59', '14', '44', null, '', '2015-10-10 22:48:57.838+06', '2015-10-10 22:48:57.838+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('60', '14', '45', null, '', '2015-10-10 23:09:05.014+06', '2015-10-10 23:09:05.014+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('61', '14', null, '16', '', '2015-10-10 23:09:27.812+06', '2015-10-10 23:09:27.812+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('62', '14', '46', null, '', '2015-10-10 23:11:14.418+06', '2015-10-10 23:11:14.418+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('63', '15', '47', null, '', '2015-10-11 14:32:38.905+06', '2015-10-11 14:32:38.905+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('64', '15', '48', null, '', '2015-10-11 14:34:15.508+06', '2015-10-11 14:34:15.508+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('65', '15', null, '17', '', '2015-10-11 14:34:41.417+06', '2015-10-11 14:34:41.417+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('66', '15', '49', null, '', '2015-10-11 14:35:11.899+06', '2015-10-11 14:35:11.9+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('67', '15', null, '18', '', '2015-10-11 14:35:34.198+06', '2015-10-11 14:35:34.198+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('68', '16', '50', null, '', '2015-10-11 16:37:22.472+06', '2015-10-11 16:37:22.472+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('69', '16', '51', null, '', '2015-10-11 16:39:12.72+06', '2015-10-11 16:39:12.72+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('70', '16', null, '19', '', '2015-10-11 16:39:31.803+06', '2015-10-11 16:39:31.803+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('72', '10', '53', null, '', '2015-10-12 21:13:38.761+06', '2015-10-12 21:13:38.762+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('73', '10', null, '20', '', '2015-10-12 21:15:19.579+06', '2015-10-12 21:15:19.579+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('74', '10', null, '21', '', '2015-10-12 21:19:04.95+06', '2015-10-12 21:19:04.95+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('76', '16', '55', null, '', '2015-10-17 23:55:02.492+06', '2015-10-17 23:55:02.492+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('77', '16', '56', null, '', '2015-10-21 04:00:12.658+06', '2015-10-21 04:00:12.658+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('78', '16', '57', null, '', '2015-10-21 04:07:10.704+06', '2015-10-21 04:07:10.704+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('79', '16', '58', null, '', '2015-10-21 05:03:29.69+06', '2015-10-21 05:03:29.69+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('80', '17', '59', null, '', '2015-10-25 02:11:22.11+06', '2015-10-25 02:11:22.11+06', null);
INSERT INTO "public"."elem_topologs" VALUES ('81', '10', '60', null, '', '2015-11-05 02:30:50.895+06', '2015-11-05 02:30:50.895+06', null);

-- ----------------------------
-- Table structure for element_resources
-- ----------------------------
DROP TABLE IF EXISTS "public"."element_resources";
CREATE TABLE "public"."element_resources" (
"id" int4 DEFAULT nextval('element_resources_id_seq'::regclass) NOT NULL,
"element_id" int4 NOT NULL,
"process_id" int4 NOT NULL,
"resource_id" int4 NOT NULL,
"entities" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of element_resources
-- ----------------------------

-- ----------------------------
-- Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS "public"."employees";
CREATE TABLE "public"."employees" (
"id" int4 DEFAULT nextval('employees_id_seq'::regclass) NOT NULL,
"uid" varchar COLLATE "default" NOT NULL,
"master_acc" varchar COLLATE "default" NOT NULL,
"position" varchar COLLATE "default",
"manager" bool NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of employees
-- ----------------------------
INSERT INTO "public"."employees" VALUES ('1', 'iamjacke@gmail.com', 'iamjacke@gmail.com', '', 't');
INSERT INTO "public"."employees" VALUES ('2', 'tete@tete.ru', 'iamjacke@gmail.com', null, 't');
INSERT INTO "public"."employees" VALUES ('3', 'fafa@fafa.ri', 'iamjacke@gmail.com', null, 'f');
INSERT INTO "public"."employees" VALUES ('4', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('5', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('6', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('7', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('8', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('9', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('10', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('11', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('12', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('13', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('14', 'totes@blah.com', 'totes@blah.com', null, 't');
INSERT INTO "public"."employees" VALUES ('15', 'totes2@toto.ru', 'totes2@toto.ru', null, 't');
INSERT INTO "public"."employees" VALUES ('16', 'tetete@tt.ru', 'tetete@tt.ru', null, 't');
INSERT INTO "public"."employees" VALUES ('17', 'totes@totes.com', 'totes@totes.com', null, 't');
INSERT INTO "public"."employees" VALUES ('18', 'totes@totes.ru', 'totes@totes.ru', null, 't');
INSERT INTO "public"."employees" VALUES ('19', 'lebua@yahoo.com', 'lebua@yahoo.com', null, 't');
INSERT INTO "public"."employees" VALUES ('20', 'employee1@minorityapp.com', 'lebua@yahoo.com', null, 't');
INSERT INTO "public"."employees" VALUES ('24', 'habizn@zurob.in', 'habizn@zurob.in', null, 't');
INSERT INTO "public"."employees" VALUES ('80', 'employee7@minorityapp.com', 'employee7@minorityapp.com', null, 't');
INSERT INTO "public"."employees" VALUES ('81', 'employee7@minorityapp.com', 'employee7@minorityapp.com', null, 't');
INSERT INTO "public"."employees" VALUES ('82', 'employee7@minorityapp.com', 'employee7@minorityapp.com', null, 't');
INSERT INTO "public"."employees" VALUES ('83', 'employee7@minorityapp.com', 'employee7@minorityapp.com', null, 't');
INSERT INTO "public"."employees" VALUES ('84', 'employee7@minorityapp.com', 'employee7@minorityapp.com', null, 't');
INSERT INTO "public"."employees" VALUES ('104', 'analytics1@minorityapp.com', 'analytics1@minorityapp.com', null, 't');
INSERT INTO "public"."employees" VALUES ('105', 'analytics_helper@minorityapp.com', 'analytics1@minorityapp.com', null, 't');
INSERT INTO "public"."employees" VALUES ('106', 'analytic_helper2@minorityapp.com', 'analytics1@minorityapp.com', null, 't');
INSERT INTO "public"."employees" VALUES ('107', '', 'iamjacke@gmail.com', null, 'f');
INSERT INTO "public"."employees" VALUES ('108', 'test7777@minorityapp.com', 'test7777@minorityapp.com', null, 't');
INSERT INTO "public"."employees" VALUES ('109', 'test333333@minorityapp.com', 'test333333@minorityapp.com', null, 't');

-- ----------------------------
-- Table structure for employees_businesses
-- ----------------------------
DROP TABLE IF EXISTS "public"."employees_businesses";
CREATE TABLE "public"."employees_businesses" (
"employee_id" int4 NOT NULL,
"business_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of employees_businesses
-- ----------------------------
INSERT INTO "public"."employees_businesses" VALUES ('1', '2');
INSERT INTO "public"."employees_businesses" VALUES ('6', '4');
INSERT INTO "public"."employees_businesses" VALUES ('7', '5');
INSERT INTO "public"."employees_businesses" VALUES ('8', '6');
INSERT INTO "public"."employees_businesses" VALUES ('9', '7');
INSERT INTO "public"."employees_businesses" VALUES ('10', '8');
INSERT INTO "public"."employees_businesses" VALUES ('11', '9');
INSERT INTO "public"."employees_businesses" VALUES ('12', '10');
INSERT INTO "public"."employees_businesses" VALUES ('13', '11');
INSERT INTO "public"."employees_businesses" VALUES ('14', '12');
INSERT INTO "public"."employees_businesses" VALUES ('15', '13');
INSERT INTO "public"."employees_businesses" VALUES ('16', '14');
INSERT INTO "public"."employees_businesses" VALUES ('17', '15');
INSERT INTO "public"."employees_businesses" VALUES ('18', '16');
INSERT INTO "public"."employees_businesses" VALUES ('19', '17');
INSERT INTO "public"."employees_businesses" VALUES ('20', '17');
INSERT INTO "public"."employees_businesses" VALUES ('24', '20');
INSERT INTO "public"."employees_businesses" VALUES ('104', '94');
INSERT INTO "public"."employees_businesses" VALUES ('105', '94');
INSERT INTO "public"."employees_businesses" VALUES ('106', '94');
INSERT INTO "public"."employees_businesses" VALUES ('107', '2');
INSERT INTO "public"."employees_businesses" VALUES ('108', '95');
INSERT INTO "public"."employees_businesses" VALUES ('109', '96');

-- ----------------------------
-- Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS "public"."groups";
CREATE TABLE "public"."groups" (
"id" int4 DEFAULT nextval('groups_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"business_id" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of groups
-- ----------------------------
INSERT INTO "public"."groups" VALUES ('1', 'test', '1', null, null);
INSERT INTO "public"."groups" VALUES ('2', 'аааа', '2', '2015-08-12 23:07:28.78+06', '2015-08-12 23:07:28.78+06');
INSERT INTO "public"."groups" VALUES ('4', 'Analytics', '4', '2015-08-28 16:09:04.749+06', '2015-08-28 16:09:04.749+06');
INSERT INTO "public"."groups" VALUES ('5', 'Analytics', '5', '2015-08-28 16:09:08.542+06', '2015-08-28 16:09:08.542+06');
INSERT INTO "public"."groups" VALUES ('6', 'Analytics', '6', '2015-08-28 16:09:11.318+06', '2015-08-28 16:09:11.318+06');
INSERT INTO "public"."groups" VALUES ('7', 'Analytics', '7', '2015-08-28 16:09:14.298+06', '2015-08-28 16:09:14.298+06');
INSERT INTO "public"."groups" VALUES ('8', 'Analytics', '8', '2015-08-28 16:09:17.64+06', '2015-08-28 16:09:17.64+06');
INSERT INTO "public"."groups" VALUES ('9', 'Analytics', '9', '2015-08-28 16:09:20.746+06', '2015-08-28 16:09:20.746+06');
INSERT INTO "public"."groups" VALUES ('10', 'Analytics', '10', '2015-08-28 16:09:23.668+06', '2015-08-28 16:09:23.668+06');
INSERT INTO "public"."groups" VALUES ('11', 'Analytics', '11', '2015-08-28 16:09:27.317+06', '2015-08-28 16:09:27.317+06');
INSERT INTO "public"."groups" VALUES ('12', 'Analytics', '12', '2015-08-28 16:09:31.134+06', '2015-08-28 16:09:31.134+06');
INSERT INTO "public"."groups" VALUES ('13', 'Analytics', '13', '2015-08-28 17:03:12.628+06', '2015-08-28 17:03:12.628+06');
INSERT INTO "public"."groups" VALUES ('14', 'Analytics', '14', '2015-08-28 18:24:15.156+06', '2015-08-28 18:24:15.156+06');
INSERT INTO "public"."groups" VALUES ('15', 'Analytics', '15', '2015-08-29 11:40:07.664+06', '2015-08-29 11:40:07.664+06');
INSERT INTO "public"."groups" VALUES ('16', 'Analytics', '16', '2015-08-29 23:21:35.522+06', '2015-08-29 23:21:35.522+06');
INSERT INTO "public"."groups" VALUES ('17', 'Analytics', '17', '2015-08-31 23:06:50.532+06', '2015-08-31 23:06:50.532+06');
INSERT INTO "public"."groups" VALUES ('18', 'Analytics', '18', '2015-09-01 04:04:58.559+06', '2015-09-01 04:04:58.559+06');
INSERT INTO "public"."groups" VALUES ('19', 'Analytics', '19', '2015-09-01 06:04:12.332+06', '2015-09-01 06:04:12.332+06');
INSERT INTO "public"."groups" VALUES ('20', 'Analytics', '20', '2015-09-01 06:10:52.603+06', '2015-09-01 06:10:52.603+06');
INSERT INTO "public"."groups" VALUES ('24', 'Analytics', '94', '2015-09-01 18:04:38.132+06', '2015-09-01 18:04:38.132+06');
INSERT INTO "public"."groups" VALUES ('25', 'test group', '2', '2015-09-03 19:13:23.522+06', '2015-09-03 19:13:23.522+06');
INSERT INTO "public"."groups" VALUES ('26', 'Analytics', '95', '2015-09-25 07:10:51.329+06', '2015-09-25 07:10:51.329+06');
INSERT INTO "public"."groups" VALUES ('27', 'Analytics', '96', '2015-09-25 07:17:29.329+06', '2015-09-25 07:17:29.329+06');

-- ----------------------------
-- Table structure for input_loggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."input_loggers";
CREATE TABLE "public"."input_loggers" (
"id" int4 DEFAULT nextval('input_loggers_id_seq'::regclass) NOT NULL,
"uid" varchar COLLATE "default",
"action" varchar COLLATE "default" NOT NULL,
"arguments" text[] COLLATE "default" NOT NULL,
"reaction_id" int4 NOT NULL,
"input_id" int4 DEFAULT nextval('input_loggers_input_id_seq'::regclass) NOT NULL,
"date" timestamptz(6) NOT NULL,
"session_id" int4 NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of input_loggers
-- ----------------------------
INSERT INTO "public"."input_loggers" VALUES ('22', 'iamjacke@gmail.com', 'input', '{}', '21', '22', '2015-09-24 01:05:30.633+06', '81');
INSERT INTO "public"."input_loggers" VALUES ('23', 'iamjacke@gmail.com', 'input', '{}', '22', '23', '2015-09-24 01:08:54.279+06', '82');
INSERT INTO "public"."input_loggers" VALUES ('24', 'iamjacke@gmail.com', 'input', '{}', '24', '24', '2015-10-10 23:40:14.449+06', '84');
INSERT INTO "public"."input_loggers" VALUES ('25', 'iamjacke@gmail.com', 'input', '{}', '25', '25', '2015-10-10 23:41:05.619+06', '84');
INSERT INTO "public"."input_loggers" VALUES ('26', 'iamjacke@gmail.com', 'input', '{}', '26', '26', '2015-10-10 23:41:41.218+06', '84');
INSERT INTO "public"."input_loggers" VALUES ('27', 'iamjacke@gmail.com', 'input', '{}', '27', '27', '2015-10-11 14:37:04.38+06', '85');
INSERT INTO "public"."input_loggers" VALUES ('28', 'iamjacke@gmail.com', 'input', '{}', '28', '28', '2015-10-11 14:37:31.799+06', '85');
INSERT INTO "public"."input_loggers" VALUES ('29', 'iamjacke@gmail.com', 'input', '{}', '29', '29', '2015-10-11 14:39:45.979+06', '86');
INSERT INTO "public"."input_loggers" VALUES ('30', 'iamjacke@gmail.com', 'input', '{}', '30', '30', '2015-10-11 14:40:27.737+06', '86');
INSERT INTO "public"."input_loggers" VALUES ('31', 'iamjacke@gmail.com', 'input', '{}', '34', '31', '2015-10-11 22:24:20.398+06', '88');
INSERT INTO "public"."input_loggers" VALUES ('32', 'iamjacke@gmail.com', 'input', '{}', '35', '32', '2015-10-11 23:59:15.914+06', '88');
INSERT INTO "public"."input_loggers" VALUES ('33', 'iamjacke@gmail.com', 'input', '{}', '31', '33', '2015-10-12 00:54:15.344+06', '87');
INSERT INTO "public"."input_loggers" VALUES ('34', 'iamjacke@gmail.com', 'input', '{}', '32', '34', '2015-10-12 08:30:44.815+06', '87');
INSERT INTO "public"."input_loggers" VALUES ('35', 'iamjacke@gmail.com', 'input', '{}', '33', '35', '2015-10-12 08:31:52.952+06', '87');
INSERT INTO "public"."input_loggers" VALUES ('36', 'iamjacke@gmail.com', 'input', '{}', '36', '36', '2015-10-12 20:19:31.172+06', '88');
INSERT INTO "public"."input_loggers" VALUES ('37', 'iamjacke@gmail.com', 'input', '{}', '23', '37', '2015-10-12 20:58:23.933+06', '83');
INSERT INTO "public"."input_loggers" VALUES ('38', 'iamjacke@gmail.com', 'input', '{}', '37', '38', '2015-10-12 21:02:14.188+06', '95');
INSERT INTO "public"."input_loggers" VALUES ('39', 'iamjacke@gmail.com', 'input', '{}', '38', '39', '2015-10-12 21:04:30.382+06', '95');

-- ----------------------------
-- Table structure for launch_element_slats
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_element_slats";
CREATE TABLE "public"."launch_element_slats" (
"id" int4 DEFAULT nextval('launch_element_slats_id_seq'::regclass) NOT NULL,
"launched_element_id" int4 NOT NULL,
"slat_id" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of launch_element_slats
-- ----------------------------

-- ----------------------------
-- Table structure for observers
-- ----------------------------
DROP TABLE IF EXISTS "public"."observers";
CREATE TABLE "public"."observers" (
"id" int4 DEFAULT nextval('observers_id_seq'::regclass) NOT NULL,
"station_id" int4 NOT NULL,
"bprocess_id" int4 NOT NULL,
"hash_code" varchar COLLATE "default",
"fullName" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of observers
-- ----------------------------

-- ----------------------------
-- Table structure for plans
-- ----------------------------
DROP TABLE IF EXISTS "public"."plans";
CREATE TABLE "public"."plans" (
"id" int4 DEFAULT nextval('plans_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"price" numeric(21,2) NOT NULL,
"description" varchar COLLATE "default",
"slot_included" int4 DEFAULT 5 NOT NULL,
"order" int4 DEFAULT 1 NOT NULL,
"hidden" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of plans
-- ----------------------------
INSERT INTO "public"."plans" VALUES ('1', 'Trial', '0.00', 'Trial plan for 14 days', '5', '0', 'f');
INSERT INTO "public"."plans" VALUES ('2', 'Base', '49.99', 'Up to 5 collaborators, and 100 process launch ', '5', '2', 'f');
INSERT INTO "public"."plans" VALUES ('3', 'Medium', '149.99', 'Up to 15 collaborators, and 300 process launch ', '15', '3', 't');
INSERT INTO "public"."plans" VALUES ('4', 'Free', '0.00', 'Free plan', '0', '1', 'f');

-- ----------------------------
-- Table structure for proc_element_reflections
-- ----------------------------
DROP TABLE IF EXISTS "public"."proc_element_reflections";
CREATE TABLE "public"."proc_element_reflections" (
"id" int4 DEFAULT nextval('proc_element_reflections_id_seq'::regclass) NOT NULL,
"reflection_id" int4 NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"desc" varchar COLLATE "default" NOT NULL,
"b_type" varchar COLLATE "default" NOT NULL,
"type_title" varchar COLLATE "default" NOT NULL,
"ref_space_id" int4,
"order" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of proc_element_reflections
-- ----------------------------
INSERT INTO "public"."proc_element_reflections" VALUES ('1', '1', 'Container', '', 'brick', 'container_brick', null, '1', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."proc_element_reflections" VALUES ('2', '2', 'Placeholder', '', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."proc_element_reflections" VALUES ('3', '3', 'Confirmation', '', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');

-- ----------------------------
-- Table structure for proc_elements
-- ----------------------------
DROP TABLE IF EXISTS "public"."proc_elements";
CREATE TABLE "public"."proc_elements" (
"id" int4 DEFAULT nextval('proc_elements_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"desc" varchar COLLATE "default" NOT NULL,
"business_id" int4 NOT NULL,
"bprocess_id" int4 NOT NULL,
"b_type" varchar COLLATE "default" NOT NULL,
"type_title" varchar COLLATE "default" NOT NULL,
"space_id" int4,
"order" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of proc_elements
-- ----------------------------
INSERT INTO "public"."proc_elements" VALUES ('34', 'авыаы', 'авыаы', '15', '6', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."proc_elements" VALUES ('35', 'Tetete', 'tewtwtwe', '17', '7', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."proc_elements" VALUES ('36', 'fsafafa', 'fasfaffa', '19', '8', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."proc_elements" VALUES ('38', 'авыаывы', 'аываы', '19', '8', 'block', 'confirm', null, '2', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."proc_elements" VALUES ('42', 'cf', 'cfg', '2', '10', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."proc_elements" VALUES ('43', 'cn', 'cn', '2', '11', 'brick', 'container_brick', null, '1', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."proc_elements" VALUES ('44', 'cf', '', '2', '14', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."proc_elements" VALUES ('45', 'еу', '', '2', '14', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."proc_elements" VALUES ('46', 'final cf', '', '2', '14', 'block', 'confirm', null, '3', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."proc_elements" VALUES ('47', 'test cf', 'cf', '2', '15', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."proc_elements" VALUES ('48', 'cn', '', '2', '15', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."proc_elements" VALUES ('49', 'cn', '', '2', '15', 'brick', 'container_brick', null, '3', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."proc_elements" VALUES ('50', 'ph', 'ph', '2', '16', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."proc_elements" VALUES ('51', 'cn ph', '', '2', '16', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."proc_elements" VALUES ('53', 'cn', 'cn', '2', '10', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."proc_elements" VALUES ('55', 'еуаф', 'аываыв', '2', '16', 'block', 'placeholder', null, '3', null, null);
INSERT INTO "public"."proc_elements" VALUES ('56', 'Чистка картошки', '', '2', '16', 'block', 'placeholder', null, '4', null, null);
INSERT INTO "public"."proc_elements" VALUES ('57', 'ph', 'phh', '2', '16', 'block', 'placeholder', null, '5', null, null);
INSERT INTO "public"."proc_elements" VALUES ('58', 'зрпва', 'павпв', '2', '16', 'block', 'placeholder', null, '6', null, null);
INSERT INTO "public"."proc_elements" VALUES ('59', 'cf', 'cf', '2', '17', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."proc_elements" VALUES ('60', 'fsdfdsfs', 'fsdfsfs', '2', '10', 'block', 'placeholder', null, '3', null, null);

-- ----------------------------
-- Table structure for process_histories
-- ----------------------------
DROP TABLE IF EXISTS "public"."process_histories";
CREATE TABLE "public"."process_histories" (
"id" int4 DEFAULT nextval('process_histories_id_seq'::regclass) NOT NULL,
"master_acc" varchar COLLATE "default" NOT NULL,
"action" varchar COLLATE "default" NOT NULL,
"process_id" int4,
"what" varchar COLLATE "default",
"what_id" int4,
"date" timestamptz(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of process_histories
-- ----------------------------
INSERT INTO "public"."process_histories" VALUES ('1', 'habizn@zurob.in', 'elem_created', '8', 'elem_created', '37', '2015-09-01 15:03:21.166+06');
INSERT INTO "public"."process_histories" VALUES ('2', 'habizn@zurob.in', 'elem_created', '8', 'авыаывы', '38', '2015-09-01 15:52:46.465+06');
INSERT INTO "public"."process_histories" VALUES ('9', 'iamjacke@gmail.com', 'process_created', '10', 'process_created', '10', '2015-09-08 08:11:56.896+06');
INSERT INTO "public"."process_histories" VALUES ('10', 'iamjacke@gmail.com', 'elem_created', '10', 'cf', '42', '2015-09-08 08:13:51.212+06');
INSERT INTO "public"."process_histories" VALUES ('11', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-08 17:05:13.264+06');
INSERT INTO "public"."process_histories" VALUES ('12', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-08 17:11:34.304+06');
INSERT INTO "public"."process_histories" VALUES ('13', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-08 17:59:52.259+06');
INSERT INTO "public"."process_histories" VALUES ('14', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-09 08:48:29.486+06');
INSERT INTO "public"."process_histories" VALUES ('15', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-09 08:49:51.388+06');
INSERT INTO "public"."process_histories" VALUES ('16', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-09 08:50:52.985+06');
INSERT INTO "public"."process_histories" VALUES ('17', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-09 08:52:49.444+06');
INSERT INTO "public"."process_histories" VALUES ('18', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-09 09:43:17.85+06');
INSERT INTO "public"."process_histories" VALUES ('27', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-10 06:43:52.258+06');
INSERT INTO "public"."process_histories" VALUES ('28', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-11 05:33:23.005+06');
INSERT INTO "public"."process_histories" VALUES ('29', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-11 12:18:45.582+06');
INSERT INTO "public"."process_histories" VALUES ('30', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-13 12:58:49.894+06');
INSERT INTO "public"."process_histories" VALUES ('31', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-13 13:54:35.898+06');
INSERT INTO "public"."process_histories" VALUES ('32', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-17 02:47:04.124+06');
INSERT INTO "public"."process_histories" VALUES ('33', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-17 03:02:39.622+06');
INSERT INTO "public"."process_histories" VALUES ('34', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-17 06:11:29.264+06');
INSERT INTO "public"."process_histories" VALUES ('35', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-17 07:23:51.864+06');
INSERT INTO "public"."process_histories" VALUES ('36', 'iamjacke@gmail.com', 'process_resumed', '10', null, null, '2015-09-17 07:24:32.244+06');
INSERT INTO "public"."process_histories" VALUES ('37', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-17 07:41:41.852+06');
INSERT INTO "public"."process_histories" VALUES ('38', 'iamjacke@gmail.com', 'process_created', '11', 'process_created', '11', '2015-09-22 18:47:49.332+06');
INSERT INTO "public"."process_histories" VALUES ('39', 'iamjacke@gmail.com', 'elem_created', '11', 'cn', '43', '2015-09-22 21:04:28.621+06');
INSERT INTO "public"."process_histories" VALUES ('40', 'iamjacke@gmail.com', 'space_elem_created', '11', 'cf', null, '2015-09-22 21:04:47.985+06');
INSERT INTO "public"."process_histories" VALUES ('41', 'iamjacke@gmail.com', 'process_launched', '11', null, null, '2015-09-22 21:05:28.629+06');
INSERT INTO "public"."process_histories" VALUES ('42', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-22 21:19:48.849+06');
INSERT INTO "public"."process_histories" VALUES ('43', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-22 21:24:02.165+06');
INSERT INTO "public"."process_histories" VALUES ('44', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-22 21:47:56.344+06');
INSERT INTO "public"."process_histories" VALUES ('45', 'iamjacke@gmail.com', 'process_launched', '11', null, null, '2015-09-22 21:48:50.312+06');
INSERT INTO "public"."process_histories" VALUES ('46', 'iamjacke@gmail.com', 'process_resumed', '10', null, null, '2015-09-22 21:51:34.957+06');
INSERT INTO "public"."process_histories" VALUES ('47', 'iamjacke@gmail.com', 'process_launched', '11', null, null, '2015-09-22 23:30:25.365+06');
INSERT INTO "public"."process_histories" VALUES ('48', 'iamjacke@gmail.com', 'process_launched', '11', null, null, '2015-09-22 23:40:52.05+06');
INSERT INTO "public"."process_histories" VALUES ('49', 'iamjacke@gmail.com', 'process_launched', '11', null, null, '2015-09-23 00:01:36.75+06');
INSERT INTO "public"."process_histories" VALUES ('50', 'iamjacke@gmail.com', 'process_resumed', '11', null, null, '2015-09-23 00:05:16.185+06');
INSERT INTO "public"."process_histories" VALUES ('51', 'iamjacke@gmail.com', 'process_launched', '11', null, null, '2015-09-23 00:16:18.576+06');
INSERT INTO "public"."process_histories" VALUES ('52', 'iamjacke@gmail.com', 'process_launched', '11', null, null, '2015-09-23 20:53:14.407+06');
INSERT INTO "public"."process_histories" VALUES ('53', 'iamjacke@gmail.com', 'process_resumed', '11', null, null, '2015-09-23 20:54:13.372+06');
INSERT INTO "public"."process_histories" VALUES ('54', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-23 23:22:39.97+06');
INSERT INTO "public"."process_histories" VALUES ('55', 'iamjacke@gmail.com', 'process_resumed', '10', null, null, '2015-09-23 23:23:34.203+06');
INSERT INTO "public"."process_histories" VALUES ('56', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-24 00:50:12.78+06');
INSERT INTO "public"."process_histories" VALUES ('57', 'iamjacke@gmail.com', 'process_resumed', '10', null, null, '2015-09-24 00:53:22.135+06');
INSERT INTO "public"."process_histories" VALUES ('58', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-24 01:05:00.992+06');
INSERT INTO "public"."process_histories" VALUES ('59', 'iamjacke@gmail.com', 'process_resumed', '10', null, null, '2015-09-24 01:05:34.375+06');
INSERT INTO "public"."process_histories" VALUES ('60', 'iamjacke@gmail.com', 'process_launched', '10', null, null, '2015-09-24 01:08:31.556+06');
INSERT INTO "public"."process_histories" VALUES ('61', 'iamjacke@gmail.com', 'process_resumed', '10', null, null, '2015-09-24 01:08:57.935+06');
INSERT INTO "public"."process_histories" VALUES ('62', 'iamjacke@gmail.com', 'process_launched', '11', null, null, '2015-09-30 16:14:10.941+06');
INSERT INTO "public"."process_histories" VALUES ('65', 'iamjacke@gmail.com', 'process_created', '14', 'process_created', '14', '2015-10-10 22:47:02.268+06');
INSERT INTO "public"."process_histories" VALUES ('66', 'iamjacke@gmail.com', 'elem_created', '14', 'cf', '44', '2015-10-10 22:48:58.931+06');
INSERT INTO "public"."process_histories" VALUES ('67', 'iamjacke@gmail.com', 'elem_created', '14', 'еу', '45', '2015-10-10 23:09:05.285+06');
INSERT INTO "public"."process_histories" VALUES ('68', 'iamjacke@gmail.com', 'space_elem_created', '14', 'авыа', null, '2015-10-10 23:09:28.128+06');
INSERT INTO "public"."process_histories" VALUES ('69', 'iamjacke@gmail.com', 'elem_created', '14', 'final cf', '46', '2015-10-10 23:11:14.868+06');
INSERT INTO "public"."process_histories" VALUES ('70', 'iamjacke@gmail.com', 'process_launched', '14', null, null, '2015-10-10 23:33:16.457+06');
INSERT INTO "public"."process_histories" VALUES ('71', 'iamjacke@gmail.com', 'process_resumed', '14', null, null, '2015-10-10 23:40:21.834+06');
INSERT INTO "public"."process_histories" VALUES ('72', 'iamjacke@gmail.com', 'process_resumed', '14', null, null, '2015-10-10 23:41:11.459+06');
INSERT INTO "public"."process_histories" VALUES ('73', 'iamjacke@gmail.com', 'process_resumed', '14', null, null, '2015-10-10 23:41:47.772+06');
INSERT INTO "public"."process_histories" VALUES ('76', 'iamjacke@gmail.com', 'process_created', '15', 'process_created', '15', '2015-10-11 14:31:57.787+06');
INSERT INTO "public"."process_histories" VALUES ('77', 'iamjacke@gmail.com', 'elem_created', '15', 'test cf', '47', '2015-10-11 14:32:39.657+06');
INSERT INTO "public"."process_histories" VALUES ('78', 'iamjacke@gmail.com', 'elem_created', '15', 'cn', '48', '2015-10-11 14:34:15.866+06');
INSERT INTO "public"."process_histories" VALUES ('79', 'iamjacke@gmail.com', 'space_elem_created', '15', 'cn cf', null, '2015-10-11 14:34:42.146+06');
INSERT INTO "public"."process_histories" VALUES ('80', 'iamjacke@gmail.com', 'elem_created', '15', 'cn', '49', '2015-10-11 14:35:12.151+06');
INSERT INTO "public"."process_histories" VALUES ('81', 'iamjacke@gmail.com', 'space_elem_created', '15', 'cn ph', null, '2015-10-11 14:35:34.507+06');
INSERT INTO "public"."process_histories" VALUES ('82', 'iamjacke@gmail.com', 'process_launched', '15', null, null, '2015-10-11 14:36:40.778+06');
INSERT INTO "public"."process_histories" VALUES ('83', 'iamjacke@gmail.com', 'process_resumed', '15', null, null, '2015-10-11 14:37:09.542+06');
INSERT INTO "public"."process_histories" VALUES ('84', 'iamjacke@gmail.com', 'process_resumed', '15', null, null, '2015-10-11 14:37:39.058+06');
INSERT INTO "public"."process_histories" VALUES ('85', 'iamjacke@gmail.com', 'process_launched', '15', null, null, '2015-10-11 14:39:14.553+06');
INSERT INTO "public"."process_histories" VALUES ('86', 'iamjacke@gmail.com', 'process_resumed', '15', null, null, '2015-10-11 14:39:50.973+06');
INSERT INTO "public"."process_histories" VALUES ('87', 'iamjacke@gmail.com', 'process_resumed', '15', null, null, '2015-10-11 14:40:34.326+06');
INSERT INTO "public"."process_histories" VALUES ('88', 'iamjacke@gmail.com', 'process_launched', '14', null, null, '2015-10-11 14:41:11.795+06');
INSERT INTO "public"."process_histories" VALUES ('89', 'iamjacke@gmail.com', 'process_launched', '14', null, null, '2015-10-11 14:41:13.056+06');
INSERT INTO "public"."process_histories" VALUES ('90', 'iamjacke@gmail.com', 'process_created', '16', 'process_created', '16', '2015-10-11 16:28:55.151+06');
INSERT INTO "public"."process_histories" VALUES ('91', 'iamjacke@gmail.com', 'elem_created', '16', 'ph', '50', '2015-10-11 16:37:22.745+06');
INSERT INTO "public"."process_histories" VALUES ('92', 'iamjacke@gmail.com', 'elem_created', '16', 'cn ph', '51', '2015-10-11 16:39:12.919+06');
INSERT INTO "public"."process_histories" VALUES ('93', 'iamjacke@gmail.com', 'space_elem_created', '16', 'ph', null, '2015-10-11 16:39:32.051+06');
INSERT INTO "public"."process_histories" VALUES ('94', 'iamjacke@gmail.com', 'elem_created', '16', 'ph 2', '52', '2015-10-11 16:40:16.399+06');
INSERT INTO "public"."process_histories" VALUES ('95', 'iamjacke@gmail.com', 'process_launched', '16', null, null, '2015-10-11 16:46:38.87+06');
INSERT INTO "public"."process_histories" VALUES ('96', 'iamjacke@gmail.com', 'process_launched', '16', null, null, '2015-10-11 16:54:22.16+06');
INSERT INTO "public"."process_histories" VALUES ('97', 'iamjacke@gmail.com', 'process_launched', '16', null, null, '2015-10-11 16:59:43.337+06');
INSERT INTO "public"."process_histories" VALUES ('98', 'iamjacke@gmail.com', 'process_launched', '16', null, null, '2015-10-11 17:02:38.447+06');
INSERT INTO "public"."process_histories" VALUES ('99', 'iamjacke@gmail.com', 'process_launched', '16', null, null, '2015-10-11 17:13:21.96+06');
INSERT INTO "public"."process_histories" VALUES ('100', 'iamjacke@gmail.com', 'process_launched', '16', null, null, '2015-10-11 22:20:35.358+06');
INSERT INTO "public"."process_histories" VALUES ('101', 'iamjacke@gmail.com', 'process_resumed', '14', null, null, '2015-10-11 22:24:25.777+06');
INSERT INTO "public"."process_histories" VALUES ('102', 'iamjacke@gmail.com', 'process_resumed', '14', null, null, '2015-10-11 23:59:25.327+06');
INSERT INTO "public"."process_histories" VALUES ('103', 'iamjacke@gmail.com', 'process_resumed', '14', null, null, '2015-10-12 00:54:22.301+06');
INSERT INTO "public"."process_histories" VALUES ('104', 'iamjacke@gmail.com', 'process_resumed', '14', null, null, '2015-10-12 08:30:55.006+06');
INSERT INTO "public"."process_histories" VALUES ('105', 'iamjacke@gmail.com', 'process_resumed', '14', null, null, '2015-10-12 08:32:00.861+06');
INSERT INTO "public"."process_histories" VALUES ('106', 'iamjacke@gmail.com', 'process_resumed', '14', null, null, '2015-10-12 20:19:40.185+06');
INSERT INTO "public"."process_histories" VALUES ('107', 'iamjacke@gmail.com', 'process_resumed', '11', null, null, '2015-10-12 20:58:33.674+06');
INSERT INTO "public"."process_histories" VALUES ('108', 'iamjacke@gmail.com', 'process_launched', '15', null, null, '2015-10-12 21:00:42.994+06');
INSERT INTO "public"."process_histories" VALUES ('109', 'iamjacke@gmail.com', 'process_resumed', '15', null, null, '2015-10-12 21:02:20.009+06');
INSERT INTO "public"."process_histories" VALUES ('110', 'iamjacke@gmail.com', 'process_resumed', '15', null, null, '2015-10-12 21:04:42.133+06');
INSERT INTO "public"."process_histories" VALUES ('111', 'iamjacke@gmail.com', 'elem_created', '10', 'cn', '53', '2015-10-12 21:13:39.222+06');
INSERT INTO "public"."process_histories" VALUES ('112', 'iamjacke@gmail.com', 'space_elem_created', '10', 'са', null, '2015-10-12 21:15:20.347+06');
INSERT INTO "public"."process_histories" VALUES ('113', 'iamjacke@gmail.com', 'space_elem_created', '10', 'cf', null, '2015-10-12 21:19:05.232+06');
INSERT INTO "public"."process_histories" VALUES ('114', 'iamjacke@gmail.com', 'elem_created', '16', 'fdssf', '54', '2015-10-15 12:53:04.827+06');
INSERT INTO "public"."process_histories" VALUES ('115', 'iamjacke@gmail.com', 'elem_created', '16', 'еуаф', '55', '2015-10-17 23:55:03.284+06');
INSERT INTO "public"."process_histories" VALUES ('116', 'iamjacke@gmail.com', 'element_deleted', '16', 'ph 2', '52', '2015-10-18 00:00:56.28+06');
INSERT INTO "public"."process_histories" VALUES ('117', 'iamjacke@gmail.com', 'element_deleted', '16', 'fdssf', '54', '2015-10-18 00:01:14.294+06');
INSERT INTO "public"."process_histories" VALUES ('118', 'iamjacke@gmail.com', 'element_renamed', '16', 'ph', '1', '2015-10-18 18:19:24.704+06');
INSERT INTO "public"."process_histories" VALUES ('119', 'iamjacke@gmail.com', 'element_renamed', '16', 'ph', '1', '2015-10-18 18:23:08.565+06');
INSERT INTO "public"."process_histories" VALUES ('120', 'iamjacke@gmail.com', 'element_renamed', '16', 'ph', '1', '2015-10-18 18:26:03.619+06');
INSERT INTO "public"."process_histories" VALUES ('121', 'iamjacke@gmail.com', 'element_renamed', '16', 'ph', '1', '2015-10-18 18:35:15.02+06');
INSERT INTO "public"."process_histories" VALUES ('122', 'iamjacke@gmail.com', 'element_renamed', '16', 'ph', '1', '2015-10-18 18:47:56.657+06');
INSERT INTO "public"."process_histories" VALUES ('123', 'iamjacke@gmail.com', 'element_renamed', '16', 'ph', '1', '2015-10-18 18:54:12.861+06');
INSERT INTO "public"."process_histories" VALUES ('124', 'iamjacke@gmail.com', 'element_renamed', '16', 'ph', '1', '2015-10-20 10:26:55.67+06');
INSERT INTO "public"."process_histories" VALUES ('125', 'iamjacke@gmail.com', 'process_launched', '16', null, null, '2015-10-20 10:28:55.404+06');
INSERT INTO "public"."process_histories" VALUES ('126', 'iamjacke@gmail.com', 'process_launched', '16', null, null, '2015-10-20 10:39:34.634+06');
INSERT INTO "public"."process_histories" VALUES ('127', 'iamjacke@gmail.com', 'elem_created', '16', 'Чистка картошки', '56', '2015-10-21 04:00:12.951+06');
INSERT INTO "public"."process_histories" VALUES ('128', 'iamjacke@gmail.com', 'elem_created', '16', 'ph', '57', '2015-10-21 04:07:10.863+06');
INSERT INTO "public"."process_histories" VALUES ('129', 'iamjacke@gmail.com', 'elem_created', '16', 'зрпва', '58', '2015-10-21 05:03:29.905+06');
INSERT INTO "public"."process_histories" VALUES ('130', 'iamjacke@gmail.com', 'element_renamed', '16', 'зрпва', '1', '2015-10-21 05:15:45.237+06');
INSERT INTO "public"."process_histories" VALUES ('131', 'iamjacke@gmail.com', 'process_created', '17', 'process_created', '17', '2015-10-24 14:48:44.463+06');
INSERT INTO "public"."process_histories" VALUES ('132', 'iamjacke@gmail.com', 'elem_created', '17', 'cf', '59', '2015-10-25 02:11:23.738+06');
INSERT INTO "public"."process_histories" VALUES ('133', 'iamjacke@gmail.com', 'process_launched', '17', null, null, '2015-10-25 03:12:53.007+06');
INSERT INTO "public"."process_histories" VALUES ('134', 'iamjacke@gmail.com', 'process_launched', '14', null, null, '2015-10-30 08:54:10.498+06');
INSERT INTO "public"."process_histories" VALUES ('135', 'iamjacke@gmail.com', 'elem_created', '10', 'fsdfdsfs', '60', '2015-11-05 02:30:52.951+06');
INSERT INTO "public"."process_histories" VALUES ('136', 'iamjacke@gmail.com', 'process_launched', '17', null, null, '2015-11-11 23:52:02.072+06');
INSERT INTO "public"."process_histories" VALUES ('137', 'iamjacke@gmail.com', 'process_created', '18', 'process_created', '18', '2015-11-17 16:22:31.668+06');

-- ----------------------------
-- Table structure for process_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."process_permissions";
CREATE TABLE "public"."process_permissions" (
"id" int4 DEFAULT nextval('process_permissions_id_seq'::regclass) NOT NULL,
"uid" varchar COLLATE "default",
"group_id" int4,
"bprocess" int4 NOT NULL,
"front_elem_id" int4,
"space_elem_id" int4,
"reaction_id" int4,
"role" varchar COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of process_permissions
-- ----------------------------
INSERT INTO "public"."process_permissions" VALUES ('4', null, '15', '6', null, null, null, 'all');
INSERT INTO "public"."process_permissions" VALUES ('5', 'totes@totes.com', null, '6', '34', null, null, 'all');
INSERT INTO "public"."process_permissions" VALUES ('6', null, '17', '7', null, null, null, 'all');
INSERT INTO "public"."process_permissions" VALUES ('7', 'lebua@yahoo.com', null, '7', '35', null, null, 'all');
INSERT INTO "public"."process_permissions" VALUES ('8', null, '19', '8', null, null, null, 'all');

-- ----------------------------
-- Table structure for reaction_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."reaction_refs";
CREATE TABLE "public"."reaction_refs" (
"id" int4 DEFAULT nextval('reaction_refs_id_seq'::regclass) NOT NULL,
"reflection_id" int4 NOT NULL,
"autostart" bool NOT NULL,
"element_id" int4 NOT NULL,
"state_ref_id" int4,
"title" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of reaction_refs
-- ----------------------------
INSERT INTO "public"."reaction_refs" VALUES ('1', '3', 'f', '3', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');

-- ----------------------------
-- Table structure for reaction_state_out_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."reaction_state_out_refs";
CREATE TABLE "public"."reaction_state_out_refs" (
"id" int4 DEFAULT nextval('reaction_state_out_refs_id_seq'::regclass) NOT NULL,
"state_ref" int4 NOT NULL,
"reaction_id" int4 NOT NULL,
"on" bool NOT NULL,
"on_rate" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of reaction_state_out_refs
-- ----------------------------
INSERT INTO "public"."reaction_state_out_refs" VALUES ('1', '5', '1', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');

-- ----------------------------
-- Table structure for reaction_state_outs
-- ----------------------------
DROP TABLE IF EXISTS "public"."reaction_state_outs";
CREATE TABLE "public"."reaction_state_outs" (
"id" int4 DEFAULT nextval('reaction_state_outs_id_seq'::regclass) NOT NULL,
"state_id" int4 NOT NULL,
"reaction_id" int4 NOT NULL,
"on" bool NOT NULL,
"on_rate" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of reaction_state_outs
-- ----------------------------
INSERT INTO "public"."reaction_state_outs" VALUES ('30', '110', '30', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('31', '115', '31', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('33', '119', '33', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('36', '132', '36', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('37', '139', '37', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('38', '150', '38', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('39', '154', '39', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('40', '156', '40', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('41', '161', '41', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('42', '165', '42', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('43', '180', '43', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('44', '182', '44', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."reaction_state_outs" VALUES ('45', '192', '45', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');

-- ----------------------------
-- Table structure for reactions
-- ----------------------------
DROP TABLE IF EXISTS "public"."reactions";
CREATE TABLE "public"."reactions" (
"id" int4 DEFAULT nextval('reactions_id_seq'::regclass) NOT NULL,
"bprocess_id" int4 NOT NULL,
"autostart" bool NOT NULL,
"element_id" int4 NOT NULL,
"state_ref_id" int4,
"title" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of reactions
-- ----------------------------
INSERT INTO "public"."reactions" VALUES ('30', '7', 'f', '49', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('31', '8', 'f', '50', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('33', '8', 'f', '52', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('36', '10', 'f', '56', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('37', '11', 'f', '58', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('38', '14', 'f', '59', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('39', '14', 'f', '61', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('40', '14', 'f', '62', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('41', '15', 'f', '63', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('42', '15', 'f', '65', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('43', '10', 'f', '73', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('44', '10', 'f', '74', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."reactions" VALUES ('45', '17', 'f', '80', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');

-- ----------------------------
-- Table structure for reflected_elem_topologs
-- ----------------------------
DROP TABLE IF EXISTS "public"."reflected_elem_topologs";
CREATE TABLE "public"."reflected_elem_topologs" (
"id" int4 DEFAULT nextval('reflected_elem_topologs_id_seq'::regclass) NOT NULL,
"reflection_id" int4 NOT NULL,
"front_elem_id" int4,
"space_elem_id" int4,
"hash" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"space_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of reflected_elem_topologs
-- ----------------------------
INSERT INTO "public"."reflected_elem_topologs" VALUES ('1', '1', '1', null, '', null, null, null);
INSERT INTO "public"."reflected_elem_topologs" VALUES ('2', '2', '2', null, '', null, null, null);
INSERT INTO "public"."reflected_elem_topologs" VALUES ('3', '3', '3', null, '', null, null, null);

-- ----------------------------
-- Table structure for refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."refs";
CREATE TABLE "public"."refs" (
"id" int4 DEFAULT nextval('refs_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"host" varchar COLLATE "default" NOT NULL,
"desc" varchar COLLATE "default",
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"category" varchar COLLATE "default" DEFAULT 'Base'::character varying NOT NULL,
"hidden" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of refs
-- ----------------------------
INSERT INTO "public"."refs" VALUES ('1', 'Container', '', 'Element used for storing other elements by decomposing hard action to easy one. May have containers too inside.', null, null, 'Base', 'f');
INSERT INTO "public"."refs" VALUES ('2', 'Placeholder', '', 'Element used for fill the hole betwen other elements. When it''s launch, nothing happens and it will be skipped.', null, null, 'Base', 'f');
INSERT INTO "public"."refs" VALUES ('3', 'Confirmation', '', 'Element used for confirming action. When it''s launch, and it''s not confirmed, process will be paused until confirmed reaction was executed.', null, null, 'Base', 'f');

-- ----------------------------
-- Table structure for resources
-- ----------------------------
DROP TABLE IF EXISTS "public"."resources";
CREATE TABLE "public"."resources" (
"id" int4 DEFAULT nextval('resources_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"business_id" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of resources
-- ----------------------------
INSERT INTO "public"."resources" VALUES ('7', 'fsafaf', '2', null, null);
INSERT INTO "public"."resources" VALUES ('8', 'fasfa', '2', null, null);

-- ----------------------------
-- Table structure for session_elem_topologs
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_elem_topologs";
CREATE TABLE "public"."session_elem_topologs" (
"id" int4 DEFAULT nextval('session_elem_topologs_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"session_id" int4 NOT NULL,
"front_elem_id" int4,
"space_elem_id" int4,
"hash" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"space_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_elem_topologs
-- ----------------------------
INSERT INTO "public"."session_elem_topologs" VALUES ('29', '10', '81', '23', null, '', '2015-09-08 08:13:50.427+06', '2015-09-08 08:13:50.427+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('30', '10', '82', '24', null, '', '2015-09-08 08:13:50.427+06', '2015-09-08 08:13:50.427+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('31', '11', '83', '25', null, '', '2015-09-22 21:04:28.147+06', '2015-09-22 21:04:28.148+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('32', '11', '83', null, '9', '', '2015-09-22 21:04:47.436+06', '2015-09-22 21:04:47.436+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('33', '14', '84', '26', null, '', '2015-10-10 22:48:57.838+06', '2015-10-10 22:48:57.838+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('34', '14', '84', '27', null, '', '2015-10-10 23:09:05.014+06', '2015-10-10 23:09:05.014+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('35', '14', '84', null, '10', '', '2015-10-10 23:09:27.812+06', '2015-10-10 23:09:27.812+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('36', '14', '84', '28', null, '', '2015-10-10 23:11:14.418+06', '2015-10-10 23:11:14.418+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('37', '15', '85', '29', null, '', '2015-10-11 14:32:38.905+06', '2015-10-11 14:32:38.905+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('38', '15', '85', '30', null, '', '2015-10-11 14:34:15.508+06', '2015-10-11 14:34:15.508+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('39', '15', '85', null, '11', '', '2015-10-11 14:34:41.417+06', '2015-10-11 14:34:41.417+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('40', '15', '85', '31', null, '', '2015-10-11 14:35:11.899+06', '2015-10-11 14:35:11.9+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('41', '15', '85', null, '12', '', '2015-10-11 14:35:34.198+06', '2015-10-11 14:35:34.198+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('42', '15', '86', '32', null, '', '2015-10-11 14:32:38.905+06', '2015-10-11 14:32:38.905+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('43', '15', '86', '33', null, '', '2015-10-11 14:34:15.508+06', '2015-10-11 14:34:15.508+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('44', '15', '86', null, '13', '', '2015-10-11 14:34:41.417+06', '2015-10-11 14:34:41.417+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('45', '15', '86', '34', null, '', '2015-10-11 14:35:11.899+06', '2015-10-11 14:35:11.9+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('46', '15', '86', null, '14', '', '2015-10-11 14:35:34.198+06', '2015-10-11 14:35:34.198+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('47', '14', '87', '36', null, '', '2015-10-10 22:48:57.838+06', '2015-10-10 22:48:57.838+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('48', '14', '87', '37', null, '', '2015-10-10 23:09:05.014+06', '2015-10-10 23:09:05.014+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('49', '14', '87', null, '16', '', '2015-10-10 23:09:27.812+06', '2015-10-10 23:09:27.812+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('50', '14', '87', '40', null, '', '2015-10-10 23:11:14.418+06', '2015-10-10 23:11:14.418+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('51', '14', '88', '35', null, '', '2015-10-10 22:48:57.838+06', '2015-10-10 22:48:57.838+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('52', '14', '88', '38', null, '', '2015-10-10 23:09:05.014+06', '2015-10-10 23:09:05.014+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('53', '14', '88', null, '15', '', '2015-10-10 23:09:27.812+06', '2015-10-10 23:09:27.812+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('54', '14', '88', '39', null, '', '2015-10-10 23:11:14.418+06', '2015-10-10 23:11:14.418+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('55', '16', '89', '41', null, '', '2015-10-11 16:37:22.472+06', '2015-10-11 16:37:22.472+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('56', '16', '89', '42', null, '', '2015-10-11 16:39:12.72+06', '2015-10-11 16:39:12.72+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('57', '16', '89', null, '17', '', '2015-10-11 16:39:31.803+06', '2015-10-11 16:39:31.803+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('58', '16', '89', '43', null, '', '2015-10-11 16:40:16.263+06', '2015-10-11 16:40:16.263+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('59', '16', '90', '44', null, '', '2015-10-11 16:37:22.472+06', '2015-10-11 16:37:22.472+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('60', '16', '90', '45', null, '', '2015-10-11 16:39:12.72+06', '2015-10-11 16:39:12.72+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('61', '16', '90', null, '18', '', '2015-10-11 16:39:31.803+06', '2015-10-11 16:39:31.803+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('62', '16', '90', '46', null, '', '2015-10-11 16:40:16.263+06', '2015-10-11 16:40:16.263+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('63', '16', '91', '47', null, '', '2015-10-11 16:37:22.472+06', '2015-10-11 16:37:22.472+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('64', '16', '91', '48', null, '', '2015-10-11 16:39:12.72+06', '2015-10-11 16:39:12.72+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('65', '16', '91', null, '19', '', '2015-10-11 16:39:31.803+06', '2015-10-11 16:39:31.803+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('66', '16', '91', '49', null, '', '2015-10-11 16:40:16.263+06', '2015-10-11 16:40:16.263+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('67', '16', '92', '50', null, '', '2015-10-11 16:37:22.472+06', '2015-10-11 16:37:22.472+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('68', '16', '92', '51', null, '', '2015-10-11 16:39:12.72+06', '2015-10-11 16:39:12.72+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('69', '16', '92', null, '20', '', '2015-10-11 16:39:31.803+06', '2015-10-11 16:39:31.803+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('70', '16', '92', '52', null, '', '2015-10-11 16:40:16.263+06', '2015-10-11 16:40:16.263+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('71', '16', '93', '53', null, '', '2015-10-11 16:37:22.472+06', '2015-10-11 16:37:22.472+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('72', '16', '93', '54', null, '', '2015-10-11 16:39:12.72+06', '2015-10-11 16:39:12.72+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('73', '16', '93', null, '21', '', '2015-10-11 16:39:31.803+06', '2015-10-11 16:39:31.803+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('74', '16', '93', '55', null, '', '2015-10-11 16:40:16.263+06', '2015-10-11 16:40:16.263+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('75', '16', '94', '56', null, '', '2015-10-11 16:37:22.472+06', '2015-10-11 16:37:22.472+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('76', '16', '94', '57', null, '', '2015-10-11 16:39:12.72+06', '2015-10-11 16:39:12.72+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('77', '16', '94', null, '22', '', '2015-10-11 16:39:31.803+06', '2015-10-11 16:39:31.803+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('78', '16', '94', '58', null, '', '2015-10-11 16:40:16.263+06', '2015-10-11 16:40:16.263+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('79', '15', '95', '59', null, '', '2015-10-11 14:32:38.905+06', '2015-10-11 14:32:38.905+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('80', '15', '95', '60', null, '', '2015-10-11 14:34:15.508+06', '2015-10-11 14:34:15.508+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('81', '15', '95', null, '23', '', '2015-10-11 14:34:41.417+06', '2015-10-11 14:34:41.417+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('82', '15', '95', '61', null, '', '2015-10-11 14:35:11.899+06', '2015-10-11 14:35:11.9+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('83', '15', '95', null, '24', '', '2015-10-11 14:35:34.198+06', '2015-10-11 14:35:34.198+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('84', '16', '96', '64', null, '', '2015-10-11 16:37:22.472+06', '2015-10-11 16:37:22.472+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('85', '16', '96', '62', null, '', '2015-10-11 16:39:12.72+06', '2015-10-11 16:39:12.72+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('86', '16', '96', null, '25', '', '2015-10-11 16:39:31.803+06', '2015-10-11 16:39:31.803+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('87', '16', '96', '63', null, '', '2015-10-17 23:55:02.492+06', '2015-10-17 23:55:02.492+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('88', '16', '97', '67', null, '', '2015-10-11 16:37:22.472+06', '2015-10-11 16:37:22.472+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('89', '16', '97', '65', null, '', '2015-10-11 16:39:12.72+06', '2015-10-11 16:39:12.72+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('90', '16', '97', null, '26', '', '2015-10-11 16:39:31.803+06', '2015-10-11 16:39:31.803+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('91', '16', '97', '66', null, '', '2015-10-17 23:55:02.492+06', '2015-10-17 23:55:02.492+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('92', '17', '98', '68', null, '', '2015-10-25 02:11:22.11+06', '2015-10-25 02:11:22.11+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('93', '14', '99', '69', null, '', '2015-10-10 22:48:57.838+06', '2015-10-10 22:48:57.838+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('94', '14', '99', '70', null, '', '2015-10-10 23:09:05.014+06', '2015-10-10 23:09:05.014+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('95', '14', '99', null, '27', '', '2015-10-10 23:09:27.812+06', '2015-10-10 23:09:27.812+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('96', '14', '99', '71', null, '', '2015-10-10 23:11:14.418+06', '2015-10-10 23:11:14.418+06', null);
INSERT INTO "public"."session_elem_topologs" VALUES ('97', '17', '100', '72', null, '', '2015-10-25 02:11:22.11+06', '2015-10-25 02:11:22.11+06', null);

-- ----------------------------
-- Table structure for session_element_resources
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_element_resources";
CREATE TABLE "public"."session_element_resources" (
"id" int4 DEFAULT nextval('session_element_resources_id_seq'::regclass) NOT NULL,
"session_element_id" int4 NOT NULL,
"process_id" int4 NOT NULL,
"session_id" int4 NOT NULL,
"resource_id" int4 NOT NULL,
"entities" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_element_resources
-- ----------------------------

-- ----------------------------
-- Table structure for session_initial_states
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_initial_states";
CREATE TABLE "public"."session_initial_states" (
"id" int4 DEFAULT nextval('session_initial_states_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"session_id" int4 NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"neutral" varchar COLLATE "default" NOT NULL,
"is_process_state" bool DEFAULT false NOT NULL,
"on" bool DEFAULT false NOT NULL,
"on_rate" int4 DEFAULT 0 NOT NULL,
"ses_front_elem_id" int4,
"ses_space_elem_id" int4,
"ses_space_id" int4,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"lang" varchar COLLATE "default" DEFAULT 'en'::character varying NOT NULL,
"middle" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"middleable" bool DEFAULT false NOT NULL,
"oposite" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"opositable" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_initial_states
-- ----------------------------
INSERT INTO "public"."session_initial_states" VALUES ('124', '10', '81', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-09-08 08:11:55.67+06', '2015-09-08 08:11:55.67+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('125', '10', '81', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-09-08 08:11:55.67+06', '2015-09-08 08:11:55.67+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('126', '10', '81', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-09-08 08:11:55.67+06', '2015-09-08 08:11:55.67+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('127', '10', '81', 'invoked', 'uninvoked', 'f', 'f', '0', '23', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('128', '10', '81', 'confirmed', 'unconfirmed', 'f', 'f', '0', '23', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('129', '10', '82', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-09-08 08:11:55.67+06', '2015-09-08 08:11:55.67+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('130', '10', '82', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-09-08 08:11:55.67+06', '2015-09-08 08:11:55.67+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('131', '10', '82', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-09-08 08:11:55.67+06', '2015-09-08 08:11:55.67+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('132', '10', '82', 'invoked', 'uninvoked', 'f', 'f', '0', '24', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('133', '10', '82', 'confirmed', 'unconfirmed', 'f', 'f', '0', '24', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('134', '11', '83', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-09-22 18:47:48.618+06', '2015-09-22 18:47:48.618+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('135', '11', '83', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-09-22 18:47:48.618+06', '2015-09-22 18:47:48.618+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('136', '11', '83', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-09-22 18:47:48.618+06', '2015-09-22 18:47:48.618+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('137', '11', '83', 'invoked', 'uninvoked', 'f', 'f', '0', '25', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('138', '11', '83', 'lap', 'unlap', 'f', 'f', '0', null, null, '10', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('139', '11', '83', 'invoked', 'uninvoked', 'f', 'f', '0', null, '9', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('140', '11', '83', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '9', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('141', '14', '84', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.302+06', '2015-10-10 22:47:01.302+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('142', '14', '84', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('143', '14', '84', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('144', '14', '84', 'invoked', 'uninvoked', 'f', 'f', '0', '26', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('145', '14', '84', 'confirmed', 'unconfirmed', 'f', 'f', '0', '26', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('146', '14', '84', 'invoked', 'uninvoked', 'f', 'f', '0', '27', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('147', '14', '84', 'lap', 'unlap', 'f', 'f', '0', null, null, '11', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('148', '14', '84', 'invoked', 'uninvoked', 'f', 'f', '0', null, '10', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('149', '14', '84', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '10', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('150', '14', '84', 'invoked', 'uninvoked', 'f', 'f', '0', '28', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('151', '14', '84', 'confirmed', 'unconfirmed', 'f', 'f', '0', '28', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('152', '15', '85', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('153', '15', '85', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('154', '15', '85', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('155', '15', '85', 'invoked', 'uninvoked', 'f', 'f', '0', '29', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('156', '15', '85', 'confirmed', 'unconfirmed', 'f', 'f', '0', '29', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('157', '15', '85', 'invoked', 'uninvoked', 'f', 'f', '0', '30', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('158', '15', '85', 'lap', 'unlap', 'f', 'f', '0', null, null, '12', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('159', '15', '85', 'invoked', 'uninvoked', 'f', 'f', '0', null, '11', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('160', '15', '85', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '11', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('161', '15', '85', 'invoked', 'uninvoked', 'f', 'f', '0', '31', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('162', '15', '85', 'lap', 'unlap', 'f', 'f', '0', null, null, '13', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('163', '15', '85', 'invoked', 'uninvoked', 'f', 'f', '0', null, '12', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('164', '15', '86', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('165', '15', '86', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('166', '15', '86', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('167', '15', '86', 'invoked', 'uninvoked', 'f', 'f', '0', '32', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('168', '15', '86', 'confirmed', 'unconfirmed', 'f', 'f', '0', '32', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('169', '15', '86', 'invoked', 'uninvoked', 'f', 'f', '0', '33', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('170', '15', '86', 'lap', 'unlap', 'f', 'f', '0', null, null, '14', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('171', '15', '86', 'invoked', 'uninvoked', 'f', 'f', '0', null, '13', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('172', '15', '86', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '13', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('173', '15', '86', 'invoked', 'uninvoked', 'f', 'f', '0', '34', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('174', '15', '86', 'lap', 'unlap', 'f', 'f', '0', null, null, '15', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('175', '15', '86', 'invoked', 'uninvoked', 'f', 'f', '0', null, '14', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('176', '14', '87', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.302+06', '2015-10-10 22:47:01.302+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('177', '14', '87', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('178', '14', '88', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.302+06', '2015-10-10 22:47:01.302+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('179', '14', '87', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('180', '14', '88', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('181', '14', '87', 'invoked', 'uninvoked', 'f', 'f', '0', '36', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('182', '14', '88', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('183', '14', '88', 'invoked', 'uninvoked', 'f', 'f', '0', '35', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('184', '14', '87', 'confirmed', 'unconfirmed', 'f', 'f', '0', '36', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('185', '14', '87', 'invoked', 'uninvoked', 'f', 'f', '0', '37', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('186', '14', '88', 'confirmed', 'unconfirmed', 'f', 'f', '0', '35', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('187', '14', '87', 'lap', 'unlap', 'f', 'f', '0', null, null, '16', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('188', '14', '88', 'invoked', 'uninvoked', 'f', 'f', '0', '38', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('189', '14', '88', 'lap', 'unlap', 'f', 'f', '0', null, null, '17', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('190', '14', '87', 'invoked', 'uninvoked', 'f', 'f', '0', null, '16', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('191', '14', '87', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '16', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('192', '14', '88', 'invoked', 'uninvoked', 'f', 'f', '0', null, '15', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('193', '14', '87', 'invoked', 'uninvoked', 'f', 'f', '0', '40', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('194', '14', '88', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '15', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('195', '14', '88', 'invoked', 'uninvoked', 'f', 'f', '0', '39', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('196', '14', '87', 'confirmed', 'unconfirmed', 'f', 'f', '0', '40', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('197', '14', '88', 'confirmed', 'unconfirmed', 'f', 'f', '0', '39', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('198', '16', '89', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('199', '16', '89', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('200', '16', '89', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('201', '16', '89', 'invoked', 'uninvoked', 'f', 'f', '0', '41', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('202', '16', '89', 'invoked', 'uninvoked', 'f', 'f', '0', '42', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('203', '16', '89', 'lap', 'unlap', 'f', 'f', '0', null, null, '18', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('204', '16', '89', 'invoked', 'uninvoked', 'f', 'f', '0', null, '17', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('205', '16', '89', 'invoked', 'uninvoked', 'f', 'f', '0', '43', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('206', '16', '90', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('207', '16', '90', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('208', '16', '90', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('209', '16', '90', 'invoked', 'uninvoked', 'f', 'f', '0', '44', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('210', '16', '90', 'invoked', 'uninvoked', 'f', 'f', '0', '45', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('211', '16', '90', 'lap', 'unlap', 'f', 'f', '0', null, null, '19', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('212', '16', '90', 'invoked', 'uninvoked', 'f', 'f', '0', null, '18', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('213', '16', '90', 'invoked', 'uninvoked', 'f', 'f', '0', '46', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('214', '16', '91', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('215', '16', '91', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('216', '16', '91', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('217', '16', '91', 'invoked', 'uninvoked', 'f', 'f', '0', '47', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('218', '16', '91', 'invoked', 'uninvoked', 'f', 'f', '0', '48', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('219', '16', '91', 'lap', 'unlap', 'f', 'f', '0', null, null, '20', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('220', '16', '91', 'invoked', 'uninvoked', 'f', 'f', '0', null, '19', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('221', '16', '91', 'invoked', 'uninvoked', 'f', 'f', '0', '49', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('222', '16', '92', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('223', '16', '92', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('224', '16', '92', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('225', '16', '92', 'invoked', 'uninvoked', 'f', 'f', '0', '50', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('226', '16', '92', 'invoked', 'uninvoked', 'f', 'f', '0', '51', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('227', '16', '92', 'lap', 'unlap', 'f', 'f', '0', null, null, '21', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('228', '16', '92', 'invoked', 'uninvoked', 'f', 'f', '0', null, '20', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('229', '16', '92', 'invoked', 'uninvoked', 'f', 'f', '0', '52', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('230', '16', '93', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('231', '16', '93', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('232', '16', '93', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('233', '16', '93', 'invoked', 'uninvoked', 'f', 'f', '0', '53', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('234', '16', '93', 'invoked', 'uninvoked', 'f', 'f', '0', '54', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('235', '16', '93', 'lap', 'unlap', 'f', 'f', '0', null, null, '22', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('236', '16', '93', 'invoked', 'uninvoked', 'f', 'f', '0', null, '21', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('237', '16', '93', 'invoked', 'uninvoked', 'f', 'f', '0', '55', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('238', '16', '94', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('239', '16', '94', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('240', '16', '94', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('241', '16', '94', 'invoked', 'uninvoked', 'f', 'f', '0', '56', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('242', '16', '94', 'invoked', 'uninvoked', 'f', 'f', '0', '57', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('243', '16', '94', 'lap', 'unlap', 'f', 'f', '0', null, null, '23', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('244', '16', '94', 'invoked', 'uninvoked', 'f', 'f', '0', null, '22', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('245', '16', '94', 'invoked', 'uninvoked', 'f', 'f', '0', '58', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('246', '15', '95', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('247', '15', '95', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('248', '15', '95', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 14:31:56.713+06', '2015-10-11 14:31:56.713+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('249', '15', '95', 'invoked', 'uninvoked', 'f', 'f', '0', '59', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('250', '15', '95', 'confirmed', 'unconfirmed', 'f', 'f', '0', '59', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('251', '15', '95', 'invoked', 'uninvoked', 'f', 'f', '0', '60', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('252', '15', '95', 'lap', 'unlap', 'f', 'f', '0', null, null, '24', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('253', '15', '95', 'invoked', 'uninvoked', 'f', 'f', '0', null, '23', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('254', '15', '95', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '23', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('255', '15', '95', 'invoked', 'uninvoked', 'f', 'f', '0', '61', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('256', '15', '95', 'lap', 'unlap', 'f', 'f', '0', null, null, '25', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('257', '15', '95', 'invoked', 'uninvoked', 'f', 'f', '0', null, '24', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('258', '16', '96', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('259', '16', '96', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('260', '16', '96', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('261', '16', '96', 'invoked', 'uninvoked', 'f', 'f', '0', '64', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('262', '16', '96', 'invoked', 'uninvoked', 'f', 'f', '0', '62', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('263', '16', '96', 'lap', 'unlap', 'f', 'f', '0', null, null, '26', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('264', '16', '96', 'invoked', 'uninvoked', 'f', 'f', '0', null, '25', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('265', '16', '96', 'invoked', 'uninvoked', 'f', 'f', '0', '63', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('266', '16', '97', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('267', '16', '97', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('268', '16', '97', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-11 16:28:54.021+06', '2015-10-11 16:28:54.021+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('269', '16', '97', 'invoked', 'uninvoked', 'f', 'f', '0', '67', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('270', '16', '97', 'invoked', 'uninvoked', 'f', 'f', '0', '65', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('271', '16', '97', 'lap', 'unlap', 'f', 'f', '0', null, null, '27', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('272', '16', '97', 'invoked', 'uninvoked', 'f', 'f', '0', null, '26', null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('273', '16', '97', 'invoked', 'uninvoked', 'f', 'f', '0', '66', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('274', '17', '98', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-24 14:48:43.171+06', '2015-10-24 14:48:43.171+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('275', '17', '98', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-24 14:48:43.187+06', '2015-10-24 14:48:43.187+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('276', '17', '98', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-24 14:48:43.187+06', '2015-10-24 14:48:43.187+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('277', '17', '98', 'invoked', 'uninvoked', 'f', 'f', '0', '68', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('278', '17', '98', 'confirmed', 'unconfirmed', 'f', 'f', '0', '68', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('279', '14', '99', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.302+06', '2015-10-10 22:47:01.302+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('280', '14', '99', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('281', '14', '99', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-10 22:47:01.318+06', '2015-10-10 22:47:01.318+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('282', '14', '99', 'invoked', 'uninvoked', 'f', 'f', '0', '69', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('283', '14', '99', 'confirmed', 'unconfirmed', 'f', 'f', '0', '69', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('284', '14', '99', 'invoked', 'uninvoked', 'f', 'f', '0', '70', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('285', '14', '99', 'lap', 'unlap', 'f', 'f', '0', null, null, '28', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('286', '14', '99', 'invoked', 'uninvoked', 'f', 'f', '0', null, '27', null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('287', '14', '99', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '27', null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('288', '14', '99', 'invoked', 'uninvoked', 'f', 'f', '0', '71', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('289', '14', '99', 'confirmed', 'unconfirmed', 'f', 'f', '0', '71', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('290', '17', '100', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '2015-10-24 14:48:43.171+06', '2015-10-24 14:48:43.171+06', 'en', 'initiating', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('291', '17', '100', 'invoking', 'paused', 't', 'f', '0', null, null, null, '2015-10-24 14:48:43.187+06', '2015-10-24 14:48:43.187+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('292', '17', '100', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '2015-10-24 14:48:43.187+06', '2015-10-24 14:48:43.187+06', 'en', 'finishing', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('293', '17', '100', 'invoked', 'uninvoked', 'f', 'f', '0', '72', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."session_initial_states" VALUES ('294', '17', '100', 'confirmed', 'unconfirmed', 'f', 'f', '0', '72', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');

-- ----------------------------
-- Table structure for session_proc_elements
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_proc_elements";
CREATE TABLE "public"."session_proc_elements" (
"id" int4 DEFAULT nextval('session_proc_elements_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"desc" varchar COLLATE "default" NOT NULL,
"business_id" int4 NOT NULL,
"bprocess_id" int4 NOT NULL,
"session_id" int4 NOT NULL,
"b_type" varchar COLLATE "default" NOT NULL,
"type_title" varchar COLLATE "default" NOT NULL,
"space_id" int4,
"order" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_proc_elements
-- ----------------------------
INSERT INTO "public"."session_proc_elements" VALUES ('23', 'cf', 'cfg', '2', '10', '81', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('24', 'cf', 'cfg', '2', '10', '82', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('25', 'cn', 'cn', '2', '11', '83', 'brick', 'container_brick', null, '1', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('26', 'cf', '', '2', '14', '84', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('27', 'еу', '', '2', '14', '84', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('28', 'final cf', '', '2', '14', '84', 'block', 'confirm', null, '3', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('29', 'test cf', 'cf', '2', '15', '85', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('30', 'cn', '', '2', '15', '85', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('31', 'cn', '', '2', '15', '85', 'brick', 'container_brick', null, '3', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('32', 'test cf', 'cf', '2', '15', '86', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('33', 'cn', '', '2', '15', '86', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('34', 'cn', '', '2', '15', '86', 'brick', 'container_brick', null, '3', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('35', 'cf', '', '2', '14', '88', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('36', 'cf', '', '2', '14', '87', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('37', 'еу', '', '2', '14', '87', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('38', 'еу', '', '2', '14', '88', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('39', 'final cf', '', '2', '14', '88', 'block', 'confirm', null, '3', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('40', 'final cf', '', '2', '14', '87', 'block', 'confirm', null, '3', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('41', 'ph', 'ph', '2', '16', '89', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('42', 'cn ph', '', '2', '16', '89', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('43', 'ph 2', '', '2', '16', '89', 'block', 'placeholder', null, '3', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('44', 'ph', 'ph', '2', '16', '90', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('45', 'cn ph', '', '2', '16', '90', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('46', 'ph 2', '', '2', '16', '90', 'block', 'placeholder', null, '3', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('47', 'ph', 'ph', '2', '16', '91', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('48', 'cn ph', '', '2', '16', '91', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('49', 'ph 2', '', '2', '16', '91', 'block', 'placeholder', null, '3', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('50', 'ph', 'ph', '2', '16', '92', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('51', 'cn ph', '', '2', '16', '92', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('52', 'ph 2', '', '2', '16', '92', 'block', 'placeholder', null, '3', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('53', 'ph', 'ph', '2', '16', '93', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('54', 'cn ph', '', '2', '16', '93', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('55', 'ph 2', '', '2', '16', '93', 'block', 'placeholder', null, '3', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('56', 'ph', 'ph', '2', '16', '94', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('57', 'cn ph', '', '2', '16', '94', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('58', 'ph 2', '', '2', '16', '94', 'block', 'placeholder', null, '3', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('59', 'test cf', 'cf', '2', '15', '95', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('60', 'cn', '', '2', '15', '95', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('61', 'cn', '', '2', '15', '95', 'brick', 'container_brick', null, '3', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('62', 'cn ph', '', '2', '16', '96', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('63', 'еуаф', 'аываыв', '2', '16', '96', 'block', 'placeholder', null, '3', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('64', 'ph', 'ph', '2', '16', '96', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('65', 'cn ph', '', '2', '16', '97', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('66', 'еуаф', 'аываыв', '2', '16', '97', 'block', 'placeholder', null, '3', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('67', 'ph', 'ph', '2', '16', '97', 'block', 'placeholder', null, '1', null, null);
INSERT INTO "public"."session_proc_elements" VALUES ('68', 'cf', 'cf', '2', '17', '98', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('69', 'cf', '', '2', '14', '99', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('70', 'еу', '', '2', '14', '99', 'brick', 'container_brick', null, '2', '2015-06-19 22:43:31.607+06', '2015-06-19 22:43:31.738+06');
INSERT INTO "public"."session_proc_elements" VALUES ('71', 'final cf', '', '2', '14', '99', 'block', 'confirm', null, '3', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_proc_elements" VALUES ('72', 'cf', 'cf', '2', '17', '100', 'block', 'confirm', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');

-- ----------------------------
-- Table structure for session_reaction_state_outs
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_reaction_state_outs";
CREATE TABLE "public"."session_reaction_state_outs" (
"id" int4 DEFAULT nextval('session_reaction_state_outs_id_seq'::regclass) NOT NULL,
"session_state_id" int4 NOT NULL,
"reaction_id" int4 NOT NULL,
"on" bool NOT NULL,
"on_rate" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_reaction_state_outs
-- ----------------------------
INSERT INTO "public"."session_reaction_state_outs" VALUES ('21', '128', '21', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('22', '133', '22', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('23', '140', '23', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('24', '145', '24', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('25', '149', '25', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('26', '151', '26', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('27', '156', '27', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('28', '160', '28', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('29', '168', '29', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('30', '172', '30', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('31', '184', '31', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('32', '191', '32', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('33', '196', '33', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('34', '186', '34', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('35', '194', '35', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('36', '197', '36', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('37', '250', '37', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('38', '254', '38', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('39', '278', '39', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('40', '283', '40', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('41', '287', '41', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('42', '289', '42', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');
INSERT INTO "public"."session_reaction_state_outs" VALUES ('43', '294', '43', 't', '100', '2015-06-19 22:43:55.008+06', '2015-06-19 22:43:55.008+06');

-- ----------------------------
-- Table structure for session_reactions
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_reactions";
CREATE TABLE "public"."session_reactions" (
"id" int4 DEFAULT nextval('session_reactions_id_seq'::regclass) NOT NULL,
"bprocess_id" int4 NOT NULL,
"session_id" int4 NOT NULL,
"autostart" bool NOT NULL,
"element_id" int4 NOT NULL,
"state_ref_id" int4,
"title" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_reactions
-- ----------------------------
INSERT INTO "public"."session_reactions" VALUES ('21', '10', '81', 'f', '29', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('22', '10', '82', 'f', '30', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('23', '11', '83', 'f', '32', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('24', '14', '84', 'f', '33', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('25', '14', '84', 'f', '35', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('26', '14', '84', 'f', '36', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('27', '15', '85', 'f', '37', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('28', '15', '85', 'f', '39', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('29', '15', '86', 'f', '42', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('30', '15', '86', 'f', '44', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('31', '14', '87', 'f', '47', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('32', '14', '87', 'f', '49', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('33', '14', '87', 'f', '50', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('34', '14', '88', 'f', '51', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('35', '14', '88', 'f', '53', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('36', '14', '88', 'f', '54', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('37', '15', '95', 'f', '79', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('38', '15', '95', 'f', '81', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('39', '17', '98', 'f', '92', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('40', '14', '99', 'f', '93', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('41', '14', '99', 'f', '95', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('42', '14', '99', 'f', '96', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');
INSERT INTO "public"."session_reactions" VALUES ('43', '17', '100', 'f', '97', null, 'Confirm', '2015-06-19 22:43:54.954+06', '2015-06-19 22:43:54.954+06');

-- ----------------------------
-- Table structure for session_space_elements
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_space_elements";
CREATE TABLE "public"."session_space_elements" (
"id" int4 DEFAULT nextval('session_space_elements_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"desc" varchar COLLATE "default" NOT NULL,
"business_id" int4 NOT NULL,
"bprocess_id" int4 NOT NULL,
"session_id" int4 NOT NULL,
"b_type" varchar COLLATE "default" NOT NULL,
"type_title" varchar COLLATE "default" NOT NULL,
"own_space_id" int4,
"owned_space_id" int4 NOT NULL,
"space_role" varchar COLLATE "default",
"order" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_space_elements
-- ----------------------------
INSERT INTO "public"."session_space_elements" VALUES ('9', 'cf', 'cf', '2', '11', '83', 'block', 'confirm', null, '10', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_space_elements" VALUES ('10', 'авыа', '', '2', '14', '84', 'block', 'confirm', null, '11', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_space_elements" VALUES ('11', 'cn cf', '', '2', '15', '85', 'block', 'confirm', null, '12', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_space_elements" VALUES ('12', 'cn ph', '', '2', '15', '85', 'block', 'placeholder', null, '13', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('13', 'cn cf', '', '2', '15', '86', 'block', 'confirm', null, '14', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_space_elements" VALUES ('14', 'cn ph', '', '2', '15', '86', 'block', 'placeholder', null, '15', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('15', 'авыа', '', '2', '14', '88', 'block', 'confirm', null, '17', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_space_elements" VALUES ('16', 'авыа', '', '2', '14', '87', 'block', 'confirm', null, '16', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_space_elements" VALUES ('17', 'ph', '', '2', '16', '89', 'block', 'placeholder', null, '18', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('18', 'ph', '', '2', '16', '90', 'block', 'placeholder', null, '19', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('19', 'ph', '', '2', '16', '91', 'block', 'placeholder', null, '20', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('20', 'ph', '', '2', '16', '92', 'block', 'placeholder', null, '21', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('21', 'ph', '', '2', '16', '93', 'block', 'placeholder', null, '22', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('22', 'ph', '', '2', '16', '94', 'block', 'placeholder', null, '23', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('23', 'cn cf', '', '2', '15', '95', 'block', 'confirm', null, '24', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."session_space_elements" VALUES ('24', 'cn ph', '', '2', '15', '95', 'block', 'placeholder', null, '25', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('25', 'ph', '', '2', '16', '96', 'block', 'placeholder', null, '26', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('26', 'ph', '', '2', '16', '97', 'block', 'placeholder', null, '27', null, '1', null, null);
INSERT INTO "public"."session_space_elements" VALUES ('27', 'авыа', '', '2', '14', '99', 'block', 'confirm', null, '28', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');

-- ----------------------------
-- Table structure for session_spaces
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_spaces";
CREATE TABLE "public"."session_spaces" (
"id" int4 DEFAULT nextval('session_spaces_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"session_id" int4 NOT NULL,
"index" int4 NOT NULL,
"container" bool DEFAULT false NOT NULL,
"subbrick" bool DEFAULT false NOT NULL,
"brick_front_id" int4,
"brick_nested_id" int4,
"nesting_level" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_spaces
-- ----------------------------
INSERT INTO "public"."session_spaces" VALUES ('10', '11', '83', '1', 't', 'f', '25', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('11', '14', '84', '1', 't', 'f', '27', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('12', '15', '85', '1', 't', 'f', '30', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('13', '15', '85', '1', 't', 'f', '31', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('14', '15', '86', '1', 't', 'f', '33', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('15', '15', '86', '1', 't', 'f', '34', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('16', '14', '87', '1', 't', 'f', '37', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('17', '14', '88', '1', 't', 'f', '38', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('18', '16', '89', '1', 't', 'f', '42', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('19', '16', '90', '1', 't', 'f', '45', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('20', '16', '91', '1', 't', 'f', '48', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('21', '16', '92', '1', 't', 'f', '51', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('22', '16', '93', '1', 't', 'f', '54', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('23', '16', '94', '1', 't', 'f', '57', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('24', '15', '95', '1', 't', 'f', '60', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('25', '15', '95', '1', 't', 'f', '61', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('26', '16', '96', '1', 't', 'f', '62', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('27', '16', '97', '1', 't', 'f', '65', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');
INSERT INTO "public"."session_spaces" VALUES ('28', '14', '99', '1', 't', 'f', '70', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');

-- ----------------------------
-- Table structure for session_state_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_state_logs";
CREATE TABLE "public"."session_state_logs" (
"id" int4 DEFAULT nextval('session_state_logs_id_seq'::regclass) NOT NULL,
"session_id" int4 NOT NULL,
"state_id" int4 NOT NULL,
"on" bool DEFAULT false NOT NULL,
"on_rate" int4 DEFAULT 0 NOT NULL,
"reason" varchar COLLATE "default" NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_state_logs
-- ----------------------------
INSERT INTO "public"."session_state_logs" VALUES ('155', '81', '426', 't', '100', 'flow', '2015-09-24 01:04:57.854+06', '2015-09-24 01:04:57.854+06');
INSERT INTO "public"."session_state_logs" VALUES ('156', '81', '427', 't', '100', 'flow', '2015-09-24 01:04:57.854+06', '2015-09-24 01:04:57.854+06');
INSERT INTO "public"."session_state_logs" VALUES ('157', '81', '429', 't', '100', 'flow', '2015-09-24 01:04:58.062+06', '2015-09-24 01:04:58.062+06');
INSERT INTO "public"."session_state_logs" VALUES ('158', '81', '426', 't', '100', 'flow', '2015-09-24 01:05:32.544+06', '2015-09-24 01:05:32.544+06');
INSERT INTO "public"."session_state_logs" VALUES ('159', '81', '427', 't', '100', 'flow', '2015-09-24 01:05:32.544+06', '2015-09-24 01:05:32.544+06');
INSERT INTO "public"."session_state_logs" VALUES ('160', '81', '429', 't', '100', 'flow', '2015-09-24 01:05:32.557+06', '2015-09-24 01:05:32.557+06');
INSERT INTO "public"."session_state_logs" VALUES ('161', '81', '428', 't', '100', 'flow', '2015-09-24 01:05:32.558+06', '2015-09-24 01:05:32.558+06');
INSERT INTO "public"."session_state_logs" VALUES ('162', '82', '431', 't', '100', 'flow', '2015-09-24 01:08:27.412+06', '2015-09-24 01:08:27.412+06');
INSERT INTO "public"."session_state_logs" VALUES ('163', '82', '432', 't', '100', 'flow', '2015-09-24 01:08:27.412+06', '2015-09-24 01:08:27.412+06');
INSERT INTO "public"."session_state_logs" VALUES ('164', '82', '434', 't', '100', 'flow', '2015-09-24 01:08:27.92+06', '2015-09-24 01:08:27.92+06');
INSERT INTO "public"."session_state_logs" VALUES ('165', '82', '431', 't', '100', 'flow', '2015-09-24 01:08:56.176+06', '2015-09-24 01:08:56.176+06');
INSERT INTO "public"."session_state_logs" VALUES ('166', '82', '432', 't', '100', 'flow', '2015-09-24 01:08:56.176+06', '2015-09-24 01:08:56.176+06');
INSERT INTO "public"."session_state_logs" VALUES ('167', '82', '434', 't', '100', 'flow', '2015-09-24 01:08:56.192+06', '2015-09-24 01:08:56.192+06');
INSERT INTO "public"."session_state_logs" VALUES ('168', '82', '433', 't', '100', 'flow', '2015-09-24 01:08:56.194+06', '2015-09-24 01:08:56.194+06');
INSERT INTO "public"."session_state_logs" VALUES ('169', '83', '436', 't', '100', 'flow', '2015-09-30 16:14:03.914+06', '2015-09-30 16:14:03.914+06');
INSERT INTO "public"."session_state_logs" VALUES ('170', '83', '437', 't', '100', 'flow', '2015-09-30 16:14:03.914+06', '2015-09-30 16:14:03.914+06');
INSERT INTO "public"."session_state_logs" VALUES ('171', '83', '439', 't', '100', 'flow', '2015-09-30 16:14:04.337+06', '2015-09-30 16:14:04.337+06');
INSERT INTO "public"."session_state_logs" VALUES ('172', '83', '441', 't', '100', 'flow', '2015-09-30 16:14:04.532+06', '2015-09-30 16:14:04.532+06');
INSERT INTO "public"."session_state_logs" VALUES ('173', '83', '440', 't', '100', 'flow', '2015-09-30 16:14:04.941+06', '2015-09-30 16:14:04.941+06');
INSERT INTO "public"."session_state_logs" VALUES ('174', '84', '443', 't', '100', 'flow', '2015-10-10 23:33:11.799+06', '2015-10-10 23:33:11.799+06');
INSERT INTO "public"."session_state_logs" VALUES ('175', '84', '444', 't', '100', 'flow', '2015-10-10 23:33:11.799+06', '2015-10-10 23:33:11.799+06');
INSERT INTO "public"."session_state_logs" VALUES ('176', '84', '446', 't', '100', 'flow', '2015-10-10 23:33:12.473+06', '2015-10-10 23:33:12.476+06');
INSERT INTO "public"."session_state_logs" VALUES ('177', '84', '443', 't', '100', 'flow', '2015-10-10 23:40:16.57+06', '2015-10-10 23:40:16.57+06');
INSERT INTO "public"."session_state_logs" VALUES ('178', '84', '444', 't', '100', 'flow', '2015-10-10 23:40:16.57+06', '2015-10-10 23:40:16.57+06');
INSERT INTO "public"."session_state_logs" VALUES ('179', '84', '446', 't', '100', 'flow', '2015-10-10 23:40:16.599+06', '2015-10-10 23:40:16.599+06');
INSERT INTO "public"."session_state_logs" VALUES ('180', '84', '448', 't', '100', 'flow', '2015-10-10 23:40:16.691+06', '2015-10-10 23:40:16.691+06');
INSERT INTO "public"."session_state_logs" VALUES ('181', '84', '450', 't', '100', 'flow', '2015-10-10 23:40:16.873+06', '2015-10-10 23:40:16.873+06');
INSERT INTO "public"."session_state_logs" VALUES ('182', '84', '449', 't', '100', 'flow', '2015-10-10 23:40:17.45+06', '2015-10-10 23:40:17.45+06');
INSERT INTO "public"."session_state_logs" VALUES ('183', '84', '443', 't', '100', 'flow', '2015-10-10 23:41:07.959+06', '2015-10-10 23:41:07.959+06');
INSERT INTO "public"."session_state_logs" VALUES ('184', '84', '444', 't', '100', 'flow', '2015-10-10 23:41:07.959+06', '2015-10-10 23:41:07.959+06');
INSERT INTO "public"."session_state_logs" VALUES ('185', '84', '446', 't', '100', 'flow', '2015-10-10 23:41:07.965+06', '2015-10-10 23:41:07.965+06');
INSERT INTO "public"."session_state_logs" VALUES ('186', '84', '448', 't', '100', 'flow', '2015-10-10 23:41:07.968+06', '2015-10-10 23:41:07.968+06');
INSERT INTO "public"."session_state_logs" VALUES ('187', '84', '450', 't', '100', 'flow', '2015-10-10 23:41:07.988+06', '2015-10-10 23:41:07.988+06');
INSERT INTO "public"."session_state_logs" VALUES ('188', '84', '449', 't', '100', 'flow', '2015-10-10 23:41:07.996+06', '2015-10-10 23:41:07.996+06');
INSERT INTO "public"."session_state_logs" VALUES ('189', '84', '452', 't', '100', 'flow', '2015-10-10 23:41:08.012+06', '2015-10-10 23:41:08.012+06');
INSERT INTO "public"."session_state_logs" VALUES ('190', '84', '443', 't', '100', 'flow', '2015-10-10 23:41:43.287+06', '2015-10-10 23:41:43.287+06');
INSERT INTO "public"."session_state_logs" VALUES ('191', '84', '444', 't', '100', 'flow', '2015-10-10 23:41:43.287+06', '2015-10-10 23:41:43.287+06');
INSERT INTO "public"."session_state_logs" VALUES ('192', '84', '446', 't', '100', 'flow', '2015-10-10 23:41:43.291+06', '2015-10-10 23:41:43.291+06');
INSERT INTO "public"."session_state_logs" VALUES ('193', '84', '448', 't', '100', 'flow', '2015-10-10 23:41:43.296+06', '2015-10-10 23:41:43.296+06');
INSERT INTO "public"."session_state_logs" VALUES ('194', '84', '450', 't', '100', 'flow', '2015-10-10 23:41:43.344+06', '2015-10-10 23:41:43.344+06');
INSERT INTO "public"."session_state_logs" VALUES ('195', '84', '449', 't', '100', 'flow', '2015-10-10 23:41:43.349+06', '2015-10-10 23:41:43.349+06');
INSERT INTO "public"."session_state_logs" VALUES ('196', '84', '452', 't', '100', 'flow', '2015-10-10 23:41:43.356+06', '2015-10-10 23:41:43.356+06');
INSERT INTO "public"."session_state_logs" VALUES ('197', '84', '445', 't', '100', 'flow', '2015-10-10 23:41:43.357+06', '2015-10-10 23:41:43.357+06');
INSERT INTO "public"."session_state_logs" VALUES ('198', '84', '445', 't', '100', 'flow', '2015-10-10 23:41:43.359+06', '2015-10-10 23:41:43.359+06');
INSERT INTO "public"."session_state_logs" VALUES ('199', '85', '454', 't', '100', 'flow', '2015-10-11 14:36:38.118+06', '2015-10-11 14:36:38.118+06');
INSERT INTO "public"."session_state_logs" VALUES ('200', '85', '455', 't', '100', 'flow', '2015-10-11 14:36:38.118+06', '2015-10-11 14:36:38.118+06');
INSERT INTO "public"."session_state_logs" VALUES ('201', '85', '457', 't', '100', 'flow', '2015-10-11 14:36:38.421+06', '2015-10-11 14:36:38.421+06');
INSERT INTO "public"."session_state_logs" VALUES ('202', '85', '454', 't', '100', 'flow', '2015-10-11 14:37:06.56+06', '2015-10-11 14:37:06.56+06');
INSERT INTO "public"."session_state_logs" VALUES ('203', '85', '455', 't', '100', 'flow', '2015-10-11 14:37:06.56+06', '2015-10-11 14:37:06.56+06');
INSERT INTO "public"."session_state_logs" VALUES ('204', '85', '457', 't', '100', 'flow', '2015-10-11 14:37:06.57+06', '2015-10-11 14:37:06.57+06');
INSERT INTO "public"."session_state_logs" VALUES ('205', '85', '459', 't', '100', 'flow', '2015-10-11 14:37:06.646+06', '2015-10-11 14:37:06.646+06');
INSERT INTO "public"."session_state_logs" VALUES ('206', '85', '461', 't', '100', 'flow', '2015-10-11 14:37:06.739+06', '2015-10-11 14:37:06.74+06');
INSERT INTO "public"."session_state_logs" VALUES ('207', '85', '460', 't', '100', 'flow', '2015-10-11 14:37:06.926+06', '2015-10-11 14:37:06.926+06');
INSERT INTO "public"."session_state_logs" VALUES ('208', '85', '454', 't', '100', 'flow', '2015-10-11 14:37:33.85+06', '2015-10-11 14:37:33.85+06');
INSERT INTO "public"."session_state_logs" VALUES ('209', '85', '455', 't', '100', 'flow', '2015-10-11 14:37:33.85+06', '2015-10-11 14:37:33.85+06');
INSERT INTO "public"."session_state_logs" VALUES ('210', '85', '457', 't', '100', 'flow', '2015-10-11 14:37:33.854+06', '2015-10-11 14:37:33.854+06');
INSERT INTO "public"."session_state_logs" VALUES ('211', '85', '459', 't', '100', 'flow', '2015-10-11 14:37:33.858+06', '2015-10-11 14:37:33.858+06');
INSERT INTO "public"."session_state_logs" VALUES ('212', '85', '461', 't', '100', 'flow', '2015-10-11 14:37:33.869+06', '2015-10-11 14:37:33.869+06');
INSERT INTO "public"."session_state_logs" VALUES ('213', '85', '460', 't', '100', 'flow', '2015-10-11 14:37:33.873+06', '2015-10-11 14:37:33.873+06');
INSERT INTO "public"."session_state_logs" VALUES ('214', '85', '463', 't', '100', 'flow', '2015-10-11 14:37:33.937+06', '2015-10-11 14:37:33.937+06');
INSERT INTO "public"."session_state_logs" VALUES ('215', '85', '464', 't', '100', 'flow', '2015-10-11 14:37:33.944+06', '2015-10-11 14:37:33.944+06');
INSERT INTO "public"."session_state_logs" VALUES ('216', '85', '456', 't', '100', 'flow', '2015-10-11 14:37:33.947+06', '2015-10-11 14:37:33.947+06');
INSERT INTO "public"."session_state_logs" VALUES ('217', '85', '456', 't', '100', 'flow', '2015-10-11 14:37:33.953+06', '2015-10-11 14:37:33.953+06');
INSERT INTO "public"."session_state_logs" VALUES ('218', '85', '456', 't', '100', 'flow', '2015-10-11 14:37:33.955+06', '2015-10-11 14:37:33.955+06');
INSERT INTO "public"."session_state_logs" VALUES ('219', '86', '466', 't', '100', 'flow', '2015-10-11 14:39:12.87+06', '2015-10-11 14:39:12.87+06');
INSERT INTO "public"."session_state_logs" VALUES ('220', '86', '467', 't', '100', 'flow', '2015-10-11 14:39:12.87+06', '2015-10-11 14:39:12.87+06');
INSERT INTO "public"."session_state_logs" VALUES ('221', '86', '469', 't', '100', 'flow', '2015-10-11 14:39:12.874+06', '2015-10-11 14:39:12.874+06');
INSERT INTO "public"."session_state_logs" VALUES ('222', '86', '466', 't', '100', 'flow', '2015-10-11 14:39:48.222+06', '2015-10-11 14:39:48.222+06');
INSERT INTO "public"."session_state_logs" VALUES ('223', '86', '467', 't', '100', 'flow', '2015-10-11 14:39:48.222+06', '2015-10-11 14:39:48.222+06');
INSERT INTO "public"."session_state_logs" VALUES ('224', '86', '469', 't', '100', 'flow', '2015-10-11 14:39:48.225+06', '2015-10-11 14:39:48.225+06');
INSERT INTO "public"."session_state_logs" VALUES ('225', '86', '471', 't', '100', 'flow', '2015-10-11 14:39:48.229+06', '2015-10-11 14:39:48.229+06');
INSERT INTO "public"."session_state_logs" VALUES ('226', '86', '473', 't', '100', 'flow', '2015-10-11 14:39:48.309+06', '2015-10-11 14:39:48.309+06');
INSERT INTO "public"."session_state_logs" VALUES ('227', '86', '472', 't', '100', 'flow', '2015-10-11 14:39:48.315+06', '2015-10-11 14:39:48.315+06');
INSERT INTO "public"."session_state_logs" VALUES ('228', '86', '466', 't', '100', 'flow', '2015-10-11 14:40:29.918+06', '2015-10-11 14:40:29.918+06');
INSERT INTO "public"."session_state_logs" VALUES ('229', '86', '467', 't', '100', 'flow', '2015-10-11 14:40:29.918+06', '2015-10-11 14:40:29.918+06');
INSERT INTO "public"."session_state_logs" VALUES ('230', '86', '469', 't', '100', 'flow', '2015-10-11 14:40:29.922+06', '2015-10-11 14:40:29.922+06');
INSERT INTO "public"."session_state_logs" VALUES ('231', '86', '471', 't', '100', 'flow', '2015-10-11 14:40:29.925+06', '2015-10-11 14:40:29.925+06');
INSERT INTO "public"."session_state_logs" VALUES ('232', '86', '473', 't', '100', 'flow', '2015-10-11 14:40:29.932+06', '2015-10-11 14:40:29.932+06');
INSERT INTO "public"."session_state_logs" VALUES ('233', '86', '472', 't', '100', 'flow', '2015-10-11 14:40:29.935+06', '2015-10-11 14:40:29.935+06');
INSERT INTO "public"."session_state_logs" VALUES ('234', '86', '475', 't', '100', 'flow', '2015-10-11 14:40:29.939+06', '2015-10-11 14:40:29.939+06');
INSERT INTO "public"."session_state_logs" VALUES ('235', '86', '476', 't', '100', 'flow', '2015-10-11 14:40:30.182+06', '2015-10-11 14:40:30.182+06');
INSERT INTO "public"."session_state_logs" VALUES ('236', '86', '468', 't', '100', 'flow', '2015-10-11 14:40:30.185+06', '2015-10-11 14:40:30.185+06');
INSERT INTO "public"."session_state_logs" VALUES ('237', '86', '468', 't', '100', 'flow', '2015-10-11 14:40:30.186+06', '2015-10-11 14:40:30.186+06');
INSERT INTO "public"."session_state_logs" VALUES ('238', '86', '468', 't', '100', 'flow', '2015-10-11 14:40:30.188+06', '2015-10-11 14:40:30.188+06');
INSERT INTO "public"."session_state_logs" VALUES ('239', '87', '478', 't', '100', 'flow', '2015-10-11 14:41:09.43+06', '2015-10-11 14:41:09.43+06');
INSERT INTO "public"."session_state_logs" VALUES ('240', '87', '479', 't', '100', 'flow', '2015-10-11 14:41:09.43+06', '2015-10-11 14:41:09.43+06');
INSERT INTO "public"."session_state_logs" VALUES ('241', '87', '483', 't', '100', 'flow', '2015-10-11 14:41:09.434+06', '2015-10-11 14:41:09.434+06');
INSERT INTO "public"."session_state_logs" VALUES ('242', '88', '480', 't', '100', 'flow', '2015-10-11 14:41:10.17+06', '2015-10-11 14:41:10.17+06');
INSERT INTO "public"."session_state_logs" VALUES ('243', '88', '482', 't', '100', 'flow', '2015-10-11 14:41:10.17+06', '2015-10-11 14:41:10.17+06');
INSERT INTO "public"."session_state_logs" VALUES ('244', '88', '486', 't', '100', 'flow', '2015-10-11 14:41:10.175+06', '2015-10-11 14:41:10.175+06');
INSERT INTO "public"."session_state_logs" VALUES ('245', '89', '500', 't', '100', 'flow', '2015-10-11 16:46:21.759+06', '2015-10-11 16:46:21.759+06');
INSERT INTO "public"."session_state_logs" VALUES ('246', '89', '501', 't', '100', 'flow', '2015-10-11 16:46:21.76+06', '2015-10-11 16:46:21.76+06');
INSERT INTO "public"."session_state_logs" VALUES ('247', '89', '503', 't', '100', 'flow', '2015-10-11 16:46:22.57+06', '2015-10-11 16:46:22.57+06');
INSERT INTO "public"."session_state_logs" VALUES ('248', '89', '504', 't', '100', 'flow', '2015-10-11 16:46:22.977+06', '2015-10-11 16:46:22.977+06');
INSERT INTO "public"."session_state_logs" VALUES ('249', '89', '506', 't', '100', 'flow', '2015-10-11 16:46:23.372+06', '2015-10-11 16:46:23.372+06');
INSERT INTO "public"."session_state_logs" VALUES ('250', '89', '505', 't', '100', 'flow', '2015-10-11 16:46:24.132+06', '2015-10-11 16:46:24.132+06');
INSERT INTO "public"."session_state_logs" VALUES ('251', '89', '507', 't', '100', 'flow', '2015-10-11 16:46:24.159+06', '2015-10-11 16:46:24.159+06');
INSERT INTO "public"."session_state_logs" VALUES ('252', '89', '502', 't', '100', 'flow', '2015-10-11 16:46:24.161+06', '2015-10-11 16:46:24.161+06');
INSERT INTO "public"."session_state_logs" VALUES ('253', '89', '502', 't', '100', 'flow', '2015-10-11 16:46:24.163+06', '2015-10-11 16:46:24.163+06');
INSERT INTO "public"."session_state_logs" VALUES ('254', '90', '508', 't', '100', 'flow', '2015-10-11 16:53:59.087+06', '2015-10-11 16:53:59.087+06');
INSERT INTO "public"."session_state_logs" VALUES ('255', '90', '509', 't', '100', 'flow', '2015-10-11 16:53:59.087+06', '2015-10-11 16:53:59.087+06');
INSERT INTO "public"."session_state_logs" VALUES ('256', '90', '511', 't', '100', 'flow', '2015-10-11 16:53:59.094+06', '2015-10-11 16:53:59.094+06');
INSERT INTO "public"."session_state_logs" VALUES ('257', '90', '512', 't', '100', 'flow', '2015-10-11 16:53:59.1+06', '2015-10-11 16:53:59.1+06');
INSERT INTO "public"."session_state_logs" VALUES ('258', '90', '514', 't', '100', 'flow', '2015-10-11 16:53:59.113+06', '2015-10-11 16:53:59.113+06');
INSERT INTO "public"."session_state_logs" VALUES ('259', '90', '513', 't', '100', 'flow', '2015-10-11 16:53:59.118+06', '2015-10-11 16:53:59.118+06');
INSERT INTO "public"."session_state_logs" VALUES ('260', '90', '515', 't', '100', 'flow', '2015-10-11 16:53:59.128+06', '2015-10-11 16:53:59.128+06');
INSERT INTO "public"."session_state_logs" VALUES ('261', '90', '510', 't', '100', 'flow', '2015-10-11 16:53:59.131+06', '2015-10-11 16:53:59.131+06');
INSERT INTO "public"."session_state_logs" VALUES ('262', '90', '510', 't', '100', 'flow', '2015-10-11 16:53:59.135+06', '2015-10-11 16:53:59.135+06');
INSERT INTO "public"."session_state_logs" VALUES ('263', '91', '516', 't', '100', 'flow', '2015-10-11 16:58:21.783+06', '2015-10-11 16:58:21.783+06');
INSERT INTO "public"."session_state_logs" VALUES ('264', '91', '517', 't', '100', 'flow', '2015-10-11 16:58:21.783+06', '2015-10-11 16:58:21.783+06');
INSERT INTO "public"."session_state_logs" VALUES ('265', '91', '519', 't', '100', 'flow', '2015-10-11 16:58:21.786+06', '2015-10-11 16:58:21.786+06');
INSERT INTO "public"."session_state_logs" VALUES ('266', '91', '520', 't', '100', 'flow', '2015-10-11 16:58:31.173+06', '2015-10-11 16:58:31.173+06');
INSERT INTO "public"."session_state_logs" VALUES ('267', '91', '522', 't', '100', 'flow', '2015-10-11 16:58:31.193+06', '2015-10-11 16:58:31.193+06');
INSERT INTO "public"."session_state_logs" VALUES ('268', '91', '521', 't', '100', 'flow', '2015-10-11 16:58:31.196+06', '2015-10-11 16:58:31.196+06');
INSERT INTO "public"."session_state_logs" VALUES ('269', '91', '523', 't', '100', 'flow', '2015-10-11 16:58:31.205+06', '2015-10-11 16:58:31.205+06');
INSERT INTO "public"."session_state_logs" VALUES ('270', '91', '518', 't', '100', 'flow', '2015-10-11 16:58:31.207+06', '2015-10-11 16:58:31.207+06');
INSERT INTO "public"."session_state_logs" VALUES ('271', '91', '518', 't', '100', 'flow', '2015-10-11 16:58:31.208+06', '2015-10-11 16:58:31.208+06');
INSERT INTO "public"."session_state_logs" VALUES ('272', '92', '524', 't', '100', 'flow', '2015-10-11 17:01:05.92+06', '2015-10-11 17:01:05.92+06');
INSERT INTO "public"."session_state_logs" VALUES ('273', '92', '525', 't', '100', 'flow', '2015-10-11 17:01:05.92+06', '2015-10-11 17:01:05.92+06');
INSERT INTO "public"."session_state_logs" VALUES ('274', '92', '527', 't', '100', 'flow', '2015-10-11 17:01:12.651+06', '2015-10-11 17:01:12.651+06');
INSERT INTO "public"."session_state_logs" VALUES ('275', '92', '528', 't', '100', 'flow', '2015-10-11 17:01:20.699+06', '2015-10-11 17:01:20.699+06');
INSERT INTO "public"."session_state_logs" VALUES ('276', '92', '530', 't', '100', 'flow', '2015-10-11 17:01:23.633+06', '2015-10-11 17:01:23.633+06');
INSERT INTO "public"."session_state_logs" VALUES ('277', '92', '529', 't', '100', 'flow', '2015-10-11 17:01:30.35+06', '2015-10-11 17:01:30.35+06');
INSERT INTO "public"."session_state_logs" VALUES ('278', '92', '531', 't', '100', 'flow', '2015-10-11 17:01:32.396+06', '2015-10-11 17:01:32.396+06');
INSERT INTO "public"."session_state_logs" VALUES ('279', '92', '526', 't', '100', 'flow', '2015-10-11 17:01:32.402+06', '2015-10-11 17:01:32.402+06');
INSERT INTO "public"."session_state_logs" VALUES ('280', '92', '526', 't', '100', 'flow', '2015-10-11 17:01:32.403+06', '2015-10-11 17:01:32.403+06');
INSERT INTO "public"."session_state_logs" VALUES ('281', '93', '532', 't', '100', 'flow', '2015-10-11 17:09:50.6+06', '2015-10-11 17:09:50.6+06');
INSERT INTO "public"."session_state_logs" VALUES ('282', '93', '533', 't', '100', 'flow', '2015-10-11 17:09:50.6+06', '2015-10-11 17:09:50.6+06');
INSERT INTO "public"."session_state_logs" VALUES ('283', '93', '535', 't', '100', 'flow', '2015-10-11 17:09:59.609+06', '2015-10-11 17:09:59.609+06');
INSERT INTO "public"."session_state_logs" VALUES ('284', '93', '536', 't', '100', 'flow', '2015-10-11 17:10:04.87+06', '2015-10-11 17:10:04.87+06');
INSERT INTO "public"."session_state_logs" VALUES ('285', '93', '538', 't', '100', 'flow', '2015-10-11 17:10:07.129+06', '2015-10-11 17:10:07.129+06');
INSERT INTO "public"."session_state_logs" VALUES ('286', '93', '537', 't', '100', 'flow', '2015-10-11 17:12:08.966+06', '2015-10-11 17:12:08.966+06');
INSERT INTO "public"."session_state_logs" VALUES ('287', '93', '539', 't', '100', 'flow', '2015-10-11 17:12:16.215+06', '2015-10-11 17:12:16.215+06');
INSERT INTO "public"."session_state_logs" VALUES ('288', '93', '534', 't', '100', 'flow', '2015-10-11 17:12:16.225+06', '2015-10-11 17:12:16.225+06');
INSERT INTO "public"."session_state_logs" VALUES ('289', '93', '534', 't', '100', 'flow', '2015-10-11 17:12:16.227+06', '2015-10-11 17:12:16.227+06');
INSERT INTO "public"."session_state_logs" VALUES ('290', '94', '540', 't', '100', 'flow', '2015-10-11 22:20:31.916+06', '2015-10-11 22:20:31.916+06');
INSERT INTO "public"."session_state_logs" VALUES ('291', '94', '541', 't', '100', 'flow', '2015-10-11 22:20:31.916+06', '2015-10-11 22:20:31.916+06');
INSERT INTO "public"."session_state_logs" VALUES ('292', '94', '543', 't', '100', 'flow', '2015-10-11 22:20:32.202+06', '2015-10-11 22:20:32.202+06');
INSERT INTO "public"."session_state_logs" VALUES ('293', '94', '544', 't', '100', 'flow', '2015-10-11 22:20:32.337+06', '2015-10-11 22:20:32.337+06');
INSERT INTO "public"."session_state_logs" VALUES ('294', '94', '546', 't', '100', 'flow', '2015-10-11 22:20:32.398+06', '2015-10-11 22:20:32.398+06');
INSERT INTO "public"."session_state_logs" VALUES ('295', '94', '545', 't', '100', 'flow', '2015-10-11 22:20:32.53+06', '2015-10-11 22:20:32.53+06');
INSERT INTO "public"."session_state_logs" VALUES ('296', '94', '547', 't', '100', 'flow', '2015-10-11 22:20:32.535+06', '2015-10-11 22:20:32.535+06');
INSERT INTO "public"."session_state_logs" VALUES ('297', '94', '542', 't', '100', 'flow', '2015-10-11 22:20:32.536+06', '2015-10-11 22:20:32.536+06');
INSERT INTO "public"."session_state_logs" VALUES ('298', '94', '542', 't', '100', 'flow', '2015-10-11 22:20:32.538+06', '2015-10-11 22:20:32.538+06');
INSERT INTO "public"."session_state_logs" VALUES ('299', '88', '480', 't', '100', 'flow', '2015-10-11 22:24:22.528+06', '2015-10-11 22:24:22.528+06');
INSERT INTO "public"."session_state_logs" VALUES ('300', '88', '482', 't', '100', 'flow', '2015-10-11 22:24:22.529+06', '2015-10-11 22:24:22.529+06');
INSERT INTO "public"."session_state_logs" VALUES ('301', '88', '486', 't', '100', 'flow', '2015-10-11 22:24:22.535+06', '2015-10-11 22:24:22.535+06');
INSERT INTO "public"."session_state_logs" VALUES ('302', '88', '490', 't', '100', 'flow', '2015-10-11 22:24:22.538+06', '2015-10-11 22:24:22.538+06');
INSERT INTO "public"."session_state_logs" VALUES ('303', '88', '494', 't', '100', 'flow', '2015-10-11 22:24:22.549+06', '2015-10-11 22:24:22.549+06');
INSERT INTO "public"."session_state_logs" VALUES ('304', '88', '492', 't', '100', 'flow', '2015-10-11 22:24:22.59+06', '2015-10-11 22:24:22.59+06');
INSERT INTO "public"."session_state_logs" VALUES ('305', '88', '480', 't', '100', 'flow', '2015-10-11 23:59:19.102+06', '2015-10-11 23:59:19.102+06');
INSERT INTO "public"."session_state_logs" VALUES ('306', '88', '482', 't', '100', 'flow', '2015-10-11 23:59:19.102+06', '2015-10-11 23:59:19.102+06');
INSERT INTO "public"."session_state_logs" VALUES ('307', '88', '486', 't', '100', 'flow', '2015-10-11 23:59:19.384+06', '2015-10-11 23:59:19.384+06');
INSERT INTO "public"."session_state_logs" VALUES ('308', '88', '490', 't', '100', 'flow', '2015-10-11 23:59:19.421+06', '2015-10-11 23:59:19.421+06');
INSERT INTO "public"."session_state_logs" VALUES ('309', '88', '494', 't', '100', 'flow', '2015-10-11 23:59:19.517+06', '2015-10-11 23:59:19.517+06');
INSERT INTO "public"."session_state_logs" VALUES ('310', '88', '492', 't', '100', 'flow', '2015-10-11 23:59:20.152+06', '2015-10-11 23:59:20.152+06');
INSERT INTO "public"."session_state_logs" VALUES ('311', '88', '498', 't', '100', 'flow', '2015-10-11 23:59:20.176+06', '2015-10-11 23:59:20.176+06');
INSERT INTO "public"."session_state_logs" VALUES ('312', '87', '478', 't', '100', 'flow', '2015-10-12 00:54:17.72+06', '2015-10-12 00:54:17.72+06');
INSERT INTO "public"."session_state_logs" VALUES ('313', '87', '479', 't', '100', 'flow', '2015-10-12 00:54:17.721+06', '2015-10-12 00:54:17.721+06');
INSERT INTO "public"."session_state_logs" VALUES ('314', '87', '483', 't', '100', 'flow', '2015-10-12 00:54:18.058+06', '2015-10-12 00:54:18.058+06');
INSERT INTO "public"."session_state_logs" VALUES ('315', '87', '487', 't', '100', 'flow', '2015-10-12 00:54:18.126+06', '2015-10-12 00:54:18.126+06');
INSERT INTO "public"."session_state_logs" VALUES ('316', '87', '491', 't', '100', 'flow', '2015-10-12 00:54:18.225+06', '2015-10-12 00:54:18.225+06');
INSERT INTO "public"."session_state_logs" VALUES ('317', '87', '489', 't', '100', 'flow', '2015-10-12 00:54:18.435+06', '2015-10-12 00:54:18.435+06');
INSERT INTO "public"."session_state_logs" VALUES ('318', '87', '478', 't', '100', 'flow', '2015-10-12 08:30:49.74+06', '2015-10-12 08:30:49.74+06');
INSERT INTO "public"."session_state_logs" VALUES ('319', '87', '479', 't', '100', 'flow', '2015-10-12 08:30:49.74+06', '2015-10-12 08:30:49.74+06');
INSERT INTO "public"."session_state_logs" VALUES ('320', '87', '483', 't', '100', 'flow', '2015-10-12 08:30:49.995+06', '2015-10-12 08:30:49.995+06');
INSERT INTO "public"."session_state_logs" VALUES ('321', '87', '487', 't', '100', 'flow', '2015-10-12 08:30:50.041+06', '2015-10-12 08:30:50.041+06');
INSERT INTO "public"."session_state_logs" VALUES ('322', '87', '491', 't', '100', 'flow', '2015-10-12 08:30:50.114+06', '2015-10-12 08:30:50.114+06');
INSERT INTO "public"."session_state_logs" VALUES ('323', '87', '489', 't', '100', 'flow', '2015-10-12 08:30:50.302+06', '2015-10-12 08:30:50.302+06');
INSERT INTO "public"."session_state_logs" VALUES ('324', '87', '495', 't', '100', 'flow', '2015-10-12 08:30:50.311+06', '2015-10-12 08:30:50.311+06');
INSERT INTO "public"."session_state_logs" VALUES ('325', '87', '478', 't', '100', 'flow', '2015-10-12 08:31:55.346+06', '2015-10-12 08:31:55.346+06');
INSERT INTO "public"."session_state_logs" VALUES ('326', '87', '479', 't', '100', 'flow', '2015-10-12 08:31:55.351+06', '2015-10-12 08:31:55.351+06');
INSERT INTO "public"."session_state_logs" VALUES ('327', '87', '483', 't', '100', 'flow', '2015-10-12 08:31:55.356+06', '2015-10-12 08:31:55.356+06');
INSERT INTO "public"."session_state_logs" VALUES ('328', '87', '487', 't', '100', 'flow', '2015-10-12 08:31:55.372+06', '2015-10-12 08:31:55.372+06');
INSERT INTO "public"."session_state_logs" VALUES ('329', '87', '491', 't', '100', 'flow', '2015-10-12 08:31:55.379+06', '2015-10-12 08:31:55.379+06');
INSERT INTO "public"."session_state_logs" VALUES ('330', '87', '489', 't', '100', 'flow', '2015-10-12 08:31:55.382+06', '2015-10-12 08:31:55.382+06');
INSERT INTO "public"."session_state_logs" VALUES ('331', '87', '495', 't', '100', 'flow', '2015-10-12 08:31:55.584+06', '2015-10-12 08:31:55.584+06');
INSERT INTO "public"."session_state_logs" VALUES ('332', '87', '481', 't', '100', 'flow', '2015-10-12 08:31:55.586+06', '2015-10-12 08:31:55.586+06');
INSERT INTO "public"."session_state_logs" VALUES ('333', '87', '481', 't', '100', 'flow', '2015-10-12 08:31:55.588+06', '2015-10-12 08:31:55.588+06');
INSERT INTO "public"."session_state_logs" VALUES ('334', '88', '480', 't', '100', 'flow', '2015-10-12 20:19:34.24+06', '2015-10-12 20:19:34.24+06');
INSERT INTO "public"."session_state_logs" VALUES ('335', '88', '482', 't', '100', 'flow', '2015-10-12 20:19:34.241+06', '2015-10-12 20:19:34.241+06');
INSERT INTO "public"."session_state_logs" VALUES ('336', '88', '486', 't', '100', 'flow', '2015-10-12 20:19:34.246+06', '2015-10-12 20:19:34.246+06');
INSERT INTO "public"."session_state_logs" VALUES ('337', '88', '490', 't', '100', 'flow', '2015-10-12 20:19:34.257+06', '2015-10-12 20:19:34.257+06');
INSERT INTO "public"."session_state_logs" VALUES ('338', '88', '494', 't', '100', 'flow', '2015-10-12 20:19:34.266+06', '2015-10-12 20:19:34.266+06');
INSERT INTO "public"."session_state_logs" VALUES ('339', '88', '492', 't', '100', 'flow', '2015-10-12 20:19:34.529+06', '2015-10-12 20:19:34.529+06');
INSERT INTO "public"."session_state_logs" VALUES ('340', '88', '498', 't', '100', 'flow', '2015-10-12 20:19:34.534+06', '2015-10-12 20:19:34.534+06');
INSERT INTO "public"."session_state_logs" VALUES ('341', '88', '484', 't', '100', 'flow', '2015-10-12 20:19:34.536+06', '2015-10-12 20:19:34.536+06');
INSERT INTO "public"."session_state_logs" VALUES ('342', '88', '484', 't', '100', 'flow', '2015-10-12 20:19:34.537+06', '2015-10-12 20:19:34.537+06');
INSERT INTO "public"."session_state_logs" VALUES ('343', '83', '436', 't', '100', 'flow', '2015-10-12 20:58:28.772+06', '2015-10-12 20:58:28.772+06');
INSERT INTO "public"."session_state_logs" VALUES ('344', '83', '437', 't', '100', 'flow', '2015-10-12 20:58:28.772+06', '2015-10-12 20:58:28.772+06');
INSERT INTO "public"."session_state_logs" VALUES ('345', '83', '439', 't', '100', 'flow', '2015-10-12 20:58:29.368+06', '2015-10-12 20:58:29.368+06');
INSERT INTO "public"."session_state_logs" VALUES ('346', '83', '441', 't', '100', 'flow', '2015-10-12 20:58:29.445+06', '2015-10-12 20:58:29.445+06');
INSERT INTO "public"."session_state_logs" VALUES ('347', '83', '440', 't', '100', 'flow', '2015-10-12 20:58:29.646+06', '2015-10-12 20:58:29.646+06');
INSERT INTO "public"."session_state_logs" VALUES ('348', '83', '438', 't', '100', 'flow', '2015-10-12 20:58:29.65+06', '2015-10-12 20:58:29.65+06');
INSERT INTO "public"."session_state_logs" VALUES ('349', '83', '438', 't', '100', 'flow', '2015-10-12 20:58:29.66+06', '2015-10-12 20:58:29.66+06');
INSERT INTO "public"."session_state_logs" VALUES ('350', '95', '548', 't', '100', 'flow', '2015-10-12 21:00:40.567+06', '2015-10-12 21:00:40.567+06');
INSERT INTO "public"."session_state_logs" VALUES ('351', '95', '549', 't', '100', 'flow', '2015-10-12 21:00:40.567+06', '2015-10-12 21:00:40.567+06');
INSERT INTO "public"."session_state_logs" VALUES ('352', '95', '551', 't', '100', 'flow', '2015-10-12 21:00:40.581+06', '2015-10-12 21:00:40.581+06');
INSERT INTO "public"."session_state_logs" VALUES ('353', '95', '548', 't', '100', 'flow', '2015-10-12 21:02:16.823+06', '2015-10-12 21:02:16.823+06');
INSERT INTO "public"."session_state_logs" VALUES ('354', '95', '549', 't', '100', 'flow', '2015-10-12 21:02:16.823+06', '2015-10-12 21:02:16.823+06');
INSERT INTO "public"."session_state_logs" VALUES ('355', '95', '551', 't', '100', 'flow', '2015-10-12 21:02:16.827+06', '2015-10-12 21:02:16.827+06');
INSERT INTO "public"."session_state_logs" VALUES ('356', '95', '553', 't', '100', 'flow', '2015-10-12 21:02:16.859+06', '2015-10-12 21:02:16.859+06');
INSERT INTO "public"."session_state_logs" VALUES ('357', '95', '555', 't', '100', 'flow', '2015-10-12 21:02:16.867+06', '2015-10-12 21:02:16.867+06');
INSERT INTO "public"."session_state_logs" VALUES ('358', '95', '554', 't', '100', 'flow', '2015-10-12 21:02:16.871+06', '2015-10-12 21:02:16.871+06');
INSERT INTO "public"."session_state_logs" VALUES ('359', '95', '548', 't', '100', 'flow', '2015-10-12 21:04:33.409+06', '2015-10-12 21:04:33.409+06');
INSERT INTO "public"."session_state_logs" VALUES ('360', '95', '549', 't', '100', 'flow', '2015-10-12 21:04:33.409+06', '2015-10-12 21:04:33.409+06');
INSERT INTO "public"."session_state_logs" VALUES ('361', '95', '551', 't', '100', 'flow', '2015-10-12 21:04:33.413+06', '2015-10-12 21:04:33.413+06');
INSERT INTO "public"."session_state_logs" VALUES ('362', '95', '553', 't', '100', 'flow', '2015-10-12 21:04:33.417+06', '2015-10-12 21:04:33.417+06');
INSERT INTO "public"."session_state_logs" VALUES ('363', '95', '555', 't', '100', 'flow', '2015-10-12 21:04:33.425+06', '2015-10-12 21:04:33.425+06');
INSERT INTO "public"."session_state_logs" VALUES ('364', '95', '554', 't', '100', 'flow', '2015-10-12 21:04:33.429+06', '2015-10-12 21:04:33.429+06');
INSERT INTO "public"."session_state_logs" VALUES ('365', '95', '557', 't', '100', 'flow', '2015-10-12 21:04:33.433+06', '2015-10-12 21:04:33.433+06');
INSERT INTO "public"."session_state_logs" VALUES ('366', '95', '558', 't', '100', 'flow', '2015-10-12 21:04:33.44+06', '2015-10-12 21:04:33.44+06');
INSERT INTO "public"."session_state_logs" VALUES ('367', '95', '550', 't', '100', 'flow', '2015-10-12 21:04:33.477+06', '2015-10-12 21:04:33.477+06');
INSERT INTO "public"."session_state_logs" VALUES ('368', '95', '550', 't', '100', 'flow', '2015-10-12 21:04:33.485+06', '2015-10-12 21:04:33.485+06');
INSERT INTO "public"."session_state_logs" VALUES ('369', '95', '550', 't', '100', 'flow', '2015-10-12 21:04:33.488+06', '2015-10-12 21:04:33.488+06');
INSERT INTO "public"."session_state_logs" VALUES ('370', '96', '560', 't', '100', 'flow', '2015-10-20 10:28:49.637+06', '2015-10-20 10:28:49.637+06');
INSERT INTO "public"."session_state_logs" VALUES ('371', '96', '561', 't', '100', 'flow', '2015-10-20 10:28:49.637+06', '2015-10-20 10:28:49.637+06');
INSERT INTO "public"."session_state_logs" VALUES ('372', '96', '563', 't', '100', 'flow', '2015-10-20 10:28:50.191+06', '2015-10-20 10:28:50.191+06');
INSERT INTO "public"."session_state_logs" VALUES ('373', '96', '564', 't', '100', 'flow', '2015-10-20 10:28:50.281+06', '2015-10-20 10:28:50.281+06');
INSERT INTO "public"."session_state_logs" VALUES ('374', '96', '566', 't', '100', 'flow', '2015-10-20 10:28:50.389+06', '2015-10-20 10:28:50.389+06');
INSERT INTO "public"."session_state_logs" VALUES ('375', '96', '565', 't', '100', 'flow', '2015-10-20 10:28:50.723+06', '2015-10-20 10:28:50.723+06');
INSERT INTO "public"."session_state_logs" VALUES ('376', '96', '567', 't', '100', 'flow', '2015-10-20 10:28:50.746+06', '2015-10-20 10:28:50.746+06');
INSERT INTO "public"."session_state_logs" VALUES ('377', '96', '562', 't', '100', 'flow', '2015-10-20 10:28:50.753+06', '2015-10-20 10:28:50.753+06');
INSERT INTO "public"."session_state_logs" VALUES ('378', '96', '562', 't', '100', 'flow', '2015-10-20 10:28:50.756+06', '2015-10-20 10:28:50.756+06');
INSERT INTO "public"."session_state_logs" VALUES ('379', '97', '568', 't', '100', 'flow', '2015-10-20 10:39:28.239+06', '2015-10-20 10:39:28.239+06');
INSERT INTO "public"."session_state_logs" VALUES ('380', '97', '569', 't', '100', 'flow', '2015-10-20 10:39:28.239+06', '2015-10-20 10:39:28.24+06');
INSERT INTO "public"."session_state_logs" VALUES ('381', '97', '571', 't', '100', 'flow', '2015-10-20 10:39:28.5+06', '2015-10-20 10:39:28.5+06');
INSERT INTO "public"."session_state_logs" VALUES ('382', '97', '572', 't', '100', 'flow', '2015-10-20 10:39:28.539+06', '2015-10-20 10:39:28.539+06');
INSERT INTO "public"."session_state_logs" VALUES ('383', '97', '574', 't', '100', 'flow', '2015-10-20 10:39:28.578+06', '2015-10-20 10:39:28.578+06');
INSERT INTO "public"."session_state_logs" VALUES ('384', '97', '573', 't', '100', 'flow', '2015-10-20 10:39:28.715+06', '2015-10-20 10:39:28.715+06');
INSERT INTO "public"."session_state_logs" VALUES ('385', '97', '575', 't', '100', 'flow', '2015-10-20 10:39:28.727+06', '2015-10-20 10:39:28.727+06');
INSERT INTO "public"."session_state_logs" VALUES ('386', '97', '570', 't', '100', 'flow', '2015-10-20 10:39:28.732+06', '2015-10-20 10:39:28.732+06');
INSERT INTO "public"."session_state_logs" VALUES ('387', '97', '570', 't', '100', 'flow', '2015-10-20 10:39:28.735+06', '2015-10-20 10:39:28.735+06');
INSERT INTO "public"."session_state_logs" VALUES ('388', '98', '576', 't', '100', 'flow', '2015-10-25 03:12:49.048+06', '2015-10-25 03:12:49.048+06');
INSERT INTO "public"."session_state_logs" VALUES ('389', '98', '577', 't', '100', 'flow', '2015-10-25 03:12:49.048+06', '2015-10-25 03:12:49.048+06');
INSERT INTO "public"."session_state_logs" VALUES ('390', '98', '579', 't', '100', 'flow', '2015-10-25 03:12:49.898+06', '2015-10-25 03:12:49.898+06');
INSERT INTO "public"."session_state_logs" VALUES ('391', '99', '581', 't', '100', 'flow', '2015-10-30 08:54:08.041+06', '2015-10-30 08:54:08.041+06');
INSERT INTO "public"."session_state_logs" VALUES ('392', '99', '582', 't', '100', 'flow', '2015-10-30 08:54:08.041+06', '2015-10-30 08:54:08.041+06');
INSERT INTO "public"."session_state_logs" VALUES ('393', '99', '584', 't', '100', 'flow', '2015-10-30 08:54:08.644+06', '2015-10-30 08:54:08.644+06');
INSERT INTO "public"."session_state_logs" VALUES ('394', '100', '592', 't', '100', 'flow', '2015-11-11 23:51:57.917+06', '2015-11-11 23:51:57.917+06');
INSERT INTO "public"."session_state_logs" VALUES ('395', '100', '593', 't', '100', 'flow', '2015-11-11 23:51:57.917+06', '2015-11-11 23:51:57.917+06');
INSERT INTO "public"."session_state_logs" VALUES ('396', '100', '595', 't', '100', 'flow', '2015-11-11 23:51:58.329+06', '2015-11-11 23:51:58.329+06');

-- ----------------------------
-- Table structure for session_switchers
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_switchers";
CREATE TABLE "public"."session_switchers" (
"id" int4 DEFAULT nextval('session_switchers_id_seq'::regclass) NOT NULL,
"bprocess_id" int4 NOT NULL,
"session_id" int4 NOT NULL,
"switch_type" varchar COLLATE "default" NOT NULL,
"priority" int4 DEFAULT 2 NOT NULL,
"session_state_ref_id" int4 NOT NULL,
"session_state_id" int4,
"fn" varchar COLLATE "default" NOT NULL,
"target" varchar COLLATE "default" NOT NULL,
"override_group" int4 DEFAULT 0 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of session_switchers
-- ----------------------------
INSERT INTO "public"."session_switchers" VALUES ('57', '10', '81', 'p', '2', '127', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('58', '10', '81', 'n', '2', '128', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('59', '10', '82', 'p', '2', '132', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('60', '10', '82', 'n', '2', '133', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('61', '11', '83', 'inn', '2', '137', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('62', '11', '83', 'outn', '2', '138', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('63', '11', '83', 'p', '2', '139', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('64', '11', '83', 'n', '2', '140', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('65', '14', '84', 'p', '2', '144', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('66', '14', '84', 'n', '2', '145', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('67', '14', '84', 'inn', '2', '146', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('68', '14', '84', 'outn', '2', '147', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('69', '14', '84', 'p', '2', '148', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('70', '14', '84', 'n', '2', '149', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('71', '14', '84', 'p', '2', '150', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('72', '14', '84', 'n', '2', '151', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('73', '15', '85', 'p', '2', '155', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('74', '15', '85', 'n', '2', '156', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('75', '15', '85', 'inn', '2', '157', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('76', '15', '85', 'outn', '2', '158', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('77', '15', '85', 'p', '2', '159', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('78', '15', '85', 'n', '2', '160', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('79', '15', '85', 'inn', '2', '161', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('80', '15', '85', 'outn', '2', '162', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('81', '15', '85', 'n', '2', '163', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('82', '15', '86', 'p', '2', '167', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('83', '15', '86', 'n', '2', '168', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('84', '15', '86', 'inn', '2', '169', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('85', '15', '86', 'outn', '2', '170', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('86', '15', '86', 'p', '2', '171', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('87', '15', '86', 'n', '2', '172', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('88', '15', '86', 'inn', '2', '173', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('89', '15', '86', 'outn', '2', '174', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('90', '15', '86', 'n', '2', '175', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('91', '14', '87', 'p', '2', '181', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('92', '14', '87', 'n', '2', '184', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('93', '14', '87', 'inn', '2', '185', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('94', '14', '88', 'p', '2', '183', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('95', '14', '87', 'outn', '2', '187', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('96', '14', '87', 'p', '2', '190', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('97', '14', '88', 'n', '2', '186', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('98', '14', '88', 'inn', '2', '188', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('99', '14', '87', 'n', '2', '191', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('100', '14', '88', 'outn', '2', '189', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('101', '14', '87', 'p', '2', '193', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('102', '14', '87', 'n', '2', '196', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('103', '14', '88', 'p', '2', '192', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('104', '14', '88', 'n', '2', '194', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('105', '14', '88', 'p', '2', '195', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('106', '14', '88', 'n', '2', '197', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('107', '16', '89', 'n', '2', '201', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('108', '16', '89', 'inn', '2', '202', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('109', '16', '89', 'outn', '2', '203', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('110', '16', '89', 'n', '2', '204', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('111', '16', '89', 'n', '2', '205', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('112', '16', '90', 'n', '2', '209', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('113', '16', '90', 'inn', '2', '210', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('114', '16', '90', 'outn', '2', '211', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('115', '16', '90', 'n', '2', '212', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('116', '16', '90', 'n', '2', '213', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('117', '16', '91', 'n', '2', '217', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('118', '16', '91', 'inn', '2', '218', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('119', '16', '91', 'outn', '2', '219', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('120', '16', '91', 'n', '2', '220', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('121', '16', '91', 'n', '2', '221', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('122', '16', '92', 'n', '2', '225', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('123', '16', '92', 'inn', '2', '226', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('124', '16', '92', 'outn', '2', '227', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('125', '16', '92', 'n', '2', '228', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('126', '16', '92', 'n', '2', '229', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('127', '16', '93', 'n', '2', '233', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('128', '16', '93', 'inn', '2', '234', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('129', '16', '93', 'outn', '2', '235', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('130', '16', '93', 'n', '2', '236', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('131', '16', '93', 'n', '2', '237', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('132', '16', '94', 'n', '2', '241', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('133', '16', '94', 'inn', '2', '242', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('134', '16', '94', 'outn', '2', '243', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('135', '16', '94', 'n', '2', '244', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('136', '16', '94', 'n', '2', '245', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('137', '15', '95', 'p', '2', '249', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('138', '15', '95', 'n', '2', '250', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('139', '15', '95', 'inn', '2', '251', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('140', '15', '95', 'outn', '2', '252', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('141', '15', '95', 'p', '2', '253', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('142', '15', '95', 'n', '2', '254', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('143', '15', '95', 'inn', '2', '255', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('144', '15', '95', 'outn', '2', '256', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('145', '15', '95', 'n', '2', '257', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('146', '16', '96', 'n', '2', '261', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('147', '16', '96', 'inn', '2', '262', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('148', '16', '96', 'outn', '2', '263', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('149', '16', '96', 'n', '2', '264', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('150', '16', '96', 'n', '2', '265', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('151', '16', '97', 'n', '2', '269', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('152', '16', '97', 'inn', '2', '270', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('153', '16', '97', 'outn', '2', '271', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('154', '16', '97', 'n', '2', '272', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('155', '16', '97', 'n', '2', '273', null, 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."session_switchers" VALUES ('156', '17', '98', 'p', '2', '277', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('157', '17', '98', 'n', '2', '278', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('158', '14', '99', 'p', '2', '282', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('159', '14', '99', 'n', '2', '283', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('160', '14', '99', 'inn', '2', '284', null, 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."session_switchers" VALUES ('161', '14', '99', 'outn', '2', '285', null, 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."session_switchers" VALUES ('162', '14', '99', 'p', '2', '286', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('163', '14', '99', 'n', '2', '287', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('164', '14', '99', 'p', '2', '288', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('165', '14', '99', 'n', '2', '289', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');
INSERT INTO "public"."session_switchers" VALUES ('166', '17', '100', 'p', '2', '293', null, 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."session_switchers" VALUES ('167', '17', '100', 'n', '2', '294', null, 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');

-- ----------------------------
-- Table structure for sessionstates
-- ----------------------------
DROP TABLE IF EXISTS "public"."sessionstates";
CREATE TABLE "public"."sessionstates" (
"id" int4 DEFAULT nextval('sessionstates_id_seq'::regclass) NOT NULL,
"process_id" int4 NOT NULL,
"session_id" int4 NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"neutral" varchar COLLATE "default" NOT NULL,
"is_process_state" bool DEFAULT false NOT NULL,
"on" bool DEFAULT false NOT NULL,
"on_rate" int4 DEFAULT 0 NOT NULL,
"front_elem_id" int4,
"space_elem_id" int4,
"space_id" int4,
"origin_state_id" int4,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"lang" varchar COLLATE "default" DEFAULT 'en'::character varying NOT NULL,
"middle" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"middleable" bool DEFAULT false NOT NULL,
"oposite" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"opositable" bool DEFAULT false NOT NULL,
"session_front_elem_id" int4,
"session_space_id" int4,
"session_space_elem_id" int4
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of sessionstates
-- ----------------------------
INSERT INTO "public"."sessionstates" VALUES ('426', '10', '81', 'initiated', 'uninitiated', 't', 'f', '0', null, null, null, '124', '2015-09-24 01:04:54.402+06', '2015-09-24 01:04:54.402+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('427', '10', '81', 'invoking', 'paused', 't', 'f', '0', null, null, null, '125', '2015-09-24 01:04:54.409+06', '2015-09-24 01:04:54.409+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('428', '10', '81', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '126', '2015-09-24 01:04:54.409+06', '2015-09-24 01:04:54.409+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('429', '10', '81', 'invoked', 'uninvoked', 'f', 'f', '0', '23', null, null, '127', '2015-09-24 01:04:54.409+06', '2015-09-24 01:04:54.409+06', 'en', 'invoking', 't', '', 'f', '23', null, null);
INSERT INTO "public"."sessionstates" VALUES ('430', '10', '81', 'confirmed', 'unconfirmed', 'f', 'f', '0', '23', null, null, '128', '2015-09-24 01:04:54.409+06', '2015-09-24 01:04:54.409+06', 'en', 'confirming', 't', '', 'f', '23', null, null);
INSERT INTO "public"."sessionstates" VALUES ('431', '10', '82', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '129', '2015-09-24 01:08:22.249+06', '2015-09-24 01:08:22.249+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('432', '10', '82', 'invoking', 'paused', 't', 't', '100', null, null, null, '130', '2015-09-24 01:08:22.278+06', '2015-09-24 01:08:22.278+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('433', '10', '82', 'finished', 'unfinished', 't', 't', '100', null, null, null, '131', '2015-09-24 01:08:22.278+06', '2015-09-24 01:08:22.278+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('434', '10', '82', 'invoked', 'uninvoked', 'f', 't', '100', '24', null, null, '132', '2015-09-24 01:08:22.278+06', '2015-09-24 01:08:22.278+06', 'en', 'invoking', 't', '', 'f', '24', null, null);
INSERT INTO "public"."sessionstates" VALUES ('435', '10', '82', 'confirmed', 'unconfirmed', 'f', 't', '100', '24', null, null, '133', '2015-09-24 01:08:22.278+06', '2015-09-24 01:08:22.278+06', 'en', 'confirming', 't', '', 'f', '24', null, null);
INSERT INTO "public"."sessionstates" VALUES ('436', '11', '83', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '134', '2015-09-30 16:13:58.122+06', '2015-09-30 16:13:58.122+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('437', '11', '83', 'invoking', 'paused', 't', 't', '100', null, null, null, '135', '2015-09-30 16:13:58.144+06', '2015-09-30 16:13:58.144+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('438', '11', '83', 'finished', 'unfinished', 't', 't', '100', null, null, null, '136', '2015-09-30 16:13:58.144+06', '2015-09-30 16:13:58.144+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('439', '11', '83', 'invoked', 'uninvoked', 'f', 't', '100', '25', null, null, '137', '2015-09-30 16:13:58.144+06', '2015-09-30 16:13:58.144+06', 'en', 'invoking', 't', '', 'f', '25', null, null);
INSERT INTO "public"."sessionstates" VALUES ('440', '11', '83', 'lap', 'unlap', 'f', 'f', '0', null, null, '10', '138', '2015-09-30 16:13:58.144+06', '2015-09-30 16:13:58.144+06', 'en', '', 'f', '', 'f', null, '10', null);
INSERT INTO "public"."sessionstates" VALUES ('441', '11', '83', 'invoked', 'uninvoked', 'f', 't', '100', null, '9', null, '139', '2015-09-30 16:13:58.144+06', '2015-09-30 16:13:58.144+06', 'en', 'invoking', 't', '', 'f', null, null, '9');
INSERT INTO "public"."sessionstates" VALUES ('442', '11', '83', 'confirmed', 'unconfirmed', 'f', 't', '100', null, '9', null, '140', '2015-09-30 16:13:58.145+06', '2015-09-30 16:13:58.145+06', 'en', 'confirming', 't', '', 'f', null, null, '9');
INSERT INTO "public"."sessionstates" VALUES ('443', '14', '84', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '141', '2015-10-10 23:33:04.323+06', '2015-10-10 23:33:04.323+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('444', '14', '84', 'invoking', 'paused', 't', 't', '100', null, null, null, '142', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('445', '14', '84', 'finished', 'unfinished', 't', 't', '100', null, null, null, '143', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('446', '14', '84', 'invoked', 'uninvoked', 'f', 't', '100', '26', null, null, '144', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', 'invoking', 't', '', 'f', '26', null, null);
INSERT INTO "public"."sessionstates" VALUES ('447', '14', '84', 'confirmed', 'unconfirmed', 'f', 't', '100', '26', null, null, '145', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', 'confirming', 't', '', 'f', '26', null, null);
INSERT INTO "public"."sessionstates" VALUES ('448', '14', '84', 'invoked', 'uninvoked', 'f', 't', '100', '27', null, null, '146', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', 'invoking', 't', '', 'f', '27', null, null);
INSERT INTO "public"."sessionstates" VALUES ('449', '14', '84', 'lap', 'unlap', 'f', 'f', '0', null, null, '11', '147', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', '', 'f', '', 'f', null, '11', null);
INSERT INTO "public"."sessionstates" VALUES ('450', '14', '84', 'invoked', 'uninvoked', 'f', 't', '100', null, '10', null, '148', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', 'invoking', 't', '', 'f', null, null, '10');
INSERT INTO "public"."sessionstates" VALUES ('451', '14', '84', 'confirmed', 'unconfirmed', 'f', 't', '100', null, '10', null, '149', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', 'confirming', 't', '', 'f', null, null, '10');
INSERT INTO "public"."sessionstates" VALUES ('452', '14', '84', 'invoked', 'uninvoked', 'f', 't', '100', '28', null, null, '150', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', 'invoking', 't', '', 'f', '28', null, null);
INSERT INTO "public"."sessionstates" VALUES ('453', '14', '84', 'confirmed', 'unconfirmed', 'f', 't', '100', '28', null, null, '151', '2015-10-10 23:33:04.378+06', '2015-10-10 23:33:04.378+06', 'en', 'confirming', 't', '', 'f', '28', null, null);
INSERT INTO "public"."sessionstates" VALUES ('454', '15', '85', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '152', '2015-10-11 14:36:33.282+06', '2015-10-11 14:36:33.282+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('455', '15', '85', 'invoking', 'paused', 't', 't', '100', null, null, null, '153', '2015-10-11 14:36:33.346+06', '2015-10-11 14:36:33.346+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('456', '15', '85', 'finished', 'unfinished', 't', 't', '100', null, null, null, '154', '2015-10-11 14:36:33.346+06', '2015-10-11 14:36:33.346+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('457', '15', '85', 'invoked', 'uninvoked', 'f', 't', '100', '29', null, null, '155', '2015-10-11 14:36:33.346+06', '2015-10-11 14:36:33.346+06', 'en', 'invoking', 't', '', 'f', '29', null, null);
INSERT INTO "public"."sessionstates" VALUES ('458', '15', '85', 'confirmed', 'unconfirmed', 'f', 't', '100', '29', null, null, '156', '2015-10-11 14:36:33.346+06', '2015-10-11 14:36:33.346+06', 'en', 'confirming', 't', '', 'f', '29', null, null);
INSERT INTO "public"."sessionstates" VALUES ('459', '15', '85', 'invoked', 'uninvoked', 'f', 't', '100', '30', null, null, '157', '2015-10-11 14:36:33.346+06', '2015-10-11 14:36:33.346+06', 'en', 'invoking', 't', '', 'f', '30', null, null);
INSERT INTO "public"."sessionstates" VALUES ('460', '15', '85', 'lap', 'unlap', 'f', 'f', '0', null, null, '12', '158', '2015-10-11 14:36:33.346+06', '2015-10-11 14:36:33.346+06', 'en', '', 'f', '', 'f', null, '12', null);
INSERT INTO "public"."sessionstates" VALUES ('461', '15', '85', 'invoked', 'uninvoked', 'f', 't', '100', null, '11', null, '159', '2015-10-11 14:36:33.346+06', '2015-10-11 14:36:33.346+06', 'en', 'invoking', 't', '', 'f', null, null, '11');
INSERT INTO "public"."sessionstates" VALUES ('462', '15', '85', 'confirmed', 'unconfirmed', 'f', 't', '100', null, '11', null, '160', '2015-10-11 14:36:33.346+06', '2015-10-11 14:36:33.346+06', 'en', 'confirming', 't', '', 'f', null, null, '11');
INSERT INTO "public"."sessionstates" VALUES ('463', '15', '85', 'invoked', 'uninvoked', 'f', 't', '100', '31', null, null, '161', '2015-10-11 14:36:33.347+06', '2015-10-11 14:36:33.347+06', 'en', 'invoking', 't', '', 'f', '31', null, null);
INSERT INTO "public"."sessionstates" VALUES ('464', '15', '85', 'lap', 'unlap', 'f', 'f', '0', null, null, '13', '162', '2015-10-11 14:36:33.347+06', '2015-10-11 14:36:33.347+06', 'en', '', 'f', '', 'f', null, '13', null);
INSERT INTO "public"."sessionstates" VALUES ('465', '15', '85', 'invoked', 'uninvoked', 'f', 'f', '0', null, '12', null, '163', '2015-10-11 14:36:33.347+06', '2015-10-11 14:36:33.347+06', 'en', 'invoking', 't', '', 'f', null, null, '12');
INSERT INTO "public"."sessionstates" VALUES ('466', '15', '86', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '164', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('467', '15', '86', 'invoking', 'paused', 't', 't', '100', null, null, null, '165', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('468', '15', '86', 'finished', 'unfinished', 't', 't', '100', null, null, null, '166', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('469', '15', '86', 'invoked', 'uninvoked', 'f', 't', '100', '32', null, null, '167', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'invoking', 't', '', 'f', '32', null, null);
INSERT INTO "public"."sessionstates" VALUES ('470', '15', '86', 'confirmed', 'unconfirmed', 'f', 't', '100', '32', null, null, '168', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'confirming', 't', '', 'f', '32', null, null);
INSERT INTO "public"."sessionstates" VALUES ('471', '15', '86', 'invoked', 'uninvoked', 'f', 't', '100', '33', null, null, '169', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'invoking', 't', '', 'f', '33', null, null);
INSERT INTO "public"."sessionstates" VALUES ('472', '15', '86', 'lap', 'unlap', 'f', 'f', '0', null, null, '14', '170', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', '', 'f', '', 'f', null, '14', null);
INSERT INTO "public"."sessionstates" VALUES ('473', '15', '86', 'invoked', 'uninvoked', 'f', 't', '100', null, '13', null, '171', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'invoking', 't', '', 'f', null, null, '13');
INSERT INTO "public"."sessionstates" VALUES ('474', '15', '86', 'confirmed', 'unconfirmed', 'f', 't', '100', null, '13', null, '172', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'confirming', 't', '', 'f', null, null, '13');
INSERT INTO "public"."sessionstates" VALUES ('475', '15', '86', 'invoked', 'uninvoked', 'f', 't', '100', '34', null, null, '173', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'invoking', 't', '', 'f', '34', null, null);
INSERT INTO "public"."sessionstates" VALUES ('476', '15', '86', 'lap', 'unlap', 'f', 'f', '0', null, null, '15', '174', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', '', 'f', '', 'f', null, '15', null);
INSERT INTO "public"."sessionstates" VALUES ('477', '15', '86', 'invoked', 'uninvoked', 'f', 'f', '0', null, '14', null, '175', '2015-10-11 14:39:07.525+06', '2015-10-11 14:39:07.525+06', 'en', 'invoking', 't', '', 'f', null, null, '14');
INSERT INTO "public"."sessionstates" VALUES ('478', '14', '87', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '176', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('479', '14', '87', 'invoking', 'paused', 't', 't', '100', null, null, null, '177', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('480', '14', '88', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '178', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('481', '14', '87', 'finished', 'unfinished', 't', 't', '100', null, null, null, '179', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('482', '14', '88', 'invoking', 'paused', 't', 't', '100', null, null, null, '180', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('483', '14', '87', 'invoked', 'uninvoked', 'f', 't', '100', '36', null, null, '181', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'invoking', 't', '', 'f', '36', null, null);
INSERT INTO "public"."sessionstates" VALUES ('484', '14', '88', 'finished', 'unfinished', 't', 't', '100', null, null, null, '182', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('485', '14', '87', 'confirmed', 'unconfirmed', 'f', 't', '100', '36', null, null, '184', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'confirming', 't', '', 'f', '36', null, null);
INSERT INTO "public"."sessionstates" VALUES ('486', '14', '88', 'invoked', 'uninvoked', 'f', 't', '100', '35', null, null, '183', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'invoking', 't', '', 'f', '35', null, null);
INSERT INTO "public"."sessionstates" VALUES ('487', '14', '87', 'invoked', 'uninvoked', 'f', 't', '100', '37', null, null, '185', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'invoking', 't', '', 'f', '37', null, null);
INSERT INTO "public"."sessionstates" VALUES ('488', '14', '88', 'confirmed', 'unconfirmed', 'f', 't', '100', '35', null, null, '186', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'confirming', 't', '', 'f', '35', null, null);
INSERT INTO "public"."sessionstates" VALUES ('489', '14', '87', 'lap', 'unlap', 'f', 'f', '0', null, null, '16', '187', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', '', 'f', '', 'f', null, '16', null);
INSERT INTO "public"."sessionstates" VALUES ('490', '14', '88', 'invoked', 'uninvoked', 'f', 't', '100', '38', null, null, '188', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'invoking', 't', '', 'f', '38', null, null);
INSERT INTO "public"."sessionstates" VALUES ('491', '14', '87', 'invoked', 'uninvoked', 'f', 't', '100', null, '16', null, '190', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'invoking', 't', '', 'f', null, null, '16');
INSERT INTO "public"."sessionstates" VALUES ('492', '14', '88', 'lap', 'unlap', 'f', 'f', '0', null, null, '17', '189', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', '', 'f', '', 'f', null, '17', null);
INSERT INTO "public"."sessionstates" VALUES ('493', '14', '87', 'confirmed', 'unconfirmed', 'f', 't', '100', null, '16', null, '191', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'confirming', 't', '', 'f', null, null, '16');
INSERT INTO "public"."sessionstates" VALUES ('494', '14', '88', 'invoked', 'uninvoked', 'f', 't', '100', null, '15', null, '192', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'invoking', 't', '', 'f', null, null, '15');
INSERT INTO "public"."sessionstates" VALUES ('495', '14', '87', 'invoked', 'uninvoked', 'f', 't', '100', '40', null, null, '193', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'invoking', 't', '', 'f', '40', null, null);
INSERT INTO "public"."sessionstates" VALUES ('496', '14', '88', 'confirmed', 'unconfirmed', 'f', 't', '100', null, '15', null, '194', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'confirming', 't', '', 'f', null, null, '15');
INSERT INTO "public"."sessionstates" VALUES ('497', '14', '87', 'confirmed', 'unconfirmed', 'f', 't', '100', '40', null, null, '196', '2015-10-11 14:41:05.641+06', '2015-10-11 14:41:05.641+06', 'en', 'confirming', 't', '', 'f', '40', null, null);
INSERT INTO "public"."sessionstates" VALUES ('498', '14', '88', 'invoked', 'uninvoked', 'f', 't', '100', '39', null, null, '195', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'invoking', 't', '', 'f', '39', null, null);
INSERT INTO "public"."sessionstates" VALUES ('499', '14', '88', 'confirmed', 'unconfirmed', 'f', 't', '100', '39', null, null, '197', '2015-10-11 14:41:05.825+06', '2015-10-11 14:41:05.825+06', 'en', 'confirming', 't', '', 'f', '39', null, null);
INSERT INTO "public"."sessionstates" VALUES ('500', '16', '89', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '198', '2015-10-11 16:46:05.743+06', '2015-10-11 16:46:05.743+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('501', '16', '89', 'invoking', 'paused', 't', 't', '100', null, null, null, '199', '2015-10-11 16:46:05.826+06', '2015-10-11 16:46:05.826+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('502', '16', '89', 'finished', 'unfinished', 't', 't', '100', null, null, null, '200', '2015-10-11 16:46:05.826+06', '2015-10-11 16:46:05.826+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('503', '16', '89', 'invoked', 'uninvoked', 'f', 't', '100', '41', null, null, '201', '2015-10-11 16:46:05.826+06', '2015-10-11 16:46:05.826+06', 'en', 'invoking', 't', '', 'f', '41', null, null);
INSERT INTO "public"."sessionstates" VALUES ('504', '16', '89', 'invoked', 'uninvoked', 'f', 't', '100', '42', null, null, '202', '2015-10-11 16:46:05.826+06', '2015-10-11 16:46:05.826+06', 'en', 'invoking', 't', '', 'f', '42', null, null);
INSERT INTO "public"."sessionstates" VALUES ('505', '16', '89', 'lap', 'unlap', 'f', 'f', '0', null, null, '18', '203', '2015-10-11 16:46:05.826+06', '2015-10-11 16:46:05.826+06', 'en', '', 'f', '', 'f', null, '18', null);
INSERT INTO "public"."sessionstates" VALUES ('506', '16', '89', 'invoked', 'uninvoked', 'f', 't', '100', null, '17', null, '204', '2015-10-11 16:46:05.826+06', '2015-10-11 16:46:05.826+06', 'en', 'invoking', 't', '', 'f', null, null, '17');
INSERT INTO "public"."sessionstates" VALUES ('507', '16', '89', 'invoked', 'uninvoked', 'f', 't', '100', '43', null, null, '205', '2015-10-11 16:46:05.826+06', '2015-10-11 16:46:05.826+06', 'en', 'invoking', 't', '', 'f', '43', null, null);
INSERT INTO "public"."sessionstates" VALUES ('508', '16', '90', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '206', '2015-10-11 16:53:56.606+06', '2015-10-11 16:53:56.606+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('509', '16', '90', 'invoking', 'paused', 't', 't', '100', null, null, null, '207', '2015-10-11 16:53:56.606+06', '2015-10-11 16:53:56.606+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('510', '16', '90', 'finished', 'unfinished', 't', 't', '100', null, null, null, '208', '2015-10-11 16:53:56.606+06', '2015-10-11 16:53:56.606+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('511', '16', '90', 'invoked', 'uninvoked', 'f', 't', '100', '44', null, null, '209', '2015-10-11 16:53:56.606+06', '2015-10-11 16:53:56.606+06', 'en', 'invoking', 't', '', 'f', '44', null, null);
INSERT INTO "public"."sessionstates" VALUES ('512', '16', '90', 'invoked', 'uninvoked', 'f', 't', '100', '45', null, null, '210', '2015-10-11 16:53:56.606+06', '2015-10-11 16:53:56.606+06', 'en', 'invoking', 't', '', 'f', '45', null, null);
INSERT INTO "public"."sessionstates" VALUES ('513', '16', '90', 'lap', 'unlap', 'f', 'f', '0', null, null, '19', '211', '2015-10-11 16:53:56.606+06', '2015-10-11 16:53:56.606+06', 'en', '', 'f', '', 'f', null, '19', null);
INSERT INTO "public"."sessionstates" VALUES ('514', '16', '90', 'invoked', 'uninvoked', 'f', 't', '100', null, '18', null, '212', '2015-10-11 16:53:56.607+06', '2015-10-11 16:53:56.607+06', 'en', 'invoking', 't', '', 'f', null, null, '18');
INSERT INTO "public"."sessionstates" VALUES ('515', '16', '90', 'invoked', 'uninvoked', 'f', 't', '100', '46', null, null, '213', '2015-10-11 16:53:56.607+06', '2015-10-11 16:53:56.607+06', 'en', 'invoking', 't', '', 'f', '46', null, null);
INSERT INTO "public"."sessionstates" VALUES ('516', '16', '91', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '214', '2015-10-11 16:58:20.485+06', '2015-10-11 16:58:20.485+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('517', '16', '91', 'invoking', 'paused', 't', 't', '100', null, null, null, '215', '2015-10-11 16:58:20.485+06', '2015-10-11 16:58:20.485+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('518', '16', '91', 'finished', 'unfinished', 't', 't', '100', null, null, null, '216', '2015-10-11 16:58:20.485+06', '2015-10-11 16:58:20.485+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('519', '16', '91', 'invoked', 'uninvoked', 'f', 't', '100', '47', null, null, '217', '2015-10-11 16:58:20.485+06', '2015-10-11 16:58:20.485+06', 'en', 'invoking', 't', '', 'f', '47', null, null);
INSERT INTO "public"."sessionstates" VALUES ('520', '16', '91', 'invoked', 'uninvoked', 'f', 't', '100', '48', null, null, '218', '2015-10-11 16:58:20.485+06', '2015-10-11 16:58:20.485+06', 'en', 'invoking', 't', '', 'f', '48', null, null);
INSERT INTO "public"."sessionstates" VALUES ('521', '16', '91', 'lap', 'unlap', 'f', 'f', '0', null, null, '20', '219', '2015-10-11 16:58:20.485+06', '2015-10-11 16:58:20.485+06', 'en', '', 'f', '', 'f', null, '20', null);
INSERT INTO "public"."sessionstates" VALUES ('522', '16', '91', 'invoked', 'uninvoked', 'f', 't', '100', null, '19', null, '220', '2015-10-11 16:58:20.486+06', '2015-10-11 16:58:20.486+06', 'en', 'invoking', 't', '', 'f', null, null, '19');
INSERT INTO "public"."sessionstates" VALUES ('523', '16', '91', 'invoked', 'uninvoked', 'f', 't', '100', '49', null, null, '221', '2015-10-11 16:58:20.486+06', '2015-10-11 16:58:20.486+06', 'en', 'invoking', 't', '', 'f', '49', null, null);
INSERT INTO "public"."sessionstates" VALUES ('524', '16', '92', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '222', '2015-10-11 17:01:03.541+06', '2015-10-11 17:01:03.541+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('525', '16', '92', 'invoking', 'paused', 't', 't', '100', null, null, null, '223', '2015-10-11 17:01:03.541+06', '2015-10-11 17:01:03.541+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('526', '16', '92', 'finished', 'unfinished', 't', 't', '100', null, null, null, '224', '2015-10-11 17:01:03.541+06', '2015-10-11 17:01:03.541+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('527', '16', '92', 'invoked', 'uninvoked', 'f', 't', '100', '50', null, null, '225', '2015-10-11 17:01:03.541+06', '2015-10-11 17:01:03.541+06', 'en', 'invoking', 't', '', 'f', '50', null, null);
INSERT INTO "public"."sessionstates" VALUES ('528', '16', '92', 'invoked', 'uninvoked', 'f', 't', '100', '51', null, null, '226', '2015-10-11 17:01:03.541+06', '2015-10-11 17:01:03.541+06', 'en', 'invoking', 't', '', 'f', '51', null, null);
INSERT INTO "public"."sessionstates" VALUES ('529', '16', '92', 'lap', 'unlap', 'f', 'f', '0', null, null, '21', '227', '2015-10-11 17:01:03.541+06', '2015-10-11 17:01:03.541+06', 'en', '', 'f', '', 'f', null, '21', null);
INSERT INTO "public"."sessionstates" VALUES ('530', '16', '92', 'invoked', 'uninvoked', 'f', 't', '100', null, '20', null, '228', '2015-10-11 17:01:03.541+06', '2015-10-11 17:01:03.541+06', 'en', 'invoking', 't', '', 'f', null, null, '20');
INSERT INTO "public"."sessionstates" VALUES ('531', '16', '92', 'invoked', 'uninvoked', 'f', 't', '100', '52', null, null, '229', '2015-10-11 17:01:03.541+06', '2015-10-11 17:01:03.541+06', 'en', 'invoking', 't', '', 'f', '52', null, null);
INSERT INTO "public"."sessionstates" VALUES ('532', '16', '93', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '230', '2015-10-11 17:09:46.737+06', '2015-10-11 17:09:46.737+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('533', '16', '93', 'invoking', 'paused', 't', 't', '100', null, null, null, '231', '2015-10-11 17:09:46.737+06', '2015-10-11 17:09:46.737+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('534', '16', '93', 'finished', 'unfinished', 't', 't', '100', null, null, null, '232', '2015-10-11 17:09:46.737+06', '2015-10-11 17:09:46.737+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('535', '16', '93', 'invoked', 'uninvoked', 'f', 't', '100', '53', null, null, '233', '2015-10-11 17:09:46.737+06', '2015-10-11 17:09:46.737+06', 'en', 'invoking', 't', '', 'f', '53', null, null);
INSERT INTO "public"."sessionstates" VALUES ('536', '16', '93', 'invoked', 'uninvoked', 'f', 't', '100', '54', null, null, '234', '2015-10-11 17:09:46.737+06', '2015-10-11 17:09:46.737+06', 'en', 'invoking', 't', '', 'f', '54', null, null);
INSERT INTO "public"."sessionstates" VALUES ('537', '16', '93', 'lap', 'unlap', 'f', 'f', '0', null, null, '22', '235', '2015-10-11 17:09:46.737+06', '2015-10-11 17:09:46.737+06', 'en', '', 'f', '', 'f', null, '22', null);
INSERT INTO "public"."sessionstates" VALUES ('538', '16', '93', 'invoked', 'uninvoked', 'f', 't', '100', null, '21', null, '236', '2015-10-11 17:09:46.737+06', '2015-10-11 17:09:46.737+06', 'en', 'invoking', 't', '', 'f', null, null, '21');
INSERT INTO "public"."sessionstates" VALUES ('539', '16', '93', 'invoked', 'uninvoked', 'f', 't', '100', '55', null, null, '237', '2015-10-11 17:09:46.737+06', '2015-10-11 17:09:46.737+06', 'en', 'invoking', 't', '', 'f', '55', null, null);
INSERT INTO "public"."sessionstates" VALUES ('540', '16', '94', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '238', '2015-10-11 22:20:25.553+06', '2015-10-11 22:20:25.553+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('541', '16', '94', 'invoking', 'paused', 't', 't', '100', null, null, null, '239', '2015-10-11 22:20:25.558+06', '2015-10-11 22:20:25.558+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('542', '16', '94', 'finished', 'unfinished', 't', 't', '100', null, null, null, '240', '2015-10-11 22:20:25.558+06', '2015-10-11 22:20:25.558+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('543', '16', '94', 'invoked', 'uninvoked', 'f', 't', '100', '56', null, null, '241', '2015-10-11 22:20:25.558+06', '2015-10-11 22:20:25.558+06', 'en', 'invoking', 't', '', 'f', '56', null, null);
INSERT INTO "public"."sessionstates" VALUES ('544', '16', '94', 'invoked', 'uninvoked', 'f', 't', '100', '57', null, null, '242', '2015-10-11 22:20:25.558+06', '2015-10-11 22:20:25.558+06', 'en', 'invoking', 't', '', 'f', '57', null, null);
INSERT INTO "public"."sessionstates" VALUES ('545', '16', '94', 'lap', 'unlap', 'f', 'f', '0', null, null, '23', '243', '2015-10-11 22:20:25.558+06', '2015-10-11 22:20:25.558+06', 'en', '', 'f', '', 'f', null, '23', null);
INSERT INTO "public"."sessionstates" VALUES ('546', '16', '94', 'invoked', 'uninvoked', 'f', 't', '100', null, '22', null, '244', '2015-10-11 22:20:25.558+06', '2015-10-11 22:20:25.558+06', 'en', 'invoking', 't', '', 'f', null, null, '22');
INSERT INTO "public"."sessionstates" VALUES ('547', '16', '94', 'invoked', 'uninvoked', 'f', 't', '100', '58', null, null, '245', '2015-10-11 22:20:25.558+06', '2015-10-11 22:20:25.558+06', 'en', 'invoking', 't', '', 'f', '58', null, null);
INSERT INTO "public"."sessionstates" VALUES ('548', '15', '95', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '246', '2015-10-12 21:00:34.774+06', '2015-10-12 21:00:34.774+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('549', '15', '95', 'invoking', 'paused', 't', 't', '100', null, null, null, '247', '2015-10-12 21:00:34.777+06', '2015-10-12 21:00:34.777+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('550', '15', '95', 'finished', 'unfinished', 't', 't', '100', null, null, null, '248', '2015-10-12 21:00:34.777+06', '2015-10-12 21:00:34.777+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('551', '15', '95', 'invoked', 'uninvoked', 'f', 't', '100', '59', null, null, '249', '2015-10-12 21:00:34.777+06', '2015-10-12 21:00:34.777+06', 'en', 'invoking', 't', '', 'f', '59', null, null);
INSERT INTO "public"."sessionstates" VALUES ('552', '15', '95', 'confirmed', 'unconfirmed', 'f', 't', '100', '59', null, null, '250', '2015-10-12 21:00:34.777+06', '2015-10-12 21:00:34.777+06', 'en', 'confirming', 't', '', 'f', '59', null, null);
INSERT INTO "public"."sessionstates" VALUES ('553', '15', '95', 'invoked', 'uninvoked', 'f', 't', '100', '60', null, null, '251', '2015-10-12 21:00:34.777+06', '2015-10-12 21:00:34.777+06', 'en', 'invoking', 't', '', 'f', '60', null, null);
INSERT INTO "public"."sessionstates" VALUES ('554', '15', '95', 'lap', 'unlap', 'f', 'f', '0', null, null, '24', '252', '2015-10-12 21:00:34.778+06', '2015-10-12 21:00:34.778+06', 'en', '', 'f', '', 'f', null, '24', null);
INSERT INTO "public"."sessionstates" VALUES ('555', '15', '95', 'invoked', 'uninvoked', 'f', 't', '100', null, '23', null, '253', '2015-10-12 21:00:34.778+06', '2015-10-12 21:00:34.778+06', 'en', 'invoking', 't', '', 'f', null, null, '23');
INSERT INTO "public"."sessionstates" VALUES ('556', '15', '95', 'confirmed', 'unconfirmed', 'f', 't', '100', null, '23', null, '254', '2015-10-12 21:00:34.778+06', '2015-10-12 21:00:34.778+06', 'en', 'confirming', 't', '', 'f', null, null, '23');
INSERT INTO "public"."sessionstates" VALUES ('557', '15', '95', 'invoked', 'uninvoked', 'f', 't', '100', '61', null, null, '255', '2015-10-12 21:00:34.778+06', '2015-10-12 21:00:34.778+06', 'en', 'invoking', 't', '', 'f', '61', null, null);
INSERT INTO "public"."sessionstates" VALUES ('558', '15', '95', 'lap', 'unlap', 'f', 'f', '0', null, null, '25', '256', '2015-10-12 21:00:34.778+06', '2015-10-12 21:00:34.778+06', 'en', '', 'f', '', 'f', null, '25', null);
INSERT INTO "public"."sessionstates" VALUES ('559', '15', '95', 'invoked', 'uninvoked', 'f', 'f', '0', null, '24', null, '257', '2015-10-12 21:00:34.778+06', '2015-10-12 21:00:34.778+06', 'en', 'invoking', 't', '', 'f', null, null, '24');
INSERT INTO "public"."sessionstates" VALUES ('560', '16', '96', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '258', '2015-10-20 10:28:44.447+06', '2015-10-20 10:28:44.447+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('561', '16', '96', 'invoking', 'paused', 't', 't', '100', null, null, null, '259', '2015-10-20 10:28:44.596+06', '2015-10-20 10:28:44.596+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('562', '16', '96', 'finished', 'unfinished', 't', 't', '100', null, null, null, '260', '2015-10-20 10:28:44.596+06', '2015-10-20 10:28:44.596+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('563', '16', '96', 'invoked', 'uninvoked', 'f', 't', '100', '64', null, null, '261', '2015-10-20 10:28:44.596+06', '2015-10-20 10:28:44.596+06', 'en', 'invoking', 't', '', 'f', '64', null, null);
INSERT INTO "public"."sessionstates" VALUES ('564', '16', '96', 'invoked', 'uninvoked', 'f', 't', '100', '62', null, null, '262', '2015-10-20 10:28:44.596+06', '2015-10-20 10:28:44.596+06', 'en', 'invoking', 't', '', 'f', '62', null, null);
INSERT INTO "public"."sessionstates" VALUES ('565', '16', '96', 'lap', 'unlap', 'f', 'f', '0', null, null, '26', '263', '2015-10-20 10:28:44.596+06', '2015-10-20 10:28:44.596+06', 'en', '', 'f', '', 'f', null, '26', null);
INSERT INTO "public"."sessionstates" VALUES ('566', '16', '96', 'invoked', 'uninvoked', 'f', 't', '100', null, '25', null, '264', '2015-10-20 10:28:44.596+06', '2015-10-20 10:28:44.596+06', 'en', 'invoking', 't', '', 'f', null, null, '25');
INSERT INTO "public"."sessionstates" VALUES ('567', '16', '96', 'invoked', 'uninvoked', 'f', 't', '100', '63', null, null, '265', '2015-10-20 10:28:44.596+06', '2015-10-20 10:28:44.596+06', 'en', 'invoking', 't', '', 'f', '63', null, null);
INSERT INTO "public"."sessionstates" VALUES ('568', '16', '97', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '266', '2015-10-20 10:39:23.836+06', '2015-10-20 10:39:23.836+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('569', '16', '97', 'invoking', 'paused', 't', 't', '100', null, null, null, '267', '2015-10-20 10:39:23.909+06', '2015-10-20 10:39:23.909+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('570', '16', '97', 'finished', 'unfinished', 't', 't', '100', null, null, null, '268', '2015-10-20 10:39:23.909+06', '2015-10-20 10:39:23.909+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('571', '16', '97', 'invoked', 'uninvoked', 'f', 't', '100', '67', null, null, '269', '2015-10-20 10:39:23.909+06', '2015-10-20 10:39:23.909+06', 'en', 'invoking', 't', '', 'f', '67', null, null);
INSERT INTO "public"."sessionstates" VALUES ('572', '16', '97', 'invoked', 'uninvoked', 'f', 't', '100', '65', null, null, '270', '2015-10-20 10:39:23.909+06', '2015-10-20 10:39:23.909+06', 'en', 'invoking', 't', '', 'f', '65', null, null);
INSERT INTO "public"."sessionstates" VALUES ('573', '16', '97', 'lap', 'unlap', 'f', 'f', '0', null, null, '27', '271', '2015-10-20 10:39:23.909+06', '2015-10-20 10:39:23.909+06', 'en', '', 'f', '', 'f', null, '27', null);
INSERT INTO "public"."sessionstates" VALUES ('574', '16', '97', 'invoked', 'uninvoked', 'f', 't', '100', null, '26', null, '272', '2015-10-20 10:39:23.909+06', '2015-10-20 10:39:23.909+06', 'en', 'invoking', 't', '', 'f', null, null, '26');
INSERT INTO "public"."sessionstates" VALUES ('575', '16', '97', 'invoked', 'uninvoked', 'f', 't', '100', '66', null, null, '273', '2015-10-20 10:39:23.909+06', '2015-10-20 10:39:23.909+06', 'en', 'invoking', 't', '', 'f', '66', null, null);
INSERT INTO "public"."sessionstates" VALUES ('576', '17', '98', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '274', '2015-10-25 03:12:44.33+06', '2015-10-25 03:12:44.331+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('577', '17', '98', 'invoking', 'paused', 't', 't', '100', null, null, null, '275', '2015-10-25 03:12:44.419+06', '2015-10-25 03:12:44.419+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('578', '17', '98', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '276', '2015-10-25 03:12:44.419+06', '2015-10-25 03:12:44.419+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('579', '17', '98', 'invoked', 'uninvoked', 'f', 't', '100', '68', null, null, '277', '2015-10-25 03:12:44.419+06', '2015-10-25 03:12:44.419+06', 'en', 'invoking', 't', '', 'f', '68', null, null);
INSERT INTO "public"."sessionstates" VALUES ('580', '17', '98', 'confirmed', 'unconfirmed', 'f', 'f', '0', '68', null, null, '278', '2015-10-25 03:12:44.419+06', '2015-10-25 03:12:44.419+06', 'en', 'confirming', 't', '', 'f', '68', null, null);
INSERT INTO "public"."sessionstates" VALUES ('581', '14', '99', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '279', '2015-10-30 08:54:04.499+06', '2015-10-30 08:54:04.499+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('582', '14', '99', 'invoking', 'paused', 't', 't', '100', null, null, null, '280', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('583', '14', '99', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '281', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('584', '14', '99', 'invoked', 'uninvoked', 'f', 't', '100', '69', null, null, '282', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', 'invoking', 't', '', 'f', '69', null, null);
INSERT INTO "public"."sessionstates" VALUES ('585', '14', '99', 'confirmed', 'unconfirmed', 'f', 'f', '0', '69', null, null, '283', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', 'confirming', 't', '', 'f', '69', null, null);
INSERT INTO "public"."sessionstates" VALUES ('586', '14', '99', 'invoked', 'uninvoked', 'f', 'f', '0', '70', null, null, '284', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', 'invoking', 't', '', 'f', '70', null, null);
INSERT INTO "public"."sessionstates" VALUES ('587', '14', '99', 'lap', 'unlap', 'f', 'f', '0', null, null, '28', '285', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', '', 'f', '', 'f', null, '28', null);
INSERT INTO "public"."sessionstates" VALUES ('588', '14', '99', 'invoked', 'uninvoked', 'f', 'f', '0', null, '27', null, '286', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', 'invoking', 't', '', 'f', null, null, '27');
INSERT INTO "public"."sessionstates" VALUES ('589', '14', '99', 'confirmed', 'unconfirmed', 'f', 'f', '0', null, '27', null, '287', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', 'confirming', 't', '', 'f', null, null, '27');
INSERT INTO "public"."sessionstates" VALUES ('590', '14', '99', 'invoked', 'uninvoked', 'f', 'f', '0', '71', null, null, '288', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', 'invoking', 't', '', 'f', '71', null, null);
INSERT INTO "public"."sessionstates" VALUES ('591', '14', '99', 'confirmed', 'unconfirmed', 'f', 'f', '0', '71', null, null, '289', '2015-10-30 08:54:04.608+06', '2015-10-30 08:54:04.608+06', 'en', 'confirming', 't', '', 'f', '71', null, null);
INSERT INTO "public"."sessionstates" VALUES ('592', '17', '100', 'initiated', 'uninitiated', 't', 't', '100', null, null, null, '290', '2015-11-11 23:51:52.323+06', '2015-11-11 23:51:52.323+06', 'en', 'initiating', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('593', '17', '100', 'invoking', 'paused', 't', 't', '100', null, null, null, '291', '2015-11-11 23:51:52.36+06', '2015-11-11 23:51:52.36+06', 'en', 'invoking', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('594', '17', '100', 'finished', 'unfinished', 't', 'f', '0', null, null, null, '292', '2015-11-11 23:51:52.36+06', '2015-11-11 23:51:52.36+06', 'en', 'finishing', 't', '', 'f', null, null, null);
INSERT INTO "public"."sessionstates" VALUES ('595', '17', '100', 'invoked', 'uninvoked', 'f', 't', '100', '72', null, null, '293', '2015-11-11 23:51:52.36+06', '2015-11-11 23:51:52.36+06', 'en', 'invoking', 't', '', 'f', '72', null, null);
INSERT INTO "public"."sessionstates" VALUES ('596', '17', '100', 'confirmed', 'unconfirmed', 'f', 'f', '0', '72', null, null, '294', '2015-11-11 23:51:52.36+06', '2015-11-11 23:51:52.36+06', 'en', 'confirming', 't', '', 'f', '72', null, null);

-- ----------------------------
-- Table structure for space_element_reflections
-- ----------------------------
DROP TABLE IF EXISTS "public"."space_element_reflections";
CREATE TABLE "public"."space_element_reflections" (
"id" int4 DEFAULT nextval('space_element_reflections_id_seq'::regclass) NOT NULL,
"reflection_id" int4 NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"desc" varchar COLLATE "default" NOT NULL,
"b_type" varchar COLLATE "default" NOT NULL,
"type_title" varchar COLLATE "default" NOT NULL,
"ref_space_id" int4,
"ref_space_owned_id" int4 NOT NULL,
"space_role" varchar COLLATE "default",
"order" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of space_element_reflections
-- ----------------------------

-- ----------------------------
-- Table structure for space_elements
-- ----------------------------
DROP TABLE IF EXISTS "public"."space_elements";
CREATE TABLE "public"."space_elements" (
"id" int4 DEFAULT nextval('space_elements_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"desc" varchar COLLATE "default" NOT NULL,
"business_id" int4 NOT NULL,
"bprocess_id" int4 NOT NULL,
"b_type" varchar COLLATE "default" NOT NULL,
"type_title" varchar COLLATE "default" NOT NULL,
"own_space_id" int4,
"owned_space_id" int4 NOT NULL,
"space_role" varchar COLLATE "default",
"order" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of space_elements
-- ----------------------------
INSERT INTO "public"."space_elements" VALUES ('15', 'cf', 'cf', '2', '11', 'block', 'confirm', null, '11', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."space_elements" VALUES ('16', 'авыа', '', '2', '14', 'block', 'confirm', null, '12', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."space_elements" VALUES ('17', 'cn cf', '', '2', '15', 'block', 'confirm', null, '13', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."space_elements" VALUES ('18', 'cn ph', '', '2', '15', 'block', 'placeholder', null, '14', null, '1', null, null);
INSERT INTO "public"."space_elements" VALUES ('19', 'ph', '', '2', '16', 'block', 'placeholder', null, '15', null, '1', null, null);
INSERT INTO "public"."space_elements" VALUES ('20', 'са', '', '2', '10', 'block', 'confirm', null, '16', null, '1', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');
INSERT INTO "public"."space_elements" VALUES ('21', 'cf', 'cf', '2', '10', 'block', 'confirm', null, '16', null, '2', '2015-06-19 22:43:54.623+06', '2015-06-19 22:43:54.623+06');

-- ----------------------------
-- Table structure for space_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."space_refs";
CREATE TABLE "public"."space_refs" (
"id" int4 DEFAULT nextval('space_refs_id_seq'::regclass) NOT NULL,
"reflection_id" int4 NOT NULL,
"index" int4 NOT NULL,
"container" bool NOT NULL,
"subbrick" bool NOT NULL,
"brick_front" int4,
"brick_nested" int4,
"nestingLevel" int4 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of space_refs
-- ----------------------------
INSERT INTO "public"."space_refs" VALUES ('1', '1', '1', 't', 'f', '1', null, '1', '2015-06-19 22:43:32.132+06', '2015-06-19 22:43:32.132+06');

-- ----------------------------
-- Table structure for state_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."state_refs";
CREATE TABLE "public"."state_refs" (
"id" int4 DEFAULT nextval('state_refs_id_seq'::regclass) NOT NULL,
"reflection_id" int4 NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"neutral" varchar COLLATE "default" NOT NULL,
"process_state" bool DEFAULT false NOT NULL,
"on" bool DEFAULT false NOT NULL,
"on_rate" int4 DEFAULT 0 NOT NULL,
"ref_front_elem_id" int4,
"ref_space_elem_id" int4,
"ref_space_id" int4,
"created_at" timestamptz(6),
"updated_at" timestamptz(6),
"lang" varchar COLLATE "default" DEFAULT 'en'::character varying NOT NULL,
"middle" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"middleable" bool DEFAULT false NOT NULL,
"oposite" varchar COLLATE "default" DEFAULT ''::character varying NOT NULL,
"opositable" bool DEFAULT false NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of state_refs
-- ----------------------------
INSERT INTO "public"."state_refs" VALUES ('1', '1', 'invoked', 'uninvoked', 'f', 'f', '0', '1', null, null, '2015-06-19 22:43:31.928+06', '2015-06-19 22:43:31.928+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."state_refs" VALUES ('2', '1', 'lap', 'unlap', 'f', 'f', '0', null, null, '1', '2015-06-19 22:43:32.239+06', '2015-06-19 22:43:32.239+06', 'en', '', 'f', '', 'f');
INSERT INTO "public"."state_refs" VALUES ('3', '2', 'invoked', 'uninvoked', 'f', 'f', '0', '2', null, null, '2015-06-19 22:43:54.4+06', '2015-06-19 22:43:54.4+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."state_refs" VALUES ('4', '3', 'invoked', 'uninvoked', 'f', 'f', '0', '3', null, null, '2015-06-19 22:43:54.726+06', '2015-06-19 22:43:54.726+06', 'en', 'invoking', 't', '', 'f');
INSERT INTO "public"."state_refs" VALUES ('5', '3', 'confirmed', 'unconfirmed', 'f', 'f', '0', '3', null, null, '2015-06-19 22:43:54.803+06', '2015-06-19 22:43:54.803+06', 'en', 'confirming', 't', '', 'f');

-- ----------------------------
-- Table structure for switcher_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."switcher_refs";
CREATE TABLE "public"."switcher_refs" (
"id" int4 DEFAULT nextval('switcher_refs_id_seq'::regclass) NOT NULL,
"reflection_id" int4 NOT NULL,
"switch_type" varchar COLLATE "default" NOT NULL,
"priority" int4 DEFAULT 2 NOT NULL,
"state_ref_id" int4 NOT NULL,
"fn" varchar COLLATE "default" NOT NULL,
"target" varchar COLLATE "default" NOT NULL,
"override_group" int4 DEFAULT 0 NOT NULL,
"created_at" timestamptz(6),
"updated_at" timestamptz(6)
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of switcher_refs
-- ----------------------------
INSERT INTO "public"."switcher_refs" VALUES ('1', '1', 'inn', '2', '1', 'inn', 'space', '0', '2015-06-19 22:43:32.037+06', '2015-06-19 22:43:32.037+06');
INSERT INTO "public"."switcher_refs" VALUES ('2', '1', 'outn', '2', '2', 'outn', 'space', '0', '2015-06-19 22:43:32.314+06', '2015-06-19 22:43:32.314+06');
INSERT INTO "public"."switcher_refs" VALUES ('3', '2', 'n', '2', '3', 'inc', 'step', '0', '2015-06-19 22:43:54.507+06', '2015-06-19 22:43:54.507+06');
INSERT INTO "public"."switcher_refs" VALUES ('4', '3', 'p', '2', '4', 'paused', 'process', '1', '2015-06-19 22:43:54.849+06', '2015-06-19 22:43:54.849+06');
INSERT INTO "public"."switcher_refs" VALUES ('5', '3', 'n', '2', '5', 'inc', 'step', '1', '2015-06-19 22:43:54.902+06', '2015-06-19 22:43:54.902+06');

-- ----------------------------
-- Table structure for table_data
-- ----------------------------
DROP TABLE IF EXISTS "public"."table_data";
CREATE TABLE "public"."table_data" (
"month" int4 NOT NULL,
"task" int4 NOT NULL,
"desc" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of table_data
-- ----------------------------
INSERT INTO "public"."table_data" VALUES ('1', '1', 'One thing');
INSERT INTO "public"."table_data" VALUES ('1', '2', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '3', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '4', 'One thing');
INSERT INTO "public"."table_data" VALUES ('1', '5', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '6', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '7', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '8', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '9', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '10', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '11', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '12', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '13', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '14', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '15', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '16', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '17', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '18', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '19', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '20', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '21', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '22', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '23', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '24', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '25', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '26', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '27', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '28', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '29', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '30', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '31', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '32', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '33', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '34', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '35', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '36', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '37', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '38', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '39', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '40', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '41', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '42', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '43', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '44', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '45', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '46', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '47', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '48', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '49', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '50', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '51', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '52', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '53', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '54', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '55', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '56', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '57', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '58', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '59', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '60', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '61', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '62', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '63', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '64', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '65', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '66', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '67', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '68', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '69', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '70', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '71', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '72', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '73', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '74', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '75', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '76', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '77', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '78', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '79', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '80', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '81', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '82', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '83', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '84', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '85', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '86', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '87', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '88', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '89', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '90', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '91', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '92', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '93', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '94', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '95', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '96', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '97', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '98', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '99', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '100', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '101', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '102', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '103', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '104', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '105', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '106', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '107', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '108', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '109', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '110', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '111', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '112', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '113', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '114', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '115', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '116', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '117', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '118', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '119', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '120', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '121', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '122', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '123', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '124', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '125', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '126', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '127', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '128', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '129', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '130', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '131', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '132', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '133', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '134', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '135', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '136', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '137', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '138', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '139', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '140', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '141', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '142', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '143', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '144', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '145', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '146', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '147', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '148', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '149', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '150', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '151', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '152', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '153', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '154', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '155', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '156', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '157', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '158', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '159', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '160', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '161', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '162', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '163', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '164', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '165', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '166', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '167', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '168', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '169', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '170', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '171', 'Another thing');
INSERT INTO "public"."table_data" VALUES ('1', '172', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '173', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '174', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '175', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '176', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '177', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '178', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '179', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '180', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '181', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '182', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '183', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '184', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '185', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '186', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '187', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '188', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '189', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '190', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '191', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '192', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '193', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '194', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '195', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '196', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '197', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '198', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '199', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '200', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '201', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '202', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '203', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '204', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '205', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '206', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '207', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '208', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '209', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '210', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '211', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '212', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '213', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '214', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '215', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '216', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '217', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '218', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '219', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '220', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '221', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '222', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '223', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '224', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '225', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '226', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '227', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '228', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '229', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '230', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '231', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '232', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '233', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '234', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '235', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '236', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '237', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '238', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '239', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '240', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '241', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '242', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '243', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '244', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '245', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '246', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '247', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '248', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '249', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '250', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '251', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '252', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '253', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '254', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '255', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '256', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '257', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '258', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '259', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '260', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '261', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '262', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '263', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '264', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '265', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '266', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '267', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '268', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '269', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '270', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '271', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '272', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '273', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '274', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '275', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '276', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '277', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '278', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '279', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '280', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '281', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '282', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '283', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '284', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '285', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '286', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '287', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '288', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '289', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '290', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '291', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '292', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '293', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '294', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '295', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '296', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '297', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '298', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '299', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '300', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '301', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '302', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '303', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '304', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '305', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '306', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '307', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '308', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '309', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '310', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '311', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '312', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '313', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '314', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '315', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '316', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '317', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '318', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '319', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '320', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '321', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '322', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '323', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '324', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '325', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '326', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '327', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '328', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '329', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '330', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '331', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '332', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '333', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '334', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '335', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '336', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '337', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '338', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '339', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '340', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '341', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '342', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '343', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '344', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '345', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '346', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '347', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '348', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '349', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '350', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '351', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '352', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '353', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '354', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '355', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '356', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '357', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '358', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '359', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '360', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '361', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '362', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '363', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '364', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '365', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '366', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '367', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '368', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '369', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '370', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '371', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '372', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '373', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '374', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '375', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '376', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '377', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '378', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '379', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '380', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '381', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '382', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '383', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '384', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '385', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '386', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '387', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '388', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '389', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '390', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '391', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '392', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '393', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '394', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '395', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '396', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '397', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '398', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '399', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '400', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '401', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '402', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '403', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '404', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '405', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '406', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '407', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '408', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '409', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '410', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '411', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '412', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '413', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '414', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '415', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '416', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '417', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '418', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '419', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '420', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '421', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '422', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '423', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '424', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '425', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '426', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '427', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '428', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '429', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '430', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '431', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '432', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '433', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '434', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '435', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '436', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '437', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '438', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '439', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '440', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '441', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '442', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '443', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '444', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '445', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '446', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '447', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '448', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '449', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '450', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '451', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '452', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '453', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '454', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '455', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '456', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '457', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '458', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '459', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '460', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '461', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '462', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '463', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '464', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '465', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '466', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '467', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '468', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '469', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '470', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '471', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '472', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '473', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '474', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '475', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '476', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '477', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '478', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '479', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '480', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '481', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '482', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '483', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '484', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '485', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '486', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '487', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '488', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '489', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '490', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '491', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '492', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '493', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '494', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '495', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '496', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '497', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '498', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '499', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '500', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '501', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '502', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '503', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '504', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '505', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '506', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '507', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '508', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '509', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '510', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '511', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '512', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '513', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '514', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '515', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '516', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '517', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '518', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '519', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '520', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '521', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '522', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '523', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '524', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '525', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '526', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '527', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '528', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '529', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '530', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '531', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '532', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '533', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '534', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '535', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '536', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '537', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '538', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '539', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '540', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '541', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '542', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '543', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '544', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '545', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '546', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '547', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '548', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '549', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '550', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '551', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '552', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '553', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '554', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '555', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '556', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '557', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '558', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '559', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '560', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '561', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '562', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '563', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '564', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '565', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '566', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '567', 'AAAAAnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '568', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '569', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '570', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '571', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '572', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '573', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '574', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '575', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '576', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '577', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '578', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '579', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '580', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '581', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '582', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '583', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '584', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '585', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '586', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '587', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '588', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '589', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '590', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '591', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '592', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '593', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '594', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '595', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '596', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '597', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '598', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '599', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '600', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '601', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '602', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '603', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '604', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '605', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '606', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '607', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '608', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '609', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '610', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '611', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '612', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '613', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '614', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '615', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '616', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '617', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '618', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '619', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '620', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '621', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '622', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '623', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '624', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '625', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '626', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '627', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '628', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '629', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '630', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '631', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '632', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '633', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '634', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '635', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '636', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '637', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '638', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '639', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '640', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '641', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '642', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '643', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '644', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '645', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '646', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '647', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '648', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '649', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '650', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '651', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '652', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '653', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '654', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '655', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '656', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '657', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '658', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '659', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '660', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '661', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '662', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '663', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '664', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '665', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '666', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '667', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '668', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '669', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '670', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '671', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '672', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '673', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '674', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '675', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '676', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '677', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '678', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '679', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '680', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '681', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '682', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '683', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '684', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '685', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '686', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '687', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '688', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '689', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '690', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '691', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '692', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '693', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '694', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '695', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '696', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '697', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '698', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '699', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '700', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '701', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '702', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '703', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '704', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '705', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '706', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '707', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '708', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '709', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '710', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '711', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '712', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '713', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '714', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '715', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '716', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '717', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '718', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '719', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '720', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '721', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '722', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '723', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '724', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '725', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '726', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '727', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '728', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '729', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '730', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '731', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '732', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '733', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '734', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '735', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '736', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '737', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '738', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '739', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '740', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '741', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '742', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '743', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '744', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '745', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '746', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '747', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '748', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '749', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '750', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '751', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '752', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '753', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '754', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '755', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '756', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '757', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '758', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '759', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '760', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '761', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '762', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '763', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '764', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '765', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '766', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '767', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '768', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '769', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '770', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '771', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '772', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '773', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '774', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '775', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '776', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '777', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '778', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '779', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '780', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '781', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '782', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '783', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '784', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '785', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '786', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '787', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '788', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '789', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '790', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '791', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '792', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '793', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '794', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '795', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '796', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '797', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '798', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '799', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '800', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '801', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '802', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '803', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '804', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '805', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '806', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '807', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '808', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '809', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '810', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '811', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '812', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '813', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '814', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '815', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '816', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '817', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '818', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '819', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '820', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '821', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '822', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '823', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '824', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '825', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '826', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '827', 'BBBBBnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '828', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '829', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '830', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '831', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '832', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '833', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '834', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '835', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '836', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '837', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '838', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '839', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '840', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '841', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '842', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '843', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '844', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '845', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '846', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '847', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '848', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '849', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '850', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '851', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '852', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '853', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '854', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '855', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '856', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '857', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '858', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '859', 'AAAOne thing');
INSERT INTO "public"."table_data" VALUES ('1', '860', 'CCCCCCCCnother thing');
INSERT INTO "public"."table_data" VALUES ('1', '861', 'AAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('1', '862', 'One thing');
INSERT INTO "public"."table_data" VALUES ('2', '1', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '2', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '3', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '4', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '5', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '6', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '7', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '8', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '9', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '10', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '11', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '12', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '13', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '14', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '15', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '16', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '17', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '18', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '19', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '20', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '21', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '22', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '23', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '24', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '25', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '26', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '27', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '28', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '29', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '30', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '31', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '32', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '33', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '34', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '35', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '36', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '37', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '38', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '39', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '40', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '41', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '42', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '43', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '44', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '45', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '46', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '47', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '48', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '49', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '50', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '51', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '52', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '53', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '54', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '55', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '56', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '57', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '58', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '59', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '60', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '61', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '62', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '63', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '64', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '65', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '66', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '67', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '68', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '69', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '70', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '71', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '72', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '73', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '74', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '75', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '76', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '77', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '78', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '79', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '80', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '81', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '82', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '83', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '84', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '85', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '86', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '87', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '88', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '89', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '90', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '91', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '92', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '93', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '94', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '95', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '96', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '97', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '98', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '99', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '100', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '101', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '102', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '103', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '104', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '105', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '106', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '107', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '108', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '109', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '110', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '111', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '112', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '113', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '114', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '115', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '116', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '117', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '118', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '119', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '120', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '121', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '122', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '123', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '124', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '125', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '126', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '127', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '128', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '129', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '130', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '131', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '132', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '133', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '134', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '135', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '136', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '137', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '138', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '139', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '140', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '141', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '142', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '143', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '144', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '145', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '146', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '147', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '148', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '149', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '150', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '151', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '152', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '153', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '154', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '155', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '156', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '157', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '158', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '159', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '160', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '161', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '162', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '163', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '164', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '165', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '166', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '167', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '168', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '169', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '170', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '171', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '172', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '173', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '174', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '175', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '176', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '177', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '178', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '179', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '180', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '181', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '182', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '183', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '184', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '185', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '186', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '187', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '188', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '189', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '190', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '191', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '192', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '193', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '194', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '195', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '196', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '197', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '198', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '199', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '200', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '201', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '202', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '203', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '204', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '205', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '206', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '207', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '208', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '209', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '210', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '211', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '212', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '213', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '214', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '215', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '216', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '217', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '218', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '219', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '220', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '221', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '222', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '223', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '224', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '225', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '226', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '227', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '228', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '229', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '230', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '231', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '232', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '233', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '234', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '235', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '236', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '237', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '238', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '239', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '240', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '241', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '242', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '243', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '244', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '245', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '246', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '247', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '248', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '249', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '250', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '251', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '252', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '253', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '254', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '255', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '256', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '257', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '258', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '259', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '260', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '261', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '262', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '263', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '264', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '265', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '266', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '267', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '268', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '269', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '270', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '271', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '272', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '273', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '274', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '275', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '276', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '277', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '278', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '279', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '280', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '281', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '282', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '283', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '284', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '285', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '286', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '287', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '288', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '289', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '290', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '291', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '292', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '293', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '294', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '295', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '296', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '297', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '298', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '299', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '300', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '301', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '302', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '303', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '304', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '305', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '306', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '307', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '308', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '309', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '310', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '311', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '312', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '313', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '314', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '315', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '316', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '317', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '318', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '319', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '320', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '321', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '322', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '323', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '324', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '325', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '326', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '327', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '328', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '329', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '330', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '331', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '332', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '333', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '334', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '335', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '336', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '337', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '338', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '339', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '340', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '341', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '342', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '343', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '344', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '345', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '346', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '347', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '348', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '349', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '350', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '351', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '352', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '353', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '354', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '355', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '356', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '357', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '358', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '359', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '360', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '361', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '362', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '363', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '364', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '365', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '366', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '367', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '368', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '369', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '370', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '371', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '372', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '373', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '374', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '375', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '376', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '377', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '378', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '379', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '380', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '381', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '382', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '383', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '384', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '385', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '386', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '387', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '388', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '389', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '390', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '391', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '392', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '393', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '394', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '395', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '396', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '397', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '398', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '399', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '400', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '401', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '402', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '403', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '404', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '405', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '406', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '407', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '408', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '409', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '410', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '411', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '412', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '413', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '414', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '415', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '416', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '417', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '418', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '419', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '420', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '421', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '422', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '423', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '424', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '425', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '426', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '427', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '428', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '429', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '430', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '431', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '432', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '433', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '434', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '435', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '436', 'AAAAALast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '437', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '438', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '439', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '440', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '441', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '442', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '443', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '444', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '445', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '446', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '447', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '448', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '449', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '450', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '451', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '452', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '453', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '454', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '455', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '456', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '457', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '458', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '459', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '460', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '461', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '462', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '463', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '464', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '465', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '466', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '467', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '468', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '469', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '470', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '471', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '472', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '473', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '474', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '475', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '476', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '477', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '478', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '479', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '480', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '481', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '482', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '483', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '484', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '485', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '486', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '487', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '488', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '489', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '490', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '491', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '492', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '493', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '494', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '495', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '496', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '497', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '498', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '499', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '500', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '501', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '502', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '503', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '504', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '505', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '506', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '507', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '508', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '509', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '510', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '511', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '512', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '513', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '514', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '515', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '516', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '517', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '518', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '519', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '520', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '521', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '522', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '523', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '524', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '525', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '526', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '527', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '528', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '529', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '530', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '531', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '532', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '533', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '534', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '535', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '536', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '537', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '538', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '539', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '540', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '541', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '542', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '543', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '544', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '545', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '546', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '547', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '548', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '549', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '550', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '551', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '552', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '553', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '554', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '555', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '556', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '557', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '558', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '559', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '560', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '561', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '562', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '563', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '564', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '565', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '566', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '567', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '568', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '569', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '570', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '571', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '572', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '573', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '574', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '575', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '576', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '577', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '578', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '579', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '580', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '581', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '582', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '583', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '584', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '585', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '586', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '587', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '588', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '589', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '590', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '591', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '592', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '593', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '594', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '595', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '596', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '597', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '598', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '599', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '600', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '601', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '602', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '603', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '604', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '605', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '606', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '607', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '608', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '609', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '610', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '611', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '612', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '613', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '614', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '615', 'BBBBBLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '616', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '617', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '618', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '619', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '620', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '621', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '622', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '623', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '624', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '625', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '626', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '627', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '628', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '629', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '630', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '631', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '632', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '633', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('2', '634', 'CCCCCCCCLast task of the month');
INSERT INTO "public"."table_data" VALUES ('3', '1', 'First of third month');
INSERT INTO "public"."table_data" VALUES ('3', '2', 'First of third month');
INSERT INTO "public"."table_data" VALUES ('3', '3', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '4', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '5', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '6', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '7', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '8', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '9', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '10', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '11', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '12', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '13', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '14', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '15', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '16', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '17', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '18', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '19', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '20', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '21', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '22', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '23', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '24', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '25', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '26', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '27', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '28', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '29', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '30', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '31', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '32', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '33', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '34', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '35', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '36', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '37', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '38', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '39', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '40', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '41', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '42', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '43', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '44', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '45', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '46', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '47', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '48', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '49', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '50', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '51', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '52', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '53', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '54', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '55', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '56', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '57', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '58', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '59', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '60', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '61', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '62', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '63', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '64', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '65', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '66', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '67', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '68', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '69', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '70', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '71', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '72', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '73', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '74', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '75', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '76', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '77', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '78', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '79', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '80', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '81', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '82', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '83', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '84', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '85', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '86', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '87', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '88', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '89', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '90', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '91', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '92', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '93', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '94', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '95', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '96', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '97', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '98', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '99', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '100', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '101', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '102', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '103', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '104', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '105', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '106', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '107', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '108', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '109', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '110', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '111', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '112', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '113', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '114', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '115', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '116', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '117', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '118', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '119', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '120', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '121', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '122', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '123', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '124', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '125', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '126', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '127', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '128', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '129', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '130', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '131', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '132', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '133', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '134', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '135', 'AAAAAFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '136', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '137', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '138', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '139', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '140', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '141', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '142', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '143', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '144', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '145', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '146', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '147', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '148', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '149', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '150', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '151', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '152', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '153', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '154', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '155', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '156', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '157', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '158', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '159', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '160', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '161', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '162', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '163', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '164', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '165', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '166', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '167', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '168', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '169', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '170', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '171', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '172', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '173', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '174', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '175', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '176', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '177', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '178', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '179', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '180', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '181', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '182', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '183', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '184', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '185', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '186', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '187', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '188', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '189', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '190', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '191', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '192', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '193', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '194', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '195', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '196', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '197', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '198', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '199', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '200', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '201', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '202', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '203', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '204', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '205', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '206', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '207', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '208', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '209', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '210', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '211', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '212', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '213', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '214', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '215', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '216', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '217', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '218', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '219', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '220', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '221', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '222', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '223', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '224', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '225', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '226', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '227', 'BBBBBFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '228', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '229', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '230', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '231', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '232', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '233', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '234', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '235', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('3', '236', 'CCCCCCCCFirst of third month');
INSERT INTO "public"."table_data" VALUES ('4', '-1', 'fdsfs');
INSERT INTO "public"."table_data" VALUES ('6', '1', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '2', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '3', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '4', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '5', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '6', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '7', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '8', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '9', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '10', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '11', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '12', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '13', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '14', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '15', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '16', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '17', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '18', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '19', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '20', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '21', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '22', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '23', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '24', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '25', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '26', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '27', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '28', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '29', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '30', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '31', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '32', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '33', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '34', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '35', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '36', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '37', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '38', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '39', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '40', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '41', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '42', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '43', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '44', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '45', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '46', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '47', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '48', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '49', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '50', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '51', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '52', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '53', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '54', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '55', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '56', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '57', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '58', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '59', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '60', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '61', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '62', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '63', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '64', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '65', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '66', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '67', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '68', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '69', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '70', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '71', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '72', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '73', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '74', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '75', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '76', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '77', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '78', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '79', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '80', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '81', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '82', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '83', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '84', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '85', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '86', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '87', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '88', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '89', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '90', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '91', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '92', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '93', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '94', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '95', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '96', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '97', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '98', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '99', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '100', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '101', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '102', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '103', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '104', 'Last task of the month');
INSERT INTO "public"."table_data" VALUES ('6', '105', 'Last task of the month');

-- ----------------------------
-- Table structure for table_data3
-- ----------------------------
DROP TABLE IF EXISTS "public"."table_data3";
CREATE TABLE "public"."table_data3" (
"month" int4 NOT NULL,
"task" int4 NOT NULL,
"serial" int4 DEFAULT nextval('table_data3_serial_seq'::regclass) NOT NULL,
"desc" text COLLATE "default"
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of table_data3
-- ----------------------------

-- ----------------------------
-- Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."tokens";
CREATE TABLE "public"."tokens" (
"uuid" varchar COLLATE "default" NOT NULL,
"email" varchar COLLATE "default" NOT NULL,
"creationTime" timestamp(6) NOT NULL,
"expirationTime" timestamp(6) NOT NULL,
"isSignUp" bool NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of tokens
-- ----------------------------
INSERT INTO "public"."tokens" VALUES ('66d8fec8-91f3-4aa1-8a5d-848f80ca5a54', '', '2015-09-06 19:53:37.847', '2015-11-05 19:53:37.847', 't');
INSERT INTO "public"."tokens" VALUES ('6f9bb224-9027-4120-892d-7c3f9eea3be9', 'employee5@minorityapp.com', '2015-09-01 16:34:09.851', '2015-09-01 17:34:09.851', 't');
INSERT INTO "public"."tokens" VALUES ('7262dad1-9503-41a5-8b49-86a5d0327df7', 'test666@minorityapp.com', '2015-09-22 18:16:13.578', '2015-11-03 10:16:13.578', 't');
INSERT INTO "public"."tokens" VALUES ('761752dc-643c-495c-8cb1-be3b99f28b00', 'employee2@minorityapp.com', '2015-09-01 16:10:57.196', '2015-09-01 17:10:57.196', 't');
INSERT INTO "public"."tokens" VALUES ('840e8a5a-dc58-4a2b-b9c8-8381be6f912b', 'fafa@fafa.ri', '2015-08-12 22:36:09.392', '2015-08-12 23:36:09.392', 't');
INSERT INTO "public"."tokens" VALUES ('8ef18953-2216-462b-b9be-c548204f9d31', 'teltltlwgw@fdsfs.ru', '2015-09-05 09:33:22.848', '2015-10-17 01:33:22.848', 't');
INSERT INTO "public"."tokens" VALUES ('939c9ff5-e180-4a7e-be3f-440b2fffe623', 'testinvite@testinvite.ru', '2015-08-29 20:15:10.547', '2015-08-29 21:15:10.547', 't');
INSERT INTO "public"."tokens" VALUES ('b9898734-31f9-4ad0-810a-e64e5ecc03b9', 'employee1@minorityapp.com', '2015-09-01 04:00:10.765', '2015-09-01 05:00:10.765', 't');
INSERT INTO "public"."tokens" VALUES ('d40e6acb-5da7-466d-98f4-f81bf8af5db7', 'tete@tete.ru', '2015-08-12 22:35:52.768', '2015-08-12 23:35:52.768', 't');
INSERT INTO "public"."tokens" VALUES ('da3e33f0-a54f-4968-a9a1-49b2ef846c6f', 'habizn@zurob.in', '2015-09-01 06:08:57.722', '2015-09-01 07:08:57.722', 't');
INSERT INTO "public"."tokens" VALUES ('f1c3b720-e8be-415d-9d1c-0bb8a7d3cca6', 'employee2@minorityapp.com', '2015-09-01 15:59:35.801', '2015-09-01 16:59:35.801', 't');

-- ----------------------------
-- Table structure for user_annotations
-- ----------------------------
DROP TABLE IF EXISTS "public"."user_annotations";
CREATE TABLE "public"."user_annotations" (
"id" int4 DEFAULT nextval('user_annotations_id_seq'::regclass) NOT NULL,
"annotation_id" int4 NOT NULL,
"uid" varchar COLLATE "default" NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of user_annotations
-- ----------------------------

-- ----------------------------
-- Table structure for walks
-- ----------------------------
DROP TABLE IF EXISTS "public"."walks";
CREATE TABLE "public"."walks" (
"id" int4 DEFAULT nextval('walks_id_seq'::regclass) NOT NULL,
"title" varchar COLLATE "default" NOT NULL,
"predicate" varchar COLLATE "default" NOT NULL,
"finished" bool NOT NULL,
"started" bool NOT NULL,
"finished_at" timestamptz(6) NOT NULL,
"started_at" timestamptz(6) NOT NULL
)
WITH (OIDS=FALSE)

;

-- ----------------------------
-- Records of walks
-- ----------------------------

-- ----------------------------
-- View structure for table
-- ----------------------------
CREATE OR REPLACE VIEW "public"."table" AS 
 SELECT table_data.month,
    table_data.task,
    table_data."desc"
   FROM table_data;

-- ----------------------------
-- View structure for table3
-- ----------------------------
CREATE OR REPLACE VIEW "public"."table3" AS 
 SELECT table_data3.month,
    table_data3.task,
    table_data3.serial,
    table_data3."desc"
   FROM table_data3;

-- ----------------------------
-- Alter Sequences Owned By 
-- ----------------------------
ALTER SEQUENCE "public"."account_group_id_seq" OWNED BY "account_group"."id";
ALTER SEQUENCE "public"."account_infos_id_seq" OWNED BY "account_infos"."id";
ALTER SEQUENCE "public"."account_loggers_id_seq" OWNED BY "account_loggers"."id";
ALTER SEQUENCE "public"."account_plan_history_id_seq" OWNED BY "account_plan_history"."id";
ALTER SEQUENCE "public"."account_plans_id_seq" OWNED BY "account_plans"."id";
ALTER SEQUENCE "public"."admin_accounts_id_seq" OWNED BY "admin_accounts"."id";
ALTER SEQUENCE "public"."annotation_ranges_id_seq" OWNED BY "annotation_ranges"."id";
ALTER SEQUENCE "public"."annotations_id_seq" OWNED BY "annotations"."id";
ALTER SEQUENCE "public"."billing_info_cards_id_seq" OWNED BY "billing_info_cards"."id";
ALTER SEQUENCE "public"."billing_infos_id_seq" OWNED BY "billing_infos"."id";
ALTER SEQUENCE "public"."bills_id_seq" OWNED BY "bills"."id";
ALTER SEQUENCE "public"."bploggers_id_seq" OWNED BY "bploggers"."id";
ALTER SEQUENCE "public"."bprocesses_id_seq" OWNED BY "bprocesses"."id";
ALTER SEQUENCE "public"."bpsessions_id_seq" OWNED BY "bpsessions"."id";
ALTER SEQUENCE "public"."bpspaces_id_seq" OWNED BY "bpspaces"."id";
ALTER SEQUENCE "public"."bpstates_id_seq" OWNED BY "bpstates"."id";
ALTER SEQUENCE "public"."bpstation_loggers_id_seq" OWNED BY "bpstation_loggers"."id";
ALTER SEQUENCE "public"."bpstations_id_seq" OWNED BY "bpstations"."id";
ALTER SEQUENCE "public"."bpswitchers_id_seq" OWNED BY "bpswitchers"."id";
ALTER SEQUENCE "public"."business_services_id_seq" OWNED BY "business_services"."id";
ALTER SEQUENCE "public"."business_walks_id_seq" OWNED BY "business_walks"."id";
ALTER SEQUENCE "public"."businesses_id_seq" OWNED BY "businesses"."id";
ALTER SEQUENCE "public"."client_observers_id_seq" OWNED BY "client_observers"."id";
ALTER SEQUENCE "public"."elem_topologs_id_seq" OWNED BY "elem_topologs"."id";
ALTER SEQUENCE "public"."element_resources_id_seq" OWNED BY "element_resources"."id";
ALTER SEQUENCE "public"."employees_id_seq" OWNED BY "employees"."id";
ALTER SEQUENCE "public"."groups_id_seq" OWNED BY "groups"."id";
ALTER SEQUENCE "public"."input_loggers_id_seq" OWNED BY "input_loggers"."id";
ALTER SEQUENCE "public"."input_loggers_input_id_seq" OWNED BY "input_loggers"."input_id";
ALTER SEQUENCE "public"."launch_element_slats_id_seq" OWNED BY "launch_element_slats"."id";
ALTER SEQUENCE "public"."observers_id_seq" OWNED BY "observers"."id";
ALTER SEQUENCE "public"."plans_id_seq" OWNED BY "plans"."id";
ALTER SEQUENCE "public"."proc_element_reflections_id_seq" OWNED BY "proc_element_reflections"."id";
ALTER SEQUENCE "public"."proc_elements_id_seq" OWNED BY "proc_elements"."id";
ALTER SEQUENCE "public"."process_histories_id_seq" OWNED BY "process_histories"."id";
ALTER SEQUENCE "public"."process_permissions_id_seq" OWNED BY "process_permissions"."id";
ALTER SEQUENCE "public"."reaction_refs_id_seq" OWNED BY "reaction_refs"."id";
ALTER SEQUENCE "public"."reaction_state_out_refs_id_seq" OWNED BY "reaction_state_out_refs"."id";
ALTER SEQUENCE "public"."reaction_state_outs_id_seq" OWNED BY "reaction_state_outs"."id";
ALTER SEQUENCE "public"."reactions_id_seq" OWNED BY "reactions"."id";
ALTER SEQUENCE "public"."reflected_elem_topologs_id_seq" OWNED BY "reflected_elem_topologs"."id";
ALTER SEQUENCE "public"."refs_id_seq" OWNED BY "refs"."id";
ALTER SEQUENCE "public"."resources_id_seq" OWNED BY "resources"."id";
ALTER SEQUENCE "public"."session_elem_topologs_id_seq" OWNED BY "session_elem_topologs"."id";
ALTER SEQUENCE "public"."session_element_resources_id_seq" OWNED BY "session_element_resources"."id";
ALTER SEQUENCE "public"."session_initial_states_id_seq" OWNED BY "session_initial_states"."id";
ALTER SEQUENCE "public"."session_proc_elements_id_seq" OWNED BY "session_proc_elements"."id";
ALTER SEQUENCE "public"."session_reaction_state_outs_id_seq" OWNED BY "session_reaction_state_outs"."id";
ALTER SEQUENCE "public"."session_reactions_id_seq" OWNED BY "session_reactions"."id";
ALTER SEQUENCE "public"."session_space_elements_id_seq" OWNED BY "session_space_elements"."id";
ALTER SEQUENCE "public"."session_spaces_id_seq" OWNED BY "session_spaces"."id";
ALTER SEQUENCE "public"."session_state_logs_id_seq" OWNED BY "session_state_logs"."id";
ALTER SEQUENCE "public"."session_switchers_id_seq" OWNED BY "session_switchers"."id";
ALTER SEQUENCE "public"."sessionstates_id_seq" OWNED BY "sessionstates"."id";
ALTER SEQUENCE "public"."space_element_reflections_id_seq" OWNED BY "space_element_reflections"."id";
ALTER SEQUENCE "public"."space_elements_id_seq" OWNED BY "space_elements"."id";
ALTER SEQUENCE "public"."space_refs_id_seq" OWNED BY "space_refs"."id";
ALTER SEQUENCE "public"."state_refs_id_seq" OWNED BY "state_refs"."id";
ALTER SEQUENCE "public"."switcher_refs_id_seq" OWNED BY "switcher_refs"."id";
ALTER SEQUENCE "public"."table_data3_serial_seq" OWNED BY "table_data3"."serial";
ALTER SEQUENCE "public"."user_annotations_id_seq" OWNED BY "user_annotations"."id";
ALTER SEQUENCE "public"."walks_id_seq" OWNED BY "walks"."id";

-- ----------------------------
-- Primary Key structure for table account_group
-- ----------------------------
ALTER TABLE "public"."account_group" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table account_infos
-- ----------------------------
ALTER TABLE "public"."account_infos" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table account_loggers
-- ----------------------------
ALTER TABLE "public"."account_loggers" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table account_plan_history
-- ----------------------------
ALTER TABLE "public"."account_plan_history" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table account_plans
-- ----------------------------
ALTER TABLE "public"."account_plans" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table accounts
-- ----------------------------
ALTER TABLE "public"."accounts" ADD PRIMARY KEY ("userId");

-- ----------------------------
-- Primary Key structure for table admin_accounts
-- ----------------------------
ALTER TABLE "public"."admin_accounts" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table annotation_ranges
-- ----------------------------
ALTER TABLE "public"."annotation_ranges" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table annotations
-- ----------------------------
ALTER TABLE "public"."annotations" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table billing_info_cards
-- ----------------------------
ALTER TABLE "public"."billing_info_cards" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table billing_infos
-- ----------------------------
ALTER TABLE "public"."billing_infos" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bills
-- ----------------------------
ALTER TABLE "public"."bills" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bploggers
-- ----------------------------
ALTER TABLE "public"."bploggers" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bprocesses
-- ----------------------------
ALTER TABLE "public"."bprocesses" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bpsessions
-- ----------------------------
ALTER TABLE "public"."bpsessions" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bpspaces
-- ----------------------------
ALTER TABLE "public"."bpspaces" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bpstates
-- ----------------------------
ALTER TABLE "public"."bpstates" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bpstation_loggers
-- ----------------------------
ALTER TABLE "public"."bpstation_loggers" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bpstations
-- ----------------------------
ALTER TABLE "public"."bpstations" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table bpswitchers
-- ----------------------------
ALTER TABLE "public"."bpswitchers" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table business_services
-- ----------------------------
ALTER TABLE "public"."business_services" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table business_walks
-- ----------------------------
ALTER TABLE "public"."business_walks" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table businesses
-- ----------------------------
ALTER TABLE "public"."businesses" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table client_observers
-- ----------------------------
ALTER TABLE "public"."client_observers" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table databasechangeloglock
-- ----------------------------
ALTER TABLE "public"."databasechangeloglock" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table elem_topologs
-- ----------------------------
ALTER TABLE "public"."elem_topologs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table element_resources
-- ----------------------------
ALTER TABLE "public"."element_resources" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table employees
-- ----------------------------
ALTER TABLE "public"."employees" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table groups
-- ----------------------------
ALTER TABLE "public"."groups" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table input_loggers
-- ----------------------------
ALTER TABLE "public"."input_loggers" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table launch_element_slats
-- ----------------------------
ALTER TABLE "public"."launch_element_slats" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table observers
-- ----------------------------
ALTER TABLE "public"."observers" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table plans
-- ----------------------------
ALTER TABLE "public"."plans" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table proc_element_reflections
-- ----------------------------
ALTER TABLE "public"."proc_element_reflections" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table proc_elements
-- ----------------------------
ALTER TABLE "public"."proc_elements" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table process_histories
-- ----------------------------
ALTER TABLE "public"."process_histories" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table process_permissions
-- ----------------------------
ALTER TABLE "public"."process_permissions" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reaction_refs
-- ----------------------------
ALTER TABLE "public"."reaction_refs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reaction_state_out_refs
-- ----------------------------
ALTER TABLE "public"."reaction_state_out_refs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reaction_state_outs
-- ----------------------------
ALTER TABLE "public"."reaction_state_outs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reactions
-- ----------------------------
ALTER TABLE "public"."reactions" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table reflected_elem_topologs
-- ----------------------------
ALTER TABLE "public"."reflected_elem_topologs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table refs
-- ----------------------------
ALTER TABLE "public"."refs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table resources
-- ----------------------------
ALTER TABLE "public"."resources" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_elem_topologs
-- ----------------------------
ALTER TABLE "public"."session_elem_topologs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_element_resources
-- ----------------------------
ALTER TABLE "public"."session_element_resources" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_initial_states
-- ----------------------------
ALTER TABLE "public"."session_initial_states" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_proc_elements
-- ----------------------------
ALTER TABLE "public"."session_proc_elements" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_reaction_state_outs
-- ----------------------------
ALTER TABLE "public"."session_reaction_state_outs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_reactions
-- ----------------------------
ALTER TABLE "public"."session_reactions" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_space_elements
-- ----------------------------
ALTER TABLE "public"."session_space_elements" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_spaces
-- ----------------------------
ALTER TABLE "public"."session_spaces" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_state_logs
-- ----------------------------
ALTER TABLE "public"."session_state_logs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table session_switchers
-- ----------------------------
ALTER TABLE "public"."session_switchers" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sessionstates
-- ----------------------------
ALTER TABLE "public"."sessionstates" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table space_element_reflections
-- ----------------------------
ALTER TABLE "public"."space_element_reflections" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table space_elements
-- ----------------------------
ALTER TABLE "public"."space_elements" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table space_refs
-- ----------------------------
ALTER TABLE "public"."space_refs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table state_refs
-- ----------------------------
ALTER TABLE "public"."state_refs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table switcher_refs
-- ----------------------------
ALTER TABLE "public"."switcher_refs" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Indexes structure for table table_data
-- ----------------------------
CREATE INDEX "mindex" ON "public"."table_data" USING btree (month);
CREATE INDEX "taskindex" ON "public"."table_data" USING btree (task);

-- ----------------------------
-- Primary Key structure for table table_data
-- ----------------------------
ALTER TABLE "public"."table_data" ADD PRIMARY KEY ("month", "task");

-- ----------------------------
-- Primary Key structure for table table_data3
-- ----------------------------
ALTER TABLE "public"."table_data3" ADD PRIMARY KEY ("month", "task");

-- ----------------------------
-- Primary Key structure for table user_annotations
-- ----------------------------
ALTER TABLE "public"."user_annotations" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table walks
-- ----------------------------
ALTER TABLE "public"."walks" ADD PRIMARY KEY ("id");

-- ----------------------------
-- Foreign Key structure for table "public"."account_group"
-- ----------------------------
ALTER TABLE "public"."account_group" ADD FOREIGN KEY ("group_id") REFERENCES "public"."groups" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."account_group" ADD FOREIGN KEY ("account_id") REFERENCES "public"."accounts" ("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."account_infos"
-- ----------------------------
ALTER TABLE "public"."account_infos" ADD FOREIGN KEY ("uid") REFERENCES "public"."accounts" ("userId") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."account_plan_history"
-- ----------------------------
ALTER TABLE "public"."account_plan_history" ADD FOREIGN KEY ("bill_id") REFERENCES "public"."bills" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."account_plan_history" ADD FOREIGN KEY ("account_plan_id") REFERENCES "public"."account_plans" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."account_plans"
-- ----------------------------
ALTER TABLE "public"."account_plans" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;
ALTER TABLE "public"."account_plans" ADD FOREIGN KEY ("master_acc") REFERENCES "public"."accounts" ("userId") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."account_plans" ADD FOREIGN KEY ("plan_id") REFERENCES "public"."plans" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."admin_accounts"
-- ----------------------------
ALTER TABLE "public"."admin_accounts" ADD FOREIGN KEY ("account_id") REFERENCES "public"."accounts" ("userId") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."billing_info_cards"
-- ----------------------------
ALTER TABLE "public"."billing_info_cards" ADD FOREIGN KEY ("billing_info_id") REFERENCES "public"."billing_infos" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."billing_infos"
-- ----------------------------
ALTER TABLE "public"."billing_infos" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."bills"
-- ----------------------------
ALTER TABLE "public"."bills" ADD FOREIGN KEY ("master_acc") REFERENCES "public"."accounts" ("userId") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."bploggers"
-- ----------------------------
ALTER TABLE "public"."bploggers" ADD FOREIGN KEY ("station_id") REFERENCES "public"."bpstations" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."bploggers" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."bprocesses"
-- ----------------------------
ALTER TABLE "public"."bprocesses" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."bprocesses" ADD FOREIGN KEY ("service_id") REFERENCES "public"."business_services" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."bpsessions"
-- ----------------------------
ALTER TABLE "public"."bpsessions" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."bpspaces"
-- ----------------------------
ALTER TABLE "public"."bpspaces" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."bpstates"
-- ----------------------------
ALTER TABLE "public"."bpstates" ADD FOREIGN KEY ("space_elem_id") REFERENCES "public"."space_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."bpstates" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."bpstates" ADD FOREIGN KEY ("front_elem_id") REFERENCES "public"."proc_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."bpstates" ADD FOREIGN KEY ("space_id") REFERENCES "public"."bpspaces" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."bpstations"
-- ----------------------------
ALTER TABLE "public"."bpstations" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."bpswitchers"
-- ----------------------------
ALTER TABLE "public"."bpswitchers" ADD FOREIGN KEY ("session_state") REFERENCES "public"."sessionstates" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."bpswitchers" ADD FOREIGN KEY ("state_id") REFERENCES "public"."bpstates" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."business_services"
-- ----------------------------
ALTER TABLE "public"."business_services" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."business_walks"
-- ----------------------------
ALTER TABLE "public"."business_walks" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."elem_topologs"
-- ----------------------------
ALTER TABLE "public"."elem_topologs" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."elem_topologs" ADD FOREIGN KEY ("space_elem_id") REFERENCES "public"."space_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."elem_topologs" ADD FOREIGN KEY ("front_elem_id") REFERENCES "public"."proc_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."elem_topologs" ADD FOREIGN KEY ("space_id") REFERENCES "public"."bpspaces" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."element_resources"
-- ----------------------------
ALTER TABLE "public"."element_resources" ADD FOREIGN KEY ("element_id") REFERENCES "public"."elem_topologs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."element_resources" ADD FOREIGN KEY ("resource_id") REFERENCES "public"."resources" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."element_resources" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."employees"
-- ----------------------------
ALTER TABLE "public"."employees" ADD FOREIGN KEY ("master_acc") REFERENCES "public"."accounts" ("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."employees_businesses"
-- ----------------------------
ALTER TABLE "public"."employees_businesses" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."employees_businesses" ADD FOREIGN KEY ("employee_id") REFERENCES "public"."employees" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."groups"
-- ----------------------------
ALTER TABLE "public"."groups" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."input_loggers"
-- ----------------------------
ALTER TABLE "public"."input_loggers" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."input_loggers" ADD FOREIGN KEY ("reaction_id") REFERENCES "public"."session_reactions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."input_loggers" ADD FOREIGN KEY ("uid") REFERENCES "public"."accounts" ("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- ----------------------------
-- Foreign Key structure for table "public"."launch_element_slats"
-- ----------------------------
ALTER TABLE "public"."launch_element_slats" ADD FOREIGN KEY ("launched_element_id") REFERENCES "public"."session_elem_topologs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."observers"
-- ----------------------------
ALTER TABLE "public"."observers" ADD FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."observers" ADD FOREIGN KEY ("station_id") REFERENCES "public"."bpstations" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."proc_element_reflections"
-- ----------------------------
ALTER TABLE "public"."proc_element_reflections" ADD FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."proc_elements"
-- ----------------------------
ALTER TABLE "public"."proc_elements" ADD FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."proc_elements" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."process_histories"
-- ----------------------------
ALTER TABLE "public"."process_histories" ADD FOREIGN KEY ("master_acc") REFERENCES "public"."accounts" ("userId") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."process_histories" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."process_permissions"
-- ----------------------------
ALTER TABLE "public"."process_permissions" ADD FOREIGN KEY ("bprocess") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."process_permissions" ADD FOREIGN KEY ("reaction_id") REFERENCES "public"."reactions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."process_permissions" ADD FOREIGN KEY ("front_elem_id") REFERENCES "public"."proc_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."process_permissions" ADD FOREIGN KEY ("uid") REFERENCES "public"."accounts" ("userId") ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE "public"."process_permissions" ADD FOREIGN KEY ("space_elem_id") REFERENCES "public"."space_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."process_permissions" ADD FOREIGN KEY ("group_id") REFERENCES "public"."groups" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."reaction_refs"
-- ----------------------------
ALTER TABLE "public"."reaction_refs" ADD FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reaction_refs" ADD FOREIGN KEY ("element_id") REFERENCES "public"."reflected_elem_topologs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reaction_refs" ADD FOREIGN KEY ("state_ref_id") REFERENCES "public"."state_refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."reaction_state_out_refs"
-- ----------------------------
ALTER TABLE "public"."reaction_state_out_refs" ADD FOREIGN KEY ("reaction_id") REFERENCES "public"."reaction_refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reaction_state_out_refs" ADD FOREIGN KEY ("state_ref") REFERENCES "public"."state_refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."reaction_state_outs"
-- ----------------------------
ALTER TABLE "public"."reaction_state_outs" ADD FOREIGN KEY ("reaction_id") REFERENCES "public"."reactions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reaction_state_outs" ADD FOREIGN KEY ("state_id") REFERENCES "public"."bpstates" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."reactions"
-- ----------------------------
ALTER TABLE "public"."reactions" ADD FOREIGN KEY ("element_id") REFERENCES "public"."elem_topologs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reactions" ADD FOREIGN KEY ("state_ref_id") REFERENCES "public"."bpstates" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reactions" ADD FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."reflected_elem_topologs"
-- ----------------------------
ALTER TABLE "public"."reflected_elem_topologs" ADD FOREIGN KEY ("space_id") REFERENCES "public"."space_refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reflected_elem_topologs" ADD FOREIGN KEY ("space_elem_id") REFERENCES "public"."space_element_reflections" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reflected_elem_topologs" ADD FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."reflected_elem_topologs" ADD FOREIGN KEY ("front_elem_id") REFERENCES "public"."proc_element_reflections" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."resources"
-- ----------------------------
ALTER TABLE "public"."resources" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_elem_topologs"
-- ----------------------------
ALTER TABLE "public"."session_elem_topologs" ADD FOREIGN KEY ("space_elem_id") REFERENCES "public"."session_space_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_elem_topologs" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_elem_topologs" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_elem_topologs" ADD FOREIGN KEY ("front_elem_id") REFERENCES "public"."session_proc_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_elem_topologs" ADD FOREIGN KEY ("space_id") REFERENCES "public"."session_spaces" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_element_resources"
-- ----------------------------
ALTER TABLE "public"."session_element_resources" ADD FOREIGN KEY ("resource_id") REFERENCES "public"."resources" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_element_resources" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_element_resources" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_element_resources" ADD FOREIGN KEY ("session_element_id") REFERENCES "public"."session_elem_topologs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_initial_states"
-- ----------------------------
ALTER TABLE "public"."session_initial_states" ADD FOREIGN KEY ("ses_front_elem_id") REFERENCES "public"."session_proc_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_initial_states" ADD FOREIGN KEY ("ses_space_id") REFERENCES "public"."session_spaces" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_initial_states" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_initial_states" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_initial_states" ADD FOREIGN KEY ("ses_space_elem_id") REFERENCES "public"."session_space_elements" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_proc_elements"
-- ----------------------------
ALTER TABLE "public"."session_proc_elements" ADD FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_proc_elements" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_proc_elements" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_reaction_state_outs"
-- ----------------------------
ALTER TABLE "public"."session_reaction_state_outs" ADD FOREIGN KEY ("reaction_id") REFERENCES "public"."session_reactions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_reaction_state_outs" ADD FOREIGN KEY ("session_state_id") REFERENCES "public"."session_initial_states" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_reactions"
-- ----------------------------
ALTER TABLE "public"."session_reactions" ADD FOREIGN KEY ("state_ref_id") REFERENCES "public"."session_initial_states" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_reactions" ADD FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_reactions" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_reactions" ADD FOREIGN KEY ("element_id") REFERENCES "public"."session_elem_topologs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_space_elements"
-- ----------------------------
ALTER TABLE "public"."session_space_elements" ADD FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_space_elements" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_space_elements" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_space_elements" ADD FOREIGN KEY ("owned_space_id") REFERENCES "public"."session_spaces" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_spaces"
-- ----------------------------
ALTER TABLE "public"."session_spaces" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_spaces" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_state_logs"
-- ----------------------------
ALTER TABLE "public"."session_state_logs" ADD FOREIGN KEY ("state_id") REFERENCES "public"."sessionstates" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_state_logs" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."session_switchers"
-- ----------------------------
ALTER TABLE "public"."session_switchers" ADD FOREIGN KEY ("session_state_ref_id") REFERENCES "public"."session_initial_states" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_switchers" ADD FOREIGN KEY ("session_state_id") REFERENCES "public"."sessionstates" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."session_switchers" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."sessionstates"
-- ----------------------------
ALTER TABLE "public"."sessionstates" ADD FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."sessionstates" ADD FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."sessionstates" ADD FOREIGN KEY ("origin_state_id") REFERENCES "public"."session_initial_states" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."space_element_reflections"
-- ----------------------------
ALTER TABLE "public"."space_element_reflections" ADD FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."space_elements"
-- ----------------------------
ALTER TABLE "public"."space_elements" ADD FOREIGN KEY ("owned_space_id") REFERENCES "public"."bpspaces" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."space_elements" ADD FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."space_elements" ADD FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."space_refs"
-- ----------------------------
ALTER TABLE "public"."space_refs" ADD FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."state_refs"
-- ----------------------------
ALTER TABLE "public"."state_refs" ADD FOREIGN KEY ("ref_space_elem_id") REFERENCES "public"."space_element_reflections" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."state_refs" ADD FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."state_refs" ADD FOREIGN KEY ("ref_space_elem_id") REFERENCES "public"."space_refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."state_refs" ADD FOREIGN KEY ("ref_front_elem_id") REFERENCES "public"."proc_element_reflections" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;

-- ----------------------------
-- Foreign Key structure for table "public"."switcher_refs"
-- ----------------------------
ALTER TABLE "public"."switcher_refs" ADD FOREIGN KEY ("state_ref_id") REFERENCES "public"."state_refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE "public"."switcher_refs" ADD FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON DELETE CASCADE ON UPDATE NO ACTION;
