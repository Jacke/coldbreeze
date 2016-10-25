/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : PostgreSQL
 Source Server Version : 90504
 Source Host           : localhost
 Source Database       : minority3
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 90504
 File Encoding         : utf-8

 Date: 10/25/2016 16:06:34 PM
*/

-- ----------------------------
--  Sequence structure for account_group_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."account_group_id_seq";
CREATE SEQUENCE "public"."account_group_id_seq" INCREMENT 1 START 9 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."account_group_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for account_infos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."account_infos_id_seq";
CREATE SEQUENCE "public"."account_infos_id_seq" INCREMENT 1 START 34 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."account_infos_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for account_loggers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."account_loggers_id_seq";
CREATE SEQUENCE "public"."account_loggers_id_seq" INCREMENT 1 START 1008 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."account_loggers_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for account_plan_history_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."account_plan_history_id_seq";
CREATE SEQUENCE "public"."account_plan_history_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."account_plan_history_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for account_plans_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."account_plans_id_seq";
CREATE SEQUENCE "public"."account_plans_id_seq" INCREMENT 1 START 58 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."account_plans_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for action_act_results_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."action_act_results_id_seq";
CREATE SEQUENCE "public"."action_act_results_id_seq" INCREMENT 1 START 15 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."action_act_results_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for action_acts_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."action_acts_id_seq";
CREATE SEQUENCE "public"."action_acts_id_seq" INCREMENT 1 START 15 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."action_acts_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for billing_infos_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."billing_infos_id_seq";
CREATE SEQUENCE "public"."billing_infos_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."billing_infos_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bills_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bills_id_seq";
CREATE SEQUENCE "public"."bills_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bills_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bploggers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bploggers_id_seq";
CREATE SEQUENCE "public"."bploggers_id_seq" INCREMENT 1 START 1538 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bploggers_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bprocesses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bprocesses_id_seq";
CREATE SEQUENCE "public"."bprocesses_id_seq" INCREMENT 1 START 126 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bprocesses_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bpsessions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bpsessions_id_seq";
CREATE SEQUENCE "public"."bpsessions_id_seq" INCREMENT 1 START 373 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bpsessions_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bpspaces_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bpspaces_id_seq";
CREATE SEQUENCE "public"."bpspaces_id_seq" INCREMENT 1 START 91 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bpspaces_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bpstaterefs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bpstaterefs_id_seq";
CREATE SEQUENCE "public"."bpstaterefs_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bpstaterefs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bpstates_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bpstates_id_seq";
CREATE SEQUENCE "public"."bpstates_id_seq" INCREMENT 1 START 750 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bpstates_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bpstation_loggers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bpstation_loggers_id_seq";
CREATE SEQUENCE "public"."bpstation_loggers_id_seq" INCREMENT 1 START 6631 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bpstation_loggers_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bpstations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bpstations_id_seq";
CREATE SEQUENCE "public"."bpstations_id_seq" INCREMENT 1 START 495 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bpstations_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for bpswitchers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."bpswitchers_id_seq";
CREATE SEQUENCE "public"."bpswitchers_id_seq" INCREMENT 1 START 335 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."bpswitchers_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for business_services_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."business_services_id_seq";
CREATE SEQUENCE "public"."business_services_id_seq" INCREMENT 1 START 61 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."business_services_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for businesses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."businesses_id_seq";
CREATE SEQUENCE "public"."businesses_id_seq" INCREMENT 1 START 36 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."businesses_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for cached_removed_resources_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."cached_removed_resources_id_seq";
CREATE SEQUENCE "public"."cached_removed_resources_id_seq" INCREMENT 1 START 437 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."cached_removed_resources_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for client_observers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."client_observers_id_seq";
CREATE SEQUENCE "public"."client_observers_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."client_observers_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for comments_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."comments_id_seq";
CREATE SEQUENCE "public"."comments_id_seq" INCREMENT 1 START 2 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."comments_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for elem_topologs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."elem_topologs_id_seq";
CREATE SEQUENCE "public"."elem_topologs_id_seq" INCREMENT 1 START 236 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."elem_topologs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for element_resources_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."element_resources_id_seq";
CREATE SEQUENCE "public"."element_resources_id_seq" INCREMENT 1 START 2 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."element_resources_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for employees_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."employees_id_seq";
CREATE SEQUENCE "public"."employees_id_seq" INCREMENT 1 START 46 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."employees_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for files_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."files_id_seq";
CREATE SEQUENCE "public"."files_id_seq" INCREMENT 1 START 39 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."files_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for groups_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."groups_id_seq";
CREATE SEQUENCE "public"."groups_id_seq" INCREMENT 1 START 32 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."groups_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for input_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."input_id_seq";
CREATE SEQUENCE "public"."input_id_seq" INCREMENT 1 START 478 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."input_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for input_loggers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."input_loggers_id_seq";
CREATE SEQUENCE "public"."input_loggers_id_seq" INCREMENT 1 START 251 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."input_loggers_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launch_counters_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_counters_id_seq";
CREATE SEQUENCE "public"."launch_counters_id_seq" INCREMENT 1 START 14 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launch_counters_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launch_files_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_files_id_seq";
CREATE SEQUENCE "public"."launch_files_id_seq" INCREMENT 1 START 15 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launch_files_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launch_middlewares_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_middlewares_id_seq";
CREATE SEQUENCE "public"."launch_middlewares_id_seq" INCREMENT 1 START 97 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launch_middlewares_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launch_shares_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_shares_id_seq";
CREATE SEQUENCE "public"."launch_shares_id_seq" INCREMENT 1 START 2 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launch_shares_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launch_strategies_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_strategies_id_seq";
CREATE SEQUENCE "public"."launch_strategies_id_seq" INCREMENT 1 START 97 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launch_strategies_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launch_strategy_bases_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_strategy_bases_id_seq";
CREATE SEQUENCE "public"."launch_strategy_bases_id_seq" INCREMENT 1 START 90 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launch_strategy_bases_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launch_strategy_inputs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_strategy_inputs_id_seq";
CREATE SEQUENCE "public"."launch_strategy_inputs_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launch_strategy_inputs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launch_strategy_outputs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_strategy_outputs_id_seq";
CREATE SEQUENCE "public"."launch_strategy_outputs_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launch_strategy_outputs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launch_warps_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launch_warps_id_seq";
CREATE SEQUENCE "public"."launch_warps_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launch_warps_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for launches_comments_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."launches_comments_id_seq";
CREATE SEQUENCE "public"."launches_comments_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."launches_comments_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for logininfo_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."logininfo_id_seq";
CREATE SEQUENCE "public"."logininfo_id_seq" INCREMENT 1 START 56 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."logininfo_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for middleware_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."middleware_refs_id_seq";
CREATE SEQUENCE "public"."middleware_refs_id_seq" INCREMENT 1 START 4 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."middleware_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for middleware_statuses_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."middleware_statuses_id_seq";
CREATE SEQUENCE "public"."middleware_statuses_id_seq" INCREMENT 1 START 15 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."middleware_statuses_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for middlewares_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."middlewares_id_seq";
CREATE SEQUENCE "public"."middlewares_id_seq" INCREMENT 1 START 24 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."middlewares_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for oauth1info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."oauth1info_id_seq";
CREATE SEQUENCE "public"."oauth1info_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."oauth1info_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for oauth2info_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."oauth2info_id_seq";
CREATE SEQUENCE "public"."oauth2info_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."oauth2info_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for observers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."observers_id_seq";
CREATE SEQUENCE "public"."observers_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."observers_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for plans_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."plans_id_seq";
CREATE SEQUENCE "public"."plans_id_seq" INCREMENT 1 START 3 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."plans_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for proc_element_reflections_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."proc_element_reflections_id_seq";
CREATE SEQUENCE "public"."proc_element_reflections_id_seq" INCREMENT 1 START 29 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."proc_element_reflections_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for proc_elements_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."proc_elements_id_seq";
CREATE SEQUENCE "public"."proc_elements_id_seq" INCREMENT 1 START 347 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."proc_elements_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for process_histories_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."process_histories_id_seq";
CREATE SEQUENCE "public"."process_histories_id_seq" INCREMENT 1 START 484 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."process_histories_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for process_permissions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."process_permissions_id_seq";
CREATE SEQUENCE "public"."process_permissions_id_seq" INCREMENT 1 START 36 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."process_permissions_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for reaction_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reaction_refs_id_seq";
CREATE SEQUENCE "public"."reaction_refs_id_seq" INCREMENT 1 START 13 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."reaction_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for reaction_state_out_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reaction_state_out_refs_id_seq";
CREATE SEQUENCE "public"."reaction_state_out_refs_id_seq" INCREMENT 1 START 4 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."reaction_state_out_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for reaction_state_outs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reaction_state_outs_id_seq";
CREATE SEQUENCE "public"."reaction_state_outs_id_seq" INCREMENT 1 START 97 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."reaction_state_outs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for reactions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reactions_id_seq";
CREATE SEQUENCE "public"."reactions_id_seq" INCREMENT 1 START 132 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."reactions_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for reflect_action_mappings_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reflect_action_mappings_id_seq";
CREATE SEQUENCE "public"."reflect_action_mappings_id_seq" INCREMENT 1 START 22 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."reflect_action_mappings_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for reflect_element_mappings_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reflect_element_mappings_id_seq";
CREATE SEQUENCE "public"."reflect_element_mappings_id_seq" INCREMENT 1 START 20 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."reflect_element_mappings_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for reflected_elem_topologs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."reflected_elem_topologs_id_seq";
CREATE SEQUENCE "public"."reflected_elem_topologs_id_seq" INCREMENT 1 START 26 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."reflected_elem_topologs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."refs_id_seq";
CREATE SEQUENCE "public"."refs_id_seq" INCREMENT 1 START 37 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for resources_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."resources_id_seq";
CREATE SEQUENCE "public"."resources_id_seq" INCREMENT 1 START 43 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."resources_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_elem_topologs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_elem_topologs_id_seq";
CREATE SEQUENCE "public"."session_elem_topologs_id_seq" INCREMENT 1 START 563 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_elem_topologs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_element_resources_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_element_resources_id_seq";
CREATE SEQUENCE "public"."session_element_resources_id_seq" INCREMENT 1 START 39 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_element_resources_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_initial_states_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_initial_states_id_seq";
CREATE SEQUENCE "public"."session_initial_states_id_seq" INCREMENT 1 START 1990 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_initial_states_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_proc_elements_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_proc_elements_id_seq";
CREATE SEQUENCE "public"."session_proc_elements_id_seq" INCREMENT 1 START 569 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_proc_elements_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_reaction_state_outs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_reaction_state_outs_id_seq";
CREATE SEQUENCE "public"."session_reaction_state_outs_id_seq" INCREMENT 1 START 353 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_reaction_state_outs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_reactions_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_reactions_id_seq";
CREATE SEQUENCE "public"."session_reactions_id_seq" INCREMENT 1 START 498 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_reactions_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_space_elements_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_space_elements_id_seq";
CREATE SEQUENCE "public"."session_space_elements_id_seq" INCREMENT 1 START 22 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_space_elements_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_spaces_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_spaces_id_seq";
CREATE SEQUENCE "public"."session_spaces_id_seq" INCREMENT 1 START 29 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_spaces_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_state_logs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_state_logs_id_seq";
CREATE SEQUENCE "public"."session_state_logs_id_seq" INCREMENT 1 START 2185 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_state_logs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for session_switchers_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."session_switchers_id_seq";
CREATE SEQUENCE "public"."session_switchers_id_seq" INCREMENT 1 START 815 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."session_switchers_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for sessionstates_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."sessionstates_id_seq";
CREATE SEQUENCE "public"."sessionstates_id_seq" INCREMENT 1 START 3317 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."sessionstates_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for space_element_reflections_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."space_element_reflections_id_seq";
CREATE SEQUENCE "public"."space_element_reflections_id_seq" INCREMENT 1 START 3 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."space_element_reflections_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for space_elements_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."space_elements_id_seq";
CREATE SEQUENCE "public"."space_elements_id_seq" INCREMENT 1 START 59 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."space_elements_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for space_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."space_refs_id_seq";
CREATE SEQUENCE "public"."space_refs_id_seq" INCREMENT 1 START 3 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."space_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for state_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."state_refs_id_seq";
CREATE SEQUENCE "public"."state_refs_id_seq" INCREMENT 1 START 35 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."state_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for strategies_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."strategies_id_seq";
CREATE SEQUENCE "public"."strategies_id_seq" INCREMENT 1 START 24 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."strategies_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for strategy_base_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."strategy_base_refs_id_seq";
CREATE SEQUENCE "public"."strategy_base_refs_id_seq" INCREMENT 1 START 7 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."strategy_base_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for strategy_bases_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."strategy_bases_id_seq";
CREATE SEQUENCE "public"."strategy_bases_id_seq" INCREMENT 1 START 23 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."strategy_bases_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for strategy_input_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."strategy_input_refs_id_seq";
CREATE SEQUENCE "public"."strategy_input_refs_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."strategy_input_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for strategy_inputs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."strategy_inputs_id_seq";
CREATE SEQUENCE "public"."strategy_inputs_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."strategy_inputs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for strategy_output_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."strategy_output_refs_id_seq";
CREATE SEQUENCE "public"."strategy_output_refs_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."strategy_output_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for strategy_outputs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."strategy_outputs_id_seq";
CREATE SEQUENCE "public"."strategy_outputs_id_seq" INCREMENT 1 START 1 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."strategy_outputs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for strategy_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."strategy_refs_id_seq";
CREATE SEQUENCE "public"."strategy_refs_id_seq" INCREMENT 1 START 6 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."strategy_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Sequence structure for switcher_refs_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."switcher_refs_id_seq";
CREATE SEQUENCE "public"."switcher_refs_id_seq" INCREMENT 1 START 15 MAXVALUE 9223372036854775807 MINVALUE 1 CACHE 1;
ALTER TABLE "public"."switcher_refs_id_seq" OWNER TO "postgres";

