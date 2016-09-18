--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_group (
    id integer NOT NULL,
    account_id character varying(254),
    group_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    employee_id bigint NOT NULL
);


ALTER TABLE account_group OWNER TO postgres;

--
-- Name: account_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_group_id_seq
    START WITH 9
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_group_id_seq OWNER TO postgres;

--
-- Name: account_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_group_id_seq OWNED BY account_group.id;


--
-- Name: account_infos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_infos (
    id integer NOT NULL,
    uid character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    early_access boolean DEFAULT false NOT NULL,
    pro_features boolean DEFAULT false NOT NULL,
    workbench_id bigint,
    lang character varying(255),
    nickname character varying(255),
    country character varying(255),
    phone character varying(255)
);


ALTER TABLE account_infos OWNER TO postgres;

--
-- Name: account_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_infos_id_seq
    START WITH 16
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_infos_id_seq OWNER TO postgres;

--
-- Name: account_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_infos_id_seq OWNED BY account_infos.id;


--
-- Name: account_loggers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_loggers (
    id integer NOT NULL,
    ip character varying(254) NOT NULL,
    user_agent character varying(254) NOT NULL,
    email character varying(254),
    date timestamp(6) with time zone NOT NULL
);


ALTER TABLE account_loggers OWNER TO postgres;

--
-- Name: account_loggers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_loggers_id_seq
    START WITH 796
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_loggers_id_seq OWNER TO postgres;

--
-- Name: account_loggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_loggers_id_seq OWNED BY account_loggers.id;


--
-- Name: account_plan_history_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_plan_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_plan_history_id_seq OWNER TO postgres;

--
-- Name: account_plan_history; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_plan_history (
    id integer DEFAULT nextval('account_plan_history_id_seq'::regclass) NOT NULL,
    account_plan_id integer NOT NULL,
    limit_diff integer NOT NULL,
    plan_diff integer NOT NULL,
    bill_id integer NOT NULL
);


ALTER TABLE account_plan_history OWNER TO postgres;

--
-- Name: account_plans; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_plans (
    id integer NOT NULL,
    business_id integer NOT NULL,
    master_acc character varying(254) NOT NULL,
    plan_id integer NOT NULL,
    expired_at timestamp(6) with time zone NOT NULL,
    active boolean NOT NULL,
    "limit" integer NOT NULL
);


ALTER TABLE account_plans OWNER TO postgres;

--
-- Name: account_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_plans_id_seq
    START WITH 27
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_plans_id_seq OWNER TO postgres;

--
-- Name: account_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_plans_id_seq OWNED BY account_plans.id;


--
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE accounts (
    "providerId" character varying(254) NOT NULL,
    "userId" character varying(254) NOT NULL,
    "firstName" character varying(254),
    "lastName" character varying(254),
    "fullName" character varying(254),
    email character varying(254),
    "avatarUrl" character varying(254),
    "authMethod" character varying(254) NOT NULL,
    token character varying(254),
    secret character varying(254),
    "accessToken" character varying(254),
    "tokenType" character varying(254),
    "expiresIn" integer,
    "refreshToken" character varying(254),
    hasher character varying(254) NOT NULL,
    password character varying(254) NOT NULL,
    salt character varying(254),
    lang character varying(254) NOT NULL,
    country character varying(254),
    phone character varying(254),
    nickname character varying(254),
    created_at timestamp(6) with time zone
);


ALTER TABLE accounts OWNER TO postgres;

