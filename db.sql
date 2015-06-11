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

--
-- Name: compositevalues; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE compositevalues AS (
	a_string text,
	b_string text,
	a_int bigint,
	b_int bigint,
	a_bool boolean,
	b_bool boolean
);


ALTER TYPE public.compositevalues OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: account_group; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_group (
    id integer NOT NULL,
    account_id character varying(254) NOT NULL,
    group_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.account_group OWNER TO postgres;

--
-- Name: account_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_group_id_seq OWNER TO postgres;

--
-- Name: account_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_group_id_seq OWNED BY account_group.id;


--
-- Name: account_loggers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_loggers (
    id integer NOT NULL,
    ip character varying(254) NOT NULL,
    user_agent character varying(254) NOT NULL,
    email character varying(254),
    date timestamp with time zone NOT NULL
);


ALTER TABLE public.account_loggers OWNER TO postgres;

--
-- Name: account_loggers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_loggers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_loggers_id_seq OWNER TO postgres;

--
-- Name: account_loggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_loggers_id_seq OWNED BY account_loggers.id;


--
-- Name: account_plans; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE account_plans (
    id integer NOT NULL,
    business_id integer,
    master_acc character varying(254) NOT NULL,
    plan_id integer NOT NULL,
    expired_at timestamp with time zone NOT NULL
);


ALTER TABLE public.account_plans OWNER TO postgres;

--
-- Name: account_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_plans_id_seq OWNER TO postgres;

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
    nickname character varying(254)
);


ALTER TABLE public.accounts OWNER TO postgres;

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
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.billing_infos OWNER TO postgres;

--
-- Name: billing_infos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE billing_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.billing_infos_id_seq OWNER TO postgres;

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
    assigned timestamp with time zone NOT NULL,
    approved boolean NOT NULL
);


ALTER TABLE public.bills OWNER TO postgres;

--
-- Name: bills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bills_id_seq OWNER TO postgres;

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
    date timestamp with time zone NOT NULL,
    step integer NOT NULL
);


ALTER TABLE public.bploggers OWNER TO postgres;

--
-- Name: bploggers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bploggers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bploggers_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    version bigint DEFAULT 1 NOT NULL,
    state_machine_type character varying(40) DEFAULT 'base'::character varying NOT NULL
);


ALTER TABLE public.bprocesses OWNER TO postgres;

--
-- Name: bprocesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bprocesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bprocesses_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    active_listed boolean DEFAULT false NOT NULL
);


ALTER TABLE public.bpsessions OWNER TO postgres;

--
-- Name: bpsessions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpsessions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bpsessions_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.bpspaces OWNER TO postgres;

--
-- Name: bpspaces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpspaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bpspaces_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.bpstaterefs OWNER TO postgres;

--
-- Name: bpstaterefs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpstaterefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bpstaterefs_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    lang character varying(254) DEFAULT 'en'::character varying NOT NULL,
    space_id integer,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    middle character varying(254) DEFAULT ''::character varying,
    middleable boolean DEFAULT false,
    oposite character varying(254) DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL
);


ALTER TABLE public.bpstates OWNER TO postgres;

--
-- Name: bpstates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpstates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bpstates_id_seq OWNER TO postgres;

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
    date timestamp with time zone NOT NULL,
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


ALTER TABLE public.bpstation_loggers OWNER TO postgres;

--
-- Name: bpstation_loggers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpstation_loggers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bpstation_loggers_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    canceled boolean DEFAULT false NOT NULL,
    session_id integer NOT NULL,
    front boolean
);


ALTER TABLE public.bpstations OWNER TO postgres;

--
-- Name: bpstations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpstations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bpstations_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    override_group integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.bpswitchers OWNER TO postgres;

--
-- Name: bpswitchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bpswitchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bpswitchers_id_seq OWNER TO postgres;

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


ALTER TABLE public.business_services OWNER TO postgres;

--
-- Name: business_services_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE business_services_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.business_services_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    nickname character varying(254)
);


ALTER TABLE public.businesses OWNER TO postgres;

--
-- Name: businesses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE businesses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.businesses_id_seq OWNER TO postgres;

--
-- Name: businesses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE businesses_id_seq OWNED BY businesses.id;


--
-- Name: client_observers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE client_observers (
    id integer NOT NULL,
    uid character varying(254) NOT NULL
);


ALTER TABLE public.client_observers OWNER TO postgres;

--
-- Name: client_observers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE client_observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.client_observers_id_seq OWNER TO postgres;

--
-- Name: client_observers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE client_observers_id_seq OWNED BY client_observers.id;


--
-- Name: elem_topologs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE elem_topologs (
    id integer NOT NULL,
    process_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying(254) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    space_id integer
);


ALTER TABLE public.elem_topologs OWNER TO postgres;

--
-- Name: elem_topologs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE elem_topologs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.elem_topologs_id_seq OWNER TO postgres;

--
-- Name: elem_topologs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE elem_topologs_id_seq OWNED BY elem_topologs.id;


--
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employees (
    id integer NOT NULL,
    uid character varying(254) NOT NULL,
    master_acc character varying(254) NOT NULL,
    "position" character varying(254),
    manager boolean NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- Name: employees_businesses; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE employees_businesses (
    employee_id integer NOT NULL,
    business_id integer NOT NULL
);


ALTER TABLE public.employees_businesses OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE employees_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.employees_id_seq OWNER TO postgres;

--
-- Name: employees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE employees_id_seq OWNED BY employees.id;


--
-- Name: groups; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE groups (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone NOT NULL,
    business_id integer NOT NULL
);


ALTER TABLE public.groups OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.groups_id_seq OWNER TO postgres;

--
-- Name: groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE groups_id_seq OWNED BY groups.id;


--
-- Name: input_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE input_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.input_id_seq OWNER TO postgres;

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
    date timestamp with time zone NOT NULL,
    session_id integer NOT NULL,
    input_id integer DEFAULT nextval('input_id_seq'::regclass)
);


ALTER TABLE public.input_loggers OWNER TO postgres;

--
-- Name: input_loggers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE input_loggers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.input_loggers_id_seq OWNER TO postgres;

--
-- Name: input_loggers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE input_loggers_id_seq OWNED BY input_loggers.id;


--
-- Name: observers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE observers (
    id integer NOT NULL,
    station_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    hash_code character varying(254),
    "fullName" character varying(254) NOT NULL,
    created_at timestamp with time zone
);


ALTER TABLE public.observers OWNER TO postgres;

--
-- Name: observers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observers_id_seq OWNER TO postgres;

--
-- Name: observers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE observers_id_seq OWNED BY observers.id;


--
-- Name: plans; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE plans (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    price numeric(21,2) NOT NULL
);


ALTER TABLE public.plans OWNER TO postgres;

--
-- Name: plans_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plans_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.proc_element_reflections OWNER TO postgres;

--
-- Name: proc_element_reflections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proc_element_reflections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proc_element_reflections_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.proc_elements OWNER TO postgres;

--
-- Name: proc_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE proc_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proc_elements_id_seq OWNER TO postgres;

--
-- Name: proc_elements_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE proc_elements_id_seq OWNED BY proc_elements.id;


--
-- Name: process_histories; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE process_histories (
    id integer NOT NULL,
    master_acc character varying(254) NOT NULL,
    process_id integer NOT NULL,
    action character varying(254) NOT NULL,
    date timestamp with time zone NOT NULL,
    what character varying(254)
);


ALTER TABLE public.process_histories OWNER TO postgres;

--
-- Name: process_histories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE process_histories_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.process_histories_id_seq OWNER TO postgres;

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


ALTER TABLE public.process_permissions OWNER TO postgres;

--
-- Name: process_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE process_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.process_permissions_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone NOT NULL,
    title character varying(254) NOT NULL
);


ALTER TABLE public.reaction_refs OWNER TO postgres;

--
-- Name: reaction_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reaction_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reaction_refs_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reaction_state_out_refs OWNER TO postgres;

--
-- Name: reaction_state_out_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reaction_state_out_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reaction_state_out_refs_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.reaction_state_outs OWNER TO postgres;

--
-- Name: reaction_state_outs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reaction_state_outs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reaction_state_outs_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone NOT NULL,
    title character varying(254) NOT NULL
);


ALTER TABLE public.reactions OWNER TO postgres;

--
-- Name: reactions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reactions_id_seq OWNER TO postgres;

--
-- Name: reactions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reactions_id_seq OWNED BY reactions.id;


--
-- Name: reflected_elem_topologs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reflected_elem_topologs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying(254) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    space_id integer
);


ALTER TABLE public.reflected_elem_topologs OWNER TO postgres;

--
-- Name: reflected_elem_topologs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reflected_elem_topologs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reflected_elem_topologs_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    "desc" character varying(254),
    category character varying(254) DEFAULT 'Common'::character varying NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);


ALTER TABLE public.refs OWNER TO postgres;

--
-- Name: refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.refs_id_seq OWNER TO postgres;

--
-- Name: refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE refs_id_seq OWNED BY refs.id;


--
-- Name: session_state_logs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE session_state_logs (
    id integer NOT NULL,
    session_id integer NOT NULL,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    reason character varying(254) NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone NOT NULL,
    state_id integer NOT NULL
);


ALTER TABLE public.session_state_logs OWNER TO postgres;

--
-- Name: session_state_logs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE session_state_logs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.session_state_logs_id_seq OWNER TO postgres;

--
-- Name: session_state_logs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE session_state_logs_id_seq OWNED BY session_state_logs.id;


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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    lang character varying(254) DEFAULT 'en'::character varying NOT NULL,
    space_id integer,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    origin_state_id integer,
    middle character varying(253) DEFAULT ''::character varying NOT NULL,
    middleable boolean DEFAULT false NOT NULL,
    oposite character varying(254) DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL
);


ALTER TABLE public.sessionstates OWNER TO postgres;

--
-- Name: sessionstates_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sessionstates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sessionstates_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.space_element_reflections OWNER TO postgres;

--
-- Name: space_element_reflections_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE space_element_reflections_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_element_reflections_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.space_elements OWNER TO postgres;

--
-- Name: space_elements_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE space_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_elements_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);


ALTER TABLE public.space_refs OWNER TO postgres;

--
-- Name: space_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE space_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_refs_id_seq OWNER TO postgres;

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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    lang character varying(254) DEFAULT 'en'::character varying NOT NULL,
    ref_space_id integer,
    middle character varying(254) DEFAULT ''::character varying,
    middleable boolean DEFAULT false,
    oposite character varying(254) DEFAULT ''::character varying NOT NULL,
    opositable boolean DEFAULT false NOT NULL
);


ALTER TABLE public.state_refs OWNER TO postgres;

--
-- Name: state_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE state_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.state_refs_id_seq OWNER TO postgres;

--
-- Name: state_refs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE state_refs_id_seq OWNED BY state_refs.id;


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
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    override_group integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.switcher_refs OWNER TO postgres;

--
-- Name: switcher_refs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE switcher_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.switcher_refs_id_seq OWNER TO postgres;

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
    "creationTime" timestamp without time zone NOT NULL,
    "expirationTime" timestamp without time zone NOT NULL,
    "isSignUp" boolean NOT NULL
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_group ALTER COLUMN id SET DEFAULT nextval('account_group_id_seq'::regclass);


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

ALTER TABLE ONLY client_observers ALTER COLUMN id SET DEFAULT nextval('client_observers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs ALTER COLUMN id SET DEFAULT nextval('elem_topologs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);


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