-- ----------------------------
--  Table structure for reflect_action_mappings
-- ----------------------------
DROP TABLE IF EXISTS "public"."reflect_action_mappings";
CREATE TABLE "public"."reflect_action_mappings" (
	"id" int4 NOT NULL DEFAULT nextval('reflect_action_mappings_id_seq'::regclass),
	"reflection_id" int4 NOT NULL,
	"ref_action" int4,
	"element_action" int4 NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."reflect_action_mappings" OWNER TO "postgres";

-- ----------------------------
--  Table structure for account_plans
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_plans";
CREATE TABLE "public"."account_plans" (
	"id" int4 NOT NULL DEFAULT nextval('account_plans_id_seq'::regclass),
	"business_id" int4 NOT NULL,
	"master_acc" varchar(254) NOT NULL COLLATE "default",
	"plan_id" int4 NOT NULL,
	"expired_at" timestamp(6) WITH TIME ZONE NOT NULL,
	"active" bool NOT NULL,
	"limit" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."account_plans" OWNER TO "postgres";

-- ----------------------------
--  Table structure for element_resources
-- ----------------------------
DROP TABLE IF EXISTS "public"."element_resources";
CREATE TABLE "public"."element_resources" (
	"id" int4 NOT NULL DEFAULT nextval('element_resources_id_seq'::regclass),
	"element_id" int4 NOT NULL,
	"process_id" int4 NOT NULL,
	"resource_id" int4 NOT NULL,
	"entities" varchar NOT NULL DEFAULT ''::character varying COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."element_resources" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_spaces
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_spaces";
CREATE TABLE "public"."session_spaces" (
	"id" int4 NOT NULL DEFAULT nextval('session_spaces_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"session_id" int4 NOT NULL,
	"index" int4 NOT NULL,
	"container" bool NOT NULL DEFAULT false,
	"subbrick" bool NOT NULL DEFAULT false,
	"brick_front_id" int4,
	"brick_nested_id" int4,
	"nesting_level" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_spaces" OWNER TO "postgres";

-- ----------------------------
--  Table structure for cached_removed_resources
-- ----------------------------
DROP TABLE IF EXISTS "public"."cached_removed_resources";
CREATE TABLE "public"."cached_removed_resources" (
	"id" int4 NOT NULL DEFAULT nextval('cached_removed_resources_id_seq'::regclass),
	"scope" varchar NOT NULL COLLATE "default",
	"scope_type" varchar NOT NULL COLLATE "default",
	"action" varchar NOT NULL COLLATE "default",
	"what" varchar NOT NULL COLLATE "default",
	"what_id" varchar NOT NULL COLLATE "default",
	"date" timestamp(6) NOT NULL,
	"updatedAttributes" varchar NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."cached_removed_resources" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bpstates
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpstates";
CREATE TABLE "public"."bpstates" (
	"id" int4 NOT NULL DEFAULT nextval('bpstates_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"title" varchar(254) NOT NULL COLLATE "default",
	"neutral" varchar(254) NOT NULL COLLATE "default",
	"is_process_state" bool NOT NULL DEFAULT false,
	"front_elem_id" int4,
	"space_elem_id" int4,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"lang" varchar(254) NOT NULL DEFAULT 'en'::character varying COLLATE "default",
	"space_id" int4,
	"on" bool NOT NULL DEFAULT false,
	"on_rate" int4 NOT NULL DEFAULT 0,
	"middle" varchar(254) DEFAULT ''::character varying COLLATE "default",
	"middleable" bool DEFAULT false,
	"oposite" varchar(254) NOT NULL DEFAULT ''::character varying COLLATE "default",
	"opositable" bool NOT NULL DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bpstates" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launch_strategy_inputs
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_strategy_inputs";
CREATE TABLE "public"."launch_strategy_inputs" (
	"id" int8 NOT NULL DEFAULT nextval('launch_strategy_inputs_id_seq'::regclass),
	"strategy_id" int8 NOT NULL,
	"op" varchar NOT NULL COLLATE "default",
	"title" varchar NOT NULL COLLATE "default",
	"desc" varchar COLLATE "default",
	"ident" varchar NOT NULL COLLATE "default",
	"target_type" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launch_strategy_inputs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for reactions
-- ----------------------------
DROP TABLE IF EXISTS "public"."reactions";
CREATE TABLE "public"."reactions" (
	"id" int4 NOT NULL DEFAULT nextval('reactions_id_seq'::regclass),
	"bprocess_id" int4 NOT NULL,
	"autostart" bool NOT NULL,
	"element_id" int4 NOT NULL,
	"state_ref_id" int4,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE NOT NULL,
	"title" varchar(254) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."reactions" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bpstation_loggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpstation_loggers";
CREATE TABLE "public"."bpstation_loggers" (
	"id" int4 NOT NULL DEFAULT nextval('bpstation_loggers_id_seq'::regclass),
	"station_id" int4 NOT NULL,
	"process_id" int4 NOT NULL,
	"sygnal" varchar(254) NOT NULL COLLATE "default",
	"date" timestamp(6) WITH TIME ZONE NOT NULL,
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
WITH (OIDS=FALSE);
ALTER TABLE "public"."bpstation_loggers" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_elem_topologs
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_elem_topologs";
CREATE TABLE "public"."session_elem_topologs" (
	"id" int4 NOT NULL DEFAULT nextval('session_elem_topologs_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"session_id" int4 NOT NULL,
	"front_elem_id" int4,
	"space_elem_id" int4,
	"hash" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"space_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_elem_topologs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for oauth2info
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth2info";
CREATE TABLE "public"."oauth2info" (
	"id" int8 NOT NULL DEFAULT nextval('oauth2info_id_seq'::regclass),
	"accesstoken" varchar NOT NULL COLLATE "default",
	"tokentype" varchar COLLATE "default",
	"expiresin" int4,
	"refreshtoken" varchar COLLATE "default",
	"logininfoid" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."oauth2info" OWNER TO "postgres";

-- ----------------------------
--  Table structure for reflected_elem_topologs
-- ----------------------------
DROP TABLE IF EXISTS "public"."reflected_elem_topologs";
CREATE TABLE "public"."reflected_elem_topologs" (
	"id" int4 NOT NULL DEFAULT nextval('reflected_elem_topologs_id_seq'::regclass),
	"reflection_id" int4 NOT NULL,
	"front_elem_id" int4,
	"space_elem_id" int4,
	"hash" varchar(254) NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"space_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."reflected_elem_topologs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for action_act_results
-- ----------------------------
DROP TABLE IF EXISTS "public"."action_act_results";
CREATE TABLE "public"."action_act_results" (
	"id" int8 NOT NULL DEFAULT nextval('action_act_results_id_seq'::regclass),
	"in" bool NOT NULL,
	"out" bool NOT NULL,
	"base" bool NOT NULL,
	"content" varchar NOT NULL COLLATE "default",
	"act_id" int8 NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."action_act_results" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launch_files
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_files";
CREATE TABLE "public"."launch_files" (
	"id" int8 NOT NULL DEFAULT nextval('launch_files_id_seq'::regclass),
	"file_id" int8 NOT NULL,
	"launch_id" int4 NOT NULL,
	"element_id" int4,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launch_files" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launches_comments
-- ----------------------------
DROP TABLE IF EXISTS "public"."launches_comments";
CREATE TABLE "public"."launches_comments" (
	"id" int8 NOT NULL DEFAULT nextval('launches_comments_id_seq'::regclass),
	"comment_id" int8 NOT NULL,
	"launch_id" int4 NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launches_comments" OWNER TO "postgres";

-- ----------------------------
--  Table structure for refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."refs";
CREATE TABLE "public"."refs" (
	"id" int4 NOT NULL DEFAULT nextval('refs_id_seq'::regclass),
	"title" varchar(254) NOT NULL COLLATE "default",
	"host" varchar(254) NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"desc" varchar(254) COLLATE "default",
	"category" varchar(254) NOT NULL DEFAULT 'Common'::character varying COLLATE "default",
	"hidden" bool NOT NULL DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bpswitchers
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpswitchers";
CREATE TABLE "public"."bpswitchers" (
	"id" int4 NOT NULL DEFAULT nextval('bpswitchers_id_seq'::regclass),
	"bprocess_id" int4 NOT NULL,
	"switch_type" varchar(254) NOT NULL COLLATE "default",
	"priority" int4 NOT NULL DEFAULT 2,
	"state_id" int4 NOT NULL,
	"session_state" int4,
	"fn" varchar(254) NOT NULL COLLATE "default",
	"target" varchar(254) NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"override_group" int4 NOT NULL DEFAULT 0
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bpswitchers" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bploggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."bploggers";
CREATE TABLE "public"."bploggers" (
	"id" int4 NOT NULL DEFAULT nextval('bploggers_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"proc_element_id" int4,
	"space_element_id" int4,
	"order" int4 NOT NULL,
	"space_id" int4,
	"station_id" int4 NOT NULL,
	"invoked" bool NOT NULL,
	"expanded" bool NOT NULL,
	"container" bool NOT NULL,
	"date" timestamp(6) WITH TIME ZONE NOT NULL,
	"step" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bploggers" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launch_strategy_outputs
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_strategy_outputs";
CREATE TABLE "public"."launch_strategy_outputs" (
	"id" int8 NOT NULL DEFAULT nextval('launch_strategy_outputs_id_seq'::regclass),
	"strategy_id" int8 NOT NULL,
	"op" varchar NOT NULL COLLATE "default",
	"title" varchar NOT NULL COLLATE "default",
	"desc" varchar COLLATE "default",
	"ident" varchar NOT NULL COLLATE "default",
	"target_type" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launch_strategy_outputs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for employees_businesses
-- ----------------------------
DROP TABLE IF EXISTS "public"."employees_businesses";
CREATE TABLE "public"."employees_businesses" (
	"employee_id" int4 NOT NULL,
	"business_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."employees_businesses" OWNER TO "postgres";

-- ----------------------------
--  Table structure for business_services
-- ----------------------------
DROP TABLE IF EXISTS "public"."business_services";
CREATE TABLE "public"."business_services" (
	"id" int4 NOT NULL DEFAULT nextval('business_services_id_seq'::regclass),
	"title" varchar(254) NOT NULL COLLATE "default",
	"business_id" int4 NOT NULL,
	"master_acc" varchar(254) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."business_services" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bprocesses
-- ----------------------------
DROP TABLE IF EXISTS "public"."bprocesses";
CREATE TABLE "public"."bprocesses" (
	"id" int4 NOT NULL DEFAULT nextval('bprocesses_id_seq'::regclass),
	"title" varchar(254) NOT NULL COLLATE "default",
	"service_id" int4 NOT NULL,
	"business_id" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"version" int8 NOT NULL DEFAULT 1,
	"state_machine_type" varchar(40) NOT NULL DEFAULT 'base'::character varying COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bprocesses" OWNER TO "postgres";

-- ----------------------------
--  Table structure for passwordinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."passwordinfo";
CREATE TABLE "public"."passwordinfo" (
	"hasher" varchar NOT NULL COLLATE "default",
	"password" varchar NOT NULL COLLATE "default",
	"salt" varchar COLLATE "default",
	"loginInfoId" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."passwordinfo" OWNER TO "postgres";

-- ----------------------------
--  Table structure for state_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."state_refs";
CREATE TABLE "public"."state_refs" (
	"id" int4 NOT NULL DEFAULT nextval('state_refs_id_seq'::regclass),
	"reflection_id" int4 NOT NULL,
	"title" varchar(254) NOT NULL COLLATE "default",
	"neutral" varchar(254) NOT NULL COLLATE "default",
	"process_state" bool NOT NULL DEFAULT false,
	"on" bool NOT NULL DEFAULT false,
	"on_rate" int4 NOT NULL DEFAULT 0,
	"ref_front_elem_id" int4,
	"ref_space_elem_id" int4,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"lang" varchar(254) NOT NULL DEFAULT 'en'::character varying COLLATE "default",
	"ref_space_id" int4,
	"middle" varchar(254) DEFAULT ''::character varying COLLATE "default",
	"middleable" bool DEFAULT false,
	"oposite" varchar(254) NOT NULL DEFAULT ''::character varying COLLATE "default",
	"opositable" bool NOT NULL DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."state_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for openidinfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."openidinfo";
CREATE TABLE "public"."openidinfo" (
	"id" varchar NOT NULL COLLATE "default",
	"logininfoid" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."openidinfo" OWNER TO "postgres";

-- ----------------------------
--  Table structure for oauth1info
-- ----------------------------
DROP TABLE IF EXISTS "public"."oauth1info";
CREATE TABLE "public"."oauth1info" (
	"id" int8 NOT NULL DEFAULT nextval('oauth1info_id_seq'::regclass),
	"token" varchar NOT NULL COLLATE "default",
	"secret" varchar NOT NULL COLLATE "default",
	"loginInfoId" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."oauth1info" OWNER TO "postgres";

-- ----------------------------
--  Table structure for userlogininfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."userlogininfo";
CREATE TABLE "public"."userlogininfo" (
	"userID" varchar NOT NULL COLLATE "default",
	"loginInfoId" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."userlogininfo" OWNER TO "postgres";

-- ----------------------------
--  Table structure for comments
-- ----------------------------
DROP TABLE IF EXISTS "public"."comments";
CREATE TABLE "public"."comments" (
	"id" int8 NOT NULL DEFAULT nextval('comments_id_seq'::regclass),
	"author" varchar NOT NULL COLLATE "default",
	"body" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."comments" OWNER TO "postgres";

-- ----------------------------
--  Table structure for action_acts
-- ----------------------------
DROP TABLE IF EXISTS "public"."action_acts";
CREATE TABLE "public"."action_acts" (
	"id" int8 NOT NULL DEFAULT nextval('action_acts_id_seq'::regclass),
	"uid" varchar NOT NULL COLLATE "default",
	"session_id" int4 NOT NULL,
	"reaction" int4 NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."action_acts" OWNER TO "postgres";

-- ----------------------------
--  Table structure for reaction_state_out_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."reaction_state_out_refs";
CREATE TABLE "public"."reaction_state_out_refs" (
	"id" int4 NOT NULL DEFAULT nextval('reaction_state_out_refs_id_seq'::regclass),
	"reaction_id" int4 NOT NULL,
	"state_ref" int4 NOT NULL,
	"on" bool NOT NULL,
	"on_rate" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"input" bool NOT NULL DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."reaction_state_out_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "public"."user";
CREATE TABLE "public"."user" (
	"userID" varchar NOT NULL COLLATE "default",
	"firstName" varchar COLLATE "default",
	"lastName" varchar COLLATE "default",
	"fullName" varchar COLLATE "default",
	"email" varchar COLLATE "default",
	"avatarURL" varchar COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."user" OWNER TO "postgres";

-- ----------------------------
--  Table structure for input_loggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."input_loggers";
CREATE TABLE "public"."input_loggers" (
	"id" int4 NOT NULL DEFAULT nextval('input_loggers_id_seq'::regclass),
	"uid" varchar(254) COLLATE "default",
	"action" varchar(254) NOT NULL COLLATE "default",
	"arguments" text[] NOT NULL COLLATE "default",
	"reaction_id" int4 NOT NULL,
	"input" int4 NOT NULL DEFAULT nextval('input_id_seq'::regclass),
	"date" timestamp(6) WITH TIME ZONE NOT NULL,
	"session_id" int4 NOT NULL,
	"input_id" int4 DEFAULT nextval('input_id_seq'::regclass)
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."input_loggers" OWNER TO "postgres";

-- ----------------------------
--  Table structure for strategy_base_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."strategy_base_refs";
CREATE TABLE "public"."strategy_base_refs" (
	"id" int8 NOT NULL DEFAULT nextval('strategy_base_refs_id_seq'::regclass),
	"strategy_id" int8 NOT NULL,
	"key" varchar NOT NULL COLLATE "default",
	"base_type" varchar NOT NULL COLLATE "default",
	"value_type" varchar NOT NULL COLLATE "default",
	"value_content" varchar NOT NULL COLLATE "default",
	"validation_scheme" varchar COLLATE "default",
	"validation_pattern" varchar COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."strategy_base_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_initial_states
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_initial_states";
CREATE TABLE "public"."session_initial_states" (
	"id" int4 NOT NULL DEFAULT nextval('session_initial_states_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"session_id" int4 NOT NULL,
	"title" varchar NOT NULL COLLATE "default",
	"neutral" varchar NOT NULL COLLATE "default",
	"is_process_state" bool NOT NULL DEFAULT false,
	"on" bool NOT NULL DEFAULT false,
	"on_rate" int4 NOT NULL DEFAULT 0,
	"ses_front_elem_id" int4,
	"ses_space_elem_id" int4,
	"ses_space_id" int4,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"lang" varchar NOT NULL DEFAULT 'en'::character varying COLLATE "default",
	"middle" varchar NOT NULL DEFAULT ''::character varying COLLATE "default",
	"middleable" bool NOT NULL DEFAULT false,
	"oposite" varchar NOT NULL DEFAULT ''::character varying COLLATE "default",
	"opositable" bool NOT NULL DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_initial_states" OWNER TO "postgres";

-- ----------------------------
--  Table structure for switcher_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."switcher_refs";
CREATE TABLE "public"."switcher_refs" (
	"id" int4 NOT NULL DEFAULT nextval('switcher_refs_id_seq'::regclass),
	"reflection_id" int4 NOT NULL,
	"switch_type" varchar(254) NOT NULL COLLATE "default",
	"priority" int4 NOT NULL DEFAULT 2,
	"state_ref_id" int4 NOT NULL,
	"fn" varchar(254) NOT NULL COLLATE "default",
	"target" varchar(254) NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"override_group" int4 NOT NULL DEFAULT 0
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."switcher_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for account_loggers
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_loggers";
CREATE TABLE "public"."account_loggers" (
	"id" int4 NOT NULL DEFAULT nextval('account_loggers_id_seq'::regclass),
	"ip" varchar(254) NOT NULL COLLATE "default",
	"user_agent" varchar(254) NOT NULL COLLATE "default",
	"email" varchar(254) COLLATE "default",
	"date" timestamp(6) WITH TIME ZONE NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."account_loggers" OWNER TO "postgres";

-- ----------------------------
--  Table structure for strategy_bases
-- ----------------------------
DROP TABLE IF EXISTS "public"."strategy_bases";
CREATE TABLE "public"."strategy_bases" (
	"id" int8 NOT NULL DEFAULT nextval('strategy_bases_id_seq'::regclass),
	"strategy_id" int8 NOT NULL,
	"key" varchar NOT NULL COLLATE "default",
	"base_type" varchar NOT NULL COLLATE "default",
	"value_type" varchar NOT NULL COLLATE "default",
	"value_content" varchar NOT NULL COLLATE "default",
	"validation_scheme" varchar COLLATE "default",
	"validation_pattern" varchar COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."strategy_bases" OWNER TO "postgres";

-- ----------------------------
--  Table structure for reflect_element_mappings
-- ----------------------------
DROP TABLE IF EXISTS "public"."reflect_element_mappings";
CREATE TABLE "public"."reflect_element_mappings" (
	"id" int4 NOT NULL DEFAULT nextval('reflect_element_mappings_id_seq'::regclass),
	"reflection_id" int4 NOT NULL,
	"topology_element_id" int4 NOT NULL,
	"ref_topo_element" int4,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."reflect_element_mappings" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launch_counters
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_counters";
CREATE TABLE "public"."launch_counters" (
	"id" int8 NOT NULL DEFAULT nextval('launch_counters_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"count" int8 NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launch_counters" OWNER TO "postgres";

-- ----------------------------
--  Table structure for reaction_state_outs
-- ----------------------------
DROP TABLE IF EXISTS "public"."reaction_state_outs";
CREATE TABLE "public"."reaction_state_outs" (
	"id" int4 NOT NULL DEFAULT nextval('reaction_state_outs_id_seq'::regclass),
	"reaction_id" int4 NOT NULL,
	"state_id" int4 NOT NULL,
	"on" bool NOT NULL,
	"on_rate" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"input" bool NOT NULL DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."reaction_state_outs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for action_statuses
-- ----------------------------
DROP TABLE IF EXISTS "public"."action_statuses";
CREATE TABLE "public"."action_statuses" (
	"id" int8 NOT NULL DEFAULT nextval('middleware_statuses_id_seq'::regclass),
	"content" varchar NOT NULL COLLATE "default",
	"act_id" int8 NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."action_statuses" OWNER TO "postgres";

-- ----------------------------
--  Table structure for space_elements
-- ----------------------------
DROP TABLE IF EXISTS "public"."space_elements";
CREATE TABLE "public"."space_elements" (
	"id" int4 NOT NULL DEFAULT nextval('space_elements_id_seq'::regclass),
	"title" varchar(254) NOT NULL COLLATE "default",
	"desc" varchar(254) NOT NULL COLLATE "default",
	"business_id" int4 NOT NULL,
	"bprocess_id" int4 NOT NULL,
	"b_type" varchar(254) NOT NULL COLLATE "default",
	"type_title" varchar(254) NOT NULL COLLATE "default",
	"own_space_id" int4,
	"owned_space_id" int4 NOT NULL,
	"space_role" varchar(254) COLLATE "default",
	"order" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."space_elements" OWNER TO "postgres";

-- ----------------------------
--  Table structure for accounts
-- ----------------------------
DROP TABLE IF EXISTS "public"."accounts";
CREATE TABLE "public"."accounts" (
	"providerId" varchar(254) NOT NULL COLLATE "default",
	"userId" varchar(254) NOT NULL COLLATE "default",
	"firstName" varchar(254) COLLATE "default",
	"lastName" varchar(254) COLLATE "default",
	"fullName" varchar(254) COLLATE "default",
	"email" varchar(254) COLLATE "default",
	"avatarUrl" varchar(254) COLLATE "default",
	"authMethod" varchar(254) NOT NULL COLLATE "default",
	"token" varchar(254) COLLATE "default",
	"secret" varchar(254) COLLATE "default",
	"accessToken" varchar(254) COLLATE "default",
	"tokenType" varchar(254) COLLATE "default",
	"expiresIn" int4,
	"refreshToken" varchar(254) COLLATE "default",
	"hasher" varchar(254) NOT NULL COLLATE "default",
	"password" varchar(254) NOT NULL COLLATE "default",
	"salt" varchar(254) COLLATE "default",
	"lang" varchar(254) NOT NULL COLLATE "default",
	"country" varchar(254) COLLATE "default",
	"phone" varchar(254) COLLATE "default",
	"nickname" varchar(254) COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."accounts" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launch_middlewares
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_middlewares";
CREATE TABLE "public"."launch_middlewares" (
	"id" int8 NOT NULL DEFAULT nextval('launch_middlewares_id_seq'::regclass),
	"session_id" int4 NOT NULL,
	"ident" varchar NOT NULL COLLATE "default",
	"iface_ident" varchar NOT NULL COLLATE "default",
	"reaction_id" int4 NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL,
	"title" varchar(30) NOT NULL DEFAULT ''::character varying COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launch_middlewares" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bpstaterefs
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpstaterefs";
CREATE TABLE "public"."bpstaterefs" (
	"id" int4 NOT NULL DEFAULT nextval('bpstaterefs_id_seq'::regclass),
	"bprocess_id" int4 NOT NULL,
	"switch_type" varchar(254) NOT NULL COLLATE "default",
	"priority" int4 NOT NULL DEFAULT 2,
	"state_id" int4 NOT NULL,
	"session_state" int4,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bpstaterefs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_reactions
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_reactions";
CREATE TABLE "public"."session_reactions" (
	"id" int4 NOT NULL DEFAULT nextval('session_reactions_id_seq'::regclass),
	"bprocess_id" int4 NOT NULL,
	"session_id" int4 NOT NULL,
	"autostart" bool NOT NULL,
	"element_id" int4 NOT NULL,
	"state_ref_id" int4,
	"title" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_reactions" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_reaction_state_outs
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_reaction_state_outs";
CREATE TABLE "public"."session_reaction_state_outs" (
	"id" int4 NOT NULL DEFAULT nextval('session_reaction_state_outs_id_seq'::regclass),
	"session_state_id" int4 NOT NULL,
	"reaction_id" int4 NOT NULL,
	"on" bool NOT NULL,
	"on_rate" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"input" bool NOT NULL DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_reaction_state_outs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for account_group
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_group";
CREATE TABLE "public"."account_group" (
	"id" int4 NOT NULL DEFAULT nextval('account_group_id_seq'::regclass),
	"account_id" varchar(254) COLLATE "default",
	"group_id" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"employee_id" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."account_group" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launch_warps
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_warps";
CREATE TABLE "public"."launch_warps" (
	"id" int4 NOT NULL DEFAULT nextval('launch_warps_id_seq'::regclass),
	"launch_id" int4 NOT NULL,
	"launch_element_id" int4,
	"board_id" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launch_warps" OWNER TO "postgres";

-- ----------------------------
--  Table structure for strategies
-- ----------------------------
DROP TABLE IF EXISTS "public"."strategies";
CREATE TABLE "public"."strategies" (
	"id" int8 NOT NULL DEFAULT nextval('strategies_id_seq'::regclass),
	"ident" varchar NOT NULL COLLATE "default",
	"middleware_id" int8 NOT NULL,
	"is_null_strategy" bool NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."strategies" OWNER TO "postgres";

-- ----------------------------
--  Table structure for plans
-- ----------------------------
DROP TABLE IF EXISTS "public"."plans";
CREATE TABLE "public"."plans" (
	"id" int4 NOT NULL DEFAULT nextval('plans_id_seq'::regclass),
	"title" varchar(254) NOT NULL COLLATE "default",
	"price" numeric(21,2) NOT NULL,
	"description" varchar COLLATE "default",
	"slot_included" int4 NOT NULL DEFAULT 5,
	"order" int4 NOT NULL DEFAULT 1,
	"hidden" bool NOT NULL DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."plans" OWNER TO "postgres";

-- ----------------------------
--  Table structure for elem_topologs
-- ----------------------------
DROP TABLE IF EXISTS "public"."elem_topologs";
CREATE TABLE "public"."elem_topologs" (
	"id" int4 NOT NULL DEFAULT nextval('elem_topologs_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"front_elem_id" int4,
	"space_elem_id" int4,
	"hash" varchar(254) NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"space_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."elem_topologs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_state_logs
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_state_logs";
CREATE TABLE "public"."session_state_logs" (
	"id" int4 NOT NULL DEFAULT nextval('session_state_logs_id_seq'::regclass),
	"session_id" int4 NOT NULL,
	"on" bool NOT NULL DEFAULT false,
	"on_rate" int4 NOT NULL DEFAULT 0,
	"reason" varchar(254) NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE NOT NULL,
	"state_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_state_logs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for strategy_outputs
-- ----------------------------
DROP TABLE IF EXISTS "public"."strategy_outputs";
CREATE TABLE "public"."strategy_outputs" (
	"id" int8 NOT NULL DEFAULT nextval('strategy_outputs_id_seq'::regclass),
	"strategy_id" int8 NOT NULL,
	"op" varchar NOT NULL COLLATE "default",
	"title" varchar NOT NULL COLLATE "default",
	"desc" varchar COLLATE "default",
	"ident" varchar NOT NULL COLLATE "default",
	"target_type" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."strategy_outputs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for reaction_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."reaction_refs";
CREATE TABLE "public"."reaction_refs" (
	"id" int4 NOT NULL DEFAULT nextval('reaction_refs_id_seq'::regclass),
	"reflection_id" int4 NOT NULL,
	"autostart" bool NOT NULL,
	"element_id" int4 NOT NULL,
	"state_ref_id" int4,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE NOT NULL,
	"title" varchar(254) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."reaction_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for process_histories
-- ----------------------------
DROP TABLE IF EXISTS "public"."process_histories";
CREATE TABLE "public"."process_histories" (
	"id" int4 NOT NULL DEFAULT nextval('process_histories_id_seq'::regclass),
	"master_acc" varchar NOT NULL COLLATE "default",
	"action" varchar NOT NULL COLLATE "default",
	"process_id" int4,
	"what" varchar COLLATE "default",
	"what_id" int4,
	"date" timestamp(6) WITH TIME ZONE NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."process_histories" OWNER TO "postgres";

-- ----------------------------
--  Table structure for space_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."space_refs";
CREATE TABLE "public"."space_refs" (
	"id" int4 NOT NULL DEFAULT nextval('space_refs_id_seq'::regclass),
	"reflection_id" int4 NOT NULL,
	"index" int4 NOT NULL,
	"container" bool NOT NULL,
	"subbrick" bool NOT NULL,
	"brick_front" int4,
	"brick_nested" int4,
	"nestingLevel" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."space_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for middlewares
-- ----------------------------
DROP TABLE IF EXISTS "public"."middlewares";
CREATE TABLE "public"."middlewares" (
	"id" int8 NOT NULL DEFAULT nextval('middlewares_id_seq'::regclass),
	"ident" varchar NOT NULL COLLATE "default",
	"iface_ident" varchar NOT NULL COLLATE "default",
	"reaction_id" int4 NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL,
	"title" varchar(30) NOT NULL DEFAULT ''::character varying COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."middlewares" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bpsessions
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpsessions";
CREATE TABLE "public"."bpsessions" (
	"id" int4 NOT NULL DEFAULT nextval('bpsessions_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"active_listed" bool NOT NULL DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bpsessions" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launch_shares
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_shares";
CREATE TABLE "public"."launch_shares" (
	"id" int8 NOT NULL DEFAULT nextval('launch_shares_id_seq'::regclass),
	"title" int4 NOT NULL,
	"price" int4 NOT NULL,
	"description" varchar NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launch_shares" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bpstations
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpstations";
CREATE TABLE "public"."bpstations" (
	"id" int4 NOT NULL DEFAULT nextval('bpstations_id_seq'::regclass),
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
	"note" varchar(254) COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"canceled" bool NOT NULL DEFAULT false,
	"session_id" int4 NOT NULL,
	"front" bool
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bpstations" OWNER TO "postgres";

-- ----------------------------
--  Table structure for proc_element_reflections
-- ----------------------------
DROP TABLE IF EXISTS "public"."proc_element_reflections";
CREATE TABLE "public"."proc_element_reflections" (
	"id" int4 NOT NULL DEFAULT nextval('proc_element_reflections_id_seq'::regclass),
	"reflection_id" int4 NOT NULL,
	"title" varchar(254) NOT NULL COLLATE "default",
	"desc" varchar(254) NOT NULL COLLATE "default",
	"b_type" varchar(254) NOT NULL COLLATE "default",
	"type_title" varchar(254) NOT NULL COLLATE "default",
	"ref_space_id" int4,
	"order" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."proc_element_reflections" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_element_resources
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_element_resources";
CREATE TABLE "public"."session_element_resources" (
	"id" int4 NOT NULL DEFAULT nextval('session_element_resources_id_seq'::regclass),
	"session_element_id" int4 NOT NULL,
	"process_id" int4 NOT NULL,
	"session_id" int4 NOT NULL,
	"resource_id" int4 NOT NULL,
	"entities" varchar NOT NULL DEFAULT ''::character varying COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_element_resources" OWNER TO "postgres";

-- ----------------------------
--  Table structure for observers
-- ----------------------------
DROP TABLE IF EXISTS "public"."observers";
CREATE TABLE "public"."observers" (
	"id" int4 NOT NULL DEFAULT nextval('observers_id_seq'::regclass),
	"station_id" int4 NOT NULL,
	"bprocess_id" int4 NOT NULL,
	"hash_code" varchar(254) COLLATE "default",
	"fullName" varchar(254) NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."observers" OWNER TO "postgres";

-- ----------------------------
--  Table structure for openidattributes
-- ----------------------------
DROP TABLE IF EXISTS "public"."openidattributes";
CREATE TABLE "public"."openidattributes" (
	"id" varchar NOT NULL COLLATE "default",
	"key" varchar NOT NULL COLLATE "default",
	"value" varchar NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."openidattributes" OWNER TO "postgres";

-- ----------------------------
--  Table structure for account_plan_history
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_plan_history";
CREATE TABLE "public"."account_plan_history" (
	"id" int4 NOT NULL DEFAULT nextval('account_plan_history_id_seq'::regclass),
	"account_plan_id" int4 NOT NULL,
	"limit_diff" int4 NOT NULL,
	"plan_diff" int4 NOT NULL,
	"bill_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."account_plan_history" OWNER TO "postgres";

-- ----------------------------
--  Table structure for process_permissions
-- ----------------------------
DROP TABLE IF EXISTS "public"."process_permissions";
CREATE TABLE "public"."process_permissions" (
	"id" int4 NOT NULL DEFAULT nextval('process_permissions_id_seq'::regclass),
	"uid" varchar(254) COLLATE "default",
	"group_id" int4,
	"bprocess" int4 NOT NULL,
	"front_elem_id" int4,
	"space_elem_id" int4,
	"reaction_id" int4,
	"role" varchar(254) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."process_permissions" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bills
-- ----------------------------
DROP TABLE IF EXISTS "public"."bills";
CREATE TABLE "public"."bills" (
	"id" int4 NOT NULL DEFAULT nextval('bills_id_seq'::regclass),
	"title" varchar(254) NOT NULL COLLATE "default",
	"master_acc" varchar(254) NOT NULL COLLATE "default",
	"assigned" timestamp(6) WITH TIME ZONE NOT NULL,
	"approved" bool NOT NULL,
	"expired" timestamp(6) WITH TIME ZONE NOT NULL,
	"sum" numeric(21,2) NOT NULL,
	"workbench_id" int8 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bills" OWNER TO "postgres";

-- ----------------------------
--  Table structure for strategy_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."strategy_refs";
CREATE TABLE "public"."strategy_refs" (
	"id" int8 NOT NULL DEFAULT nextval('strategy_refs_id_seq'::regclass),
	"ident" varchar NOT NULL COLLATE "default",
	"reflection_id" int4 NOT NULL,
	"middleware_id" int8 NOT NULL,
	"is_null_strategy" bool NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."strategy_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for groups
-- ----------------------------
DROP TABLE IF EXISTS "public"."groups";
CREATE TABLE "public"."groups" (
	"id" int4 NOT NULL DEFAULT nextval('groups_id_seq'::regclass),
	"title" varchar(254) NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE NOT NULL,
	"business_id" int4 NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."groups" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_proc_elements
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_proc_elements";
CREATE TABLE "public"."session_proc_elements" (
	"id" int4 NOT NULL DEFAULT nextval('session_proc_elements_id_seq'::regclass),
	"title" varchar NOT NULL COLLATE "default",
	"desc" varchar NOT NULL COLLATE "default",
	"business_id" int4 NOT NULL,
	"bprocess_id" int4 NOT NULL,
	"session_id" int4 NOT NULL,
	"b_type" varchar NOT NULL COLLATE "default",
	"type_title" varchar NOT NULL COLLATE "default",
	"space_id" int4,
	"order" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_proc_elements" OWNER TO "postgres";

-- ----------------------------
--  Table structure for middleware_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."middleware_refs";
CREATE TABLE "public"."middleware_refs" (
	"id" int8 NOT NULL DEFAULT nextval('middleware_refs_id_seq'::regclass),
	"title" varchar NOT NULL COLLATE "default",
	"ident" varchar NOT NULL COLLATE "default",
	"iface_ident" varchar NOT NULL COLLATE "default",
	"reflection_id" int4 NOT NULL,
	"reaction_id" int4 NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."middleware_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for tokens
-- ----------------------------
DROP TABLE IF EXISTS "public"."tokens";
CREATE TABLE "public"."tokens" (
	"uuid" varchar(254) NOT NULL COLLATE "default",
	"email" varchar(254) NOT NULL COLLATE "default",
	"creationTime" timestamp(6) NOT NULL,
	"expirationTime" timestamp(6) NOT NULL,
	"isSignUp" bool NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."tokens" OWNER TO "postgres";

-- ----------------------------
--  Table structure for employees
-- ----------------------------
DROP TABLE IF EXISTS "public"."employees";
CREATE TABLE "public"."employees" (
	"id" int8 NOT NULL DEFAULT nextval('employees_id_seq'::regclass),
	"uid" varchar(254) NOT NULL COLLATE "default",
	"master_acc" varchar(254) NOT NULL COLLATE "default",
	"position" varchar(254) COLLATE "default",
	"manager" bool NOT NULL,
	"workbench_id" int8 NOT NULL DEFAULT 0
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."employees" OWNER TO "postgres";

-- ----------------------------
--  Table structure for proc_elements
-- ----------------------------
DROP TABLE IF EXISTS "public"."proc_elements";
CREATE TABLE "public"."proc_elements" (
	"id" int4 NOT NULL DEFAULT nextval('proc_elements_id_seq'::regclass),
	"title" varchar(254) NOT NULL COLLATE "default",
	"desc" varchar(254) NOT NULL COLLATE "default",
	"business_id" int4 NOT NULL,
	"bprocess_id" int4 NOT NULL,
	"b_type" varchar(254) NOT NULL COLLATE "default",
	"type_title" varchar(254) NOT NULL COLLATE "default",
	"space_id" int4,
	"order" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."proc_elements" OWNER TO "postgres";

-- ----------------------------
--  Table structure for strategy_inputs
-- ----------------------------
DROP TABLE IF EXISTS "public"."strategy_inputs";
CREATE TABLE "public"."strategy_inputs" (
	"id" int8 NOT NULL DEFAULT nextval('strategy_inputs_id_seq'::regclass),
	"strategy_id" int8 NOT NULL,
	"op" varchar NOT NULL COLLATE "default",
	"title" varchar NOT NULL COLLATE "default",
	"desc" varchar COLLATE "default",
	"ident" varchar NOT NULL COLLATE "default",
	"target_type" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."strategy_inputs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launch_strategy_bases
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_strategy_bases";
CREATE TABLE "public"."launch_strategy_bases" (
	"id" int8 NOT NULL DEFAULT nextval('launch_strategy_bases_id_seq'::regclass),
	"strategy_id" int8 NOT NULL,
	"key" varchar NOT NULL COLLATE "default",
	"base_type" varchar NOT NULL COLLATE "default",
	"value_type" varchar NOT NULL COLLATE "default",
	"value_content" varchar NOT NULL COLLATE "default",
	"validation_scheme" varchar COLLATE "default",
	"validation_pattern" varchar COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launch_strategy_bases" OWNER TO "postgres";

-- ----------------------------
--  Table structure for client_observers
-- ----------------------------
DROP TABLE IF EXISTS "public"."client_observers";
CREATE TABLE "public"."client_observers" (
	"id" int4 NOT NULL DEFAULT nextval('client_observers_id_seq'::regclass),
	"uid" varchar(254) NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."client_observers" OWNER TO "postgres";

-- ----------------------------
--  Table structure for account_infos
-- ----------------------------
DROP TABLE IF EXISTS "public"."account_infos";
CREATE TABLE "public"."account_infos" (
	"id" int4 NOT NULL DEFAULT nextval('account_infos_id_seq'::regclass),
	"uid" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) NOT NULL,
	"early_access" bool NOT NULL DEFAULT false,
	"pro_features" bool NOT NULL DEFAULT false,
	"workbench_id" int8,
	"lang" varchar(255) COLLATE "default",
	"nickname" varchar(255) COLLATE "default",
	"country" varchar(255) COLLATE "default",
	"phone" varchar(255) COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."account_infos" OWNER TO "postgres";

-- ----------------------------
--  Table structure for bpspaces
-- ----------------------------
DROP TABLE IF EXISTS "public"."bpspaces";
CREATE TABLE "public"."bpspaces" (
	"id" int4 NOT NULL DEFAULT nextval('bpspaces_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"index" int4 NOT NULL,
	"container" bool NOT NULL DEFAULT false,
	"subbrick" bool NOT NULL DEFAULT false,
	"brick_front_id" int4,
	"brick_nested_id" int4,
	"nesting_level" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."bpspaces" OWNER TO "postgres";

-- ----------------------------
--  Table structure for logininfo
-- ----------------------------
DROP TABLE IF EXISTS "public"."logininfo";
CREATE TABLE "public"."logininfo" (
	"id" int8 NOT NULL DEFAULT nextval('logininfo_id_seq'::regclass),
	"providerID" varchar NOT NULL COLLATE "default",
	"providerKey" varchar NOT NULL COLLATE "default"
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."logininfo" OWNER TO "postgres";

-- ----------------------------
--  Table structure for strategy_output_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."strategy_output_refs";
CREATE TABLE "public"."strategy_output_refs" (
	"id" int8 NOT NULL DEFAULT nextval('strategy_output_refs_id_seq'::regclass),
	"strategy_id" int8 NOT NULL,
	"op" varchar NOT NULL COLLATE "default",
	"title" varchar NOT NULL COLLATE "default",
	"desc" varchar COLLATE "default",
	"ident" varchar NOT NULL COLLATE "default",
	"target_type" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."strategy_output_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for strategy_input_refs
-- ----------------------------
DROP TABLE IF EXISTS "public"."strategy_input_refs";
CREATE TABLE "public"."strategy_input_refs" (
	"id" int8 NOT NULL DEFAULT nextval('strategy_input_refs_id_seq'::regclass),
	"strategy_id" int8 NOT NULL,
	"op" varchar NOT NULL COLLATE "default",
	"title" varchar NOT NULL COLLATE "default",
	"desc" varchar COLLATE "default",
	"ident" varchar NOT NULL COLLATE "default",
	"target_type" varchar NOT NULL COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."strategy_input_refs" OWNER TO "postgres";

-- ----------------------------
--  Table structure for businesses
-- ----------------------------
DROP TABLE IF EXISTS "public"."businesses";
CREATE TABLE "public"."businesses" (
	"id" int4 NOT NULL DEFAULT nextval('businesses_id_seq'::regclass),
	"title" varchar(254) NOT NULL COLLATE "default",
	"phone" varchar(254) COLLATE "default",
	"website" varchar(254) COLLATE "default",
	"country" varchar(254) NOT NULL COLLATE "default",
	"city" varchar(254) NOT NULL COLLATE "default",
	"address" varchar(254) COLLATE "default",
	"walkthrough" bool NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"nickname" varchar(254) COLLATE "default",
	"org" bool DEFAULT false
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."businesses" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_space_elements
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_space_elements";
CREATE TABLE "public"."session_space_elements" (
	"id" int4 NOT NULL DEFAULT nextval('session_space_elements_id_seq'::regclass),
	"title" varchar NOT NULL COLLATE "default",
	"desc" varchar NOT NULL COLLATE "default",
	"business_id" int4 NOT NULL,
	"bprocess_id" int4 NOT NULL,
	"session_id" int4 NOT NULL,
	"b_type" varchar NOT NULL COLLATE "default",
	"type_title" varchar NOT NULL COLLATE "default",
	"own_space_id" int4,
	"owned_space_id" int4 NOT NULL,
	"space_role" varchar COLLATE "default",
	"order" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_space_elements" OWNER TO "postgres";

-- ----------------------------
--  Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS "public"."files";
CREATE TABLE "public"."files" (
	"id" int8 NOT NULL DEFAULT nextval('files_id_seq'::regclass),
	"workbench" int4 NOT NULL,
	"file_name" varchar NOT NULL COLLATE "default",
	"azureId" varchar NOT NULL COLLATE "default",
	"description" varchar NOT NULL COLLATE "default",
	"external" bool NOT NULL,
	"external_url" varchar COLLATE "default",
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."files" OWNER TO "postgres";

-- ----------------------------
--  Table structure for billing_infos
-- ----------------------------
DROP TABLE IF EXISTS "public"."billing_infos";
CREATE TABLE "public"."billing_infos" (
	"id" int4 NOT NULL DEFAULT nextval('billing_infos_id_seq'::regclass),
	"business_id" int4 NOT NULL,
	"firstname" varchar(254) NOT NULL COLLATE "default",
	"lastname" varchar(254) NOT NULL COLLATE "default",
	"address" varchar(254) NOT NULL COLLATE "default",
	"zipcode" varchar(254) NOT NULL COLLATE "default",
	"created_at" timestamp(6) WITH TIME ZONE NOT NULL,
	"updated_at" timestamp(6) WITH TIME ZONE NOT NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."billing_infos" OWNER TO "postgres";

-- ----------------------------
--  Table structure for sessionstates
-- ----------------------------
DROP TABLE IF EXISTS "public"."sessionstates";
CREATE TABLE "public"."sessionstates" (
	"id" int4 NOT NULL DEFAULT nextval('sessionstates_id_seq'::regclass),
	"process_id" int4 NOT NULL,
	"session_id" int4 NOT NULL,
	"title" varchar(254) NOT NULL COLLATE "default",
	"neutral" varchar(254) NOT NULL COLLATE "default",
	"is_process_state" bool NOT NULL DEFAULT false,
	"front_elem_id" int4,
	"space_elem_id" int4,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE,
	"lang" varchar(254) NOT NULL DEFAULT 'en'::character varying COLLATE "default",
	"space_id" int4,
	"on" bool NOT NULL DEFAULT false,
	"on_rate" int4 NOT NULL DEFAULT 0,
	"origin_state_id" int4,
	"middle" varchar(253) NOT NULL DEFAULT ''::character varying COLLATE "default",
	"middleable" bool NOT NULL DEFAULT false,
	"oposite" varchar(254) NOT NULL DEFAULT ''::character varying COLLATE "default",
	"opositable" bool NOT NULL DEFAULT false,
	"session_front_elem_id" int4,
	"session_space_id" int4,
	"session_space_elem_id" int4
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."sessionstates" OWNER TO "postgres";

-- ----------------------------
--  Table structure for space_element_reflections
-- ----------------------------
DROP TABLE IF EXISTS "public"."space_element_reflections";
CREATE TABLE "public"."space_element_reflections" (
	"id" int4 NOT NULL DEFAULT nextval('space_element_reflections_id_seq'::regclass),
	"reflection_id" int4 NOT NULL,
	"title" varchar(254) NOT NULL COLLATE "default",
	"desc" varchar(254) NOT NULL COLLATE "default",
	"b_type" varchar(254) NOT NULL COLLATE "default",
	"type_title" varchar(254) NOT NULL COLLATE "default",
	"ref_space_id" int4,
	"ref_space_owned_id" int4 NOT NULL,
	"space_role" varchar(254) COLLATE "default",
	"order" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."space_element_reflections" OWNER TO "postgres";

-- ----------------------------
--  Table structure for session_switchers
-- ----------------------------
DROP TABLE IF EXISTS "public"."session_switchers";
CREATE TABLE "public"."session_switchers" (
	"id" int4 NOT NULL DEFAULT nextval('session_switchers_id_seq'::regclass),
	"bprocess_id" int4 NOT NULL,
	"session_id" int4 NOT NULL,
	"switch_type" varchar NOT NULL COLLATE "default",
	"priority" int4 NOT NULL DEFAULT 2,
	"session_state_ref_id" int4 NOT NULL,
	"session_state_id" int4,
	"fn" varchar NOT NULL COLLATE "default",
	"target" varchar NOT NULL COLLATE "default",
	"override_group" int4 NOT NULL DEFAULT 0,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."session_switchers" OWNER TO "postgres";

-- ----------------------------
--  Table structure for resources
-- ----------------------------
DROP TABLE IF EXISTS "public"."resources";
CREATE TABLE "public"."resources" (
	"id" int4 NOT NULL DEFAULT nextval('resources_id_seq'::regclass),
	"title" varchar NOT NULL COLLATE "default",
	"business_id" int4 NOT NULL,
	"created_at" timestamp(6) WITH TIME ZONE,
	"updated_at" timestamp(6) WITH TIME ZONE
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."resources" OWNER TO "postgres";

-- ----------------------------
--  Table structure for launch_strategies
-- ----------------------------
DROP TABLE IF EXISTS "public"."launch_strategies";
CREATE TABLE "public"."launch_strategies" (
	"id" int8 NOT NULL DEFAULT nextval('launch_strategies_id_seq'::regclass),
	"session_id" int4 NOT NULL,
	"ident" varchar NOT NULL COLLATE "default",
	"middleware_id" int8 NOT NULL,
	"is_null_strategy" bool NOT NULL,
	"created_at" timestamp(6) NULL,
	"updated_at" timestamp(6) NULL
)
WITH (OIDS=FALSE);
ALTER TABLE "public"."launch_strategies" OWNER TO "postgres";


-- ----------------------------
--  Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."account_group_id_seq" OWNED BY "account_group"."id";
ALTER SEQUENCE "public"."account_infos_id_seq" OWNED BY "account_infos"."id";
ALTER SEQUENCE "public"."account_loggers_id_seq" OWNED BY "account_loggers"."id";
ALTER SEQUENCE "public"."account_plans_id_seq" OWNED BY "account_plans"."id";
ALTER SEQUENCE "public"."action_act_results_id_seq" OWNED BY "action_act_results"."id";
ALTER SEQUENCE "public"."action_acts_id_seq" OWNED BY "action_acts"."id";
ALTER SEQUENCE "public"."billing_infos_id_seq" OWNED BY "billing_infos"."id";
ALTER SEQUENCE "public"."bills_id_seq" OWNED BY "bills"."id";
ALTER SEQUENCE "public"."bploggers_id_seq" OWNED BY "bploggers"."id";
ALTER SEQUENCE "public"."bprocesses_id_seq" OWNED BY "bprocesses"."id";
ALTER SEQUENCE "public"."bpsessions_id_seq" OWNED BY "bpsessions"."id";
ALTER SEQUENCE "public"."bpspaces_id_seq" OWNED BY "bpspaces"."id";
ALTER SEQUENCE "public"."bpstaterefs_id_seq" OWNED BY "bpstaterefs"."id";
ALTER SEQUENCE "public"."bpstates_id_seq" OWNED BY "bpstates"."id";
ALTER SEQUENCE "public"."bpstation_loggers_id_seq" OWNED BY "bpstation_loggers"."id";
ALTER SEQUENCE "public"."bpstations_id_seq" OWNED BY "bpstations"."id";
ALTER SEQUENCE "public"."bpswitchers_id_seq" OWNED BY "bpswitchers"."id";
ALTER SEQUENCE "public"."business_services_id_seq" OWNED BY "business_services"."id";
ALTER SEQUENCE "public"."businesses_id_seq" OWNED BY "businesses"."id";
ALTER SEQUENCE "public"."cached_removed_resources_id_seq" OWNED BY "cached_removed_resources"."id";
ALTER SEQUENCE "public"."client_observers_id_seq" OWNED BY "client_observers"."id";
ALTER SEQUENCE "public"."comments_id_seq" OWNED BY "comments"."id";
ALTER SEQUENCE "public"."elem_topologs_id_seq" OWNED BY "elem_topologs"."id";
ALTER SEQUENCE "public"."element_resources_id_seq" OWNED BY "element_resources"."id";
ALTER SEQUENCE "public"."employees_id_seq" OWNED BY "employees"."id";
ALTER SEQUENCE "public"."files_id_seq" OWNED BY "files"."id";
ALTER SEQUENCE "public"."groups_id_seq" OWNED BY "groups"."id";
ALTER SEQUENCE "public"."input_loggers_id_seq" OWNED BY "input_loggers"."id";
ALTER SEQUENCE "public"."launch_counters_id_seq" OWNED BY "launch_counters"."id";
ALTER SEQUENCE "public"."launch_files_id_seq" OWNED BY "launch_files"."id";
ALTER SEQUENCE "public"."launch_middlewares_id_seq" OWNED BY "launch_middlewares"."id";
ALTER SEQUENCE "public"."launch_shares_id_seq" OWNED BY "launch_shares"."id";
ALTER SEQUENCE "public"."launch_strategies_id_seq" OWNED BY "launch_strategies"."id";
ALTER SEQUENCE "public"."launch_strategy_bases_id_seq" OWNED BY "launch_strategy_bases"."id";
ALTER SEQUENCE "public"."launch_strategy_inputs_id_seq" OWNED BY "launch_strategy_inputs"."id";
ALTER SEQUENCE "public"."launch_strategy_outputs_id_seq" OWNED BY "launch_strategy_outputs"."id";
ALTER SEQUENCE "public"."launch_warps_id_seq" OWNED BY "launch_warps"."id";
ALTER SEQUENCE "public"."launches_comments_id_seq" OWNED BY "launches_comments"."id";
ALTER SEQUENCE "public"."logininfo_id_seq" OWNED BY "logininfo"."id";
ALTER SEQUENCE "public"."middleware_refs_id_seq" OWNED BY "middleware_refs"."id";
ALTER SEQUENCE "public"."middleware_statuses_id_seq" OWNED BY "action_statuses"."id";
ALTER SEQUENCE "public"."middlewares_id_seq" OWNED BY "middlewares"."id";
ALTER SEQUENCE "public"."oauth1info_id_seq" OWNED BY "oauth1info"."id";
ALTER SEQUENCE "public"."oauth2info_id_seq" OWNED BY "oauth2info"."id";
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
ALTER SEQUENCE "public"."reflect_action_mappings_id_seq" OWNED BY "reflect_action_mappings"."id";
ALTER SEQUENCE "public"."reflect_element_mappings_id_seq" OWNED BY "reflect_element_mappings"."id";
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
ALTER SEQUENCE "public"."strategies_id_seq" OWNED BY "strategies"."id";
ALTER SEQUENCE "public"."strategy_base_refs_id_seq" OWNED BY "strategy_base_refs"."id";
ALTER SEQUENCE "public"."strategy_bases_id_seq" OWNED BY "strategy_bases"."id";
ALTER SEQUENCE "public"."strategy_input_refs_id_seq" OWNED BY "strategy_input_refs"."id";
ALTER SEQUENCE "public"."strategy_inputs_id_seq" OWNED BY "strategy_inputs"."id";
ALTER SEQUENCE "public"."strategy_output_refs_id_seq" OWNED BY "strategy_output_refs"."id";
ALTER SEQUENCE "public"."strategy_outputs_id_seq" OWNED BY "strategy_outputs"."id";
ALTER SEQUENCE "public"."strategy_refs_id_seq" OWNED BY "strategy_refs"."id";
ALTER SEQUENCE "public"."switcher_refs_id_seq" OWNED BY "switcher_refs"."id";
-- ----------------------------
--  Primary key structure for table reflect_action_mappings
-- ----------------------------
ALTER TABLE "public"."reflect_action_mappings" ADD CONSTRAINT "reflect_action_mappings_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table reflect_action_mappings
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21252" AFTER INSERT ON "public"."reflect_action_mappings" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21252" ON "public"."reflect_action_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21253" AFTER UPDATE ON "public"."reflect_action_mappings" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21253" ON "public"."reflect_action_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21257" AFTER INSERT ON "public"."reflect_action_mappings" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21257" ON "public"."reflect_action_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21258" AFTER UPDATE ON "public"."reflect_action_mappings" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21258" ON "public"."reflect_action_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21262" AFTER INSERT ON "public"."reflect_action_mappings" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21262" ON "public"."reflect_action_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21263" AFTER UPDATE ON "public"."reflect_action_mappings" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21263" ON "public"."reflect_action_mappings" IS NULL;

-- ----------------------------
--  Primary key structure for table account_plans
-- ----------------------------
ALTER TABLE "public"."account_plans" ADD CONSTRAINT "account_plans_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table account_plans
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20872" AFTER INSERT ON "public"."account_plans" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20872" ON "public"."account_plans" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20873" AFTER UPDATE ON "public"."account_plans" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20873" ON "public"."account_plans" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20877" AFTER INSERT ON "public"."account_plans" FROM "public"."plans" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20877" ON "public"."account_plans" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20878" AFTER UPDATE ON "public"."account_plans" FROM "public"."plans" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20878" ON "public"."account_plans" IS NULL;

-- ----------------------------
--  Primary key structure for table element_resources
-- ----------------------------
ALTER TABLE "public"."element_resources" ADD CONSTRAINT "element_resources_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table element_resources
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20987" AFTER INSERT ON "public"."element_resources" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20987" ON "public"."element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20988" AFTER UPDATE ON "public"."element_resources" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20988" ON "public"."element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20992" AFTER INSERT ON "public"."element_resources" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20992" ON "public"."element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20993" AFTER UPDATE ON "public"."element_resources" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20993" ON "public"."element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21307" AFTER INSERT ON "public"."element_resources" FROM "public"."resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21307" ON "public"."element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21308" AFTER UPDATE ON "public"."element_resources" FROM "public"."resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21308" ON "public"."element_resources" IS NULL;

-- ----------------------------
--  Primary key structure for table session_spaces
-- ----------------------------
ALTER TABLE "public"."session_spaces" ADD CONSTRAINT "session_spaces_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_spaces
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21337" AFTER INSERT ON "public"."session_spaces" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21337" ON "public"."session_spaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21338" AFTER UPDATE ON "public"."session_spaces" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21338" ON "public"."session_spaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21355" AFTER DELETE ON "public"."session_spaces" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21355" ON "public"."session_spaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21356" AFTER UPDATE ON "public"."session_spaces" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21356" ON "public"."session_spaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21362" AFTER INSERT ON "public"."session_spaces" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21362" ON "public"."session_spaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21363" AFTER UPDATE ON "public"."session_spaces" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21363" ON "public"."session_spaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21400" AFTER DELETE ON "public"."session_spaces" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21400" ON "public"."session_spaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21401" AFTER UPDATE ON "public"."session_spaces" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21401" ON "public"."session_spaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21570" AFTER DELETE ON "public"."session_spaces" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21570" ON "public"."session_spaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21571" AFTER UPDATE ON "public"."session_spaces" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21571" ON "public"."session_spaces" IS NULL;

-- ----------------------------
--  Primary key structure for table cached_removed_resources
-- ----------------------------
ALTER TABLE "public"."cached_removed_resources" ADD CONSTRAINT "cached_removed_resources_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table bpstates
-- ----------------------------
ALTER TABLE "public"."bpstates" ADD CONSTRAINT "bpstates_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table bpstates
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20940" AFTER DELETE ON "public"."bpstates" FROM "public"."bpstaterefs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20940" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20941" AFTER UPDATE ON "public"."bpstates" FROM "public"."bpstaterefs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20941" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20947" AFTER INSERT ON "public"."bpstates" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20947" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20948" AFTER UPDATE ON "public"."bpstates" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20948" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20952" AFTER INSERT ON "public"."bpstates" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20952" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20953" AFTER UPDATE ON "public"."bpstates" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20953" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20957" AFTER INSERT ON "public"."bpstates" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20957" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20958" AFTER UPDATE ON "public"."bpstates" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20958" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20970" AFTER DELETE ON "public"."bpstates" FROM "public"."bpswitchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20970" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20971" AFTER UPDATE ON "public"."bpstates" FROM "public"."bpswitchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20971" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21230" AFTER DELETE ON "public"."bpstates" FROM "public"."reaction_state_outs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21230" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21231" AFTER UPDATE ON "public"."bpstates" FROM "public"."reaction_state_outs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21231" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21245" AFTER DELETE ON "public"."bpstates" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21245" ON "public"."bpstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21246" AFTER UPDATE ON "public"."bpstates" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21246" ON "public"."bpstates" IS NULL;

-- ----------------------------
--  Primary key structure for table launch_strategy_inputs
-- ----------------------------
ALTER TABLE "public"."launch_strategy_inputs" ADD CONSTRAINT "launch_strategy_inputs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launch_strategy_inputs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21067" AFTER INSERT ON "public"."launch_strategy_inputs" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21067" ON "public"."launch_strategy_inputs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21068" AFTER UPDATE ON "public"."launch_strategy_inputs" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21068" ON "public"."launch_strategy_inputs" IS NULL;

-- ----------------------------
--  Primary key structure for table reactions
-- ----------------------------
ALTER TABLE "public"."reactions" ADD CONSTRAINT "reactions_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table reactions
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21110" AFTER DELETE ON "public"."reactions" FROM "public"."middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21110" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21111" AFTER UPDATE ON "public"."reactions" FROM "public"."middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21111" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21185" AFTER DELETE ON "public"."reactions" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21185" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21186" AFTER UPDATE ON "public"."reactions" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21186" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21225" AFTER DELETE ON "public"."reactions" FROM "public"."reaction_state_outs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21225" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21226" AFTER UPDATE ON "public"."reactions" FROM "public"."reaction_state_outs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21226" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21237" AFTER INSERT ON "public"."reactions" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21237" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21238" AFTER UPDATE ON "public"."reactions" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21238" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21242" AFTER INSERT ON "public"."reactions" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21242" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21243" AFTER UPDATE ON "public"."reactions" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21243" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21247" AFTER INSERT ON "public"."reactions" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21247" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21248" AFTER UPDATE ON "public"."reactions" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21248" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21250" AFTER DELETE ON "public"."reactions" FROM "public"."reflect_action_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21250" ON "public"."reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21251" AFTER UPDATE ON "public"."reactions" FROM "public"."reflect_action_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21251" ON "public"."reactions" IS NULL;

-- ----------------------------
--  Primary key structure for table bpstation_loggers
-- ----------------------------
ALTER TABLE "public"."bpstation_loggers" ADD CONSTRAINT "bpstation_loggers_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table session_elem_topologs
-- ----------------------------
ALTER TABLE "public"."session_elem_topologs" ADD CONSTRAINT "session_elem_topologs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_elem_topologs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21085" AFTER DELETE ON "public"."session_elem_topologs" FROM "public"."launch_warps" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21085" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21086" AFTER UPDATE ON "public"."session_elem_topologs" FROM "public"."launch_warps" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21086" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21380" AFTER DELETE ON "public"."session_elem_topologs" FROM "public"."session_element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21380" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21381" AFTER UPDATE ON "public"."session_elem_topologs" FROM "public"."session_element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21381" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21415" AFTER DELETE ON "public"."session_elem_topologs" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21415" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21416" AFTER UPDATE ON "public"."session_elem_topologs" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21416" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21567" AFTER INSERT ON "public"."session_elem_topologs" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21567" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21568" AFTER UPDATE ON "public"."session_elem_topologs" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21568" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21572" AFTER INSERT ON "public"."session_elem_topologs" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21572" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21573" AFTER UPDATE ON "public"."session_elem_topologs" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21573" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21577" AFTER INSERT ON "public"."session_elem_topologs" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21577" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21578" AFTER UPDATE ON "public"."session_elem_topologs" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21578" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21582" AFTER INSERT ON "public"."session_elem_topologs" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21582" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21583" AFTER UPDATE ON "public"."session_elem_topologs" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21583" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21587" AFTER INSERT ON "public"."session_elem_topologs" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21587" ON "public"."session_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21588" AFTER UPDATE ON "public"."session_elem_topologs" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21588" ON "public"."session_elem_topologs" IS NULL;

-- ----------------------------
--  Primary key structure for table oauth2info
-- ----------------------------
ALTER TABLE "public"."oauth2info" ADD CONSTRAINT "oauth2info_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table reflected_elem_topologs
-- ----------------------------
ALTER TABLE "public"."reflected_elem_topologs" ADD CONSTRAINT "reflected_elem_topologs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table reflected_elem_topologs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21200" AFTER DELETE ON "public"."reflected_elem_topologs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21200" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21201" AFTER UPDATE ON "public"."reflected_elem_topologs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21201" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21265" AFTER DELETE ON "public"."reflected_elem_topologs" FROM "public"."reflect_element_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_setnull_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21265" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21266" AFTER UPDATE ON "public"."reflected_elem_topologs" FROM "public"."reflect_element_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21266" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21282" AFTER INSERT ON "public"."reflected_elem_topologs" FROM "public"."proc_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21282" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21283" AFTER UPDATE ON "public"."reflected_elem_topologs" FROM "public"."proc_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21283" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21287" AFTER INSERT ON "public"."reflected_elem_topologs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21287" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21288" AFTER UPDATE ON "public"."reflected_elem_topologs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21288" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21292" AFTER INSERT ON "public"."reflected_elem_topologs" FROM "public"."space_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21292" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21293" AFTER UPDATE ON "public"."reflected_elem_topologs" FROM "public"."space_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21293" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21297" AFTER INSERT ON "public"."reflected_elem_topologs" FROM "public"."space_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21297" ON "public"."reflected_elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21298" AFTER UPDATE ON "public"."reflected_elem_topologs" FROM "public"."space_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21298" ON "public"."reflected_elem_topologs" IS NULL;

-- ----------------------------
--  Primary key structure for table action_act_results
-- ----------------------------
ALTER TABLE "public"."action_act_results" ADD CONSTRAINT "action_act_results_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table action_act_results
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20882" AFTER INSERT ON "public"."action_act_results" FROM "public"."action_acts" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20882" ON "public"."action_act_results" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20883" AFTER UPDATE ON "public"."action_act_results" FROM "public"."action_acts" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20883" ON "public"."action_act_results" IS NULL;

-- ----------------------------
--  Primary key structure for table launch_files
-- ----------------------------
ALTER TABLE "public"."launch_files" ADD CONSTRAINT "launch_files_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launch_files
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21047" AFTER INSERT ON "public"."launch_files" FROM "public"."files" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21047" ON "public"."launch_files" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21048" AFTER UPDATE ON "public"."launch_files" FROM "public"."files" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21048" ON "public"."launch_files" IS NULL;

-- ----------------------------
--  Primary key structure for table launches_comments
-- ----------------------------
ALTER TABLE "public"."launches_comments" ADD CONSTRAINT "launches_comments_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launches_comments
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21082" AFTER INSERT ON "public"."launches_comments" FROM "public"."comments" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21082" ON "public"."launches_comments" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21083" AFTER UPDATE ON "public"."launches_comments" FROM "public"."comments" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21083" ON "public"."launches_comments" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21097" AFTER INSERT ON "public"."launches_comments" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21097" ON "public"."launches_comments" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21098" AFTER UPDATE ON "public"."launches_comments" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21098" ON "public"."launches_comments" IS NULL;

-- ----------------------------
--  Primary key structure for table refs
-- ----------------------------
ALTER TABLE "public"."refs" ADD CONSTRAINT "refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Uniques structure for table refs
-- ----------------------------
ALTER TABLE "public"."refs" ADD CONSTRAINT "refs_title_key" UNIQUE ("title") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Indexes structure for table refs
-- ----------------------------
CREATE UNIQUE INDEX  "refs_title_key" ON "public"."refs" USING btree(title COLLATE "default" ASC NULLS LAST);

-- ----------------------------
--  Triggers structure for table refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21135" AFTER DELETE ON "public"."refs" FROM "public"."middleware_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21135" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21136" AFTER UPDATE ON "public"."refs" FROM "public"."middleware_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21136" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21155" AFTER DELETE ON "public"."refs" FROM "public"."proc_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21155" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21156" AFTER UPDATE ON "public"."refs" FROM "public"."proc_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21156" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21205" AFTER DELETE ON "public"."refs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21205" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21206" AFTER UPDATE ON "public"."refs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21206" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21260" AFTER DELETE ON "public"."refs" FROM "public"."reflect_action_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21260" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21261" AFTER UPDATE ON "public"."refs" FROM "public"."reflect_action_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21261" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21270" AFTER DELETE ON "public"."refs" FROM "public"."reflect_element_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21270" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21271" AFTER UPDATE ON "public"."refs" FROM "public"."reflect_element_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21271" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21285" AFTER DELETE ON "public"."refs" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21285" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21286" AFTER UPDATE ON "public"."refs" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21286" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21450" AFTER DELETE ON "public"."refs" FROM "public"."space_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21450" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21451" AFTER UPDATE ON "public"."refs" FROM "public"."space_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21451" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21470" AFTER DELETE ON "public"."refs" FROM "public"."space_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21470" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21471" AFTER UPDATE ON "public"."refs" FROM "public"."space_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21471" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21495" AFTER DELETE ON "public"."refs" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21495" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21496" AFTER UPDATE ON "public"."refs" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21496" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21535" AFTER DELETE ON "public"."refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21535" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21536" AFTER UPDATE ON "public"."refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21536" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21555" AFTER DELETE ON "public"."refs" FROM "public"."switcher_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21555" ON "public"."refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21556" AFTER UPDATE ON "public"."refs" FROM "public"."switcher_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21556" ON "public"."refs" IS NULL;

-- ----------------------------
--  Primary key structure for table bpswitchers
-- ----------------------------
ALTER TABLE "public"."bpswitchers" ADD CONSTRAINT "bpswitchers_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table bpswitchers
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20967" AFTER INSERT ON "public"."bpswitchers" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20967" ON "public"."bpswitchers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20968" AFTER UPDATE ON "public"."bpswitchers" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20968" ON "public"."bpswitchers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20972" AFTER INSERT ON "public"."bpswitchers" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20972" ON "public"."bpswitchers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20973" AFTER UPDATE ON "public"."bpswitchers" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20973" ON "public"."bpswitchers" IS NULL;

-- ----------------------------
--  Primary key structure for table bploggers
-- ----------------------------
ALTER TABLE "public"."bploggers" ADD CONSTRAINT "bploggers_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table bploggers
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21102" AFTER INSERT ON "public"."bploggers" FROM "public"."bpstations" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21102" ON "public"."bploggers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21103" AFTER UPDATE ON "public"."bploggers" FROM "public"."bpstations" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21103" ON "public"."bploggers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21107" AFTER INSERT ON "public"."bploggers" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21107" ON "public"."bploggers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21108" AFTER UPDATE ON "public"."bploggers" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21108" ON "public"."bploggers" IS NULL;

-- ----------------------------
--  Primary key structure for table launch_strategy_outputs
-- ----------------------------
ALTER TABLE "public"."launch_strategy_outputs" ADD CONSTRAINT "launch_strategy_outputs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launch_strategy_outputs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21077" AFTER INSERT ON "public"."launch_strategy_outputs" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21077" ON "public"."launch_strategy_outputs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21078" AFTER UPDATE ON "public"."launch_strategy_outputs" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21078" ON "public"."launch_strategy_outputs" IS NULL;

-- ----------------------------
--  Triggers structure for table employees_businesses
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21022" AFTER INSERT ON "public"."employees_businesses" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21022" ON "public"."employees_businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21023" AFTER UPDATE ON "public"."employees_businesses" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21023" ON "public"."employees_businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21027" AFTER INSERT ON "public"."employees_businesses" FROM "public"."employees" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21027" ON "public"."employees_businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21028" AFTER UPDATE ON "public"."employees_businesses" FROM "public"."employees" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21028" ON "public"."employees_businesses" IS NULL;

-- ----------------------------
--  Primary key structure for table business_services
-- ----------------------------
ALTER TABLE "public"."business_services" ADD CONSTRAINT "business_services_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table business_services
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20920" AFTER DELETE ON "public"."business_services" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20920" ON "public"."business_services" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20921" AFTER UPDATE ON "public"."business_services" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20921" ON "public"."business_services" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20977" AFTER INSERT ON "public"."business_services" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20977" ON "public"."business_services" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20978" AFTER UPDATE ON "public"."business_services" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20978" ON "public"."business_services" IS NULL;

-- ----------------------------
--  Primary key structure for table bprocesses
-- ----------------------------
ALTER TABLE "public"."bprocesses" ADD CONSTRAINT "bprocesses_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table bprocesses
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20917" AFTER INSERT ON "public"."bprocesses" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20917" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20918" AFTER UPDATE ON "public"."bprocesses" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20918" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20922" AFTER INSERT ON "public"."bprocesses" FROM "public"."business_services" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20922" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20923" AFTER UPDATE ON "public"."bprocesses" FROM "public"."business_services" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20923" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20925" AFTER DELETE ON "public"."bprocesses" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20925" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20926" AFTER UPDATE ON "public"."bprocesses" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20926" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20930" AFTER DELETE ON "public"."bprocesses" FROM "public"."bpspaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20930" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20931" AFTER UPDATE ON "public"."bprocesses" FROM "public"."bpspaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20931" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20950" AFTER DELETE ON "public"."bprocesses" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20950" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20951" AFTER UPDATE ON "public"."bprocesses" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20951" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20990" AFTER DELETE ON "public"."bprocesses" FROM "public"."element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20990" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20991" AFTER UPDATE ON "public"."bprocesses" FROM "public"."element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20991" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21000" AFTER DELETE ON "public"."bprocesses" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21000" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21001" AFTER UPDATE ON "public"."bprocesses" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21001" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21040" AFTER DELETE ON "public"."bprocesses" FROM "public"."launch_counters" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21040" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21041" AFTER UPDATE ON "public"."bprocesses" FROM "public"."launch_counters" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21041" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21105" AFTER DELETE ON "public"."bprocesses" FROM "public"."bploggers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21105" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21106" AFTER UPDATE ON "public"."bprocesses" FROM "public"."bploggers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21106" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21145" AFTER DELETE ON "public"."bprocesses" FROM "public"."observers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21145" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21146" AFTER UPDATE ON "public"."bprocesses" FROM "public"."observers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21146" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21160" AFTER DELETE ON "public"."bprocesses" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21160" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21161" AFTER UPDATE ON "public"."bprocesses" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21161" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21170" AFTER DELETE ON "public"."bprocesses" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21170" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21171" AFTER UPDATE ON "public"."bprocesses" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21171" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21235" AFTER DELETE ON "public"."bprocesses" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21235" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21236" AFTER UPDATE ON "public"."bprocesses" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21236" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21310" AFTER DELETE ON "public"."bprocesses" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21310" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21311" AFTER UPDATE ON "public"."bprocesses" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21311" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21330" AFTER DELETE ON "public"."bprocesses" FROM "public"."session_element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21330" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21331" AFTER UPDATE ON "public"."bprocesses" FROM "public"."session_element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21331" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21335" AFTER DELETE ON "public"."bprocesses" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21335" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21336" AFTER UPDATE ON "public"."bprocesses" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21336" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21340" AFTER DELETE ON "public"."bprocesses" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21340" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21341" AFTER UPDATE ON "public"."bprocesses" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21341" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21365" AFTER DELETE ON "public"."bprocesses" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21365" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21366" AFTER UPDATE ON "public"."bprocesses" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21366" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21385" AFTER DELETE ON "public"."bprocesses" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21385" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21386" AFTER UPDATE ON "public"."bprocesses" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21386" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21410" AFTER DELETE ON "public"."bprocesses" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21410" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21411" AFTER UPDATE ON "public"."bprocesses" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21411" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21455" AFTER DELETE ON "public"."bprocesses" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21455" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21456" AFTER UPDATE ON "public"."bprocesses" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21456" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21565" AFTER DELETE ON "public"."bprocesses" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21565" ON "public"."bprocesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21566" AFTER UPDATE ON "public"."bprocesses" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21566" ON "public"."bprocesses" IS NULL;

-- ----------------------------
--  Primary key structure for table state_refs
-- ----------------------------
ALTER TABLE "public"."state_refs" ADD CONSTRAINT "state_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table state_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21210" AFTER DELETE ON "public"."state_refs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21210" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21211" AFTER UPDATE ON "public"."state_refs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21211" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21220" AFTER DELETE ON "public"."state_refs" FROM "public"."reaction_state_out_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21220" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21221" AFTER UPDATE ON "public"."state_refs" FROM "public"."reaction_state_out_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21221" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21477" AFTER INSERT ON "public"."state_refs" FROM "public"."proc_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21477" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21478" AFTER UPDATE ON "public"."state_refs" FROM "public"."proc_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21478" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21482" AFTER INSERT ON "public"."state_refs" FROM "public"."proc_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21482" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21483" AFTER UPDATE ON "public"."state_refs" FROM "public"."proc_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21483" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21487" AFTER INSERT ON "public"."state_refs" FROM "public"."space_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21487" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21488" AFTER UPDATE ON "public"."state_refs" FROM "public"."space_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21488" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21492" AFTER INSERT ON "public"."state_refs" FROM "public"."space_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21492" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21493" AFTER UPDATE ON "public"."state_refs" FROM "public"."space_element_reflections" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21493" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21497" AFTER INSERT ON "public"."state_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21497" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21498" AFTER UPDATE ON "public"."state_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21498" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21560" AFTER DELETE ON "public"."state_refs" FROM "public"."switcher_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21560" ON "public"."state_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21561" AFTER UPDATE ON "public"."state_refs" FROM "public"."switcher_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21561" ON "public"."state_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table openidinfo
-- ----------------------------
ALTER TABLE "public"."openidinfo" ADD CONSTRAINT "openidinfo_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table oauth1info
-- ----------------------------
ALTER TABLE "public"."oauth1info" ADD CONSTRAINT "oauth1info_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table comments
-- ----------------------------
ALTER TABLE "public"."comments" ADD CONSTRAINT "comments_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table comments
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20982" AFTER INSERT ON "public"."comments" FROM "public"."user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20982" ON "public"."comments" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20983" AFTER UPDATE ON "public"."comments" FROM "public"."user" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20983" ON "public"."comments" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21080" AFTER DELETE ON "public"."comments" FROM "public"."launches_comments" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21080" ON "public"."comments" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21081" AFTER UPDATE ON "public"."comments" FROM "public"."launches_comments" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21081" ON "public"."comments" IS NULL;

-- ----------------------------
--  Primary key structure for table action_acts
-- ----------------------------
ALTER TABLE "public"."action_acts" ADD CONSTRAINT "action_acts_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table action_acts
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20880" AFTER DELETE ON "public"."action_acts" FROM "public"."action_act_results" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20880" ON "public"."action_acts" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20881" AFTER UPDATE ON "public"."action_acts" FROM "public"."action_act_results" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20881" ON "public"."action_acts" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20885" AFTER DELETE ON "public"."action_acts" FROM "public"."action_statuses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20885" ON "public"."action_acts" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20886" AFTER UPDATE ON "public"."action_acts" FROM "public"."action_statuses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20886" ON "public"."action_acts" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20892" AFTER INSERT ON "public"."action_acts" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20892" ON "public"."action_acts" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20893" AFTER UPDATE ON "public"."action_acts" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20893" ON "public"."action_acts" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20897" AFTER INSERT ON "public"."action_acts" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20897" ON "public"."action_acts" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20898" AFTER UPDATE ON "public"."action_acts" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20898" ON "public"."action_acts" IS NULL;

-- ----------------------------
--  Primary key structure for table reaction_state_out_refs
-- ----------------------------
ALTER TABLE "public"."reaction_state_out_refs" ADD CONSTRAINT "reaction_state_out_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table reaction_state_out_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21217" AFTER INSERT ON "public"."reaction_state_out_refs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21217" ON "public"."reaction_state_out_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21218" AFTER UPDATE ON "public"."reaction_state_out_refs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21218" ON "public"."reaction_state_out_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21222" AFTER INSERT ON "public"."reaction_state_out_refs" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21222" ON "public"."reaction_state_out_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21223" AFTER UPDATE ON "public"."reaction_state_out_refs" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21223" ON "public"."reaction_state_out_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table user
-- ----------------------------
ALTER TABLE "public"."user" ADD CONSTRAINT "user_pkey" PRIMARY KEY ("userID") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table user
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20980" AFTER DELETE ON "public"."user" FROM "public"."comments" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20980" ON "public"."user" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20981" AFTER UPDATE ON "public"."user" FROM "public"."comments" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20981" ON "public"."user" IS NULL;

-- ----------------------------
--  Primary key structure for table input_loggers
-- ----------------------------
ALTER TABLE "public"."input_loggers" ADD CONSTRAINT "input_loggers_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table input_loggers
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21037" AFTER INSERT ON "public"."input_loggers" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21037" ON "public"."input_loggers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21038" AFTER UPDATE ON "public"."input_loggers" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21038" ON "public"."input_loggers" IS NULL;

-- ----------------------------
--  Primary key structure for table strategy_base_refs
-- ----------------------------
ALTER TABLE "public"."strategy_base_refs" ADD CONSTRAINT "strategy_base_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table strategy_base_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21502" AFTER INSERT ON "public"."strategy_base_refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21502" ON "public"."strategy_base_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21503" AFTER UPDATE ON "public"."strategy_base_refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21503" ON "public"."strategy_base_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table session_initial_states
-- ----------------------------
ALTER TABLE "public"."session_initial_states" ADD CONSTRAINT "session_initial_states_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_initial_states
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21375" AFTER DELETE ON "public"."session_initial_states" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21375" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21376" AFTER UPDATE ON "public"."session_initial_states" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21376" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21387" AFTER INSERT ON "public"."session_initial_states" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21387" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21388" AFTER UPDATE ON "public"."session_initial_states" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21388" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21392" AFTER INSERT ON "public"."session_initial_states" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21392" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21393" AFTER UPDATE ON "public"."session_initial_states" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21393" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21397" AFTER INSERT ON "public"."session_initial_states" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21397" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21398" AFTER UPDATE ON "public"."session_initial_states" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21398" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21402" AFTER INSERT ON "public"."session_initial_states" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21402" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21403" AFTER UPDATE ON "public"."session_initial_states" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21403" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21407" AFTER INSERT ON "public"."session_initial_states" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21407" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21408" AFTER UPDATE ON "public"."session_initial_states" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21408" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21425" AFTER DELETE ON "public"."session_initial_states" FROM "public"."session_reaction_state_outs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21425" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21426" AFTER UPDATE ON "public"."session_initial_states" FROM "public"."session_reaction_state_outs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21426" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21430" AFTER DELETE ON "public"."session_initial_states" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21430" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21431" AFTER UPDATE ON "public"."session_initial_states" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21431" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21550" AFTER DELETE ON "public"."session_initial_states" FROM "public"."session_switchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21550" ON "public"."session_initial_states" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21551" AFTER UPDATE ON "public"."session_initial_states" FROM "public"."session_switchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21551" ON "public"."session_initial_states" IS NULL;

-- ----------------------------
--  Primary key structure for table switcher_refs
-- ----------------------------
ALTER TABLE "public"."switcher_refs" ADD CONSTRAINT "switcher_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table switcher_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21557" AFTER INSERT ON "public"."switcher_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21557" ON "public"."switcher_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21558" AFTER UPDATE ON "public"."switcher_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21558" ON "public"."switcher_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21562" AFTER INSERT ON "public"."switcher_refs" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21562" ON "public"."switcher_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21563" AFTER UPDATE ON "public"."switcher_refs" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21563" ON "public"."switcher_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table account_loggers
-- ----------------------------
ALTER TABLE "public"."account_loggers" ADD CONSTRAINT "account_loggers_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table strategy_bases
-- ----------------------------
ALTER TABLE "public"."strategy_bases" ADD CONSTRAINT "strategy_bases_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table strategy_bases
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21507" AFTER INSERT ON "public"."strategy_bases" FROM "public"."strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21507" ON "public"."strategy_bases" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21508" AFTER UPDATE ON "public"."strategy_bases" FROM "public"."strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21508" ON "public"."strategy_bases" IS NULL;

-- ----------------------------
--  Primary key structure for table reflect_element_mappings
-- ----------------------------
ALTER TABLE "public"."reflect_element_mappings" ADD CONSTRAINT "reflect_element_mappings_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table reflect_element_mappings
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21267" AFTER INSERT ON "public"."reflect_element_mappings" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21267" ON "public"."reflect_element_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21268" AFTER UPDATE ON "public"."reflect_element_mappings" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21268" ON "public"."reflect_element_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21272" AFTER INSERT ON "public"."reflect_element_mappings" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21272" ON "public"."reflect_element_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21273" AFTER UPDATE ON "public"."reflect_element_mappings" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21273" ON "public"."reflect_element_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21277" AFTER INSERT ON "public"."reflect_element_mappings" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21277" ON "public"."reflect_element_mappings" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21278" AFTER UPDATE ON "public"."reflect_element_mappings" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21278" ON "public"."reflect_element_mappings" IS NULL;

-- ----------------------------
--  Primary key structure for table launch_counters
-- ----------------------------
ALTER TABLE "public"."launch_counters" ADD CONSTRAINT "launch_counters_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launch_counters
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21042" AFTER INSERT ON "public"."launch_counters" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21042" ON "public"."launch_counters" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21043" AFTER UPDATE ON "public"."launch_counters" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21043" ON "public"."launch_counters" IS NULL;

-- ----------------------------
--  Primary key structure for table reaction_state_outs
-- ----------------------------
ALTER TABLE "public"."reaction_state_outs" ADD CONSTRAINT "reaction_state_outs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table reaction_state_outs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21227" AFTER INSERT ON "public"."reaction_state_outs" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21227" ON "public"."reaction_state_outs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21228" AFTER UPDATE ON "public"."reaction_state_outs" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21228" ON "public"."reaction_state_outs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21232" AFTER INSERT ON "public"."reaction_state_outs" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21232" ON "public"."reaction_state_outs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21233" AFTER UPDATE ON "public"."reaction_state_outs" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21233" ON "public"."reaction_state_outs" IS NULL;

-- ----------------------------
--  Primary key structure for table action_statuses
-- ----------------------------
ALTER TABLE "public"."action_statuses" ADD CONSTRAINT "middleware_statuses_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table action_statuses
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20887" AFTER INSERT ON "public"."action_statuses" FROM "public"."action_acts" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20887" ON "public"."action_statuses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20888" AFTER UPDATE ON "public"."action_statuses" FROM "public"."action_acts" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20888" ON "public"."action_statuses" IS NULL;

-- ----------------------------
--  Primary key structure for table space_elements
-- ----------------------------
ALTER TABLE "public"."space_elements" ADD CONSTRAINT "space_elements_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table space_elements
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20955" AFTER DELETE ON "public"."space_elements" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20955" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20956" AFTER UPDATE ON "public"."space_elements" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20956" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21005" AFTER DELETE ON "public"."space_elements" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21005" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21006" AFTER UPDATE ON "public"."space_elements" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21006" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21190" AFTER DELETE ON "public"."space_elements" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21190" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21191" AFTER UPDATE ON "public"."space_elements" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21191" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21457" AFTER INSERT ON "public"."space_elements" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21457" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21458" AFTER UPDATE ON "public"."space_elements" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21458" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21462" AFTER INSERT ON "public"."space_elements" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21462" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21463" AFTER UPDATE ON "public"."space_elements" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21463" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21467" AFTER INSERT ON "public"."space_elements" FROM "public"."bpspaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21467" ON "public"."space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21468" AFTER UPDATE ON "public"."space_elements" FROM "public"."bpspaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21468" ON "public"."space_elements" IS NULL;

-- ----------------------------
--  Primary key structure for table accounts
-- ----------------------------
ALTER TABLE "public"."accounts" ADD CONSTRAINT "accounts_pkey" PRIMARY KEY ("userId") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table launch_middlewares
-- ----------------------------
ALTER TABLE "public"."launch_middlewares" ADD CONSTRAINT "launch_middlewares_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launch_middlewares
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21070" AFTER DELETE ON "public"."launch_middlewares" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21070" ON "public"."launch_middlewares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21071" AFTER UPDATE ON "public"."launch_middlewares" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21071" ON "public"."launch_middlewares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21117" AFTER INSERT ON "public"."launch_middlewares" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21117" ON "public"."launch_middlewares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21118" AFTER UPDATE ON "public"."launch_middlewares" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21118" ON "public"."launch_middlewares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21122" AFTER INSERT ON "public"."launch_middlewares" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21122" ON "public"."launch_middlewares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21123" AFTER UPDATE ON "public"."launch_middlewares" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21123" ON "public"."launch_middlewares" IS NULL;

-- ----------------------------
--  Primary key structure for table bpstaterefs
-- ----------------------------
ALTER TABLE "public"."bpstaterefs" ADD CONSTRAINT "bpstaterefs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table bpstaterefs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20937" AFTER INSERT ON "public"."bpstaterefs" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20937" ON "public"."bpstaterefs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20938" AFTER UPDATE ON "public"."bpstaterefs" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20938" ON "public"."bpstaterefs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20942" AFTER INSERT ON "public"."bpstaterefs" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20942" ON "public"."bpstaterefs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20943" AFTER UPDATE ON "public"."bpstaterefs" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20943" ON "public"."bpstaterefs" IS NULL;

-- ----------------------------
--  Primary key structure for table session_reactions
-- ----------------------------
ALTER TABLE "public"."session_reactions" ADD CONSTRAINT "session_reactions_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_reactions
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20890" AFTER DELETE ON "public"."session_reactions" FROM "public"."action_acts" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20890" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20891" AFTER UPDATE ON "public"."session_reactions" FROM "public"."action_acts" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20891" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21115" AFTER DELETE ON "public"."session_reactions" FROM "public"."launch_middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21115" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21116" AFTER UPDATE ON "public"."session_reactions" FROM "public"."launch_middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21116" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21197" AFTER INSERT ON "public"."session_reactions" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21197" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21198" AFTER UPDATE ON "public"."session_reactions" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21198" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21412" AFTER INSERT ON "public"."session_reactions" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21412" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21413" AFTER UPDATE ON "public"."session_reactions" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21413" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21417" AFTER INSERT ON "public"."session_reactions" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21417" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21418" AFTER UPDATE ON "public"."session_reactions" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21418" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21420" AFTER DELETE ON "public"."session_reactions" FROM "public"."session_reaction_state_outs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21420" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21421" AFTER UPDATE ON "public"."session_reactions" FROM "public"."session_reaction_state_outs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21421" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21432" AFTER INSERT ON "public"."session_reactions" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21432" ON "public"."session_reactions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21433" AFTER UPDATE ON "public"."session_reactions" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21433" ON "public"."session_reactions" IS NULL;

-- ----------------------------
--  Primary key structure for table session_reaction_state_outs
-- ----------------------------
ALTER TABLE "public"."session_reaction_state_outs" ADD CONSTRAINT "session_reaction_state_outs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_reaction_state_outs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21422" AFTER INSERT ON "public"."session_reaction_state_outs" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21422" ON "public"."session_reaction_state_outs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21423" AFTER UPDATE ON "public"."session_reaction_state_outs" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21423" ON "public"."session_reaction_state_outs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21427" AFTER INSERT ON "public"."session_reaction_state_outs" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21427" ON "public"."session_reaction_state_outs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21428" AFTER UPDATE ON "public"."session_reaction_state_outs" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21428" ON "public"."session_reaction_state_outs" IS NULL;

-- ----------------------------
--  Primary key structure for table account_group
-- ----------------------------
ALTER TABLE "public"."account_group" ADD CONSTRAINT "account_group_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table account_group
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20857" AFTER INSERT ON "public"."account_group" FROM "public"."employees" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20857" ON "public"."account_group" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20858" AFTER UPDATE ON "public"."account_group" FROM "public"."employees" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20858" ON "public"."account_group" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20867" AFTER INSERT ON "public"."account_group" FROM "public"."groups" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20867" ON "public"."account_group" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20868" AFTER UPDATE ON "public"."account_group" FROM "public"."groups" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20868" ON "public"."account_group" IS NULL;

-- ----------------------------
--  Primary key structure for table launch_warps
-- ----------------------------
ALTER TABLE "public"."launch_warps" ADD CONSTRAINT "launch_warps_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launch_warps
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21087" AFTER INSERT ON "public"."launch_warps" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21087" ON "public"."launch_warps" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21088" AFTER UPDATE ON "public"."launch_warps" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21088" ON "public"."launch_warps" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21092" AFTER INSERT ON "public"."launch_warps" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21092" ON "public"."launch_warps" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21093" AFTER UPDATE ON "public"."launch_warps" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21093" ON "public"."launch_warps" IS NULL;

-- ----------------------------
--  Primary key structure for table strategies
-- ----------------------------
ALTER TABLE "public"."strategies" ADD CONSTRAINT "strategies_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table strategies
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21505" AFTER DELETE ON "public"."strategies" FROM "public"."strategy_bases" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21505" ON "public"."strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21506" AFTER UPDATE ON "public"."strategies" FROM "public"."strategy_bases" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21506" ON "public"."strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21515" AFTER DELETE ON "public"."strategies" FROM "public"."strategy_inputs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21515" ON "public"."strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21516" AFTER UPDATE ON "public"."strategies" FROM "public"."strategy_inputs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21516" ON "public"."strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21522" AFTER INSERT ON "public"."strategies" FROM "public"."middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21522" ON "public"."strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21523" AFTER UPDATE ON "public"."strategies" FROM "public"."middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21523" ON "public"."strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21530" AFTER DELETE ON "public"."strategies" FROM "public"."strategy_outputs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21530" ON "public"."strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21531" AFTER UPDATE ON "public"."strategies" FROM "public"."strategy_outputs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21531" ON "public"."strategies" IS NULL;

-- ----------------------------
--  Primary key structure for table plans
-- ----------------------------
ALTER TABLE "public"."plans" ADD CONSTRAINT "plans_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table plans
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20875" AFTER DELETE ON "public"."plans" FROM "public"."account_plans" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20875" ON "public"."plans" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20876" AFTER UPDATE ON "public"."plans" FROM "public"."account_plans" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20876" ON "public"."plans" IS NULL;

-- ----------------------------
--  Primary key structure for table elem_topologs
-- ----------------------------
ALTER TABLE "public"."elem_topologs" ADD CONSTRAINT "elem_topologs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table elem_topologs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20985" AFTER DELETE ON "public"."elem_topologs" FROM "public"."element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20985" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20986" AFTER UPDATE ON "public"."elem_topologs" FROM "public"."element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20986" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20997" AFTER INSERT ON "public"."elem_topologs" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20997" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20998" AFTER UPDATE ON "public"."elem_topologs" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20998" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21002" AFTER INSERT ON "public"."elem_topologs" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21002" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21003" AFTER UPDATE ON "public"."elem_topologs" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21003" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21007" AFTER INSERT ON "public"."elem_topologs" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21007" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21008" AFTER UPDATE ON "public"."elem_topologs" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21008" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21012" AFTER INSERT ON "public"."elem_topologs" FROM "public"."bpspaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21012" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21013" AFTER UPDATE ON "public"."elem_topologs" FROM "public"."bpspaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21013" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21240" AFTER DELETE ON "public"."elem_topologs" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21240" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21241" AFTER UPDATE ON "public"."elem_topologs" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21241" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21275" AFTER DELETE ON "public"."elem_topologs" FROM "public"."reflect_element_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21275" ON "public"."elem_topologs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21276" AFTER UPDATE ON "public"."elem_topologs" FROM "public"."reflect_element_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21276" ON "public"."elem_topologs" IS NULL;

-- ----------------------------
--  Primary key structure for table session_state_logs
-- ----------------------------
ALTER TABLE "public"."session_state_logs" ADD CONSTRAINT "session_state_logs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_state_logs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21442" AFTER INSERT ON "public"."session_state_logs" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21442" ON "public"."session_state_logs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21443" AFTER UPDATE ON "public"."session_state_logs" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21443" ON "public"."session_state_logs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21447" AFTER INSERT ON "public"."session_state_logs" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21447" ON "public"."session_state_logs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21448" AFTER UPDATE ON "public"."session_state_logs" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21448" ON "public"."session_state_logs" IS NULL;

-- ----------------------------
--  Primary key structure for table strategy_outputs
-- ----------------------------
ALTER TABLE "public"."strategy_outputs" ADD CONSTRAINT "strategy_outputs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table strategy_outputs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21532" AFTER INSERT ON "public"."strategy_outputs" FROM "public"."strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21532" ON "public"."strategy_outputs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21533" AFTER UPDATE ON "public"."strategy_outputs" FROM "public"."strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21533" ON "public"."strategy_outputs" IS NULL;

-- ----------------------------
--  Primary key structure for table reaction_refs
-- ----------------------------
ALTER TABLE "public"."reaction_refs" ADD CONSTRAINT "reaction_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table reaction_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21130" AFTER DELETE ON "public"."reaction_refs" FROM "public"."middleware_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21130" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21131" AFTER UPDATE ON "public"."reaction_refs" FROM "public"."middleware_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21131" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21202" AFTER INSERT ON "public"."reaction_refs" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21202" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21203" AFTER UPDATE ON "public"."reaction_refs" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21203" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21207" AFTER INSERT ON "public"."reaction_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21207" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21208" AFTER UPDATE ON "public"."reaction_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21208" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21212" AFTER INSERT ON "public"."reaction_refs" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21212" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21213" AFTER UPDATE ON "public"."reaction_refs" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21213" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21215" AFTER DELETE ON "public"."reaction_refs" FROM "public"."reaction_state_out_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21215" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21216" AFTER UPDATE ON "public"."reaction_refs" FROM "public"."reaction_state_out_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21216" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21255" AFTER DELETE ON "public"."reaction_refs" FROM "public"."reflect_action_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_setnull_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21255" ON "public"."reaction_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21256" AFTER UPDATE ON "public"."reaction_refs" FROM "public"."reflect_action_mappings" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21256" ON "public"."reaction_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table process_histories
-- ----------------------------
ALTER TABLE "public"."process_histories" ADD CONSTRAINT "process_histories_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table space_refs
-- ----------------------------
ALTER TABLE "public"."space_refs" ADD CONSTRAINT "space_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table space_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21295" AFTER DELETE ON "public"."space_refs" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21295" ON "public"."space_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21296" AFTER UPDATE ON "public"."space_refs" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21296" ON "public"."space_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21472" AFTER INSERT ON "public"."space_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21472" ON "public"."space_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21473" AFTER UPDATE ON "public"."space_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21473" ON "public"."space_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table middlewares
-- ----------------------------
ALTER TABLE "public"."middlewares" ADD CONSTRAINT "middlewares_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table middlewares
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21112" AFTER INSERT ON "public"."middlewares" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21112" ON "public"."middlewares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21113" AFTER UPDATE ON "public"."middlewares" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21113" ON "public"."middlewares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21520" AFTER DELETE ON "public"."middlewares" FROM "public"."strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21520" ON "public"."middlewares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21521" AFTER UPDATE ON "public"."middlewares" FROM "public"."strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21521" ON "public"."middlewares" IS NULL;

-- ----------------------------
--  Primary key structure for table bpsessions
-- ----------------------------
ALTER TABLE "public"."bpsessions" ADD CONSTRAINT "bpsessions_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table bpsessions
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20895" AFTER DELETE ON "public"."bpsessions" FROM "public"."action_acts" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20895" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20896" AFTER UPDATE ON "public"."bpsessions" FROM "public"."action_acts" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20896" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20927" AFTER INSERT ON "public"."bpsessions" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20927" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20928" AFTER UPDATE ON "public"."bpsessions" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20928" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20960" AFTER DELETE ON "public"."bpsessions" FROM "public"."bpstations" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20960" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20961" AFTER UPDATE ON "public"."bpsessions" FROM "public"."bpstations" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20961" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21035" AFTER DELETE ON "public"."bpsessions" FROM "public"."input_loggers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21035" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21036" AFTER UPDATE ON "public"."bpsessions" FROM "public"."input_loggers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21036" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21055" AFTER DELETE ON "public"."bpsessions" FROM "public"."launch_shares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21055" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21056" AFTER UPDATE ON "public"."bpsessions" FROM "public"."launch_shares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21056" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21090" AFTER DELETE ON "public"."bpsessions" FROM "public"."launch_warps" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21090" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21091" AFTER UPDATE ON "public"."bpsessions" FROM "public"."launch_warps" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21091" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21095" AFTER DELETE ON "public"."bpsessions" FROM "public"."launches_comments" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21095" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21096" AFTER UPDATE ON "public"."bpsessions" FROM "public"."launches_comments" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21096" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21120" AFTER DELETE ON "public"."bpsessions" FROM "public"."launch_middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21120" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21121" AFTER UPDATE ON "public"."bpsessions" FROM "public"."launch_middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21121" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21125" AFTER DELETE ON "public"."bpsessions" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21125" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21126" AFTER UPDATE ON "public"."bpsessions" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21126" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21195" AFTER DELETE ON "public"."bpsessions" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21195" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21196" AFTER UPDATE ON "public"."bpsessions" FROM "public"."session_reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21196" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21320" AFTER DELETE ON "public"."bpsessions" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21320" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21321" AFTER UPDATE ON "public"."bpsessions" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21321" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21325" AFTER DELETE ON "public"."bpsessions" FROM "public"."session_element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21325" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21326" AFTER UPDATE ON "public"."bpsessions" FROM "public"."session_element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21326" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21350" AFTER DELETE ON "public"."bpsessions" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21350" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21351" AFTER UPDATE ON "public"."bpsessions" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21351" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21360" AFTER DELETE ON "public"."bpsessions" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21360" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21361" AFTER UPDATE ON "public"."bpsessions" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21361" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21370" AFTER DELETE ON "public"."bpsessions" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21370" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21371" AFTER UPDATE ON "public"."bpsessions" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21371" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21395" AFTER DELETE ON "public"."bpsessions" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21395" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21396" AFTER UPDATE ON "public"."bpsessions" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21396" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21440" AFTER DELETE ON "public"."bpsessions" FROM "public"."session_state_logs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21440" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21441" AFTER UPDATE ON "public"."bpsessions" FROM "public"."session_state_logs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21441" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21540" AFTER DELETE ON "public"."bpsessions" FROM "public"."session_switchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21540" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21541" AFTER UPDATE ON "public"."bpsessions" FROM "public"."session_switchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21541" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21580" AFTER DELETE ON "public"."bpsessions" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21580" ON "public"."bpsessions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21581" AFTER UPDATE ON "public"."bpsessions" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21581" ON "public"."bpsessions" IS NULL;

-- ----------------------------
--  Primary key structure for table launch_shares
-- ----------------------------
ALTER TABLE "public"."launch_shares" ADD CONSTRAINT "launch_shares_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launch_shares
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21052" AFTER INSERT ON "public"."launch_shares" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21052" ON "public"."launch_shares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21053" AFTER UPDATE ON "public"."launch_shares" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21053" ON "public"."launch_shares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21057" AFTER INSERT ON "public"."launch_shares" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21057" ON "public"."launch_shares" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21058" AFTER UPDATE ON "public"."launch_shares" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21058" ON "public"."launch_shares" IS NULL;

-- ----------------------------
--  Primary key structure for table bpstations
-- ----------------------------
ALTER TABLE "public"."bpstations" ADD CONSTRAINT "bpstations_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table bpstations
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20962" AFTER INSERT ON "public"."bpstations" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20962" ON "public"."bpstations" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20963" AFTER UPDATE ON "public"."bpstations" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20963" ON "public"."bpstations" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21100" AFTER DELETE ON "public"."bpstations" FROM "public"."bploggers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21100" ON "public"."bpstations" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21101" AFTER UPDATE ON "public"."bpstations" FROM "public"."bploggers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21101" ON "public"."bpstations" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21150" AFTER DELETE ON "public"."bpstations" FROM "public"."observers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21150" ON "public"."bpstations" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21151" AFTER UPDATE ON "public"."bpstations" FROM "public"."observers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21151" ON "public"."bpstations" IS NULL;

-- ----------------------------
--  Primary key structure for table proc_element_reflections
-- ----------------------------
ALTER TABLE "public"."proc_element_reflections" ADD CONSTRAINT "proc_element_reflections_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table proc_element_reflections
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21157" AFTER INSERT ON "public"."proc_element_reflections" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21157" ON "public"."proc_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21158" AFTER UPDATE ON "public"."proc_element_reflections" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21158" ON "public"."proc_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21280" AFTER DELETE ON "public"."proc_element_reflections" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21280" ON "public"."proc_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21281" AFTER UPDATE ON "public"."proc_element_reflections" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21281" ON "public"."proc_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21475" AFTER DELETE ON "public"."proc_element_reflections" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21475" ON "public"."proc_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21476" AFTER UPDATE ON "public"."proc_element_reflections" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21476" ON "public"."proc_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21480" AFTER DELETE ON "public"."proc_element_reflections" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21480" ON "public"."proc_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21481" AFTER UPDATE ON "public"."proc_element_reflections" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21481" ON "public"."proc_element_reflections" IS NULL;

-- ----------------------------
--  Primary key structure for table session_element_resources
-- ----------------------------
ALTER TABLE "public"."session_element_resources" ADD CONSTRAINT "session_element_resources_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_element_resources
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21327" AFTER INSERT ON "public"."session_element_resources" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21327" ON "public"."session_element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21328" AFTER UPDATE ON "public"."session_element_resources" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21328" ON "public"."session_element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21332" AFTER INSERT ON "public"."session_element_resources" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21332" ON "public"."session_element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21333" AFTER UPDATE ON "public"."session_element_resources" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21333" ON "public"."session_element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21382" AFTER INSERT ON "public"."session_element_resources" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21382" ON "public"."session_element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21383" AFTER UPDATE ON "public"."session_element_resources" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21383" ON "public"."session_element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21437" AFTER INSERT ON "public"."session_element_resources" FROM "public"."resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21437" ON "public"."session_element_resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21438" AFTER UPDATE ON "public"."session_element_resources" FROM "public"."resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21438" ON "public"."session_element_resources" IS NULL;

-- ----------------------------
--  Primary key structure for table observers
-- ----------------------------
ALTER TABLE "public"."observers" ADD CONSTRAINT "observers_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table observers
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21147" AFTER INSERT ON "public"."observers" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21147" ON "public"."observers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21148" AFTER UPDATE ON "public"."observers" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21148" ON "public"."observers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21152" AFTER INSERT ON "public"."observers" FROM "public"."bpstations" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21152" ON "public"."observers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21153" AFTER UPDATE ON "public"."observers" FROM "public"."bpstations" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21153" ON "public"."observers" IS NULL;

-- ----------------------------
--  Primary key structure for table account_plan_history
-- ----------------------------
ALTER TABLE "public"."account_plan_history" ADD CONSTRAINT "account_plan_history_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table account_plan_history
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20902" AFTER INSERT ON "public"."account_plan_history" FROM "public"."bills" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20902" ON "public"."account_plan_history" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20903" AFTER UPDATE ON "public"."account_plan_history" FROM "public"."bills" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20903" ON "public"."account_plan_history" IS NULL;

-- ----------------------------
--  Primary key structure for table process_permissions
-- ----------------------------
ALTER TABLE "public"."process_permissions" ADD CONSTRAINT "process_permissions_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table process_permissions
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21172" AFTER INSERT ON "public"."process_permissions" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21172" ON "public"."process_permissions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21173" AFTER UPDATE ON "public"."process_permissions" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21173" ON "public"."process_permissions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21177" AFTER INSERT ON "public"."process_permissions" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21177" ON "public"."process_permissions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21178" AFTER UPDATE ON "public"."process_permissions" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21178" ON "public"."process_permissions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21182" AFTER INSERT ON "public"."process_permissions" FROM "public"."groups" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21182" ON "public"."process_permissions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21183" AFTER UPDATE ON "public"."process_permissions" FROM "public"."groups" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21183" ON "public"."process_permissions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21187" AFTER INSERT ON "public"."process_permissions" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21187" ON "public"."process_permissions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21188" AFTER UPDATE ON "public"."process_permissions" FROM "public"."reactions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21188" ON "public"."process_permissions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21192" AFTER INSERT ON "public"."process_permissions" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21192" ON "public"."process_permissions" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21193" AFTER UPDATE ON "public"."process_permissions" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21193" ON "public"."process_permissions" IS NULL;

-- ----------------------------
--  Primary key structure for table bills
-- ----------------------------
ALTER TABLE "public"."bills" ADD CONSTRAINT "bills_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table bills
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20900" AFTER DELETE ON "public"."bills" FROM "public"."account_plan_history" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20900" ON "public"."bills" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20901" AFTER UPDATE ON "public"."bills" FROM "public"."account_plan_history" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20901" ON "public"."bills" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20912" AFTER INSERT ON "public"."bills" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20912" ON "public"."bills" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20913" AFTER UPDATE ON "public"."bills" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20913" ON "public"."bills" IS NULL;

-- ----------------------------
--  Primary key structure for table strategy_refs
-- ----------------------------
ALTER TABLE "public"."strategy_refs" ADD CONSTRAINT "strategy_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table strategy_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21142" AFTER INSERT ON "public"."strategy_refs" FROM "public"."middleware_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21142" ON "public"."strategy_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21143" AFTER UPDATE ON "public"."strategy_refs" FROM "public"."middleware_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21143" ON "public"."strategy_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21500" AFTER DELETE ON "public"."strategy_refs" FROM "public"."strategy_base_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21500" ON "public"."strategy_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21501" AFTER UPDATE ON "public"."strategy_refs" FROM "public"."strategy_base_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21501" ON "public"."strategy_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21510" AFTER DELETE ON "public"."strategy_refs" FROM "public"."strategy_input_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21510" ON "public"."strategy_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21511" AFTER UPDATE ON "public"."strategy_refs" FROM "public"."strategy_input_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21511" ON "public"."strategy_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21525" AFTER DELETE ON "public"."strategy_refs" FROM "public"."strategy_output_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21525" ON "public"."strategy_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21526" AFTER UPDATE ON "public"."strategy_refs" FROM "public"."strategy_output_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21526" ON "public"."strategy_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21537" AFTER INSERT ON "public"."strategy_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21537" ON "public"."strategy_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21538" AFTER UPDATE ON "public"."strategy_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21538" ON "public"."strategy_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table groups
-- ----------------------------
ALTER TABLE "public"."groups" ADD CONSTRAINT "groups_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table groups
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20865" AFTER DELETE ON "public"."groups" FROM "public"."account_group" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20865" ON "public"."groups" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20866" AFTER UPDATE ON "public"."groups" FROM "public"."account_group" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20866" ON "public"."groups" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21032" AFTER INSERT ON "public"."groups" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21032" ON "public"."groups" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21033" AFTER UPDATE ON "public"."groups" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21033" ON "public"."groups" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21180" AFTER DELETE ON "public"."groups" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21180" ON "public"."groups" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21181" AFTER UPDATE ON "public"."groups" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21181" ON "public"."groups" IS NULL;

-- ----------------------------
--  Primary key structure for table session_proc_elements
-- ----------------------------
ALTER TABLE "public"."session_proc_elements" ADD CONSTRAINT "session_proc_elements_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_proc_elements
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21312" AFTER INSERT ON "public"."session_proc_elements" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21312" ON "public"."session_proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21313" AFTER UPDATE ON "public"."session_proc_elements" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21313" ON "public"."session_proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21317" AFTER INSERT ON "public"."session_proc_elements" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21317" ON "public"."session_proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21318" AFTER UPDATE ON "public"."session_proc_elements" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21318" ON "public"."session_proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21322" AFTER INSERT ON "public"."session_proc_elements" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21322" ON "public"."session_proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21323" AFTER UPDATE ON "public"."session_proc_elements" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21323" ON "public"."session_proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21390" AFTER DELETE ON "public"."session_proc_elements" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21390" ON "public"."session_proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21391" AFTER UPDATE ON "public"."session_proc_elements" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21391" ON "public"."session_proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21575" AFTER DELETE ON "public"."session_proc_elements" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21575" ON "public"."session_proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21576" AFTER UPDATE ON "public"."session_proc_elements" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21576" ON "public"."session_proc_elements" IS NULL;

-- ----------------------------
--  Primary key structure for table middleware_refs
-- ----------------------------
ALTER TABLE "public"."middleware_refs" ADD CONSTRAINT "middleware_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table middleware_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21132" AFTER INSERT ON "public"."middleware_refs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21132" ON "public"."middleware_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21133" AFTER UPDATE ON "public"."middleware_refs" FROM "public"."reaction_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21133" ON "public"."middleware_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21137" AFTER INSERT ON "public"."middleware_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21137" ON "public"."middleware_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21138" AFTER UPDATE ON "public"."middleware_refs" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21138" ON "public"."middleware_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21140" AFTER DELETE ON "public"."middleware_refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21140" ON "public"."middleware_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21141" AFTER UPDATE ON "public"."middleware_refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21141" ON "public"."middleware_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table employees
-- ----------------------------
ALTER TABLE "public"."employees" ADD CONSTRAINT "employees_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table employees
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20855" AFTER DELETE ON "public"."employees" FROM "public"."account_group" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20855" ON "public"."employees" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20856" AFTER UPDATE ON "public"."employees" FROM "public"."account_group" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20856" ON "public"."employees" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21017" AFTER INSERT ON "public"."employees" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21017" ON "public"."employees" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21018" AFTER UPDATE ON "public"."employees" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21018" ON "public"."employees" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21025" AFTER DELETE ON "public"."employees" FROM "public"."employees_businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21025" ON "public"."employees" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21026" AFTER UPDATE ON "public"."employees" FROM "public"."employees_businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21026" ON "public"."employees" IS NULL;

-- ----------------------------
--  Primary key structure for table proc_elements
-- ----------------------------
ALTER TABLE "public"."proc_elements" ADD CONSTRAINT "proc_elements_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table proc_elements
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20945" AFTER DELETE ON "public"."proc_elements" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20945" ON "public"."proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20946" AFTER UPDATE ON "public"."proc_elements" FROM "public"."bpstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20946" ON "public"."proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20995" AFTER DELETE ON "public"."proc_elements" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20995" ON "public"."proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20996" AFTER UPDATE ON "public"."proc_elements" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20996" ON "public"."proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21162" AFTER INSERT ON "public"."proc_elements" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21162" ON "public"."proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21163" AFTER UPDATE ON "public"."proc_elements" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21163" ON "public"."proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21167" AFTER INSERT ON "public"."proc_elements" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21167" ON "public"."proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21168" AFTER UPDATE ON "public"."proc_elements" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21168" ON "public"."proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21175" AFTER DELETE ON "public"."proc_elements" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21175" ON "public"."proc_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21176" AFTER UPDATE ON "public"."proc_elements" FROM "public"."process_permissions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21176" ON "public"."proc_elements" IS NULL;

-- ----------------------------
--  Primary key structure for table strategy_inputs
-- ----------------------------
ALTER TABLE "public"."strategy_inputs" ADD CONSTRAINT "strategy_inputs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table strategy_inputs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21517" AFTER INSERT ON "public"."strategy_inputs" FROM "public"."strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21517" ON "public"."strategy_inputs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21518" AFTER UPDATE ON "public"."strategy_inputs" FROM "public"."strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21518" ON "public"."strategy_inputs" IS NULL;

-- ----------------------------
--  Primary key structure for table launch_strategy_bases
-- ----------------------------
ALTER TABLE "public"."launch_strategy_bases" ADD CONSTRAINT "launch_strategy_bases_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launch_strategy_bases
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21062" AFTER INSERT ON "public"."launch_strategy_bases" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21062" ON "public"."launch_strategy_bases" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21063" AFTER UPDATE ON "public"."launch_strategy_bases" FROM "public"."launch_strategies" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21063" ON "public"."launch_strategy_bases" IS NULL;

-- ----------------------------
--  Primary key structure for table client_observers
-- ----------------------------
ALTER TABLE "public"."client_observers" ADD CONSTRAINT "client_observers_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table account_infos
-- ----------------------------
ALTER TABLE "public"."account_infos" ADD CONSTRAINT "account_infos_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table account_infos
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20862" AFTER INSERT ON "public"."account_infos" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20862" ON "public"."account_infos" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20863" AFTER UPDATE ON "public"."account_infos" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20863" ON "public"."account_infos" IS NULL;

-- ----------------------------
--  Primary key structure for table bpspaces
-- ----------------------------
ALTER TABLE "public"."bpspaces" ADD CONSTRAINT "bpspaces_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table bpspaces
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20932" AFTER INSERT ON "public"."bpspaces" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20932" ON "public"."bpspaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20933" AFTER UPDATE ON "public"."bpspaces" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20933" ON "public"."bpspaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21010" AFTER DELETE ON "public"."bpspaces" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21010" ON "public"."bpspaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21011" AFTER UPDATE ON "public"."bpspaces" FROM "public"."elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21011" ON "public"."bpspaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21465" AFTER DELETE ON "public"."bpspaces" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21465" ON "public"."bpspaces" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21466" AFTER UPDATE ON "public"."bpspaces" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21466" ON "public"."bpspaces" IS NULL;

-- ----------------------------
--  Primary key structure for table logininfo
-- ----------------------------
ALTER TABLE "public"."logininfo" ADD CONSTRAINT "logininfo_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Primary key structure for table strategy_output_refs
-- ----------------------------
ALTER TABLE "public"."strategy_output_refs" ADD CONSTRAINT "strategy_output_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table strategy_output_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21527" AFTER INSERT ON "public"."strategy_output_refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21527" ON "public"."strategy_output_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21528" AFTER UPDATE ON "public"."strategy_output_refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21528" ON "public"."strategy_output_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table strategy_input_refs
-- ----------------------------
ALTER TABLE "public"."strategy_input_refs" ADD CONSTRAINT "strategy_input_refs_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table strategy_input_refs
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21512" AFTER INSERT ON "public"."strategy_input_refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21512" ON "public"."strategy_input_refs" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21513" AFTER UPDATE ON "public"."strategy_input_refs" FROM "public"."strategy_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21513" ON "public"."strategy_input_refs" IS NULL;

-- ----------------------------
--  Primary key structure for table businesses
-- ----------------------------
ALTER TABLE "public"."businesses" ADD CONSTRAINT "businesses_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table businesses
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20860" AFTER DELETE ON "public"."businesses" FROM "public"."account_infos" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20860" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20861" AFTER UPDATE ON "public"."businesses" FROM "public"."account_infos" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20861" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20870" AFTER DELETE ON "public"."businesses" FROM "public"."account_plans" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20870" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20871" AFTER UPDATE ON "public"."businesses" FROM "public"."account_plans" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20871" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20905" AFTER DELETE ON "public"."businesses" FROM "public"."billing_infos" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20905" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20906" AFTER UPDATE ON "public"."businesses" FROM "public"."billing_infos" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20906" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20910" AFTER DELETE ON "public"."businesses" FROM "public"."bills" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20910" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20911" AFTER UPDATE ON "public"."businesses" FROM "public"."bills" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20911" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20915" AFTER DELETE ON "public"."businesses" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20915" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20916" AFTER UPDATE ON "public"."businesses" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20916" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20975" AFTER DELETE ON "public"."businesses" FROM "public"."business_services" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20975" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20976" AFTER UPDATE ON "public"."businesses" FROM "public"."business_services" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20976" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21015" AFTER DELETE ON "public"."businesses" FROM "public"."employees" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21015" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21016" AFTER UPDATE ON "public"."businesses" FROM "public"."employees" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21016" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21020" AFTER DELETE ON "public"."businesses" FROM "public"."employees_businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21020" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21021" AFTER UPDATE ON "public"."businesses" FROM "public"."employees_businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21021" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21030" AFTER DELETE ON "public"."businesses" FROM "public"."groups" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21030" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21031" AFTER UPDATE ON "public"."businesses" FROM "public"."groups" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21031" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21050" AFTER DELETE ON "public"."businesses" FROM "public"."launch_shares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21050" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21051" AFTER UPDATE ON "public"."businesses" FROM "public"."launch_shares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21051" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21165" AFTER DELETE ON "public"."businesses" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21165" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21166" AFTER UPDATE ON "public"."businesses" FROM "public"."proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21166" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21300" AFTER DELETE ON "public"."businesses" FROM "public"."resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21300" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21301" AFTER UPDATE ON "public"."businesses" FROM "public"."resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21301" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21315" AFTER DELETE ON "public"."businesses" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21315" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21316" AFTER UPDATE ON "public"."businesses" FROM "public"."session_proc_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21316" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21345" AFTER DELETE ON "public"."businesses" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21345" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21346" AFTER UPDATE ON "public"."businesses" FROM "public"."session_space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21346" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21460" AFTER DELETE ON "public"."businesses" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21460" ON "public"."businesses" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21461" AFTER UPDATE ON "public"."businesses" FROM "public"."space_elements" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21461" ON "public"."businesses" IS NULL;

-- ----------------------------
--  Primary key structure for table session_space_elements
-- ----------------------------
ALTER TABLE "public"."session_space_elements" ADD CONSTRAINT "session_space_elements_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_space_elements
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21342" AFTER INSERT ON "public"."session_space_elements" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21342" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21343" AFTER UPDATE ON "public"."session_space_elements" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21343" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21347" AFTER INSERT ON "public"."session_space_elements" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21347" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21348" AFTER UPDATE ON "public"."session_space_elements" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21348" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21352" AFTER INSERT ON "public"."session_space_elements" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21352" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21353" AFTER UPDATE ON "public"."session_space_elements" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21353" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21357" AFTER INSERT ON "public"."session_space_elements" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21357" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21358" AFTER UPDATE ON "public"."session_space_elements" FROM "public"."session_spaces" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21358" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21405" AFTER DELETE ON "public"."session_space_elements" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21405" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21406" AFTER UPDATE ON "public"."session_space_elements" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21406" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21585" AFTER DELETE ON "public"."session_space_elements" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21585" ON "public"."session_space_elements" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21586" AFTER UPDATE ON "public"."session_space_elements" FROM "public"."session_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21586" ON "public"."session_space_elements" IS NULL;

-- ----------------------------
--  Primary key structure for table files
-- ----------------------------
ALTER TABLE "public"."files" ADD CONSTRAINT "files_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table files
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21045" AFTER DELETE ON "public"."files" FROM "public"."launch_files" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21045" ON "public"."files" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21046" AFTER UPDATE ON "public"."files" FROM "public"."launch_files" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21046" ON "public"."files" IS NULL;

-- ----------------------------
--  Primary key structure for table billing_infos
-- ----------------------------
ALTER TABLE "public"."billing_infos" ADD CONSTRAINT "billing_infos_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table billing_infos
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20907" AFTER INSERT ON "public"."billing_infos" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20907" ON "public"."billing_infos" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_20908" AFTER UPDATE ON "public"."billing_infos" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_20908" ON "public"."billing_infos" IS NULL;

-- ----------------------------
--  Primary key structure for table sessionstates
-- ----------------------------
ALTER TABLE "public"."sessionstates" ADD CONSTRAINT "sessionstates_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table sessionstates
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20935" AFTER DELETE ON "public"."sessionstates" FROM "public"."bpstaterefs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20935" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20936" AFTER UPDATE ON "public"."sessionstates" FROM "public"."bpstaterefs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20936" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20965" AFTER DELETE ON "public"."sessionstates" FROM "public"."bpswitchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20965" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_20966" AFTER UPDATE ON "public"."sessionstates" FROM "public"."bpswitchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_20966" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21367" AFTER INSERT ON "public"."sessionstates" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21367" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21368" AFTER UPDATE ON "public"."sessionstates" FROM "public"."bprocesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21368" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21372" AFTER INSERT ON "public"."sessionstates" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21372" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21373" AFTER UPDATE ON "public"."sessionstates" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21373" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21377" AFTER INSERT ON "public"."sessionstates" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21377" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21378" AFTER UPDATE ON "public"."sessionstates" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21378" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21445" AFTER DELETE ON "public"."sessionstates" FROM "public"."session_state_logs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21445" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21446" AFTER UPDATE ON "public"."sessionstates" FROM "public"."session_state_logs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21446" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21545" AFTER DELETE ON "public"."sessionstates" FROM "public"."session_switchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21545" ON "public"."sessionstates" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21546" AFTER UPDATE ON "public"."sessionstates" FROM "public"."session_switchers" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21546" ON "public"."sessionstates" IS NULL;

-- ----------------------------
--  Primary key structure for table space_element_reflections
-- ----------------------------
ALTER TABLE "public"."space_element_reflections" ADD CONSTRAINT "space_element_reflections_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table space_element_reflections
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21290" AFTER DELETE ON "public"."space_element_reflections" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21290" ON "public"."space_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21291" AFTER UPDATE ON "public"."space_element_reflections" FROM "public"."reflected_elem_topologs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21291" ON "public"."space_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21452" AFTER INSERT ON "public"."space_element_reflections" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21452" ON "public"."space_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21453" AFTER UPDATE ON "public"."space_element_reflections" FROM "public"."refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21453" ON "public"."space_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21485" AFTER DELETE ON "public"."space_element_reflections" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21485" ON "public"."space_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21486" AFTER UPDATE ON "public"."space_element_reflections" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21486" ON "public"."space_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21490" AFTER DELETE ON "public"."space_element_reflections" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21490" ON "public"."space_element_reflections" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21491" AFTER UPDATE ON "public"."space_element_reflections" FROM "public"."state_refs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21491" ON "public"."space_element_reflections" IS NULL;

-- ----------------------------
--  Primary key structure for table session_switchers
-- ----------------------------
ALTER TABLE "public"."session_switchers" ADD CONSTRAINT "session_switchers_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table session_switchers
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21542" AFTER INSERT ON "public"."session_switchers" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21542" ON "public"."session_switchers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21543" AFTER UPDATE ON "public"."session_switchers" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21543" ON "public"."session_switchers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21547" AFTER INSERT ON "public"."session_switchers" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21547" ON "public"."session_switchers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21548" AFTER UPDATE ON "public"."session_switchers" FROM "public"."sessionstates" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21548" ON "public"."session_switchers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21552" AFTER INSERT ON "public"."session_switchers" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21552" ON "public"."session_switchers" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21553" AFTER UPDATE ON "public"."session_switchers" FROM "public"."session_initial_states" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21553" ON "public"."session_switchers" IS NULL;

-- ----------------------------
--  Primary key structure for table resources
-- ----------------------------
ALTER TABLE "public"."resources" ADD CONSTRAINT "resources_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table resources
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21302" AFTER INSERT ON "public"."resources" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21302" ON "public"."resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21303" AFTER UPDATE ON "public"."resources" FROM "public"."businesses" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21303" ON "public"."resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21305" AFTER DELETE ON "public"."resources" FROM "public"."element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21305" ON "public"."resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21306" AFTER UPDATE ON "public"."resources" FROM "public"."element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21306" ON "public"."resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21435" AFTER DELETE ON "public"."resources" FROM "public"."session_element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21435" ON "public"."resources" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21436" AFTER UPDATE ON "public"."resources" FROM "public"."session_element_resources" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21436" ON "public"."resources" IS NULL;

-- ----------------------------
--  Primary key structure for table launch_strategies
-- ----------------------------
ALTER TABLE "public"."launch_strategies" ADD CONSTRAINT "launch_strategies_pkey" PRIMARY KEY ("id") NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Triggers structure for table launch_strategies
-- ----------------------------
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21060" AFTER DELETE ON "public"."launch_strategies" FROM "public"."launch_strategy_bases" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21060" ON "public"."launch_strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21061" AFTER UPDATE ON "public"."launch_strategies" FROM "public"."launch_strategy_bases" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21061" ON "public"."launch_strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21065" AFTER DELETE ON "public"."launch_strategies" FROM "public"."launch_strategy_inputs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21065" ON "public"."launch_strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21066" AFTER UPDATE ON "public"."launch_strategies" FROM "public"."launch_strategy_inputs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21066" ON "public"."launch_strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21072" AFTER INSERT ON "public"."launch_strategies" FROM "public"."launch_middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21072" ON "public"."launch_strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21073" AFTER UPDATE ON "public"."launch_strategies" FROM "public"."launch_middlewares" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21073" ON "public"."launch_strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21075" AFTER DELETE ON "public"."launch_strategies" FROM "public"."launch_strategy_outputs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_cascade_del"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21075" ON "public"."launch_strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_a_21076" AFTER UPDATE ON "public"."launch_strategies" FROM "public"."launch_strategy_outputs" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_noaction_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_a_21076" ON "public"."launch_strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21127" AFTER INSERT ON "public"."launch_strategies" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_ins"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21127" ON "public"."launch_strategies" IS NULL;
CREATE CONSTRAINT TRIGGER "RI_ConstraintTrigger_c_21128" AFTER UPDATE ON "public"."launch_strategies" FROM "public"."bpsessions" NOT DEFERRABLE INITIALLY IMMEDIATE FOR EACH ROW EXECUTE PROCEDURE "RI_FKey_check_upd"();
COMMENT ON TRIGGER "RI_ConstraintTrigger_c_21128" ON "public"."launch_strategies" IS NULL;

-- ----------------------------
--  Foreign keys structure for table reflect_action_mappings
-- ----------------------------
ALTER TABLE "public"."reflect_action_mappings" ADD CONSTRAINT "reflect_action_mappings_element_action_fk" FOREIGN KEY ("element_action") REFERENCES "public"."reactions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reflect_action_mappings" ADD CONSTRAINT "reflect_action_mappings_ref_action_fk" FOREIGN KEY ("ref_action") REFERENCES "public"."reaction_refs" ("id") ON UPDATE NO ACTION ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reflect_action_mappings" ADD CONSTRAINT "reflect_action_mappings_reflect_fk" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table account_plans
-- ----------------------------
ALTER TABLE "public"."account_plans" ADD CONSTRAINT "account_plans_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."account_plans" ADD CONSTRAINT "account_plans_plan_id_fkey" FOREIGN KEY ("plan_id") REFERENCES "public"."plans" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table element_resources
-- ----------------------------
ALTER TABLE "public"."element_resources" ADD CONSTRAINT "el_res_fk" FOREIGN KEY ("element_id") REFERENCES "public"."elem_topologs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."element_resources" ADD CONSTRAINT "el_res_sp_bprocess_fk" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."element_resources" ADD CONSTRAINT "res_fk" FOREIGN KEY ("resource_id") REFERENCES "public"."resources" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_spaces
-- ----------------------------
ALTER TABLE "public"."session_spaces" ADD CONSTRAINT "s_sp_bprocess_fk" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_spaces" ADD CONSTRAINT "s_sp_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table bpstates
-- ----------------------------
ALTER TABLE "public"."bpstates" ADD CONSTRAINT "bpstates_front_elem_id_fkey" FOREIGN KEY ("front_elem_id") REFERENCES "public"."proc_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."bpstates" ADD CONSTRAINT "bpstates_process_id_fkey" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."bpstates" ADD CONSTRAINT "bpstates_space_elem_id_fkey" FOREIGN KEY ("space_elem_id") REFERENCES "public"."space_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launch_strategy_inputs
-- ----------------------------
ALTER TABLE "public"."launch_strategy_inputs" ADD CONSTRAINT "launch_strategy_inputs_unit_strategy_fk" FOREIGN KEY ("strategy_id") REFERENCES "public"."launch_strategies" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table reactions
-- ----------------------------
ALTER TABLE "public"."reactions" ADD CONSTRAINT "reactions_bprocess_id_fkey" FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reactions" ADD CONSTRAINT "reactions_element_id_fkey" FOREIGN KEY ("element_id") REFERENCES "public"."elem_topologs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reactions" ADD CONSTRAINT "reactions_state_ref_id_fkey" FOREIGN KEY ("state_ref_id") REFERENCES "public"."bpstates" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_elem_topologs
-- ----------------------------
ALTER TABLE "public"."session_elem_topologs" ADD CONSTRAINT "topo_bprocess_fk" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_elem_topologs" ADD CONSTRAINT "topo_bpspace_fk" FOREIGN KEY ("space_id") REFERENCES "public"."session_spaces" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_elem_topologs" ADD CONSTRAINT "topo_procelem_fk" FOREIGN KEY ("front_elem_id") REFERENCES "public"."session_proc_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_elem_topologs" ADD CONSTRAINT "topo_s_sp_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_elem_topologs" ADD CONSTRAINT "topo_spaceelem_fk" FOREIGN KEY ("space_elem_id") REFERENCES "public"."session_space_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table reflected_elem_topologs
-- ----------------------------
ALTER TABLE "public"."reflected_elem_topologs" ADD CONSTRAINT "reflected_elem_topologs_front_elem_id_fkey" FOREIGN KEY ("front_elem_id") REFERENCES "public"."proc_element_reflections" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reflected_elem_topologs" ADD CONSTRAINT "reflected_elem_topologs_reflection_id_fkey" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reflected_elem_topologs" ADD CONSTRAINT "reflected_elem_topologs_space_elem_id_fkey" FOREIGN KEY ("space_elem_id") REFERENCES "public"."space_element_reflections" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reflected_elem_topologs" ADD CONSTRAINT "reflected_elem_topologs_space_id_fkey" FOREIGN KEY ("space_id") REFERENCES "public"."space_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table action_act_results
-- ----------------------------
ALTER TABLE "public"."action_act_results" ADD CONSTRAINT "act_reaction_fk" FOREIGN KEY ("act_id") REFERENCES "public"."action_acts" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launch_files
-- ----------------------------
ALTER TABLE "public"."launch_files" ADD CONSTRAINT "launch_files_file_id_pkey" FOREIGN KEY ("file_id") REFERENCES "public"."files" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launches_comments
-- ----------------------------
ALTER TABLE "public"."launches_comments" ADD CONSTRAINT "launch_warps_comment_fk" FOREIGN KEY ("comment_id") REFERENCES "public"."comments" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."launches_comments" ADD CONSTRAINT "launch_warps_launch_fk" FOREIGN KEY ("launch_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table bpswitchers
-- ----------------------------
ALTER TABLE "public"."bpswitchers" ADD CONSTRAINT "bpswitchers_session_state_fkey" FOREIGN KEY ("session_state") REFERENCES "public"."sessionstates" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."bpswitchers" ADD CONSTRAINT "bpswitchers_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "public"."bpstates" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table bploggers
-- ----------------------------
ALTER TABLE "public"."bploggers" ADD CONSTRAINT "lg_b_fk" FOREIGN KEY ("station_id") REFERENCES "public"."bpstations" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."bploggers" ADD CONSTRAINT "lg_bprocess_fk" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launch_strategy_outputs
-- ----------------------------
ALTER TABLE "public"."launch_strategy_outputs" ADD CONSTRAINT "launch_strategy_outputs_unit_strategy_fk" FOREIGN KEY ("strategy_id") REFERENCES "public"."launch_strategies" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table employees_businesses
-- ----------------------------
ALTER TABLE "public"."employees_businesses" ADD CONSTRAINT "employees_businesses_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."employees_businesses" ADD CONSTRAINT "employees_businesses_employee_id_fkey" FOREIGN KEY ("employee_id") REFERENCES "public"."employees" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table business_services
-- ----------------------------
ALTER TABLE "public"."business_services" ADD CONSTRAINT "business_services_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE NO ACTION NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table bprocesses
-- ----------------------------
ALTER TABLE "public"."bprocesses" ADD CONSTRAINT "bprocesses_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."bprocesses" ADD CONSTRAINT "bprocesses_service_id_fkey" FOREIGN KEY ("service_id") REFERENCES "public"."business_services" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table state_refs
-- ----------------------------
ALTER TABLE "public"."state_refs" ADD CONSTRAINT "state_refs_ref_front_elem_id_fkey" FOREIGN KEY ("ref_front_elem_id") REFERENCES "public"."proc_element_reflections" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."state_refs" ADD CONSTRAINT "state_refs_ref_front_elem_id_fkey1" FOREIGN KEY ("ref_front_elem_id") REFERENCES "public"."proc_element_reflections" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."state_refs" ADD CONSTRAINT "state_refs_ref_space_elem_id_fkey" FOREIGN KEY ("ref_space_elem_id") REFERENCES "public"."space_element_reflections" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."state_refs" ADD CONSTRAINT "state_refs_ref_space_elem_id_fkey1" FOREIGN KEY ("ref_space_elem_id") REFERENCES "public"."space_element_reflections" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."state_refs" ADD CONSTRAINT "state_refs_reflection_id_fkey" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table comments
-- ----------------------------
ALTER TABLE "public"."comments" ADD CONSTRAINT "commentAuthor_macc_fk" FOREIGN KEY ("author") REFERENCES "public"."user" ("userID") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table action_acts
-- ----------------------------
ALTER TABLE "public"."action_acts" ADD CONSTRAINT "action_acts_reaction_fk" FOREIGN KEY ("reaction") REFERENCES "public"."session_reactions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."action_acts" ADD CONSTRAINT "action_acts_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table reaction_state_out_refs
-- ----------------------------
ALTER TABLE "public"."reaction_state_out_refs" ADD CONSTRAINT "reaction_state_out_refs_reaction_id_fkey" FOREIGN KEY ("reaction_id") REFERENCES "public"."reaction_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reaction_state_out_refs" ADD CONSTRAINT "reaction_state_out_refs_state_ref_fkey" FOREIGN KEY ("state_ref") REFERENCES "public"."state_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table input_loggers
-- ----------------------------
ALTER TABLE "public"."input_loggers" ADD CONSTRAINT "input_loggers_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table strategy_base_refs
-- ----------------------------
ALTER TABLE "public"."strategy_base_refs" ADD CONSTRAINT "strategy_base_refs_strategy_fk" FOREIGN KEY ("strategy_id") REFERENCES "public"."strategy_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_initial_states
-- ----------------------------
ALTER TABLE "public"."session_initial_states" ADD CONSTRAINT "ses_init_state_bprocess_fk" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_initial_states" ADD CONSTRAINT "ses_init_state_procelem_fk" FOREIGN KEY ("ses_front_elem_id") REFERENCES "public"."session_proc_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_initial_states" ADD CONSTRAINT "ses_init_state_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_initial_states" ADD CONSTRAINT "ses_init_state_space_fk" FOREIGN KEY ("ses_space_id") REFERENCES "public"."session_spaces" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_initial_states" ADD CONSTRAINT "ses_init_state_spaceelem_fk" FOREIGN KEY ("ses_space_elem_id") REFERENCES "public"."session_space_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table switcher_refs
-- ----------------------------
ALTER TABLE "public"."switcher_refs" ADD CONSTRAINT "switcher_refs_reflection_id_fkey" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."switcher_refs" ADD CONSTRAINT "switcher_refs_state_ref_id_fkey" FOREIGN KEY ("state_ref_id") REFERENCES "public"."state_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table strategy_bases
-- ----------------------------
ALTER TABLE "public"."strategy_bases" ADD CONSTRAINT "strategy_bases_unit_strategy_fk" FOREIGN KEY ("strategy_id") REFERENCES "public"."strategies" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table reflect_element_mappings
-- ----------------------------
ALTER TABLE "public"."reflect_element_mappings" ADD CONSTRAINT "reflect_element_mappings_ref_topo_element_fk" FOREIGN KEY ("ref_topo_element") REFERENCES "public"."reflected_elem_topologs" ("id") ON UPDATE NO ACTION ON DELETE SET NULL NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reflect_element_mappings" ADD CONSTRAINT "reflect_element_mappings_reflect_fk" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reflect_element_mappings" ADD CONSTRAINT "reflect_element_mappings_topology_element_fk" FOREIGN KEY ("topology_element_id") REFERENCES "public"."elem_topologs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launch_counters
-- ----------------------------
ALTER TABLE "public"."launch_counters" ADD CONSTRAINT "launch_counters_bprocess_fk" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table reaction_state_outs
-- ----------------------------
ALTER TABLE "public"."reaction_state_outs" ADD CONSTRAINT "reaction_state_outs_reaction_id_fkey" FOREIGN KEY ("reaction_id") REFERENCES "public"."reactions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reaction_state_outs" ADD CONSTRAINT "reaction_state_outs_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "public"."bpstates" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table action_statuses
-- ----------------------------
ALTER TABLE "public"."action_statuses" ADD CONSTRAINT "act_reaction_fk" FOREIGN KEY ("act_id") REFERENCES "public"."action_acts" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table space_elements
-- ----------------------------
ALTER TABLE "public"."space_elements" ADD CONSTRAINT "space_elements_bprocess_id_fkey" FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."space_elements" ADD CONSTRAINT "space_elements_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."space_elements" ADD CONSTRAINT "space_elements_owned_space_id_fkey" FOREIGN KEY ("owned_space_id") REFERENCES "public"."bpspaces" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launch_middlewares
-- ----------------------------
ALTER TABLE "public"."launch_middlewares" ADD CONSTRAINT "middleware_reaction_fk" FOREIGN KEY ("reaction_id") REFERENCES "public"."session_reactions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."launch_middlewares" ADD CONSTRAINT "middleware_reaction_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table bpstaterefs
-- ----------------------------
ALTER TABLE "public"."bpstaterefs" ADD CONSTRAINT "bpstaterefs_session_state_fkey" FOREIGN KEY ("session_state") REFERENCES "public"."sessionstates" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."bpstaterefs" ADD CONSTRAINT "bpstaterefs_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "public"."bpstates" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_reactions
-- ----------------------------
ALTER TABLE "public"."session_reactions" ADD CONSTRAINT "react_topo_s_sp_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_reactions" ADD CONSTRAINT "ses_react_bprocess_fk" FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_reactions" ADD CONSTRAINT "ses_react_element_fk" FOREIGN KEY ("element_id") REFERENCES "public"."session_elem_topologs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_reactions" ADD CONSTRAINT "ses_react_state_fk" FOREIGN KEY ("state_ref_id") REFERENCES "public"."session_initial_states" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_reaction_state_outs
-- ----------------------------
ALTER TABLE "public"."session_reaction_state_outs" ADD CONSTRAINT "ses_react_out_reaction_fk" FOREIGN KEY ("reaction_id") REFERENCES "public"."session_reactions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_reaction_state_outs" ADD CONSTRAINT "ses_react_out_state_fk" FOREIGN KEY ("session_state_id") REFERENCES "public"."session_initial_states" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table account_group
-- ----------------------------
ALTER TABLE "public"."account_group" ADD CONSTRAINT "acc_group_employee_fk" FOREIGN KEY ("employee_id") REFERENCES "public"."employees" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."account_group" ADD CONSTRAINT "account_group_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "public"."groups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launch_warps
-- ----------------------------
ALTER TABLE "public"."launch_warps" ADD CONSTRAINT "launch_warps_launch_elem_fk" FOREIGN KEY ("launch_element_id") REFERENCES "public"."session_elem_topologs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."launch_warps" ADD CONSTRAINT "launch_warps_launch_fk" FOREIGN KEY ("launch_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table strategies
-- ----------------------------
ALTER TABLE "public"."strategies" ADD CONSTRAINT "strategy_middleware_fk" FOREIGN KEY ("middleware_id") REFERENCES "public"."middlewares" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table elem_topologs
-- ----------------------------
ALTER TABLE "public"."elem_topologs" ADD CONSTRAINT "elem_topologs_front_elem_id_fkey" FOREIGN KEY ("front_elem_id") REFERENCES "public"."proc_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."elem_topologs" ADD CONSTRAINT "elem_topologs_process_id_fkey" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."elem_topologs" ADD CONSTRAINT "elem_topologs_space_elem_id_fkey" FOREIGN KEY ("space_elem_id") REFERENCES "public"."space_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."elem_topologs" ADD CONSTRAINT "elem_topologs_space_id_fkey" FOREIGN KEY ("space_id") REFERENCES "public"."bpspaces" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_state_logs
-- ----------------------------
ALTER TABLE "public"."session_state_logs" ADD CONSTRAINT "session_state_logs_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_state_logs" ADD CONSTRAINT "session_state_logs_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "public"."sessionstates" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table strategy_outputs
-- ----------------------------
ALTER TABLE "public"."strategy_outputs" ADD CONSTRAINT "strategy_outputs_unit_strategy_fk" FOREIGN KEY ("strategy_id") REFERENCES "public"."strategies" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table reaction_refs
-- ----------------------------
ALTER TABLE "public"."reaction_refs" ADD CONSTRAINT "reaction_refs_element_id_fkey" FOREIGN KEY ("element_id") REFERENCES "public"."reflected_elem_topologs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reaction_refs" ADD CONSTRAINT "reaction_refs_reflection_id_fkey" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."reaction_refs" ADD CONSTRAINT "reaction_refs_state_ref_id_fkey" FOREIGN KEY ("state_ref_id") REFERENCES "public"."state_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table space_refs
-- ----------------------------
ALTER TABLE "public"."space_refs" ADD CONSTRAINT "space_refs_reflection_id_fkey" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table middlewares
-- ----------------------------
ALTER TABLE "public"."middlewares" ADD CONSTRAINT "middleware_reaction_fk" FOREIGN KEY ("reaction_id") REFERENCES "public"."reactions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table bpsessions
-- ----------------------------
ALTER TABLE "public"."bpsessions" ADD CONSTRAINT "bpsessions_process_id_fkey" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launch_shares
-- ----------------------------
ALTER TABLE "public"."launch_shares" ADD CONSTRAINT "launch_shares_biz_business_fk" FOREIGN KEY ("price") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."launch_shares" ADD CONSTRAINT "launch_shares_sp_session_fk" FOREIGN KEY ("title") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table bpstations
-- ----------------------------
ALTER TABLE "public"."bpstations" ADD CONSTRAINT "bpstations_session_id_fkey" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table proc_element_reflections
-- ----------------------------
ALTER TABLE "public"."proc_element_reflections" ADD CONSTRAINT "proc_element_reflections_reflection_id_fkey" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_element_resources
-- ----------------------------
ALTER TABLE "public"."session_element_resources" ADD CONSTRAINT "s_res_s_sp_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_element_resources" ADD CONSTRAINT "s_res_sp_bprocess_fk" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_element_resources" ADD CONSTRAINT "ses_el_res_fk" FOREIGN KEY ("session_element_id") REFERENCES "public"."session_elem_topologs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_element_resources" ADD CONSTRAINT "ses_res_fk" FOREIGN KEY ("resource_id") REFERENCES "public"."resources" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table observers
-- ----------------------------
ALTER TABLE "public"."observers" ADD CONSTRAINT "observers_bprocess_id_fkey" FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."observers" ADD CONSTRAINT "observers_station_id_fkey" FOREIGN KEY ("station_id") REFERENCES "public"."bpstations" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table account_plan_history
-- ----------------------------
ALTER TABLE "public"."account_plan_history" ADD CONSTRAINT "bill_his_fk" FOREIGN KEY ("bill_id") REFERENCES "public"."bills" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table process_permissions
-- ----------------------------
ALTER TABLE "public"."process_permissions" ADD CONSTRAINT "process_permissions_bprocess_fkey" FOREIGN KEY ("bprocess") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."process_permissions" ADD CONSTRAINT "process_permissions_front_elem_id_fkey" FOREIGN KEY ("front_elem_id") REFERENCES "public"."proc_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."process_permissions" ADD CONSTRAINT "process_permissions_group_id_fkey" FOREIGN KEY ("group_id") REFERENCES "public"."groups" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."process_permissions" ADD CONSTRAINT "process_permissions_reaction_id_fkey" FOREIGN KEY ("reaction_id") REFERENCES "public"."reactions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."process_permissions" ADD CONSTRAINT "process_permissions_space_elem_id_fkey" FOREIGN KEY ("space_elem_id") REFERENCES "public"."space_elements" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table bills
-- ----------------------------
ALTER TABLE "public"."bills" ADD CONSTRAINT "bills_current_biz_business_fk" FOREIGN KEY ("workbench_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table strategy_refs
-- ----------------------------
ALTER TABLE "public"."strategy_refs" ADD CONSTRAINT "middleware_ref_reflect_fk" FOREIGN KEY ("middleware_id") REFERENCES "public"."middleware_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."strategy_refs" ADD CONSTRAINT "strategy_ref_reflect_fk" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table groups
-- ----------------------------
ALTER TABLE "public"."groups" ADD CONSTRAINT "groups_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_proc_elements
-- ----------------------------
ALTER TABLE "public"."session_proc_elements" ADD CONSTRAINT "s_proc_el_bprocess_fk" FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_proc_elements" ADD CONSTRAINT "s_proc_el_business_fk" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_proc_elements" ADD CONSTRAINT "s_proc_el_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table middleware_refs
-- ----------------------------
ALTER TABLE "public"."middleware_refs" ADD CONSTRAINT "middleware_ref_reaction_ref_fk" FOREIGN KEY ("reaction_id") REFERENCES "public"."reaction_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."middleware_refs" ADD CONSTRAINT "middleware_ref_reflect_fk" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table employees
-- ----------------------------
ALTER TABLE "public"."employees" ADD CONSTRAINT "emp_workbench_fk" FOREIGN KEY ("workbench_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table proc_elements
-- ----------------------------
ALTER TABLE "public"."proc_elements" ADD CONSTRAINT "proc_elements_bprocess_id_fkey" FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."proc_elements" ADD CONSTRAINT "proc_elements_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table strategy_inputs
-- ----------------------------
ALTER TABLE "public"."strategy_inputs" ADD CONSTRAINT "strategy_inputs_unit_strategy_fk" FOREIGN KEY ("strategy_id") REFERENCES "public"."strategies" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launch_strategy_bases
-- ----------------------------
ALTER TABLE "public"."launch_strategy_bases" ADD CONSTRAINT "launch_strategy_bases_unit_strategy_fk" FOREIGN KEY ("strategy_id") REFERENCES "public"."launch_strategies" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table account_infos
-- ----------------------------
ALTER TABLE "public"."account_infos" ADD CONSTRAINT "acc_info_current_biz_business_fk" FOREIGN KEY ("workbench_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table bpspaces
-- ----------------------------
ALTER TABLE "public"."bpspaces" ADD CONSTRAINT "bpspaces_process_id_fkey" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table strategy_output_refs
-- ----------------------------
ALTER TABLE "public"."strategy_output_refs" ADD CONSTRAINT "strategy_output_refs_strategy_fk" FOREIGN KEY ("strategy_id") REFERENCES "public"."strategy_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table strategy_input_refs
-- ----------------------------
ALTER TABLE "public"."strategy_input_refs" ADD CONSTRAINT "strategy_input_refs_strategy_fk" FOREIGN KEY ("strategy_id") REFERENCES "public"."strategy_refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_space_elements
-- ----------------------------
ALTER TABLE "public"."session_space_elements" ADD CONSTRAINT "s_sp_el_bprocess_fk" FOREIGN KEY ("bprocess_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_space_elements" ADD CONSTRAINT "s_sp_el_business_fk" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_space_elements" ADD CONSTRAINT "s_sp_el_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_space_elements" ADD CONSTRAINT "s_sp_el_session_space_fk" FOREIGN KEY ("owned_space_id") REFERENCES "public"."session_spaces" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table billing_infos
-- ----------------------------
ALTER TABLE "public"."billing_infos" ADD CONSTRAINT "billing_infos_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table sessionstates
-- ----------------------------
ALTER TABLE "public"."sessionstates" ADD CONSTRAINT "s_st_bprocess_fk" FOREIGN KEY ("process_id") REFERENCES "public"."bprocesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."sessionstates" ADD CONSTRAINT "s_st_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."sessionstates" ADD CONSTRAINT "s_st_state_fk" FOREIGN KEY ("origin_state_id") REFERENCES "public"."session_initial_states" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table space_element_reflections
-- ----------------------------
ALTER TABLE "public"."space_element_reflections" ADD CONSTRAINT "space_element_reflections_reflection_id_fkey" FOREIGN KEY ("reflection_id") REFERENCES "public"."refs" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table session_switchers
-- ----------------------------
ALTER TABLE "public"."session_switchers" ADD CONSTRAINT "sw_s_sp_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_switchers" ADD CONSTRAINT "sw_session_state_fk" FOREIGN KEY ("session_state_id") REFERENCES "public"."sessionstates" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."session_switchers" ADD CONSTRAINT "sw_statefk" FOREIGN KEY ("session_state_ref_id") REFERENCES "public"."session_initial_states" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table resources
-- ----------------------------
ALTER TABLE "public"."resources" ADD CONSTRAINT "res_business_fk" FOREIGN KEY ("business_id") REFERENCES "public"."businesses" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

-- ----------------------------
--  Foreign keys structure for table launch_strategies
-- ----------------------------
ALTER TABLE "public"."launch_strategies" ADD CONSTRAINT "launch_strategy_middleware_fk" FOREIGN KEY ("middleware_id") REFERENCES "public"."launch_middlewares" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;
ALTER TABLE "public"."launch_strategies" ADD CONSTRAINT "middleware_reaction_session_fk" FOREIGN KEY ("session_id") REFERENCES "public"."bpsessions" ("id") ON UPDATE NO ACTION ON DELETE CASCADE NOT DEFERRABLE INITIALLY IMMEDIATE;

