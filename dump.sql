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
    phone character varying(254)
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- Name: act_permissions; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE act_permissions (
    id integer NOT NULL,
    uid character varying(254) NOT NULL,
    bprocess integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer
);


ALTER TABLE public.act_permissions OWNER TO postgres;

--
-- Name: act_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE act_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.act_permissions_id_seq OWNER TO postgres;

--
-- Name: act_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE act_permissions_id_seq OWNED BY act_permissions.id;


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
    comps compositevalues[],
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
    updated_at timestamp with time zone
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
    opposite character varying(254) NOT NULL,
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
    middleable boolean DEFAULT false
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
    updated_at timestamp with time zone
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
-- Name: input_loggers; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE input_loggers (
    id integer NOT NULL,
    uid character varying(254),
    action character varying(254) NOT NULL,
    arguments text[] NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    date timestamp with time zone NOT NULL,
    station_id integer NOT NULL
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
    comps compositevalues[],
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
-- Name: reaction_refs; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reaction_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    autostart boolean NOT NULL,
    element_id integer NOT NULL,
    state_ref_id integer,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
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
    updated_at timestamp with time zone
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
    category character varying(254) DEFAULT 'Common'::character varying NOT NULL
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
    opposite character varying(254) NOT NULL,
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
    middle character varying(253) DEFAULT ''::character varying,
    middleable boolean DEFAULT false
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
    comps compositevalues[],
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
    opposite character varying(254) NOT NULL,
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
    middleable boolean DEFAULT false
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

ALTER TABLE ONLY account_loggers ALTER COLUMN id SET DEFAULT nextval('account_loggers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account_plans ALTER COLUMN id SET DEFAULT nextval('account_plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY act_permissions ALTER COLUMN id SET DEFAULT nextval('act_permissions_id_seq'::regclass);


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
\.


--
-- Name: account_loggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_loggers_id_seq', 370, true);


--
-- Data for Name: account_plans; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY account_plans (id, business_id, master_acc, plan_id, expired_at) FROM stdin;
2	\N	juices.woo@gmail.com	2	2015-05-08 04:39:16.024+06
1	\N	iamjacke@gmail.com	1	2015-05-28 04:39:16.024+06
\.


--
-- Name: account_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_plans_id_seq', 2, true);


--
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY accounts ("providerId", "userId", "firstName", "lastName", "fullName", email, "avatarUrl", "authMethod", token, secret, "accessToken", "tokenType", "expiresIn", "refreshToken", hasher, password, salt, lang, country, phone) FROM stdin;
userpass	iamjacke@gmail.com	Steve	Jobs	Steve Jobs	iamjacke@gmail.com	http://www.gravatar.com/avatar/651ec554c78e46fe3e36cb98dacb31a5?d=404	userPassword	\N	\N	\N	\N	\N	\N	bcrypt	$2a$10$ENARefhlAASkLkf7j4gQ1.efeDzHXkYW/N5r7eM8bnncKIhCsYQa.	\N	en	\N	\N
userpass	juices.woo@gmail.com	Pavel	Chekmaryov	Pavel Chekmaryov	juices.woo@gmail.com	\N	userPassword	\N	\N	\N	\N	\N	\N	bcrypt	$2a$10$xCou9.MY1yK/lkhoAUwO5uM0AEx9aHx1U0.OQhPrWh4hDYBxQHcya	\N	en	\N	\N
Wfchixf	Rtfu	Sxemk	Vkd	Sxemk Vkd	S.Vkd@example.com	\N	userPassword	\N	\N	\N	\N	\N	\N			\N	en	\N	\N
Yhhdogllmxm	Nsoqfjr	Sjtxh	Ypps	Sjtxh Ypps	S.Ypps@example.com	\N	openId	\N	\N	\N	\N	\N	\N			\N	en	\N	\N
Kofkwrs	Sstjmyeazm	Vxfeu	Ybjpkdkorao	Vxfeu Ybjpkdkorao	V.Ybjpkdkorao@example.com	\N	openId	\N	\N	\N	\N	\N	\N			\N	en	\N	\N
J.Tuvrwjltww@example.com	Wyeunaiu	Jxedsjidch	Tuvrwjltww	Jxedsjidch Tuvrwjltww	J.Tuvrwjltww@example.com	\N	userPassword	\N	\N	\N	\N	\N	\N			\N	en	\N	\N
D.Zm@example.com	Opvhfgtd	Dl	Zm	Dl Zm	D.Zm@example.com	\N	oauth2	\N	\N	\N	\N	\N	\N			\N	en	\N	\N
\.


--
-- Data for Name: act_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY act_permissions (id, uid, bprocess, front_elem_id, space_elem_id) FROM stdin;
\.


--
-- Name: act_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('act_permissions_id_seq', 1, false);


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

COPY bploggers (id, process_id, proc_element_id, space_element_id, "order", space_id, station_id, invoked, expanded, container, date, comps, step) FROM stdin;
48	22	119	\N	1	\N	14	t	f	f	2014-12-28 12:27:28.96+06	{"(,,,,f,f)"}	1
49	22	120	\N	2	\N	14	t	f	f	2014-12-28 12:27:28.962+06	{"(,,,,f,f)"}	2
50	24	152	\N	1	\N	92	t	f	f	2015-04-11 02:27:15.528+06	\N	1
51	24	152	\N	1	\N	92	t	f	f	2015-04-11 02:27:15.532+06	\N	2
52	24	152	\N	1	\N	92	t	f	f	2015-04-11 02:27:15.534+06	\N	3
53	24	152	\N	1	\N	92	t	f	f	2015-04-11 02:27:15.535+06	\N	4
54	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.828+06	\N	1
55	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.831+06	\N	2
56	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.833+06	\N	3
57	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.836+06	\N	4
58	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.837+06	\N	5
59	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.838+06	\N	6
60	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.839+06	\N	7
61	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.84+06	\N	8
62	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.841+06	\N	9
63	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.842+06	\N	10
64	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.843+06	\N	11
65	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.847+06	\N	12
66	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.85+06	\N	13
67	24	152	\N	1	\N	93	t	f	f	2015-04-11 02:29:50.851+06	\N	14
68	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.644+06	\N	1
69	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.647+06	\N	2
70	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.648+06	\N	3
71	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.651+06	\N	4
72	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.655+06	\N	5
73	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.656+06	\N	6
74	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.658+06	\N	7
75	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.661+06	\N	8
76	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.667+06	\N	9
77	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.671+06	\N	10
78	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.673+06	\N	11
79	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.716+06	\N	12
80	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.72+06	\N	13
81	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.722+06	\N	14
82	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.724+06	\N	15
83	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.726+06	\N	16
84	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.73+06	\N	17
85	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.738+06	\N	18
86	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.74+06	\N	19
87	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.745+06	\N	20
88	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.746+06	\N	21
89	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.747+06	\N	22
90	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.748+06	\N	23
91	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.749+06	\N	24
92	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.753+06	\N	25
93	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.757+06	\N	26
94	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.76+06	\N	27
95	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.762+06	\N	28
96	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.767+06	\N	29
97	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.768+06	\N	30
98	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.77+06	\N	31
99	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.788+06	\N	32
100	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.793+06	\N	33
101	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.795+06	\N	34
102	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.797+06	\N	35
103	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.8+06	\N	36
104	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.801+06	\N	37
105	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.803+06	\N	38
106	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.817+06	\N	39
107	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.818+06	\N	40
108	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.82+06	\N	41
109	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.823+06	\N	42
110	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.826+06	\N	43
111	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.83+06	\N	44
112	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.834+06	\N	45
113	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.838+06	\N	46
114	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.842+06	\N	47
115	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.876+06	\N	48
116	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.879+06	\N	49
117	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.883+06	\N	50
118	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.889+06	\N	51
119	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.891+06	\N	52
120	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.894+06	\N	53
121	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.896+06	\N	54
122	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.901+06	\N	55
123	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.903+06	\N	56
124	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.909+06	\N	57
125	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.913+06	\N	58
126	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.923+06	\N	59
127	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.926+06	\N	60
128	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.966+06	\N	61
129	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.973+06	\N	62
130	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.976+06	\N	63
131	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.981+06	\N	64
132	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.985+06	\N	65
133	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.986+06	\N	66
134	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.991+06	\N	67
135	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:38.995+06	\N	68
136	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39+06	\N	69
137	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.004+06	\N	70
138	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.006+06	\N	71
139	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.044+06	\N	72
140	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.049+06	\N	73
141	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.052+06	\N	74
142	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.053+06	\N	75
143	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.055+06	\N	76
144	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.057+06	\N	77
145	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.059+06	\N	78
146	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.061+06	\N	79
147	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.064+06	\N	80
148	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.066+06	\N	81
149	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.068+06	\N	82
150	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.083+06	\N	83
151	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.085+06	\N	84
152	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.09+06	\N	85
153	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.092+06	\N	86
154	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.095+06	\N	87
155	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.097+06	\N	88
156	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.1+06	\N	89
157	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.103+06	\N	90
158	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.106+06	\N	91
159	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.108+06	\N	92
160	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.113+06	\N	93
161	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.115+06	\N	94
162	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.118+06	\N	95
163	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.122+06	\N	96
164	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.125+06	\N	97
165	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.128+06	\N	98
166	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.131+06	\N	99
167	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.15+06	\N	100
168	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.153+06	\N	101
169	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.155+06	\N	102
170	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.157+06	\N	103
171	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.161+06	\N	104
172	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.164+06	\N	105
173	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.167+06	\N	106
174	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.169+06	\N	107
175	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.175+06	\N	108
176	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.177+06	\N	109
177	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.179+06	\N	110
178	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.245+06	\N	111
179	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.25+06	\N	112
180	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.253+06	\N	113
181	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.256+06	\N	114
182	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.262+06	\N	115
183	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.266+06	\N	116
184	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.269+06	\N	117
185	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.284+06	\N	118
186	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.287+06	\N	119
187	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.291+06	\N	120
188	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.294+06	\N	121
189	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.297+06	\N	122
190	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.3+06	\N	123
191	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.321+06	\N	124
192	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.325+06	\N	125
193	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.328+06	\N	126
194	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.333+06	\N	127
195	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.337+06	\N	128
196	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.342+06	\N	129
197	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.345+06	\N	130
198	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.347+06	\N	131
199	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.35+06	\N	132
200	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.352+06	\N	133
201	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.354+06	\N	134
202	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.358+06	\N	135
203	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.365+06	\N	136
204	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.368+06	\N	137
205	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.372+06	\N	138
206	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.375+06	\N	139
207	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.386+06	\N	140
208	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.389+06	\N	141
209	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.393+06	\N	142
210	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.397+06	\N	143
211	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.4+06	\N	144
212	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.403+06	\N	145
213	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.408+06	\N	146
214	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.411+06	\N	147
215	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.414+06	\N	148
216	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.416+06	\N	149
217	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.419+06	\N	150
218	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.422+06	\N	151
219	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.424+06	\N	152
220	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.427+06	\N	153
221	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.43+06	\N	154
222	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.432+06	\N	155
223	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.451+06	\N	156
224	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.455+06	\N	157
225	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.459+06	\N	158
226	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.462+06	\N	159
227	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.466+06	\N	160
228	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.474+06	\N	161
229	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.478+06	\N	162
230	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.482+06	\N	163
231	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.486+06	\N	164
232	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.49+06	\N	165
233	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.494+06	\N	166
234	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.525+06	\N	167
235	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.533+06	\N	168
236	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.541+06	\N	169
237	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.55+06	\N	170
238	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.557+06	\N	171
239	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.561+06	\N	172
240	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.565+06	\N	173
241	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.571+06	\N	174
242	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.58+06	\N	175
243	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.594+06	\N	176
244	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.611+06	\N	177
245	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.613+06	\N	178
246	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.618+06	\N	179
247	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.625+06	\N	180
248	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.629+06	\N	181
249	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.633+06	\N	182
250	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.637+06	\N	183
251	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.641+06	\N	184
252	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.644+06	\N	185
253	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.647+06	\N	186
254	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.665+06	\N	187
255	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.673+06	\N	188
256	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.682+06	\N	189
257	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.69+06	\N	190
258	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.698+06	\N	191
259	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.707+06	\N	192
260	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.711+06	\N	193
261	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.715+06	\N	194
262	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.719+06	\N	195
263	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.724+06	\N	196
264	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.728+06	\N	197
265	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.733+06	\N	198
266	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.738+06	\N	199
267	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.742+06	\N	200
268	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.746+06	\N	201
269	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.754+06	\N	202
270	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.759+06	\N	203
271	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.763+06	\N	204
272	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.767+06	\N	205
273	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.771+06	\N	206
274	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.775+06	\N	207
275	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.78+06	\N	208
276	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.787+06	\N	209
277	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.794+06	\N	210
278	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.801+06	\N	211
279	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.804+06	\N	212
280	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.809+06	\N	213
281	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.813+06	\N	214
282	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.816+06	\N	215
283	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.819+06	\N	216
284	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.823+06	\N	217
285	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.827+06	\N	218
286	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.832+06	\N	219
287	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.837+06	\N	220
288	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.842+06	\N	221
289	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.847+06	\N	222
290	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.852+06	\N	223
291	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.861+06	\N	224
292	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.867+06	\N	225
293	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.875+06	\N	226
294	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.88+06	\N	227
295	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.886+06	\N	228
296	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.891+06	\N	229
297	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.896+06	\N	230
298	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.901+06	\N	231
299	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.906+06	\N	232
300	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.909+06	\N	233
301	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.914+06	\N	234
302	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.918+06	\N	235
303	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.936+06	\N	236
304	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.946+06	\N	237
305	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.956+06	\N	238
306	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.965+06	\N	239
307	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.975+06	\N	240
308	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:39.985+06	\N	241
309	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.012+06	\N	242
310	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.021+06	\N	243
311	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.031+06	\N	244
312	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.035+06	\N	245
313	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.039+06	\N	246
314	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.043+06	\N	247
315	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.047+06	\N	248
316	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.072+06	\N	249
317	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.082+06	\N	250
318	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.091+06	\N	251
319	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.1+06	\N	252
320	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.11+06	\N	253
321	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.121+06	\N	254
322	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.145+06	\N	255
323	24	152	\N	1	\N	94	t	f	f	2015-04-11 02:31:40.151+06	\N	256
324	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.025+06	\N	1
325	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.026+06	\N	2
326	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.027+06	\N	3
327	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.028+06	\N	4
328	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.03+06	\N	5
329	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.031+06	\N	6
330	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.032+06	\N	7
331	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.033+06	\N	8
332	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.07+06	\N	9
333	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.072+06	\N	10
334	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.073+06	\N	11
335	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.074+06	\N	12
336	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.076+06	\N	13
337	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.077+06	\N	14
338	24	152	\N	1	\N	95	t	f	f	2015-04-11 02:33:36.078+06	\N	15
339	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.103+06	\N	1
340	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.107+06	\N	2
341	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.109+06	\N	3
342	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.11+06	\N	4
343	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.111+06	\N	5
344	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.112+06	\N	6
345	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.113+06	\N	7
346	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.115+06	\N	8
347	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.116+06	\N	9
348	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.117+06	\N	10
349	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.132+06	\N	11
350	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.133+06	\N	12
351	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.134+06	\N	13
352	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.136+06	\N	14
353	24	152	\N	1	\N	96	t	f	f	2015-04-11 02:35:23.137+06	\N	15
354	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.878+06	\N	1
355	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.88+06	\N	2
356	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.881+06	\N	3
357	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.882+06	\N	4
358	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.884+06	\N	5
359	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.885+06	\N	6
360	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.886+06	\N	7
361	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.887+06	\N	8
362	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.925+06	\N	9
363	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.928+06	\N	10
364	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.931+06	\N	11
365	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.933+06	\N	12
366	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.935+06	\N	13
367	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.936+06	\N	14
368	24	152	\N	1	\N	97	t	f	f	2015-04-11 02:40:40.937+06	\N	15
369	24	152	\N	1	\N	99	t	f	f	2015-04-11 02:48:36.951+06	\N	1
370	24	153	\N	2	\N	99	t	f	f	2015-04-11 02:48:36.953+06	\N	2
371	24	154	\N	3	\N	99	t	f	f	2015-04-11 02:48:36.955+06	\N	3
372	24	156	\N	4	\N	99	t	f	f	2015-04-11 02:48:36.956+06	\N	4
373	24	152	\N	1	\N	100	t	f	f	2015-04-11 02:53:47.861+06	\N	1
374	24	153	\N	2	\N	100	t	f	f	2015-04-11 02:53:47.867+06	\N	2
375	24	154	\N	3	\N	100	t	f	f	2015-04-11 02:53:47.879+06	\N	3
376	24	156	\N	4	\N	100	t	f	f	2015-04-11 02:53:47.881+06	\N	4
377	24	152	\N	1	\N	101	t	f	f	2015-04-12 08:59:11.56+06	\N	1
378	24	153	\N	2	\N	101	t	f	f	2015-04-12 08:59:11.564+06	\N	2
379	24	154	\N	3	\N	101	t	f	f	2015-04-12 08:59:11.566+06	\N	3
380	24	156	\N	4	\N	101	t	f	f	2015-04-12 08:59:11.568+06	\N	4
381	24	152	\N	1	\N	102	t	f	f	2015-04-13 18:25:48.321+06	\N	1
382	24	153	\N	2	\N	102	t	f	f	2015-04-13 18:25:48.324+06	\N	2
383	24	154	\N	3	\N	102	t	f	f	2015-04-13 18:25:48.341+06	\N	3
384	24	156	\N	4	\N	102	t	f	f	2015-04-13 18:25:48.343+06	\N	4
385	24	152	\N	1	\N	103	t	f	f	2015-04-15 05:19:25.436+06	\N	1
386	24	153	\N	2	\N	103	t	f	f	2015-04-15 05:19:25.438+06	\N	2
387	24	154	\N	3	\N	103	t	f	f	2015-04-15 05:19:25.439+06	\N	3
388	24	156	\N	4	\N	103	t	f	f	2015-04-15 05:19:25.44+06	\N	4
\.


--
-- Name: bploggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bploggers_id_seq', 388, true);


--
-- Data for Name: bprocesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bprocesses (id, title, service_id, business_id, created_at, updated_at, version, state_machine_type) FROM stdin;
18	Some	12	2	\N	\N	1	base
22	preparing	31	3	\N	\N	1	base
24	Testing positive path	12	2	\N	\N	1	base
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
\.


--
-- Name: bprocesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bprocesses_id_seq', 44, true);


--
-- Data for Name: bpsessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpsessions (id, process_id, created_at, updated_at) FROM stdin;
1	18	2015-03-13 02:16:08.095+06	2015-03-13 02:16:08.095+06
2	18	2015-03-13 02:16:08.095+06	2015-03-13 02:16:08.095+06
16	24	2015-04-15 05:19:21.935+06	2015-04-15 05:19:21.935+06
\.


--
-- Name: bpsessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpsessions_id_seq', 16, true);


--
-- Data for Name: bpspaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpspaces (id, process_id, index, container, subbrick, brick_front_id, brick_nested_id, nesting_level, created_at, updated_at) FROM stdin;
22	18	1	t	f	114	\N	1	\N	\N
24	22	1	t	f	119	\N	1	\N	\N
25	22	2	t	f	121	\N	1	\N	\N
26	24	2	t	f	2	\N	1	\N	\N
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
51	24	2	t	f	2	\N	1	\N	\N
\.


--
-- Name: bpspaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpspaces_id_seq', 57, true);


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

COPY bpstates (id, process_id, title, opposite, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, middle, middleable) FROM stdin;
10	24	started	unstarted	f	\N	\N	\N	\N	en	51	f	0		f
11	24	confirmed	unconfirmed	f	\N	\N	\N	\N	en	51	f	0		f
12	24	started	unstarted	f	\N	31	\N	\N	en	\N	f	0		f
13	24	confirmed	unconfirmed	f	\N	31	\N	\N	en	\N	f	0		f
14	24	invoked	uninvoced	f	152	\N	\N	\N	en	\N	f	0		f
15	24	invoked	uninvoced	f	153	\N	\N	\N	en	\N	f	0		f
16	24	invoked	uninvoked	f	154	\N	\N	\N	en	\N	f	0		f
18	24	invoked	uninvoked	f	156	\N	\N	\N	en	\N	f	0		f
19	24	initiated	uninitiated	t	\N	\N	2015-04-09 06:24:11.07+06	2015-04-09 06:24:11.171+06	en	\N	f	0		f
20	24	invoking	paused	t	\N	\N	2015-04-09 06:24:11.172+06	2015-04-09 06:24:11.172+06	en	\N	f	0		f
21	24	finished	unfinished	t	\N	\N	2015-04-09 06:24:11.172+06	2015-04-09 06:24:11.172+06	en	\N	f	0		f
22	18	initiated	uninitiated	t	\N	\N	2015-04-09 06:24:57.118+06	2015-04-09 06:24:57.118+06	en	\N	f	0		f
23	18	invoking	paused	t	\N	\N	2015-04-09 06:24:57.118+06	2015-04-09 06:24:57.118+06	en	\N	f	0		f
24	18	finished	unfinished	t	\N	\N	2015-04-09 06:24:57.118+06	2015-04-09 06:24:57.118+06	en	\N	f	0		f
31	22	initiated	uninitiated	t	\N	\N	2015-04-09 06:24:58.477+06	2015-04-09 06:24:58.478+06	en	\N	f	0		f
32	22	invoking	paused	t	\N	\N	2015-04-09 06:24:58.478+06	2015-04-09 06:24:58.478+06	en	\N	f	0		f
33	22	finished	unfinished	t	\N	\N	2015-04-09 06:24:58.478+06	2015-04-09 06:24:58.478+06	en	\N	f	0		f
37	25	initiated	uninitiated	t	\N	\N	2015-04-09 06:24:59.525+06	2015-04-09 06:24:59.525+06	en	\N	f	0		f
38	25	invoking	paused	t	\N	\N	2015-04-09 06:24:59.525+06	2015-04-09 06:24:59.525+06	en	\N	f	0		f
39	25	finished	unfinished	t	\N	\N	2015-04-09 06:24:59.525+06	2015-04-09 06:24:59.525+06	en	\N	f	0		f
40	26	initiated	uninitiated	t	\N	\N	2015-04-09 06:24:59.845+06	2015-04-09 06:24:59.845+06	en	\N	f	0		f
41	26	invoking	paused	t	\N	\N	2015-04-09 06:24:59.845+06	2015-04-09 06:24:59.845+06	en	\N	f	0		f
42	26	finished	unfinished	t	\N	\N	2015-04-09 06:24:59.845+06	2015-04-09 06:24:59.845+06	en	\N	f	0		f
43	27	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:00.226+06	2015-04-09 06:25:00.226+06	en	\N	f	0		f
44	27	invoking	paused	t	\N	\N	2015-04-09 06:25:00.226+06	2015-04-09 06:25:00.226+06	en	\N	f	0		f
45	27	finished	unfinished	t	\N	\N	2015-04-09 06:25:00.226+06	2015-04-09 06:25:00.226+06	en	\N	f	0		f
46	28	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:00.658+06	2015-04-09 06:25:00.658+06	en	\N	f	0		f
47	28	invoking	paused	t	\N	\N	2015-04-09 06:25:00.658+06	2015-04-09 06:25:00.658+06	en	\N	f	0		f
48	28	finished	unfinished	t	\N	\N	2015-04-09 06:25:00.658+06	2015-04-09 06:25:00.658+06	en	\N	f	0		f
49	29	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:01.082+06	2015-04-09 06:25:01.082+06	en	\N	f	0		f
50	29	invoking	paused	t	\N	\N	2015-04-09 06:25:01.083+06	2015-04-09 06:25:01.083+06	en	\N	f	0		f
51	29	finished	unfinished	t	\N	\N	2015-04-09 06:25:01.083+06	2015-04-09 06:25:01.083+06	en	\N	f	0		f
52	30	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:01.441+06	2015-04-09 06:25:01.441+06	en	\N	f	0		f
53	30	invoking	paused	t	\N	\N	2015-04-09 06:25:01.441+06	2015-04-09 06:25:01.441+06	en	\N	f	0		f
54	30	finished	unfinished	t	\N	\N	2015-04-09 06:25:01.441+06	2015-04-09 06:25:01.441+06	en	\N	f	0		f
55	31	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:01.724+06	2015-04-09 06:25:01.724+06	en	\N	f	0		f
56	31	invoking	paused	t	\N	\N	2015-04-09 06:25:01.724+06	2015-04-09 06:25:01.724+06	en	\N	f	0		f
57	31	finished	unfinished	t	\N	\N	2015-04-09 06:25:01.724+06	2015-04-09 06:25:01.724+06	en	\N	f	0		f
58	33	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:02.024+06	2015-04-09 06:25:02.024+06	en	\N	f	0		f
59	33	invoking	paused	t	\N	\N	2015-04-09 06:25:02.025+06	2015-04-09 06:25:02.025+06	en	\N	f	0		f
60	33	finished	unfinished	t	\N	\N	2015-04-09 06:25:02.025+06	2015-04-09 06:25:02.025+06	en	\N	f	0		f
61	34	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:02.337+06	2015-04-09 06:25:02.337+06	en	\N	f	0		f
62	34	invoking	paused	t	\N	\N	2015-04-09 06:25:02.337+06	2015-04-09 06:25:02.338+06	en	\N	f	0		f
63	34	finished	unfinished	t	\N	\N	2015-04-09 06:25:02.338+06	2015-04-09 06:25:02.338+06	en	\N	f	0		f
64	35	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:02.593+06	2015-04-09 06:25:02.593+06	en	\N	f	0		f
65	35	invoking	paused	t	\N	\N	2015-04-09 06:25:02.593+06	2015-04-09 06:25:02.593+06	en	\N	f	0		f
66	35	finished	unfinished	t	\N	\N	2015-04-09 06:25:02.593+06	2015-04-09 06:25:02.594+06	en	\N	f	0		f
67	36	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:02.846+06	2015-04-09 06:25:02.846+06	en	\N	f	0		f
68	36	invoking	paused	t	\N	\N	2015-04-09 06:25:02.846+06	2015-04-09 06:25:02.846+06	en	\N	f	0		f
69	36	finished	unfinished	t	\N	\N	2015-04-09 06:25:02.846+06	2015-04-09 06:25:02.847+06	en	\N	f	0		f
70	37	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:03.207+06	2015-04-09 06:25:03.208+06	en	\N	f	0		f
71	37	invoking	paused	t	\N	\N	2015-04-09 06:25:03.208+06	2015-04-09 06:25:03.208+06	en	\N	f	0		f
72	37	finished	unfinished	t	\N	\N	2015-04-09 06:25:03.208+06	2015-04-09 06:25:03.208+06	en	\N	f	0		f
73	38	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:03.472+06	2015-04-09 06:25:03.472+06	en	\N	f	0		f
74	38	invoking	paused	t	\N	\N	2015-04-09 06:25:03.472+06	2015-04-09 06:25:03.472+06	en	\N	f	0		f
75	38	finished	unfinished	t	\N	\N	2015-04-09 06:25:03.472+06	2015-04-09 06:25:03.472+06	en	\N	f	0		f
76	39	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:03.782+06	2015-04-09 06:25:03.782+06	en	\N	f	0		f
77	39	invoking	paused	t	\N	\N	2015-04-09 06:25:03.782+06	2015-04-09 06:25:03.782+06	en	\N	f	0		f
78	39	finished	unfinished	t	\N	\N	2015-04-09 06:25:03.782+06	2015-04-09 06:25:03.782+06	en	\N	f	0		f
79	40	initiated	uninitiated	t	\N	\N	2015-04-09 06:25:04.041+06	2015-04-09 06:25:04.041+06	en	\N	f	0		f
80	40	invoking	paused	t	\N	\N	2015-04-09 06:25:04.041+06	2015-04-09 06:25:04.041+06	en	\N	f	0		f
81	40	finished	unfinished	t	\N	\N	2015-04-09 06:25:04.041+06	2015-04-09 06:25:04.041+06	en	\N	f	0		f
\.


--
-- Name: bpstates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpstates_id_seq', 81, true);


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
\.


--
-- Name: bpstation_loggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpstation_loggers_id_seq', 1035, true);


--
-- Data for Name: bpstations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpstations (id, process_id, state, step, space, container_step, expand_step, spaces_ids, started, finished, inspace, incontainer, inexpands, paused, note, created_at, updated_at, canceled, session_id, front) FROM stdin;
1	5	f	0	0	{}	{}	{}	t	t	f	f	f	f	Station's note	\N	\N	f	1	t
5	1	t	1	0	{}	{}	{}	t	f	f	f	f	t	Station's note	\N	\N	f	1	t
7	21	f	1	0	{}	{}	{}	t	t	f	f	f	f		\N	\N	f	1	t
14	22	f	1	0	{}	{}	{}	t	t	f	f	f	f	Station's note	\N	\N	f	1	t
15	18	t	1	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
16	22	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
17	22	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
18	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
19	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
20	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
21	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
22	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
24	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
25	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
26	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
27	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
28	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
29	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
30	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
31	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
32	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
33	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
34	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
35	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
36	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
37	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
38	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
39	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
40	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
41	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
42	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
43	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
44	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
45	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
46	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
47	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
48	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
49	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
50	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
51	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
52	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
53	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
54	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
55	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
56	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
57	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
58	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
59	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
60	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
61	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
23	24	t	2222	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
62	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
63	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
64	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
65	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
66	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
67	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
68	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
69	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
70	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
71	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
72	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
73	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
74	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
75	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
76	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
77	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
78	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
79	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
80	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
81	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
82	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
83	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
84	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
85	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
86	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
87	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
88	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
89	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	1	t
90	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	3	t
91	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	4	t
92	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	5	t
93	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	6	t
94	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	7	t
95	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	8	t
96	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	9	t
97	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	10	t
98	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	11	t
99	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	12	t
100	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	13	t
101	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	14	t
102	24	t	0	0	{}	{}	{}	f	f	f	f	f	f	Station's note	\N	\N	f	15	t
103	24	t	1	0	{}	{}	{}	t	f	f	f	f	t	Station's note	\N	\N	f	16	t
\.


--
-- Name: bpstations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpstations_id_seq', 103, true);


--
-- Data for Name: bpswitchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bpswitchers (id, bprocess_id, switch_type, priority, state_id, session_state, fn, target, created_at, updated_at, override_group) FROM stdin;
4	24	n	2	14	\N	inc	step	\N	\N	0
5	24	n	2	15	\N	inc	step	\N	\N	0
6	24	n	2	16	\N	inc	step	\N	\N	0
8	24	n	2	18	\N	inc	step	\N	\N	0
\.


--
-- Name: bpswitchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bpswitchers_id_seq', 8, true);


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

COPY businesses (id, title, phone, website, country, city, address, walkthrough, created_at, updated_at) FROM stdin;
1	default business	\N	\N			\N	f	\N	\N
3	Empire	7002858852	haha.co	Espano	Huhuiawei	Elm st. 19	t	\N	\N
2	Empire InCloud	+79090860451	\N	Россия	Saint-Petersburg	Komsomolsky prospekt 1	t	\N	\N
\.


--
-- Name: businesses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('businesses_id_seq', 3, true);


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
16	24	\N	31		\N	\N	\N
17	24	152	\N		\N	\N	\N
18	24	153	\N		\N	\N	\N
19	24	154	\N		\N	\N	\N
21	24	156	\N		\N	\N	\N
\.


--
-- Name: elem_topologs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('elem_topologs_id_seq', 27, true);


--
-- Data for Name: employees; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employees (id, uid, master_acc, "position", manager) FROM stdin;
1	iamjacke@gmail.com	iamjacke@gmail.com	\N	t
2	juices.woo@gmail.com	juices.woo@gmail.com	\N	t
\.


--
-- Data for Name: employees_businesses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY employees_businesses (employee_id, business_id) FROM stdin;
1	2
2	3
\.


--
-- Name: employees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('employees_id_seq', 3, true);


--
-- Data for Name: input_loggers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY input_loggers (id, uid, action, arguments, front_elem_id, space_elem_id, date, station_id) FROM stdin;
\.


--
-- Name: input_loggers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('input_loggers_id_seq', 11, true);


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
\.


--
-- Name: proc_element_reflections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proc_element_reflections_id_seq', 1, true);


--
-- Data for Name: proc_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY proc_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, space_id, "order", comps, created_at, updated_at) FROM stdin;
114	афыа	афыаф	2	18	brick	container_brick	\N	1	{"(,,,,f,f)"}	\N	\N
119	1	1	3	22	brick	container_brick	\N	1	{"(,,,,f,f)"}	\N	\N
120	2	2	3	22	block	confirm	\N	2	{"(,,,,f,f)"}	\N	\N
121	3	3	3	22	brick	container_brick	\N	3	{"(,,,,f,f)"}	\N	\N
122	4	4	3	22	block	confirm	\N	4	{"(,,,,f,f)"}	\N	\N
123	5	5	3	22	block	confirm	\N	5	{"(,,,,f,f)"}	\N	\N
124	cf	cf	2	18	block	confirm	\N	2	{"(,,,,f,f)"}	\N	\N
131	test		1	25	brick	container_brick	\N	1	{}	\N	\N
132	test		1	26	brick	container_brick	\N	1	{}	\N	\N
133	test		1	27	brick	container_brick	\N	1	{}	\N	\N
134	test		1	28	brick	container_brick	\N	1	{}	\N	\N
135	test		1	29	brick	container_brick	\N	1	{}	\N	\N
136	test		1	30	brick	container_brick	\N	1	{}	\N	\N
137	test		1	33	brick	container_brick	\N	1	{}	\N	\N
138	test		1	34	brick	container_brick	\N	1	{}	\N	\N
139	test		1	35	brick	container_brick	\N	1	{}	\N	\N
140	test		1	36	brick	container_brick	\N	1	{}	\N	\N
141	test		1	37	brick	container_brick	\N	1	{}	\N	\N
142	test		1	38	brick	container_brick	\N	1	{}	\N	\N
143	test		1	38	brick	container_brick	\N	2	{}	\N	\N
144	test		1	38	brick	container_brick	\N	3	{}	\N	\N
145	test		1	39	brick	container_brick	\N	1	{}	\N	\N
146	test		1	40	brick	container_brick	\N	1	{}	\N	\N
147	test		1	39	brick	container_brick	\N	2	{}	\N	\N
148	test		1	39	brick	container_brick	\N	3	{}	\N	\N
152	posis		2	24	block	positive	\N	1	{}	\N	\N
153	posis #2		2	24	block	positive	\N	2	{}	\N	\N
154	posis #3		2	24	block	positive	\N	3	{}	\N	\N
156	posis #4		2	24	block	positive	\N	4	{}	\N	\N
\.


--
-- Name: proc_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('proc_elements_id_seq', 159, true);


--
-- Data for Name: process_histories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY process_histories (id, master_acc, process_id, action, date, what) FROM stdin;
\.


--
-- Name: process_histories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('process_histories_id_seq', 1, false);


--
-- Data for Name: reaction_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reaction_refs (id, reflection_id, autostart, element_id, state_ref_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reaction_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reaction_refs_id_seq', 1, false);


--
-- Data for Name: reaction_state_out_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reaction_state_out_refs (id, reaction_id, state_ref, "on", on_rate, created_at, updated_at) FROM stdin;
\.


--
-- Name: reaction_state_out_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reaction_state_out_refs_id_seq', 1, false);


--
-- Data for Name: reaction_state_outs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reaction_state_outs (id, reaction_id, state_id, "on", on_rate, created_at, updated_at) FROM stdin;
\.


--
-- Name: reaction_state_outs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reaction_state_outs_id_seq', 1, false);


--
-- Data for Name: reactions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reactions (id, bprocess_id, autostart, element_id, state_ref_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: reactions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reactions_id_seq', 1, false);


--
-- Data for Name: reflected_elem_topologs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reflected_elem_topologs (id, reflection_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
1	1	1	\N		\N	\N	\N
2	1	2	\N	 	\N	\N	\N
3	1	\N	1	 	\N	\N	\N
4	5	6	\N	 	\N	\N	\N
5	4	5	\N	 	\N	\N	\N
\.


--
-- Name: reflected_elem_topologs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reflected_elem_topologs_id_seq', 1, true);


--
-- Data for Name: refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY refs (id, title, host, created_at, updated_at, "desc", category) FROM stdin;
2	Confirm	base.minorityapp.com	\N	\N	Some desc	Confirmation
3	Confirm with cancelation	base.minorityapp.com	\N	\N	Some desc	Confirmation
4	Container	base.minorityapp.com	\N	\N	Some desc	Base
1	Test	base.minorityapp.com	\N	\N	Some desc	Base
5	Placeholder	test.minorityapp.com	\N	\N	Some desc	Base
\.


--
-- Name: refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('refs_id_seq', 1, true);


--
-- Data for Name: session_state_logs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY session_state_logs (id, session_id, "on", on_rate, reason, created_at, updated_at, state_id) FROM stdin;
22	16	t	100	flow	2015-04-15 05:19:25.158+06	2015-04-15 05:19:25.159+06	77
23	16	t	100	flow	2015-04-15 05:19:25.159+06	2015-04-15 05:19:25.159+06	78
24	16	t	100	flow	2015-04-15 05:19:25.436+06	2015-04-15 05:19:25.436+06	73
25	16	t	100	flow	2015-04-15 05:19:25.438+06	2015-04-15 05:19:25.438+06	74
26	16	t	100	flow	2015-04-15 05:19:25.439+06	2015-04-15 05:19:25.439+06	75
27	16	t	100	flow	2015-04-15 05:19:25.44+06	2015-04-15 05:19:25.44+06	76
28	16	t	100	flow	2015-04-15 05:19:25.44+06	2015-04-15 05:19:25.44+06	79
\.


--
-- Name: session_state_logs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('session_state_logs_id_seq', 28, true);


--
-- Data for Name: sessionstates; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sessionstates (id, process_id, session_id, title, opposite, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, origin_state_id, middle, middleable) FROM stdin;
9	24	1	invoked	uninvoked	f	154	\N	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	\N	f	100	16		f
10	24	1	invoked	uninvoked	f	156	\N	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	\N	t	100	18		f
11	24	1	initiated	uninitiated	t	\N	\N	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	\N	t	100	19		f
12	24	1	invoking	paused	t	\N	\N	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	\N	f	100	20		f
13	24	1	finished	unfinished	t	\N	\N	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	\N	t	100	21		f
75	24	16	invoked	uninvoked	f	154	\N	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	\N	t	80	16	invoking	t
76	24	16	invoked	uninvoked	f	156	\N	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	\N	f	0	18	invoking	f
77	24	16	initiated	uninitiated	t	\N	\N	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	\N	f	0	19	invoking	f
74	24	16	invoked	uninvoced	f	153	\N	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	\N	f	100	15	invoking	f
73	24	16	invoked	uninvoced	f	152	\N	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	\N	t	100	14	invoking	f
72	24	16	confirmed	unconfirmed	f	\N	31	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	\N	t	100	13	invoking	f
71	24	16	started	unstarted	f	\N	31	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	\N	t	100	12	invoking	f
70	24	16	confirmed	unconfirmed	f	\N	\N	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	51	t	100	11	invoking	f
69	24	16	started	unstarted	f	\N	\N	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	51	t	100	10	invoking	f
4	24	1	confirmed	unconfirmed	f	\N	\N	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	51	t	100	11		f
5	24	1	started	unstarted	f	\N	31	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	\N	t	100	12		f
6	24	1	confirmed	unconfirmed	f	\N	31	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	\N	t	100	13		f
7	24	1	invoked	uninvoced	f	152	\N	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	\N	t	100	14		f
8	24	1	invoked	uninvoced	f	153	\N	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	\N	t	100	15		f
3	24	1	started	unstarted	f	\N	\N	2015-04-10 06:53:31.319+06	2015-04-10 06:53:31.319+06	en	51	t	100	10		f
78	24	16	invoking	paused	t	\N	\N	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	\N	f	0	20	invoking	f
79	24	16	finished	unfinished	t	\N	\N	2015-04-15 05:19:22.655+06	2015-04-15 05:19:22.655+06	en	\N	f	0	21	invoking	f
\.


--
-- Name: sessionstates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sessionstates_id_seq', 79, true);


--
-- Data for Name: space_element_reflections; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY space_element_reflections (id, reflection_id, title, "desc", b_type, type_title, ref_space_id, ref_space_owned_id, space_role, "order", created_at, updated_at) FROM stdin;
1	1	Space elem	 	block	confirm	\N	1	container	1	\N	\N
\.


--
-- Name: space_element_reflections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('space_element_reflections_id_seq', 1, false);


--
-- Data for Name: space_elements; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY space_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, own_space_id, owned_space_id, space_role, "order", comps, created_at, updated_at) FROM stdin;
24	Обрезал	Обрезал головку	2	18	block	confirm	\N	22	container	1	{"(,,,,f,f)"}	\N	\N
25	Space elem	 	2	24	block	confirm	\N	26	container	1	\N	\N	\N
26	test		1	39	brick	container_brick	\N	41	\N	1	{}	\N	\N
27	test		1	40	brick	container_brick	\N	43	\N	1	{}	\N	\N
28	test		1	39	brick	container_brick	\N	45	\N	1	{}	\N	\N
29	test		1	39	brick	container_brick	\N	47	\N	1	{}	\N	\N
31	Space elem	 	2	24	block	confirm	\N	51	container	1	\N	\N	\N
\.


--
-- Name: space_elements_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('space_elements_id_seq', 34, true);


--
-- Data for Name: space_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY space_refs (id, reflection_id, index, container, subbrick, brick_front, brick_nested, "nestingLevel", created_at, updated_at) FROM stdin;
1	1	1	t	f	2	\N	1	\N	\N
2	4	1	t	f	5	\N	1	\N	\N
\.


--
-- Name: space_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('space_refs_id_seq', 1, false);


--
-- Data for Name: state_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY state_refs (id, reflection_id, title, opposite, process_state, "on", on_rate, ref_front_elem_id, ref_space_elem_id, created_at, updated_at, lang, ref_space_id, middle, middleable) FROM stdin;
1	1	started	unstarted	f	f	0	1	\N	\N	\N	en	\N		f
2	1	finished	not_finished	f	f	0	1	\N	\N	\N	en	\N		f
3	1	confirmed	unconfirmed	f	f	0	1	\N	\N	\N	en	\N		f
4	1	started	unstarted	f	f	0	2	\N	\N	\N	en	\N		f
5	1	started	unstarted	f	f	0	\N	1	\N	\N	en	\N		f
6	1	confirmed	unconfirmed	f	f	0	\N	1	\N	\N	en	\N		f
7	1	finished	not_finished	f	f	0	2	\N	\N	\N	en	\N		f
8	5	invoked	uninvoked	f	f	0	6	\N	\N	\N	en	\N		f
\.


--
-- Name: state_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('state_refs_id_seq', 3, true);


--
-- Data for Name: switcher_refs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY switcher_refs (id, reflection_id, switch_type, priority, state_ref_id, fn, target, created_at, updated_at, override_group) FROM stdin;
1	5	n	2	8	inc	step	\N	\N	0
\.


--
-- Name: switcher_refs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('switcher_refs_id_seq', 1, false);


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tokens (uuid, email, "creationTime", "expirationTime", "isSignUp") FROM stdin;
\.


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
-- Name: act_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY act_permissions
    ADD CONSTRAINT act_permissions_pkey PRIMARY KEY (id);


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
-- Name: fElemFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT "fElemFK" FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


--
-- Name: fElemPermFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY act_permissions
    ADD CONSTRAINT "fElemPermFK" FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;


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
-- Name: spElemFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT "spElemFK" FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;


--
-- Name: spElemPermFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY act_permissions
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
-- Name: statFK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT "statFK" FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;


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
    ADD CONSTRAINT state_fk FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;


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