ALTER TABLE ONLY reflected_elem_topologs ALTER COLUMN id SET DEFAULT nextval('reflected_elem_topologs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY refs ALTER COLUMN id SET DEFAULT nextval('refs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_state_logs ALTER COLUMN id SET DEFAULT nextval('session_state_logs_id_seq'::regclass);


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

ALTER TABLE ONLY switcher_refs ALTER COLUMN id SET DEFAULT nextval('switcher_refs_id_seq'::regclass);


--
-- Data for Name: account_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_group (id, account_id, group_id, created_at, updated_at) FROM stdin;
3	iamjacke@gmail.com	1	2015-05-20 11:29:30.788+06	2015-05-20 11:29:30.788+06
\.


--
-- Name: account_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_group_id_seq', 3, true);


--
-- Data for Name: account_loggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_loggers (id, ip, user_agent, email, date) FROM stdin;
1	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-14 18:22:01.561+06
2	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-14 18:22:01.877+06
3	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-15 02:27:38.299+06
4	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-15 02:27:39.338+06
5	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-15 03:24:02.355+06
6	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-15 03:24:04.361+06
7	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-15 03:24:40.037+06
8	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-15 03:24:40.306+06
9	31.207.166.23	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36 OPR/26.0.1656.32	\N	2014-12-15 17:28:06.815+06
10	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-15 19:42:31.011+06
11	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-15 19:42:31.153+06
12	31.207.166.150	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36 OPR/26.0.1656.32	\N	2014-12-16 05:18:10.761+06
13	31.207.166.150	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36 OPR/26.0.1656.32	juices.woo@gmail.com	2014-12-16 05:18:11.045+06
14	31.207.166.150	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36 OPR/26.0.1656.32	\N	2014-12-16 05:18:12.183+06
15	31.207.166.150	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.65 Safari/537.36 OPR/26.0.1656.32	juices.woo@gmail.com	2014-12-16 05:18:12.222+06
16	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-17 02:05:26.465+06
17	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-17 02:05:26.714+06
18	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-17 02:16:14.897+06
19	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-17 02:16:15.114+06
20	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-17 21:01:44.594+06
21	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-17 21:01:44.839+06
22	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-17 22:09:18.334+06
23	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-17 22:09:18.579+06
24	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-17 22:31:06.868+06
25	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-17 22:31:07.13+06
26	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-17 22:33:59.958+06
27	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-17 22:34:00.242+06
28	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-17 22:39:56.997+06
29	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-17 22:39:57.294+06
30	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-17 22:44:09.553+06
31	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-17 22:44:09.822+06
32	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-17 22:54:14.845+06
33	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-17 22:54:15.098+06
34	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-18 05:57:57.544+06
35	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-18 05:57:57.772+06
36	31.207.168.4	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-18 14:54:34.33+06
37	31.207.168.4	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-18 14:54:34.505+06
38	31.207.168.4	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-18 14:54:34.697+06
39	31.207.168.4	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-18 14:54:34.731+06
40	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-19 06:32:14.251+06
41	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-19 06:32:14.524+06
42	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-19 06:37:57.766+06
43	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-19 06:37:58.041+06
44	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-19 07:48:07.093+06
45	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-19 07:48:07.308+06
46	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-20 07:34:05.951+06
47	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-20 07:34:06.265+06
48	31.207.170.198	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-20 16:28:55.433+06
49	31.207.170.198	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-20 16:28:55.606+06
50	31.207.170.198	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-20 21:40:10.747+06
51	31.207.170.198	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-20 21:40:10.921+06
52	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-20 21:43:14.385+06
53	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-20 21:43:14.52+06
54	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-21 05:27:42.119+06
55	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-21 05:27:42.409+06
56	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-21 06:26:48.652+06
57	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-21 06:26:48.861+06
58	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-21 10:08:29.57+06
59	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-21 10:08:29.851+06
60	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-21 10:10:30.232+06
61	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-21 10:10:30.498+06
62	31.207.172.97	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-21 10:17:42.265+06
63	31.207.172.97	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-21 10:17:42.446+06
64	31.207.172.97	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-21 21:28:04.132+06
65	31.207.172.97	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-21 21:28:04.338+06
66	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-21 22:03:43.208+06
67	37.113.169.15	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-21 22:03:43.436+06
68	31.207.172.97	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-21 22:07:13.541+06
69	31.207.172.97	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-21 22:07:13.716+06
70	94.181.5.84	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-22 03:50:35.776+06
71	94.181.5.84	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-22 03:50:36.068+06
72	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-22 06:11:24.723+06
73	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-22 06:11:24.979+06
74	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-22 06:49:55.418+06
75	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-22 06:49:55.642+06
76	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-22 07:08:55.088+06
77	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	juices.woo@gmail.com	2014-12-22 07:08:55.325+06
78	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-23 07:15:19.395+06
79	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-23 07:15:19.627+06
80	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-23 07:54:24.361+06
81	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-23 07:54:24.58+06
82	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-23 08:02:04.516+06
83	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-23 08:02:04.777+06
84	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-23 08:08:07.762+06
85	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-23 08:08:08.024+06
86	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-23 08:17:28.438+06
87	94.181.4.250	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-23 08:17:28.651+06
88	109.191.115.9	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-24 01:05:44.396+06
89	109.191.115.9	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-24 01:05:44.703+06
90	37.113.146.252	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-24 15:01:23.503+06
91	37.113.146.252	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-24 15:01:23.753+06
328	127.0.0.1		S.Ypps@example.com	2015-04-20 11:52:15.949+06
92	37.113.146.252	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-25 07:30:08.096+06
93	37.113.146.252	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-25 07:30:08.253+06
94	37.113.146.252	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-25 07:34:18.71+06
95	37.113.146.252	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-25 07:34:18.882+06
96	37.113.146.252	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-25 07:51:06.877+06
97	37.113.146.252	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-25 07:51:07.307+06
98	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-26 13:12:47.856+06
99	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-26 13:12:48.224+06
100	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-26 13:14:11.394+06
101	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-26 13:14:11.575+06
102	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-26 14:36:04.732+06
103	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-26 14:36:05.03+06
104	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-26 14:48:05.664+06
105	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-26 14:48:05.923+06
106	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-26 17:58:07.848+06
107	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-26 17:58:08.419+06
108	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-26 18:09:22.268+06
109	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-26 18:09:22.886+06
110	109.191.115.199	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-26 18:45:09.167+06
111	109.191.115.199	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-26 18:45:09.419+06
112	31.207.164.190	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-27 02:57:23.367+06
113	31.207.164.190	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-27 02:57:23.804+06
114	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-27 23:33:38.659+06
115	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-27 23:33:39.063+06
116	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 02:01:23.85+06
117	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 02:01:24.202+06
118	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 02:04:53.691+06
119	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 02:04:53.939+06
120	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 03:33:40.681+06
121	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 03:33:40.976+06
122	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 03:43:25.029+06
123	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 03:43:25.425+06
124	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 03:48:30.065+06
125	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 03:48:30.424+06
126	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 03:53:27.682+06
127	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 03:53:28.031+06
128	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 04:05:38.746+06
129	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 04:05:39.14+06
130	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 04:10:59.947+06
131	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 04:11:00.329+06
132	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 04:53:19.867+06
133	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 04:53:20.233+06
134	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 04:53:20.277+06
135	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 04:53:20.637+06
136	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 05:50:50.891+06
137	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 05:50:51.22+06
138	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2014-12-28 06:06:25.449+06
139	37.113.171.51	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2014-12-28 06:06:25.799+06
140	109.191.122.45	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	\N	2014-12-28 12:03:14.096+06
141	109.191.122.45	Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36 OPR/26.0.1656.60	juices.woo@gmail.com	2014-12-28 12:03:14.295+06
142	37.113.145.109	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-07 07:20:12.633+06
143	37.113.145.109	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-07 07:20:13.101+06
144	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-10 05:49:07.788+06
145	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-10 05:49:08.074+06
146	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-11 04:00:49.833+06
147	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-11 04:00:50.214+06
148	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-11 08:42:57.698+06
149	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-11 08:42:58.04+06
150	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-11 08:48:44.647+06
151	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-11 08:48:45.042+06
152	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-11 08:48:45.763+06
153	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-11 08:48:45.819+06
154	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-11 08:50:26.774+06
155	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-11 08:50:27.143+06
156	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-11 08:50:43.559+06
157	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-11 08:50:43.939+06
158	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-13 06:23:04.042+06
159	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-13 06:23:04.408+06
160	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-13 07:15:23.018+06
161	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-13 07:15:23.388+06
162	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-13 07:17:45.872+06
163	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-13 07:17:46.24+06
164	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	\N	2015-01-13 07:24:47.849+06
165	94.181.26.62	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.95 Safari/537.36	iamjacke@gmail.com	2015-01-13 07:24:48.174+06
166	94.181.38.138	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36	\N	2015-01-21 06:55:40.328+06
167	94.181.38.138	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36	iamjacke@gmail.com	2015-01-21 06:55:40.668+06
168	94.181.38.138	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36	\N	2015-01-21 07:12:54.596+06
169	94.181.38.138	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36	iamjacke@gmail.com	2015-01-21 07:12:55.003+06
170	37.113.138.185	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36	\N	2015-01-22 16:36:18.234+06
171	37.113.138.185	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.99 Safari/537.36	iamjacke@gmail.com	2015-01-22 16:36:18.581+06
172	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36	\N	2015-01-29 07:46:46.449+06
173	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36	iamjacke@gmail.com	2015-01-29 07:46:47.816+06
174	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36	\N	2015-01-30 05:56:38.481+06
175	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.93 Safari/537.36	iamjacke@gmail.com	2015-01-30 05:56:40.547+06
176	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	\N	2015-02-11 06:50:47.772+06
177	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	\N	2015-02-11 06:50:53.085+06
178	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	\N	2015-02-11 06:51:08.403+06
179	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	iamjacke@gmail.com	2015-02-11 06:51:10.26+06
180	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.94 Safari/537.36 OPR/27.0.1689.66	\N	2015-02-11 07:06:34.135+06
181	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.94 Safari/537.36 OPR/27.0.1689.66	iamjacke@gmail.com	2015-02-11 07:06:34.725+06
182	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	\N	2015-02-11 07:19:56.655+06
183	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	iamjacke@gmail.com	2015-02-11 07:19:57.351+06
329	127.0.0.1		\N	2015-04-20 11:55:48.897+06
184	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	\N	2015-02-11 07:22:49.559+06
185	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	iamjacke@gmail.com	2015-02-11 07:22:50.297+06
186	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	\N	2015-02-11 07:24:55.899+06
187	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.111 Safari/537.36	iamjacke@gmail.com	2015-02-11 07:24:56.599+06
189	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-02-23 06:13:26.906+06
188	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-02-23 06:13:26.82+06
190	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-02-23 06:13:28.374+06
191	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-02-23 06:13:28.596+06
192	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-02-27 06:33:14.208+06
193	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-02-27 06:33:15.204+06
194	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-12 19:33:49.475+06
195	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-12 19:33:49.546+06
196	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-12 19:33:51.492+06
197	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-12 19:33:51.585+06
198	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-12 20:47:01.884+06
199	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-12 20:47:03.621+06
200	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-12 20:51:40.858+06
201	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-12 20:51:42.197+06
202	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-12 20:55:14.644+06
203	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-12 20:55:16.054+06
204	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-12 21:00:03.875+06
205	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-12 21:00:04.887+06
206	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-12 21:42:52.867+06
207	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-12 21:42:53.665+06
208	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-14 03:40:45.547+06
209	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-14 03:40:47.401+06
210	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-14 03:43:14.96+06
211	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-14 03:43:15.689+06
212	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-14 04:39:27.755+06
213	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-14 04:39:28.8+06
214	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-14 04:42:41.173+06
215	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-14 04:42:41.821+06
216	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-14 05:10:30.441+06
217	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-14 05:10:31.349+06
218	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	\N	2015-03-14 10:08:37.129+06
219	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/40.0.2214.115 Safari/537.36	iamjacke@gmail.com	2015-03-14 10:08:38.128+06
220	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	\N	2015-03-21 16:23:04.27+06
221	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	iamjacke@gmail.com	2015-03-21 16:23:06.627+06
222	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	\N	2015-03-21 23:54:52.077+06
223	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	iamjacke@gmail.com	2015-03-21 23:54:53.31+06
224	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	\N	2015-03-22 00:34:19.644+06
225	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	iamjacke@gmail.com	2015-03-22 00:34:20.422+06
226	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	\N	2015-03-22 02:22:43.378+06
227	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	iamjacke@gmail.com	2015-03-22 02:22:44.935+06
228	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	\N	2015-03-22 03:55:11.015+06
229	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.89 Safari/537.36	iamjacke@gmail.com	2015-03-22 03:55:12.331+06
231	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-22 20:02:11.304+06
382	127.0.0.1		\N	2015-04-28 20:50:22.105+06
230	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-22 20:02:11.31+06
232	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-22 20:02:12.34+06
233	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-22 20:02:12.444+06
234	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-22 20:59:50.573+06
235	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-22 20:59:51.623+06
236	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-22 21:06:12.149+06
237	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-22 21:06:13.049+06
238	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-23 08:05:10.736+06
239	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-23 08:05:12.595+06
240	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-25 02:22:03.723+06
241	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-25 02:22:10.057+06
242	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-26 04:34:09.702+06
243	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-26 04:34:12.989+06
244	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-31 11:49:11.122+06
245	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-31 11:49:12.515+06
246	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-31 11:54:59.107+06
247	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-31 11:54:59.902+06
248	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-31 11:58:55.317+06
249	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-31 11:58:56.149+06
250	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-31 13:25:47.436+06
251	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-31 13:25:48.653+06
252	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-31 14:11:39.795+06
253	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-31 14:11:40.607+06
254	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-31 16:23:39.942+06
255	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-31 16:23:41.034+06
256	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-03-31 16:40:50.746+06
257	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-03-31 16:40:51.613+06
258	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-04-01 03:28:30.464+06
259	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-04-01 03:28:31.807+06
260	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-04-01 03:43:11.423+06
261	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-04-01 03:43:13.557+06
262	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-04-03 19:38:24.398+06
263	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-04-03 19:38:25.318+06
264	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	\N	2015-04-03 19:43:01.139+06
265	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.101 Safari/537.36	iamjacke@gmail.com	2015-04-03 19:43:01.931+06
266	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-10 06:50:48.162+06
267	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-10 06:50:49.372+06
268	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-13 18:40:12.371+06
269	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-13 18:40:13.313+06
270	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-15 04:18:19.193+06
271	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-15 04:18:20.11+06
272	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-15 04:34:51.304+06
273	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-15 04:34:51.777+06
274	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-15 04:45:24.441+06
275	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-15 04:45:25.046+06
276	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 03:38:08.003+06
277	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 03:38:09.756+06
278	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 03:57:02.249+06
279	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 03:57:04.587+06
280	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 04:30:10.09+06
281	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 04:30:11.129+06
282	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 05:56:11.643+06
283	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 05:56:14.871+06
284	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 06:20:49.082+06
285	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 06:20:49.875+06
286	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 06:26:55.878+06
287	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 06:26:56.753+06
288	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 06:53:33.788+06
289	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 06:53:34.339+06
290	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 06:55:22.624+06
291	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 06:55:23.269+06
292	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 11:36:45.599+06
293	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 11:36:46.363+06
294	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-16 11:56:23.356+06
295	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-16 11:56:23.966+06
296	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-17 05:59:38.616+06
297	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-17 05:59:39.746+06
298	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 04:46:07.62+06
299	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 04:46:08.834+06
300	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 05:02:06.787+06
301	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 05:02:07.431+06
302	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 05:07:57.025+06
303	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 05:07:57.651+06
304	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 05:25:23.087+06
305	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 05:25:23.812+06
306	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 05:29:27.272+06
307	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 05:29:28.102+06
308	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 05:31:50.886+06
309	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 05:31:51.877+06
310	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 05:34:10.356+06
311	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 05:34:11.03+06
312	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 05:36:08.964+06
313	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 05:36:09.676+06
314	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 06:18:39.941+06
315	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 06:18:41.255+06
316	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 06:30:25.148+06
317	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 06:30:25.975+06
318	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 06:33:15.073+06
319	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 06:33:15.68+06
320	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-18 06:42:15.465+06
321	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-18 06:42:16.796+06
322	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-19 06:15:03.357+06
323	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-19 06:15:07.936+06
324	127.0.0.1		\N	2015-04-19 22:12:27.376+06
325	127.0.0.1		\N	2015-04-20 09:47:54.186+06
326	127.0.0.1		S.Vkd@example.com	2015-04-20 09:47:54.841+06
327	127.0.0.1		\N	2015-04-20 11:52:05.697+06
330	127.0.0.1		V.Ybjpkdkorao@example.com	2015-04-20 11:55:50.036+06
331	127.0.0.1		\N	2015-04-20 12:07:25.48+06
332	127.0.0.1		J.Tuvrwjltww@example.com	2015-04-20 12:07:26.262+06
333	127.0.0.1		\N	2015-04-20 22:21:28.917+06
334	127.0.0.1		D.Zm@example.com	2015-04-20 22:21:30.787+06
335	127.0.0.1		\N	2015-04-20 22:49:08.522+06
336	127.0.0.1		E.Jzlwvi@example.com	2015-04-20 22:49:10.35+06
337	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-22 09:17:02.64+06
338	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-22 09:17:06.958+06
339	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-22 10:26:19.51+06
340	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-22 10:26:23.261+06
341	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-22 12:24:11.635+06
342	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-22 12:24:14.229+06
343	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-22 12:28:52.712+06
344	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-22 12:28:53.646+06
345	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-22 12:30:11.895+06
346	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-22 12:30:12.666+06
347	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-22 13:03:26.343+06
348	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-22 13:03:30.694+06
349	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-22 13:23:01.915+06
350	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-22 13:23:05.658+06
351	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-22 14:47:32.801+06
352	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-22 14:47:34.254+06
353	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-22 20:09:17.416+06
354	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-22 20:09:21.917+06
355	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-23 14:21:37.154+06
356	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-23 14:21:38.465+06
357	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-23 18:53:18.098+06
358	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-23 18:53:20.141+06
359	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-23 20:09:44.555+06
360	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-23 20:09:45.55+06
361	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-23 20:20:25.53+06
362	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-23 20:20:26.6+06
363	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	\N	2015-04-23 20:37:08.689+06
364	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/41.0.2272.118 Safari/537.36	iamjacke@gmail.com	2015-04-23 20:37:09.327+06
365	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-04-23 23:38:47.286+06
366	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-04-23 23:38:48.498+06
367	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-04-24 23:43:48.661+06
368	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-04-24 23:43:49.95+06
369	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-04-25 03:00:06.733+06
370	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-04-25 03:00:07.986+06
371	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-04-26 03:59:30.073+06
372	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-04-26 03:59:31.909+06
373	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-04-26 16:24:32.817+06
374	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-04-26 16:24:33.827+06
375	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-04-26 18:38:08.198+06
376	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-04-26 18:38:36.092+06
377	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-04-26 18:38:36.991+06
378	127.0.0.1		\N	2015-04-28 03:29:54.426+06
379	127.0.0.1		B.Ph@example.com	2015-04-28 03:29:56.345+06
380	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-04-28 03:45:38.889+06
381	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-04-28 03:45:40.581+06
383	127.0.0.1		W.Mzxfzod@example.com	2015-04-28 20:50:23.642+06
384	127.0.0.1		\N	2015-04-28 20:55:04.25+06
385	127.0.0.1		L.Btucabz@example.com	2015-04-28 20:55:05.376+06
386	127.0.0.1		\N	2015-04-28 20:57:29.61+06
387	127.0.0.1		H.Ci@example.com	2015-04-28 20:57:31.658+06
388	127.0.0.1		\N	2015-04-28 21:08:50.94+06
389	127.0.0.1		K.La@example.com	2015-04-28 21:09:00+06
390	127.0.0.1		\N	2015-04-28 21:12:16.901+06
391	127.0.0.1		Z.Cnzjxooh@example.com	2015-04-28 21:12:20.951+06
392	127.0.0.1		\N	2015-04-28 21:14:54.668+06
393	127.0.0.1		G.Izuymc@example.com	2015-04-28 21:14:58.132+06
394	127.0.0.1		\N	2015-04-28 21:27:03.931+06
395	127.0.0.1		W.Ffk@example.com	2015-04-28 21:27:06.356+06
396	127.0.0.1		\N	2015-04-28 21:38:03.88+06
397	127.0.0.1		R.Peht@example.com	2015-04-28 21:38:04.709+06
398	127.0.0.1		\N	2015-04-28 21:46:30.023+06
399	127.0.0.1		N.As@example.com	2015-04-28 21:46:32.117+06
400	127.0.0.1		\N	2015-04-28 22:14:31.688+06
401	127.0.0.1		B.Olxxo@example.com	2015-04-28 22:14:33.841+06
402	127.0.0.1		\N	2015-04-28 22:25:14.113+06
403	127.0.0.1		O.Qekwxza@example.com	2015-04-28 22:25:15.097+06
404	127.0.0.1		\N	2015-04-28 22:29:12.759+06
405	127.0.0.1		X.Rrwydyywt@example.com	2015-04-28 22:29:13.545+06
406	127.0.0.1		\N	2015-04-28 22:31:07.256+06
407	127.0.0.1		A.Vbmgt@example.com	2015-04-28 22:31:07.888+06
408	127.0.0.1		\N	2015-04-28 22:41:21.025+06
409	127.0.0.1		D.Eaochlbaw@example.com	2015-04-28 22:41:22.062+06
410	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-04-29 00:13:58.962+06
411	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-04-29 00:14:00.216+06
412	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-05-03 06:49:17.122+06
413	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-05-03 06:49:20.083+06
414	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-05-03 06:59:49.81+06
415	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-05-03 06:59:50.85+06
416	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-05-03 07:02:45.154+06
417	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-05-03 07:02:46.424+06
418	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-05-04 03:36:04.371+06
419	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-05-04 03:36:07.106+06
420	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	\N	2015-05-04 03:52:27.22+06
421	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.90 Safari/537.36	iamjacke@gmail.com	2015-05-04 03:52:29.529+06
422	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-04 15:08:15.282+06
423	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-04 15:08:17.462+06
424	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-06 20:16:38.408+06
425	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-06 20:16:39.91+06
426	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-06 21:13:42.535+06
427	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-06 21:13:43.827+06
428	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-07 15:39:02.441+06
429	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-07 15:39:04.208+06
430	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-08 13:29:05.467+06
431	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-08 13:29:07.418+06
432	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-09 04:10:37.582+06
433	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-09 04:10:38.849+06
434	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-09 09:14:09.596+06
435	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-09 09:14:10.761+06
436	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-09 23:11:09.081+06
437	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-09 23:11:16.951+06
438	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-09 23:14:22.292+06
439	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-09 23:14:24.778+06
440	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-10 02:22:28.73+06
441	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-10 02:22:33.342+06
442	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-10 03:20:02.16+06
443	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-10 03:20:08.36+06
444	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-10 05:27:42.437+06
445	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-10 05:27:47.538+06
446	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-10 21:06:48.452+06
447	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-10 21:07:00.466+06
448	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-10 21:12:29.724+06
449	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-10 21:12:35.559+06
450	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-12 15:37:08.236+06
451	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-12 15:37:09.436+06
452	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-12 16:00:25.873+06
453	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-12 16:00:27.151+06
454	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-12 19:08:47.417+06
455	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-12 19:08:48.568+06
456	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-12 19:47:07.873+06
457	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-12 19:47:08.773+06
458	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-13 18:22:24.032+06
459	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-13 18:22:30.5+06
460	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-13 18:23:40.609+06
461	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-13 18:23:41.279+06
462	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-13 18:24:09.837+06
463	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-13 18:24:10.47+06
464	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-13 18:26:11.917+06
465	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-13 18:26:12.647+06
466	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-13 18:27:02.753+06
467	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-13 18:27:03.186+06
468	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-13 18:46:24.611+06
469	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-13 18:46:25.404+06
470	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-13 19:06:15.324+06
471	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-13 19:06:16.888+06
472	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-14 08:08:11.332+06
473	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-14 08:08:12.817+06
474	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-14 22:50:29.389+06
475	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-14 22:50:31.047+06
476	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-15 14:05:40.624+06
477	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-15 14:05:41.975+06
478	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-16 06:30:52.723+06
479	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-16 06:30:54.11+06
480	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-17 00:27:00.424+06
481	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-17 00:27:02.965+06
482	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-17 14:49:01.082+06
483	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-17 14:49:02.299+06
484	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	\N	2015-05-18 06:20:24.65+06
485	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36	iamjacke@gmail.com	2015-05-18 06:20:26.158+06
486	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-18 17:53:43.46+06
487	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-18 17:53:44.839+06
488	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-20 03:45:03.056+06
489	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-20 03:45:04.886+06
490	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-20 04:30:29.479+06
491	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-20 04:30:31.243+06
492	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-20 04:48:24.401+06
493	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-20 04:48:26.139+06
494	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-20 06:30:35.606+06
495	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-20 06:30:37.043+06
496	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-20 14:09:59.105+06
497	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-20 14:10:00.596+06
498	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-20 18:16:59.454+06
499	0:0:0:0:0:0:0:1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-20 18:17:01.142+06
500	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-20 21:52:37.823+06
501	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-20 21:52:39.874+06
502	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-21 12:56:08.525+06
503	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-21 12:56:10.355+06
504	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-22 17:00:17.097+06
505	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-22 17:00:19.487+06
506	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-23 10:55:24.18+06
507	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-23 10:55:26.924+06
508	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-23 13:41:51.81+06
509	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-23 13:41:58.619+06
510	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-25 23:49:35.274+06
511	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-25 23:49:37.923+06
512	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-28 10:30:47.919+06
513	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-28 10:30:49.595+06
514	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-29 08:15:15.856+06
515	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	iamjacke@gmail.com	2015-05-29 08:15:17.699+06
516	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-29 09:24:26.269+06
517	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	test1@minorityapp.com	2015-05-29 09:24:27.584+06
518	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-29 12:06:29.989+06
519	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	test1@minorityapp.com	2015-05-29 12:06:31.651+06
520	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	\N	2015-05-29 12:16:08.409+06
521	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.152 Safari/537.36	test1@minorityapp.com	2015-05-29 12:16:09.631+06
522	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-05-29 15:12:00.498+06
523	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-05-29 15:12:02.591+06
524	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-05-29 16:56:21.706+06
525	127.0.0.1	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	test1@minorityapp.com	2015-05-29 16:56:23.005+06
526	192.168.1.102	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36	\N	2015-05-29 17:32:15.801+06
527	192.168.1.102	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36	iamjacke@gmail.com	2015-05-29 17:32:17.98+06
528	192.168.1.102	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36	\N	2015-05-29 17:34:51.939+06
529	192.168.1.102	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36	iamjacke@gmail.com	2015-05-29 17:34:52.396+06
530	192.168.1.101	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36	\N	2015-05-29 17:42:40.722+06
531	192.168.1.101	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36	\N	2015-05-29 17:42:40.899+06
532	192.168.1.101	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36	\N	2015-05-29 17:42:44.89+06
533	192.168.1.101	Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/39.0.2171.71 Safari/537.36	iamjacke@gmail.com	2015-05-29 17:42:45.492+06
534	192.168.1.101	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-05-29 17:49:44.238+06
535	192.168.1.101	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	test1@minorityapp.com	2015-05-29 17:49:44.914+06
536	192.168.1.101	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-05-29 17:56:44.675+06
537	192.168.1.101	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-05-29 17:56:45.276+06
538	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-05-29 20:40:51.257+06
539	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-05-29 20:40:53.283+06
540	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-05-29 20:55:04.802+06
541	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-05-29 20:55:06.743+06
542	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-05-30 13:04:35.575+06
543	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-05-30 13:04:37.501+06
544	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-05-31 03:33:02.417+06
545	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-05-31 03:33:05.13+06
546	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-05-31 22:55:52.155+06
547	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-05-31 22:55:54.711+06
548	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-01 13:19:30.055+06
549	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-01 13:19:32.552+06
550	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-02 02:01:49.875+06
551	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-02 02:01:51.623+06
552	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-03 13:53:35.194+06
553	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-03 13:53:37.648+06
554	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-05 08:05:14.831+06
555	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-05 08:05:19.119+06
556	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-05 09:56:05.788+06
557	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-05 09:56:08.132+06
558	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-05 22:36:42.68+06
559	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-05 22:36:47.847+06
560	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-06 06:20:00.223+06
561	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-06 06:20:02.545+06
562	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-06 06:29:27.349+06
563	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-06 06:29:29.43+06
564	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-06 06:31:18.126+06
565	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-06 06:31:19.441+06
566	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	\N	2015-06-06 06:49:04.56+06
567	192.168.1.100	Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/43.0.2357.81 Safari/537.36	iamjacke@gmail.com	2015-06-06 06:49:07.453+06
\.


--
-- Name: account_loggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_loggers_id_seq', 567, true);


--
-- Data for Name: account_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_plans (id, business_id, master_acc, plan_id, expired_at) FROM stdin;
3	\N	R.Peht@example.com	1	2015-05-03 21:38:06.61+06
4	\N	N.As@example.com	1	2015-05-03 21:46:39.927+06
5	\N	B.Olxxo@example.com	1	2015-05-03 22:14:48.13+06
6	\N	O.Qekwxza@example.com	1	2015-05-03 22:25:21.189+06
7	\N	X.Rrwydyywt@example.com	1	2015-05-03 22:29:19.193+06
2	\N	juices.woo@gmail.com	2	2015-06-08 04:39:16.024+06
1	\N	iamjacke@gmail.com	1	2015-06-28 04:39:16.024+06
8	\N	test1@minorityapp.com	1	2015-06-03 08:27:17.457+06
\.


--
-- Name: account_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_plans_id_seq', 8, true);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts ("providerId", "userId", "firstName", "lastName", "fullName", email, "avatarUrl", "authMethod", token, secret, "accessToken", "tokenType", "expiresIn", "refreshToken", hasher, password, salt, lang, country, phone, nickname) FROM stdin;
userpass	juices.woo@gmail.com	Pavel	Chekmaryov	Pavel Chekmaryov	juices.woo@gmail.com	\N	userPassword	\N	\N	\N	\N	\N	\N	bcrypt	$2a$10$xCou9.MY1yK/lkhoAUwO5uM0AEx9aHx1U0.OQhPrWh4hDYBxQHcya	\N	en	\N	\N	\N
Wfchixf	Rtfu	Sxemk	Vkd	Sxemk Vkd	S.Vkd@example.com	\N	userPassword	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
Yhhdogllmxm	Nsoqfjr	Sjtxh	Ypps	Sjtxh Ypps	S.Ypps@example.com	\N	openId	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
Kofkwrs	Sstjmyeazm	Vxfeu	Ybjpkdkorao	Vxfeu Ybjpkdkorao	V.Ybjpkdkorao@example.com	\N	openId	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
J.Tuvrwjltww@example.com	Wyeunaiu	Jxedsjidch	Tuvrwjltww	Jxedsjidch Tuvrwjltww	J.Tuvrwjltww@example.com	\N	userPassword	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
D.Zm@example.com	Opvhfgtd	Dl	Zm	Dl Zm	D.Zm@example.com	\N	oauth2	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
L.Btucabz@example.com	Znyq	Lfc	Btucabz	Lfc Btucabz	L.Btucabz@example.com	\N	oauth1	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
H.Ci@example.com	Kuhgjzfh	Hzasvm	Ci	Hzasvm Ci	H.Ci@example.com	\N	userPassword	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
K.La@example.com	Ovo@example.com	Kjgbsqddsu	La	Kjgbsqddsu La	K.La@example.com	\N	openId	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
Z.Cnzjxooh@example.com	Hgalq@example.com	Zrjl	Cnzjxooh	Zrjl Cnzjxooh	Z.Cnzjxooh@example.com	\N	oauth1	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
G.Izuymc@example.com	userpass	Gr	Izuymc	Gr Izuymc	G.Izuymc@example.com	\N	oauth2	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
userpass	W.Ffk@example.com	Wokr	Ffk	Wokr Ffk	W.Ffk@example.com	\N	oauth2	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
userpass	R.Peht@example.com	Rsnhn	Peht	Rsnhn Peht	R.Peht@example.com	\N	oauth2	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
userpass	N.As@example.com	Nu	As	Nu As	N.As@example.com	\N	oauth2	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
userpass	B.Olxxo@example.com	Bs	Olxxo	Bs Olxxo	B.Olxxo@example.com	\N	userPassword	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
userpass	O.Qekwxza@example.com	Ojkvecldwx	Qekwxza	Ojkvecldwx Qekwxza	O.Qekwxza@example.com	\N	oauth2	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
userpass	X.Rrwydyywt@example.com	Xr	Rrwydyywt	Xr Rrwydyywt	X.Rrwydyywt@example.com	\N	openId	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
userpass	A.Vbmgt@example.com	Affvam	Vbmgt	Affvam Vbmgt	A.Vbmgt@example.com	\N	openId	\N	\N	\N	\N	\N	\N			\N	en	\N	\N	\N
userpass	test1@minorityapp.com	fsafa	fsafa	fsafa fsafa	test1@minorityapp.com	\N	userPassword	\N	\N	\N	\N	\N	\N	bcrypt	$2a$10$tGwBR6z0M32yFfUfCyV7neD8vODtEN6igRCDk3vAoXmz.iG25HWwi	\N	en	\N	\N	\N
userpass	iamjacke@gmail.com	Steve	Jobs	Steve Jobs	iamjacke@gmail.com	http://www.gravatar.com/avatar/651ec554c78e46fe3e36cb98dacb31a5?d=404	userPassword	\N	\N	\N	\N	\N	\N	bcrypt	$2a$10$ENARefhlAASkLkf7j4gQ1.efeDzHXkYW/N5r7eM8bnncKIhCsYQa.	\N	en	\N	\N	jobs
\.


--
-- Data for Name: billing_infos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY billing_infos (id, business_id, firstname, lastname, address, zipcode, created_at, updated_at) FROM stdin;
\.


--
-- Name: billing_infos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('billing_infos_id_seq', 1, false);


--
-- Data for Name: bills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bills (id, title, master_acc, assigned, approved) FROM stdin;
1	Bill #1	juices.woo@gmail.com	2014-12-15 18:05:22.589+06	f
\.


--
-- Name: bills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bills_id_seq', 1, true);


--
-- Data for Name: bploggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bploggers (id, process_id, proc_element_id, space_element_id, "order", space_id, station_id, invoked, expanded, container, date, step) FROM stdin;
587	52	189	\N	1	\N	232	t	f	f	2015-05-28 11:55:19.869+06	1
588	52	\N	39	1	\N	232	t	f	f	2015-05-28 11:55:22.852+06	2
589	52	\N	40	2	\N	232	t	f	f	2015-05-28 11:55:22.853+06	3
590	52	189	\N	1	\N	232	t	f	f	2015-05-28 11:55:42.093+06	1
591	52	\N	39	1	\N	232	t	f	f	2015-05-28 11:56:08.676+06	2
592	52	\N	40	2	\N	232	t	f	f	2015-05-28 11:56:08.676+06	3
593	52	189	\N	1	\N	232	t	f	f	2015-05-28 11:56:26.184+06	1
594	52	\N	39	1	\N	232	t	f	f	2015-05-28 11:56:45.745+06	2
595	52	\N	40	2	\N	232	t	f	f	2015-05-28 11:56:45.747+06	3
596	52	190	\N	2	\N	232	t	f	f	2015-05-28 11:56:45.748+06	4
\.


--
-- Name: bploggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bploggers_id_seq', 596, true);


--
-- Data for Name: bprocesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bprocesses (id, title, service_id, business_id, created_at, updated_at, version, state_machine_type) FROM stdin;
18	Some	12	2	\N	\N	1	base
22	preparing	31	3	\N	\N	1	base
25	Test	1	1	\N	\N	1	base
26	Test	1	1	\N	\N	1	base
27	Test	1	1	\N	\N	1	base
28	Test	1	1	\N	\N	1	base
29	Test	1	1	\N	\N	1	base
30	Test	1	1	\N	\N	1	base
31	Test	1	1	\N	\N	1	base
33	Test	1	1	\N	\N	1	base
34	Test	1	1	\N	\N	1	base
35	Test	1	1	\N	\N	1	base
36	Test	1	1	\N	\N	1	base
37	Test	1	1	\N	\N	1	base
38	Test	1	1	\N	\N	1	base
39	Test	1	1	\N	\N	1	base
40	Test	1	1	\N	\N	1	base
45	positive testing	12	2	\N	\N	1	base
51	Container test	12	2	\N	\N	1	base
52	fds	12	2	\N	\N	1	base
53	cn 2 space bug	12	2	\N	\N	1	base
\.


--
-- Name: bprocesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bprocesses_id_seq', 53, true);


--
-- Data for Name: bpsessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpsessions (id, process_id, created_at, updated_at, active_listed) FROM stdin;
110	52	2015-05-28 11:55:13.637+06	2015-05-28 11:55:13.637+06	t
\.


--
-- Name: bpsessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpsessions_id_seq', 110, true);


--
-- Data for Name: bpspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpspaces (id, process_id, index, container, subbrick, brick_front_id, brick_nested_id, nesting_level, created_at, updated_at) FROM stdin;
22	18	1	t	f	114	\N	1	\N	\N
24	22	1	t	f	119	\N	1	\N	\N
25	22	2	t	f	121	\N	1	\N	\N
27	25	3	t	f	5	\N	1	\N	\N
28	26	3	t	f	5	\N	1	\N	\N
29	27	4	t	f	5	\N	1	\N	\N
30	28	4	t	f	5	\N	1	\N	\N
31	29	5	t	f	5	\N	1	\N	\N
32	30	5	t	f	5	\N	1	\N	\N
33	33	1	t	f	5	\N	1	\N	\N
34	34	1	t	f	5	\N	1	\N	\N
35	35	1	t	f	5	\N	1	\N	\N
36	36	1	t	f	5	\N	1	\N	\N
37	37	1	t	f	5	\N	1	\N	\N
38	38	1	t	f	5	\N	1	\N	\N
39	38	2	t	f	5	\N	1	\N	\N
40	38	2	t	f	5	\N	1	\N	\N
41	39	3	t	f	5	\N	1	\N	\N
42	39	3	t	f	5	\N	1	\N	\N
43	40	3	t	f	5	\N	1	\N	\N
44	40	3	t	f	5	\N	1	\N	\N
45	39	3	t	f	5	\N	1	\N	\N
46	39	3	t	f	5	\N	1	\N	\N
47	39	3	t	f	5	\N	1	\N	\N
48	39	3	t	f	5	\N	1	\N	\N
62	51	1	t	f	188	\N	1	2015-04-27 16:20:47.69+06	2015-04-27 16:20:47.69+06
63	52	1	t	f	189	\N	1	2015-04-27 16:20:47.69+06	2015-04-27 16:20:47.69+06
66	53	1	t	f	192	\N	1	2015-04-27 16:20:47.69+06	2015-04-27 16:20:47.69+06
76	53	1	t	f	202	\N	1	2015-04-27 16:20:47.69+06	2015-04-27 16:20:47.69+06
\.


--
-- Name: bpspaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpspaces_id_seq', 76, true);


--
-- Data for Name: bpstaterefs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpstaterefs (id, bprocess_id, switch_type, priority, state_id, session_state, created_at, updated_at) FROM stdin;
\.


--
-- Name: bpstaterefs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpstaterefs_id_seq', 1, false);


--
-- Data for Name: bpstates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpstates (id, process_id, title, neutral, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, middle, middleable, oposite, opositable) FROM stdin;
161	53	initiated	uninitiated	t	\N	\N	2015-05-23 10:57:13.123+06	2015-05-23 10:57:13.123+06	en	\N	f	0	initiating	t		f
162	53	invoking	paused	t	\N	\N	2015-05-23 10:57:13.123+06	2015-05-23 10:57:13.123+06	en	\N	f	0	invoking	t		f
165	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	65	f	0		f		f
23	18	invoking	paused	t	\N	\N	2015-04-09 06:24:57.118+06	2015-04-09 06:24:57.118+06	en	\N	f	0		f	 	f
22	18	initiated	uninitiated	t	\N	\N	2015-04-09 06:24:57.118+06	2015-04-09 06:24:57.118+06	en	\N	f	0		f	 	f
24	18	finished	unfinished	t	\N	\N	2015-04-09 06:24:57.118+06	2015-04-09 06:24:57.118+06	en	\N	f	0		f	 	f
31	22	initiated	uninitiated	t	\N	\N	2015-04-09 06:24:58.477+06	2015-04-09 06:24:58.478+06	en	\N	f	0		f	 	f
32	22	invoking	paused	t	\N	\N	2015-04-09 06:24:58.478+06	2015-04-09 06:24:58.478+06	en	\N	f	0		f	 	f
33	22	finished	unfinished	t	\N	\N	2015-04-09 06:24:58.478+06	2015-04-09 06:24:58.478+06	en	\N	f	0		f	 	f
38	25	invoking	paused	t	\N	\N	2015-04-09 06:24:59.525+06	2015-04-09 06:24:59.525+06	en	\N	f	0		f	 	f
37	25	initiated	uninitiated	t	\N	\N	2015-04-09 06:24:59.525+06	2015-04-09 06:24:59.525+06	en	\N	f	0		f	 	f
39	25	finished	unfinished	t	\N	\N	2015-04-09 06:24:59.525+06	2015-04-09 06:24:59.525+06	en	\N	f	0		f	 	f
40	26	initiated	uninitiated	t	\N	\N	2015-04-09 06:24:59.845+06	2015-04-09 06:24:59.845+06	en	\N	f	0		f	 	f
41	26	invoking	paused	t	\N	\N	2015-04-09 06:24:59.845+06	2015-04-09 06:24:59.845+06	en	\N	f	0		f	 	f
42	26	finished	unfinished	t	\N	\N	2015-04-09 06:24:59.845+06	2015-04-09 06:24:59.845+06	en	\N	f	0		f	 	f
43	27	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:00.226+06	2015-04-09 06:25:00.226+06	en	\N	f	0		f	 	f
44	27	invoking	paused	t	\N	\N	2015-04-09 06:25:00.226+06	2015-04-09 06:25:00.226+06	en	\N	f	0		f	 	f
45	27	finished	unfinished	t	\N	\N	2015-04-09 06:25:00.226+06	2015-04-09 06:25:00.226+06	en	\N	f	0		f	 	f
46	28	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:00.658+06	2015-04-09 06:25:00.658+06	en	\N	f	0		f	 	f
47	28	invoking	paused	t	\N	\N	2015-04-09 06:25:00.658+06	2015-04-09 06:25:00.658+06	en	\N	f	0		f	 	f
48	28	finished	unfinished	t	\N	\N	2015-04-09 06:25:00.658+06	2015-04-09 06:25:00.658+06	en	\N	f	0		f	 	f
49	29	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:01.082+06	2015-04-09 06:25:01.082+06	en	\N	f	0		f	 	f
50	29	invoking	paused	t	\N	\N	2015-04-09 06:25:01.083+06	2015-04-09 06:25:01.083+06	en	\N	f	0		f	 	f
51	29	finished	unfinished	t	\N	\N	2015-04-09 06:25:01.083+06	2015-04-09 06:25:01.083+06	en	\N	f	0		f	 	f
52	30	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:01.441+06	2015-04-09 06:25:01.441+06	en	\N	f	0		f	 	f
53	30	invoking	paused	t	\N	\N	2015-04-09 06:25:01.441+06	2015-04-09 06:25:01.441+06	en	\N	f	0		f	 	f
54	30	finished	unfinished	t	\N	\N	2015-04-09 06:25:01.441+06	2015-04-09 06:25:01.441+06	en	\N	f	0		f	 	f
55	31	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:01.724+06	2015-04-09 06:25:01.724+06	en	\N	f	0		f	 	f
57	31	finished	unfinished	t	\N	\N	2015-04-09 06:25:01.724+06	2015-04-09 06:25:01.724+06	en	\N	f	0		f	 	f
56	31	invoking	paused	t	\N	\N	2015-04-09 06:25:01.724+06	2015-04-09 06:25:01.724+06	en	\N	f	0		f	 	f
58	33	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:02.024+06	2015-04-09 06:25:02.024+06	en	\N	f	0		f	 	f
59	33	invoking	paused	t	\N	\N	2015-04-09 06:25:02.025+06	2015-04-09 06:25:02.025+06	en	\N	f	0		f	 	f
60	33	finished	unfinished	t	\N	\N	2015-04-09 06:25:02.025+06	2015-04-09 06:25:02.025+06	en	\N	f	0		f	 	f
61	34	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:02.337+06	2015-04-09 06:25:02.337+06	en	\N	f	0		f	 	f
62	34	invoking	paused	t	\N	\N	2015-04-09 06:25:02.337+06	2015-04-09 06:25:02.338+06	en	\N	f	0		f	 	f
63	34	finished	unfinished	t	\N	\N	2015-04-09 06:25:02.338+06	2015-04-09 06:25:02.338+06	en	\N	f	0		f	 	f
64	35	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:02.593+06	2015-04-09 06:25:02.593+06	en	\N	f	0		f	 	f
66	35	finished	unfinished	t	\N	\N	2015-04-09 06:25:02.593+06	2015-04-09 06:25:02.594+06	en	\N	f	0		f	 	f
65	35	invoking	paused	t	\N	\N	2015-04-09 06:25:02.593+06	2015-04-09 06:25:02.593+06	en	\N	f	0		f	 	f
68	36	invoking	paused	t	\N	\N	2015-04-09 06:25:02.846+06	2015-04-09 06:25:02.846+06	en	\N	f	0		f	 	f
67	36	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:02.846+06	2015-04-09 06:25:02.846+06	en	\N	f	0		f	 	f
69	36	finished	unfinished	t	\N	\N	2015-04-09 06:25:02.846+06	2015-04-09 06:25:02.847+06	en	\N	f	0		f	 	f
70	37	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:03.207+06	2015-04-09 06:25:03.208+06	en	\N	f	0		f	 	f
71	37	invoking	paused	t	\N	\N	2015-04-09 06:25:03.208+06	2015-04-09 06:25:03.208+06	en	\N	f	0		f	 	f
72	37	finished	unfinished	t	\N	\N	2015-04-09 06:25:03.208+06	2015-04-09 06:25:03.208+06	en	\N	f	0		f	 	f
73	38	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:03.472+06	2015-04-09 06:25:03.472+06	en	\N	f	0		f	 	f
75	38	finished	unfinished	t	\N	\N	2015-04-09 06:25:03.472+06	2015-04-09 06:25:03.472+06	en	\N	f	0		f	 	f
74	38	invoking	paused	t	\N	\N	2015-04-09 06:25:03.472+06	2015-04-09 06:25:03.472+06	en	\N	f	0		f	 	f
76	39	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:03.782+06	2015-04-09 06:25:03.782+06	en	\N	f	0		f	 	f
77	39	invoking	paused	t	\N	\N	2015-04-09 06:25:03.782+06	2015-04-09 06:25:03.782+06	en	\N	f	0		f	 	f
78	39	finished	unfinished	t	\N	\N	2015-04-09 06:25:03.782+06	2015-04-09 06:25:03.782+06	en	\N	f	0		f	 	f
79	40	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:04.041+06	2015-04-09 06:25:04.041+06	en	\N	f	0		f	 	f
80	40	invoking	paused	t	\N	\N	2015-04-09 06:25:04.041+06	2015-04-09 06:25:04.041+06	en	\N	f	0		f	 	f
81	40	finished	unfinished	t	\N	\N	2015-04-09 06:25:04.041+06	2015-04-09 06:25:04.041+06	en	\N	f	0		f	 	f
82	45	initiated	uninitiated	t	\N	\N	2015-04-28 03:47:48.243+06	2015-04-28 03:47:48.243+06	en	\N	f	0	initiating	t	 	f
83	45	invoking	paused	t	\N	\N	2015-04-28 03:47:48.252+06	2015-04-28 03:47:48.252+06	en	\N	f	0	invoking	t	 	f
84	45	finished	unfinished	t	\N	\N	2015-04-28 03:47:48.252+06	2015-04-28 03:47:48.252+06	en	\N	f	0	finishing	t	 	f
86	45	invoked	uninvoked	f	161	\N	2015-04-27 16:20:48.125+06	2015-04-27 16:20:48.125+06	en	\N	f	0	invoking	t	 	f
85	45	invoked	uninvoked	f	160	\N	2015-04-27 16:20:48.125+06	2015-04-27 16:20:48.125+06	en	\N	f	0	invoking	t	 	f
135	51	initiated	uninitiated	t	\N	\N	2015-05-22 17:05:33.148+06	2015-05-22 17:05:33.148+06	en	\N	f	0	initiating	t		f
136	51	invoking	paused	t	\N	\N	2015-05-22 17:05:33.173+06	2015-05-22 17:05:33.173+06	en	\N	f	0	invoking	t		f
137	51	finished	unfinished	t	\N	\N	2015-05-22 17:05:33.173+06	2015-05-22 17:05:33.173+06	en	\N	f	0	finishing	t		f
139	51	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	58	f	0		f		f
141	51	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	59	f	0		f		f
143	51	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	60	f	0		f		f
145	51	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	61	f	0		f		f
147	51	invoked	uninvoked	f	188	\N	2015-04-27 16:20:47.42+06	2015-04-27 16:20:47.42+06	en	\N	f	0	invoking	t		f
148	51	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	62	f	0		f		f
149	51	invoked	uninvoked	f	\N	36	\N	\N	en	\N	f	0		f		f
150	52	initiated	uninitiated	t	\N	\N	2015-05-22 20:29:52.413+06	2015-05-22 20:29:52.413+06	en	\N	f	0	initiating	t		f
151	52	invoking	paused	t	\N	\N	2015-05-22 20:29:52.414+06	2015-05-22 20:29:52.414+06	en	\N	f	0	invoking	t		f
152	52	finished	unfinished	t	\N	\N	2015-05-22 20:29:52.414+06	2015-05-22 20:29:52.414+06	en	\N	f	0	finishing	t		f
153	52	invoked	uninvoked	f	189	\N	2015-04-27 16:20:47.42+06	2015-04-27 16:20:47.42+06	en	\N	f	0	invoking	t		f
154	52	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	63	f	0		f		f
157	52	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	64	f	0		f		f
158	52	invoked	uninvoked	f	190	\N	\N	\N	en	\N	f	0		f		f
159	52	invoked	uninvoked	f	\N	39	2015-04-27 16:20:48.423+06	2015-04-27 16:20:48.423+06	en	\N	f	0	invoking	t		f
160	52	confirmed	unconfirmed	f	\N	39	2015-04-27 16:20:48.489+06	2015-04-27 16:20:48.489+06	en	\N	f	0	confirming	t		f
163	53	finished	unfinished	t	\N	\N	2015-05-23 10:57:13.123+06	2015-05-23 10:57:13.123+06	en	\N	f	0	finishing	t		f
166	52	invoked	uninvoked	f	\N	40	2015-04-27 16:20:48.423+06	2015-04-27 16:20:48.423+06	en	\N	f	0	invoking	t		f
167	52	confirmed	unconfirmed	f	\N	40	2015-04-27 16:20:48.489+06	2015-04-27 16:20:48.489+06	en	\N	f	0	confirming	t		f
168	53	invoked	uninvoked	f	192	\N	2015-04-27 16:20:47.42+06	2015-04-27 16:20:47.42+06	en	\N	f	0	invoking	t		f
169	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	66	f	0		f		f
171	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	67	f	0		f		f
173	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	68	f	0		f		f
175	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	69	f	0		f		f
177	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	70	f	0		f		f
179	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	71	f	0		f		f
181	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	72	f	0		f		f
183	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	73	f	0		f		f
185	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	74	f	0		f		f
187	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	75	f	0		f		f
188	53	invoked	uninvoked	f	202	\N	2015-04-27 16:20:47.42+06	2015-04-27 16:20:47.42+06	en	\N	f	0	invoking	t		f
189	53	lap	unlap	f	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	76	f	0		f		f
\.


--
-- Name: bpstates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpstates_id_seq', 189, true);


--
-- Data for Name: bpstation_loggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpstation_loggers (id, station_id, process_id, sygnal, date, state, step, space, container_step, expand_step, spaces_ids, started, finished, inspace, incontainer, inexpands, paused) FROM stdin;
1	92	24	start	2015-04-11 02:27:15.476+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2	92	24	moving	2015-04-11 02:27:15.479+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
3	92	24	prepareinvoking	2015-04-11 02:27:15.527+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
4	92	24	invoked	2015-04-11 02:27:15.528+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
5	92	24	moving	2015-04-11 02:27:15.53+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
6	92	24	prepareinvoking	2015-04-11 02:27:15.531+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
7	92	24	invoked	2015-04-11 02:27:15.531+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
8	92	24	moving	2015-04-11 02:27:15.532+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
9	92	24	prepareinvoking	2015-04-11 02:27:15.534+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
10	92	24	invoked	2015-04-11 02:27:15.534+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
11	92	24	moving	2015-04-11 02:27:15.534+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
12	92	24	prepareinvoking	2015-04-11 02:27:15.535+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
13	92	24	invoked	2015-04-11 02:27:15.535+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
14	92	24	moving	2015-04-11 02:27:15.535+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
15	92	24	end	2015-04-11 02:27:15.536+06	t	0	0	{}	{}	{}	t	t	f	f	f	f
16	93	24	start	2015-04-11 02:29:50.794+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
17	93	24	moving	2015-04-11 02:29:50.797+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
18	93	24	prepareinvoking	2015-04-11 02:29:50.827+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
19	93	24	invoked	2015-04-11 02:29:50.828+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
20	93	24	moving	2015-04-11 02:29:50.829+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
21	93	24	prepareinvoking	2015-04-11 02:29:50.831+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
22	93	24	invoked	2015-04-11 02:29:50.831+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
23	93	24	moving	2015-04-11 02:29:50.831+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
24	93	24	prepareinvoking	2015-04-11 02:29:50.832+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
25	93	24	invoked	2015-04-11 02:29:50.832+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
26	93	24	moving	2015-04-11 02:29:50.834+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
27	93	24	prepareinvoking	2015-04-11 02:29:50.835+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
28	93	24	invoked	2015-04-11 02:29:50.835+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
29	93	24	moving	2015-04-11 02:29:50.836+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
30	93	24	prepareinvoking	2015-04-11 02:29:50.837+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
31	93	24	invoked	2015-04-11 02:29:50.837+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
32	93	24	moving	2015-04-11 02:29:50.837+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
33	93	24	prepareinvoking	2015-04-11 02:29:50.837+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
34	93	24	invoked	2015-04-11 02:29:50.838+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
35	93	24	moving	2015-04-11 02:29:50.838+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
36	93	24	prepareinvoking	2015-04-11 02:29:50.838+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
37	93	24	invoked	2015-04-11 02:29:50.839+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
38	93	24	moving	2015-04-11 02:29:50.839+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
39	93	24	prepareinvoking	2015-04-11 02:29:50.84+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
40	93	24	invoked	2015-04-11 02:29:50.84+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
41	93	24	moving	2015-04-11 02:29:50.84+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
42	93	24	prepareinvoking	2015-04-11 02:29:50.841+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
43	93	24	invoked	2015-04-11 02:29:50.841+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
44	93	24	moving	2015-04-11 02:29:50.841+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
45	93	24	prepareinvoking	2015-04-11 02:29:50.842+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
46	93	24	invoked	2015-04-11 02:29:50.842+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
47	93	24	moving	2015-04-11 02:29:50.842+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
48	93	24	prepareinvoking	2015-04-11 02:29:50.843+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
49	93	24	invoked	2015-04-11 02:29:50.843+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
50	93	24	moving	2015-04-11 02:29:50.843+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
51	93	24	prepareinvoking	2015-04-11 02:29:50.843+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
52	93	24	invoked	2015-04-11 02:29:50.846+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
53	93	24	moving	2015-04-11 02:29:50.849+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
54	93	24	prepareinvoking	2015-04-11 02:29:50.85+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
55	93	24	invoked	2015-04-11 02:29:50.85+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
56	93	24	moving	2015-04-11 02:29:50.85+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
57	93	24	prepareinvoking	2015-04-11 02:29:50.851+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
58	93	24	invoked	2015-04-11 02:29:50.851+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
59	93	24	moving	2015-04-11 02:29:50.852+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
60	93	24	end	2015-04-11 02:29:50.853+06	t	0	0	{}	{}	{}	t	t	f	f	f	f
61	94	24	start	2015-04-11 02:31:38.595+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
62	94	24	moving	2015-04-11 02:31:38.603+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
63	94	24	prepareinvoking	2015-04-11 02:31:38.643+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
64	94	24	invoked	2015-04-11 02:31:38.644+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
65	94	24	moving	2015-04-11 02:31:38.645+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
66	94	24	prepareinvoking	2015-04-11 02:31:38.646+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
67	94	24	invoked	2015-04-11 02:31:38.647+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
68	94	24	moving	2015-04-11 02:31:38.647+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
69	94	24	prepareinvoking	2015-04-11 02:31:38.648+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
70	94	24	invoked	2015-04-11 02:31:38.648+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
71	94	24	moving	2015-04-11 02:31:38.65+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
72	94	24	prepareinvoking	2015-04-11 02:31:38.65+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
73	94	24	invoked	2015-04-11 02:31:38.651+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
74	94	24	moving	2015-04-11 02:31:38.651+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
75	94	24	prepareinvoking	2015-04-11 02:31:38.654+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
76	94	24	invoked	2015-04-11 02:31:38.654+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
77	94	24	moving	2015-04-11 02:31:38.655+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
78	94	24	prepareinvoking	2015-04-11 02:31:38.656+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
79	94	24	invoked	2015-04-11 02:31:38.656+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
80	94	24	moving	2015-04-11 02:31:38.657+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
81	94	24	prepareinvoking	2015-04-11 02:31:38.658+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
82	94	24	invoked	2015-04-11 02:31:38.658+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
83	94	24	moving	2015-04-11 02:31:38.658+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
84	94	24	prepareinvoking	2015-04-11 02:31:38.66+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
85	94	24	invoked	2015-04-11 02:31:38.66+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
86	94	24	moving	2015-04-11 02:31:38.664+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
87	94	24	prepareinvoking	2015-04-11 02:31:38.666+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
88	94	24	invoked	2015-04-11 02:31:38.666+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
89	94	24	moving	2015-04-11 02:31:38.667+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
90	94	24	prepareinvoking	2015-04-11 02:31:38.67+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
91	94	24	invoked	2015-04-11 02:31:38.67+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
92	94	24	moving	2015-04-11 02:31:38.672+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
93	94	24	prepareinvoking	2015-04-11 02:31:38.673+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
94	94	24	invoked	2015-04-11 02:31:38.673+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
95	94	24	moving	2015-04-11 02:31:38.713+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
96	94	24	prepareinvoking	2015-04-11 02:31:38.716+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
97	94	24	invoked	2015-04-11 02:31:38.716+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
98	94	24	moving	2015-04-11 02:31:38.717+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
99	94	24	prepareinvoking	2015-04-11 02:31:38.719+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
100	94	24	invoked	2015-04-11 02:31:38.719+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
101	94	24	moving	2015-04-11 02:31:38.721+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
102	94	24	prepareinvoking	2015-04-11 02:31:38.722+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
103	94	24	invoked	2015-04-11 02:31:38.722+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
104	94	24	moving	2015-04-11 02:31:38.722+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
105	94	24	prepareinvoking	2015-04-11 02:31:38.723+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
106	94	24	invoked	2015-04-11 02:31:38.723+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
107	94	24	moving	2015-04-11 02:31:38.724+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
108	94	24	prepareinvoking	2015-04-11 02:31:38.726+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
109	94	24	invoked	2015-04-11 02:31:38.726+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
110	94	24	moving	2015-04-11 02:31:38.726+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
111	94	24	prepareinvoking	2015-04-11 02:31:38.73+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
112	94	24	invoked	2015-04-11 02:31:38.73+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
113	94	24	moving	2015-04-11 02:31:38.73+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
114	94	24	prepareinvoking	2015-04-11 02:31:38.738+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
115	94	24	invoked	2015-04-11 02:31:38.738+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
116	94	24	moving	2015-04-11 02:31:38.738+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
117	94	24	prepareinvoking	2015-04-11 02:31:38.739+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
118	94	24	invoked	2015-04-11 02:31:38.74+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
119	94	24	moving	2015-04-11 02:31:38.741+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
120	94	24	prepareinvoking	2015-04-11 02:31:38.744+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
121	94	24	invoked	2015-04-11 02:31:38.745+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
122	94	24	moving	2015-04-11 02:31:38.745+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
123	94	24	prepareinvoking	2015-04-11 02:31:38.746+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
124	94	24	invoked	2015-04-11 02:31:38.746+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
125	94	24	moving	2015-04-11 02:31:38.746+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
126	94	24	prepareinvoking	2015-04-11 02:31:38.747+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
127	94	24	invoked	2015-04-11 02:31:38.747+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
128	94	24	moving	2015-04-11 02:31:38.747+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
129	94	24	prepareinvoking	2015-04-11 02:31:38.748+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
130	94	24	invoked	2015-04-11 02:31:38.748+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
131	94	24	moving	2015-04-11 02:31:38.748+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
132	94	24	prepareinvoking	2015-04-11 02:31:38.749+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
133	94	24	invoked	2015-04-11 02:31:38.749+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
134	94	24	moving	2015-04-11 02:31:38.75+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
135	94	24	prepareinvoking	2015-04-11 02:31:38.753+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
136	94	24	invoked	2015-04-11 02:31:38.753+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
137	94	24	moving	2015-04-11 02:31:38.754+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
138	94	24	prepareinvoking	2015-04-11 02:31:38.754+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
139	94	24	invoked	2015-04-11 02:31:38.755+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
140	94	24	moving	2015-04-11 02:31:38.757+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
141	94	24	prepareinvoking	2015-04-11 02:31:38.759+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
142	94	24	invoked	2015-04-11 02:31:38.759+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
143	94	24	moving	2015-04-11 02:31:38.76+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
144	94	24	prepareinvoking	2015-04-11 02:31:38.762+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
145	94	24	invoked	2015-04-11 02:31:38.762+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
146	94	24	moving	2015-04-11 02:31:38.764+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
147	94	24	prepareinvoking	2015-04-11 02:31:38.766+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
148	94	24	invoked	2015-04-11 02:31:38.766+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
149	94	24	moving	2015-04-11 02:31:38.767+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
150	94	24	prepareinvoking	2015-04-11 02:31:38.768+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
151	94	24	invoked	2015-04-11 02:31:38.768+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
152	94	24	moving	2015-04-11 02:31:38.768+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
153	94	24	prepareinvoking	2015-04-11 02:31:38.769+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
154	94	24	invoked	2015-04-11 02:31:38.769+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
155	94	24	moving	2015-04-11 02:31:38.77+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
156	94	24	prepareinvoking	2015-04-11 02:31:38.773+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
157	94	24	invoked	2015-04-11 02:31:38.773+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
158	94	24	moving	2015-04-11 02:31:38.789+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
159	94	24	prepareinvoking	2015-04-11 02:31:38.793+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
160	94	24	invoked	2015-04-11 02:31:38.793+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
161	94	24	moving	2015-04-11 02:31:38.794+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
162	94	24	prepareinvoking	2015-04-11 02:31:38.795+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
163	94	24	invoked	2015-04-11 02:31:38.795+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
164	94	24	moving	2015-04-11 02:31:38.796+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
165	94	24	prepareinvoking	2015-04-11 02:31:38.797+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
166	94	24	invoked	2015-04-11 02:31:38.797+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
167	94	24	moving	2015-04-11 02:31:38.798+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
168	94	24	prepareinvoking	2015-04-11 02:31:38.798+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
169	94	24	invoked	2015-04-11 02:31:38.799+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
170	94	24	moving	2015-04-11 02:31:38.8+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
171	94	24	prepareinvoking	2015-04-11 02:31:38.801+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
172	94	24	invoked	2015-04-11 02:31:38.801+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
173	94	24	moving	2015-04-11 02:31:38.801+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
174	94	24	prepareinvoking	2015-04-11 02:31:38.803+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
175	94	24	invoked	2015-04-11 02:31:38.803+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
176	94	24	moving	2015-04-11 02:31:38.804+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
177	94	24	prepareinvoking	2015-04-11 02:31:38.815+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
178	94	24	invoked	2015-04-11 02:31:38.816+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
179	94	24	moving	2015-04-11 02:31:38.817+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
180	94	24	prepareinvoking	2015-04-11 02:31:38.818+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
181	94	24	invoked	2015-04-11 02:31:38.818+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
182	94	24	moving	2015-04-11 02:31:38.819+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
183	94	24	prepareinvoking	2015-04-11 02:31:38.82+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
184	94	24	invoked	2015-04-11 02:31:38.82+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
185	94	24	moving	2015-04-11 02:31:38.821+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
186	94	24	prepareinvoking	2015-04-11 02:31:38.822+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
187	94	24	invoked	2015-04-11 02:31:38.822+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
188	94	24	moving	2015-04-11 02:31:38.823+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
189	94	24	prepareinvoking	2015-04-11 02:31:38.824+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
190	94	24	invoked	2015-04-11 02:31:38.825+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
191	94	24	moving	2015-04-11 02:31:38.826+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
192	94	24	prepareinvoking	2015-04-11 02:31:38.827+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
193	94	24	invoked	2015-04-11 02:31:38.828+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
194	94	24	moving	2015-04-11 02:31:38.833+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
195	94	24	prepareinvoking	2015-04-11 02:31:38.834+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
196	94	24	invoked	2015-04-11 02:31:38.834+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
197	94	24	moving	2015-04-11 02:31:38.834+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
198	94	24	prepareinvoking	2015-04-11 02:31:38.837+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
199	94	24	invoked	2015-04-11 02:31:38.837+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
200	94	24	moving	2015-04-11 02:31:38.839+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
201	94	24	prepareinvoking	2015-04-11 02:31:38.841+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
202	94	24	invoked	2015-04-11 02:31:38.841+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
203	94	24	moving	2015-04-11 02:31:38.842+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
204	94	24	prepareinvoking	2015-04-11 02:31:38.846+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
205	94	24	invoked	2015-04-11 02:31:38.876+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
206	94	24	moving	2015-04-11 02:31:38.877+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
207	94	24	prepareinvoking	2015-04-11 02:31:38.878+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
208	94	24	invoked	2015-04-11 02:31:38.878+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
209	94	24	moving	2015-04-11 02:31:38.879+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
210	94	24	prepareinvoking	2015-04-11 02:31:38.881+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
211	94	24	invoked	2015-04-11 02:31:38.882+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
212	94	24	moving	2015-04-11 02:31:38.884+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
213	94	24	prepareinvoking	2015-04-11 02:31:38.885+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
214	94	24	invoked	2015-04-11 02:31:38.888+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
215	94	24	moving	2015-04-11 02:31:38.889+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
216	94	24	prepareinvoking	2015-04-11 02:31:38.89+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
217	94	24	invoked	2015-04-11 02:31:38.891+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
218	94	24	moving	2015-04-11 02:31:38.893+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
219	94	24	prepareinvoking	2015-04-11 02:31:38.894+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
220	94	24	invoked	2015-04-11 02:31:38.894+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
221	94	24	moving	2015-04-11 02:31:38.895+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
222	94	24	prepareinvoking	2015-04-11 02:31:38.896+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
223	94	24	invoked	2015-04-11 02:31:38.896+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
224	94	24	moving	2015-04-11 02:31:38.896+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
225	94	24	prepareinvoking	2015-04-11 02:31:38.897+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
226	94	24	invoked	2015-04-11 02:31:38.9+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
227	94	24	moving	2015-04-11 02:31:38.901+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
228	94	24	prepareinvoking	2015-04-11 02:31:38.902+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
229	94	24	invoked	2015-04-11 02:31:38.902+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
230	94	24	moving	2015-04-11 02:31:38.904+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
231	94	24	prepareinvoking	2015-04-11 02:31:38.905+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
232	94	24	invoked	2015-04-11 02:31:38.905+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
233	94	24	moving	2015-04-11 02:31:38.91+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
234	94	24	prepareinvoking	2015-04-11 02:31:38.911+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
235	94	24	invoked	2015-04-11 02:31:38.911+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
236	94	24	moving	2015-04-11 02:31:38.915+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
237	94	24	prepareinvoking	2015-04-11 02:31:38.917+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
238	94	24	invoked	2015-04-11 02:31:38.922+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
239	94	24	moving	2015-04-11 02:31:38.924+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
240	94	24	prepareinvoking	2015-04-11 02:31:38.924+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
241	94	24	invoked	2015-04-11 02:31:38.925+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
242	94	24	moving	2015-04-11 02:31:38.959+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
243	94	24	prepareinvoking	2015-04-11 02:31:38.963+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
244	94	24	invoked	2015-04-11 02:31:38.964+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
245	94	24	moving	2015-04-11 02:31:38.967+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
246	94	24	prepareinvoking	2015-04-11 02:31:38.97+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
247	94	24	invoked	2015-04-11 02:31:38.972+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
248	94	24	moving	2015-04-11 02:31:38.973+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
249	94	24	prepareinvoking	2015-04-11 02:31:38.975+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
250	94	24	invoked	2015-04-11 02:31:38.975+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
251	94	24	moving	2015-04-11 02:31:38.976+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
252	94	24	prepareinvoking	2015-04-11 02:31:38.98+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
253	94	24	invoked	2015-04-11 02:31:38.98+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
254	94	24	moving	2015-04-11 02:31:38.982+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
255	94	24	prepareinvoking	2015-04-11 02:31:38.983+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
256	94	24	invoked	2015-04-11 02:31:38.984+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
257	94	24	moving	2015-04-11 02:31:38.985+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
258	94	24	prepareinvoking	2015-04-11 02:31:38.986+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
259	94	24	invoked	2015-04-11 02:31:38.986+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
260	94	24	moving	2015-04-11 02:31:38.987+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
261	94	24	prepareinvoking	2015-04-11 02:31:38.991+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
262	94	24	invoked	2015-04-11 02:31:38.991+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
263	94	24	moving	2015-04-11 02:31:38.992+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
264	94	24	prepareinvoking	2015-04-11 02:31:38.994+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
265	94	24	invoked	2015-04-11 02:31:38.994+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
266	94	24	moving	2015-04-11 02:31:38.998+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
267	94	24	prepareinvoking	2015-04-11 02:31:38.999+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
268	94	24	invoked	2015-04-11 02:31:38.999+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
269	94	24	moving	2015-04-11 02:31:39+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
270	94	24	prepareinvoking	2015-04-11 02:31:39.003+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
271	94	24	invoked	2015-04-11 02:31:39.003+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
272	94	24	moving	2015-04-11 02:31:39.004+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
273	94	24	prepareinvoking	2015-04-11 02:31:39.005+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
274	94	24	invoked	2015-04-11 02:31:39.005+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
275	94	24	moving	2015-04-11 02:31:39.007+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
276	94	24	prepareinvoking	2015-04-11 02:31:39.041+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
277	94	24	invoked	2015-04-11 02:31:39.043+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
278	94	24	moving	2015-04-11 02:31:39.045+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
279	94	24	prepareinvoking	2015-04-11 02:31:39.048+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
280	94	24	invoked	2015-04-11 02:31:39.048+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
281	94	24	moving	2015-04-11 02:31:39.049+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
282	94	24	prepareinvoking	2015-04-11 02:31:39.051+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
283	94	24	invoked	2015-04-11 02:31:39.051+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
284	94	24	moving	2015-04-11 02:31:39.052+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
285	94	24	prepareinvoking	2015-04-11 02:31:39.053+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
286	94	24	invoked	2015-04-11 02:31:39.053+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
287	94	24	moving	2015-04-11 02:31:39.054+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
288	94	24	prepareinvoking	2015-04-11 02:31:39.055+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
289	94	24	invoked	2015-04-11 02:31:39.055+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
290	94	24	moving	2015-04-11 02:31:39.056+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
291	94	24	prepareinvoking	2015-04-11 02:31:39.056+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
292	94	24	invoked	2015-04-11 02:31:39.057+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
293	94	24	moving	2015-04-11 02:31:39.058+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
294	94	24	prepareinvoking	2015-04-11 02:31:39.059+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
295	94	24	invoked	2015-04-11 02:31:39.059+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
296	94	24	moving	2015-04-11 02:31:39.059+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
297	94	24	prepareinvoking	2015-04-11 02:31:39.06+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
298	94	24	invoked	2015-04-11 02:31:39.06+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
299	94	24	moving	2015-04-11 02:31:39.061+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
300	94	24	prepareinvoking	2015-04-11 02:31:39.063+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
301	94	24	invoked	2015-04-11 02:31:39.063+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
302	94	24	moving	2015-04-11 02:31:39.064+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
303	94	24	prepareinvoking	2015-04-11 02:31:39.065+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
304	94	24	invoked	2015-04-11 02:31:39.065+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
305	94	24	moving	2015-04-11 02:31:39.066+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
306	94	24	prepareinvoking	2015-04-11 02:31:39.067+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
307	94	24	invoked	2015-04-11 02:31:39.067+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
308	94	24	moving	2015-04-11 02:31:39.069+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
309	94	24	prepareinvoking	2015-04-11 02:31:39.07+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
310	94	24	invoked	2015-04-11 02:31:39.082+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
311	94	24	moving	2015-04-11 02:31:39.083+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
312	94	24	prepareinvoking	2015-04-11 02:31:39.085+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
313	94	24	invoked	2015-04-11 02:31:39.085+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
314	94	24	moving	2015-04-11 02:31:39.086+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
315	94	24	prepareinvoking	2015-04-11 02:31:39.088+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
316	94	24	invoked	2015-04-11 02:31:39.088+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
317	94	24	moving	2015-04-11 02:31:39.09+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
318	94	24	prepareinvoking	2015-04-11 02:31:39.091+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
319	94	24	invoked	2015-04-11 02:31:39.092+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
320	94	24	moving	2015-04-11 02:31:39.093+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
321	94	24	prepareinvoking	2015-04-11 02:31:39.095+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
322	94	24	invoked	2015-04-11 02:31:39.095+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
323	94	24	moving	2015-04-11 02:31:39.095+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
324	94	24	prepareinvoking	2015-04-11 02:31:39.097+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
325	94	24	invoked	2015-04-11 02:31:39.097+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
326	94	24	moving	2015-04-11 02:31:39.098+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
327	94	24	prepareinvoking	2015-04-11 02:31:39.099+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
328	94	24	invoked	2015-04-11 02:31:39.099+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
329	94	24	moving	2015-04-11 02:31:39.1+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
330	94	24	prepareinvoking	2015-04-11 02:31:39.102+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
331	94	24	invoked	2015-04-11 02:31:39.103+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
332	94	24	moving	2015-04-11 02:31:39.104+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
333	94	24	prepareinvoking	2015-04-11 02:31:39.105+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
334	94	24	invoked	2015-04-11 02:31:39.105+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
335	94	24	moving	2015-04-11 02:31:39.106+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
336	94	24	prepareinvoking	2015-04-11 02:31:39.108+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
337	94	24	invoked	2015-04-11 02:31:39.108+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
338	94	24	moving	2015-04-11 02:31:39.111+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
339	94	24	prepareinvoking	2015-04-11 02:31:39.113+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
340	94	24	invoked	2015-04-11 02:31:39.113+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
341	94	24	moving	2015-04-11 02:31:39.114+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
342	94	24	prepareinvoking	2015-04-11 02:31:39.115+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
343	94	24	invoked	2015-04-11 02:31:39.115+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
344	94	24	moving	2015-04-11 02:31:39.116+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
345	94	24	prepareinvoking	2015-04-11 02:31:39.117+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
346	94	24	invoked	2015-04-11 02:31:39.117+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
347	94	24	moving	2015-04-11 02:31:39.118+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
348	94	24	prepareinvoking	2015-04-11 02:31:39.121+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
349	94	24	invoked	2015-04-11 02:31:39.121+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
350	94	24	moving	2015-04-11 02:31:39.123+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
351	94	24	prepareinvoking	2015-04-11 02:31:39.125+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
352	94	24	invoked	2015-04-11 02:31:39.125+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
353	94	24	moving	2015-04-11 02:31:39.126+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
354	94	24	prepareinvoking	2015-04-11 02:31:39.128+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
355	94	24	invoked	2015-04-11 02:31:39.128+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
356	94	24	moving	2015-04-11 02:31:39.129+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
357	94	24	prepareinvoking	2015-04-11 02:31:39.13+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
358	94	24	invoked	2015-04-11 02:31:39.131+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
359	94	24	moving	2015-04-11 02:31:39.132+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
360	94	24	prepareinvoking	2015-04-11 02:31:39.133+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
361	94	24	invoked	2015-04-11 02:31:39.133+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
362	94	24	moving	2015-04-11 02:31:39.151+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
363	94	24	prepareinvoking	2015-04-11 02:31:39.152+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
364	94	24	invoked	2015-04-11 02:31:39.152+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
365	94	24	moving	2015-04-11 02:31:39.153+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
366	94	24	prepareinvoking	2015-04-11 02:31:39.154+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
367	94	24	invoked	2015-04-11 02:31:39.154+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
368	94	24	moving	2015-04-11 02:31:39.155+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
369	94	24	prepareinvoking	2015-04-11 02:31:39.156+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
370	94	24	invoked	2015-04-11 02:31:39.156+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
371	94	24	moving	2015-04-11 02:31:39.158+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
372	94	24	prepareinvoking	2015-04-11 02:31:39.161+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
373	94	24	invoked	2015-04-11 02:31:39.161+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
374	94	24	moving	2015-04-11 02:31:39.162+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
375	94	24	prepareinvoking	2015-04-11 02:31:39.163+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
376	94	24	invoked	2015-04-11 02:31:39.163+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
377	94	24	moving	2015-04-11 02:31:39.165+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
378	94	24	prepareinvoking	2015-04-11 02:31:39.166+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
379	94	24	invoked	2015-04-11 02:31:39.166+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
380	94	24	moving	2015-04-11 02:31:39.167+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
381	94	24	prepareinvoking	2015-04-11 02:31:39.169+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
382	94	24	invoked	2015-04-11 02:31:39.169+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
383	94	24	moving	2015-04-11 02:31:39.173+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
384	94	24	prepareinvoking	2015-04-11 02:31:39.174+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
385	94	24	invoked	2015-04-11 02:31:39.175+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
386	94	24	moving	2015-04-11 02:31:39.175+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
387	94	24	prepareinvoking	2015-04-11 02:31:39.177+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
388	94	24	invoked	2015-04-11 02:31:39.177+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
389	94	24	moving	2015-04-11 02:31:39.178+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
390	94	24	prepareinvoking	2015-04-11 02:31:39.179+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
391	94	24	invoked	2015-04-11 02:31:39.179+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
392	94	24	moving	2015-04-11 02:31:39.18+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
393	94	24	prepareinvoking	2015-04-11 02:31:39.213+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
394	94	24	invoked	2015-04-11 02:31:39.221+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
395	94	24	moving	2015-04-11 02:31:39.246+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
396	94	24	prepareinvoking	2015-04-11 02:31:39.249+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
397	94	24	invoked	2015-04-11 02:31:39.249+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
398	94	24	moving	2015-04-11 02:31:39.251+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
399	94	24	prepareinvoking	2015-04-11 02:31:39.252+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
400	94	24	invoked	2015-04-11 02:31:39.252+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
401	94	24	moving	2015-04-11 02:31:39.254+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
402	94	24	prepareinvoking	2015-04-11 02:31:39.255+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
403	94	24	invoked	2015-04-11 02:31:39.255+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
404	94	24	moving	2015-04-11 02:31:39.257+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
405	94	24	prepareinvoking	2015-04-11 02:31:39.258+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
406	94	24	invoked	2015-04-11 02:31:39.261+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
407	94	24	moving	2015-04-11 02:31:39.263+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
408	94	24	prepareinvoking	2015-04-11 02:31:39.265+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
409	94	24	invoked	2015-04-11 02:31:39.265+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
410	94	24	moving	2015-04-11 02:31:39.266+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
411	94	24	prepareinvoking	2015-04-11 02:31:39.268+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
412	94	24	invoked	2015-04-11 02:31:39.268+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
413	94	24	moving	2015-04-11 02:31:39.269+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
414	94	24	prepareinvoking	2015-04-11 02:31:39.283+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
415	94	24	invoked	2015-04-11 02:31:39.283+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
416	94	24	moving	2015-04-11 02:31:39.285+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
417	94	24	prepareinvoking	2015-04-11 02:31:39.286+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
418	94	24	invoked	2015-04-11 02:31:39.286+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
419	94	24	moving	2015-04-11 02:31:39.288+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
420	94	24	prepareinvoking	2015-04-11 02:31:39.29+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
421	94	24	invoked	2015-04-11 02:31:39.29+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
422	94	24	moving	2015-04-11 02:31:39.292+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
423	94	24	prepareinvoking	2015-04-11 02:31:39.293+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
424	94	24	invoked	2015-04-11 02:31:39.293+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
425	94	24	moving	2015-04-11 02:31:39.295+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
426	94	24	prepareinvoking	2015-04-11 02:31:39.296+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
427	94	24	invoked	2015-04-11 02:31:39.296+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
428	94	24	moving	2015-04-11 02:31:39.298+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
429	94	24	prepareinvoking	2015-04-11 02:31:39.299+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
430	94	24	invoked	2015-04-11 02:31:39.299+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
431	94	24	moving	2015-04-11 02:31:39.317+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
432	94	24	prepareinvoking	2015-04-11 02:31:39.319+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
433	94	24	invoked	2015-04-11 02:31:39.319+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
434	94	24	moving	2015-04-11 02:31:39.322+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
435	94	24	prepareinvoking	2015-04-11 02:31:39.324+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
436	94	24	invoked	2015-04-11 02:31:39.324+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
437	94	24	moving	2015-04-11 02:31:39.325+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
438	94	24	prepareinvoking	2015-04-11 02:31:39.327+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
439	94	24	invoked	2015-04-11 02:31:39.327+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
440	94	24	moving	2015-04-11 02:31:39.329+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
441	94	24	prepareinvoking	2015-04-11 02:31:39.332+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
442	94	24	invoked	2015-04-11 02:31:39.332+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
443	94	24	moving	2015-04-11 02:31:39.334+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
444	94	24	prepareinvoking	2015-04-11 02:31:39.336+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
445	94	24	invoked	2015-04-11 02:31:39.336+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
446	94	24	moving	2015-04-11 02:31:39.338+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
447	94	24	prepareinvoking	2015-04-11 02:31:39.341+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
448	94	24	invoked	2015-04-11 02:31:39.341+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
449	94	24	moving	2015-04-11 02:31:39.343+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
450	94	24	prepareinvoking	2015-04-11 02:31:39.344+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
451	94	24	invoked	2015-04-11 02:31:39.344+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
452	94	24	moving	2015-04-11 02:31:39.345+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
453	94	24	prepareinvoking	2015-04-11 02:31:39.346+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
454	94	24	invoked	2015-04-11 02:31:39.346+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
455	94	24	moving	2015-04-11 02:31:39.347+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
456	94	24	prepareinvoking	2015-04-11 02:31:39.349+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
457	94	24	invoked	2015-04-11 02:31:39.349+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
458	94	24	moving	2015-04-11 02:31:39.35+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
459	94	24	prepareinvoking	2015-04-11 02:31:39.351+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
460	94	24	invoked	2015-04-11 02:31:39.351+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
461	94	24	moving	2015-04-11 02:31:39.352+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
462	94	24	prepareinvoking	2015-04-11 02:31:39.353+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
463	94	24	invoked	2015-04-11 02:31:39.353+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
464	94	24	moving	2015-04-11 02:31:39.355+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
465	94	24	prepareinvoking	2015-04-11 02:31:39.356+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
466	94	24	invoked	2015-04-11 02:31:39.357+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
467	94	24	moving	2015-04-11 02:31:39.358+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
468	94	24	prepareinvoking	2015-04-11 02:31:39.364+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
469	94	24	invoked	2015-04-11 02:31:39.364+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
470	94	24	moving	2015-04-11 02:31:39.366+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
471	94	24	prepareinvoking	2015-04-11 02:31:39.368+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
472	94	24	invoked	2015-04-11 02:31:39.368+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
473	94	24	moving	2015-04-11 02:31:39.369+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
474	94	24	prepareinvoking	2015-04-11 02:31:39.371+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
475	94	24	invoked	2015-04-11 02:31:39.371+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
476	94	24	moving	2015-04-11 02:31:39.372+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
477	94	24	prepareinvoking	2015-04-11 02:31:39.374+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
478	94	24	invoked	2015-04-11 02:31:39.374+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
479	94	24	moving	2015-04-11 02:31:39.376+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
480	94	24	prepareinvoking	2015-04-11 02:31:39.385+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
481	94	24	invoked	2015-04-11 02:31:39.385+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
482	94	24	moving	2015-04-11 02:31:39.387+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
483	94	24	prepareinvoking	2015-04-11 02:31:39.389+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
484	94	24	invoked	2015-04-11 02:31:39.389+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
485	94	24	moving	2015-04-11 02:31:39.39+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
486	94	24	prepareinvoking	2015-04-11 02:31:39.392+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
487	94	24	invoked	2015-04-11 02:31:39.392+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
488	94	24	moving	2015-04-11 02:31:39.394+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
489	94	24	prepareinvoking	2015-04-11 02:31:39.396+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
490	94	24	invoked	2015-04-11 02:31:39.396+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
491	94	24	moving	2015-04-11 02:31:39.397+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
492	94	24	prepareinvoking	2015-04-11 02:31:39.399+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
493	94	24	invoked	2015-04-11 02:31:39.399+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
494	94	24	moving	2015-04-11 02:31:39.4+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
495	94	24	prepareinvoking	2015-04-11 02:31:39.402+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
496	94	24	invoked	2015-04-11 02:31:39.402+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
497	94	24	moving	2015-04-11 02:31:39.404+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
498	94	24	prepareinvoking	2015-04-11 02:31:39.407+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
499	94	24	invoked	2015-04-11 02:31:39.407+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
500	94	24	moving	2015-04-11 02:31:39.409+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
501	94	24	prepareinvoking	2015-04-11 02:31:39.41+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
502	94	24	invoked	2015-04-11 02:31:39.41+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
503	94	24	moving	2015-04-11 02:31:39.411+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
504	94	24	prepareinvoking	2015-04-11 02:31:39.413+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
505	94	24	invoked	2015-04-11 02:31:39.413+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
506	94	24	moving	2015-04-11 02:31:39.414+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
507	94	24	prepareinvoking	2015-04-11 02:31:39.416+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
508	94	24	invoked	2015-04-11 02:31:39.416+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
509	94	24	moving	2015-04-11 02:31:39.417+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
510	94	24	prepareinvoking	2015-04-11 02:31:39.418+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
511	94	24	invoked	2015-04-11 02:31:39.418+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
512	94	24	moving	2015-04-11 02:31:39.419+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
513	94	24	prepareinvoking	2015-04-11 02:31:39.42+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
514	94	24	invoked	2015-04-11 02:31:39.421+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
515	94	24	moving	2015-04-11 02:31:39.422+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
516	94	24	prepareinvoking	2015-04-11 02:31:39.424+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
517	94	24	invoked	2015-04-11 02:31:39.424+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
518	94	24	moving	2015-04-11 02:31:39.425+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
519	94	24	prepareinvoking	2015-04-11 02:31:39.426+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
520	94	24	invoked	2015-04-11 02:31:39.426+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
521	94	24	moving	2015-04-11 02:31:39.428+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
522	94	24	prepareinvoking	2015-04-11 02:31:39.429+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
523	94	24	invoked	2015-04-11 02:31:39.429+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
524	94	24	moving	2015-04-11 02:31:39.43+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
525	94	24	prepareinvoking	2015-04-11 02:31:39.431+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
526	94	24	invoked	2015-04-11 02:31:39.431+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
527	94	24	moving	2015-04-11 02:31:39.433+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
528	94	24	prepareinvoking	2015-04-11 02:31:39.435+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
529	94	24	invoked	2015-04-11 02:31:39.45+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
530	94	24	moving	2015-04-11 02:31:39.452+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
531	94	24	prepareinvoking	2015-04-11 02:31:39.454+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
532	94	24	invoked	2015-04-11 02:31:39.454+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
533	94	24	moving	2015-04-11 02:31:39.456+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
534	94	24	prepareinvoking	2015-04-11 02:31:39.458+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
535	94	24	invoked	2015-04-11 02:31:39.458+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
536	94	24	moving	2015-04-11 02:31:39.46+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
537	94	24	prepareinvoking	2015-04-11 02:31:39.462+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
538	94	24	invoked	2015-04-11 02:31:39.462+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
539	94	24	moving	2015-04-11 02:31:39.463+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
540	94	24	prepareinvoking	2015-04-11 02:31:39.465+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
541	94	24	invoked	2015-04-11 02:31:39.465+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
542	94	24	moving	2015-04-11 02:31:39.469+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
543	94	24	prepareinvoking	2015-04-11 02:31:39.473+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
544	94	24	invoked	2015-04-11 02:31:39.473+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
545	94	24	moving	2015-04-11 02:31:39.475+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
546	94	24	prepareinvoking	2015-04-11 02:31:39.477+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
547	94	24	invoked	2015-04-11 02:31:39.477+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
548	94	24	moving	2015-04-11 02:31:39.479+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
549	94	24	prepareinvoking	2015-04-11 02:31:39.481+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
550	94	24	invoked	2015-04-11 02:31:39.481+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
551	94	24	moving	2015-04-11 02:31:39.483+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
552	94	24	prepareinvoking	2015-04-11 02:31:39.485+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
553	94	24	invoked	2015-04-11 02:31:39.485+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
554	94	24	moving	2015-04-11 02:31:39.487+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
555	94	24	prepareinvoking	2015-04-11 02:31:39.489+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
556	94	24	invoked	2015-04-11 02:31:39.489+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
557	94	24	moving	2015-04-11 02:31:39.491+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
558	94	24	prepareinvoking	2015-04-11 02:31:39.492+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
559	94	24	invoked	2015-04-11 02:31:39.493+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
560	94	24	moving	2015-04-11 02:31:39.495+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
561	94	24	prepareinvoking	2015-04-11 02:31:39.498+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
562	94	24	invoked	2015-04-11 02:31:39.499+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
563	94	24	moving	2015-04-11 02:31:39.527+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
564	94	24	prepareinvoking	2015-04-11 02:31:39.531+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
565	94	24	invoked	2015-04-11 02:31:39.532+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
566	94	24	moving	2015-04-11 02:31:39.535+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
567	94	24	prepareinvoking	2015-04-11 02:31:39.538+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
568	94	24	invoked	2015-04-11 02:31:39.54+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
569	94	24	moving	2015-04-11 02:31:39.543+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
570	94	24	prepareinvoking	2015-04-11 02:31:39.545+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
571	94	24	invoked	2015-04-11 02:31:39.548+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
572	94	24	moving	2015-04-11 02:31:39.552+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
573	94	24	prepareinvoking	2015-04-11 02:31:39.556+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
574	94	24	invoked	2015-04-11 02:31:39.556+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
575	94	24	moving	2015-04-11 02:31:39.558+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
576	94	24	prepareinvoking	2015-04-11 02:31:39.56+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
577	94	24	invoked	2015-04-11 02:31:39.56+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
578	94	24	moving	2015-04-11 02:31:39.562+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
579	94	24	prepareinvoking	2015-04-11 02:31:39.564+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
580	94	24	invoked	2015-04-11 02:31:39.564+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
581	94	24	moving	2015-04-11 02:31:39.566+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
582	94	24	prepareinvoking	2015-04-11 02:31:39.57+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
583	94	24	invoked	2015-04-11 02:31:39.57+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
584	94	24	moving	2015-04-11 02:31:39.572+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
585	94	24	prepareinvoking	2015-04-11 02:31:39.574+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
586	94	24	invoked	2015-04-11 02:31:39.574+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
587	94	24	moving	2015-04-11 02:31:39.582+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
588	94	24	prepareinvoking	2015-04-11 02:31:39.585+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
589	94	24	invoked	2015-04-11 02:31:39.586+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
590	94	24	moving	2015-04-11 02:31:39.596+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
591	94	24	prepareinvoking	2015-04-11 02:31:39.61+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
592	94	24	invoked	2015-04-11 02:31:39.61+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
593	94	24	moving	2015-04-11 02:31:39.611+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
594	94	24	prepareinvoking	2015-04-11 02:31:39.613+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
595	94	24	invoked	2015-04-11 02:31:39.613+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
596	94	24	moving	2015-04-11 02:31:39.614+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
597	94	24	prepareinvoking	2015-04-11 02:31:39.615+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
598	94	24	invoked	2015-04-11 02:31:39.617+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
599	94	24	moving	2015-04-11 02:31:39.619+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
600	94	24	prepareinvoking	2015-04-11 02:31:39.623+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
601	94	24	invoked	2015-04-11 02:31:39.624+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
602	94	24	moving	2015-04-11 02:31:39.626+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
603	94	24	prepareinvoking	2015-04-11 02:31:39.628+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
604	94	24	invoked	2015-04-11 02:31:39.628+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
605	94	24	moving	2015-04-11 02:31:39.63+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
606	94	24	prepareinvoking	2015-04-11 02:31:39.632+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
607	94	24	invoked	2015-04-11 02:31:39.632+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
608	94	24	moving	2015-04-11 02:31:39.634+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
609	94	24	prepareinvoking	2015-04-11 02:31:39.636+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
610	94	24	invoked	2015-04-11 02:31:39.636+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
611	94	24	moving	2015-04-11 02:31:39.638+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
612	94	24	prepareinvoking	2015-04-11 02:31:39.64+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
613	94	24	invoked	2015-04-11 02:31:39.64+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
614	94	24	moving	2015-04-11 02:31:39.642+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
615	94	24	prepareinvoking	2015-04-11 02:31:39.643+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
616	94	24	invoked	2015-04-11 02:31:39.643+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
617	94	24	moving	2015-04-11 02:31:39.644+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
618	94	24	prepareinvoking	2015-04-11 02:31:39.646+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
619	94	24	invoked	2015-04-11 02:31:39.646+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
620	94	24	moving	2015-04-11 02:31:39.65+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
621	94	24	prepareinvoking	2015-04-11 02:31:39.662+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
622	94	24	invoked	2015-04-11 02:31:39.663+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
623	94	24	moving	2015-04-11 02:31:39.667+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
624	94	24	prepareinvoking	2015-04-11 02:31:39.67+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
625	94	24	invoked	2015-04-11 02:31:39.671+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
626	94	24	moving	2015-04-11 02:31:39.676+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
627	94	24	prepareinvoking	2015-04-11 02:31:39.679+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
628	94	24	invoked	2015-04-11 02:31:39.68+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
629	94	24	moving	2015-04-11 02:31:39.684+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
630	94	24	prepareinvoking	2015-04-11 02:31:39.687+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
631	94	24	invoked	2015-04-11 02:31:39.688+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
632	94	24	moving	2015-04-11 02:31:39.691+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
633	94	24	prepareinvoking	2015-04-11 02:31:39.695+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
634	94	24	invoked	2015-04-11 02:31:39.696+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
635	94	24	moving	2015-04-11 02:31:39.7+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
636	94	24	prepareinvoking	2015-04-11 02:31:39.704+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
637	94	24	invoked	2015-04-11 02:31:39.705+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
638	94	24	moving	2015-04-11 02:31:39.709+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
639	94	24	prepareinvoking	2015-04-11 02:31:39.71+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
640	94	24	invoked	2015-04-11 02:31:39.71+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
641	94	24	moving	2015-04-11 02:31:39.712+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
642	94	24	prepareinvoking	2015-04-11 02:31:39.713+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
643	94	24	invoked	2015-04-11 02:31:39.713+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
644	94	24	moving	2015-04-11 02:31:39.716+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
645	94	24	prepareinvoking	2015-04-11 02:31:39.718+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
646	94	24	invoked	2015-04-11 02:31:39.719+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
647	94	24	moving	2015-04-11 02:31:39.721+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
648	94	24	prepareinvoking	2015-04-11 02:31:39.723+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
649	94	24	invoked	2015-04-11 02:31:39.723+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
650	94	24	moving	2015-04-11 02:31:39.725+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
651	94	24	prepareinvoking	2015-04-11 02:31:39.727+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
652	94	24	invoked	2015-04-11 02:31:39.727+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
653	94	24	moving	2015-04-11 02:31:39.729+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
654	94	24	prepareinvoking	2015-04-11 02:31:39.731+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
655	94	24	invoked	2015-04-11 02:31:39.731+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
656	94	24	moving	2015-04-11 02:31:39.734+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
657	94	24	prepareinvoking	2015-04-11 02:31:39.736+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
658	94	24	invoked	2015-04-11 02:31:39.737+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
659	94	24	moving	2015-04-11 02:31:39.739+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
660	94	24	prepareinvoking	2015-04-11 02:31:39.741+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
661	94	24	invoked	2015-04-11 02:31:39.741+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
662	94	24	moving	2015-04-11 02:31:39.743+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
663	94	24	prepareinvoking	2015-04-11 02:31:39.746+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
664	94	24	invoked	2015-04-11 02:31:39.746+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
665	94	24	moving	2015-04-11 02:31:39.747+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
666	94	24	prepareinvoking	2015-04-11 02:31:39.753+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
667	94	24	invoked	2015-04-11 02:31:39.753+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
668	94	24	moving	2015-04-11 02:31:39.756+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
669	94	24	prepareinvoking	2015-04-11 02:31:39.758+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
670	94	24	invoked	2015-04-11 02:31:39.758+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
671	94	24	moving	2015-04-11 02:31:39.76+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
672	94	24	prepareinvoking	2015-04-11 02:31:39.762+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
673	94	24	invoked	2015-04-11 02:31:39.762+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
674	94	24	moving	2015-04-11 02:31:39.764+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
675	94	24	prepareinvoking	2015-04-11 02:31:39.766+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
676	94	24	invoked	2015-04-11 02:31:39.766+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
677	94	24	moving	2015-04-11 02:31:39.768+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
678	94	24	prepareinvoking	2015-04-11 02:31:39.77+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
679	94	24	invoked	2015-04-11 02:31:39.77+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
680	94	24	moving	2015-04-11 02:31:39.772+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
681	94	24	prepareinvoking	2015-04-11 02:31:39.774+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
682	94	24	invoked	2015-04-11 02:31:39.774+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
683	94	24	moving	2015-04-11 02:31:39.777+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
684	94	24	prepareinvoking	2015-04-11 02:31:39.779+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
685	94	24	invoked	2015-04-11 02:31:39.779+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
686	94	24	moving	2015-04-11 02:31:39.781+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
687	94	24	prepareinvoking	2015-04-11 02:31:39.784+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
688	94	24	invoked	2015-04-11 02:31:39.785+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
689	94	24	moving	2015-04-11 02:31:39.788+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
690	94	24	prepareinvoking	2015-04-11 02:31:39.792+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
691	94	24	invoked	2015-04-11 02:31:39.792+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
692	94	24	moving	2015-04-11 02:31:39.797+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
693	94	24	prepareinvoking	2015-04-11 02:31:39.8+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
694	94	24	invoked	2015-04-11 02:31:39.8+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
695	94	24	moving	2015-04-11 02:31:39.801+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
696	94	24	prepareinvoking	2015-04-11 02:31:39.803+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
697	94	24	invoked	2015-04-11 02:31:39.803+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
698	94	24	moving	2015-04-11 02:31:39.806+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
699	94	24	prepareinvoking	2015-04-11 02:31:39.808+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
700	94	24	invoked	2015-04-11 02:31:39.808+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
701	94	24	moving	2015-04-11 02:31:39.81+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
702	94	24	prepareinvoking	2015-04-11 02:31:39.812+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
703	94	24	invoked	2015-04-11 02:31:39.812+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
704	94	24	moving	2015-04-11 02:31:39.813+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
705	94	24	prepareinvoking	2015-04-11 02:31:39.815+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
706	94	24	invoked	2015-04-11 02:31:39.815+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
707	94	24	moving	2015-04-11 02:31:39.817+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
708	94	24	prepareinvoking	2015-04-11 02:31:39.818+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
709	94	24	invoked	2015-04-11 02:31:39.818+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
710	94	24	moving	2015-04-11 02:31:39.82+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
711	94	24	prepareinvoking	2015-04-11 02:31:39.822+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
712	94	24	invoked	2015-04-11 02:31:39.822+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
713	94	24	moving	2015-04-11 02:31:39.824+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
714	94	24	prepareinvoking	2015-04-11 02:31:39.826+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
715	94	24	invoked	2015-04-11 02:31:39.826+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
716	94	24	moving	2015-04-11 02:31:39.828+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
717	94	24	prepareinvoking	2015-04-11 02:31:39.83+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
718	94	24	invoked	2015-04-11 02:31:39.83+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
719	94	24	moving	2015-04-11 02:31:39.833+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
720	94	24	prepareinvoking	2015-04-11 02:31:39.835+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
721	94	24	invoked	2015-04-11 02:31:39.836+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
722	94	24	moving	2015-04-11 02:31:39.838+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
723	94	24	prepareinvoking	2015-04-11 02:31:39.84+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
724	94	24	invoked	2015-04-11 02:31:39.841+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
725	94	24	moving	2015-04-11 02:31:39.843+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
726	94	24	prepareinvoking	2015-04-11 02:31:39.845+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
727	94	24	invoked	2015-04-11 02:31:39.846+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
728	94	24	moving	2015-04-11 02:31:39.848+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
729	94	24	prepareinvoking	2015-04-11 02:31:39.851+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
730	94	24	invoked	2015-04-11 02:31:39.851+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
731	94	24	moving	2015-04-11 02:31:39.854+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
732	94	24	prepareinvoking	2015-04-11 02:31:39.856+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
733	94	24	invoked	2015-04-11 02:31:39.857+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
734	94	24	moving	2015-04-11 02:31:39.864+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
735	94	24	prepareinvoking	2015-04-11 02:31:39.866+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
736	94	24	invoked	2015-04-11 02:31:39.866+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
737	94	24	moving	2015-04-11 02:31:39.871+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
738	94	24	prepareinvoking	2015-04-11 02:31:39.873+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
739	94	24	invoked	2015-04-11 02:31:39.874+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
740	94	24	moving	2015-04-11 02:31:39.876+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
741	94	24	prepareinvoking	2015-04-11 02:31:39.879+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
742	94	24	invoked	2015-04-11 02:31:39.879+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
743	94	24	moving	2015-04-11 02:31:39.882+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
744	94	24	prepareinvoking	2015-04-11 02:31:39.885+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
745	94	24	invoked	2015-04-11 02:31:39.885+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
746	94	24	moving	2015-04-11 02:31:39.888+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
747	94	24	prepareinvoking	2015-04-11 02:31:39.89+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
748	94	24	invoked	2015-04-11 02:31:39.89+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
749	94	24	moving	2015-04-11 02:31:39.892+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
750	94	24	prepareinvoking	2015-04-11 02:31:39.895+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
751	94	24	invoked	2015-04-11 02:31:39.895+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
752	94	24	moving	2015-04-11 02:31:39.898+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
753	94	24	prepareinvoking	2015-04-11 02:31:39.9+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
754	94	24	invoked	2015-04-11 02:31:39.9+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
755	94	24	moving	2015-04-11 02:31:39.902+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
756	94	24	prepareinvoking	2015-04-11 02:31:39.905+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
757	94	24	invoked	2015-04-11 02:31:39.905+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
758	94	24	moving	2015-04-11 02:31:39.906+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
759	94	24	prepareinvoking	2015-04-11 02:31:39.908+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
760	94	24	invoked	2015-04-11 02:31:39.908+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
761	94	24	moving	2015-04-11 02:31:39.909+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
762	94	24	prepareinvoking	2015-04-11 02:31:39.913+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
763	94	24	invoked	2015-04-11 02:31:39.913+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
764	94	24	moving	2015-04-11 02:31:39.915+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
765	94	24	prepareinvoking	2015-04-11 02:31:39.917+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
766	94	24	invoked	2015-04-11 02:31:39.917+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
767	94	24	moving	2015-04-11 02:31:39.92+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
768	94	24	prepareinvoking	2015-04-11 02:31:39.923+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
769	94	24	invoked	2015-04-11 02:31:39.923+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
770	94	24	moving	2015-04-11 02:31:39.938+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
771	94	24	prepareinvoking	2015-04-11 02:31:39.943+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
772	94	24	invoked	2015-04-11 02:31:39.944+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
773	94	24	moving	2015-04-11 02:31:39.947+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
774	94	24	prepareinvoking	2015-04-11 02:31:39.952+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
775	94	24	invoked	2015-04-11 02:31:39.953+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
776	94	24	moving	2015-04-11 02:31:39.958+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
777	94	24	prepareinvoking	2015-04-11 02:31:39.962+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
778	94	24	invoked	2015-04-11 02:31:39.963+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
779	94	24	moving	2015-04-11 02:31:39.968+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
780	94	24	prepareinvoking	2015-04-11 02:31:39.972+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
781	94	24	invoked	2015-04-11 02:31:39.973+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
782	94	24	moving	2015-04-11 02:31:39.977+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
783	94	24	prepareinvoking	2015-04-11 02:31:39.982+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
784	94	24	invoked	2015-04-11 02:31:39.983+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
785	94	24	moving	2015-04-11 02:31:39.987+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
786	94	24	prepareinvoking	2015-04-11 02:31:39.992+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
787	94	24	invoked	2015-04-11 02:31:40.01+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
788	94	24	moving	2015-04-11 02:31:40.014+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
789	94	24	prepareinvoking	2015-04-11 02:31:40.018+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
790	94	24	invoked	2015-04-11 02:31:40.019+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
791	94	24	moving	2015-04-11 02:31:40.023+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
792	94	24	prepareinvoking	2015-04-11 02:31:40.027+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
793	94	24	invoked	2015-04-11 02:31:40.029+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
794	94	24	moving	2015-04-11 02:31:40.032+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
795	94	24	prepareinvoking	2015-04-11 02:31:40.034+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
796	94	24	invoked	2015-04-11 02:31:40.034+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
797	94	24	moving	2015-04-11 02:31:40.036+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
798	94	24	prepareinvoking	2015-04-11 02:31:40.038+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
799	94	24	invoked	2015-04-11 02:31:40.038+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
800	94	24	moving	2015-04-11 02:31:40.04+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
801	94	24	prepareinvoking	2015-04-11 02:31:40.042+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
802	94	24	invoked	2015-04-11 02:31:40.042+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
803	94	24	moving	2015-04-11 02:31:40.044+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
804	94	24	prepareinvoking	2015-04-11 02:31:40.046+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
805	94	24	invoked	2015-04-11 02:31:40.046+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
806	94	24	moving	2015-04-11 02:31:40.065+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
807	94	24	prepareinvoking	2015-04-11 02:31:40.069+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
808	94	24	invoked	2015-04-11 02:31:40.07+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
809	94	24	moving	2015-04-11 02:31:40.074+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
810	94	24	prepareinvoking	2015-04-11 02:31:40.078+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
811	94	24	invoked	2015-04-11 02:31:40.079+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
812	94	24	moving	2015-04-11 02:31:40.084+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
813	94	24	prepareinvoking	2015-04-11 02:31:40.088+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
814	94	24	invoked	2015-04-11 02:31:40.089+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
815	94	24	moving	2015-04-11 02:31:40.093+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
816	94	24	prepareinvoking	2015-04-11 02:31:40.097+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
817	94	24	invoked	2015-04-11 02:31:40.097+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
818	94	24	moving	2015-04-11 02:31:40.102+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
819	94	24	prepareinvoking	2015-04-11 02:31:40.107+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
820	94	24	invoked	2015-04-11 02:31:40.107+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
821	94	24	moving	2015-04-11 02:31:40.112+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
822	94	24	prepareinvoking	2015-04-11 02:31:40.118+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
823	94	24	invoked	2015-04-11 02:31:40.119+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
824	94	24	moving	2015-04-11 02:31:40.139+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
825	94	24	prepareinvoking	2015-04-11 02:31:40.144+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
826	94	24	invoked	2015-04-11 02:31:40.144+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
827	94	24	moving	2015-04-11 02:31:40.148+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
828	94	24	prepareinvoking	2015-04-11 02:31:40.15+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
829	94	24	invoked	2015-04-11 02:31:40.15+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
830	94	24	moving	2015-04-11 02:31:40.152+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
831	94	24	end	2015-04-11 02:31:40.154+06	t	0	0	{}	{}	{}	t	t	f	f	f	f
832	95	24	start	2015-04-11 02:33:35.945+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
833	95	24	moving	2015-04-11 02:33:35.953+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
834	95	24	prepareinvoking	2015-04-11 02:33:36.024+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
835	95	24	invoked	2015-04-11 02:33:36.025+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
836	95	24	moving	2015-04-11 02:33:36.026+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
837	95	24	prepareinvoking	2015-04-11 02:33:36.026+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
838	95	24	invoked	2015-04-11 02:33:36.026+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
839	95	24	moving	2015-04-11 02:33:36.027+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
840	95	24	prepareinvoking	2015-04-11 02:33:36.027+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
841	95	24	invoked	2015-04-11 02:33:36.027+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
842	95	24	moving	2015-04-11 02:33:36.028+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
843	95	24	prepareinvoking	2015-04-11 02:33:36.028+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
844	95	24	invoked	2015-04-11 02:33:36.028+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
845	95	24	moving	2015-04-11 02:33:36.029+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
846	95	24	prepareinvoking	2015-04-11 02:33:36.029+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
847	95	24	invoked	2015-04-11 02:33:36.029+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
848	95	24	moving	2015-04-11 02:33:36.03+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
849	95	24	prepareinvoking	2015-04-11 02:33:36.03+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
850	95	24	invoked	2015-04-11 02:33:36.031+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
851	95	24	moving	2015-04-11 02:33:36.031+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
852	95	24	prepareinvoking	2015-04-11 02:33:36.031+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
853	95	24	invoked	2015-04-11 02:33:36.032+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
854	95	24	moving	2015-04-11 02:33:36.032+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
855	95	24	prepareinvoking	2015-04-11 02:33:36.033+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
856	95	24	invoked	2015-04-11 02:33:36.033+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
857	95	24	moving	2015-04-11 02:33:36.033+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
858	95	24	prepareinvoking	2015-04-11 02:33:36.034+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
859	95	24	invoked	2015-04-11 02:33:36.07+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
860	95	24	moving	2015-04-11 02:33:36.071+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
861	95	24	prepareinvoking	2015-04-11 02:33:36.072+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
862	95	24	invoked	2015-04-11 02:33:36.072+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
863	95	24	moving	2015-04-11 02:33:36.072+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
864	95	24	prepareinvoking	2015-04-11 02:33:36.073+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
865	95	24	invoked	2015-04-11 02:33:36.073+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
866	95	24	moving	2015-04-11 02:33:36.074+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
867	95	24	prepareinvoking	2015-04-11 02:33:36.074+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
868	95	24	invoked	2015-04-11 02:33:36.074+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
869	95	24	moving	2015-04-11 02:33:36.075+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
870	95	24	prepareinvoking	2015-04-11 02:33:36.076+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
871	95	24	invoked	2015-04-11 02:33:36.076+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
872	95	24	moving	2015-04-11 02:33:36.076+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
873	95	24	prepareinvoking	2015-04-11 02:33:36.077+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
874	95	24	invoked	2015-04-11 02:33:36.077+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
875	95	24	moving	2015-04-11 02:33:36.077+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
876	95	24	prepareinvoking	2015-04-11 02:33:36.078+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
877	95	24	invoked	2015-04-11 02:33:36.078+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
878	95	24	moving	2015-04-11 02:33:36.079+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
879	95	24	end	2015-04-11 02:33:36.08+06	t	0	0	{}	{}	{}	t	t	f	f	f	f
880	96	24	start	2015-04-11 02:35:23.046+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
881	96	24	moving	2015-04-11 02:35:23.054+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
882	96	24	prepareinvoking	2015-04-11 02:35:23.099+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
883	96	24	invoked	2015-04-11 02:35:23.101+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
884	96	24	moving	2015-04-11 02:35:23.106+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
885	96	24	prepareinvoking	2015-04-11 02:35:23.106+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
886	96	24	invoked	2015-04-11 02:35:23.106+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
887	96	24	moving	2015-04-11 02:35:23.108+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
888	96	24	prepareinvoking	2015-04-11 02:35:23.109+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
889	96	24	invoked	2015-04-11 02:35:23.109+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
890	96	24	moving	2015-04-11 02:35:23.109+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
891	96	24	prepareinvoking	2015-04-11 02:35:23.11+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
892	96	24	invoked	2015-04-11 02:35:23.11+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
893	96	24	moving	2015-04-11 02:35:23.111+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
894	96	24	prepareinvoking	2015-04-11 02:35:23.111+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
895	96	24	invoked	2015-04-11 02:35:23.111+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
896	96	24	moving	2015-04-11 02:35:23.112+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
897	96	24	prepareinvoking	2015-04-11 02:35:23.112+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
898	96	24	invoked	2015-04-11 02:35:23.112+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
899	96	24	moving	2015-04-11 02:35:23.113+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
900	96	24	prepareinvoking	2015-04-11 02:35:23.113+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
901	96	24	invoked	2015-04-11 02:35:23.113+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
902	96	24	moving	2015-04-11 02:35:23.114+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
903	96	24	prepareinvoking	2015-04-11 02:35:23.114+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
904	96	24	invoked	2015-04-11 02:35:23.114+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
905	96	24	moving	2015-04-11 02:35:23.115+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
906	96	24	prepareinvoking	2015-04-11 02:35:23.115+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
907	96	24	invoked	2015-04-11 02:35:23.116+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
908	96	24	moving	2015-04-11 02:35:23.116+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
909	96	24	prepareinvoking	2015-04-11 02:35:23.117+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
910	96	24	invoked	2015-04-11 02:35:23.117+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
911	96	24	moving	2015-04-11 02:35:23.129+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
912	96	24	prepareinvoking	2015-04-11 02:35:23.132+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
913	96	24	invoked	2015-04-11 02:35:23.132+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
914	96	24	moving	2015-04-11 02:35:23.132+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
915	96	24	prepareinvoking	2015-04-11 02:35:23.133+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
916	96	24	invoked	2015-04-11 02:35:23.133+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
917	96	24	moving	2015-04-11 02:35:23.133+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
918	96	24	prepareinvoking	2015-04-11 02:35:23.134+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
919	96	24	invoked	2015-04-11 02:35:23.134+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
920	96	24	moving	2015-04-11 02:35:23.135+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
921	96	24	prepareinvoking	2015-04-11 02:35:23.135+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
922	96	24	invoked	2015-04-11 02:35:23.135+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
923	96	24	moving	2015-04-11 02:35:23.136+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
924	96	24	prepareinvoking	2015-04-11 02:35:23.137+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
925	96	24	invoked	2015-04-11 02:35:23.137+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
926	96	24	moving	2015-04-11 02:35:23.137+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
927	96	24	end	2015-04-11 02:35:23.138+06	t	0	0	{}	{}	{}	t	t	f	f	f	f
928	97	24	start	2015-04-11 02:40:40.836+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
929	97	24	moving	2015-04-11 02:40:40.838+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
930	97	24	prepareinvoking	2015-04-11 02:40:40.877+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
931	97	24	invoked	2015-04-11 02:40:40.878+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
932	97	24	moving	2015-04-11 02:40:40.879+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
933	97	24	prepareinvoking	2015-04-11 02:40:40.879+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
934	97	24	invoked	2015-04-11 02:40:40.879+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
935	97	24	moving	2015-04-11 02:40:40.88+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
936	97	24	prepareinvoking	2015-04-11 02:40:40.88+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
937	97	24	invoked	2015-04-11 02:40:40.881+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
938	97	24	moving	2015-04-11 02:40:40.881+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
939	97	24	prepareinvoking	2015-04-11 02:40:40.882+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
940	97	24	invoked	2015-04-11 02:40:40.882+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
941	97	24	moving	2015-04-11 02:40:40.883+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
942	97	24	prepareinvoking	2015-04-11 02:40:40.883+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
943	97	24	invoked	2015-04-11 02:40:40.883+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
944	97	24	moving	2015-04-11 02:40:40.884+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
945	97	24	prepareinvoking	2015-04-11 02:40:40.884+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
946	97	24	invoked	2015-04-11 02:40:40.884+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
947	97	24	moving	2015-04-11 02:40:40.885+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
948	97	24	prepareinvoking	2015-04-11 02:40:40.885+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
949	97	24	invoked	2015-04-11 02:40:40.886+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
950	97	24	moving	2015-04-11 02:40:40.886+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
951	97	24	prepareinvoking	2015-04-11 02:40:40.887+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
952	97	24	invoked	2015-04-11 02:40:40.887+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
953	97	24	moving	2015-04-11 02:40:40.887+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
954	97	24	prepareinvoking	2015-04-11 02:40:40.888+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
955	97	24	invoked	2015-04-11 02:40:40.924+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
956	97	24	moving	2015-04-11 02:40:40.926+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
957	97	24	prepareinvoking	2015-04-11 02:40:40.928+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
958	97	24	invoked	2015-04-11 02:40:40.928+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
959	97	24	moving	2015-04-11 02:40:40.929+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
960	97	24	prepareinvoking	2015-04-11 02:40:40.931+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
961	97	24	invoked	2015-04-11 02:40:40.931+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
962	97	24	moving	2015-04-11 02:40:40.932+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
963	97	24	prepareinvoking	2015-04-11 02:40:40.933+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
964	97	24	invoked	2015-04-11 02:40:40.933+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
965	97	24	moving	2015-04-11 02:40:40.934+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
966	97	24	prepareinvoking	2015-04-11 02:40:40.935+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
967	97	24	invoked	2015-04-11 02:40:40.935+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
968	97	24	moving	2015-04-11 02:40:40.935+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
969	97	24	prepareinvoking	2015-04-11 02:40:40.936+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
970	97	24	invoked	2015-04-11 02:40:40.936+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
971	97	24	moving	2015-04-11 02:40:40.936+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
972	97	24	prepareinvoking	2015-04-11 02:40:40.937+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
973	97	24	invoked	2015-04-11 02:40:40.937+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
974	97	24	moving	2015-04-11 02:40:40.938+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
975	97	24	end	2015-04-11 02:40:40.938+06	t	0	0	{}	{}	{}	t	t	f	f	f	f
976	100	24	start	2015-04-11 02:53:47.729+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
977	100	24	moving	2015-04-11 02:53:47.733+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
978	100	24	prepareinvoking	2015-04-11 02:53:47.857+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
979	100	24	invoked	2015-04-11 02:53:47.86+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
980	100	24	moving	2015-04-11 02:53:47.861+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
981	100	24	prepareinvoking	2015-04-11 02:53:47.865+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
982	100	24	invoked	2015-04-11 02:53:47.866+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
983	100	24	moving	2015-04-11 02:53:47.876+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
984	100	24	prepareinvoking	2015-04-11 02:53:47.878+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
985	100	24	invoked	2015-04-11 02:53:47.879+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
986	100	24	moving	2015-04-11 02:53:47.879+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
987	100	24	prepareinvoking	2015-04-11 02:53:47.881+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
988	100	24	invoked	2015-04-11 02:53:47.881+06	t	4	0	{}	{}	{}	t	f	f	f	f	f
989	100	24	moving	2015-04-11 02:53:47.882+06	t	4	0	{}	{}	{}	t	f	f	f	f	f
990	100	24	end	2015-04-11 02:53:47.882+06	t	4	0	{}	{}	{}	t	t	f	f	f	f
991	101	24	start	2015-04-12 08:59:11.474+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
992	101	24	moving	2015-04-12 08:59:11.482+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
993	101	24	prepareinvoking	2015-04-12 08:59:11.558+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
994	101	24	invoked	2015-04-12 08:59:11.56+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
995	101	24	moving	2015-04-12 08:59:11.561+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
996	101	24	prepareinvoking	2015-04-12 08:59:11.562+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
997	101	24	invoked	2015-04-12 08:59:11.563+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
998	101	24	moving	2015-04-12 08:59:11.564+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
999	101	24	prepareinvoking	2015-04-12 08:59:11.566+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1000	101	24	invoked	2015-04-12 08:59:11.566+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
1001	101	24	moving	2015-04-12 08:59:11.567+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
1002	101	24	prepareinvoking	2015-04-12 08:59:11.568+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
1003	101	24	invoked	2015-04-12 08:59:11.568+06	t	4	0	{}	{}	{}	t	f	f	f	f	f
1004	101	24	moving	2015-04-12 08:59:11.569+06	t	4	0	{}	{}	{}	t	f	f	f	f	f
1005	101	24	end	2015-04-12 08:59:11.569+06	t	4	0	{}	{}	{}	t	t	f	f	f	f
1006	102	24	start	2015-04-13 18:25:48.129+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1007	102	24	moving	2015-04-13 18:25:48.131+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1008	102	24	prepareinvoking	2015-04-13 18:25:48.317+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1009	102	24	invoked	2015-04-13 18:25:48.32+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1010	102	24	moving	2015-04-13 18:25:48.322+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1011	102	24	prepareinvoking	2015-04-13 18:25:48.323+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1012	102	24	invoked	2015-04-13 18:25:48.323+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1013	102	24	moving	2015-04-13 18:25:48.325+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1014	102	24	prepareinvoking	2015-04-13 18:25:48.34+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1015	102	24	invoked	2015-04-13 18:25:48.341+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
1016	102	24	moving	2015-04-13 18:25:48.342+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
1017	102	24	prepareinvoking	2015-04-13 18:25:48.343+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
1018	102	24	invoked	2015-04-13 18:25:48.343+06	t	4	0	{}	{}	{}	t	f	f	f	f	f
1019	102	24	moving	2015-04-13 18:25:48.344+06	t	4	0	{}	{}	{}	t	f	f	f	f	f
1020	102	24	end	2015-04-13 18:25:48.344+06	t	4	0	{}	{}	{}	t	t	f	f	f	f
1021	103	24	start	2015-04-15 05:19:25.15+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1022	103	24	moving	2015-04-15 05:19:25.159+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1023	103	24	prepareinvoking	2015-04-15 05:19:25.386+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1024	103	24	invoked	2015-04-15 05:19:25.436+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1025	103	24	moving	2015-04-15 05:19:25.436+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1026	103	24	prepareinvoking	2015-04-15 05:19:25.437+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1027	103	24	invoked	2015-04-15 05:19:25.438+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1028	103	24	moving	2015-04-15 05:19:25.438+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1029	103	24	prepareinvoking	2015-04-15 05:19:25.438+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1030	103	24	invoked	2015-04-15 05:19:25.439+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
1031	103	24	moving	2015-04-15 05:19:25.439+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
1032	103	24	prepareinvoking	2015-04-15 05:19:25.44+06	t	3	0	{}	{}	{}	t	f	f	f	f	f
1033	103	24	invoked	2015-04-15 05:19:25.44+06	t	4	0	{}	{}	{}	t	f	f	f	f	f
1034	103	24	moving	2015-04-15 05:19:25.44+06	t	4	0	{}	{}	{}	t	f	f	f	f	f
1035	103	24	end	2015-04-15 05:19:25.441+06	t	4	0	{}	{}	{}	t	t	f	f	f	f
1036	104	45	start	2015-04-28 06:29:07.174+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1037	104	45	moving	2015-04-28 06:29:07.188+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1038	104	45	prepareinvoking	2015-04-28 06:29:07.285+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1039	104	45	invoked	2015-04-28 06:29:07.334+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1040	104	45	moving	2015-04-28 06:29:07.336+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1041	104	45	prepareinvoking	2015-04-28 06:29:07.339+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1042	104	45	invoked	2015-04-28 06:29:07.34+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1043	104	45	moving	2015-04-28 06:29:07.345+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1044	104	45	end	2015-04-28 06:29:07.347+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1045	106	45	start	2015-04-28 06:48:42.962+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1046	106	45	moving	2015-04-28 06:48:42.971+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1047	106	45	prepareinvoking	2015-04-28 06:48:43.081+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1048	106	45	invoked	2015-04-28 06:48:43.13+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1049	106	45	moving	2015-04-28 06:48:43.131+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1050	106	45	prepareinvoking	2015-04-28 06:48:43.133+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1051	106	45	invoked	2015-04-28 06:48:43.133+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1052	106	45	moving	2015-04-28 06:48:43.133+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1053	106	45	end	2015-04-28 06:48:43.134+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1054	107	45	start	2015-04-28 19:22:29.556+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1055	107	45	moving	2015-04-28 19:22:29.566+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1056	107	45	prepareinvoking	2015-04-28 19:22:29.951+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1057	107	45	invoked	2015-04-28 19:22:29.999+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1058	107	45	moving	2015-04-28 19:22:30.004+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1059	107	45	prepareinvoking	2015-04-28 19:22:30.008+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1060	107	45	invoked	2015-04-28 19:22:30.01+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1061	107	45	moving	2015-04-28 19:22:30.015+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1062	107	45	end	2015-04-28 19:22:30.02+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1063	113	46	start	2015-04-29 06:03:22.426+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1064	113	46	moving	2015-04-29 06:03:22.428+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1065	113	46	prepareinvoking	2015-04-29 06:03:22.465+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1066	113	46	invoked	2015-04-29 06:03:22.47+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1067	113	46	moving	2015-04-29 06:03:22.472+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1068	113	46	paused	2015-04-29 06:03:22.473+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1069	114	46	start	2015-04-29 06:05:50.562+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1070	114	46	moving	2015-04-29 06:05:50.567+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1071	114	46	prepareinvoking	2015-04-29 06:05:50.685+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1072	114	46	invoked	2015-04-29 06:05:50.687+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1073	114	46	moving	2015-04-29 06:05:50.688+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1074	114	46	paused	2015-04-29 06:05:50.688+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1075	116	46	start	2015-04-29 07:47:48.605+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1076	116	46	moving	2015-04-29 07:47:48.616+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1077	116	46	prepareinvoking	2015-04-29 07:47:48.908+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1078	116	46	invoked	2015-04-29 07:47:48.957+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1079	116	46	moving	2015-04-29 07:47:48.959+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1080	116	46	paused	2015-04-29 07:47:48.959+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1081	117	46	start	2015-04-29 07:50:21.027+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1082	117	46	moving	2015-04-29 07:50:21.033+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1083	117	46	prepareinvoking	2015-04-29 07:50:21.128+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1084	117	46	invoked	2015-04-29 07:50:21.136+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1085	117	46	moving	2015-04-29 07:50:21.138+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1086	117	46	paused	2015-04-29 07:50:21.138+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1087	118	46	start	2015-04-29 07:52:27.178+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1088	118	46	moving	2015-04-29 07:52:27.18+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1089	118	46	prepareinvoking	2015-04-29 07:52:27.215+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1090	118	46	invoked	2015-04-29 07:52:27.218+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1091	118	46	moving	2015-04-29 07:52:27.219+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1092	118	46	paused	2015-04-29 07:52:27.219+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1093	119	46	start	2015-04-30 06:43:47.314+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1094	119	46	moving	2015-04-30 06:43:47.328+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1095	119	46	prepareinvoking	2015-04-30 06:43:47.447+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1096	119	46	invoked	2015-04-30 06:43:47.493+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1097	119	46	moving	2015-04-30 06:43:47.497+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1098	119	46	paused	2015-04-30 06:43:47.498+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1099	119	46	start	2015-04-30 06:43:50.582+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1100	119	46	moving	2015-04-30 06:43:50.582+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1101	119	46	prepareinvoking	2015-04-30 06:43:50.584+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1102	119	46	invoked	2015-04-30 06:43:50.585+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1103	119	46	moving	2015-04-30 06:43:50.585+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1104	119	46	paused	2015-04-30 06:43:50.585+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1105	120	46	start	2015-04-30 09:52:39.032+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1106	120	46	moving	2015-04-30 09:52:39.035+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1107	120	46	prepareinvoking	2015-04-30 09:52:39.204+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1108	120	46	invoked	2015-04-30 09:52:39.258+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1109	120	46	moving	2015-04-30 09:52:39.26+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1110	120	46	paused	2015-04-30 09:52:39.26+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1111	120	46	start	2015-04-30 09:52:44.725+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1112	120	46	moving	2015-04-30 09:52:44.725+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1113	120	46	prepareinvoking	2015-04-30 09:52:44.728+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1114	120	46	invoked	2015-04-30 09:52:44.728+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1115	120	46	moving	2015-04-30 09:52:44.728+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1116	120	46	paused	2015-04-30 09:52:44.728+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1117	121	46	start	2015-05-01 02:53:00.106+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1118	121	46	moving	2015-05-01 02:53:00.117+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1119	121	46	prepareinvoking	2015-05-01 02:53:00.277+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1120	121	46	invoked	2015-05-01 02:53:00.326+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1121	121	46	moving	2015-05-01 02:53:00.327+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1122	121	46	paused	2015-05-01 02:53:00.327+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1123	121	46	start	2015-05-01 02:53:04.603+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1124	121	46	moving	2015-05-01 02:53:04.605+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1125	121	46	prepareinvoking	2015-05-01 02:53:04.607+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1126	121	46	invoked	2015-05-01 02:53:04.607+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1127	121	46	moving	2015-05-01 02:53:04.608+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1128	121	46	paused	2015-05-01 02:53:04.608+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1129	122	46	start	2015-05-01 04:10:37.037+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1130	122	46	moving	2015-05-01 04:10:37.05+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1131	122	46	prepareinvoking	2015-05-01 04:10:37.218+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1132	122	46	invoked	2015-05-01 04:10:37.262+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1133	122	46	moving	2015-05-01 04:10:37.262+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1134	122	46	paused	2015-05-01 04:10:37.263+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1135	122	46	start	2015-05-01 04:30:13.594+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1136	122	46	moving	2015-05-01 04:30:13.596+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1137	122	46	prepareinvoking	2015-05-01 04:30:13.598+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1138	122	46	invoked	2015-05-01 04:30:13.599+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1139	122	46	moving	2015-05-01 04:30:13.599+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1140	122	46	paused	2015-05-01 04:30:13.599+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1141	123	46	start	2015-05-01 04:36:58.265+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1142	123	46	moving	2015-05-01 04:36:58.275+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1143	123	46	prepareinvoking	2015-05-01 04:36:58.498+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1144	123	46	invoked	2015-05-01 04:36:58.544+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1145	123	46	moving	2015-05-01 04:36:58.545+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1146	123	46	paused	2015-05-01 04:36:58.545+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1147	123	46	start	2015-05-01 04:37:24.733+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1148	123	46	moving	2015-05-01 04:37:24.734+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1149	123	46	prepareinvoking	2015-05-01 04:37:24.736+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1150	123	46	invoked	2015-05-01 04:37:24.736+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1151	123	46	moving	2015-05-01 04:37:24.737+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1152	123	46	paused	2015-05-01 04:37:24.737+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1153	124	46	start	2015-05-01 04:44:43.694+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1154	124	46	moving	2015-05-01 04:44:43.708+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1155	124	46	prepareinvoking	2015-05-01 04:44:43.893+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1156	124	46	invoked	2015-05-01 04:44:43.938+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1157	124	46	moving	2015-05-01 04:44:43.94+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1158	124	46	paused	2015-05-01 04:44:43.94+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1159	124	46	start	2015-05-01 04:44:49.084+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1160	124	46	moving	2015-05-01 04:44:49.085+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1161	124	46	prepareinvoking	2015-05-01 04:44:49.087+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1162	124	46	invoked	2015-05-01 04:44:49.088+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1163	124	46	moving	2015-05-01 04:44:49.09+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1164	124	46	paused	2015-05-01 04:44:49.09+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1165	125	46	start	2015-05-01 04:51:55.356+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1166	125	46	moving	2015-05-01 04:51:55.372+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1167	125	46	prepareinvoking	2015-05-01 04:51:55.535+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1168	125	46	invoked	2015-05-01 04:51:55.572+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1169	125	46	moving	2015-05-01 04:51:55.574+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1170	125	46	paused	2015-05-01 04:51:55.574+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1171	125	46	start	2015-05-01 04:52:02.161+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1172	125	46	moving	2015-05-01 04:52:02.162+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1173	125	46	prepareinvoking	2015-05-01 04:52:02.166+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1174	125	46	invoked	2015-05-01 04:52:02.166+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1175	125	46	moving	2015-05-01 04:52:02.167+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1176	125	46	paused	2015-05-01 04:52:02.167+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1177	126	46	start	2015-05-01 04:55:52.417+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1178	126	46	moving	2015-05-01 04:55:52.428+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1179	126	46	prepareinvoking	2015-05-01 04:55:52.528+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1180	126	46	invoked	2015-05-01 04:55:52.565+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1181	126	46	moving	2015-05-01 04:55:52.57+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1182	126	46	paused	2015-05-01 04:55:52.57+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1183	130	46	start	2015-05-01 05:42:02.214+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1184	130	46	moving	2015-05-01 05:42:02.247+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1185	130	46	prepareinvoking	2015-05-01 05:42:02.455+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1186	130	46	invoked	2015-05-01 05:42:02.488+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1187	130	46	moving	2015-05-01 05:42:02.489+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1188	130	46	paused	2015-05-01 05:42:02.489+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1189	130	46	start	2015-05-01 05:45:02.809+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1190	130	46	moving	2015-05-01 05:45:02.815+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1191	130	46	prepareinvoking	2015-05-01 05:45:02.818+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1192	130	46	invoked	2015-05-01 05:45:02.818+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1193	130	46	moving	2015-05-01 05:45:02.819+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1194	130	46	paused	2015-05-01 05:45:02.819+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1195	131	46	start	2015-05-01 05:57:44.197+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1196	131	46	moving	2015-05-01 05:57:44.208+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1197	131	46	prepareinvoking	2015-05-01 05:57:44.408+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1198	131	46	invoked	2015-05-01 05:57:44.469+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1199	131	46	moving	2015-05-01 05:57:44.472+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1200	131	46	paused	2015-05-01 05:57:44.473+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1201	132	46	start	2015-05-01 06:31:08.819+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1202	132	46	moving	2015-05-01 06:31:08.831+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1203	132	46	prepareinvoking	2015-05-01 06:31:08.939+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1204	132	46	invoked	2015-05-01 06:31:08.975+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1205	132	46	moving	2015-05-01 06:31:08.976+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1206	132	46	paused	2015-05-01 06:31:08.976+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1207	132	46	start	2015-05-01 07:55:41.544+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1208	132	46	moving	2015-05-01 07:55:41.545+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1209	132	46	prepareinvoking	2015-05-01 07:55:41.548+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1210	132	46	invoked	2015-05-01 07:55:41.548+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1211	132	46	moving	2015-05-01 07:55:41.549+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1212	132	46	paused	2015-05-01 07:55:41.549+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1213	134	46	start	2015-05-01 07:59:56.169+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1214	134	46	moving	2015-05-01 07:59:56.172+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1215	134	46	prepareinvoking	2015-05-01 07:59:56.311+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1216	134	46	invoked	2015-05-01 07:59:56.317+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1217	134	46	moving	2015-05-01 07:59:56.318+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1218	134	46	paused	2015-05-01 07:59:56.318+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1219	135	46	start	2015-05-01 08:02:35.383+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1220	135	46	moving	2015-05-01 08:02:35.392+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1221	135	46	prepareinvoking	2015-05-01 08:02:35.45+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1222	135	46	invoked	2015-05-01 08:02:35.456+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1223	135	46	moving	2015-05-01 08:02:35.457+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1224	135	46	paused	2015-05-01 08:02:35.457+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1225	136	46	start	2015-05-01 08:06:55.423+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1226	136	46	moving	2015-05-01 08:06:55.434+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1227	136	46	prepareinvoking	2015-05-01 08:06:55.519+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1228	136	46	invoked	2015-05-01 08:06:55.63+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1229	136	46	moving	2015-05-01 08:06:55.632+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1230	136	46	paused	2015-05-01 08:06:55.632+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1231	137	46	start	2015-05-01 08:09:57.339+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1232	137	46	moving	2015-05-01 08:09:57.347+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1233	137	46	prepareinvoking	2015-05-01 08:09:57.454+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1234	137	46	invoked	2015-05-01 08:09:57.457+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1235	137	46	moving	2015-05-01 08:09:57.458+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1236	137	46	paused	2015-05-01 08:09:57.458+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1237	138	46	start	2015-05-01 08:13:15.641+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1238	138	46	moving	2015-05-01 08:13:15.652+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1239	138	46	prepareinvoking	2015-05-01 08:13:16.19+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1240	138	46	invoked	2015-05-01 08:13:16.194+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1241	138	46	moving	2015-05-01 08:13:16.195+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1242	138	46	paused	2015-05-01 08:13:16.195+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1243	138	46	start	2015-05-01 08:16:02.409+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1244	138	46	moving	2015-05-01 08:16:02.411+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1245	138	46	prepareinvoking	2015-05-01 08:16:02.413+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1246	138	46	invoked	2015-05-01 08:16:02.426+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1247	138	46	moving	2015-05-01 08:16:02.427+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1248	138	46	paused	2015-05-01 08:16:02.427+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1249	139	46	start	2015-05-01 08:31:09.946+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1250	139	46	moving	2015-05-01 08:31:09.949+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1251	139	46	prepareinvoking	2015-05-01 08:31:09.998+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1252	139	46	invoked	2015-05-01 08:31:10.004+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1253	139	46	moving	2015-05-01 08:31:10.005+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1254	139	46	paused	2015-05-01 08:31:10.006+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1255	139	46	start	2015-05-01 08:32:23.032+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1256	139	46	moving	2015-05-01 08:32:23.035+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1257	139	46	prepareinvoking	2015-05-01 08:32:23.038+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1258	139	46	invoked	2015-05-01 08:32:23.041+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1259	139	46	moving	2015-05-01 08:32:23.042+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1260	139	46	paused	2015-05-01 08:32:23.042+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1261	140	46	start	2015-05-01 08:58:42.775+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1262	140	46	moving	2015-05-01 08:58:42.79+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1263	140	46	prepareinvoking	2015-05-01 08:58:42.906+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1264	140	46	invoked	2015-05-01 20:37:31.284+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1265	140	46	moving	2015-05-01 20:37:36.908+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1266	140	46	paused	2015-05-01 20:37:38.674+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1267	140	46	start	2015-05-01 20:38:31.778+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1268	140	46	moving	2015-05-01 20:38:31.779+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1269	140	46	prepareinvoking	2015-05-01 20:38:31.929+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1270	140	46	invoked	2015-05-01 20:38:31.975+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1271	140	46	moving	2015-05-01 20:38:31.976+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1272	140	46	paused	2015-05-01 20:38:31.976+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1273	144	46	start	2015-05-02 04:05:47.248+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1274	144	46	moving	2015-05-02 04:05:47.262+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1275	144	46	prepareinvoking	2015-05-02 04:05:47.52+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1276	144	46	invoked	2015-05-02 04:06:11.164+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1277	144	46	moving	2015-05-02 04:06:11.165+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1278	144	46	paused	2015-05-02 04:06:11.166+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1279	145	46	start	2015-05-02 04:11:34.278+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1280	145	46	moving	2015-05-02 04:11:34.285+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1281	145	46	prepareinvoking	2015-05-02 04:11:34.471+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1282	145	46	invoked	2015-05-02 04:11:47.85+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1283	145	46	moving	2015-05-02 04:11:47.853+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1284	145	46	paused	2015-05-02 04:11:47.853+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1285	146	46	start	2015-05-02 04:33:17.851+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1286	146	46	moving	2015-05-02 04:33:17.854+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1287	146	46	prepareinvoking	2015-05-02 04:33:18.026+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1288	146	46	invoked	2015-05-02 04:33:23.47+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1289	146	46	moving	2015-05-02 04:33:23.471+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1290	146	46	paused	2015-05-02 04:33:23.471+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1291	146	46	start	2015-05-02 04:33:28.569+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1292	146	46	moving	2015-05-02 04:33:28.57+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1293	146	46	prepareinvoking	2015-05-02 04:33:28.572+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1294	146	46	invoked	2015-05-02 04:33:40.776+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1295	146	46	moving	2015-05-02 04:33:40.777+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1296	146	46	prepareinvoking	2015-05-02 04:33:40.779+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1297	146	46	invoked	2015-05-02 04:33:58.059+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1298	146	46	moving	2015-05-02 04:33:58.076+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1299	146	46	end	2015-05-02 04:33:58.077+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1300	147	46	start	2015-05-02 04:36:23.476+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1301	147	46	moving	2015-05-02 04:36:23.481+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1302	147	46	prepareinvoking	2015-05-02 04:36:23.534+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1303	147	46	invoked	2015-05-02 04:36:36.288+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1304	147	46	moving	2015-05-02 04:36:36.289+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1305	147	46	paused	2015-05-02 04:36:36.29+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1306	147	46	start	2015-05-02 04:36:43.504+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1307	147	46	moving	2015-05-02 04:36:43.505+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1308	147	46	prepareinvoking	2015-05-02 04:36:43.506+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1309	147	46	invoked	2015-05-02 04:36:53.659+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1310	147	46	moving	2015-05-02 04:36:53.66+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1311	147	46	prepareinvoking	2015-05-02 04:36:53.665+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1312	147	46	invoked	2015-05-02 04:37:35.416+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1313	147	46	moving	2015-05-02 04:37:35.418+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1314	147	46	end	2015-05-02 04:37:35.419+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1315	148	46	start	2015-05-02 04:41:40.497+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1316	148	46	moving	2015-05-02 04:41:40.507+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1317	148	46	prepareinvoking	2015-05-02 04:41:40.613+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1318	148	46	invoked	2015-05-02 04:41:44.617+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1319	148	46	moving	2015-05-02 04:41:44.618+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1320	148	46	paused	2015-05-02 04:41:44.618+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1321	148	46	start	2015-05-02 04:42:39.424+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1322	148	46	moving	2015-05-02 04:42:39.426+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1323	148	46	prepareinvoking	2015-05-02 04:42:39.427+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1324	148	46	invoked	2015-05-02 04:45:54.809+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1325	148	46	moving	2015-05-02 04:45:54.812+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1326	148	46	prepareinvoking	2015-05-02 04:45:54.814+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1327	148	46	invoked	2015-05-02 04:47:47.288+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1328	148	46	moving	2015-05-02 04:47:47.289+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1329	148	46	end	2015-05-02 04:49:38.33+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1330	149	46	start	2015-05-02 04:53:38.004+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1331	149	46	moving	2015-05-02 04:53:38.013+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1332	149	46	prepareinvoking	2015-05-02 04:53:44.701+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1333	149	46	invoked	2015-05-02 04:53:54.496+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1334	149	46	moving	2015-05-02 04:53:54.498+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1335	149	46	paused	2015-05-02 04:53:57.376+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1336	149	46	start	2015-05-02 04:54:04.077+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1337	149	46	moving	2015-05-02 04:54:04.078+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1338	149	46	prepareinvoking	2015-05-02 04:54:04.087+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1339	149	46	invoked	2015-05-02 04:54:07.056+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1340	149	46	moving	2015-05-02 04:54:07.057+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1341	149	46	prepareinvoking	2015-05-02 04:54:07.059+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1342	149	46	invoked	2015-05-02 04:54:07.06+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1343	149	46	moving	2015-05-02 04:54:07.06+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1344	149	46	end	2015-05-02 04:54:07.061+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1345	150	46	start	2015-05-02 04:56:49.278+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1346	150	46	moving	2015-05-02 04:56:49.282+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1347	150	46	prepareinvoking	2015-05-02 04:56:49.326+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1348	150	46	invoked	2015-05-02 04:56:49.335+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1349	150	46	moving	2015-05-02 04:56:49.335+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1350	150	46	paused	2015-05-02 04:56:49.335+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1351	150	46	start	2015-05-02 04:56:52.75+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1352	150	46	moving	2015-05-02 04:56:52.751+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1353	150	46	prepareinvoking	2015-05-02 04:56:52.753+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1354	150	46	invoked	2015-05-02 04:56:52.754+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1355	150	46	moving	2015-05-02 04:56:52.755+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1356	150	46	prepareinvoking	2015-05-02 04:56:52.756+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1357	150	46	invoked	2015-05-02 04:56:52.757+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1358	150	46	moving	2015-05-02 04:56:52.758+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1359	150	46	end	2015-05-02 04:56:52.758+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1360	151	46	start	2015-05-03 07:28:06.937+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1361	151	46	moving	2015-05-03 07:28:06.945+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1362	151	46	prepareinvoking	2015-05-03 07:28:07.068+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1363	151	46	invoked	2015-05-03 07:28:07.138+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1364	151	46	moving	2015-05-03 07:28:07.139+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1365	151	46	paused	2015-05-03 07:28:07.139+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1366	151	46	start	2015-05-04 16:46:35.392+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1367	151	46	moving	2015-05-04 16:46:35.398+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1368	151	46	prepareinvoking	2015-05-04 16:46:35.456+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1369	151	46	invoked	2015-05-04 16:46:35.509+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1370	151	46	moving	2015-05-04 16:46:35.509+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1371	151	46	prepareinvoking	2015-05-04 16:46:35.51+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1372	151	46	invoked	2015-05-04 16:46:35.511+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1373	151	46	moving	2015-05-04 16:46:35.511+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1374	151	46	end	2015-05-04 16:46:35.511+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1375	203	46	start	2015-05-08 13:58:32.197+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1376	203	46	moving	2015-05-08 13:58:32.246+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1377	203	46	prepareinvoking	2015-05-08 13:58:33.255+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1378	203	46	invoked	2015-05-08 13:58:33.345+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1379	203	46	moving	2015-05-08 13:58:33.345+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1380	203	46	paused	2015-05-08 13:58:33.345+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1381	204	46	start	2015-05-08 22:05:57.15+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1382	204	46	moving	2015-05-08 22:05:57.196+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1383	204	46	prepareinvoking	2015-05-08 22:05:57.31+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1384	204	46	invoked	2015-05-08 22:05:57.333+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1385	204	46	moving	2015-05-08 22:05:57.334+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1386	204	46	paused	2015-05-08 22:05:57.334+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1387	205	46	start	2015-05-09 04:31:53.328+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1388	205	46	moving	2015-05-09 04:31:53.346+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1389	205	46	prepareinvoking	2015-05-09 04:31:53.483+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1390	205	46	invoked	2015-05-09 04:31:53.558+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1391	205	46	moving	2015-05-09 04:31:53.559+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1392	205	46	paused	2015-05-09 04:31:53.559+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1393	205	46	start	2015-05-09 04:51:14.911+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1394	205	46	moving	2015-05-09 04:51:14.911+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1395	205	46	prepareinvoking	2015-05-09 04:51:14.923+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1396	205	46	invoked	2015-05-09 04:51:14.923+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1397	205	46	moving	2015-05-09 04:51:14.923+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1398	205	46	prepareinvoking	2015-05-09 04:51:14.924+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1399	205	46	invoked	2015-05-09 04:51:14.924+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
1400	205	46	moving	2015-05-09 04:51:14.924+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
1401	205	46	paused	2015-05-09 04:51:14.924+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
1402	205	46	start	2015-05-09 04:51:25.745+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1403	205	46	moving	2015-05-09 04:51:25.746+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1404	205	46	prepareinvoking	2015-05-09 04:51:25.746+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1405	205	46	invoked	2015-05-09 04:51:25.746+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1406	205	46	moving	2015-05-09 04:51:25.746+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1407	205	46	prepareinvoking	2015-05-09 04:51:25.746+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1408	205	46	invoked	2015-05-09 04:51:25.746+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1409	205	46	moving	2015-05-09 04:51:25.747+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1410	205	46	end	2015-05-09 04:51:25.747+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1411	206	46	start	2015-05-09 05:06:33.527+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1412	206	46	moving	2015-05-09 05:06:33.527+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1413	206	46	prepareinvoking	2015-05-09 05:06:33.528+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1414	206	46	invoked	2015-05-09 05:06:33.528+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1415	206	46	moving	2015-05-09 05:06:33.528+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1416	206	46	paused	2015-05-09 05:06:33.528+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1417	207	48	start	2015-05-21 12:57:49.637+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1418	207	48	moving	2015-05-21 12:57:49.649+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1419	207	48	prepareinvoking	2015-05-21 12:57:49.77+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1420	207	48	invoked	2015-05-21 12:57:49.818+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1421	207	48	moving	2015-05-21 12:57:49.818+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1422	207	48	paused	2015-05-21 12:57:49.818+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1423	208	49	start	2015-05-21 13:23:56.057+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1424	208	49	moving	2015-05-21 13:23:56.069+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1425	208	49	prepareinvoking	2015-05-21 13:23:56.13+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1426	208	49	invoked	2015-05-21 13:23:56.215+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1427	208	49	moving	2015-05-21 13:23:56.215+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1428	208	49	paused	2015-05-21 13:23:56.215+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1429	209	50	start	2015-05-21 13:34:24.045+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1430	209	50	moving	2015-05-21 13:34:24.057+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1431	209	50	prepareinvoking	2015-05-21 13:34:24.118+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1432	209	50	invoked	2015-05-21 13:34:24.166+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1433	209	50	moving	2015-05-21 13:34:24.166+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1434	209	50	paused	2015-05-21 13:34:24.169+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1435	209	50	start	2015-05-21 13:34:39.653+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1436	209	50	moving	2015-05-21 13:34:39.653+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1437	209	50	prepareinvoking	2015-05-21 13:34:39.654+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1438	209	50	invoked	2015-05-21 13:34:39.654+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1439	209	50	moving	2015-05-21 13:34:39.654+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1440	209	50	end	2015-05-21 13:34:39.654+06	t	1	0	{}	{}	{}	t	t	f	f	f	f
1441	210	50	start	2015-05-21 20:02:03.95+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1442	211	50	start	2015-05-21 20:02:03.778+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1443	211	50	moving	2015-05-21 20:02:03.801+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1444	210	50	moving	2015-05-21 20:02:03.95+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1445	211	50	prepareinvoking	2015-05-21 20:02:03.996+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1446	210	50	prepareinvoking	2015-05-21 20:02:04.093+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1447	210	50	invoked	2015-05-21 20:02:04.094+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1448	211	50	invoked	2015-05-21 20:02:04.045+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1449	210	50	moving	2015-05-21 20:02:04.094+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1450	211	50	moving	2015-05-21 20:02:04.046+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1451	210	50	paused	2015-05-21 20:02:04.094+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1452	211	50	paused	2015-05-21 20:02:04.046+06	t	0	0	{}	{}	{}	t	f	f	f	f	t
1453	210	50	start	2015-05-21 20:02:31.132+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1454	210	50	moving	2015-05-21 20:02:31.132+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1455	210	50	prepareinvoking	2015-05-21 20:02:31.132+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1456	210	50	invoked	2015-05-21 20:02:31.132+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1457	210	50	moving	2015-05-21 20:02:31.132+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1458	210	50	end	2015-05-21 20:02:31.133+06	t	1	0	{}	{}	{}	t	t	f	f	f	f
1459	211	50	start	2015-05-21 20:02:46.761+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1460	211	50	moving	2015-05-21 20:02:46.761+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1461	211	50	prepareinvoking	2015-05-21 20:02:46.761+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1462	211	50	invoked	2015-05-21 20:02:46.762+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1463	211	50	moving	2015-05-21 20:02:46.762+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1464	211	50	end	2015-05-21 20:02:46.763+06	t	1	0	{}	{}	{}	t	t	f	f	f	f
1465	214	51	start	2015-05-22 20:28:12.307+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1466	214	51	moving	2015-05-22 20:28:12.326+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1467	214	51	prepareinvoking	2015-05-22 20:28:12.677+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1468	214	51	preparemovetospace	2015-05-22 20:28:12.77+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1469	214	51	movetospace	2015-05-22 20:28:12.77+06	t	0	1	{}	{}	{62}	t	f	t	f	f	f
1470	214	51	preparemovetocontainer	2015-05-22 20:28:12.77+06	t	0	1	{}	{}	{62}	t	f	t	f	f	f
1471	214	51	movetocontainer	2015-05-22 20:28:12.824+06	t	0	1	{1}	{}	{62}	t	f	t	t	f	f
1472	214	51	invoked	2015-05-22 20:28:12.829+06	t	0	1	{1}	{}	{62}	t	f	t	t	f	f
1473	214	51	moving	2015-05-22 20:28:12.829+06	t	0	1	{1}	{}	{62}	t	f	t	t	f	f
1474	214	51	preparemoveupfront	2015-05-22 20:28:12.892+06	t	0	1	{1}	{}	{62}	t	f	t	t	f	f
1475	214	51	moveupfront	2015-05-22 20:28:12.906+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1476	214	51	moving	2015-05-22 20:28:12.907+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1477	214	51	prepareinvoking	2015-05-22 20:28:12.909+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1478	214	51	preparemovetospace	2015-05-22 20:28:12.909+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1479	214	51	movetospace	2015-05-22 20:28:12.909+06	t	0	1	{}	{}	{62}	t	f	t	f	f	f
1480	214	51	preparemovetocontainer	2015-05-22 20:28:12.909+06	t	0	1	{}	{}	{62}	t	f	t	f	f	f
1481	214	51	movetocontainer	2015-05-22 20:28:12.909+06	t	0	1	{1}	{}	{62}	t	f	t	t	f	f
1482	214	51	invoked	2015-05-22 20:28:12.909+06	t	0	1	{1}	{}	{62}	t	f	t	t	f	f
1483	214	51	moving	2015-05-22 20:28:12.909+06	t	0	1	{1}	{}	{62}	t	f	t	t	f	f
1484	214	51	preparemoveupfront	2015-05-22 20:28:12.909+06	t	0	1	{1}	{}	{62}	t	f	t	t	f	f
1485	214	51	moveupfront	2015-05-22 20:28:12.911+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1486	214	51	moving	2015-05-22 20:28:12.911+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1487	214	51	end	2015-05-22 20:28:12.913+06	t	0	0	{}	{}	{}	t	t	f	f	f	f
1488	216	52	start	2015-05-22 20:35:24.384+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1489	216	52	moving	2015-05-22 20:35:24.385+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1490	216	52	prepareinvoking	2015-05-22 20:35:24.385+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1491	216	52	preparemovetospace	2015-05-22 20:35:24.387+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1492	216	52	movetospace	2015-05-22 20:35:24.387+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1493	216	52	preparemovetocontainer	2015-05-22 20:35:24.387+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1494	216	52	movetocontainer	2015-05-22 20:35:24.387+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1495	216	52	invoked	2015-05-22 20:35:24.387+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1496	216	52	moving	2015-05-22 20:35:24.387+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1497	216	52	preparemoveupfront	2015-05-22 20:35:24.387+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1498	216	52	moveupfront	2015-05-22 20:35:24.387+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1499	216	52	moving	2015-05-22 20:35:24.387+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1500	216	52	prepareinvoking	2015-05-22 20:35:24.387+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1501	216	52	preparemovetospace	2015-05-22 20:35:24.388+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1502	216	52	movetospace	2015-05-22 20:35:24.388+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1503	216	52	preparemovetocontainer	2015-05-22 20:35:24.388+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1504	216	52	movetocontainer	2015-05-22 20:35:24.388+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1505	216	52	invoked	2015-05-22 20:35:24.388+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1506	216	52	moving	2015-05-22 20:35:24.388+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1507	216	52	preparemoveupfront	2015-05-22 20:35:24.388+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1508	216	52	moveupfront	2015-05-22 20:35:24.388+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1509	216	52	moving	2015-05-22 20:35:24.388+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1510	216	52	prepareinvoking	2015-05-22 20:35:24.388+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1511	216	52	preparemovetospace	2015-05-22 20:35:24.388+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1512	216	52	movetospace	2015-05-22 20:35:24.388+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1513	216	52	preparemovetocontainer	2015-05-22 20:35:24.388+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1514	216	52	movetocontainer	2015-05-22 20:35:24.388+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1515	216	52	invoked	2015-05-22 20:35:24.389+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1516	216	52	moving	2015-05-22 20:35:24.389+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1517	216	52	preparemoveupfront	2015-05-22 20:35:24.39+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1518	216	52	moveupfront	2015-05-22 20:35:24.39+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1519	216	52	moving	2015-05-22 20:35:24.39+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1520	216	52	prepareinvoking	2015-05-22 20:35:24.39+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1521	216	52	preparemovetospace	2015-05-22 20:35:24.39+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1522	216	52	movetospace	2015-05-22 20:35:24.39+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1523	216	52	preparemovetocontainer	2015-05-22 20:35:24.39+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1524	216	52	movetocontainer	2015-05-22 20:35:24.39+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1525	216	52	invoked	2015-05-22 20:35:24.39+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1526	216	52	moving	2015-05-22 20:35:24.391+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1527	216	52	preparemoveupfront	2015-05-22 20:35:24.391+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1528	216	52	moveupfront	2015-05-22 20:35:24.391+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1529	216	52	moving	2015-05-22 20:35:24.391+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1530	216	52	prepareinvoking	2015-05-22 20:35:24.391+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1531	216	52	preparemovetospace	2015-05-22 20:35:24.395+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1532	216	52	movetospace	2015-05-22 20:35:24.395+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1533	216	52	preparemovetocontainer	2015-05-22 20:35:24.395+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1534	216	52	movetocontainer	2015-05-22 20:35:24.395+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1535	216	52	invoked	2015-05-22 20:35:24.395+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1536	216	52	moving	2015-05-22 20:35:24.395+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1537	216	52	preparemoveupfront	2015-05-22 20:35:24.395+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1538	216	52	moveupfront	2015-05-22 20:35:24.395+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1539	216	52	moving	2015-05-22 20:35:24.395+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1540	216	52	prepareinvoking	2015-05-22 20:35:24.396+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1541	216	52	preparemovetospace	2015-05-22 20:35:24.396+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1542	216	52	movetospace	2015-05-22 20:35:24.396+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1543	216	52	preparemovetocontainer	2015-05-22 20:35:24.396+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1544	216	52	movetocontainer	2015-05-22 20:35:24.396+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1545	216	52	invoked	2015-05-22 20:35:24.396+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1546	216	52	moving	2015-05-22 20:35:24.396+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1547	216	52	preparemoveupfront	2015-05-22 20:35:24.396+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1548	216	52	moveupfront	2015-05-22 20:35:24.396+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1549	216	52	moving	2015-05-22 20:35:24.396+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1550	216	52	prepareinvoking	2015-05-22 20:35:24.396+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1551	216	52	preparemovetospace	2015-05-22 20:35:24.396+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1552	216	52	movetospace	2015-05-22 20:35:24.396+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1553	216	52	preparemovetocontainer	2015-05-22 20:35:24.396+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1554	216	52	movetocontainer	2015-05-22 20:35:24.397+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1555	216	52	invoked	2015-05-22 20:35:24.397+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1556	216	52	moving	2015-05-22 20:35:24.397+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1557	216	52	preparemoveupfront	2015-05-22 20:35:24.397+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1558	216	52	moveupfront	2015-05-22 20:35:24.397+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1559	216	52	moving	2015-05-22 20:35:24.397+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1560	216	52	prepareinvoking	2015-05-22 20:35:24.397+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1561	216	52	preparemovetospace	2015-05-22 20:35:24.397+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1562	216	52	movetospace	2015-05-22 20:35:24.397+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1563	216	52	preparemovetocontainer	2015-05-22 20:35:24.397+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1564	216	52	movetocontainer	2015-05-22 20:35:24.397+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1565	216	52	invoked	2015-05-22 20:35:24.397+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1566	216	52	moving	2015-05-22 20:35:24.397+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1567	216	52	preparemoveupfront	2015-05-22 20:35:24.398+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1568	216	52	moveupfront	2015-05-22 20:35:24.398+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1569	216	52	moving	2015-05-22 20:35:24.398+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1570	216	52	prepareinvoking	2015-05-22 20:35:24.402+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1571	216	52	preparemovetospace	2015-05-22 20:35:24.402+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1572	216	52	movetospace	2015-05-22 20:35:24.402+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1573	216	52	preparemovetocontainer	2015-05-22 20:35:24.402+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1574	216	52	movetocontainer	2015-05-22 20:35:24.402+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1575	216	52	invoked	2015-05-22 20:35:24.402+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1576	216	52	moving	2015-05-22 20:35:24.403+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1577	216	52	preparemoveupfront	2015-05-22 20:35:24.403+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1578	216	52	moveupfront	2015-05-22 20:35:24.403+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1579	216	52	moving	2015-05-22 20:35:24.403+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1580	216	52	prepareinvoking	2015-05-22 20:35:24.403+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1581	216	52	preparemovetospace	2015-05-22 20:35:24.406+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1582	216	52	movetospace	2015-05-22 20:35:24.407+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1583	216	52	preparemovetocontainer	2015-05-22 20:35:24.407+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1584	216	52	movetocontainer	2015-05-22 20:35:24.407+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1585	216	52	invoked	2015-05-22 20:35:24.407+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1586	216	52	moving	2015-05-22 20:35:24.407+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1587	216	52	preparemoveupfront	2015-05-22 20:35:24.407+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1588	216	52	moveupfront	2015-05-22 20:35:24.407+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1589	216	52	moving	2015-05-22 20:35:24.407+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1590	216	52	prepareinvoking	2015-05-22 20:35:24.408+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1591	216	52	preparemovetospace	2015-05-22 20:35:24.408+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1592	216	52	movetospace	2015-05-22 20:35:24.408+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1593	216	52	preparemovetocontainer	2015-05-22 20:35:24.408+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1594	216	52	movetocontainer	2015-05-22 20:35:24.408+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1595	216	52	invoked	2015-05-22 20:35:24.408+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1596	216	52	moving	2015-05-22 20:35:24.408+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1597	216	52	preparemoveupfront	2015-05-22 20:35:24.408+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1598	216	52	moveupfront	2015-05-22 20:35:24.408+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1599	216	52	moving	2015-05-22 20:35:24.408+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1600	216	52	prepareinvoking	2015-05-22 20:35:24.411+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1601	216	52	preparemovetospace	2015-05-22 20:35:24.411+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1602	216	52	movetospace	2015-05-22 20:35:24.411+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1603	216	52	preparemovetocontainer	2015-05-22 20:35:24.411+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1604	216	52	movetocontainer	2015-05-22 20:35:24.411+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1605	216	52	invoked	2015-05-22 20:35:24.411+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1606	216	52	moving	2015-05-22 20:35:24.411+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1607	216	52	preparemoveupfront	2015-05-22 20:35:24.411+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1608	216	52	moveupfront	2015-05-22 20:35:24.412+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1609	216	52	moving	2015-05-22 20:35:24.412+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1610	216	52	prepareinvoking	2015-05-22 20:35:24.412+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1611	216	52	preparemovetospace	2015-05-22 20:35:24.412+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1612	216	52	movetospace	2015-05-22 20:35:24.412+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1613	216	52	preparemovetocontainer	2015-05-22 20:35:24.412+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1614	216	52	movetocontainer	2015-05-22 20:35:24.412+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1615	216	52	invoked	2015-05-22 20:35:24.412+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1616	216	52	moving	2015-05-22 20:35:24.412+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1617	216	52	preparemoveupfront	2015-05-22 20:35:24.412+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1618	216	52	moveupfront	2015-05-22 20:35:24.412+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1619	216	52	moving	2015-05-22 20:35:24.412+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1620	216	52	prepareinvoking	2015-05-22 20:35:24.412+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1621	216	52	preparemovetospace	2015-05-22 20:35:24.412+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1622	216	52	movetospace	2015-05-22 20:35:24.412+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1623	216	52	preparemovetocontainer	2015-05-22 20:35:24.412+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1624	216	52	movetocontainer	2015-05-22 20:35:24.412+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1625	216	52	invoked	2015-05-22 20:35:24.412+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1626	216	52	moving	2015-05-22 20:35:24.413+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1627	216	52	end	2015-05-22 20:35:24.413+06	t	0	1	{1}	{}	{63}	t	t	t	t	f	f
1628	217	52	start	2015-05-22 20:37:13.058+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1629	217	52	moving	2015-05-22 20:37:13.058+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1630	217	52	prepareinvoking	2015-05-22 20:37:13.059+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1631	217	52	preparemovetospace	2015-05-22 20:37:13.059+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1632	217	52	movetospace	2015-05-22 20:37:13.059+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1633	217	52	preparemovetocontainer	2015-05-22 20:37:13.059+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1634	217	52	movetocontainer	2015-05-22 20:37:13.059+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1635	217	52	invoked	2015-05-22 20:37:13.059+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1636	217	52	moving	2015-05-22 20:37:13.059+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1637	217	52	preparemoveupfront	2015-05-22 20:37:13.059+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1638	217	52	moveupfront	2015-05-22 20:37:13.059+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1639	217	52	moving	2015-05-22 20:37:13.059+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1640	217	52	prepareinvoking	2015-05-22 20:37:13.059+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1641	217	52	preparemovetospace	2015-05-22 20:37:13.059+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1642	217	52	movetospace	2015-05-22 20:37:13.059+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1643	217	52	preparemovetocontainer	2015-05-22 20:37:13.059+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1644	217	52	movetocontainer	2015-05-22 20:37:13.059+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1645	217	52	invoked	2015-05-22 20:37:13.062+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1646	217	52	moving	2015-05-22 20:37:13.062+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1647	217	52	preparemoveupfront	2015-05-22 20:37:13.062+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1648	217	52	moveupfront	2015-05-22 20:37:13.062+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1649	217	52	moving	2015-05-22 20:37:13.062+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1650	217	52	prepareinvoking	2015-05-22 20:37:13.062+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1651	217	52	preparemovetospace	2015-05-22 20:37:13.062+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1652	217	52	movetospace	2015-05-22 20:37:13.062+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1653	217	52	preparemovetocontainer	2015-05-22 20:37:13.062+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1654	217	52	movetocontainer	2015-05-22 20:37:13.063+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1655	217	52	invoked	2015-05-22 20:37:13.063+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1656	217	52	moving	2015-05-22 20:37:13.063+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1657	217	52	preparemoveupfront	2015-05-22 20:37:13.063+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1658	217	52	moveupfront	2015-05-22 20:37:13.063+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1659	217	52	moving	2015-05-22 20:37:13.063+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1660	217	52	prepareinvoking	2015-05-22 20:37:13.063+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1661	217	52	preparemovetospace	2015-05-22 20:37:13.065+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1662	217	52	movetospace	2015-05-22 20:37:13.065+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1663	217	52	preparemovetocontainer	2015-05-22 20:37:13.065+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1664	217	52	movetocontainer	2015-05-22 20:37:13.065+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1665	217	52	invoked	2015-05-22 20:37:13.068+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1666	217	52	moving	2015-05-22 20:37:13.068+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1667	217	52	preparemoveupfront	2015-05-22 20:37:13.068+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1668	217	52	moveupfront	2015-05-22 20:37:13.068+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1669	217	52	moving	2015-05-22 20:37:13.068+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1670	217	52	prepareinvoking	2015-05-22 20:37:13.071+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1671	217	52	preparemovetospace	2015-05-22 20:37:13.071+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1672	217	52	movetospace	2015-05-22 20:37:13.071+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1673	217	52	preparemovetocontainer	2015-05-22 20:37:13.071+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1674	217	52	movetocontainer	2015-05-22 20:37:13.071+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1675	217	52	invoked	2015-05-22 20:37:13.071+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1676	217	52	moving	2015-05-22 20:37:13.071+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1677	217	52	preparemoveupfront	2015-05-22 20:37:13.071+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1678	217	52	moveupfront	2015-05-22 20:37:13.071+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1679	217	52	moving	2015-05-22 20:37:13.071+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1680	217	52	prepareinvoking	2015-05-22 20:37:13.071+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1681	217	52	preparemovetospace	2015-05-22 20:37:13.071+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1682	217	52	movetospace	2015-05-22 20:37:13.095+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1683	217	52	preparemovetocontainer	2015-05-22 20:37:13.095+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1684	217	52	movetocontainer	2015-05-22 20:37:13.095+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1685	217	52	invoked	2015-05-22 20:37:13.1+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1686	217	52	moving	2015-05-22 20:37:13.101+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1687	217	52	preparemoveupfront	2015-05-22 20:37:13.101+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1688	217	52	moveupfront	2015-05-22 20:37:13.101+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1689	217	52	moving	2015-05-22 20:37:13.101+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1690	217	52	prepareinvoking	2015-05-22 20:37:13.101+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1691	217	52	preparemovetospace	2015-05-22 20:37:13.101+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1692	217	52	movetospace	2015-05-22 20:37:13.11+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1693	217	52	preparemovetocontainer	2015-05-22 20:37:13.11+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1694	217	52	movetocontainer	2015-05-22 20:37:13.11+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1695	217	52	invoked	2015-05-22 20:37:13.111+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1696	217	52	moving	2015-05-22 20:37:13.111+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1697	217	52	preparemoveupfront	2015-05-22 20:37:13.114+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1698	217	52	moveupfront	2015-05-22 20:37:13.114+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1699	217	52	moving	2015-05-22 20:37:13.114+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1700	217	52	prepareinvoking	2015-05-22 20:37:13.114+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1701	217	52	preparemovetospace	2015-05-22 20:37:13.114+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1702	217	52	movetospace	2015-05-22 20:37:13.114+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1703	217	52	preparemovetocontainer	2015-05-22 20:37:13.114+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1704	217	52	movetocontainer	2015-05-22 20:37:13.114+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1705	217	52	invoked	2015-05-22 20:37:13.115+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1706	217	52	moving	2015-05-22 20:37:13.115+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1707	217	52	preparemoveupfront	2015-05-22 20:37:13.121+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1708	217	52	moveupfront	2015-05-22 20:37:13.121+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1709	217	52	moving	2015-05-22 20:37:13.121+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1710	217	52	prepareinvoking	2015-05-22 20:37:13.121+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1711	217	52	preparemovetospace	2015-05-22 20:37:13.121+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1712	217	52	movetospace	2015-05-22 20:37:13.121+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1713	217	52	preparemovetocontainer	2015-05-22 20:37:13.121+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1714	217	52	movetocontainer	2015-05-22 20:37:13.121+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1715	217	52	invoked	2015-05-22 20:37:13.121+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1716	217	52	moving	2015-05-22 20:37:13.121+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1717	217	52	preparemoveupfront	2015-05-22 20:37:13.124+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1718	217	52	moveupfront	2015-05-22 20:37:13.124+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1719	217	52	moving	2015-05-22 20:37:13.124+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1720	217	52	prepareinvoking	2015-05-22 20:37:13.124+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1721	217	52	preparemovetospace	2015-05-22 20:37:13.124+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1722	217	52	movetospace	2015-05-22 20:37:13.124+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1723	217	52	preparemovetocontainer	2015-05-22 20:37:13.124+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1724	217	52	movetocontainer	2015-05-22 20:37:13.124+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1725	217	52	invoked	2015-05-22 20:37:13.124+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1726	217	52	moving	2015-05-22 20:37:13.124+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1727	217	52	preparemoveupfront	2015-05-22 20:37:13.125+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1728	217	52	moveupfront	2015-05-22 20:37:13.125+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1729	217	52	moving	2015-05-22 20:37:13.125+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1730	217	52	prepareinvoking	2015-05-22 20:37:13.125+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1731	217	52	preparemovetospace	2015-05-22 20:37:13.125+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1732	217	52	movetospace	2015-05-22 20:37:13.125+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1733	217	52	preparemovetocontainer	2015-05-22 20:37:13.125+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1734	217	52	movetocontainer	2015-05-22 20:37:13.125+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1735	217	52	invoked	2015-05-22 20:37:13.125+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1736	217	52	moving	2015-05-22 20:37:13.125+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1737	217	52	preparemoveupfront	2015-05-22 20:37:13.125+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1738	217	52	moveupfront	2015-05-22 20:37:13.126+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1739	217	52	moving	2015-05-22 20:37:13.126+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1740	217	52	prepareinvoking	2015-05-22 20:37:13.126+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1741	217	52	preparemovetospace	2015-05-22 20:37:13.126+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1742	217	52	movetospace	2015-05-22 20:37:13.126+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1743	217	52	preparemovetocontainer	2015-05-22 20:37:13.126+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1744	217	52	movetocontainer	2015-05-22 20:37:13.126+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1745	217	52	invoked	2015-05-22 20:37:13.126+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1746	217	52	moving	2015-05-22 20:37:13.126+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1747	217	52	preparemoveupfront	2015-05-22 20:37:13.126+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1748	217	52	moveupfront	2015-05-22 20:37:13.126+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1749	217	52	moving	2015-05-22 20:37:13.126+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1750	217	52	prepareinvoking	2015-05-22 20:37:13.127+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1751	217	52	preparemovetospace	2015-05-22 20:37:13.127+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1752	217	52	movetospace	2015-05-22 20:37:13.127+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1753	217	52	preparemovetocontainer	2015-05-22 20:37:13.127+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1754	217	52	movetocontainer	2015-05-22 20:37:13.129+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1755	217	52	invoked	2015-05-22 20:37:13.129+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1756	217	52	moving	2015-05-22 20:37:13.129+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1757	217	52	preparemoveupfront	2015-05-22 20:37:13.129+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1758	217	52	moveupfront	2015-05-22 20:37:13.129+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1759	217	52	moving	2015-05-22 20:37:13.129+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1760	217	52	prepareinvoking	2015-05-22 20:37:13.13+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1761	217	52	preparemovetospace	2015-05-22 20:37:13.13+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1762	217	52	movetospace	2015-05-22 20:37:13.13+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1763	217	52	preparemovetocontainer	2015-05-22 20:37:13.13+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1764	217	52	movetocontainer	2015-05-22 20:37:13.13+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1765	217	52	invoked	2015-05-22 20:37:13.13+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1766	217	52	moving	2015-05-22 20:37:13.13+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1767	217	52	end	2015-05-22 20:37:13.131+06	t	0	1	{1}	{}	{63}	t	t	t	t	f	f
1768	218	52	start	2015-05-28 10:36:04.671+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1769	218	52	moving	2015-05-28 10:36:04.692+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1770	218	52	prepareinvoking	2015-05-28 10:36:04.875+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1771	218	52	preparemovetospace	2015-05-28 10:36:04.943+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1772	218	52	movetospace	2015-05-28 10:36:04.943+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1773	218	52	preparemovetocontainer	2015-05-28 10:36:04.943+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1774	218	52	movetocontainer	2015-05-28 10:36:04.983+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1775	218	52	invoked	2015-05-28 10:36:04.986+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1776	218	52	moving	2015-05-28 10:36:04.986+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1777	218	52	preparemoveupfront	2015-05-28 10:36:11.026+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1778	218	52	moveupfront	2015-05-28 10:36:11.03+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1779	218	52	moving	2015-05-28 10:36:11.03+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1780	218	52	prepareinvoking	2015-05-28 10:36:11.031+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1781	218	52	preparemovetospace	2015-05-28 10:36:11.031+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1782	218	52	movetospace	2015-05-28 10:36:11.031+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1783	218	52	preparemovetocontainer	2015-05-28 10:36:11.031+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1784	218	52	movetocontainer	2015-05-28 10:36:11.031+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1785	218	52	invoked	2015-05-28 10:36:11.031+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1786	218	52	moving	2015-05-28 10:36:11.031+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1787	218	52	preparemoveupfront	2015-05-28 10:36:11.981+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1788	218	52	moveupfront	2015-05-28 10:36:11.982+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1789	218	52	moving	2015-05-28 10:36:11.982+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1790	218	52	prepareinvoking	2015-05-28 10:36:11.982+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1791	218	52	preparemovetospace	2015-05-28 10:36:11.982+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1792	218	52	movetospace	2015-05-28 10:36:11.985+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1793	218	52	preparemovetocontainer	2015-05-28 10:36:11.985+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1794	218	52	movetocontainer	2015-05-28 10:36:11.985+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1795	218	52	invoked	2015-05-28 10:36:11.991+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1796	218	52	moving	2015-05-28 10:36:11.994+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1797	218	52	preparemoveupfront	2015-05-28 10:36:13.112+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1798	218	52	moveupfront	2015-05-28 10:36:13.112+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1799	218	52	moving	2015-05-28 10:36:13.112+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1800	218	52	prepareinvoking	2015-05-28 10:36:13.112+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1801	218	52	preparemovetospace	2015-05-28 10:36:13.113+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1802	218	52	movetospace	2015-05-28 10:36:13.113+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1803	218	52	preparemovetocontainer	2015-05-28 10:36:13.113+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1804	218	52	movetocontainer	2015-05-28 10:36:13.113+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1805	218	52	invoked	2015-05-28 10:36:13.114+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1806	218	52	moving	2015-05-28 10:36:13.114+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1807	218	52	preparemoveupfront	2015-05-28 10:36:14.183+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1808	218	52	moveupfront	2015-05-28 10:36:14.183+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1809	218	52	moving	2015-05-28 10:36:14.183+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1810	218	52	prepareinvoking	2015-05-28 10:36:14.186+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1811	218	52	preparemovetospace	2015-05-28 10:36:14.186+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1812	218	52	movetospace	2015-05-28 10:36:14.186+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1813	218	52	preparemovetocontainer	2015-05-28 10:36:14.186+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1814	218	52	movetocontainer	2015-05-28 10:36:14.186+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1815	218	52	invoked	2015-05-28 10:36:14.188+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1816	218	52	moving	2015-05-28 10:36:14.188+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1817	218	52	preparemoveupfront	2015-05-28 10:36:15.415+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1818	218	52	moveupfront	2015-05-28 10:36:15.415+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1819	218	52	moving	2015-05-28 10:36:15.422+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1820	218	52	prepareinvoking	2015-05-28 10:36:15.422+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1821	218	52	preparemovetospace	2015-05-28 10:36:15.422+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1822	218	52	movetospace	2015-05-28 10:36:15.423+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1823	218	52	preparemovetocontainer	2015-05-28 10:36:15.423+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1824	218	52	movetocontainer	2015-05-28 10:36:15.423+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1825	218	52	invoked	2015-05-28 10:36:15.423+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1826	218	52	moving	2015-05-28 10:36:15.423+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1827	218	52	preparemoveupfront	2015-05-28 10:36:16.326+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1828	218	52	moveupfront	2015-05-28 10:36:16.327+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1829	218	52	moving	2015-05-28 10:36:16.327+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1830	218	52	prepareinvoking	2015-05-28 10:36:16.327+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1831	218	52	preparemovetospace	2015-05-28 10:36:16.327+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1832	218	52	movetospace	2015-05-28 10:36:16.327+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1833	218	52	preparemovetocontainer	2015-05-28 10:36:16.327+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1834	218	52	movetocontainer	2015-05-28 10:36:16.327+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1835	218	52	invoked	2015-05-28 10:36:16.329+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1836	218	52	moving	2015-05-28 10:36:16.329+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1837	218	52	preparemoveupfront	2015-05-28 10:36:17.135+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1838	218	52	moveupfront	2015-05-28 10:36:17.135+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1839	218	52	moving	2015-05-28 10:36:17.135+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1840	218	52	prepareinvoking	2015-05-28 10:36:17.136+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1841	218	52	preparemovetospace	2015-05-28 10:36:17.136+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1842	218	52	movetospace	2015-05-28 10:36:17.136+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1843	218	52	preparemovetocontainer	2015-05-28 10:36:17.136+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1844	218	52	movetocontainer	2015-05-28 10:36:17.136+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1845	218	52	invoked	2015-05-28 10:36:17.137+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1846	218	52	moving	2015-05-28 10:36:17.138+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1847	218	52	preparemoveupfront	2015-05-28 10:36:18.534+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1848	218	52	moveupfront	2015-05-28 10:36:18.534+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1849	218	52	moving	2015-05-28 10:36:18.534+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1850	218	52	prepareinvoking	2015-05-28 10:36:18.534+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1851	218	52	preparemovetospace	2015-05-28 10:36:18.535+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1852	218	52	movetospace	2015-05-28 10:36:18.535+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1853	218	52	preparemovetocontainer	2015-05-28 10:36:18.535+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1854	218	52	movetocontainer	2015-05-28 10:36:18.535+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1855	218	52	invoked	2015-05-28 10:36:18.536+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1856	218	52	moving	2015-05-28 10:36:18.536+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1857	218	52	preparemoveupfront	2015-05-28 10:36:19.302+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1858	218	52	moveupfront	2015-05-28 10:36:19.308+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1859	218	52	moving	2015-05-28 10:36:19.31+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1860	218	52	prepareinvoking	2015-05-28 10:36:19.311+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1861	218	52	preparemovetospace	2015-05-28 10:36:19.311+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1862	218	52	movetospace	2015-05-28 10:36:19.311+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1863	218	52	preparemovetocontainer	2015-05-28 10:36:19.311+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1864	218	52	movetocontainer	2015-05-28 10:36:19.311+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1865	218	52	invoked	2015-05-28 10:36:19.312+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1866	218	52	moving	2015-05-28 10:36:19.314+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1867	218	52	preparemoveupfront	2015-05-28 10:36:20.122+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1868	218	52	moveupfront	2015-05-28 10:36:20.122+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1869	218	52	moving	2015-05-28 10:36:20.122+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1870	218	52	prepareinvoking	2015-05-28 10:36:20.123+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1871	218	52	preparemovetospace	2015-05-28 10:36:20.123+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1872	218	52	movetospace	2015-05-28 10:36:20.123+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1873	218	52	preparemovetocontainer	2015-05-28 10:36:20.123+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1874	218	52	movetocontainer	2015-05-28 10:36:20.123+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1875	218	52	invoked	2015-05-28 10:36:20.124+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1876	218	52	moving	2015-05-28 10:36:20.124+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1877	218	52	preparemoveupfront	2015-05-28 10:36:20.902+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1878	218	52	moveupfront	2015-05-28 10:36:20.902+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1879	218	52	moving	2015-05-28 10:36:20.902+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1880	218	52	prepareinvoking	2015-05-28 10:36:20.902+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1881	218	52	preparemovetospace	2015-05-28 10:36:20.902+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1882	218	52	movetospace	2015-05-28 10:36:20.903+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1883	218	52	preparemovetocontainer	2015-05-28 10:36:20.903+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1884	218	52	movetocontainer	2015-05-28 10:36:20.903+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1885	218	52	invoked	2015-05-28 10:36:20.906+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1886	218	52	moving	2015-05-28 10:36:20.906+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1887	218	52	preparemoveupfront	2015-05-28 10:36:21.742+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1888	218	52	moveupfront	2015-05-28 10:36:21.742+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1889	218	52	moving	2015-05-28 10:36:21.742+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1890	218	52	prepareinvoking	2015-05-28 10:36:21.742+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1891	218	52	preparemovetospace	2015-05-28 10:36:21.743+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1892	218	52	movetospace	2015-05-28 10:36:21.743+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1893	218	52	preparemovetocontainer	2015-05-28 10:36:21.743+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1894	218	52	movetocontainer	2015-05-28 10:36:21.743+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1895	218	52	invoked	2015-05-28 10:36:21.744+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1896	218	52	moving	2015-05-28 10:36:21.744+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1897	218	52	preparemoveupfront	2015-05-28 10:38:00.752+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1898	218	52	moveupfront	2015-05-28 10:38:00.752+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1899	218	52	moving	2015-05-28 10:38:00.752+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1900	218	52	prepareinvoking	2015-05-28 10:38:00.752+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1901	218	52	preparemovetospace	2015-05-28 10:38:00.753+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1902	218	52	movetospace	2015-05-28 10:38:00.757+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1903	218	52	preparemovetocontainer	2015-05-28 10:38:00.757+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1904	218	52	movetocontainer	2015-05-28 10:38:00.757+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1905	218	52	invoked	2015-05-28 10:38:00.759+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1906	218	52	moving	2015-05-28 10:38:00.759+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1907	218	52	end	2015-05-28 10:38:00.76+06	t	0	1	{1}	{}	{63}	t	t	t	t	f	f
1908	219	52	start	2015-05-28 10:43:09.382+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1909	219	52	moving	2015-05-28 10:43:09.385+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1910	220	52	start	2015-05-28 10:50:35.706+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1911	220	52	moving	2015-05-28 10:50:35.708+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1912	220	52	prepareinvoking	2015-05-28 10:50:35.781+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1913	220	52	preparemovetospace	2015-05-28 10:50:35.785+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1914	220	52	movetospace	2015-05-28 10:51:35.158+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1915	222	52	start	2015-05-28 11:30:13.768+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1916	222	52	moving	2015-05-28 11:30:13.769+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1917	222	52	prepareinvoking	2015-05-28 11:30:13.809+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1918	222	52	preparemovetospace	2015-05-28 11:30:17.442+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1919	222	52	movetospace	2015-05-28 11:30:19.826+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1920	222	52	preparemovetocontainer	2015-05-28 11:30:19.826+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1921	222	52	movetocontainer	2015-05-28 11:30:20.401+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1922	222	52	invoked	2015-05-28 11:30:20.402+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1923	222	52	moving	2015-05-28 11:30:20.402+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1924	222	52	prepareinvoking	2015-05-28 11:30:22.448+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1925	222	52	moving	2015-05-28 11:30:27.771+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1926	222	52	prepareinvoking	2015-05-28 11:30:27.773+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1927	222	52	invoked	2015-05-28 11:30:28.355+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1928	222	52	moving	2015-05-28 11:30:28.356+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1929	222	52	end	2015-05-28 11:30:28.36+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1930	222	52	moving	2015-05-28 11:30:29.968+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1931	222	52	end	2015-05-28 11:30:29.968+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1932	223	52	start	2015-05-28 11:32:33.256+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1933	223	52	moving	2015-05-28 11:32:33.256+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1934	223	52	prepareinvoking	2015-05-28 11:32:33.257+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1935	223	52	preparemovetospace	2015-05-28 11:32:44.03+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1936	223	52	movetospace	2015-05-28 11:32:51.302+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1937	223	52	preparemovetocontainer	2015-05-28 11:32:51.302+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1938	223	52	movetocontainer	2015-05-28 11:32:51.302+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1939	223	52	invoked	2015-05-28 11:32:51.306+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1940	223	52	moving	2015-05-28 11:32:51.306+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1941	223	52	prepareinvoking	2015-05-28 11:32:54.091+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1942	223	52	moving	2015-05-28 11:32:59.759+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1943	223	52	prepareinvoking	2015-05-28 11:32:59.759+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
1944	223	52	invoked	2015-05-28 11:32:59.76+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1945	223	52	moving	2015-05-28 11:32:59.76+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
1946	223	52	end	2015-05-28 11:32:59.761+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1947	223	52	moving	2015-05-28 11:33:01.709+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1948	223	52	end	2015-05-28 11:33:01.71+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
1949	224	52	start	2015-05-28 11:34:57.642+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1950	224	52	moving	2015-05-28 11:34:57.643+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1951	224	52	prepareinvoking	2015-05-28 11:34:57.689+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1952	224	52	preparemovetospace	2015-05-28 11:34:57.699+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1953	224	52	movetospace	2015-05-28 11:34:57.699+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1954	224	52	preparemovetocontainer	2015-05-28 11:34:57.699+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1955	224	52	movetocontainer	2015-05-28 11:34:57.708+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1956	224	52	invoked	2015-05-28 11:34:57.709+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1957	224	52	moving	2015-05-28 11:34:57.71+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1958	224	52	preparemoveupfront	2015-05-28 11:35:03.554+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1959	224	52	moveupfront	2015-05-28 11:35:04.081+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1960	224	52	moving	2015-05-28 11:35:05.142+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1961	224	52	prepareinvoking	2015-05-28 11:35:05.143+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1962	224	52	preparemovetospace	2015-05-28 11:35:05.143+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1963	224	52	movetospace	2015-05-28 11:35:05.143+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1964	224	52	preparemovetocontainer	2015-05-28 11:35:05.143+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1965	224	52	movetocontainer	2015-05-28 11:35:05.143+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1966	224	52	invoked	2015-05-28 11:35:05.143+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1967	224	52	moving	2015-05-28 11:35:05.143+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1968	224	52	preparemoveupfront	2015-05-28 11:35:07.933+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1969	224	52	moveupfront	2015-05-28 11:35:08.359+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1970	224	52	moving	2015-05-28 11:35:09.525+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1971	224	52	prepareinvoking	2015-05-28 11:35:09.526+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1972	224	52	preparemovetospace	2015-05-28 11:35:09.526+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1973	224	52	movetospace	2015-05-28 11:35:09.526+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1974	224	52	preparemovetocontainer	2015-05-28 11:35:09.526+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1975	224	52	movetocontainer	2015-05-28 11:35:09.526+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1976	224	52	invoked	2015-05-28 11:35:09.527+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1977	224	52	moving	2015-05-28 11:35:09.527+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1978	224	52	preparemoveupfront	2015-05-28 11:35:10.969+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1979	224	52	moveupfront	2015-05-28 11:35:11.474+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1980	224	52	moving	2015-05-28 11:35:11.741+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1981	224	52	prepareinvoking	2015-05-28 11:35:11.742+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1982	224	52	preparemovetospace	2015-05-28 11:35:11.742+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1983	224	52	movetospace	2015-05-28 11:35:11.742+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1984	224	52	preparemovetocontainer	2015-05-28 11:35:11.742+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1985	224	52	movetocontainer	2015-05-28 11:35:11.742+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1986	224	52	invoked	2015-05-28 11:35:11.742+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1987	224	52	moving	2015-05-28 11:35:11.742+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1988	224	52	preparemoveupfront	2015-05-28 11:35:13.231+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1989	224	52	moveupfront	2015-05-28 11:35:13.525+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1990	224	52	moving	2015-05-28 11:35:14.4+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1991	224	52	prepareinvoking	2015-05-28 11:35:14.401+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1992	224	52	preparemovetospace	2015-05-28 11:35:14.401+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
1993	224	52	movetospace	2015-05-28 11:35:14.401+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1994	224	52	preparemovetocontainer	2015-05-28 11:35:14.401+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
1995	224	52	movetocontainer	2015-05-28 11:35:14.401+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1996	224	52	invoked	2015-05-28 11:35:14.401+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1997	224	52	moving	2015-05-28 11:35:14.401+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1998	224	52	preparemoveupfront	2015-05-28 11:35:15.83+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
1999	224	52	moveupfront	2015-05-28 11:35:16.24+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2000	224	52	moving	2015-05-28 11:35:16.999+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2001	224	52	prepareinvoking	2015-05-28 11:35:17+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2002	224	52	preparemovetospace	2015-05-28 11:35:17+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2003	224	52	movetospace	2015-05-28 11:35:17+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2004	224	52	preparemovetocontainer	2015-05-28 11:35:17+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2005	224	52	movetocontainer	2015-05-28 11:35:17+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2006	224	52	invoked	2015-05-28 11:35:17.001+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2007	224	52	moving	2015-05-28 11:35:17.001+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2008	224	52	preparemoveupfront	2015-05-28 11:35:19.715+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2009	224	52	moveupfront	2015-05-28 11:35:20.198+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2010	224	52	moving	2015-05-28 11:35:21.351+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2011	224	52	prepareinvoking	2015-05-28 11:35:21.358+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2012	224	52	preparemovetospace	2015-05-28 11:35:21.358+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2013	224	52	movetospace	2015-05-28 11:35:21.358+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2014	224	52	preparemovetocontainer	2015-05-28 11:35:21.358+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2015	224	52	movetocontainer	2015-05-28 11:35:21.358+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2016	224	52	invoked	2015-05-28 11:35:21.358+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2017	224	52	moving	2015-05-28 11:35:21.358+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2018	224	52	preparemoveupfront	2015-05-28 11:35:23.374+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2019	224	52	moveupfront	2015-05-28 11:35:23.701+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2020	224	52	moving	2015-05-28 11:35:24.252+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2021	224	52	prepareinvoking	2015-05-28 11:35:24.252+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2022	224	52	preparemovetospace	2015-05-28 11:35:24.252+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2023	224	52	movetospace	2015-05-28 11:35:24.252+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2024	224	52	preparemovetocontainer	2015-05-28 11:35:24.252+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2025	224	52	movetocontainer	2015-05-28 11:35:24.252+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2026	224	52	invoked	2015-05-28 11:35:24.253+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2027	224	52	moving	2015-05-28 11:35:24.253+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2028	224	52	preparemoveupfront	2015-05-28 11:35:25.435+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2029	224	52	moveupfront	2015-05-28 11:35:25.776+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2030	224	52	moving	2015-05-28 11:35:26.156+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2031	224	52	prepareinvoking	2015-05-28 11:35:26.158+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2032	224	52	preparemovetospace	2015-05-28 11:35:26.158+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2033	224	52	movetospace	2015-05-28 11:35:26.158+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2034	224	52	preparemovetocontainer	2015-05-28 11:35:26.158+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2035	224	52	movetocontainer	2015-05-28 11:35:26.158+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2036	224	52	invoked	2015-05-28 11:35:26.159+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2037	224	52	moving	2015-05-28 11:35:26.159+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2038	224	52	preparemoveupfront	2015-05-28 11:35:27.203+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2039	224	52	moveupfront	2015-05-28 11:35:27.433+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2040	224	52	moving	2015-05-28 11:35:27.875+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2041	224	52	prepareinvoking	2015-05-28 11:35:27.876+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2042	224	52	preparemovetospace	2015-05-28 11:35:27.876+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2043	224	52	movetospace	2015-05-28 11:35:27.876+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2044	224	52	preparemovetocontainer	2015-05-28 11:35:27.876+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2045	224	52	movetocontainer	2015-05-28 11:35:27.876+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2046	224	52	invoked	2015-05-28 11:35:27.876+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2047	224	52	moving	2015-05-28 11:35:27.876+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2048	224	52	preparemoveupfront	2015-05-28 11:35:29.47+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2049	224	52	moveupfront	2015-05-28 11:35:29.727+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2050	224	52	moving	2015-05-28 11:35:30.183+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2051	224	52	prepareinvoking	2015-05-28 11:35:30.183+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2052	224	52	preparemovetospace	2015-05-28 11:35:30.183+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2053	224	52	movetospace	2015-05-28 11:35:30.183+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2054	224	52	preparemovetocontainer	2015-05-28 11:35:30.183+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2055	224	52	movetocontainer	2015-05-28 11:35:30.183+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2056	224	52	invoked	2015-05-28 11:35:30.184+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2057	224	52	moving	2015-05-28 11:35:30.184+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2058	224	52	preparemoveupfront	2015-05-28 11:35:33.696+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2059	224	52	moveupfront	2015-05-28 11:35:33.696+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2060	224	52	moving	2015-05-28 11:35:33.696+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2061	224	52	prepareinvoking	2015-05-28 11:35:33.709+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2062	224	52	preparemovetospace	2015-05-28 11:35:33.71+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2063	224	52	movetospace	2015-05-28 11:35:33.71+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2064	224	52	preparemovetocontainer	2015-05-28 11:35:33.71+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2065	224	52	movetocontainer	2015-05-28 11:35:33.711+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2066	224	52	invoked	2015-05-28 11:35:33.718+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2067	224	52	moving	2015-05-28 11:35:33.718+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2068	224	52	preparemoveupfront	2015-05-28 11:35:33.72+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2069	224	52	moveupfront	2015-05-28 11:35:33.72+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2070	224	52	moving	2015-05-28 11:35:33.72+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2071	224	52	prepareinvoking	2015-05-28 11:35:33.726+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2072	224	52	preparemovetospace	2015-05-28 11:35:33.726+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2073	224	52	movetospace	2015-05-28 11:35:33.726+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2074	224	52	preparemovetocontainer	2015-05-28 11:35:33.726+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2075	224	52	movetocontainer	2015-05-28 11:35:33.726+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2076	224	52	invoked	2015-05-28 11:35:33.733+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2077	224	52	moving	2015-05-28 11:35:33.739+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2078	224	52	preparemoveupfront	2015-05-28 11:35:33.74+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2079	224	52	moveupfront	2015-05-28 11:35:33.74+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2080	224	52	moving	2015-05-28 11:35:33.74+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2081	224	52	prepareinvoking	2015-05-28 11:35:33.741+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2082	224	52	preparemovetospace	2015-05-28 11:35:33.741+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2083	224	52	movetospace	2015-05-28 11:35:33.741+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2084	224	52	preparemovetocontainer	2015-05-28 11:35:33.741+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2085	224	52	movetocontainer	2015-05-28 11:35:33.741+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2086	224	52	invoked	2015-05-28 11:35:33.741+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2087	224	52	moving	2015-05-28 11:35:33.742+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2088	224	52	end	2015-05-28 11:35:33.743+06	t	0	1	{1}	{}	{63}	t	t	t	t	f	f
2089	225	52	start	2015-05-28 11:40:44.385+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2090	225	52	moving	2015-05-28 11:40:44.387+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2091	225	52	prepareinvoking	2015-05-28 11:40:44.462+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2092	225	52	preparemovetospace	2015-05-28 11:40:44.475+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2093	225	52	movetospace	2015-05-28 11:40:44.475+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2094	225	52	preparemovetocontainer	2015-05-28 11:40:44.475+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2095	225	52	movetocontainer	2015-05-28 11:40:44.478+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2096	225	52	invoked	2015-05-28 11:40:44.48+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2097	225	52	moving	2015-05-28 11:40:44.48+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2098	225	52	prepareinvoking	2015-05-28 11:40:48.405+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2099	225	52	moving	2015-05-28 11:40:50.904+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2100	225	52	prepareinvoking	2015-05-28 11:40:50.905+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2101	225	52	invoked	2015-05-28 11:40:50.906+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2102	225	52	moving	2015-05-28 11:40:50.907+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2103	225	52	end	2015-05-28 11:40:50.907+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2104	225	52	moving	2015-05-28 11:40:52.183+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2105	225	52	end	2015-05-28 11:40:52.184+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2106	226	52	start	2015-05-28 11:42:43.627+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2107	226	52	moving	2015-05-28 11:42:43.627+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2108	226	52	prepareinvoking	2015-05-28 11:42:43.628+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2109	226	52	preparemovetospace	2015-05-28 11:42:43.628+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2110	226	52	movetospace	2015-05-28 11:42:43.628+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2111	226	52	preparemovetocontainer	2015-05-28 11:42:43.628+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2112	226	52	movetocontainer	2015-05-28 11:42:43.628+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2113	226	52	invoked	2015-05-28 11:42:43.628+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2114	226	52	moving	2015-05-28 11:42:43.629+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2115	226	52	prepareinvoking	2015-05-28 11:42:50.214+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2116	226	52	moving	2015-05-28 11:42:58.71+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2117	226	52	prepareinvoking	2015-05-28 11:42:58.71+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2118	226	52	invoked	2015-05-28 11:42:58.715+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2119	226	52	moving	2015-05-28 11:42:58.715+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2120	226	52	end	2015-05-28 11:42:58.715+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2121	226	52	moving	2015-05-28 11:43:03.365+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2122	226	52	end	2015-05-28 11:43:03.366+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2123	227	52	start	2015-05-28 11:43:17.034+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2124	227	52	moving	2015-05-28 11:43:17.034+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2125	227	52	prepareinvoking	2015-05-28 11:43:17.034+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2126	227	52	preparemovetospace	2015-05-28 11:43:17.036+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2127	227	52	movetospace	2015-05-28 11:43:17.036+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2128	227	52	preparemovetocontainer	2015-05-28 11:43:17.036+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2129	227	52	movetocontainer	2015-05-28 11:43:17.036+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2130	227	52	invoked	2015-05-28 11:43:17.036+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2131	227	52	moving	2015-05-28 11:43:17.036+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2132	227	52	prepareinvoking	2015-05-28 11:43:28.351+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2133	227	52	moving	2015-05-28 11:43:48.455+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2134	227	52	prepareinvoking	2015-05-28 11:43:48.459+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2135	227	52	invoked	2015-05-28 11:43:48.46+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2136	227	52	moving	2015-05-28 11:43:48.46+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2137	227	52	end	2015-05-28 11:43:48.46+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2138	227	52	moving	2015-05-28 11:43:51.157+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2139	227	52	end	2015-05-28 11:43:51.158+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2140	228	52	start	2015-05-28 11:44:24.34+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2141	228	52	moving	2015-05-28 11:44:24.34+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2142	228	52	prepareinvoking	2015-05-28 11:44:24.343+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2143	228	52	preparemovetospace	2015-05-28 11:44:24.343+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2144	228	52	movetospace	2015-05-28 11:44:24.343+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2145	228	52	preparemovetocontainer	2015-05-28 11:44:24.343+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2146	228	52	movetocontainer	2015-05-28 11:44:24.343+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2147	228	52	invoked	2015-05-28 11:44:24.343+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2148	228	52	moving	2015-05-28 11:44:24.344+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2149	228	52	prepareinvoking	2015-05-28 11:44:42.407+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2150	228	52	moving	2015-05-28 11:46:33.708+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2151	228	52	prepareinvoking	2015-05-28 11:46:33.708+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2152	228	52	invoked	2015-05-28 11:46:33.711+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2153	228	52	moving	2015-05-28 11:46:33.711+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2154	228	52	end	2015-05-28 11:46:33.713+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2155	228	52	moving	2015-05-28 11:46:33.761+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2156	228	52	end	2015-05-28 11:46:33.762+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2157	229	52	start	2015-05-28 11:48:06.196+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2158	229	52	moving	2015-05-28 11:48:06.21+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2159	229	52	prepareinvoking	2015-05-28 11:48:06.322+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2160	229	52	preparemovetospace	2015-05-28 11:48:06.406+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2161	229	52	movetospace	2015-05-28 11:48:06.406+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2162	229	52	preparemovetocontainer	2015-05-28 11:48:06.406+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2163	229	52	movetocontainer	2015-05-28 11:48:06.415+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2164	229	52	invoked	2015-05-28 11:48:06.416+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2165	229	52	moving	2015-05-28 11:48:06.417+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2166	229	52	prepareinvoking	2015-05-28 11:50:14.659+06	t	0	1	{1}	{}	{63}	t	f	t	t	f	f
2167	229	52	moving	2015-05-28 11:50:14.74+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2168	229	52	prepareinvoking	2015-05-28 11:50:14.741+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2169	229	52	invoked	2015-05-28 11:50:14.742+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2170	229	52	moving	2015-05-28 11:50:14.742+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2171	229	52	end	2015-05-28 11:50:14.743+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2172	229	52	moving	2015-05-28 11:50:14.743+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2173	229	52	end	2015-05-28 11:50:14.743+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2174	231	52	start	2015-05-28 11:53:04.826+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2175	231	52	moving	2015-05-28 11:53:04.828+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2176	231	52	prepareinvoking	2015-05-28 11:53:04.868+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2177	231	52	preparemovetospace	2015-05-28 11:53:04.897+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2178	231	52	movetospace	2015-05-28 11:53:04.897+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2179	231	52	preparemovetocontainer	2015-05-28 11:53:04.897+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2180	231	52	movetocontainer	2015-05-28 11:53:04.899+06	t	0	1	{2}	{}	{63}	t	f	t	t	f	f
2181	231	52	invoked	2015-05-28 11:53:04.9+06	t	0	1	{2}	{}	{63}	t	f	t	t	f	f
2182	231	52	moving	2015-05-28 11:53:04.9+06	t	0	1	{2}	{}	{63}	t	f	t	t	f	f
2183	231	52	prepareinvokinginspace	2015-05-28 11:53:18.599+06	t	0	1	{2}	{}	{63}	t	f	t	t	f	f
2184	231	52	prepareinvoking	2015-05-28 11:53:19.292+06	t	0	1	{2}	{}	{63}	t	f	t	t	f	f
2185	231	52	invoked	2015-05-28 11:53:19.293+06	t	0	1	{2}	{}	{63}	t	f	t	t	f	t
2186	231	52	invokinginspace	2015-05-28 11:53:19.293+06	t	0	1	{2}	{}	{63}	t	f	t	t	f	t
2187	231	52	prepareinvoking	2015-05-28 11:53:21.286+06	t	0	1	{2}	{}	{63}	t	f	t	t	f	t
2188	231	52	moving	2015-05-28 11:53:23.678+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2189	231	52	paused	2015-05-28 11:53:23.679+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2190	231	52	moving	2015-05-28 11:53:24.932+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2191	231	52	paused	2015-05-28 11:53:24.932+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2192	231	52	start	2015-05-28 11:53:40.537+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2193	231	52	moving	2015-05-28 11:53:40.537+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2194	231	52	prepareinvoking	2015-05-28 11:53:40.538+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2195	231	52	preparemovetospace	2015-05-28 11:53:40.538+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2196	231	52	movetospace	2015-05-28 11:53:40.538+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2197	231	52	preparemovetocontainer	2015-05-28 11:53:40.538+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2198	231	52	movetocontainer	2015-05-28 11:53:40.538+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2199	231	52	invoked	2015-05-28 11:53:40.538+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2200	231	52	moving	2015-05-28 11:53:40.538+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2201	231	52	prepareinvokinginspace	2015-05-28 11:53:49.939+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2202	231	52	prepareinvoking	2015-05-28 11:53:50.443+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2203	231	52	invoked	2015-05-28 11:53:50.445+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2204	231	52	invokinginspace	2015-05-28 11:53:50.445+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2205	231	52	prepareinvoking	2015-05-28 11:53:51.605+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2206	231	52	moving	2015-05-28 11:53:54.333+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2207	231	52	prepareinvoking	2015-05-28 11:53:54.335+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2208	231	52	invoked	2015-05-28 11:53:54.336+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2209	231	52	moving	2015-05-28 11:53:54.336+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2210	231	52	end	2015-05-28 11:53:54.338+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2211	231	52	moving	2015-05-28 11:53:55.566+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2212	231	52	end	2015-05-28 11:53:55.567+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2213	232	52	start	2015-05-28 11:55:19.868+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2214	232	52	moving	2015-05-28 11:55:19.868+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2215	232	52	prepareinvoking	2015-05-28 11:55:19.868+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2216	232	52	preparemovetospace	2015-05-28 11:55:19.868+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2217	232	52	movetospace	2015-05-28 11:55:19.869+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2218	232	52	preparemovetocontainer	2015-05-28 11:55:19.869+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2219	232	52	movetocontainer	2015-05-28 11:55:19.869+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2220	232	52	invoked	2015-05-28 11:55:19.869+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2221	232	52	moving	2015-05-28 11:55:19.869+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2222	232	52	prepareinvokinginspace	2015-05-28 11:55:22.848+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2223	232	52	prepareinvoking	2015-05-28 11:55:22.852+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	f
2224	232	52	invoked	2015-05-28 11:55:22.852+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	t
2225	232	52	invokinginspace	2015-05-28 11:55:22.852+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	t
2226	232	52	prepareinvokinginspace	2015-05-28 11:55:22.853+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	t
2227	232	52	prepareinvoking	2015-05-28 11:55:22.853+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	t
2228	232	52	invoked	2015-05-28 11:55:22.853+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	t
2229	232	52	invokinginspace	2015-05-28 11:55:22.853+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	t
2230	232	52	prepareinvoking	2015-05-28 11:55:22.853+06	t	0	1	{3}	{}	{63}	t	f	t	t	f	t
2231	232	52	moving	2015-05-28 11:55:22.853+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2232	232	52	paused	2015-05-28 11:55:22.853+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2233	232	52	moving	2015-05-28 11:55:22.853+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2234	232	52	paused	2015-05-28 11:55:22.853+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2235	232	52	start	2015-05-28 11:55:42.092+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2236	232	52	moving	2015-05-28 11:55:42.092+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2237	232	52	prepareinvoking	2015-05-28 11:55:42.093+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2238	232	52	preparemovetospace	2015-05-28 11:55:42.093+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2239	232	52	movetospace	2015-05-28 11:55:42.093+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2240	232	52	preparemovetocontainer	2015-05-28 11:55:42.093+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2241	232	52	movetocontainer	2015-05-28 11:55:42.093+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	f
2242	232	52	invoked	2015-05-28 11:55:42.093+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	f
2243	232	52	moving	2015-05-28 11:55:42.093+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	f
2244	232	52	prepareinvokinginspace	2015-05-28 11:56:08.675+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	f
2245	232	52	prepareinvoking	2015-05-28 11:56:08.675+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	f
2246	232	52	invoked	2015-05-28 11:56:08.675+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	f
2247	232	52	invokinginspace	2015-05-28 11:56:08.676+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	f
2248	232	52	prepareinvokinginspace	2015-05-28 11:56:08.676+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	f
2249	232	52	prepareinvoking	2015-05-28 11:56:08.676+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	f
2250	232	52	invoked	2015-05-28 11:56:08.676+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	t
2251	232	52	invokinginspace	2015-05-28 11:56:08.676+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	t
2252	232	52	prepareinvoking	2015-05-28 11:56:08.676+06	t	0	1	{4}	{}	{63}	t	f	t	t	f	t
2253	232	52	moving	2015-05-28 11:56:08.676+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2254	232	52	paused	2015-05-28 11:56:08.676+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2255	232	52	moving	2015-05-28 11:56:08.676+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2256	232	52	paused	2015-05-28 11:56:08.676+06	t	1	0	{}	{}	{}	t	f	f	f	f	t
2257	232	52	start	2015-05-28 11:56:26.182+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2258	232	52	moving	2015-05-28 11:56:26.182+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2259	232	52	prepareinvoking	2015-05-28 11:56:26.183+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2260	232	52	preparemovetospace	2015-05-28 11:56:26.183+06	t	0	0	{}	{}	{}	t	f	f	f	f	f
2261	232	52	movetospace	2015-05-28 11:56:26.183+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2262	232	52	preparemovetocontainer	2015-05-28 11:56:26.183+06	t	0	1	{}	{}	{63}	t	f	t	f	f	f
2263	232	52	movetocontainer	2015-05-28 11:56:26.183+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2264	232	52	invoked	2015-05-28 11:56:26.184+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2265	232	52	moving	2015-05-28 11:56:26.184+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2266	232	52	prepareinvokinginspace	2015-05-28 11:56:45.736+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2267	232	52	prepareinvoking	2015-05-28 11:56:45.736+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2268	232	52	invoked	2015-05-28 11:56:45.744+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2269	232	52	invokinginspace	2015-05-28 11:56:45.745+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2270	232	52	prepareinvokinginspace	2015-05-28 11:56:45.745+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2271	232	52	prepareinvoking	2015-05-28 11:56:45.747+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2272	232	52	invoked	2015-05-28 11:56:45.747+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2273	232	52	invokinginspace	2015-05-28 11:56:45.747+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2274	232	52	prepareinvoking	2015-05-28 11:56:45.747+06	t	0	1	{5}	{}	{63}	t	f	t	t	f	f
2275	232	52	moving	2015-05-28 11:56:45.748+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2276	232	52	prepareinvoking	2015-05-28 11:56:45.748+06	t	1	0	{}	{}	{}	t	f	f	f	f	f
2277	232	52	invoked	2015-05-28 11:56:45.748+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2278	232	52	moving	2015-05-28 11:56:45.748+06	t	2	0	{}	{}	{}	t	f	f	f	f	f
2279	232	52	end	2015-05-28 11:56:45.748+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2280	232	52	moving	2015-05-28 11:56:45.748+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
2281	232	52	end	2015-05-28 11:56:45.749+06	t	2	0	{}	{}	{}	t	t	f	f	f	f
\.


--
-- Name: bpstation_loggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpstation_loggers_id_seq', 2281, true);


--
-- Data for Name: bpstations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpstations (id, process_id, state, step, space, container_step, expand_step, spaces_ids, started, finished, inspace, incontainer, inexpands, paused, note, created_at, updated_at, canceled, session_id, front) FROM stdin;
232	52	t	2	0	{}	{}	{}	t	t	f	f	f	f	\N	2015-04-27 16:20:47.69+06	2015-04-27 16:20:47.69+06	f	110	t
\.


--
-- Name: bpstations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpstations_id_seq', 232, true);


--
-- Data for Name: bpswitchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpswitchers (id, bprocess_id, switch_type, priority, state_id, session_state, fn, target, created_at, updated_at, override_group) FROM stdin;
9	45	n	2	85	\N	inc	step	2015-04-27 16:20:48.194+06	2015-04-27 16:20:48.194+06	0
10	45	n	2	86	\N	inc	step	2015-04-27 16:20:48.194+06	2015-04-27 16:20:48.194+06	0
44	51	outn	2	139	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
46	51	outn	2	141	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
48	51	outn	2	143	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
50	51	outn	2	145	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
51	51	inn	2	147	\N	inn	space	2015-04-27 16:20:47.567+06	2015-04-27 16:20:47.567+06	0
52	51	outn	2	148	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
53	51	n	2	149	\N	inc	step	\N	\N	0
54	52	inn	2	153	\N	inn	space	2015-04-27 16:20:47.567+06	2015-04-27 16:20:47.567+06	0
55	52	outn	2	154	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
58	52	outn	2	157	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
59	52	n	2	158	\N	inc	step	\N	\N	0
60	52	p	2	159	\N	paused	process	2015-04-27 16:20:48.549+06	2015-04-27 16:20:48.549+06	1
61	52	n	2	160	\N	inc	step	2015-04-27 16:20:48.612+06	2015-04-27 16:20:48.612+06	1
63	53	outn	2	165	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
64	52	p	2	166	\N	paused	process	2015-04-27 16:20:48.549+06	2015-04-27 16:20:48.549+06	1
65	52	n	2	167	\N	inc	step	2015-04-27 16:20:48.612+06	2015-04-27 16:20:48.612+06	1
66	53	inn	2	168	\N	inn	space	2015-04-27 16:20:47.567+06	2015-04-27 16:20:47.567+06	0
67	53	outn	2	169	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
69	53	outn	2	171	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
71	53	outn	2	173	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
73	53	outn	2	175	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
75	53	outn	2	177	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
77	53	outn	2	179	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
79	53	outn	2	181	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
81	53	outn	2	183	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
83	53	outn	2	185	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
85	53	outn	2	187	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
86	53	inn	2	188	\N	inn	space	2015-04-27 16:20:47.567+06	2015-04-27 16:20:47.567+06	0
87	53	outn	2	189	\N	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
\.


--
-- Name: bpswitchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpswitchers_id_seq', 87, true);


--
-- Data for Name: business_services; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY business_services (id, title, business_id, master_acc) FROM stdin;
1	esaatul	1	
2	321	1	
4	3211	1	
5	321	1	
8	hui	1	
9	321	1	
10	321	1	
12	TTTTT123	2	iamjacke@gmail.com
31	happy new year	3	juices.woo@gmail.com
\.


--
-- Name: business_services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('business_services_id_seq', 31, true);


--
-- Data for Name: businesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY businesses (id, title, phone, website, country, city, address, walkthrough, created_at, updated_at, nickname) FROM stdin;
1	default business	\N	\N			\N	f	\N	\N	\N
3	Empire	7002858852	haha.co	Espano	Huhuiawei	Elm st. 19	t	\N	\N	\N
4	Your Company	\N	\N			\N	t	\N	\N	\N
5	Your Company	\N	\N			\N	t	\N	\N	\N
6	Your Company	\N	\N			\N	t	\N	\N	\N
7	Your Company	\N	\N			\N	t	\N	\N	\N
8	Your Company	\N	\N			\N	t	\N	\N	\N
9	Your Company	\N	\N			\N	t	\N	\N	\N
2	Empire InCloud	+79090860451	\N	Россия	Saint-Petersburg	Komsomolsky prospekt 1	t	\N	\N	empia
\.


--
-- Name: businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('businesses_id_seq', 9, true);


--
-- Data for Name: client_observers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY client_observers (id, uid) FROM stdin;
\.


--
-- Name: client_observers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('client_observers_id_seq', 1, false);


--
-- Data for Name: elem_topologs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY elem_topologs (id, process_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
3	38	144	\N		\N	\N	\N
4	39	145	\N		\N	\N	\N
6	40	146	\N		\N	\N	\N
8	39	147	\N		\N	\N	\N
10	39	148	\N		\N	\N	\N
11	39	\N	29		\N	\N	\N
28	45	160	\N		\N	2015-04-28 03:53:22.467+06	\N
29	45	161	\N		\N	2015-04-28 03:53:34.49+06	\N
54	51	188	\N		\N	2015-05-22 19:54:07.078+06	\N
55	51	\N	36		\N	2015-05-22 19:54:31.974+06	\N
56	52	189	\N		\N	2015-05-22 20:30:11.55+06	\N
59	52	190	\N		\N	2015-05-22 20:31:14.688+06	\N
60	52	\N	39		\N	2015-05-22 20:36:45.891+06	\N
62	52	\N	40		2015-05-28 11:55:02.368+06	2015-05-28 11:55:02.368+06	\N
63	53	192	\N		2015-05-28 12:26:26.579+06	2015-05-28 12:26:26.579+06	\N
65	53	\N	\N		2015-05-28 14:03:17.467+06	2015-05-28 14:03:17.467+06	\N
66	53	\N	\N		2015-05-28 14:06:48.589+06	2015-05-28 14:06:48.589+06	\N
67	53	\N	\N		2015-05-28 14:08:32.785+06	2015-05-28 14:08:32.785+06	\N
68	53	\N	\N		2015-05-28 14:10:52.816+06	2015-05-28 14:10:52.816+06	\N
69	53	\N	\N		2015-05-28 14:12:09.407+06	2015-05-28 14:12:09.407+06	\N
70	53	\N	\N		2015-05-28 14:17:21.514+06	2015-05-28 14:17:21.514+06	\N
71	53	\N	\N		2015-05-28 14:21:22.014+06	2015-05-28 14:21:22.014+06	\N
72	53	\N	\N		2015-05-28 14:25:17.681+06	2015-05-28 14:25:17.681+06	\N
73	53	\N	\N		2015-05-28 14:26:08.257+06	2015-05-28 14:26:08.257+06	\N
\.


--
-- Name: elem_topologs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('elem_topologs_id_seq', 73, true);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employees (id, uid, master_acc, "position", manager) FROM stdin;
1	iamjacke@gmail.com	iamjacke@gmail.com	\N	t
2	juices.woo@gmail.com	juices.woo@gmail.com	\N	t
6	W.Ffk@example.com	W.Ffk@example.com	\N	t
8	R.Peht@example.com	R.Peht@example.com	\N	t
10	N.As@example.com	N.As@example.com	\N	t
11	B.Olxxo@example.com	B.Olxxo@example.com	\N	t
12	O.Qekwxza@example.com	O.Qekwxza@example.com	\N	t
13	X.Rrwydyywt@example.com	X.Rrwydyywt@example.com	\N	t
14	test1@minorityapp.com	iamjacke@gmail.com	\N	t
15	test1@minorityapp.com	test1@minorityapp.com	\N	t
\.


--
-- Data for Name: employees_businesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employees_businesses (employee_id, business_id) FROM stdin;
1	2
2	3
8	4
10	5
11	6
12	7
13	8
15	9
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employees_id_seq', 15, true);


--
-- Data for Name: groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY groups (id, title, created_at, updated_at, business_id) FROM stdin;
1	test group	2015-05-20 04:35:13.483+06	2015-05-20 04:35:13.483+06	2
\.


--
-- Name: groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('groups_id_seq', 4, true);


--
-- Name: input_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('input_id_seq', 18, true);


--
-- Data for Name: input_loggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY input_loggers (id, uid, action, arguments, reaction_id, input, date, session_id, input_id) FROM stdin;
20	iamjacke@gmail.com	input	{}	13	15	2015-05-28 11:55:40.309+06	110	16
21	iamjacke@gmail.com	input	{}	14	17	2015-05-28 11:56:24.014+06	110	18
\.


--
-- Name: input_loggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('input_loggers_id_seq', 21, true);


--
-- Data for Name: observers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY observers (id, station_id, bprocess_id, hash_code, "fullName", created_at) FROM stdin;
\.


--
-- Name: observers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('observers_id_seq', 1, false);


--
-- Data for Name: plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY plans (id, title, price) FROM stdin;
1	Trial	0.00
2	Startup	50.00
3	Company	160.00
\.


--
-- Name: plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('plans_id_seq', 3, true);


--
-- Data for Name: proc_element_reflections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proc_element_reflections (id, reflection_id, title, "desc", b_type, type_title, ref_space_id, "order", created_at, updated_at) FROM stdin;
1	1	Test		block	confirm	\N	1	\N	\N
2	1	Cn	 	brick	container_brick	1	2	\N	\N
3	2	Cf	 	block	confirm	\N	1	\N	\N
4	3	Cf	 	block	confirm	\N	1	\N	\N
5	4	Cn	 	brick	container_brick	\N	1	\N	\N
6	5	Placeholder	Plain action element. While invoking, puts marker after themself. Used for plain action description, without extra functionality.	block	positive	\N	1	\N	\N
23	25	Container		brick	container_brick	\N	1	2015-04-27 16:20:46.704+06	2015-04-27 16:20:46.76+06
24	26	Placeholder		block	placeholder	\N	1	\N	\N
25	27	Confirmation		block	confirm	\N	1	2015-04-27 16:20:48.329+06	2015-04-27 16:20:48.329+06
\.


--
-- Name: proc_element_reflections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proc_element_reflections_id_seq', 25, true);


--
-- Data for Name: proc_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proc_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, space_id, "order", created_at, updated_at) FROM stdin;
114	афыа	афыаф	2	18	brick	container_brick	\N	1	\N	\N
119	1	1	3	22	brick	container_brick	\N	1	\N	\N
120	2	2	3	22	block	confirm	\N	2	\N	\N
121	3	3	3	22	brick	container_brick	\N	3	\N	\N
122	4	4	3	22	block	confirm	\N	4	\N	\N
123	5	5	3	22	block	confirm	\N	5	\N	\N
124	cf	cf	2	18	block	confirm	\N	2	\N	\N
131	test		1	25	brick	container_brick	\N	1	\N	\N
132	test		1	26	brick	container_brick	\N	1	\N	\N
133	test		1	27	brick	container_brick	\N	1	\N	\N
134	test		1	28	brick	container_brick	\N	1	\N	\N
135	test		1	29	brick	container_brick	\N	1	\N	\N
136	test		1	30	brick	container_brick	\N	1	\N	\N
137	test		1	33	brick	container_brick	\N	1	\N	\N
138	test		1	34	brick	container_brick	\N	1	\N	\N
139	test		1	35	brick	container_brick	\N	1	\N	\N
140	test		1	36	brick	container_brick	\N	1	\N	\N
141	test		1	37	brick	container_brick	\N	1	\N	\N
142	test		1	38	brick	container_brick	\N	1	\N	\N
143	test		1	38	brick	container_brick	\N	2	\N	\N
144	test		1	38	brick	container_brick	\N	3	\N	\N
145	test		1	39	brick	container_brick	\N	1	\N	\N
146	test		1	40	brick	container_brick	\N	1	\N	\N
147	test		1	39	brick	container_brick	\N	2	\N	\N
148	test		1	39	brick	container_brick	\N	3	\N	\N
160	ph1		2	45	block	placeholder	\N	1	\N	\N
161	ph2		2	45	block	placeholder	\N	2	\N	\N
188	cn	cn	2	51	brick	container_brick	\N	1	2015-04-27 16:20:46.704+06	2015-04-27 16:20:46.76+06
189	tet	tete	2	52	brick	container_brick	\N	1	2015-04-27 16:20:46.704+06	2015-04-27 16:20:46.76+06
190	tete	t	2	52	block	positive	\N	2	\N	\N
202	cn2	cn2	2	53	brick	container_brick	\N	2	2015-04-27 16:20:46.704+06	2015-04-27 16:20:46.76+06
192	CN	CN	2	53	brick	container_brick	\N	1	2015-04-27 16:20:46.704+06	2015-04-27 16:20:46.76+06
\.


--
-- Name: proc_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proc_elements_id_seq', 202, true);


--
-- Data for Name: process_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY process_histories (id, master_acc, process_id, action, date, what) FROM stdin;
\.


--
-- Name: process_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('process_histories_id_seq', 1, true);


--
-- Data for Name: process_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY process_permissions (id, uid, group_id, bprocess, front_elem_id, space_elem_id, reaction_id, role) FROM stdin;
1	iamjacke@gmail.com	\N	18	\N	\N	\N	view
2	test1@minorityapp.com	\N	18	\N	\N	\N	all
3	iamjacke@gmail.com	\N	18	\N	\N	\N	edit
8	\N	1	18	\N	\N	\N	edit
\.


--
-- Name: process_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('process_permissions_id_seq', 8, true);


--
-- Data for Name: reaction_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reaction_refs (id, reflection_id, autostart, element_id, state_ref_id, created_at, updated_at, title) FROM stdin;
4	27	f	22	\N	2015-04-27 16:20:48.79+06	2015-04-27 16:20:48.79+06	Confirming
\.


--
-- Name: reaction_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reaction_refs_id_seq', 4, true);


--
-- Data for Name: reaction_state_out_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reaction_state_out_refs (id, reaction_id, state_ref, "on", on_rate, created_at, updated_at) FROM stdin;
4	4	26	t	100	2015-04-27 16:20:48.979+06	2015-04-27 16:20:48.979+06
\.


--
-- Name: reaction_state_out_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reaction_state_out_refs_id_seq', 4, true);


--
-- Data for Name: reaction_state_outs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reaction_state_outs (id, reaction_id, state_id, "on", on_rate, created_at, updated_at) FROM stdin;
4	13	160	t	100	2015-04-27 16:20:48.979+06	2015-04-27 16:20:48.979+06
5	14	167	t	100	2015-04-27 16:20:48.979+06	2015-04-27 16:20:48.979+06
\.


--
-- Name: reaction_state_outs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reaction_state_outs_id_seq', 5, true);


--
-- Data for Name: reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reactions (id, bprocess_id, autostart, element_id, state_ref_id, created_at, updated_at, title) FROM stdin;
13	52	f	60	\N	2015-04-27 16:20:48.79+06	2015-04-27 16:20:48.79+06	Confirming
14	52	f	62	\N	2015-04-27 16:20:48.79+06	2015-04-27 16:20:48.79+06	Confirming
\.


--
-- Name: reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reactions_id_seq', 14, true);


--
-- Data for Name: reflected_elem_topologs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reflected_elem_topologs (id, reflection_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
1	1	1	\N		\N	\N	\N
2	1	2	\N	 	\N	\N	\N
3	1	\N	1	 	\N	\N	\N
4	5	6	\N	 	\N	\N	\N
5	4	5	\N	 	\N	\N	\N
20	25	23	\N		\N	\N	\N
21	26	24	\N		\N	\N	\N
22	27	25	\N		\N	\N	\N
\.


--
-- Name: reflected_elem_topologs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reflected_elem_topologs_id_seq', 22, true);


--
-- Data for Name: refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY refs (id, title, host, created_at, updated_at, "desc", category, hidden) FROM stdin;
5	Placeholder2	test.minorityapp.com	\N	\N	Some desc	Base	f
4	Container2	base.minorityapp.com	\N	\N	Some desc	Base	t
3	Confirm with cancelation	base.minorityapp.com	\N	\N	Some desc	Confirmation	t
1	Test2	base.minorityapp.com	\N	\N	Some desc	Base	t
26	Placeholder		\N	\N	Element used for fill the hole betwen other elements. When it's launch, nothing happens and it will be skipped.	Base	t
2	Confirm2	base.minorityapp.com	\N	\N	Some desc	Confirmation	t
27	Confirmation		\N	\N	Element used for confirming action. When it's launch, and it's not confirmed, process will be paused until confirmed reaction was executed.	Confirmation	f
25	Container		\N	\N	Element used for storing other elements by decomposing hard action to easy one. May have containers too inside.	Base	f
\.


--
-- Name: refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('refs_id_seq', 27, true);


--
-- Data for Name: session_state_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY session_state_logs (id, session_id, "on", on_rate, reason, created_at, updated_at, state_id) FROM stdin;
424	110	t	100	flow	2015-05-28 11:55:42.092+06	2015-05-28 11:55:42.092+06	819
426	110	t	100	flow	2015-05-28 11:55:42.093+06	2015-05-28 11:55:42.093+06	822
428	110	t	100	flow	2015-05-28 11:56:08.676+06	2015-05-28 11:56:08.676+06	828
430	110	t	100	flow	2015-05-28 11:56:26.182+06	2015-05-28 11:56:26.182+06	819
432	110	t	100	flow	2015-05-28 11:56:26.184+06	2015-05-28 11:56:26.184+06	822
434	110	t	100	flow	2015-05-28 11:56:45.747+06	2015-05-28 11:56:45.747+06	828
436	110	t	100	flow	2015-05-28 11:56:45.748+06	2015-05-28 11:56:45.748+06	825
438	110	t	100	flow	2015-05-28 11:56:45.748+06	2015-05-28 11:56:45.749+06	821
419	110	t	100	flow	2015-05-28 11:55:19.868+06	2015-05-28 11:55:19.868+06	820
421	110	t	100	flow	2015-05-28 11:55:22.852+06	2015-05-28 11:55:22.852+06	826
423	110	t	100	flow	2015-05-28 11:55:22.853+06	2015-05-28 11:55:22.853+06	823
425	110	t	100	flow	2015-05-28 11:55:42.092+06	2015-05-28 11:55:42.092+06	820
427	110	t	100	flow	2015-05-28 11:56:08.675+06	2015-05-28 11:56:08.675+06	826
429	110	t	100	flow	2015-05-28 11:56:08.676+06	2015-05-28 11:56:08.676+06	823
431	110	t	100	flow	2015-05-28 11:56:26.182+06	2015-05-28 11:56:26.182+06	820
433	110	t	100	flow	2015-05-28 11:56:45.736+06	2015-05-28 11:56:45.736+06	826
435	110	t	100	flow	2015-05-28 11:56:45.748+06	2015-05-28 11:56:45.748+06	823
437	110	t	100	flow	2015-05-28 11:56:45.748+06	2015-05-28 11:56:45.748+06	821
418	110	t	100	flow	2015-05-28 11:55:19.868+06	2015-05-28 11:55:19.868+06	819
420	110	t	100	flow	2015-05-28 11:55:19.869+06	2015-05-28 11:55:19.869+06	822
422	110	t	100	flow	2015-05-28 11:55:22.853+06	2015-05-28 11:55:22.853+06	828
\.


--
-- Name: session_state_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('session_state_logs_id_seq', 438, true);


--
-- Data for Name: sessionstates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessionstates (id, process_id, session_id, title, neutral, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, origin_state_id, middle, middleable, oposite, opositable) FROM stdin;
823	52	110	lap	unlap	f	\N	\N	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	63	f	0	154		f		f
819	52	110	initiated	uninitiated	t	\N	\N	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	\N	t	100	150	initiating	t		f
827	52	110	confirmed	unconfirmed	f	\N	39	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	\N	t	100	160	confirming	t		f
825	52	110	invoked	uninvoked	f	190	\N	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	\N	t	100	158		f		f
829	52	110	confirmed	unconfirmed	f	\N	40	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	\N	t	100	167	confirming	t		f
821	52	110	finished	unfinished	t	\N	\N	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	\N	t	100	152	finishing	t		f
824	52	110	lap	unlap	f	\N	\N	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	64	f	0	157		f		f
822	52	110	invoked	uninvoked	f	189	\N	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	\N	t	100	153	invoking	t		f
826	52	110	invoked	uninvoked	f	\N	39	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	\N	t	100	159	invoking	t		f
828	52	110	invoked	uninvoked	f	\N	40	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	\N	t	100	166	invoking	t		f
820	52	110	invoking	paused	t	\N	\N	2015-05-28 11:55:14.403+06	2015-05-28 11:55:14.403+06	en	\N	t	100	151	invoking	t		f
\.


--
-- Name: sessionstates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessionstates_id_seq', 829, true);


--
-- Data for Name: space_element_reflections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY space_element_reflections (id, reflection_id, title, "desc", b_type, type_title, ref_space_id, ref_space_owned_id, space_role, "order", created_at, updated_at) FROM stdin;
1	1	Space elem	 	block	confirm	\N	1	container	1	\N	\N
\.


--
-- Name: space_element_reflections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('space_element_reflections_id_seq', 3, false);


--
-- Data for Name: space_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY space_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, own_space_id, owned_space_id, space_role, "order", created_at, updated_at) FROM stdin;
24	Обрезал	Обрезал головку	2	18	block	confirm	\N	22	container	1	\N	\N
26	test		1	39	brick	container_brick	\N	41	\N	1	\N	\N
27	test		1	40	brick	container_brick	\N	43	\N	1	\N	\N
28	test		1	39	brick	container_brick	\N	45	\N	1	\N	\N
29	test		1	39	brick	container_brick	\N	47	\N	1	\N	\N
36	ph	pg	2	51	block	positive	\N	62	\N	1	\N	\N
39	cf	cf	2	52	block	confirm	\N	63	\N	1	2015-04-27 16:20:48.329+06	2015-04-27 16:20:48.329+06
40	CF2	CF2	2	52	block	confirm	\N	63	\N	2	2015-04-27 16:20:48.329+06	2015-04-27 16:20:48.329+06
\.


--
-- Name: space_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('space_elements_id_seq', 40, true);


--
-- Data for Name: space_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY space_refs (id, reflection_id, index, container, subbrick, brick_front, brick_nested, "nestingLevel", created_at, updated_at) FROM stdin;
1	1	1	t	f	2	\N	1	\N	\N
2	4	1	t	f	5	\N	1	\N	\N
3	25	1	t	f	23	\N	1	2015-04-27 16:20:47.69+06	2015-04-27 16:20:47.69+06
\.


--
-- Name: space_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('space_refs_id_seq', 3, true);


--
-- Data for Name: state_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY state_refs (id, reflection_id, title, neutral, process_state, "on", on_rate, ref_front_elem_id, ref_space_elem_id, created_at, updated_at, lang, ref_space_id, middle, middleable, oposite, opositable) FROM stdin;
1	1	started	unstarted	f	f	0	1	\N	\N	\N	en	\N		f		f
2	1	finished	not_finished	f	f	0	1	\N	\N	\N	en	\N		f		f
3	1	confirmed	unconfirmed	f	f	0	1	\N	\N	\N	en	\N		f		f
4	1	started	unstarted	f	f	0	2	\N	\N	\N	en	\N		f		f
5	1	started	unstarted	f	f	0	\N	1	\N	\N	en	\N		f		f
6	1	confirmed	unconfirmed	f	f	0	\N	1	\N	\N	en	\N		f		f
7	1	finished	not_finished	f	f	0	2	\N	\N	\N	en	\N		f		f
8	5	invoked	uninvoked	f	f	0	6	\N	\N	\N	en	\N		f		f
22	25	invoked	uninvoked	f	f	0	23	\N	2015-04-27 16:20:47.42+06	2015-04-27 16:20:47.42+06	en	\N	invoking	t		f
23	25	lap	unlap	f	f	0	\N	\N	2015-04-27 16:20:47.853+06	2015-04-27 16:20:47.853+06	en	3		f		f
24	26	invoked	uninvoked	f	f	0	24	\N	2015-04-27 16:20:48.125+06	2015-04-27 16:20:48.125+06	en	\N	invoking	t		f
25	27	invoked	uninvoked	f	f	0	25	\N	2015-04-27 16:20:48.423+06	2015-04-27 16:20:48.423+06	en	\N	invoking	t		f
26	27	confirmed	unconfirmed	f	f	0	25	\N	2015-04-27 16:20:48.489+06	2015-04-27 16:20:48.489+06	en	\N	confirming	t		f
\.


--
-- Name: state_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('state_refs_id_seq', 26, true);


--
-- Data for Name: switcher_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY switcher_refs (id, reflection_id, switch_type, priority, state_ref_id, fn, target, created_at, updated_at, override_group) FROM stdin;
1	5	n	2	8	inc	step	\N	\N	0
11	25	inn	2	22	inn	space	2015-04-27 16:20:47.567+06	2015-04-27 16:20:47.567+06	0
12	25	outn	2	23	outn	space	2015-04-27 16:20:47.922+06	2015-04-27 16:20:47.922+06	0
13	26	n	2	24	inc	step	2015-04-27 16:20:48.194+06	2015-04-27 16:20:48.194+06	0
14	27	p	2	25	paused	process	2015-04-27 16:20:48.549+06	2015-04-27 16:20:48.549+06	1
15	27	n	2	26	inc	step	2015-04-27 16:20:48.612+06	2015-04-27 16:20:48.612+06	1
\.


--
-- Name: switcher_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('switcher_refs_id_seq', 15, true);


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tokens (uuid, email, "creationTime", "expirationTime", "isSignUp") FROM stdin;
\.


--
-- Name: account_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_pkey PRIMARY KEY (id);


--
-- Name: account_loggers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY account_loggers
    ADD CONSTRAINT account_loggers_pkey PRIMARY KEY (id);


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
-- Name: client_observers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY client_observers
    ADD CONSTRAINT client_observers_pkey PRIMARY KEY (id);


--
-- Name: elem_topologs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_pkey PRIMARY KEY (id);


--
-- Name: employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);


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
-- Name: observers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_pkey PRIMARY KEY (id);


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
-- Name: session_state_logs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_pkey PRIMARY KEY (id);


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
-- Name: switcher_refs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_pkey PRIMARY KEY (id);