--
-- Name: action_act_results; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE action_act_results (
    id bigint NOT NULL,
    "in" boolean NOT NULL,
    "out" boolean NOT NULL,
    base boolean NOT NULL,
    content character varying NOT NULL,
    act_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE action_act_results OWNER TO postgres;

--
-- Name: action_act_results_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE action_act_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE action_act_results_id_seq OWNER TO postgres;

--
-- Name: action_act_results_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE action_act_results_id_seq OWNED BY action_act_results.id;


--
-- Name: action_acts; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE action_acts (
    id bigint NOT NULL,
    uid character varying NOT NULL,
    session_id integer NOT NULL,
    reaction integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE action_acts OWNER TO postgres;

--
-- Name: action_acts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE action_acts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE action_acts_id_seq OWNER TO postgres;

--
-- Name: action_acts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE action_acts_id_seq OWNED BY action_acts.id;


--
-- Name: action_statuses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE action_statuses (
    id bigint NOT NULL,
    content character varying NOT NULL,
    act_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE action_statuses OWNER TO postgres;

--
-- Name: billing_infos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE billing_infos (
    id integer NOT NULL,
    business_id integer NOT NULL,
    firstname character varying(254) NOT NULL,
    lastname character varying(254) NOT NULL,
    address character varying(254) NOT NULL,
    zipcode character varying(254) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);


ALTER TABLE billing_infos OWNER TO postgres;

--
-- Name: billing_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billing_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE billing_infos_id_seq OWNER TO postgres;

--
-- Name: billing_infos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE billing_infos_id_seq OWNED BY billing_infos.id;


--
-- Name: bills; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bills (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    master_acc character varying(254) NOT NULL,
    assigned timestamp(6) with time zone NOT NULL,
    approved boolean NOT NULL,
    expired timestamp(6) with time zone NOT NULL,
    sum numeric(21,2) NOT NULL,
    workbench_id bigint NOT NULL
);


ALTER TABLE bills OWNER TO postgres;

--
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bills_id_seq OWNER TO postgres;

--
-- Name: bills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bills_id_seq OWNED BY bills.id;


--
-- Name: bploggers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bploggers (
    id integer NOT NULL,
    process_id integer NOT NULL,
    proc_element_id integer,
    space_element_id integer,
    "order" integer NOT NULL,
    space_id integer,
    station_id integer NOT NULL,
    invoked boolean NOT NULL,
    expanded boolean NOT NULL,
    container boolean NOT NULL,
    date timestamp(6) with time zone NOT NULL,
    step integer NOT NULL
);


ALTER TABLE bploggers OWNER TO postgres;

--
-- Name: bploggers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bploggers_id_seq
    START WITH 1139
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bploggers_id_seq OWNER TO postgres;

--
-- Name: bploggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bploggers_id_seq OWNED BY bploggers.id;


--
-- Name: bprocesses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bprocesses (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    service_id integer NOT NULL,
    business_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    version bigint DEFAULT 1 NOT NULL,
    state_machine_type character varying(40) DEFAULT 'base'::character varying NOT NULL
);


ALTER TABLE bprocesses OWNER TO postgres;

--
-- Name: bprocesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bprocesses_id_seq
    START WITH 71
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bprocesses_id_seq OWNER TO postgres;

--
-- Name: bprocesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bprocesses_id_seq OWNED BY bprocesses.id;


--
-- Name: bpsessions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bpsessions (
    id integer NOT NULL,
    process_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    active_listed boolean DEFAULT false NOT NULL
);


ALTER TABLE bpsessions OWNER TO postgres;

--
-- Name: bpsessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpsessions_id_seq
    START WITH 152
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bpsessions_id_seq OWNER TO postgres;

--
-- Name: bpsessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bpsessions_id_seq OWNED BY bpsessions.id;


--
-- Name: bpspaces; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bpspaces (
    id integer NOT NULL,
    process_id integer NOT NULL,
    index integer NOT NULL,
    container boolean DEFAULT false NOT NULL,
    subbrick boolean DEFAULT false NOT NULL,
    brick_front_id integer,
    brick_nested_id integer,
    nesting_level integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE bpspaces OWNER TO postgres;

--
-- Name: bpspaces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpspaces_id_seq
    START WITH 87
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bpspaces_id_seq OWNER TO postgres;

--
-- Name: bpspaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bpspaces_id_seq OWNED BY bpspaces.id;


--
-- Name: bpstaterefs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bpstaterefs (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    switch_type character varying(254) NOT NULL,
    priority integer DEFAULT 2 NOT NULL,
    state_id integer NOT NULL,
    session_state integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE bpstaterefs OWNER TO postgres;

--
-- Name: bpstaterefs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpstaterefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bpstaterefs_id_seq OWNER TO postgres;

--
-- Name: bpstaterefs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bpstaterefs_id_seq OWNED BY bpstaterefs.id;


--
-- Name: bpstates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bpstates (
    id integer NOT NULL,
    process_id integer NOT NULL,
    title character varying(254) NOT NULL,
    neutral character varying(254) NOT NULL,
    is_process_state boolean DEFAULT false NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    lang character varying(254) DEFAULT 'en'::character varying NOT NULL,
    space_id integer,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    middle character varying(254) DEFAULT ''::character varying,
    middleable boolean DEFAULT false,
    oposite character varying(254) DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL
);


ALTER TABLE bpstates OWNER TO postgres;

--
-- Name: bpstates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpstates_id_seq
    START WITH 346
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bpstates_id_seq OWNER TO postgres;

--
-- Name: bpstates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bpstates_id_seq OWNED BY bpstates.id;


--
-- Name: bpstation_loggers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bpstation_loggers (
    id integer NOT NULL,
    station_id integer NOT NULL,
    process_id integer NOT NULL,
    sygnal character varying(254) NOT NULL,
    date timestamp(6) with time zone NOT NULL,
    state boolean NOT NULL,
    step integer NOT NULL,
    space integer NOT NULL,
    container_step integer[] NOT NULL,
    expand_step integer[] NOT NULL,
    spaces_ids integer[] NOT NULL,
    started boolean NOT NULL,
    finished boolean NOT NULL,
    inspace boolean NOT NULL,
    incontainer boolean NOT NULL,
    inexpands boolean NOT NULL,
    paused boolean NOT NULL
);


ALTER TABLE bpstation_loggers OWNER TO postgres;

--
-- Name: bpstation_loggers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpstation_loggers_id_seq
    START WITH 3150
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bpstation_loggers_id_seq OWNER TO postgres;

--
-- Name: bpstation_loggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bpstation_loggers_id_seq OWNED BY bpstation_loggers.id;


--
-- Name: bpstations; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bpstations (
    id integer NOT NULL,
    process_id integer NOT NULL,
    state boolean NOT NULL,
    step integer NOT NULL,
    space integer NOT NULL,
    container_step integer[] NOT NULL,
    expand_step integer[] NOT NULL,
    spaces_ids integer[] NOT NULL,
    started boolean NOT NULL,
    finished boolean NOT NULL,
    inspace boolean NOT NULL,
    incontainer boolean NOT NULL,
    inexpands boolean NOT NULL,
    paused boolean NOT NULL,
    note character varying(254),
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    canceled boolean DEFAULT false NOT NULL,
    session_id integer NOT NULL,
    front boolean
);


ALTER TABLE bpstations OWNER TO postgres;

--
-- Name: bpstations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpstations_id_seq
    START WITH 274
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bpstations_id_seq OWNER TO postgres;

--
-- Name: bpstations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bpstations_id_seq OWNED BY bpstations.id;


--
-- Name: bpswitchers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bpswitchers (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    switch_type character varying(254) NOT NULL,
    priority integer DEFAULT 2 NOT NULL,
    state_id integer NOT NULL,
    session_state integer,
    fn character varying(254) NOT NULL,
    target character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    override_group integer DEFAULT 0 NOT NULL
);


ALTER TABLE bpswitchers OWNER TO postgres;

--
-- Name: bpswitchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpswitchers_id_seq
    START WITH 190
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bpswitchers_id_seq OWNER TO postgres;

--
-- Name: bpswitchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bpswitchers_id_seq OWNED BY bpswitchers.id;


--
-- Name: business_services; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE business_services (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    business_id integer NOT NULL,
    master_acc character varying(254) NOT NULL
);


ALTER TABLE business_services OWNER TO postgres;

--
-- Name: business_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE business_services_id_seq
    START WITH 46
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE business_services_id_seq OWNER TO postgres;

--
-- Name: business_services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE business_services_id_seq OWNED BY business_services.id;


--
-- Name: businesses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE businesses (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    phone character varying(254),
    website character varying(254),
    country character varying(254) NOT NULL,
    city character varying(254) NOT NULL,
    address character varying(254),
    walkthrough boolean NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    nickname character varying(254),
    org boolean DEFAULT false
);


ALTER TABLE businesses OWNER TO postgres;

--
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE businesses_id_seq
    START WITH 28
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE businesses_id_seq OWNER TO postgres;

--
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE businesses_id_seq OWNED BY businesses.id;


--
-- Name: cached_removed_resources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE cached_removed_resources (
    id integer NOT NULL,
    scope character varying NOT NULL,
    scope_type character varying NOT NULL,
    action character varying NOT NULL,
    what character varying NOT NULL,
    what_id character varying NOT NULL,
    date timestamp(6) without time zone NOT NULL,
    "updatedAttributes" character varying NOT NULL
);


ALTER TABLE cached_removed_resources OWNER TO postgres;

--
-- Name: cached_removed_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE cached_removed_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cached_removed_resources_id_seq OWNER TO postgres;

--
-- Name: cached_removed_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE cached_removed_resources_id_seq OWNED BY cached_removed_resources.id;


--
-- Name: client_observers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE client_observers (
    id integer NOT NULL,
    uid character varying(254) NOT NULL
);


ALTER TABLE client_observers OWNER TO postgres;

--
-- Name: client_observers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE client_observers_id_seq OWNER TO postgres;

--
-- Name: client_observers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_observers_id_seq OWNED BY client_observers.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE comments (
    id bigint NOT NULL,
    author character varying NOT NULL,
    body character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE comments OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE comments_id_seq OWNER TO postgres;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: elem_topologs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE elem_topologs (
    id integer NOT NULL,
    process_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    space_id integer
);


ALTER TABLE elem_topologs OWNER TO postgres;

--
-- Name: elem_topologs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE elem_topologs_id_seq
    START WITH 134
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE elem_topologs_id_seq OWNER TO postgres;

--
-- Name: elem_topologs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE elem_topologs_id_seq OWNED BY elem_topologs.id;


--
-- Name: element_resources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE element_resources (
    id integer NOT NULL,
    element_id integer NOT NULL,
    process_id integer NOT NULL,
    resource_id integer NOT NULL,
    entities character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE element_resources OWNER TO postgres;

--
-- Name: element_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE element_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE element_resources_id_seq OWNER TO postgres;

--
-- Name: element_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE element_resources_id_seq OWNED BY element_resources.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employees (
    id bigint NOT NULL,
    uid character varying(254) NOT NULL,
    master_acc character varying(254) NOT NULL,
    "position" character varying(254),
    manager boolean NOT NULL,
    workbench_id bigint DEFAULT 0 NOT NULL
);


ALTER TABLE employees OWNER TO postgres;

--
-- Name: employees_businesses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employees_businesses (
    employee_id integer NOT NULL,
    business_id integer NOT NULL
);


ALTER TABLE employees_businesses OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employees_id_seq
    START WITH 37
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE files (
    id bigint NOT NULL,
    workbench integer NOT NULL,
    file_name character varying NOT NULL,
    "azureId" character varying NOT NULL,
    description character varying NOT NULL,
    external boolean NOT NULL,
    external_url character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE files_id_seq OWNED BY files.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    business_id integer NOT NULL
);


ALTER TABLE groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 24
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: input_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE input_id_seq
    START WITH 264
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE input_id_seq OWNER TO postgres;

--
-- Name: input_loggers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE input_loggers (
    id integer NOT NULL,
    uid character varying(254),
    action character varying(254) NOT NULL,
    arguments text[] NOT NULL,
    reaction_id integer NOT NULL,
    input integer DEFAULT nextval('input_id_seq'::regclass) NOT NULL,
    date timestamp(6) with time zone NOT NULL,
    session_id integer NOT NULL,
    input_id integer DEFAULT nextval('input_id_seq'::regclass)
);


ALTER TABLE input_loggers OWNER TO postgres;

--
-- Name: input_loggers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE input_loggers_id_seq
    START WITH 144
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE input_loggers_id_seq OWNER TO postgres;

--
-- Name: input_loggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE input_loggers_id_seq OWNED BY input_loggers.id;


--
-- Name: launch_counters; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launch_counters (
    id bigint NOT NULL,
    process_id integer NOT NULL,
    count bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE launch_counters OWNER TO postgres;

--
-- Name: launch_counters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launch_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launch_counters_id_seq OWNER TO postgres;

--
-- Name: launch_counters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launch_counters_id_seq OWNED BY launch_counters.id;


--
-- Name: launch_files; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launch_files (
    id bigint NOT NULL,
    file_id bigint NOT NULL,
    launch_id integer NOT NULL,
    element_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE launch_files OWNER TO postgres;

--
-- Name: launch_files_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launch_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launch_files_id_seq OWNER TO postgres;

--
-- Name: launch_files_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launch_files_id_seq OWNED BY launch_files.id;


--
-- Name: launch_middlewares; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launch_middlewares (
    id bigint NOT NULL,
    session_id integer NOT NULL,
    ident character varying NOT NULL,
    iface_ident character varying NOT NULL,
    reaction_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying(30) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE launch_middlewares OWNER TO postgres;

--
-- Name: launch_middlewares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launch_middlewares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launch_middlewares_id_seq OWNER TO postgres;

--
-- Name: launch_middlewares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launch_middlewares_id_seq OWNED BY launch_middlewares.id;


--
-- Name: launch_shares; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launch_shares (
    id bigint NOT NULL,
    title integer NOT NULL,
    price integer NOT NULL,
    description character varying NOT NULL
);


ALTER TABLE launch_shares OWNER TO postgres;

--
-- Name: launch_shares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launch_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launch_shares_id_seq OWNER TO postgres;

--
-- Name: launch_shares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launch_shares_id_seq OWNED BY launch_shares.id;


--
-- Name: launch_strategies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launch_strategies (
    id bigint NOT NULL,
    session_id integer NOT NULL,
    ident character varying NOT NULL,
    middleware_id bigint NOT NULL,
    is_null_strategy boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE launch_strategies OWNER TO postgres;

--
-- Name: launch_strategies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launch_strategies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launch_strategies_id_seq OWNER TO postgres;

--
-- Name: launch_strategies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launch_strategies_id_seq OWNED BY launch_strategies.id;


--
-- Name: launch_strategy_bases; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launch_strategy_bases (
    id bigint NOT NULL,
    strategy_id bigint NOT NULL,
    key character varying NOT NULL,
    base_type character varying NOT NULL,
    value_type character varying NOT NULL,
    value_content character varying NOT NULL,
    validation_scheme character varying,
    validation_pattern character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE launch_strategy_bases OWNER TO postgres;

--
-- Name: launch_strategy_bases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launch_strategy_bases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launch_strategy_bases_id_seq OWNER TO postgres;

--
-- Name: launch_strategy_bases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launch_strategy_bases_id_seq OWNED BY launch_strategy_bases.id;


--
-- Name: launch_strategy_inputs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launch_strategy_inputs (
    id bigint NOT NULL,
    strategy_id bigint NOT NULL,
    op character varying NOT NULL,
    title character varying NOT NULL,
    "desc" character varying,
    ident character varying NOT NULL,
    target_type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE launch_strategy_inputs OWNER TO postgres;

--
-- Name: launch_strategy_inputs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launch_strategy_inputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launch_strategy_inputs_id_seq OWNER TO postgres;

--
-- Name: launch_strategy_inputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launch_strategy_inputs_id_seq OWNED BY launch_strategy_inputs.id;


--
-- Name: launch_strategy_outputs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launch_strategy_outputs (
    id bigint NOT NULL,
    strategy_id bigint NOT NULL,
    op character varying NOT NULL,
    title character varying NOT NULL,
    "desc" character varying,
    ident character varying NOT NULL,
    target_type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE launch_strategy_outputs OWNER TO postgres;

--
-- Name: launch_strategy_outputs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launch_strategy_outputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launch_strategy_outputs_id_seq OWNER TO postgres;

--
-- Name: launch_strategy_outputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launch_strategy_outputs_id_seq OWNED BY launch_strategy_outputs.id;


--
-- Name: launch_warps; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launch_warps (
    id integer NOT NULL,
    launch_id integer NOT NULL,
    launch_element_id integer,
    board_id character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE launch_warps OWNER TO postgres;

--
-- Name: launch_warps_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launch_warps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launch_warps_id_seq OWNER TO postgres;

--
-- Name: launch_warps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launch_warps_id_seq OWNED BY launch_warps.id;


--
-- Name: launches_comments; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE launches_comments (
    id bigint NOT NULL,
    comment_id bigint NOT NULL,
    launch_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE launches_comments OWNER TO postgres;

--
-- Name: launches_comments_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE launches_comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE launches_comments_id_seq OWNER TO postgres;

--
-- Name: launches_comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE launches_comments_id_seq OWNED BY launches_comments.id;


--
-- Name: logininfo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE logininfo (
    id bigint NOT NULL,
    "providerID" character varying NOT NULL,
    "providerKey" character varying NOT NULL
);


ALTER TABLE logininfo OWNER TO postgres;

--
-- Name: logininfo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE logininfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE logininfo_id_seq OWNER TO postgres;

--
-- Name: logininfo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE logininfo_id_seq OWNED BY logininfo.id;


--
-- Name: middleware_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE middleware_refs (
    id bigint NOT NULL,
    title character varying NOT NULL,
    ident character varying NOT NULL,
    iface_ident character varying NOT NULL,
    reflection_id integer NOT NULL,
    reaction_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE middleware_refs OWNER TO postgres;

--
-- Name: middleware_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE middleware_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE middleware_refs_id_seq OWNER TO postgres;

--
-- Name: middleware_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE middleware_refs_id_seq OWNED BY middleware_refs.id;


--
-- Name: middleware_statuses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE middleware_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE middleware_statuses_id_seq OWNER TO postgres;

--
-- Name: middleware_statuses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE middleware_statuses_id_seq OWNED BY action_statuses.id;


--
-- Name: middlewares; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE middlewares (
    id bigint NOT NULL,
    ident character varying NOT NULL,
    iface_ident character varying NOT NULL,
    reaction_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying(30) DEFAULT ''::character varying NOT NULL
);


ALTER TABLE middlewares OWNER TO postgres;

--
-- Name: middlewares_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE middlewares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE middlewares_id_seq OWNER TO postgres;

--
-- Name: middlewares_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE middlewares_id_seq OWNED BY middlewares.id;


--
-- Name: oauth1info; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth1info (
    id bigint NOT NULL,
    token character varying NOT NULL,
    secret character varying NOT NULL,
    "loginInfoId" bigint NOT NULL
);


ALTER TABLE oauth1info OWNER TO postgres;

--
-- Name: oauth1info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth1info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth1info_id_seq OWNER TO postgres;

--
-- Name: oauth1info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth1info_id_seq OWNED BY oauth1info.id;


--
-- Name: oauth2info; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE oauth2info (
    id bigint NOT NULL,
    accesstoken character varying NOT NULL,
    tokentype character varying,
    expiresin integer,
    refreshtoken character varying,
    logininfoid bigint NOT NULL
);


ALTER TABLE oauth2info OWNER TO postgres;

--
-- Name: oauth2info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE oauth2info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE oauth2info_id_seq OWNER TO postgres;

--
-- Name: oauth2info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE oauth2info_id_seq OWNED BY oauth2info.id;


--
-- Name: observers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE observers (
    id integer NOT NULL,
    station_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    hash_code character varying(254),
    "fullName" character varying(254) NOT NULL,
    created_at timestamp(6) with time zone
);


ALTER TABLE observers OWNER TO postgres;

--
-- Name: observers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE observers_id_seq OWNER TO postgres;

--
-- Name: observers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE observers_id_seq OWNED BY observers.id;


--
-- Name: openidattributes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE openidattributes (
    id character varying NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE openidattributes OWNER TO postgres;

--
-- Name: openidinfo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE openidinfo (
    id character varying NOT NULL,
    logininfoid bigint NOT NULL
);


ALTER TABLE openidinfo OWNER TO postgres;

--
-- Name: passwordinfo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE passwordinfo (
    hasher character varying NOT NULL,
    password character varying NOT NULL,
    salt character varying,
    "loginInfoId" bigint NOT NULL
);


ALTER TABLE passwordinfo OWNER TO postgres;

--
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plans (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    price numeric(21,2) NOT NULL,
    description character varying,
    slot_included integer DEFAULT 5 NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE plans OWNER TO postgres;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plans_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE plans_id_seq OWNER TO postgres;

--
-- Name: plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE plans_id_seq OWNED BY plans.id;


--
-- Name: proc_element_reflections; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proc_element_reflections (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    title character varying(254) NOT NULL,
    "desc" character varying(254) NOT NULL,
    b_type character varying(254) NOT NULL,
    type_title character varying(254) NOT NULL,
    ref_space_id integer,
    "order" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE proc_element_reflections OWNER TO postgres;

--
-- Name: proc_element_reflections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proc_element_reflections_id_seq
    START WITH 25
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proc_element_reflections_id_seq OWNER TO postgres;

--
-- Name: proc_element_reflections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proc_element_reflections_id_seq OWNED BY proc_element_reflections.id;


--
-- Name: proc_elements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE proc_elements (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    "desc" character varying(254) NOT NULL,
    business_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    b_type character varying(254) NOT NULL,
    type_title character varying(254) NOT NULL,
    space_id integer,
    "order" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE proc_elements OWNER TO postgres;

--
-- Name: proc_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proc_elements_id_seq
    START WITH 248
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE proc_elements_id_seq OWNER TO postgres;

--
-- Name: proc_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proc_elements_id_seq OWNED BY proc_elements.id;


--
-- Name: process_histories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE process_histories (
    id integer NOT NULL,
    master_acc character varying NOT NULL,
    action character varying NOT NULL,
    process_id integer,
    what character varying,
    what_id integer,
    date timestamp(6) with time zone NOT NULL
);


ALTER TABLE process_histories OWNER TO postgres;

--
-- Name: process_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE process_histories_id_seq
    START WITH 14
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE process_histories_id_seq OWNER TO postgres;

--
-- Name: process_histories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE process_histories_id_seq OWNED BY process_histories.id;


--
-- Name: process_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE process_permissions (
    id integer NOT NULL,
    uid character varying(254),
    group_id integer,
    bprocess integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    reaction_id integer,
    role character varying(254) NOT NULL
);


ALTER TABLE process_permissions OWNER TO postgres;

--
-- Name: process_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE process_permissions_id_seq
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE process_permissions_id_seq OWNER TO postgres;

--
-- Name: process_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE process_permissions_id_seq OWNED BY process_permissions.id;


--
-- Name: reaction_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reaction_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    autostart boolean NOT NULL,
    element_id integer NOT NULL,
    state_ref_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(254) NOT NULL
);


ALTER TABLE reaction_refs OWNER TO postgres;

--
-- Name: reaction_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reaction_refs_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reaction_refs_id_seq OWNER TO postgres;

--
-- Name: reaction_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reaction_refs_id_seq OWNED BY reaction_refs.id;


--
-- Name: reaction_state_out_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reaction_state_out_refs (
    id integer NOT NULL,
    reaction_id integer NOT NULL,
    state_ref integer NOT NULL,
    "on" boolean NOT NULL,
    on_rate integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    input boolean DEFAULT false NOT NULL
);


ALTER TABLE reaction_state_out_refs OWNER TO postgres;

--
-- Name: reaction_state_out_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reaction_state_out_refs_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reaction_state_out_refs_id_seq OWNER TO postgres;

--
-- Name: reaction_state_out_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reaction_state_out_refs_id_seq OWNED BY reaction_state_out_refs.id;


--
-- Name: reaction_state_outs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reaction_state_outs (
    id integer NOT NULL,
    reaction_id integer NOT NULL,
    state_id integer NOT NULL,
    "on" boolean NOT NULL,
    on_rate integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    input boolean DEFAULT false NOT NULL
);


ALTER TABLE reaction_state_outs OWNER TO postgres;

--
-- Name: reaction_state_outs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reaction_state_outs_id_seq
    START WITH 32
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reaction_state_outs_id_seq OWNER TO postgres;

--
-- Name: reaction_state_outs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reaction_state_outs_id_seq OWNED BY reaction_state_outs.id;


--
-- Name: reactions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reactions (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    autostart boolean NOT NULL,
    element_id integer NOT NULL,
    state_ref_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(254) NOT NULL
);


ALTER TABLE reactions OWNER TO postgres;

--
-- Name: reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reactions_id_seq
    START WITH 41
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reactions_id_seq OWNER TO postgres;

--
-- Name: reactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reactions_id_seq OWNED BY reactions.id;


--
-- Name: reflect_action_mappings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reflect_action_mappings (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    ref_action integer,
    element_action integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE reflect_action_mappings OWNER TO postgres;

--
-- Name: reflect_action_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reflect_action_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reflect_action_mappings_id_seq OWNER TO postgres;

--
-- Name: reflect_action_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reflect_action_mappings_id_seq OWNED BY reflect_action_mappings.id;


--
-- Name: reflect_element_mappings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reflect_element_mappings (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    topology_element_id integer NOT NULL,
    ref_topo_element integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE reflect_element_mappings OWNER TO postgres;

--
-- Name: reflect_element_mappings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reflect_element_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reflect_element_mappings_id_seq OWNER TO postgres;

--
-- Name: reflect_element_mappings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reflect_element_mappings_id_seq OWNED BY reflect_element_mappings.id;


--
-- Name: reflected_elem_topologs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reflected_elem_topologs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    space_id integer
);


ALTER TABLE reflected_elem_topologs OWNER TO postgres;

--
-- Name: reflected_elem_topologs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reflected_elem_topologs_id_seq
    START WITH 22
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reflected_elem_topologs_id_seq OWNER TO postgres;

--
-- Name: reflected_elem_topologs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reflected_elem_topologs_id_seq OWNED BY reflected_elem_topologs.id;


--
-- Name: refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE refs (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    host character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    "desc" character varying(254),
    category character varying(254) DEFAULT 'Common'::character varying NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE refs OWNER TO postgres;

--
-- Name: refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE refs_id_seq
    START WITH 27
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE refs_id_seq OWNER TO postgres;

--
-- Name: refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE refs_id_seq OWNED BY refs.id;


--
-- Name: resources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE resources (
    id integer NOT NULL,
    title character varying NOT NULL,
    business_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE resources OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE resources_id_seq OWNER TO postgres;

--
-- Name: resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE resources_id_seq OWNED BY resources.id;


--
-- Name: session_elem_topologs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_elem_topologs (
    id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    space_id integer
);


ALTER TABLE session_elem_topologs OWNER TO postgres;

--
-- Name: session_elem_topologs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_elem_topologs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_elem_topologs_id_seq OWNER TO postgres;

--
-- Name: session_elem_topologs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_elem_topologs_id_seq OWNED BY session_elem_topologs.id;


--
-- Name: session_element_resources; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_element_resources (
    id integer NOT NULL,
    session_element_id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    resource_id integer NOT NULL,
    entities character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE session_element_resources OWNER TO postgres;

--
-- Name: session_element_resources_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_element_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_element_resources_id_seq OWNER TO postgres;

--
-- Name: session_element_resources_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_element_resources_id_seq OWNED BY session_element_resources.id;


--
-- Name: session_initial_states; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_initial_states (
    id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    title character varying NOT NULL,
    neutral character varying NOT NULL,
    is_process_state boolean DEFAULT false NOT NULL,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    ses_front_elem_id integer,
    ses_space_elem_id integer,
    ses_space_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    lang character varying DEFAULT 'en'::character varying NOT NULL,
    middle character varying DEFAULT ''::character varying NOT NULL,
    middleable boolean DEFAULT false NOT NULL,
    oposite character varying DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL
);


ALTER TABLE session_initial_states OWNER TO postgres;

--
-- Name: session_initial_states_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_initial_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_initial_states_id_seq OWNER TO postgres;

--
-- Name: session_initial_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_initial_states_id_seq OWNED BY session_initial_states.id;


--
-- Name: session_proc_elements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_proc_elements (
    id integer NOT NULL,
    title character varying NOT NULL,
    "desc" character varying NOT NULL,
    business_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    session_id integer NOT NULL,
    b_type character varying NOT NULL,
    type_title character varying NOT NULL,
    space_id integer,
    "order" integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE session_proc_elements OWNER TO postgres;

--
-- Name: session_proc_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_proc_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_proc_elements_id_seq OWNER TO postgres;

--
-- Name: session_proc_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_proc_elements_id_seq OWNED BY session_proc_elements.id;


--
-- Name: session_reaction_state_outs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_reaction_state_outs (
    id integer NOT NULL,
    session_state_id integer NOT NULL,
    reaction_id integer NOT NULL,
    "on" boolean NOT NULL,
    on_rate integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    input boolean DEFAULT false NOT NULL
);


ALTER TABLE session_reaction_state_outs OWNER TO postgres;

--
-- Name: session_reaction_state_outs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_reaction_state_outs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_reaction_state_outs_id_seq OWNER TO postgres;

--
-- Name: session_reaction_state_outs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_reaction_state_outs_id_seq OWNED BY session_reaction_state_outs.id;


--
-- Name: session_reactions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_reactions (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    session_id integer NOT NULL,
    autostart boolean NOT NULL,
    element_id integer NOT NULL,
    state_ref_id integer,
    title character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE session_reactions OWNER TO postgres;

--
-- Name: session_reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_reactions_id_seq OWNER TO postgres;

--
-- Name: session_reactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_reactions_id_seq OWNED BY session_reactions.id;


--
-- Name: session_space_elements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_space_elements (
    id integer NOT NULL,
    title character varying NOT NULL,
    "desc" character varying NOT NULL,
    business_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    session_id integer NOT NULL,
    b_type character varying NOT NULL,
    type_title character varying NOT NULL,
    own_space_id integer,
    owned_space_id integer NOT NULL,
    space_role character varying,
    "order" integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE session_space_elements OWNER TO postgres;

--
-- Name: session_space_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_space_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_space_elements_id_seq OWNER TO postgres;

--
-- Name: session_space_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_space_elements_id_seq OWNED BY session_space_elements.id;


--
-- Name: session_spaces; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_spaces (
    id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    index integer NOT NULL,
    container boolean DEFAULT false NOT NULL,
    subbrick boolean DEFAULT false NOT NULL,
    brick_front_id integer,
    brick_nested_id integer,
    nesting_level integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE session_spaces OWNER TO postgres;

--
-- Name: session_spaces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_spaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_spaces_id_seq OWNER TO postgres;

--
-- Name: session_spaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_spaces_id_seq OWNED BY session_spaces.id;


--
-- Name: session_state_logs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_state_logs (
    id integer NOT NULL,
    session_id integer NOT NULL,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    reason character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE session_state_logs OWNER TO postgres;

--
-- Name: session_state_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_state_logs_id_seq
    START WITH 816
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_state_logs_id_seq OWNER TO postgres;

--
-- Name: session_state_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_state_logs_id_seq OWNED BY session_state_logs.id;


--
-- Name: session_switchers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_switchers (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    session_id integer NOT NULL,
    switch_type character varying NOT NULL,
    priority integer DEFAULT 2 NOT NULL,
    session_state_ref_id integer NOT NULL,
    session_state_id integer,
    fn character varying NOT NULL,
    target character varying NOT NULL,
    override_group integer DEFAULT 0 NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE session_switchers OWNER TO postgres;

--
-- Name: session_switchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_switchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE session_switchers_id_seq OWNER TO postgres;

--
-- Name: session_switchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_switchers_id_seq OWNED BY session_switchers.id;


--
-- Name: sessionstates; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sessionstates (
    id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    title character varying(254) NOT NULL,
    neutral character varying(254) NOT NULL,
    is_process_state boolean DEFAULT false NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    lang character varying(254) DEFAULT 'en'::character varying NOT NULL,
    space_id integer,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    origin_state_id integer,
    middle character varying(253) DEFAULT ''::character varying NOT NULL,
    middleable boolean DEFAULT false NOT NULL,
    oposite character varying(254) DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL,
    session_front_elem_id integer,
    session_space_id integer,
    session_space_elem_id integer
);


ALTER TABLE sessionstates OWNER TO postgres;

--
-- Name: sessionstates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sessionstates_id_seq
    START WITH 1332
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sessionstates_id_seq OWNER TO postgres;

--
-- Name: sessionstates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE sessionstates_id_seq OWNED BY sessionstates.id;


--
-- Name: space_element_reflections; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE space_element_reflections (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    title character varying(254) NOT NULL,
    "desc" character varying(254) NOT NULL,
    b_type character varying(254) NOT NULL,
    type_title character varying(254) NOT NULL,
    ref_space_id integer,
    ref_space_owned_id integer NOT NULL,
    space_role character varying(254),
    "order" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE space_element_reflections OWNER TO postgres;

--
-- Name: space_element_reflections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE space_element_reflections_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE space_element_reflections_id_seq OWNER TO postgres;

--
-- Name: space_element_reflections_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE space_element_reflections_id_seq OWNED BY space_element_reflections.id;


--
-- Name: space_elements; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE space_elements (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    "desc" character varying(254) NOT NULL,
    business_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    b_type character varying(254) NOT NULL,
    type_title character varying(254) NOT NULL,
    own_space_id integer,
    owned_space_id integer NOT NULL,
    space_role character varying(254),
    "order" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE space_elements OWNER TO postgres;

--
-- Name: space_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE space_elements_id_seq
    START WITH 56
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE space_elements_id_seq OWNER TO postgres;

--
-- Name: space_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE space_elements_id_seq OWNED BY space_elements.id;


--
-- Name: space_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE space_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    index integer NOT NULL,
    container boolean NOT NULL,
    subbrick boolean NOT NULL,
    brick_front integer,
    brick_nested integer,
    "nestingLevel" integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);


ALTER TABLE space_refs OWNER TO postgres;

--
-- Name: space_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE space_refs_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE space_refs_id_seq OWNER TO postgres;

--
-- Name: space_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE space_refs_id_seq OWNED BY space_refs.id;


--
-- Name: state_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE state_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    title character varying(254) NOT NULL,
    neutral character varying(254) NOT NULL,
    process_state boolean DEFAULT false NOT NULL,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    ref_front_elem_id integer,
    ref_space_elem_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    lang character varying(254) DEFAULT 'en'::character varying NOT NULL,
    ref_space_id integer,
    middle character varying(254) DEFAULT ''::character varying,
    middleable boolean DEFAULT false,
    oposite character varying(254) DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL
);


ALTER TABLE state_refs OWNER TO postgres;

--
-- Name: state_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE state_refs_id_seq
    START WITH 26
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE state_refs_id_seq OWNER TO postgres;

--
-- Name: state_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE state_refs_id_seq OWNED BY state_refs.id;


--
-- Name: strategies; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE strategies (
    id bigint NOT NULL,
    ident character varying NOT NULL,
    middleware_id bigint NOT NULL,
    is_null_strategy boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE strategies OWNER TO postgres;

--
-- Name: strategies_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE strategies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE strategies_id_seq OWNER TO postgres;

--
-- Name: strategies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE strategies_id_seq OWNED BY strategies.id;


--
-- Name: strategy_base_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE strategy_base_refs (
    id bigint NOT NULL,
    strategy_id bigint NOT NULL,
    key character varying NOT NULL,
    base_type character varying NOT NULL,
    value_type character varying NOT NULL,
    value_content character varying NOT NULL,
    validation_scheme character varying,
    validation_pattern character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE strategy_base_refs OWNER TO postgres;

--
-- Name: strategy_base_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE strategy_base_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE strategy_base_refs_id_seq OWNER TO postgres;

--
-- Name: strategy_base_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE strategy_base_refs_id_seq OWNED BY strategy_base_refs.id;


--
-- Name: strategy_bases; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE strategy_bases (
    id bigint NOT NULL,
    strategy_id bigint NOT NULL,
    key character varying NOT NULL,
    base_type character varying NOT NULL,
    value_type character varying NOT NULL,
    value_content character varying NOT NULL,
    validation_scheme character varying,
    validation_pattern character varying,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE strategy_bases OWNER TO postgres;

--
-- Name: strategy_bases_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE strategy_bases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE strategy_bases_id_seq OWNER TO postgres;

--
-- Name: strategy_bases_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE strategy_bases_id_seq OWNED BY strategy_bases.id;


--
-- Name: strategy_input_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE strategy_input_refs (
    id bigint NOT NULL,
    strategy_id bigint NOT NULL,
    op character varying NOT NULL,
    title character varying NOT NULL,
    "desc" character varying,
    ident character varying NOT NULL,
    target_type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE strategy_input_refs OWNER TO postgres;

--
-- Name: strategy_input_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE strategy_input_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE strategy_input_refs_id_seq OWNER TO postgres;

--
-- Name: strategy_input_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE strategy_input_refs_id_seq OWNED BY strategy_input_refs.id;


--
-- Name: strategy_inputs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE strategy_inputs (
    id bigint NOT NULL,
    strategy_id bigint NOT NULL,
    op character varying NOT NULL,
    title character varying NOT NULL,
    "desc" character varying,
    ident character varying NOT NULL,
    target_type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE strategy_inputs OWNER TO postgres;

--
-- Name: strategy_inputs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE strategy_inputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE strategy_inputs_id_seq OWNER TO postgres;

--
-- Name: strategy_inputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE strategy_inputs_id_seq OWNED BY strategy_inputs.id;


--
-- Name: strategy_output_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE strategy_output_refs (
    id bigint NOT NULL,
    strategy_id bigint NOT NULL,
    op character varying NOT NULL,
    title character varying NOT NULL,
    "desc" character varying,
    ident character varying NOT NULL,
    target_type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE strategy_output_refs OWNER TO postgres;

--
-- Name: strategy_output_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE strategy_output_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE strategy_output_refs_id_seq OWNER TO postgres;

--
-- Name: strategy_output_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE strategy_output_refs_id_seq OWNED BY strategy_output_refs.id;


--
-- Name: strategy_outputs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE strategy_outputs (
    id bigint NOT NULL,
    strategy_id bigint NOT NULL,
    op character varying NOT NULL,
    title character varying NOT NULL,
    "desc" character varying,
    ident character varying NOT NULL,
    target_type character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE strategy_outputs OWNER TO postgres;

--
-- Name: strategy_outputs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE strategy_outputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE strategy_outputs_id_seq OWNER TO postgres;

--
-- Name: strategy_outputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE strategy_outputs_id_seq OWNED BY strategy_outputs.id;


--
-- Name: strategy_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE strategy_refs (
    id bigint NOT NULL,
    ident character varying NOT NULL,
    reflection_id integer NOT NULL,
    middleware_id bigint NOT NULL,
    is_null_strategy boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE strategy_refs OWNER TO postgres;

--
-- Name: strategy_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE strategy_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE strategy_refs_id_seq OWNER TO postgres;

--
-- Name: strategy_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE strategy_refs_id_seq OWNED BY strategy_refs.id;


--
-- Name: switcher_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE switcher_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    switch_type character varying(254) NOT NULL,
    priority integer DEFAULT 2 NOT NULL,
    state_ref_id integer NOT NULL,
    fn character varying(254) NOT NULL,
    target character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    override_group integer DEFAULT 0 NOT NULL
);


ALTER TABLE switcher_refs OWNER TO postgres;

--
-- Name: switcher_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE switcher_refs_id_seq
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE switcher_refs_id_seq OWNER TO postgres;

--
-- Name: switcher_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE switcher_refs_id_seq OWNED BY switcher_refs.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tokens (
    uuid character varying(254) NOT NULL,
    email character varying(254) NOT NULL,
    "creationTime" timestamp(6) without time zone NOT NULL,
    "expirationTime" timestamp(6) without time zone NOT NULL,
    "isSignUp" boolean NOT NULL
);


ALTER TABLE tokens OWNER TO postgres;

--
-- Name: user; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE "user" (
    "userID" character varying NOT NULL,
    "firstName" character varying,
    "lastName" character varying,
    "fullName" character varying,
    email character varying,
    "avatarURL" character varying
);


ALTER TABLE "user" OWNER TO postgres;

--
-- Name: userlogininfo; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE userlogininfo (
    "userID" character varying NOT NULL,
    "loginInfoId" bigint NOT NULL
);


ALTER TABLE userlogininfo OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_group ALTER COLUMN id SET DEFAULT nextval('account_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_infos ALTER COLUMN id SET DEFAULT nextval('account_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_loggers ALTER COLUMN id SET DEFAULT nextval('account_loggers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_plans ALTER COLUMN id SET DEFAULT nextval('account_plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY action_act_results ALTER COLUMN id SET DEFAULT nextval('action_act_results_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY action_acts ALTER COLUMN id SET DEFAULT nextval('action_acts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY action_statuses ALTER COLUMN id SET DEFAULT nextval('middleware_statuses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_infos ALTER COLUMN id SET DEFAULT nextval('billing_infos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bills ALTER COLUMN id SET DEFAULT nextval('bills_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bploggers ALTER COLUMN id SET DEFAULT nextval('bploggers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bprocesses ALTER COLUMN id SET DEFAULT nextval('bprocesses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpsessions ALTER COLUMN id SET DEFAULT nextval('bpsessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpspaces ALTER COLUMN id SET DEFAULT nextval('bpspaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstaterefs ALTER COLUMN id SET DEFAULT nextval('bpstaterefs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstates ALTER COLUMN id SET DEFAULT nextval('bpstates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstation_loggers ALTER COLUMN id SET DEFAULT nextval('bpstation_loggers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstations ALTER COLUMN id SET DEFAULT nextval('bpstations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpswitchers ALTER COLUMN id SET DEFAULT nextval('bpswitchers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY business_services ALTER COLUMN id SET DEFAULT nextval('business_services_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY businesses ALTER COLUMN id SET DEFAULT nextval('businesses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY cached_removed_resources ALTER COLUMN id SET DEFAULT nextval('cached_removed_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY client_observers ALTER COLUMN id SET DEFAULT nextval('client_observers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs ALTER COLUMN id SET DEFAULT nextval('elem_topologs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY element_resources ALTER COLUMN id SET DEFAULT nextval('element_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY input_loggers ALTER COLUMN id SET DEFAULT nextval('input_loggers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_counters ALTER COLUMN id SET DEFAULT nextval('launch_counters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_files ALTER COLUMN id SET DEFAULT nextval('launch_files_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_middlewares ALTER COLUMN id SET DEFAULT nextval('launch_middlewares_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_shares ALTER COLUMN id SET DEFAULT nextval('launch_shares_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_strategies ALTER COLUMN id SET DEFAULT nextval('launch_strategies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_strategy_bases ALTER COLUMN id SET DEFAULT nextval('launch_strategy_bases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_strategy_inputs ALTER COLUMN id SET DEFAULT nextval('launch_strategy_inputs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_strategy_outputs ALTER COLUMN id SET DEFAULT nextval('launch_strategy_outputs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_warps ALTER COLUMN id SET DEFAULT nextval('launch_warps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launches_comments ALTER COLUMN id SET DEFAULT nextval('launches_comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY logininfo ALTER COLUMN id SET DEFAULT nextval('logininfo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY middleware_refs ALTER COLUMN id SET DEFAULT nextval('middleware_refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY middlewares ALTER COLUMN id SET DEFAULT nextval('middlewares_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth1info ALTER COLUMN id SET DEFAULT nextval('oauth1info_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY oauth2info ALTER COLUMN id SET DEFAULT nextval('oauth2info_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY observers ALTER COLUMN id SET DEFAULT nextval('observers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY plans ALTER COLUMN id SET DEFAULT nextval('plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proc_element_reflections ALTER COLUMN id SET DEFAULT nextval('proc_element_reflections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proc_elements ALTER COLUMN id SET DEFAULT nextval('proc_elements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_histories ALTER COLUMN id SET DEFAULT nextval('process_histories_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions ALTER COLUMN id SET DEFAULT nextval('process_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_refs ALTER COLUMN id SET DEFAULT nextval('reaction_refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_out_refs ALTER COLUMN id SET DEFAULT nextval('reaction_state_out_refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_outs ALTER COLUMN id SET DEFAULT nextval('reaction_state_outs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactions ALTER COLUMN id SET DEFAULT nextval('reactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflect_action_mappings ALTER COLUMN id SET DEFAULT nextval('reflect_action_mappings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflect_element_mappings ALTER COLUMN id SET DEFAULT nextval('reflect_element_mappings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflected_elem_topologs ALTER COLUMN id SET DEFAULT nextval('reflected_elem_topologs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY refs ALTER COLUMN id SET DEFAULT nextval('refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_elem_topologs ALTER COLUMN id SET DEFAULT nextval('session_elem_topologs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_element_resources ALTER COLUMN id SET DEFAULT nextval('session_element_resources_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_initial_states ALTER COLUMN id SET DEFAULT nextval('session_initial_states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_proc_elements ALTER COLUMN id SET DEFAULT nextval('session_proc_elements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_reaction_state_outs ALTER COLUMN id SET DEFAULT nextval('session_reaction_state_outs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_reactions ALTER COLUMN id SET DEFAULT nextval('session_reactions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_space_elements ALTER COLUMN id SET DEFAULT nextval('session_space_elements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_spaces ALTER COLUMN id SET DEFAULT nextval('session_spaces_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_state_logs ALTER COLUMN id SET DEFAULT nextval('session_state_logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_switchers ALTER COLUMN id SET DEFAULT nextval('session_switchers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessionstates ALTER COLUMN id SET DEFAULT nextval('sessionstates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_element_reflections ALTER COLUMN id SET DEFAULT nextval('space_element_reflections_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_elements ALTER COLUMN id SET DEFAULT nextval('space_elements_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_refs ALTER COLUMN id SET DEFAULT nextval('space_refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs ALTER COLUMN id SET DEFAULT nextval('state_refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategies ALTER COLUMN id SET DEFAULT nextval('strategies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_base_refs ALTER COLUMN id SET DEFAULT nextval('strategy_base_refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_bases ALTER COLUMN id SET DEFAULT nextval('strategy_bases_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_input_refs ALTER COLUMN id SET DEFAULT nextval('strategy_input_refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_inputs ALTER COLUMN id SET DEFAULT nextval('strategy_inputs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_output_refs ALTER COLUMN id SET DEFAULT nextval('strategy_output_refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_outputs ALTER COLUMN id SET DEFAULT nextval('strategy_outputs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_refs ALTER COLUMN id SET DEFAULT nextval('strategy_refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY switcher_refs ALTER COLUMN id SET DEFAULT nextval('switcher_refs_id_seq'::regclass);


--
-- Name: account_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_pkey PRIMARY KEY (id);


--
-- Name: account_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_infos
    ADD CONSTRAINT account_infos_pkey PRIMARY KEY (id);


--
-- Name: account_loggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_loggers
    ADD CONSTRAINT account_loggers_pkey PRIMARY KEY (id);


--
-- Name: account_plan_history_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT account_plan_history_pkey PRIMARY KEY (id);


--
-- Name: account_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_pkey PRIMARY KEY (id);


--
-- Name: accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY ("userId");


--
-- Name: action_act_results_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY action_act_results
    ADD CONSTRAINT action_act_results_pkey PRIMARY KEY (id);


--
-- Name: action_acts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY action_acts
    ADD CONSTRAINT action_acts_pkey PRIMARY KEY (id);


--
-- Name: billing_infos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY billing_infos
    ADD CONSTRAINT billing_infos_pkey PRIMARY KEY (id);


--
-- Name: bills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);


--
-- Name: bploggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bploggers
    ADD CONSTRAINT bploggers_pkey PRIMARY KEY (id);


--
-- Name: bprocesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_pkey PRIMARY KEY (id);


--
-- Name: bpsessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bpsessions
    ADD CONSTRAINT bpsessions_pkey PRIMARY KEY (id);


--
-- Name: bpspaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bpspaces
    ADD CONSTRAINT bpspaces_pkey PRIMARY KEY (id);


--
-- Name: bpstaterefs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_pkey PRIMARY KEY (id);


--
-- Name: bpstates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_pkey PRIMARY KEY (id);


--
-- Name: bpstation_loggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bpstation_loggers
    ADD CONSTRAINT bpstation_loggers_pkey PRIMARY KEY (id);


--
-- Name: bpstations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bpstations
    ADD CONSTRAINT bpstations_pkey PRIMARY KEY (id);


--
-- Name: bpswitchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_pkey PRIMARY KEY (id);


--
-- Name: business_services_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY business_services
    ADD CONSTRAINT business_services_pkey PRIMARY KEY (id);


--
-- Name: businesses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);


--
-- Name: cached_removed_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY cached_removed_resources
    ADD CONSTRAINT cached_removed_resources_pkey PRIMARY KEY (id);


--
-- Name: client_observers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client_observers
    ADD CONSTRAINT client_observers_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: elem_topologs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_pkey PRIMARY KEY (id);


--
-- Name: element_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY element_resources
    ADD CONSTRAINT element_resources_pkey PRIMARY KEY (id);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


--
-- Name: files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);


--
-- Name: input_loggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT input_loggers_pkey PRIMARY KEY (id);


--
-- Name: launch_counters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launch_counters
    ADD CONSTRAINT launch_counters_pkey PRIMARY KEY (id);


--
-- Name: launch_files_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launch_files
    ADD CONSTRAINT launch_files_pkey PRIMARY KEY (id);


--
-- Name: launch_middlewares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launch_middlewares
    ADD CONSTRAINT launch_middlewares_pkey PRIMARY KEY (id);


--
-- Name: launch_shares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_pkey PRIMARY KEY (id);


--
-- Name: launch_strategies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launch_strategies
    ADD CONSTRAINT launch_strategies_pkey PRIMARY KEY (id);


--
-- Name: launch_strategy_bases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launch_strategy_bases
    ADD CONSTRAINT launch_strategy_bases_pkey PRIMARY KEY (id);


--
-- Name: launch_strategy_inputs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launch_strategy_inputs
    ADD CONSTRAINT launch_strategy_inputs_pkey PRIMARY KEY (id);


--
-- Name: launch_strategy_outputs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launch_strategy_outputs
    ADD CONSTRAINT launch_strategy_outputs_pkey PRIMARY KEY (id);


--
-- Name: launch_warps_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_pkey PRIMARY KEY (id);


--
-- Name: launches_comments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY launches_comments
    ADD CONSTRAINT launches_comments_pkey PRIMARY KEY (id);


--
-- Name: logininfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY logininfo
    ADD CONSTRAINT logininfo_pkey PRIMARY KEY (id);


--
-- Name: middleware_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY middleware_refs
    ADD CONSTRAINT middleware_refs_pkey PRIMARY KEY (id);


--
-- Name: middleware_statuses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY action_statuses
    ADD CONSTRAINT middleware_statuses_pkey PRIMARY KEY (id);


--
-- Name: middlewares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY middlewares
    ADD CONSTRAINT middlewares_pkey PRIMARY KEY (id);


--
-- Name: oauth1info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth1info
    ADD CONSTRAINT oauth1info_pkey PRIMARY KEY (id);


--
-- Name: oauth2info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY oauth2info
    ADD CONSTRAINT oauth2info_pkey PRIMARY KEY (id);


--
-- Name: observers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_pkey PRIMARY KEY (id);


--
-- Name: openidinfo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY openidinfo
    ADD CONSTRAINT openidinfo_pkey PRIMARY KEY (id);


--
-- Name: plans_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);


--
-- Name: proc_element_reflections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proc_element_reflections
    ADD CONSTRAINT proc_element_reflections_pkey PRIMARY KEY (id);


--
-- Name: proc_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_pkey PRIMARY KEY (id);


--
-- Name: process_histories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY process_histories
    ADD CONSTRAINT process_histories_pkey PRIMARY KEY (id);


--
-- Name: process_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_pkey PRIMARY KEY (id);


--
-- Name: reaction_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_pkey PRIMARY KEY (id);


--
-- Name: reaction_state_out_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_pkey PRIMARY KEY (id);


--
-- Name: reaction_state_outs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_pkey PRIMARY KEY (id);


--
-- Name: reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_pkey PRIMARY KEY (id);


--
-- Name: reflect_action_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reflect_action_mappings
    ADD CONSTRAINT reflect_action_mappings_pkey PRIMARY KEY (id);


--
-- Name: reflect_element_mappings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reflect_element_mappings
    ADD CONSTRAINT reflect_element_mappings_pkey PRIMARY KEY (id);


--
-- Name: reflected_elem_topologs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_pkey PRIMARY KEY (id);


--
-- Name: refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY refs
    ADD CONSTRAINT refs_pkey PRIMARY KEY (id);


--
-- Name: refs_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY refs
    ADD CONSTRAINT refs_title_key UNIQUE (title);


--
-- Name: resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);


--
-- Name: session_elem_topologs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT session_elem_topologs_pkey PRIMARY KEY (id);


--
-- Name: session_element_resources_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT session_element_resources_pkey PRIMARY KEY (id);


--
-- Name: session_initial_states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT session_initial_states_pkey PRIMARY KEY (id);


--
-- Name: session_proc_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT session_proc_elements_pkey PRIMARY KEY (id);


--
-- Name: session_reaction_state_outs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT session_reaction_state_outs_pkey PRIMARY KEY (id);


--
-- Name: session_reactions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT session_reactions_pkey PRIMARY KEY (id);


--
-- Name: session_space_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT session_space_elements_pkey PRIMARY KEY (id);


--
-- Name: session_spaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT session_spaces_pkey PRIMARY KEY (id);


--
-- Name: session_state_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_pkey PRIMARY KEY (id);


--
-- Name: session_switchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT session_switchers_pkey PRIMARY KEY (id);


--
-- Name: sessionstates_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT sessionstates_pkey PRIMARY KEY (id);


--
-- Name: space_element_reflections_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY space_element_reflections
    ADD CONSTRAINT space_element_reflections_pkey PRIMARY KEY (id);


--
-- Name: space_elements_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_pkey PRIMARY KEY (id);


--
-- Name: space_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY space_refs
    ADD CONSTRAINT space_refs_pkey PRIMARY KEY (id);


--
-- Name: state_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_pkey PRIMARY KEY (id);


--
-- Name: strategies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY strategies
    ADD CONSTRAINT strategies_pkey PRIMARY KEY (id);


--
-- Name: strategy_base_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY strategy_base_refs
    ADD CONSTRAINT strategy_base_refs_pkey PRIMARY KEY (id);


--
-- Name: strategy_bases_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY strategy_bases
    ADD CONSTRAINT strategy_bases_pkey PRIMARY KEY (id);


--
-- Name: strategy_input_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY strategy_input_refs
    ADD CONSTRAINT strategy_input_refs_pkey PRIMARY KEY (id);


--
-- Name: strategy_inputs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY strategy_inputs
    ADD CONSTRAINT strategy_inputs_pkey PRIMARY KEY (id);


--
-- Name: strategy_output_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY strategy_output_refs
    ADD CONSTRAINT strategy_output_refs_pkey PRIMARY KEY (id);


--
-- Name: strategy_outputs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY strategy_outputs
    ADD CONSTRAINT strategy_outputs_pkey PRIMARY KEY (id);


--
-- Name: strategy_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY strategy_refs
    ADD CONSTRAINT strategy_refs_pkey PRIMARY KEY (id);


--
-- Name: switcher_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_pkey PRIMARY KEY (id);


--
-- Name: user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userID");


--
-- Name: acc_group_employee_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_group
    ADD CONSTRAINT acc_group_employee_fk FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;


--
-- Name: acc_info_current_biz_business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_infos
    ADD CONSTRAINT acc_info_current_biz_business_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: account_group_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: account_plans_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);


--
-- Name: account_plans_plan_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES plans(id) ON DELETE CASCADE;


--
-- Name: act_reaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY action_act_results
    ADD CONSTRAINT act_reaction_fk FOREIGN KEY (act_id) REFERENCES action_acts(id) ON DELETE CASCADE;


--
-- Name: act_reaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY action_statuses
    ADD CONSTRAINT act_reaction_fk FOREIGN KEY (act_id) REFERENCES action_acts(id) ON DELETE CASCADE;


--
-- Name: action_acts_reaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY action_acts
    ADD CONSTRAINT action_acts_reaction_fk FOREIGN KEY (reaction) REFERENCES session_reactions(id) ON DELETE CASCADE;


--
-- Name: action_acts_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY action_acts
    ADD CONSTRAINT action_acts_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: bill_his_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT bill_his_fk FOREIGN KEY (bill_id) REFERENCES bills(id) ON DELETE CASCADE;


--
-- Name: billing_infos_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_infos
    ADD CONSTRAINT billing_infos_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: bills_current_biz_business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_current_biz_business_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: bprocesses_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: bprocesses_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_service_id_fkey FOREIGN KEY (service_id) REFERENCES business_services(id) ON DELETE CASCADE;


--
-- Name: bpsessions_process_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpsessions
    ADD CONSTRAINT bpsessions_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bpspaces_process_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpspaces
    ADD CONSTRAINT bpspaces_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bpstaterefs_session_state_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_session_state_fkey FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;


--
-- Name: bpstaterefs_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;


--
-- Name: bpstates_front_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


--
-- Name: bpstates_process_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bpstates_space_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;


--
-- Name: bpstations_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstations
    ADD CONSTRAINT bpstations_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: bpswitchers_session_state_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_session_state_fkey FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;


--
-- Name: bpswitchers_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;


--
-- Name: business_services_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY business_services
    ADD CONSTRAINT business_services_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);


--
-- Name: commentAuthor_macc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT "commentAuthor_macc_fk" FOREIGN KEY (author) REFERENCES "user"("userID") ON DELETE CASCADE;


--
-- Name: el_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY element_resources
    ADD CONSTRAINT el_res_fk FOREIGN KEY (element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;


--
-- Name: el_res_sp_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY element_resources
    ADD CONSTRAINT el_res_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: elem_topologs_front_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


--
-- Name: elem_topologs_process_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: elem_topologs_space_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;


--
-- Name: elem_topologs_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_space_id_fkey FOREIGN KEY (space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;


--
-- Name: emp_workbench_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT emp_workbench_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: employees_businesses_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT employees_businesses_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: employees_businesses_employee_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT employees_businesses_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;


--
-- Name: groups_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: input_loggers_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT input_loggers_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: launch_counters_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_counters
    ADD CONSTRAINT launch_counters_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: launch_files_file_id_pkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_files
    ADD CONSTRAINT launch_files_file_id_pkey FOREIGN KEY (file_id) REFERENCES files(id);


--
-- Name: launch_shares_biz_business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_biz_business_fk FOREIGN KEY (price) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: launch_shares_sp_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_sp_session_fk FOREIGN KEY (title) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: launch_strategy_bases_unit_strategy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_strategy_bases
    ADD CONSTRAINT launch_strategy_bases_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES launch_strategies(id) ON DELETE CASCADE;


--
-- Name: launch_strategy_inputs_unit_strategy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_strategy_inputs
    ADD CONSTRAINT launch_strategy_inputs_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES launch_strategies(id) ON DELETE CASCADE;


--
-- Name: launch_strategy_middleware_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_strategies
    ADD CONSTRAINT launch_strategy_middleware_fk FOREIGN KEY (middleware_id) REFERENCES launch_middlewares(id) ON DELETE CASCADE;


--
-- Name: launch_strategy_outputs_unit_strategy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_strategy_outputs
    ADD CONSTRAINT launch_strategy_outputs_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES launch_strategies(id) ON DELETE CASCADE;


--
-- Name: launch_warps_comment_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launches_comments
    ADD CONSTRAINT launch_warps_comment_fk FOREIGN KEY (comment_id) REFERENCES comments(id) ON DELETE CASCADE;


--
-- Name: launch_warps_launch_elem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_launch_elem_fk FOREIGN KEY (launch_element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;


--
-- Name: launch_warps_launch_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_launch_fk FOREIGN KEY (launch_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: launch_warps_launch_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launches_comments
    ADD CONSTRAINT launch_warps_launch_fk FOREIGN KEY (launch_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: lg_b_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bploggers
    ADD CONSTRAINT lg_b_fk FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;


--
-- Name: lg_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bploggers
    ADD CONSTRAINT lg_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: middleware_reaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY middlewares
    ADD CONSTRAINT middleware_reaction_fk FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;


--
-- Name: middleware_reaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_middlewares
    ADD CONSTRAINT middleware_reaction_fk FOREIGN KEY (reaction_id) REFERENCES session_reactions(id) ON DELETE CASCADE;


--
-- Name: middleware_reaction_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_middlewares
    ADD CONSTRAINT middleware_reaction_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: middleware_reaction_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY launch_strategies
    ADD CONSTRAINT middleware_reaction_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: middleware_ref_reaction_ref_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY middleware_refs
    ADD CONSTRAINT middleware_ref_reaction_ref_fk FOREIGN KEY (reaction_id) REFERENCES reaction_refs(id) ON DELETE CASCADE;


--
-- Name: middleware_ref_reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY middleware_refs
    ADD CONSTRAINT middleware_ref_reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: middleware_ref_reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_refs
    ADD CONSTRAINT middleware_ref_reflect_fk FOREIGN KEY (middleware_id) REFERENCES middleware_refs(id) ON DELETE CASCADE;


--
-- Name: observers_bprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: observers_station_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_station_id_fkey FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;


--
-- Name: proc_element_reflections_reflection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proc_element_reflections
    ADD CONSTRAINT proc_element_reflections_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: proc_elements_bprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: proc_elements_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: process_permissions_bprocess_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_bprocess_fkey FOREIGN KEY (bprocess) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: process_permissions_front_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


--
-- Name: process_permissions_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: process_permissions_reaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;


--
-- Name: process_permissions_space_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;


--
-- Name: react_topo_s_sp_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT react_topo_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: reaction_refs_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_element_id_fkey FOREIGN KEY (element_id) REFERENCES reflected_elem_topologs(id) ON DELETE CASCADE;


--
-- Name: reaction_refs_reflection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reaction_refs_state_ref_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;


--
-- Name: reaction_state_out_refs_reaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reaction_refs(id) ON DELETE CASCADE;


--
-- Name: reaction_state_out_refs_state_ref_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_state_ref_fkey FOREIGN KEY (state_ref) REFERENCES state_refs(id) ON DELETE CASCADE;


--
-- Name: reaction_state_outs_reaction_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;


--
-- Name: reaction_state_outs_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;


--
-- Name: reactions_bprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: reactions_element_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_element_id_fkey FOREIGN KEY (element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;


--
-- Name: reactions_state_ref_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES bpstates(id) ON DELETE CASCADE;


--
-- Name: reflect_action_mappings_element_action_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflect_action_mappings
    ADD CONSTRAINT reflect_action_mappings_element_action_fk FOREIGN KEY (element_action) REFERENCES reactions(id) ON DELETE CASCADE;


--
-- Name: reflect_action_mappings_ref_action_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflect_action_mappings
    ADD CONSTRAINT reflect_action_mappings_ref_action_fk FOREIGN KEY (ref_action) REFERENCES reaction_refs(id) ON DELETE SET NULL;


--
-- Name: reflect_action_mappings_reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflect_action_mappings
    ADD CONSTRAINT reflect_action_mappings_reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reflect_element_mappings_ref_topo_element_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflect_element_mappings
    ADD CONSTRAINT reflect_element_mappings_ref_topo_element_fk FOREIGN KEY (ref_topo_element) REFERENCES reflected_elem_topologs(id) ON DELETE SET NULL;


--
-- Name: reflect_element_mappings_reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflect_element_mappings
    ADD CONSTRAINT reflect_element_mappings_reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reflect_element_mappings_topology_element_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflect_element_mappings
    ADD CONSTRAINT reflect_element_mappings_topology_element_fk FOREIGN KEY (topology_element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;


--
-- Name: reflected_elem_topologs_front_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;


--
-- Name: reflected_elem_topologs_reflection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reflected_elem_topologs_space_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;


--
-- Name: reflected_elem_topologs_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_space_id_fkey FOREIGN KEY (space_id) REFERENCES space_refs(id) ON DELETE CASCADE;


--
-- Name: res_business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY resources
    ADD CONSTRAINT res_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: res_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY element_resources
    ADD CONSTRAINT res_fk FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE;


--
-- Name: s_proc_el_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: s_proc_el_business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: s_proc_el_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: s_res_s_sp_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT s_res_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: s_res_sp_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT s_res_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: s_sp_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT s_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: s_sp_el_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: s_sp_el_business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: s_sp_el_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: s_sp_el_session_space_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_session_space_fk FOREIGN KEY (owned_space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;


--
-- Name: s_sp_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: s_st_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: s_st_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: s_st_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_state_fk FOREIGN KEY (origin_state_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;


--
-- Name: ses_el_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT ses_el_res_fk FOREIGN KEY (session_element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;


--
-- Name: ses_init_state_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: ses_init_state_procelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_procelem_fk FOREIGN KEY (ses_front_elem_id) REFERENCES session_proc_elements(id) ON DELETE CASCADE;


--
-- Name: ses_init_state_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: ses_init_state_space_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_space_fk FOREIGN KEY (ses_space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;


--
-- Name: ses_init_state_spaceelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_spaceelem_fk FOREIGN KEY (ses_space_elem_id) REFERENCES session_space_elements(id) ON DELETE CASCADE;


--
-- Name: ses_react_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: ses_react_element_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_element_fk FOREIGN KEY (element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;


--
-- Name: ses_react_out_reaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT ses_react_out_reaction_fk FOREIGN KEY (reaction_id) REFERENCES session_reactions(id) ON DELETE CASCADE;


--
-- Name: ses_react_out_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT ses_react_out_state_fk FOREIGN KEY (session_state_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;


--
-- Name: ses_react_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_state_fk FOREIGN KEY (state_ref_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;


--
-- Name: ses_res_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT ses_res_fk FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE;


--
-- Name: session_state_logs_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: session_state_logs_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_state_id_fkey FOREIGN KEY (state_id) REFERENCES sessionstates(id) ON DELETE CASCADE;


--
-- Name: space_element_reflections_reflection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_element_reflections
    ADD CONSTRAINT space_element_reflections_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: space_elements_bprocess_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: space_elements_business_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: space_elements_owned_space_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_owned_space_id_fkey FOREIGN KEY (owned_space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;


--
-- Name: space_refs_reflection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_refs
    ADD CONSTRAINT space_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: state_refs_ref_front_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_front_elem_id_fkey FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;


--
-- Name: state_refs_ref_front_elem_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_front_elem_id_fkey1 FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;


--
-- Name: state_refs_ref_space_elem_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_space_elem_id_fkey FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;


--
-- Name: state_refs_ref_space_elem_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_space_elem_id_fkey1 FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;


--
-- Name: state_refs_reflection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: strategy_base_refs_strategy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_base_refs
    ADD CONSTRAINT strategy_base_refs_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategy_refs(id) ON DELETE CASCADE;


--
-- Name: strategy_bases_unit_strategy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_bases
    ADD CONSTRAINT strategy_bases_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategies(id) ON DELETE CASCADE;


--
-- Name: strategy_input_refs_strategy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_input_refs
    ADD CONSTRAINT strategy_input_refs_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategy_refs(id) ON DELETE CASCADE;


--
-- Name: strategy_inputs_unit_strategy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_inputs
    ADD CONSTRAINT strategy_inputs_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategies(id) ON DELETE CASCADE;


--
-- Name: strategy_middleware_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategies
    ADD CONSTRAINT strategy_middleware_fk FOREIGN KEY (middleware_id) REFERENCES middlewares(id) ON DELETE CASCADE;


--
-- Name: strategy_output_refs_strategy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_output_refs
    ADD CONSTRAINT strategy_output_refs_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategy_refs(id) ON DELETE CASCADE;


--
-- Name: strategy_outputs_unit_strategy_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_outputs
    ADD CONSTRAINT strategy_outputs_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategies(id) ON DELETE CASCADE;


--
-- Name: strategy_ref_reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY strategy_refs
    ADD CONSTRAINT strategy_ref_reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: sw_s_sp_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: sw_session_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_session_state_fk FOREIGN KEY (session_state_id) REFERENCES sessionstates(id) ON DELETE CASCADE;


--
-- Name: sw_statefk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_statefk FOREIGN KEY (session_state_ref_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;


--
-- Name: switcher_refs_reflection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: switcher_refs_state_ref_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;


--
-- Name: topo_bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: topo_bpspace_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_bpspace_fk FOREIGN KEY (space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;


--
-- Name: topo_procelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_procelem_fk FOREIGN KEY (front_elem_id) REFERENCES session_proc_elements(id) ON DELETE CASCADE;


--
-- Name: topo_s_sp_session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: topo_spaceelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_spaceelem_fk FOREIGN KEY (space_elem_id) REFERENCES session_space_elements(id) ON DELETE CASCADE;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