--
-- Name: title; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY refs
    ADD CONSTRAINT title UNIQUE (title);


--
-- Name: ReactionFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT "ReactionFK" FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;


--
-- Name: acc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_group
    ADD CONSTRAINT acc_fk FOREIGN KEY (account_id) REFERENCES accounts("userId") ON DELETE CASCADE;


--
-- Name: b_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bploggers
    ADD CONSTRAINT b_fk FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;


--
-- Name: bizz_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY billing_infos
    ADD CONSTRAINT bizz_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpspaces
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_elements
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bploggers
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_histories
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY observers
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpsessions
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bprocess_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactions
    ADD CONSTRAINT bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: bpspace_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_elements
    ADD CONSTRAINT bpspace_fk FOREIGN KEY (owned_space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;


--
-- Name: business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_elements
    ADD CONSTRAINT business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: business_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY groups
    ADD CONSTRAINT business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;


--
-- Name: buss_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY business_services
    ADD CONSTRAINT buss_fk FOREIGN KEY (business_id) REFERENCES businesses(id);


--
-- Name: buss_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_plans
    ADD CONSTRAINT buss_fk FOREIGN KEY (business_id) REFERENCES businesses(id);


--
-- Name: element_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT element_fk FOREIGN KEY (element_id) REFERENCES reflected_elem_topologs(id) ON DELETE CASCADE;


--
-- Name: element_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactions
    ADD CONSTRAINT element_fk FOREIGN KEY (element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;


--
-- Name: employee_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT employee_fk FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;


--
-- Name: fElemPermFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT "fElemPermFK" FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


--
-- Name: groupFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT "groupFK" FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: group_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_group
    ADD CONSTRAINT "group_FK" FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;


--
-- Name: macc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY employees
    ADD CONSTRAINT macc_fk FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;


--
-- Name: macc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_plans
    ADD CONSTRAINT macc_fk FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;


--
-- Name: macc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bills
    ADD CONSTRAINT macc_fk FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;


--
-- Name: macc_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_histories
    ADD CONSTRAINT macc_fk FOREIGN KEY (master_acc) REFERENCES accounts("userId") ON DELETE CASCADE;


--
-- Name: plan_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_plans
    ADD CONSTRAINT plan_fk FOREIGN KEY (plan_id) REFERENCES plans(id) ON DELETE CASCADE;


--
-- Name: procelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bploggers
    ADD CONSTRAINT procelem_fk FOREIGN KEY (proc_element_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


--
-- Name: procelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT procelem_fk FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


--
-- Name: procelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstates
    ADD CONSTRAINT procelem_fk FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


--
-- Name: procelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT procelem_fk FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


--
-- Name: procelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT procelem_fk FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;


--
-- Name: process_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_fk FOREIGN KEY (bprocess) REFERENCES bprocesses(id) ON DELETE CASCADE;


--
-- Name: reactionFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT "reactionFK" FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;


--
-- Name: reaction_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_fk FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;


--
-- Name: reaction_ref_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_ref_fk FOREIGN KEY (reaction_id) REFERENCES reaction_refs(id) ON DELETE CASCADE;


--
-- Name: ref_procelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT ref_procelem_fk FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;


--
-- Name: ref_procelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT ref_procelem_fk FOREIGN KEY (front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;


--
-- Name: ref_space_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT ref_space_fk FOREIGN KEY (space_id) REFERENCES space_refs(id) ON DELETE CASCADE;


--
-- Name: ref_spaceelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT ref_spaceelem_fk FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;


--
-- Name: ref_spaceelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT ref_spaceelem_fk FOREIGN KEY (space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;


--
-- Name: reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY proc_element_reflections
    ADD CONSTRAINT reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_refs
    ADD CONSTRAINT reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY space_element_reflections
    ADD CONSTRAINT reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: reflect_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;


--
-- Name: service_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT service_fk FOREIGN KEY (service_id) REFERENCES business_services(id) ON DELETE CASCADE;


--
-- Name: sessionFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT "sessionFK" FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: session_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstations
    ADD CONSTRAINT session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;


--
-- Name: session_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT session_state_fk FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;


--
-- Name: session_state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT session_state_fk FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;


--
-- Name: spElemPermFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT "spElemPermFK" FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;


--
-- Name: sp_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bploggers
    ADD CONSTRAINT sp_fk FOREIGN KEY (space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;


--
-- Name: space_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT space_fk FOREIGN KEY (space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;


--
-- Name: spaceelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bploggers
    ADD CONSTRAINT spaceelem_fk FOREIGN KEY (space_element_id) REFERENCES space_elements(id) ON DELETE CASCADE;


--
-- Name: spaceelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT spaceelem_fk FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;


--
-- Name: spaceelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstates
    ADD CONSTRAINT spaceelem_fk FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;


--
-- Name: spaceelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT spaceelem_fk FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;


--
-- Name: spaceelem_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY state_refs
    ADD CONSTRAINT spaceelem_fk FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;


--
-- Name: st_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY observers
    ADD CONSTRAINT st_fk FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;


--
-- Name: state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT state_fk FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;


--
-- Name: state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reactions
    ADD CONSTRAINT state_fk FOREIGN KEY (state_ref_id) REFERENCES bpstates(id) ON DELETE CASCADE;


--
-- Name: state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT state_fk FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;


--
-- Name: state_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT state_fk FOREIGN KEY (state_id) REFERENCES sessionstates(id) ON DELETE CASCADE;


--
-- Name: state_ref_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT state_ref_fk FOREIGN KEY (state_ref) REFERENCES state_refs(id) ON DELETE CASCADE;


--
-- Name: state_ref_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT state_ref_fk FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;


--
-- Name: statefk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT statefk FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;


--
-- Name: statefk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT statefk FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;


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

