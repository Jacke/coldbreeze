PGDMP                     
    t         	   minority3    9.4.8    9.4.8 �   �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           1262    16384 	   minority3    DATABASE     {   CREATE DATABASE minority3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
    DROP DATABASE minority3;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            �           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            �           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    11865    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            �           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    16386    account_group    TABLE     �   CREATE TABLE account_group (
    id integer NOT NULL,
    account_id character varying(254),
    group_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    employee_id bigint NOT NULL
);
 !   DROP TABLE public.account_group;
       public         postgres    false    7            �            1259    16389    account_group_id_seq    SEQUENCE     v   CREATE SEQUENCE account_group_id_seq
    START WITH 9
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_group_id_seq;
       public       postgres    false    173    7            �           0    0    account_group_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE account_group_id_seq OWNED BY account_group.id;
            public       postgres    false    174            �            1259    16391    account_infos    TABLE     �  CREATE TABLE account_infos (
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
 !   DROP TABLE public.account_infos;
       public         postgres    false    7            �            1259    16399    account_infos_id_seq    SEQUENCE     w   CREATE SEQUENCE account_infos_id_seq
    START WITH 16
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_infos_id_seq;
       public       postgres    false    175    7            �           0    0    account_infos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE account_infos_id_seq OWNED BY account_infos.id;
            public       postgres    false    176            �            1259    16401    account_loggers    TABLE     �   CREATE TABLE account_loggers (
    id integer NOT NULL,
    ip character varying(254) NOT NULL,
    user_agent character varying(254) NOT NULL,
    email character varying(254),
    date timestamp(6) with time zone NOT NULL
);
 #   DROP TABLE public.account_loggers;
       public         postgres    false    7            �            1259    16407    account_loggers_id_seq    SEQUENCE     z   CREATE SEQUENCE account_loggers_id_seq
    START WITH 796
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.account_loggers_id_seq;
       public       postgres    false    177    7            �           0    0    account_loggers_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE account_loggers_id_seq OWNED BY account_loggers.id;
            public       postgres    false    178            �            1259    16409    account_plan_history_id_seq    SEQUENCE     }   CREATE SEQUENCE account_plan_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.account_plan_history_id_seq;
       public       postgres    false    7            �            1259    16411    account_plan_history    TABLE     �   CREATE TABLE account_plan_history (
    id integer DEFAULT nextval('account_plan_history_id_seq'::regclass) NOT NULL,
    account_plan_id integer NOT NULL,
    limit_diff integer NOT NULL,
    plan_diff integer NOT NULL,
    bill_id integer NOT NULL
);
 (   DROP TABLE public.account_plan_history;
       public         postgres    false    179    7            �            1259    16415    account_plans    TABLE       CREATE TABLE account_plans (
    id integer NOT NULL,
    business_id integer NOT NULL,
    master_acc character varying(254) NOT NULL,
    plan_id integer NOT NULL,
    expired_at timestamp(6) with time zone NOT NULL,
    active boolean NOT NULL,
    "limit" integer NOT NULL
);
 !   DROP TABLE public.account_plans;
       public         postgres    false    7            �            1259    16418    account_plans_id_seq    SEQUENCE     w   CREATE SEQUENCE account_plans_id_seq
    START WITH 27
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.account_plans_id_seq;
       public       postgres    false    181    7            �           0    0    account_plans_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE account_plans_id_seq OWNED BY account_plans.id;
            public       postgres    false    182            �            1259    16420    accounts    TABLE     �  CREATE TABLE accounts (
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
    DROP TABLE public.accounts;
       public         postgres    false    7            Q           1259    19310    action_act_results    TABLE     *  CREATE TABLE action_act_results (
    id bigint NOT NULL,
    "in" boolean NOT NULL,
    "out" boolean NOT NULL,
    base boolean NOT NULL,
    content character varying NOT NULL,
    act_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 &   DROP TABLE public.action_act_results;
       public         postgres    false    7            P           1259    19308    action_act_results_id_seq    SEQUENCE     {   CREATE SEQUENCE action_act_results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.action_act_results_id_seq;
       public       postgres    false    7    337            �           0    0    action_act_results_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE action_act_results_id_seq OWNED BY action_act_results.id;
            public       postgres    false    336            U           1259    19332    action_acts    TABLE     �   CREATE TABLE action_acts (
    id bigint NOT NULL,
    uid character varying NOT NULL,
    session_id integer NOT NULL,
    reaction integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.action_acts;
       public         postgres    false    7            T           1259    19330    action_acts_id_seq    SEQUENCE     t   CREATE SEQUENCE action_acts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.action_acts_id_seq;
       public       postgres    false    341    7            �           0    0    action_acts_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE action_acts_id_seq OWNED BY action_acts.id;
            public       postgres    false    340            S           1259    19321    action_statuses    TABLE     �   CREATE TABLE action_statuses (
    id bigint NOT NULL,
    content character varying NOT NULL,
    act_id bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 #   DROP TABLE public.action_statuses;
       public         postgres    false    7            R           1259    19319    action_statuses_id_seq    SEQUENCE     x   CREATE SEQUENCE action_statuses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.action_statuses_id_seq;
       public       postgres    false    7    339            �           0    0    action_statuses_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE action_statuses_id_seq OWNED BY action_statuses.id;
            public       postgres    false    338            �            1259    16426    billing_infos    TABLE     {  CREATE TABLE billing_infos (
    id integer NOT NULL,
    business_id integer NOT NULL,
    firstname character varying(254) NOT NULL,
    lastname character varying(254) NOT NULL,
    address character varying(254) NOT NULL,
    zipcode character varying(254) NOT NULL,
    created_at timestamp(6) with time zone NOT NULL,
    updated_at timestamp(6) with time zone NOT NULL
);
 !   DROP TABLE public.billing_infos;
       public         postgres    false    7            �            1259    16432    billing_infos_id_seq    SEQUENCE     v   CREATE SEQUENCE billing_infos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.billing_infos_id_seq;
       public       postgres    false    7    184            �           0    0    billing_infos_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE billing_infos_id_seq OWNED BY billing_infos.id;
            public       postgres    false    185            �            1259    16434    bills    TABLE     Q  CREATE TABLE bills (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    master_acc character varying(254) NOT NULL,
    assigned timestamp(6) with time zone NOT NULL,
    approved boolean NOT NULL,
    expired timestamp(6) with time zone NOT NULL,
    sum numeric(21,2) NOT NULL,
    workbench_id bigint NOT NULL
);
    DROP TABLE public.bills;
       public         postgres    false    7            �            1259    16440    bills_id_seq    SEQUENCE     n   CREATE SEQUENCE bills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.bills_id_seq;
       public       postgres    false    7    186            �           0    0    bills_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE bills_id_seq OWNED BY bills.id;
            public       postgres    false    187            �            1259    16442 	   bploggers    TABLE     �  CREATE TABLE bploggers (
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
    DROP TABLE public.bploggers;
       public         postgres    false    7            �            1259    16445    bploggers_id_seq    SEQUENCE     u   CREATE SEQUENCE bploggers_id_seq
    START WITH 1139
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.bploggers_id_seq;
       public       postgres    false    7    188            �           0    0    bploggers_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE bploggers_id_seq OWNED BY bploggers.id;
            public       postgres    false    189            �            1259    16447 
   bprocesses    TABLE     {  CREATE TABLE bprocesses (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    service_id integer NOT NULL,
    business_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    version bigint DEFAULT 1 NOT NULL,
    state_machine_type character varying(40) DEFAULT 'base'::character varying NOT NULL
);
    DROP TABLE public.bprocesses;
       public         postgres    false    7            �            1259    16452    bprocesses_id_seq    SEQUENCE     t   CREATE SEQUENCE bprocesses_id_seq
    START WITH 71
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bprocesses_id_seq;
       public       postgres    false    190    7            �           0    0    bprocesses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE bprocesses_id_seq OWNED BY bprocesses.id;
            public       postgres    false    191            �            1259    16454 
   bpsessions    TABLE     �   CREATE TABLE bpsessions (
    id integer NOT NULL,
    process_id integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    active_listed boolean DEFAULT false NOT NULL
);
    DROP TABLE public.bpsessions;
       public         postgres    false    7            �            1259    16458    bpsessions_id_seq    SEQUENCE     u   CREATE SEQUENCE bpsessions_id_seq
    START WITH 152
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bpsessions_id_seq;
       public       postgres    false    7    192            �           0    0    bpsessions_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE bpsessions_id_seq OWNED BY bpsessions.id;
            public       postgres    false    193            �            1259    16460    bpspaces    TABLE     �  CREATE TABLE bpspaces (
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
    DROP TABLE public.bpspaces;
       public         postgres    false    7            �            1259    16465    bpspaces_id_seq    SEQUENCE     r   CREATE SEQUENCE bpspaces_id_seq
    START WITH 87
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bpspaces_id_seq;
       public       postgres    false    194    7            �           0    0    bpspaces_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE bpspaces_id_seq OWNED BY bpspaces.id;
            public       postgres    false    195            �            1259    16467    bpstaterefs    TABLE     D  CREATE TABLE bpstaterefs (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    switch_type character varying(254) NOT NULL,
    priority integer DEFAULT 2 NOT NULL,
    state_id integer NOT NULL,
    session_state integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone
);
    DROP TABLE public.bpstaterefs;
       public         postgres    false    7            �            1259    16471    bpstaterefs_id_seq    SEQUENCE     t   CREATE SEQUENCE bpstaterefs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bpstaterefs_id_seq;
       public       postgres    false    7    196            �           0    0    bpstaterefs_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE bpstaterefs_id_seq OWNED BY bpstaterefs.id;
            public       postgres    false    197            �            1259    16473    bpstates    TABLE       CREATE TABLE bpstates (
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
    DROP TABLE public.bpstates;
       public         postgres    false    7            �            1259    16487    bpstates_id_seq    SEQUENCE     s   CREATE SEQUENCE bpstates_id_seq
    START WITH 346
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.bpstates_id_seq;
       public       postgres    false    198    7            �           0    0    bpstates_id_seq    SEQUENCE OWNED BY     5   ALTER SEQUENCE bpstates_id_seq OWNED BY bpstates.id;
            public       postgres    false    199            �            1259    16489    bpstation_loggers    TABLE     T  CREATE TABLE bpstation_loggers (
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
 %   DROP TABLE public.bpstation_loggers;
       public         postgres    false    7            �            1259    16495    bpstation_loggers_id_seq    SEQUENCE     }   CREATE SEQUENCE bpstation_loggers_id_seq
    START WITH 3150
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.bpstation_loggers_id_seq;
       public       postgres    false    7    200            �           0    0    bpstation_loggers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bpstation_loggers_id_seq OWNED BY bpstation_loggers.id;
            public       postgres    false    201            �            1259    16497 
   bpstations    TABLE     �  CREATE TABLE bpstations (
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
    DROP TABLE public.bpstations;
       public         postgres    false    7            �            1259    16504    bpstations_id_seq    SEQUENCE     u   CREATE SEQUENCE bpstations_id_seq
    START WITH 274
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.bpstations_id_seq;
       public       postgres    false    202    7            �           0    0    bpstations_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE bpstations_id_seq OWNED BY bpstations.id;
            public       postgres    false    203            �            1259    16506    bpswitchers    TABLE     �  CREATE TABLE bpswitchers (
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
    DROP TABLE public.bpswitchers;
       public         postgres    false    7            �            1259    16514    bpswitchers_id_seq    SEQUENCE     v   CREATE SEQUENCE bpswitchers_id_seq
    START WITH 190
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.bpswitchers_id_seq;
       public       postgres    false    7    204            �           0    0    bpswitchers_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE bpswitchers_id_seq OWNED BY bpswitchers.id;
            public       postgres    false    205            �            1259    16516    business_services    TABLE     �   CREATE TABLE business_services (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    business_id integer NOT NULL,
    master_acc character varying(254) NOT NULL
);
 %   DROP TABLE public.business_services;
       public         postgres    false    7            �            1259    16522    business_services_id_seq    SEQUENCE     {   CREATE SEQUENCE business_services_id_seq
    START WITH 46
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.business_services_id_seq;
       public       postgres    false    206    7            �           0    0    business_services_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE business_services_id_seq OWNED BY business_services.id;
            public       postgres    false    207            �            1259    16524 
   businesses    TABLE     �  CREATE TABLE businesses (
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
    DROP TABLE public.businesses;
       public         postgres    false    7            �            1259    16531    businesses_id_seq    SEQUENCE     t   CREATE SEQUENCE businesses_id_seq
    START WITH 28
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.businesses_id_seq;
       public       postgres    false    7    208            �           0    0    businesses_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE businesses_id_seq OWNED BY businesses.id;
            public       postgres    false    209            �            1259    16533    cached_removed_resources    TABLE     n  CREATE TABLE cached_removed_resources (
    id integer NOT NULL,
    scope character varying NOT NULL,
    scope_type character varying NOT NULL,
    action character varying NOT NULL,
    what character varying NOT NULL,
    what_id character varying NOT NULL,
    date timestamp(6) without time zone NOT NULL,
    "updatedAttributes" character varying NOT NULL
);
 ,   DROP TABLE public.cached_removed_resources;
       public         postgres    false    7            �            1259    16539    cached_removed_resources_id_seq    SEQUENCE     �   CREATE SEQUENCE cached_removed_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.cached_removed_resources_id_seq;
       public       postgres    false    210    7            �           0    0    cached_removed_resources_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE cached_removed_resources_id_seq OWNED BY cached_removed_resources.id;
            public       postgres    false    211            �            1259    16541    client_observers    TABLE     d   CREATE TABLE client_observers (
    id integer NOT NULL,
    uid character varying(254) NOT NULL
);
 $   DROP TABLE public.client_observers;
       public         postgres    false    7            �            1259    16544    client_observers_id_seq    SEQUENCE     y   CREATE SEQUENCE client_observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.client_observers_id_seq;
       public       postgres    false    212    7            �           0    0    client_observers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE client_observers_id_seq OWNED BY client_observers.id;
            public       postgres    false    213            �            1259    16546    elem_topologs    TABLE     '  CREATE TABLE elem_topologs (
    id integer NOT NULL,
    process_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    space_id integer
);
 !   DROP TABLE public.elem_topologs;
       public         postgres    false    7            �            1259    16549    elem_topologs_id_seq    SEQUENCE     x   CREATE SEQUENCE elem_topologs_id_seq
    START WITH 134
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.elem_topologs_id_seq;
       public       postgres    false    7    214            �           0    0    elem_topologs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE elem_topologs_id_seq OWNED BY elem_topologs.id;
            public       postgres    false    215            �            1259    16551    element_resources    TABLE     9  CREATE TABLE element_resources (
    id integer NOT NULL,
    element_id integer NOT NULL,
    process_id integer NOT NULL,
    resource_id integer NOT NULL,
    entities character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 %   DROP TABLE public.element_resources;
       public         postgres    false    7            �            1259    16558    element_resources_id_seq    SEQUENCE     z   CREATE SEQUENCE element_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.element_resources_id_seq;
       public       postgres    false    216    7            �           0    0    element_resources_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE element_resources_id_seq OWNED BY element_resources.id;
            public       postgres    false    217            �            1259    16560 	   employees    TABLE     �   CREATE TABLE employees (
    id bigint NOT NULL,
    uid character varying(254) NOT NULL,
    master_acc character varying(254) NOT NULL,
    "position" character varying(254),
    manager boolean NOT NULL,
    workbench_id bigint DEFAULT 0 NOT NULL
);
    DROP TABLE public.employees;
       public         postgres    false    7            �            1259    16567    employees_businesses    TABLE     j   CREATE TABLE employees_businesses (
    employee_id integer NOT NULL,
    business_id integer NOT NULL
);
 (   DROP TABLE public.employees_businesses;
       public         postgres    false    7            �            1259    16570    employees_id_seq    SEQUENCE     s   CREATE SEQUENCE employees_id_seq
    START WITH 37
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public       postgres    false    218    7            �           0    0    employees_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE employees_id_seq OWNED BY employees.id;
            public       postgres    false    220            /           1259    19008    files    TABLE     j  CREATE TABLE files (
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
    DROP TABLE public.files;
       public         postgres    false    7            .           1259    19006    files_id_seq    SEQUENCE     n   CREATE SEQUENCE files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.files_id_seq;
       public       postgres    false    303    7            �           0    0    files_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE files_id_seq OWNED BY files.id;
            public       postgres    false    302            �            1259    16572    groups    TABLE     �   CREATE TABLE groups (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    business_id integer NOT NULL
);
    DROP TABLE public.groups;
       public         postgres    false    7            �            1259    16575    groups_id_seq    SEQUENCE     p   CREATE SEQUENCE groups_id_seq
    START WITH 24
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.groups_id_seq;
       public       postgres    false    7    221            �           0    0    groups_id_seq    SEQUENCE OWNED BY     1   ALTER SEQUENCE groups_id_seq OWNED BY groups.id;
            public       postgres    false    222            �            1259    16577    input_id_seq    SEQUENCE     p   CREATE SEQUENCE input_id_seq
    START WITH 264
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.input_id_seq;
       public       postgres    false    7            �            1259    16579    input_loggers    TABLE     �  CREATE TABLE input_loggers (
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
 !   DROP TABLE public.input_loggers;
       public         postgres    false    223    223    7            �            1259    16587    input_loggers_id_seq    SEQUENCE     x   CREATE SEQUENCE input_loggers_id_seq
    START WITH 144
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.input_loggers_id_seq;
       public       postgres    false    224    7            �           0    0    input_loggers_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE input_loggers_id_seq OWNED BY input_loggers.id;
            public       postgres    false    225            �            1259    16589    launch_counters    TABLE     �   CREATE TABLE launch_counters (
    id bigint NOT NULL,
    process_id integer NOT NULL,
    count bigint NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 #   DROP TABLE public.launch_counters;
       public         postgres    false    7            �            1259    16592    launch_counters_id_seq    SEQUENCE     x   CREATE SEQUENCE launch_counters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.launch_counters_id_seq;
       public       postgres    false    7    226            �           0    0    launch_counters_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE launch_counters_id_seq OWNED BY launch_counters.id;
            public       postgres    false    227            1           1259    19019    launch_files    TABLE     �   CREATE TABLE launch_files (
    id bigint NOT NULL,
    file_id bigint NOT NULL,
    launch_id integer NOT NULL,
    element_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
     DROP TABLE public.launch_files;
       public         postgres    false    7            0           1259    19017    launch_files_id_seq    SEQUENCE     u   CREATE SEQUENCE launch_files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.launch_files_id_seq;
       public       postgres    false    7    305            �           0    0    launch_files_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE launch_files_id_seq OWNED BY launch_files.id;
            public       postgres    false    304            G           1259    19202    launch_middlewares    TABLE     q  CREATE TABLE launch_middlewares (
    id bigint NOT NULL,
    session_id integer NOT NULL,
    ident character varying NOT NULL,
    iface_ident character varying NOT NULL,
    reaction_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying(30) DEFAULT ''::character varying NOT NULL
);
 &   DROP TABLE public.launch_middlewares;
       public         postgres    false    7            F           1259    19200    launch_middlewares_id_seq    SEQUENCE     {   CREATE SEQUENCE launch_middlewares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.launch_middlewares_id_seq;
       public       postgres    false    327    7            �           0    0    launch_middlewares_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE launch_middlewares_id_seq OWNED BY launch_middlewares.id;
            public       postgres    false    326            �            1259    16594    launch_shares    TABLE     �   CREATE TABLE launch_shares (
    id bigint NOT NULL,
    title integer NOT NULL,
    price integer NOT NULL,
    description character varying NOT NULL
);
 !   DROP TABLE public.launch_shares;
       public         postgres    false    7            �            1259    16600    launch_shares_id_seq    SEQUENCE     v   CREATE SEQUENCE launch_shares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.launch_shares_id_seq;
       public       postgres    false    228    7            �           0    0    launch_shares_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE launch_shares_id_seq OWNED BY launch_shares.id;
            public       postgres    false    229            I           1259    19223    launch_strategies    TABLE     $  CREATE TABLE launch_strategies (
    id bigint NOT NULL,
    session_id integer NOT NULL,
    ident character varying NOT NULL,
    middleware_id bigint NOT NULL,
    is_null_strategy boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 %   DROP TABLE public.launch_strategies;
       public         postgres    false    7            H           1259    19221    launch_strategies_id_seq    SEQUENCE     z   CREATE SEQUENCE launch_strategies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.launch_strategies_id_seq;
       public       postgres    false    7    329            �           0    0    launch_strategies_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE launch_strategies_id_seq OWNED BY launch_strategies.id;
            public       postgres    false    328            K           1259    19244    launch_strategy_bases    TABLE     �  CREATE TABLE launch_strategy_bases (
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
 )   DROP TABLE public.launch_strategy_bases;
       public         postgres    false    7            J           1259    19242    launch_strategy_bases_id_seq    SEQUENCE     ~   CREATE SEQUENCE launch_strategy_bases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.launch_strategy_bases_id_seq;
       public       postgres    false    7    331            �           0    0    launch_strategy_bases_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE launch_strategy_bases_id_seq OWNED BY launch_strategy_bases.id;
            public       postgres    false    330            M           1259    19260    launch_strategy_inputs    TABLE     r  CREATE TABLE launch_strategy_inputs (
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
 *   DROP TABLE public.launch_strategy_inputs;
       public         postgres    false    7            L           1259    19258    launch_strategy_inputs_id_seq    SEQUENCE        CREATE SEQUENCE launch_strategy_inputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.launch_strategy_inputs_id_seq;
       public       postgres    false    333    7            �           0    0    launch_strategy_inputs_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE launch_strategy_inputs_id_seq OWNED BY launch_strategy_inputs.id;
            public       postgres    false    332            O           1259    19276    launch_strategy_outputs    TABLE     s  CREATE TABLE launch_strategy_outputs (
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
 +   DROP TABLE public.launch_strategy_outputs;
       public         postgres    false    7            N           1259    19274    launch_strategy_outputs_id_seq    SEQUENCE     �   CREATE SEQUENCE launch_strategy_outputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.launch_strategy_outputs_id_seq;
       public       postgres    false    7    335            �           0    0    launch_strategy_outputs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE launch_strategy_outputs_id_seq OWNED BY launch_strategy_outputs.id;
            public       postgres    false    334            �            1259    16602    launch_warps    TABLE     �   CREATE TABLE launch_warps (
    id integer NOT NULL,
    launch_id integer NOT NULL,
    launch_element_id integer,
    board_id character varying NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
     DROP TABLE public.launch_warps;
       public         postgres    false    7            �            1259    16608    launch_warps_id_seq    SEQUENCE     u   CREATE SEQUENCE launch_warps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.launch_warps_id_seq;
       public       postgres    false    230    7            �           0    0    launch_warps_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE launch_warps_id_seq OWNED BY launch_warps.id;
            public       postgres    false    231            �            1259    16610 	   logininfo    TABLE     �   CREATE TABLE logininfo (
    id bigint NOT NULL,
    "providerID" character varying NOT NULL,
    "providerKey" character varying NOT NULL
);
    DROP TABLE public.logininfo;
       public         postgres    false    7            �            1259    16616    logininfo_id_seq    SEQUENCE     r   CREATE SEQUENCE logininfo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.logininfo_id_seq;
       public       postgres    false    232    7            �           0    0    logininfo_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE logininfo_id_seq OWNED BY logininfo.id;
            public       postgres    false    233            5           1259    19048    middleware_refs    TABLE     O  CREATE TABLE middleware_refs (
    id bigint NOT NULL,
    title character varying NOT NULL,
    ident character varying NOT NULL,
    iface_ident character varying NOT NULL,
    reflection_id integer NOT NULL,
    reaction_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 #   DROP TABLE public.middleware_refs;
       public         postgres    false    7            4           1259    19046    middleware_refs_id_seq    SEQUENCE     x   CREATE SEQUENCE middleware_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.middleware_refs_id_seq;
       public       postgres    false    309    7            �           0    0    middleware_refs_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE middleware_refs_id_seq OWNED BY middleware_refs.id;
            public       postgres    false    308            3           1259    19032    middlewares    TABLE     I  CREATE TABLE middlewares (
    id bigint NOT NULL,
    ident character varying NOT NULL,
    iface_ident character varying NOT NULL,
    reaction_id integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    title character varying(30) DEFAULT ''::character varying NOT NULL
);
    DROP TABLE public.middlewares;
       public         postgres    false    7            2           1259    19030    middlewares_id_seq    SEQUENCE     t   CREATE SEQUENCE middlewares_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.middlewares_id_seq;
       public       postgres    false    7    307            �           0    0    middlewares_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE middlewares_id_seq OWNED BY middlewares.id;
            public       postgres    false    306            �            1259    16618 
   oauth1info    TABLE     �   CREATE TABLE oauth1info (
    id bigint NOT NULL,
    token character varying NOT NULL,
    secret character varying NOT NULL,
    "loginInfoId" bigint NOT NULL
);
    DROP TABLE public.oauth1info;
       public         postgres    false    7            �            1259    16624    oauth1info_id_seq    SEQUENCE     s   CREATE SEQUENCE oauth1info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.oauth1info_id_seq;
       public       postgres    false    234    7            �           0    0    oauth1info_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE oauth1info_id_seq OWNED BY oauth1info.id;
            public       postgres    false    235            �            1259    16626 
   oauth2info    TABLE     �   CREATE TABLE oauth2info (
    id bigint NOT NULL,
    accesstoken character varying NOT NULL,
    tokentype character varying,
    expiresin integer,
    refreshtoken character varying,
    logininfoid bigint NOT NULL
);
    DROP TABLE public.oauth2info;
       public         postgres    false    7            �            1259    16632    oauth2info_id_seq    SEQUENCE     s   CREATE SEQUENCE oauth2info_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.oauth2info_id_seq;
       public       postgres    false    236    7            �           0    0    oauth2info_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE oauth2info_id_seq OWNED BY oauth2info.id;
            public       postgres    false    237            �            1259    16634 	   observers    TABLE     �   CREATE TABLE observers (
    id integer NOT NULL,
    station_id integer NOT NULL,
    bprocess_id integer NOT NULL,
    hash_code character varying(254),
    "fullName" character varying(254) NOT NULL,
    created_at timestamp(6) with time zone
);
    DROP TABLE public.observers;
       public         postgres    false    7            �            1259    16640    observers_id_seq    SEQUENCE     r   CREATE SEQUENCE observers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.observers_id_seq;
       public       postgres    false    7    238            �           0    0    observers_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE observers_id_seq OWNED BY observers.id;
            public       postgres    false    239            �            1259    16642    openidattributes    TABLE     �   CREATE TABLE openidattributes (
    id character varying NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);
 $   DROP TABLE public.openidattributes;
       public         postgres    false    7            �            1259    16648 
   openidinfo    TABLE     `   CREATE TABLE openidinfo (
    id character varying NOT NULL,
    logininfoid bigint NOT NULL
);
    DROP TABLE public.openidinfo;
       public         postgres    false    7            �            1259    16654    passwordinfo    TABLE     �   CREATE TABLE passwordinfo (
    hasher character varying NOT NULL,
    password character varying NOT NULL,
    salt character varying,
    "loginInfoId" bigint NOT NULL
);
     DROP TABLE public.passwordinfo;
       public         postgres    false    7            �            1259    16660    plans    TABLE     !  CREATE TABLE plans (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    price numeric(21,2) NOT NULL,
    description character varying,
    slot_included integer DEFAULT 5 NOT NULL,
    "order" integer DEFAULT 1 NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);
    DROP TABLE public.plans;
       public         postgres    false    7            �            1259    16669    plans_id_seq    SEQUENCE     n   CREATE SEQUENCE plans_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.plans_id_seq;
       public       postgres    false    243    7            �           0    0    plans_id_seq    SEQUENCE OWNED BY     /   ALTER SEQUENCE plans_id_seq OWNED BY plans.id;
            public       postgres    false    244            �            1259    16671    proc_element_reflections    TABLE     �  CREATE TABLE proc_element_reflections (
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
 ,   DROP TABLE public.proc_element_reflections;
       public         postgres    false    7            �            1259    16677    proc_element_reflections_id_seq    SEQUENCE     �   CREATE SEQUENCE proc_element_reflections_id_seq
    START WITH 25
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.proc_element_reflections_id_seq;
       public       postgres    false    245    7            �           0    0    proc_element_reflections_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE proc_element_reflections_id_seq OWNED BY proc_element_reflections.id;
            public       postgres    false    246            �            1259    16679    proc_elements    TABLE     �  CREATE TABLE proc_elements (
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
 !   DROP TABLE public.proc_elements;
       public         postgres    false    7            �            1259    16685    proc_elements_id_seq    SEQUENCE     x   CREATE SEQUENCE proc_elements_id_seq
    START WITH 248
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.proc_elements_id_seq;
       public       postgres    false    7    247            �           0    0    proc_elements_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE proc_elements_id_seq OWNED BY proc_elements.id;
            public       postgres    false    248            �            1259    16687    process_histories    TABLE       CREATE TABLE process_histories (
    id integer NOT NULL,
    master_acc character varying NOT NULL,
    action character varying NOT NULL,
    process_id integer,
    what character varying,
    what_id integer,
    date timestamp(6) with time zone NOT NULL
);
 %   DROP TABLE public.process_histories;
       public         postgres    false    7            �            1259    16693    process_histories_id_seq    SEQUENCE     {   CREATE SEQUENCE process_histories_id_seq
    START WITH 14
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.process_histories_id_seq;
       public       postgres    false    249    7            �           0    0    process_histories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE process_histories_id_seq OWNED BY process_histories.id;
            public       postgres    false    250            �            1259    16695    process_permissions    TABLE       CREATE TABLE process_permissions (
    id integer NOT NULL,
    uid character varying(254),
    group_id integer,
    bprocess integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    reaction_id integer,
    role character varying(254) NOT NULL
);
 '   DROP TABLE public.process_permissions;
       public         postgres    false    7            �            1259    16701    process_permissions_id_seq    SEQUENCE     }   CREATE SEQUENCE process_permissions_id_seq
    START WITH 20
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.process_permissions_id_seq;
       public       postgres    false    251    7            �           0    0    process_permissions_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE process_permissions_id_seq OWNED BY process_permissions.id;
            public       postgres    false    252            �            1259    16703    reaction_refs    TABLE     C  CREATE TABLE reaction_refs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    autostart boolean NOT NULL,
    element_id integer NOT NULL,
    state_ref_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(254) NOT NULL
);
 !   DROP TABLE public.reaction_refs;
       public         postgres    false    7            �            1259    16706    reaction_refs_id_seq    SEQUENCE     v   CREATE SEQUENCE reaction_refs_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.reaction_refs_id_seq;
       public       postgres    false    253    7            �           0    0    reaction_refs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE reaction_refs_id_seq OWNED BY reaction_refs.id;
            public       postgres    false    254            �            1259    16708    reaction_state_out_refs    TABLE     ?  CREATE TABLE reaction_state_out_refs (
    id integer NOT NULL,
    reaction_id integer NOT NULL,
    state_ref integer NOT NULL,
    "on" boolean NOT NULL,
    on_rate integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    input boolean DEFAULT false NOT NULL
);
 +   DROP TABLE public.reaction_state_out_refs;
       public         postgres    false    7                        1259    16712    reaction_state_out_refs_id_seq    SEQUENCE     �   CREATE SEQUENCE reaction_state_out_refs_id_seq
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.reaction_state_out_refs_id_seq;
       public       postgres    false    255    7            �           0    0    reaction_state_out_refs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE reaction_state_out_refs_id_seq OWNED BY reaction_state_out_refs.id;
            public       postgres    false    256                       1259    16714    reaction_state_outs    TABLE     :  CREATE TABLE reaction_state_outs (
    id integer NOT NULL,
    reaction_id integer NOT NULL,
    state_id integer NOT NULL,
    "on" boolean NOT NULL,
    on_rate integer NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    input boolean DEFAULT false NOT NULL
);
 '   DROP TABLE public.reaction_state_outs;
       public         postgres    false    7                       1259    16718    reaction_state_outs_id_seq    SEQUENCE     }   CREATE SEQUENCE reaction_state_outs_id_seq
    START WITH 32
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.reaction_state_outs_id_seq;
       public       postgres    false    7    257            �           0    0    reaction_state_outs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE reaction_state_outs_id_seq OWNED BY reaction_state_outs.id;
            public       postgres    false    258                       1259    16720 	   reactions    TABLE     =  CREATE TABLE reactions (
    id integer NOT NULL,
    bprocess_id integer NOT NULL,
    autostart boolean NOT NULL,
    element_id integer NOT NULL,
    state_ref_id integer,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    title character varying(254) NOT NULL
);
    DROP TABLE public.reactions;
       public         postgres    false    7                       1259    16723    reactions_id_seq    SEQUENCE     s   CREATE SEQUENCE reactions_id_seq
    START WITH 41
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.reactions_id_seq;
       public       postgres    false    259    7            �           0    0    reactions_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE reactions_id_seq OWNED BY reactions.id;
            public       postgres    false    260            Y           1259    19456    reflect_action_mappings    TABLE     �   CREATE TABLE reflect_action_mappings (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    ref_action integer,
    element_action integer NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 +   DROP TABLE public.reflect_action_mappings;
       public         postgres    false    7            X           1259    19454    reflect_action_mappings_id_seq    SEQUENCE     �   CREATE SEQUENCE reflect_action_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.reflect_action_mappings_id_seq;
       public       postgres    false    7    345            �           0    0    reflect_action_mappings_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE reflect_action_mappings_id_seq OWNED BY reflect_action_mappings.id;
            public       postgres    false    344            W           1259    19433    reflect_element_mappings    TABLE       CREATE TABLE reflect_element_mappings (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    topology_element_id integer NOT NULL,
    ref_topo_element integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 ,   DROP TABLE public.reflect_element_mappings;
       public         postgres    false    7            V           1259    19431    reflect_element_mappings_id_seq    SEQUENCE     �   CREATE SEQUENCE reflect_element_mappings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.reflect_element_mappings_id_seq;
       public       postgres    false    7    343            �           0    0    reflect_element_mappings_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE reflect_element_mappings_id_seq OWNED BY reflect_element_mappings.id;
            public       postgres    false    342                       1259    16725    reflected_elem_topologs    TABLE     4  CREATE TABLE reflected_elem_topologs (
    id integer NOT NULL,
    reflection_id integer NOT NULL,
    front_elem_id integer,
    space_elem_id integer,
    hash character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    space_id integer
);
 +   DROP TABLE public.reflected_elem_topologs;
       public         postgres    false    7                       1259    16728    reflected_elem_topologs_id_seq    SEQUENCE     �   CREATE SEQUENCE reflected_elem_topologs_id_seq
    START WITH 22
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 5   DROP SEQUENCE public.reflected_elem_topologs_id_seq;
       public       postgres    false    261    7            �           0    0    reflected_elem_topologs_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE reflected_elem_topologs_id_seq OWNED BY reflected_elem_topologs.id;
            public       postgres    false    262                       1259    16730    refs    TABLE     |  CREATE TABLE refs (
    id integer NOT NULL,
    title character varying(254) NOT NULL,
    host character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone,
    "desc" character varying(254),
    category character varying(254) DEFAULT 'Common'::character varying NOT NULL,
    hidden boolean DEFAULT false NOT NULL
);
    DROP TABLE public.refs;
       public         postgres    false    7                       1259    16738    refs_id_seq    SEQUENCE     n   CREATE SEQUENCE refs_id_seq
    START WITH 27
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE public.refs_id_seq;
       public       postgres    false    7    263            �           0    0    refs_id_seq    SEQUENCE OWNED BY     -   ALTER SEQUENCE refs_id_seq OWNED BY refs.id;
            public       postgres    false    264            	           1259    16740 	   resources    TABLE     �   CREATE TABLE resources (
    id integer NOT NULL,
    title character varying NOT NULL,
    business_id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
    DROP TABLE public.resources;
       public         postgres    false    7            
           1259    16746    resources_id_seq    SEQUENCE     r   CREATE SEQUENCE resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.resources_id_seq;
       public       postgres    false    265    7            �           0    0    resources_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE resources_id_seq OWNED BY resources.id;
            public       postgres    false    266                       1259    16748    session_elem_topologs    TABLE     E  CREATE TABLE session_elem_topologs (
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
 )   DROP TABLE public.session_elem_topologs;
       public         postgres    false    7                       1259    16754    session_elem_topologs_id_seq    SEQUENCE     ~   CREATE SEQUENCE session_elem_topologs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.session_elem_topologs_id_seq;
       public       postgres    false    267    7            �           0    0    session_elem_topologs_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE session_elem_topologs_id_seq OWNED BY session_elem_topologs.id;
            public       postgres    false    268                       1259    16756    session_element_resources    TABLE     j  CREATE TABLE session_element_resources (
    id integer NOT NULL,
    session_element_id integer NOT NULL,
    process_id integer NOT NULL,
    session_id integer NOT NULL,
    resource_id integer NOT NULL,
    entities character varying DEFAULT ''::character varying NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone
);
 -   DROP TABLE public.session_element_resources;
       public         postgres    false    7                       1259    16763     session_element_resources_id_seq    SEQUENCE     �   CREATE SEQUENCE session_element_resources_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.session_element_resources_id_seq;
       public       postgres    false    269    7            �           0    0     session_element_resources_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE session_element_resources_id_seq OWNED BY session_element_resources.id;
            public       postgres    false    270                       1259    16765    session_initial_states    TABLE     /  CREATE TABLE session_initial_states (
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
 *   DROP TABLE public.session_initial_states;
       public         postgres    false    7                       1259    16779    session_initial_states_id_seq    SEQUENCE        CREATE SEQUENCE session_initial_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.session_initial_states_id_seq;
       public       postgres    false    271    7            �           0    0    session_initial_states_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE session_initial_states_id_seq OWNED BY session_initial_states.id;
            public       postgres    false    272                       1259    16781    session_proc_elements    TABLE     �  CREATE TABLE session_proc_elements (
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
 )   DROP TABLE public.session_proc_elements;
       public         postgres    false    7                       1259    16787    session_proc_elements_id_seq    SEQUENCE     ~   CREATE SEQUENCE session_proc_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.session_proc_elements_id_seq;
       public       postgres    false    7    273            �           0    0    session_proc_elements_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE session_proc_elements_id_seq OWNED BY session_proc_elements.id;
            public       postgres    false    274                       1259    16789    session_reaction_state_outs    TABLE     D  CREATE TABLE session_reaction_state_outs (
    id integer NOT NULL,
    session_state_id integer NOT NULL,
    reaction_id integer NOT NULL,
    "on" boolean NOT NULL,
    on_rate integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    input boolean DEFAULT false NOT NULL
);
 /   DROP TABLE public.session_reaction_state_outs;
       public         postgres    false    7                       1259    16793 "   session_reaction_state_outs_id_seq    SEQUENCE     �   CREATE SEQUENCE session_reaction_state_outs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 9   DROP SEQUENCE public.session_reaction_state_outs_id_seq;
       public       postgres    false    7    275            �           0    0 "   session_reaction_state_outs_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE session_reaction_state_outs_id_seq OWNED BY session_reaction_state_outs.id;
            public       postgres    false    276                       1259    16795    session_reactions    TABLE     R  CREATE TABLE session_reactions (
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
 %   DROP TABLE public.session_reactions;
       public         postgres    false    7                       1259    16801    session_reactions_id_seq    SEQUENCE     z   CREATE SEQUENCE session_reactions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.session_reactions_id_seq;
       public       postgres    false    7    277            �           0    0    session_reactions_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE session_reactions_id_seq OWNED BY session_reactions.id;
            public       postgres    false    278                       1259    16803    session_space_elements    TABLE       CREATE TABLE session_space_elements (
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
 *   DROP TABLE public.session_space_elements;
       public         postgres    false    7                       1259    16809    session_space_elements_id_seq    SEQUENCE        CREATE SEQUENCE session_space_elements_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.session_space_elements_id_seq;
       public       postgres    false    7    279            �           0    0    session_space_elements_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE session_space_elements_id_seq OWNED BY session_space_elements.id;
            public       postgres    false    280                       1259    16811    session_spaces    TABLE     �  CREATE TABLE session_spaces (
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
 "   DROP TABLE public.session_spaces;
       public         postgres    false    7                       1259    16816    session_spaces_id_seq    SEQUENCE     w   CREATE SEQUENCE session_spaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.session_spaces_id_seq;
       public       postgres    false    281    7            �           0    0    session_spaces_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE session_spaces_id_seq OWNED BY session_spaces.id;
            public       postgres    false    282                       1259    16818    session_state_logs    TABLE     [  CREATE TABLE session_state_logs (
    id integer NOT NULL,
    session_id integer NOT NULL,
    "on" boolean DEFAULT false NOT NULL,
    on_rate integer DEFAULT 0 NOT NULL,
    reason character varying(254) NOT NULL,
    created_at timestamp(6) with time zone,
    updated_at timestamp(6) with time zone NOT NULL,
    state_id integer NOT NULL
);
 &   DROP TABLE public.session_state_logs;
       public         postgres    false    7                       1259    16823    session_state_logs_id_seq    SEQUENCE     }   CREATE SEQUENCE session_state_logs_id_seq
    START WITH 816
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.session_state_logs_id_seq;
       public       postgres    false    7    283            �           0    0    session_state_logs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE session_state_logs_id_seq OWNED BY session_state_logs.id;
            public       postgres    false    284                       1259    16825    session_switchers    TABLE     �  CREATE TABLE session_switchers (
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
 %   DROP TABLE public.session_switchers;
       public         postgres    false    7                       1259    16833    session_switchers_id_seq    SEQUENCE     z   CREATE SEQUENCE session_switchers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.session_switchers_id_seq;
       public       postgres    false    285    7            �           0    0    session_switchers_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE session_switchers_id_seq OWNED BY session_switchers.id;
            public       postgres    false    286                       1259    16835    sessionstates    TABLE     �  CREATE TABLE sessionstates (
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
 !   DROP TABLE public.sessionstates;
       public         postgres    false    7                        1259    16849    sessionstates_id_seq    SEQUENCE     y   CREATE SEQUENCE sessionstates_id_seq
    START WITH 1332
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.sessionstates_id_seq;
       public       postgres    false    287    7            �           0    0    sessionstates_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE sessionstates_id_seq OWNED BY sessionstates.id;
            public       postgres    false    288            !           1259    16851    space_element_reflections    TABLE     �  CREATE TABLE space_element_reflections (
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
 -   DROP TABLE public.space_element_reflections;
       public         postgres    false    7            "           1259    16857     space_element_reflections_id_seq    SEQUENCE     �   CREATE SEQUENCE space_element_reflections_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.space_element_reflections_id_seq;
       public       postgres    false    289    7            �           0    0     space_element_reflections_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE space_element_reflections_id_seq OWNED BY space_element_reflections.id;
            public       postgres    false    290            #           1259    16859    space_elements    TABLE       CREATE TABLE space_elements (
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
 "   DROP TABLE public.space_elements;
       public         postgres    false    7            $           1259    16865    space_elements_id_seq    SEQUENCE     x   CREATE SEQUENCE space_elements_id_seq
    START WITH 56
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.space_elements_id_seq;
       public       postgres    false    291    7            �           0    0    space_elements_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE space_elements_id_seq OWNED BY space_elements.id;
            public       postgres    false    292            %           1259    16867 
   space_refs    TABLE     d  CREATE TABLE space_refs (
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
    DROP TABLE public.space_refs;
       public         postgres    false    7            &           1259    16870    space_refs_id_seq    SEQUENCE     s   CREATE SEQUENCE space_refs_id_seq
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.space_refs_id_seq;
       public       postgres    false    7    293            �           0    0    space_refs_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE space_refs_id_seq OWNED BY space_refs.id;
            public       postgres    false    294            '           1259    16872 
   state_refs    TABLE       CREATE TABLE state_refs (
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
    DROP TABLE public.state_refs;
       public         postgres    false    7            (           1259    16886    state_refs_id_seq    SEQUENCE     t   CREATE SEQUENCE state_refs_id_seq
    START WITH 26
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.state_refs_id_seq;
       public       postgres    false    295    7            �           0    0    state_refs_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE state_refs_id_seq OWNED BY state_refs.id;
            public       postgres    false    296            9           1259    19090 
   strategies    TABLE     �   CREATE TABLE strategies (
    id bigint NOT NULL,
    ident character varying NOT NULL,
    middleware_id bigint NOT NULL,
    is_null_strategy boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
    DROP TABLE public.strategies;
       public         postgres    false    7            8           1259    19088    strategies_id_seq    SEQUENCE     s   CREATE SEQUENCE strategies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.strategies_id_seq;
       public       postgres    false    313    7            �           0    0    strategies_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE strategies_id_seq OWNED BY strategies.id;
            public       postgres    false    312            ;           1259    19106    strategy_base_refs    TABLE     �  CREATE TABLE strategy_base_refs (
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
 &   DROP TABLE public.strategy_base_refs;
       public         postgres    false    7            :           1259    19104    strategy_base_refs_id_seq    SEQUENCE     {   CREATE SEQUENCE strategy_base_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.strategy_base_refs_id_seq;
       public       postgres    false    315    7            �           0    0    strategy_base_refs_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE strategy_base_refs_id_seq OWNED BY strategy_base_refs.id;
            public       postgres    false    314            =           1259    19122    strategy_bases    TABLE     �  CREATE TABLE strategy_bases (
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
 "   DROP TABLE public.strategy_bases;
       public         postgres    false    7            <           1259    19120    strategy_bases_id_seq    SEQUENCE     w   CREATE SEQUENCE strategy_bases_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.strategy_bases_id_seq;
       public       postgres    false    7    317            �           0    0    strategy_bases_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE strategy_bases_id_seq OWNED BY strategy_bases.id;
            public       postgres    false    316            ?           1259    19138    strategy_input_refs    TABLE     o  CREATE TABLE strategy_input_refs (
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
 '   DROP TABLE public.strategy_input_refs;
       public         postgres    false    7            >           1259    19136    strategy_input_refs_id_seq    SEQUENCE     |   CREATE SEQUENCE strategy_input_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.strategy_input_refs_id_seq;
       public       postgres    false    319    7            �           0    0    strategy_input_refs_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE strategy_input_refs_id_seq OWNED BY strategy_input_refs.id;
            public       postgres    false    318            A           1259    19154    strategy_inputs    TABLE     k  CREATE TABLE strategy_inputs (
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
 #   DROP TABLE public.strategy_inputs;
       public         postgres    false    7            @           1259    19152    strategy_inputs_id_seq    SEQUENCE     x   CREATE SEQUENCE strategy_inputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.strategy_inputs_id_seq;
       public       postgres    false    7    321            �           0    0    strategy_inputs_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE strategy_inputs_id_seq OWNED BY strategy_inputs.id;
            public       postgres    false    320            C           1259    19170    strategy_output_refs    TABLE     p  CREATE TABLE strategy_output_refs (
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
 (   DROP TABLE public.strategy_output_refs;
       public         postgres    false    7            B           1259    19168    strategy_output_refs_id_seq    SEQUENCE     }   CREATE SEQUENCE strategy_output_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.strategy_output_refs_id_seq;
       public       postgres    false    7    323            �           0    0    strategy_output_refs_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE strategy_output_refs_id_seq OWNED BY strategy_output_refs.id;
            public       postgres    false    322            E           1259    19186    strategy_outputs    TABLE     l  CREATE TABLE strategy_outputs (
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
 $   DROP TABLE public.strategy_outputs;
       public         postgres    false    7            D           1259    19184    strategy_outputs_id_seq    SEQUENCE     y   CREATE SEQUENCE strategy_outputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.strategy_outputs_id_seq;
       public       postgres    false    7    325            �           0    0    strategy_outputs_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE strategy_outputs_id_seq OWNED BY strategy_outputs.id;
            public       postgres    false    324            7           1259    19069    strategy_refs    TABLE     #  CREATE TABLE strategy_refs (
    id bigint NOT NULL,
    ident character varying NOT NULL,
    reflection_id integer NOT NULL,
    middleware_id bigint NOT NULL,
    is_null_strategy boolean NOT NULL,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);
 !   DROP TABLE public.strategy_refs;
       public         postgres    false    7            6           1259    19067    strategy_refs_id_seq    SEQUENCE     v   CREATE SEQUENCE strategy_refs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.strategy_refs_id_seq;
       public       postgres    false    7    311            �           0    0    strategy_refs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE strategy_refs_id_seq OWNED BY strategy_refs.id;
            public       postgres    false    310            )           1259    16888    switcher_refs    TABLE     �  CREATE TABLE switcher_refs (
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
 !   DROP TABLE public.switcher_refs;
       public         postgres    false    7            *           1259    16896    switcher_refs_id_seq    SEQUENCE     w   CREATE SEQUENCE switcher_refs_id_seq
    START WITH 15
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.switcher_refs_id_seq;
       public       postgres    false    7    297            �           0    0    switcher_refs_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE switcher_refs_id_seq OWNED BY switcher_refs.id;
            public       postgres    false    298            +           1259    16898    tokens    TABLE       CREATE TABLE tokens (
    uuid character varying(254) NOT NULL,
    email character varying(254) NOT NULL,
    "creationTime" timestamp(6) without time zone NOT NULL,
    "expirationTime" timestamp(6) without time zone NOT NULL,
    "isSignUp" boolean NOT NULL
);
    DROP TABLE public.tokens;
       public         postgres    false    7            ,           1259    16904    user    TABLE     �   CREATE TABLE "user" (
    "userID" character varying NOT NULL,
    "firstName" character varying,
    "lastName" character varying,
    "fullName" character varying,
    email character varying,
    "avatarURL" character varying
);
    DROP TABLE public."user";
       public         postgres    false    7            -           1259    16910    userlogininfo    TABLE     k   CREATE TABLE userlogininfo (
    "userID" character varying NOT NULL,
    "loginInfoId" bigint NOT NULL
);
 !   DROP TABLE public.userlogininfo;
       public         postgres    false    7            �	           2604    16916    id    DEFAULT     f   ALTER TABLE ONLY account_group ALTER COLUMN id SET DEFAULT nextval('account_group_id_seq'::regclass);
 ?   ALTER TABLE public.account_group ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    174    173            �	           2604    16917    id    DEFAULT     f   ALTER TABLE ONLY account_infos ALTER COLUMN id SET DEFAULT nextval('account_infos_id_seq'::regclass);
 ?   ALTER TABLE public.account_infos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    176    175            �	           2604    16918    id    DEFAULT     j   ALTER TABLE ONLY account_loggers ALTER COLUMN id SET DEFAULT nextval('account_loggers_id_seq'::regclass);
 A   ALTER TABLE public.account_loggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    178    177            �	           2604    16919    id    DEFAULT     f   ALTER TABLE ONLY account_plans ALTER COLUMN id SET DEFAULT nextval('account_plans_id_seq'::regclass);
 ?   ALTER TABLE public.account_plans ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    182    181            :
           2604    19313    id    DEFAULT     p   ALTER TABLE ONLY action_act_results ALTER COLUMN id SET DEFAULT nextval('action_act_results_id_seq'::regclass);
 D   ALTER TABLE public.action_act_results ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    336    337    337            <
           2604    19335    id    DEFAULT     b   ALTER TABLE ONLY action_acts ALTER COLUMN id SET DEFAULT nextval('action_acts_id_seq'::regclass);
 =   ALTER TABLE public.action_acts ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    340    341    341            ;
           2604    19324    id    DEFAULT     j   ALTER TABLE ONLY action_statuses ALTER COLUMN id SET DEFAULT nextval('action_statuses_id_seq'::regclass);
 A   ALTER TABLE public.action_statuses ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    339    338    339            �	           2604    16920    id    DEFAULT     f   ALTER TABLE ONLY billing_infos ALTER COLUMN id SET DEFAULT nextval('billing_infos_id_seq'::regclass);
 ?   ALTER TABLE public.billing_infos ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    185    184            �	           2604    16921    id    DEFAULT     V   ALTER TABLE ONLY bills ALTER COLUMN id SET DEFAULT nextval('bills_id_seq'::regclass);
 7   ALTER TABLE public.bills ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    187    186            �	           2604    16922    id    DEFAULT     ^   ALTER TABLE ONLY bploggers ALTER COLUMN id SET DEFAULT nextval('bploggers_id_seq'::regclass);
 ;   ALTER TABLE public.bploggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    189    188            �	           2604    16923    id    DEFAULT     `   ALTER TABLE ONLY bprocesses ALTER COLUMN id SET DEFAULT nextval('bprocesses_id_seq'::regclass);
 <   ALTER TABLE public.bprocesses ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    191    190            �	           2604    16924    id    DEFAULT     `   ALTER TABLE ONLY bpsessions ALTER COLUMN id SET DEFAULT nextval('bpsessions_id_seq'::regclass);
 <   ALTER TABLE public.bpsessions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    193    192            �	           2604    16925    id    DEFAULT     \   ALTER TABLE ONLY bpspaces ALTER COLUMN id SET DEFAULT nextval('bpspaces_id_seq'::regclass);
 :   ALTER TABLE public.bpspaces ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    195    194            �	           2604    16926    id    DEFAULT     b   ALTER TABLE ONLY bpstaterefs ALTER COLUMN id SET DEFAULT nextval('bpstaterefs_id_seq'::regclass);
 =   ALTER TABLE public.bpstaterefs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    197    196            �	           2604    16927    id    DEFAULT     \   ALTER TABLE ONLY bpstates ALTER COLUMN id SET DEFAULT nextval('bpstates_id_seq'::regclass);
 :   ALTER TABLE public.bpstates ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    199    198            �	           2604    16928    id    DEFAULT     n   ALTER TABLE ONLY bpstation_loggers ALTER COLUMN id SET DEFAULT nextval('bpstation_loggers_id_seq'::regclass);
 C   ALTER TABLE public.bpstation_loggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    201    200            �	           2604    16929    id    DEFAULT     `   ALTER TABLE ONLY bpstations ALTER COLUMN id SET DEFAULT nextval('bpstations_id_seq'::regclass);
 <   ALTER TABLE public.bpstations ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    203    202            �	           2604    16930    id    DEFAULT     b   ALTER TABLE ONLY bpswitchers ALTER COLUMN id SET DEFAULT nextval('bpswitchers_id_seq'::regclass);
 =   ALTER TABLE public.bpswitchers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    205    204            �	           2604    16931    id    DEFAULT     n   ALTER TABLE ONLY business_services ALTER COLUMN id SET DEFAULT nextval('business_services_id_seq'::regclass);
 C   ALTER TABLE public.business_services ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    207    206            �	           2604    16932    id    DEFAULT     `   ALTER TABLE ONLY businesses ALTER COLUMN id SET DEFAULT nextval('businesses_id_seq'::regclass);
 <   ALTER TABLE public.businesses ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    209    208            �	           2604    16933    id    DEFAULT     |   ALTER TABLE ONLY cached_removed_resources ALTER COLUMN id SET DEFAULT nextval('cached_removed_resources_id_seq'::regclass);
 J   ALTER TABLE public.cached_removed_resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    211    210            �	           2604    16934    id    DEFAULT     l   ALTER TABLE ONLY client_observers ALTER COLUMN id SET DEFAULT nextval('client_observers_id_seq'::regclass);
 B   ALTER TABLE public.client_observers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    213    212            �	           2604    16935    id    DEFAULT     f   ALTER TABLE ONLY elem_topologs ALTER COLUMN id SET DEFAULT nextval('elem_topologs_id_seq'::regclass);
 ?   ALTER TABLE public.elem_topologs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    215    214            �	           2604    16936    id    DEFAULT     n   ALTER TABLE ONLY element_resources ALTER COLUMN id SET DEFAULT nextval('element_resources_id_seq'::regclass);
 C   ALTER TABLE public.element_resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    217    216            �	           2604    16937    id    DEFAULT     ^   ALTER TABLE ONLY employees ALTER COLUMN id SET DEFAULT nextval('employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    220    218            '
           2604    19011    id    DEFAULT     V   ALTER TABLE ONLY files ALTER COLUMN id SET DEFAULT nextval('files_id_seq'::regclass);
 7   ALTER TABLE public.files ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    303    302    303            �	           2604    16938    id    DEFAULT     X   ALTER TABLE ONLY groups ALTER COLUMN id SET DEFAULT nextval('groups_id_seq'::regclass);
 8   ALTER TABLE public.groups ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    222    221            �	           2604    16939    id    DEFAULT     f   ALTER TABLE ONLY input_loggers ALTER COLUMN id SET DEFAULT nextval('input_loggers_id_seq'::regclass);
 ?   ALTER TABLE public.input_loggers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    225    224            �	           2604    16940    id    DEFAULT     j   ALTER TABLE ONLY launch_counters ALTER COLUMN id SET DEFAULT nextval('launch_counters_id_seq'::regclass);
 A   ALTER TABLE public.launch_counters ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    227    226            (
           2604    19022    id    DEFAULT     d   ALTER TABLE ONLY launch_files ALTER COLUMN id SET DEFAULT nextval('launch_files_id_seq'::regclass);
 >   ALTER TABLE public.launch_files ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    305    304    305            4
           2604    19205    id    DEFAULT     p   ALTER TABLE ONLY launch_middlewares ALTER COLUMN id SET DEFAULT nextval('launch_middlewares_id_seq'::regclass);
 D   ALTER TABLE public.launch_middlewares ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    327    326    327            �	           2604    16941    id    DEFAULT     f   ALTER TABLE ONLY launch_shares ALTER COLUMN id SET DEFAULT nextval('launch_shares_id_seq'::regclass);
 ?   ALTER TABLE public.launch_shares ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    229    228            6
           2604    19226    id    DEFAULT     n   ALTER TABLE ONLY launch_strategies ALTER COLUMN id SET DEFAULT nextval('launch_strategies_id_seq'::regclass);
 C   ALTER TABLE public.launch_strategies ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    329    328    329            7
           2604    19247    id    DEFAULT     v   ALTER TABLE ONLY launch_strategy_bases ALTER COLUMN id SET DEFAULT nextval('launch_strategy_bases_id_seq'::regclass);
 G   ALTER TABLE public.launch_strategy_bases ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    330    331    331            8
           2604    19263    id    DEFAULT     x   ALTER TABLE ONLY launch_strategy_inputs ALTER COLUMN id SET DEFAULT nextval('launch_strategy_inputs_id_seq'::regclass);
 H   ALTER TABLE public.launch_strategy_inputs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    332    333    333            9
           2604    19279    id    DEFAULT     z   ALTER TABLE ONLY launch_strategy_outputs ALTER COLUMN id SET DEFAULT nextval('launch_strategy_outputs_id_seq'::regclass);
 I   ALTER TABLE public.launch_strategy_outputs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    335    334    335            �	           2604    16942    id    DEFAULT     d   ALTER TABLE ONLY launch_warps ALTER COLUMN id SET DEFAULT nextval('launch_warps_id_seq'::regclass);
 >   ALTER TABLE public.launch_warps ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    231    230            �	           2604    16943    id    DEFAULT     ^   ALTER TABLE ONLY logininfo ALTER COLUMN id SET DEFAULT nextval('logininfo_id_seq'::regclass);
 ;   ALTER TABLE public.logininfo ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    233    232            +
           2604    19051    id    DEFAULT     j   ALTER TABLE ONLY middleware_refs ALTER COLUMN id SET DEFAULT nextval('middleware_refs_id_seq'::regclass);
 A   ALTER TABLE public.middleware_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    309    308    309            )
           2604    19035    id    DEFAULT     b   ALTER TABLE ONLY middlewares ALTER COLUMN id SET DEFAULT nextval('middlewares_id_seq'::regclass);
 =   ALTER TABLE public.middlewares ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    307    306    307            �	           2604    16944    id    DEFAULT     `   ALTER TABLE ONLY oauth1info ALTER COLUMN id SET DEFAULT nextval('oauth1info_id_seq'::regclass);
 <   ALTER TABLE public.oauth1info ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    235    234            �	           2604    16945    id    DEFAULT     `   ALTER TABLE ONLY oauth2info ALTER COLUMN id SET DEFAULT nextval('oauth2info_id_seq'::regclass);
 <   ALTER TABLE public.oauth2info ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    237    236            �	           2604    16946    id    DEFAULT     ^   ALTER TABLE ONLY observers ALTER COLUMN id SET DEFAULT nextval('observers_id_seq'::regclass);
 ;   ALTER TABLE public.observers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    239    238            �	           2604    16947    id    DEFAULT     V   ALTER TABLE ONLY plans ALTER COLUMN id SET DEFAULT nextval('plans_id_seq'::regclass);
 7   ALTER TABLE public.plans ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    244    243            �	           2604    16948    id    DEFAULT     |   ALTER TABLE ONLY proc_element_reflections ALTER COLUMN id SET DEFAULT nextval('proc_element_reflections_id_seq'::regclass);
 J   ALTER TABLE public.proc_element_reflections ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    246    245            �	           2604    16949    id    DEFAULT     f   ALTER TABLE ONLY proc_elements ALTER COLUMN id SET DEFAULT nextval('proc_elements_id_seq'::regclass);
 ?   ALTER TABLE public.proc_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    248    247            �	           2604    16950    id    DEFAULT     n   ALTER TABLE ONLY process_histories ALTER COLUMN id SET DEFAULT nextval('process_histories_id_seq'::regclass);
 C   ALTER TABLE public.process_histories ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    250    249            �	           2604    16951    id    DEFAULT     r   ALTER TABLE ONLY process_permissions ALTER COLUMN id SET DEFAULT nextval('process_permissions_id_seq'::regclass);
 E   ALTER TABLE public.process_permissions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    252    251            �	           2604    16952    id    DEFAULT     f   ALTER TABLE ONLY reaction_refs ALTER COLUMN id SET DEFAULT nextval('reaction_refs_id_seq'::regclass);
 ?   ALTER TABLE public.reaction_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    254    253            �	           2604    16953    id    DEFAULT     z   ALTER TABLE ONLY reaction_state_out_refs ALTER COLUMN id SET DEFAULT nextval('reaction_state_out_refs_id_seq'::regclass);
 I   ALTER TABLE public.reaction_state_out_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    256    255            �	           2604    16954    id    DEFAULT     r   ALTER TABLE ONLY reaction_state_outs ALTER COLUMN id SET DEFAULT nextval('reaction_state_outs_id_seq'::regclass);
 E   ALTER TABLE public.reaction_state_outs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    258    257            �	           2604    16955    id    DEFAULT     ^   ALTER TABLE ONLY reactions ALTER COLUMN id SET DEFAULT nextval('reactions_id_seq'::regclass);
 ;   ALTER TABLE public.reactions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    260    259            >
           2604    19459    id    DEFAULT     z   ALTER TABLE ONLY reflect_action_mappings ALTER COLUMN id SET DEFAULT nextval('reflect_action_mappings_id_seq'::regclass);
 I   ALTER TABLE public.reflect_action_mappings ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    345    344    345            =
           2604    19436    id    DEFAULT     |   ALTER TABLE ONLY reflect_element_mappings ALTER COLUMN id SET DEFAULT nextval('reflect_element_mappings_id_seq'::regclass);
 J   ALTER TABLE public.reflect_element_mappings ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    342    343    343            �	           2604    16956    id    DEFAULT     z   ALTER TABLE ONLY reflected_elem_topologs ALTER COLUMN id SET DEFAULT nextval('reflected_elem_topologs_id_seq'::regclass);
 I   ALTER TABLE public.reflected_elem_topologs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    262    261            �	           2604    16957    id    DEFAULT     T   ALTER TABLE ONLY refs ALTER COLUMN id SET DEFAULT nextval('refs_id_seq'::regclass);
 6   ALTER TABLE public.refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    264    263            �	           2604    16958    id    DEFAULT     ^   ALTER TABLE ONLY resources ALTER COLUMN id SET DEFAULT nextval('resources_id_seq'::regclass);
 ;   ALTER TABLE public.resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    266    265            �	           2604    16959    id    DEFAULT     v   ALTER TABLE ONLY session_elem_topologs ALTER COLUMN id SET DEFAULT nextval('session_elem_topologs_id_seq'::regclass);
 G   ALTER TABLE public.session_elem_topologs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    268    267            �	           2604    16960    id    DEFAULT     ~   ALTER TABLE ONLY session_element_resources ALTER COLUMN id SET DEFAULT nextval('session_element_resources_id_seq'::regclass);
 K   ALTER TABLE public.session_element_resources ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    270    269             
           2604    16961    id    DEFAULT     x   ALTER TABLE ONLY session_initial_states ALTER COLUMN id SET DEFAULT nextval('session_initial_states_id_seq'::regclass);
 H   ALTER TABLE public.session_initial_states ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    272    271            
           2604    16962    id    DEFAULT     v   ALTER TABLE ONLY session_proc_elements ALTER COLUMN id SET DEFAULT nextval('session_proc_elements_id_seq'::regclass);
 G   ALTER TABLE public.session_proc_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    274    273            
           2604    16963    id    DEFAULT     �   ALTER TABLE ONLY session_reaction_state_outs ALTER COLUMN id SET DEFAULT nextval('session_reaction_state_outs_id_seq'::regclass);
 M   ALTER TABLE public.session_reaction_state_outs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    276    275            
           2604    16964    id    DEFAULT     n   ALTER TABLE ONLY session_reactions ALTER COLUMN id SET DEFAULT nextval('session_reactions_id_seq'::regclass);
 C   ALTER TABLE public.session_reactions ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    278    277            
           2604    16965    id    DEFAULT     x   ALTER TABLE ONLY session_space_elements ALTER COLUMN id SET DEFAULT nextval('session_space_elements_id_seq'::regclass);
 H   ALTER TABLE public.session_space_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    280    279            
           2604    16966    id    DEFAULT     h   ALTER TABLE ONLY session_spaces ALTER COLUMN id SET DEFAULT nextval('session_spaces_id_seq'::regclass);
 @   ALTER TABLE public.session_spaces ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    282    281            
           2604    16967    id    DEFAULT     p   ALTER TABLE ONLY session_state_logs ALTER COLUMN id SET DEFAULT nextval('session_state_logs_id_seq'::regclass);
 D   ALTER TABLE public.session_state_logs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    284    283            
           2604    16968    id    DEFAULT     n   ALTER TABLE ONLY session_switchers ALTER COLUMN id SET DEFAULT nextval('session_switchers_id_seq'::regclass);
 C   ALTER TABLE public.session_switchers ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    286    285            
           2604    16969    id    DEFAULT     f   ALTER TABLE ONLY sessionstates ALTER COLUMN id SET DEFAULT nextval('sessionstates_id_seq'::regclass);
 ?   ALTER TABLE public.sessionstates ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    288    287            
           2604    16970    id    DEFAULT     ~   ALTER TABLE ONLY space_element_reflections ALTER COLUMN id SET DEFAULT nextval('space_element_reflections_id_seq'::regclass);
 K   ALTER TABLE public.space_element_reflections ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    290    289            
           2604    16971    id    DEFAULT     h   ALTER TABLE ONLY space_elements ALTER COLUMN id SET DEFAULT nextval('space_elements_id_seq'::regclass);
 @   ALTER TABLE public.space_elements ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    292    291            
           2604    16972    id    DEFAULT     `   ALTER TABLE ONLY space_refs ALTER COLUMN id SET DEFAULT nextval('space_refs_id_seq'::regclass);
 <   ALTER TABLE public.space_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    294    293            #
           2604    16973    id    DEFAULT     `   ALTER TABLE ONLY state_refs ALTER COLUMN id SET DEFAULT nextval('state_refs_id_seq'::regclass);
 <   ALTER TABLE public.state_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    296    295            -
           2604    19093    id    DEFAULT     `   ALTER TABLE ONLY strategies ALTER COLUMN id SET DEFAULT nextval('strategies_id_seq'::regclass);
 <   ALTER TABLE public.strategies ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    313    312    313            .
           2604    19109    id    DEFAULT     p   ALTER TABLE ONLY strategy_base_refs ALTER COLUMN id SET DEFAULT nextval('strategy_base_refs_id_seq'::regclass);
 D   ALTER TABLE public.strategy_base_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    315    314    315            /
           2604    19125    id    DEFAULT     h   ALTER TABLE ONLY strategy_bases ALTER COLUMN id SET DEFAULT nextval('strategy_bases_id_seq'::regclass);
 @   ALTER TABLE public.strategy_bases ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    317    316    317            0
           2604    19141    id    DEFAULT     r   ALTER TABLE ONLY strategy_input_refs ALTER COLUMN id SET DEFAULT nextval('strategy_input_refs_id_seq'::regclass);
 E   ALTER TABLE public.strategy_input_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    318    319    319            1
           2604    19157    id    DEFAULT     j   ALTER TABLE ONLY strategy_inputs ALTER COLUMN id SET DEFAULT nextval('strategy_inputs_id_seq'::regclass);
 A   ALTER TABLE public.strategy_inputs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    320    321    321            2
           2604    19173    id    DEFAULT     t   ALTER TABLE ONLY strategy_output_refs ALTER COLUMN id SET DEFAULT nextval('strategy_output_refs_id_seq'::regclass);
 F   ALTER TABLE public.strategy_output_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    322    323    323            3
           2604    19189    id    DEFAULT     l   ALTER TABLE ONLY strategy_outputs ALTER COLUMN id SET DEFAULT nextval('strategy_outputs_id_seq'::regclass);
 B   ALTER TABLE public.strategy_outputs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    325    324    325            ,
           2604    19072    id    DEFAULT     f   ALTER TABLE ONLY strategy_refs ALTER COLUMN id SET DEFAULT nextval('strategy_refs_id_seq'::regclass);
 ?   ALTER TABLE public.strategy_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    311    310    311            &
           2604    16974    id    DEFAULT     f   ALTER TABLE ONLY switcher_refs ALTER COLUMN id SET DEFAULT nextval('switcher_refs_id_seq'::regclass);
 ?   ALTER TABLE public.switcher_refs ALTER COLUMN id DROP DEFAULT;
       public       postgres    false    298    297            �          0    16386    account_group 
   TABLE DATA               _   COPY account_group (id, account_id, group_id, created_at, updated_at, employee_id) FROM stdin;
    public       postgres    false    173   ��      �           0    0    account_group_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('account_group_id_seq', 9, true);
            public       postgres    false    174            �          0    16391    account_infos 
   TABLE DATA                  COPY account_infos (id, uid, created_at, early_access, pro_features, workbench_id, lang, nickname, country, phone) FROM stdin;
    public       postgres    false    175   ��      �           0    0    account_infos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('account_infos_id_seq', 62, true);
            public       postgres    false    176            �          0    16401    account_loggers 
   TABLE DATA               C   COPY account_loggers (id, ip, user_agent, email, date) FROM stdin;
    public       postgres    false    177   2�      �           0    0    account_loggers_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('account_loggers_id_seq', 1008, true);
            public       postgres    false    178            �          0    16411    account_plan_history 
   TABLE DATA               \   COPY account_plan_history (id, account_plan_id, limit_diff, plan_diff, bill_id) FROM stdin;
    public       postgres    false    180   S�      �           0    0    account_plan_history_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('account_plan_history_id_seq', 1, false);
            public       postgres    false    179            �          0    16415    account_plans 
   TABLE DATA               c   COPY account_plans (id, business_id, master_acc, plan_id, expired_at, active, "limit") FROM stdin;
    public       postgres    false    181   p�      �           0    0    account_plans_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('account_plans_id_seq', 86, true);
            public       postgres    false    182            �          0    16420    accounts 
   TABLE DATA                 COPY accounts ("providerId", "userId", "firstName", "lastName", "fullName", email, "avatarUrl", "authMethod", token, secret, "accessToken", "tokenType", "expiresIn", "refreshToken", hasher, password, salt, lang, country, phone, nickname, created_at) FROM stdin;
    public       postgres    false    183         �          0    19310    action_act_results 
   TABLE DATA               e   COPY action_act_results (id, "in", "out", base, content, act_id, created_at, updated_at) FROM stdin;
    public       postgres    false    337   �      �           0    0    action_act_results_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('action_act_results_id_seq', 18, true);
            public       postgres    false    336            �          0    19332    action_acts 
   TABLE DATA               U   COPY action_acts (id, uid, session_id, reaction, created_at, updated_at) FROM stdin;
    public       postgres    false    341   �$      �           0    0    action_acts_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('action_acts_id_seq', 18, true);
            public       postgres    false    340            �          0    19321    action_statuses 
   TABLE DATA               O   COPY action_statuses (id, content, act_id, created_at, updated_at) FROM stdin;
    public       postgres    false    339   �$      �           0    0    action_statuses_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('action_statuses_id_seq', 18, true);
            public       postgres    false    338            �          0    16426    billing_infos 
   TABLE DATA               p   COPY billing_infos (id, business_id, firstname, lastname, address, zipcode, created_at, updated_at) FROM stdin;
    public       postgres    false    184   &      �           0    0    billing_infos_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('billing_infos_id_seq', 1, false);
            public       postgres    false    185            �          0    16434    bills 
   TABLE DATA               _   COPY bills (id, title, master_acc, assigned, approved, expired, sum, workbench_id) FROM stdin;
    public       postgres    false    186   5&      �           0    0    bills_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('bills_id_seq', 1, true);
            public       postgres    false    187            �          0    16442 	   bploggers 
   TABLE DATA               �   COPY bploggers (id, process_id, proc_element_id, space_element_id, "order", space_id, station_id, invoked, expanded, container, date, step) FROM stdin;
    public       postgres    false    188   R&      �           0    0    bploggers_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bploggers_id_seq', 1494, true);
            public       postgres    false    189            �          0    16447 
   bprocesses 
   TABLE DATA               v   COPY bprocesses (id, title, service_id, business_id, created_at, updated_at, version, state_machine_type) FROM stdin;
    public       postgres    false    190   �&      �           0    0    bprocesses_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bprocesses_id_seq', 137, true);
            public       postgres    false    191            �          0    16454 
   bpsessions 
   TABLE DATA               T   COPY bpsessions (id, process_id, created_at, updated_at, active_listed) FROM stdin;
    public       postgres    false    192   �*      �           0    0    bpsessions_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bpsessions_id_seq', 291, true);
            public       postgres    false    193            �          0    16460    bpspaces 
   TABLE DATA               �   COPY bpspaces (id, process_id, index, container, subbrick, brick_front_id, brick_nested_id, nesting_level, created_at, updated_at) FROM stdin;
    public       postgres    false    194   �,      �           0    0    bpspaces_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('bpspaces_id_seq', 97, true);
            public       postgres    false    195            �          0    16467    bpstaterefs 
   TABLE DATA               w   COPY bpstaterefs (id, bprocess_id, switch_type, priority, state_id, session_state, created_at, updated_at) FROM stdin;
    public       postgres    false    196   �-      �           0    0    bpstaterefs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bpstaterefs_id_seq', 1, false);
            public       postgres    false    197            �          0    16473    bpstates 
   TABLE DATA               �   COPY bpstates (id, process_id, title, neutral, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, middle, middleable, oposite, opositable) FROM stdin;
    public       postgres    false    198   �-      �           0    0    bpstates_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('bpstates_id_seq', 757, true);
            public       postgres    false    199                      0    16489    bpstation_loggers 
   TABLE DATA               �   COPY bpstation_loggers (id, station_id, process_id, sygnal, date, state, step, space, container_step, expand_step, spaces_ids, started, finished, inspace, incontainer, inexpands, paused) FROM stdin;
    public       postgres    false    200   �9      �           0    0    bpstation_loggers_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('bpstation_loggers_id_seq', 7339, true);
            public       postgres    false    201                      0    16497 
   bpstations 
   TABLE DATA               �   COPY bpstations (id, process_id, state, step, space, container_step, expand_step, spaces_ids, started, finished, inspace, incontainer, inexpands, paused, note, created_at, updated_at, canceled, session_id, front) FROM stdin;
    public       postgres    false    202   ;�      �           0    0    bpstations_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('bpstations_id_seq', 413, true);
            public       postgres    false    203                      0    16506    bpswitchers 
   TABLE DATA               �   COPY bpswitchers (id, bprocess_id, switch_type, priority, state_id, session_state, fn, target, created_at, updated_at, override_group) FROM stdin;
    public       postgres    false    204   x      �           0    0    bpswitchers_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('bpswitchers_id_seq', 388, true);
            public       postgres    false    205                      0    16516    business_services 
   TABLE DATA               H   COPY business_services (id, title, business_id, master_acc) FROM stdin;
    public       postgres    false    206   .      �           0    0    business_services_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('business_services_id_seq', 91, true);
            public       postgres    false    207            	          0    16524 
   businesses 
   TABLE DATA               �   COPY businesses (id, title, phone, website, country, city, address, walkthrough, created_at, updated_at, nickname, org) FROM stdin;
    public       postgres    false    208   �                  0    0    businesses_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('businesses_id_seq', 64, true);
            public       postgres    false    209                      0    16533    cached_removed_resources 
   TABLE DATA               t   COPY cached_removed_resources (id, scope, scope_type, action, what, what_id, date, "updatedAttributes") FROM stdin;
    public       postgres    false    210   �                 0    0    cached_removed_resources_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('cached_removed_resources_id_seq', 385, true);
            public       postgres    false    211                      0    16541    client_observers 
   TABLE DATA               ,   COPY client_observers (id, uid) FROM stdin;
    public       postgres    false    212   6                  0    0    client_observers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('client_observers_id_seq', 1, false);
            public       postgres    false    213                      0    16546    elem_topologs 
   TABLE DATA               v   COPY elem_topologs (id, process_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
    public       postgres    false    214   S                  0    0    elem_topologs_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('elem_topologs_id_seq', 242, true);
            public       postgres    false    215                      0    16551    element_resources 
   TABLE DATA               o   COPY element_resources (id, element_id, process_id, resource_id, entities, created_at, updated_at) FROM stdin;
    public       postgres    false    216   Z$                 0    0    element_resources_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('element_resources_id_seq', 1, false);
            public       postgres    false    217                      0    16560 	   employees 
   TABLE DATA               T   COPY employees (id, uid, master_acc, "position", manager, workbench_id) FROM stdin;
    public       postgres    false    218   w$                0    16567    employees_businesses 
   TABLE DATA               A   COPY employees_businesses (employee_id, business_id) FROM stdin;
    public       postgres    false    219   �(                 0    0    employees_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('employees_id_seq', 75, true);
            public       postgres    false    220            h          0    19008    files 
   TABLE DATA               z   COPY files (id, workbench, file_name, "azureId", description, external, external_url, created_at, updated_at) FROM stdin;
    public       postgres    false    303   E)                 0    0    files_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('files_id_seq', 5, true);
            public       postgres    false    302                      0    16572    groups 
   TABLE DATA               I   COPY groups (id, title, created_at, updated_at, business_id) FROM stdin;
    public       postgres    false    221   P*                 0    0    groups_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('groups_id_seq', 63, true);
            public       postgres    false    222                       0    0    input_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('input_id_seq', 588, true);
            public       postgres    false    223                      0    16579    input_loggers 
   TABLE DATA               l   COPY input_loggers (id, uid, action, arguments, reaction_id, input, date, session_id, input_id) FROM stdin;
    public       postgres    false    224   �-      	           0    0    input_loggers_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('input_loggers_id_seq', 306, true);
            public       postgres    false    225                      0    16589    launch_counters 
   TABLE DATA               Q   COPY launch_counters (id, process_id, count, created_at, updated_at) FROM stdin;
    public       postgres    false    226   v0      
           0    0    launch_counters_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('launch_counters_id_seq', 22, true);
            public       postgres    false    227            j          0    19019    launch_files 
   TABLE DATA               [   COPY launch_files (id, file_id, launch_id, element_id, created_at, updated_at) FROM stdin;
    public       postgres    false    305   �1                 0    0    launch_files_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('launch_files_id_seq', 5, true);
            public       postgres    false    304            �          0    19202    launch_middlewares 
   TABLE DATA               u   COPY launch_middlewares (id, session_id, ident, iface_ident, reaction_id, created_at, updated_at, title) FROM stdin;
    public       postgres    false    327   v2                 0    0    launch_middlewares_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('launch_middlewares_id_seq', 37, true);
            public       postgres    false    326                      0    16594    launch_shares 
   TABLE DATA               ?   COPY launch_shares (id, title, price, description) FROM stdin;
    public       postgres    false    228   �2                 0    0    launch_shares_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('launch_shares_id_seq', 3, true);
            public       postgres    false    229            �          0    19223    launch_strategies 
   TABLE DATA               t   COPY launch_strategies (id, session_id, ident, middleware_id, is_null_strategy, created_at, updated_at) FROM stdin;
    public       postgres    false    329   �2                 0    0    launch_strategies_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('launch_strategies_id_seq', 37, true);
            public       postgres    false    328            �          0    19244    launch_strategy_bases 
   TABLE DATA               �   COPY launch_strategy_bases (id, strategy_id, key, base_type, value_type, value_content, validation_scheme, validation_pattern, created_at, updated_at) FROM stdin;
    public       postgres    false    331   �2                 0    0    launch_strategy_bases_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('launch_strategy_bases_id_seq', 37, true);
            public       postgres    false    330            �          0    19260    launch_strategy_inputs 
   TABLE DATA               y   COPY launch_strategy_inputs (id, strategy_id, op, title, "desc", ident, target_type, created_at, updated_at) FROM stdin;
    public       postgres    false    333   �2                 0    0    launch_strategy_inputs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('launch_strategy_inputs_id_seq', 1, false);
            public       postgres    false    332            �          0    19276    launch_strategy_outputs 
   TABLE DATA               z   COPY launch_strategy_outputs (id, strategy_id, op, title, "desc", ident, target_type, created_at, updated_at) FROM stdin;
    public       postgres    false    335   3                 0    0    launch_strategy_outputs_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('launch_strategy_outputs_id_seq', 1, false);
            public       postgres    false    334                      0    16602    launch_warps 
   TABLE DATA               c   COPY launch_warps (id, launch_id, launch_element_id, board_id, created_at, updated_at) FROM stdin;
    public       postgres    false    230   $3                 0    0    launch_warps_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('launch_warps_id_seq', 1, false);
            public       postgres    false    231            !          0    16610 	   logininfo 
   TABLE DATA               =   COPY logininfo (id, "providerID", "providerKey") FROM stdin;
    public       postgres    false    232   A3                 0    0    logininfo_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('logininfo_id_seq', 82, true);
            public       postgres    false    233            n          0    19048    middleware_refs 
   TABLE DATA               u   COPY middleware_refs (id, title, ident, iface_ident, reflection_id, reaction_id, created_at, updated_at) FROM stdin;
    public       postgres    false    309   E7                 0    0    middleware_refs_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('middleware_refs_id_seq', 1, true);
            public       postgres    false    308            l          0    19032    middlewares 
   TABLE DATA               b   COPY middlewares (id, ident, iface_ident, reaction_id, created_at, updated_at, title) FROM stdin;
    public       postgres    false    307   �7                 0    0    middlewares_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('middlewares_id_seq', 5, true);
            public       postgres    false    306            #          0    16618 
   oauth1info 
   TABLE DATA               ?   COPY oauth1info (id, token, secret, "loginInfoId") FROM stdin;
    public       postgres    false    234   8                 0    0    oauth1info_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('oauth1info_id_seq', 1, false);
            public       postgres    false    235            %          0    16626 
   oauth2info 
   TABLE DATA               _   COPY oauth2info (id, accesstoken, tokentype, expiresin, refreshtoken, logininfoid) FROM stdin;
    public       postgres    false    236   58                 0    0    oauth2info_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('oauth2info_id_seq', 1, false);
            public       postgres    false    237            '          0    16634 	   observers 
   TABLE DATA               \   COPY observers (id, station_id, bprocess_id, hash_code, "fullName", created_at) FROM stdin;
    public       postgres    false    238   R8                 0    0    observers_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('observers_id_seq', 1, false);
            public       postgres    false    239            )          0    16642    openidattributes 
   TABLE DATA               3   COPY openidattributes (id, key, value) FROM stdin;
    public       postgres    false    240   o8      *          0    16648 
   openidinfo 
   TABLE DATA               .   COPY openidinfo (id, logininfoid) FROM stdin;
    public       postgres    false    241   �8      +          0    16654    passwordinfo 
   TABLE DATA               F   COPY passwordinfo (hasher, password, salt, "loginInfoId") FROM stdin;
    public       postgres    false    242   �8      ,          0    16660    plans 
   TABLE DATA               W   COPY plans (id, title, price, description, slot_included, "order", hidden) FROM stdin;
    public       postgres    false    243   �D                 0    0    plans_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('plans_id_seq', 3, true);
            public       postgres    false    244            .          0    16671    proc_element_reflections 
   TABLE DATA               �   COPY proc_element_reflections (id, reflection_id, title, "desc", b_type, type_title, ref_space_id, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    245   ,E                 0    0    proc_element_reflections_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('proc_element_reflections_id_seq', 26, true);
            public       postgres    false    246            0          0    16679    proc_elements 
   TABLE DATA               �   COPY proc_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, space_id, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    247   eF                 0    0    proc_elements_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('proc_elements_id_seq', 353, true);
            public       postgres    false    248            2          0    16687    process_histories 
   TABLE DATA               ]   COPY process_histories (id, master_acc, action, process_id, what, what_id, date) FROM stdin;
    public       postgres    false    249   JL                 0    0    process_histories_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('process_histories_id_seq', 578, true);
            public       postgres    false    250            4          0    16695    process_permissions 
   TABLE DATA               t   COPY process_permissions (id, uid, group_id, bprocess, front_elem_id, space_elem_id, reaction_id, role) FROM stdin;
    public       postgres    false    251   �o                 0    0    process_permissions_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('process_permissions_id_seq', 36, true);
            public       postgres    false    252            6          0    16703    reaction_refs 
   TABLE DATA               w   COPY reaction_refs (id, reflection_id, autostart, element_id, state_ref_id, created_at, updated_at, title) FROM stdin;
    public       postgres    false    253   ip                 0    0    reaction_refs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('reaction_refs_id_seq', 5, true);
            public       postgres    false    254            8          0    16708    reaction_state_out_refs 
   TABLE DATA               t   COPY reaction_state_out_refs (id, reaction_id, state_ref, "on", on_rate, created_at, updated_at, input) FROM stdin;
    public       postgres    false    255   �p                 0    0    reaction_state_out_refs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('reaction_state_out_refs_id_seq', 4, true);
            public       postgres    false    256            :          0    16714    reaction_state_outs 
   TABLE DATA               o   COPY reaction_state_outs (id, reaction_id, state_id, "on", on_rate, created_at, updated_at, input) FROM stdin;
    public       postgres    false    257   )q                  0    0    reaction_state_outs_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('reaction_state_outs_id_seq', 117, true);
            public       postgres    false    258            <          0    16720 	   reactions 
   TABLE DATA               q   COPY reactions (id, bprocess_id, autostart, element_id, state_ref_id, created_at, updated_at, title) FROM stdin;
    public       postgres    false    259   �r      !           0    0    reactions_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('reactions_id_seq', 131, true);
            public       postgres    false    260            �          0    19456    reflect_action_mappings 
   TABLE DATA               q   COPY reflect_action_mappings (id, reflection_id, ref_action, element_action, created_at, updated_at) FROM stdin;
    public       postgres    false    345   rt      "           0    0    reflect_action_mappings_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('reflect_action_mappings_id_seq', 37, true);
            public       postgres    false    344            �          0    19433    reflect_element_mappings 
   TABLE DATA               }   COPY reflect_element_mappings (id, reflection_id, topology_element_id, ref_topo_element, created_at, updated_at) FROM stdin;
    public       postgres    false    343   �u      #           0    0    reflect_element_mappings_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('reflect_element_mappings_id_seq', 37, true);
            public       postgres    false    342            >          0    16725    reflected_elem_topologs 
   TABLE DATA               �   COPY reflected_elem_topologs (id, reflection_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
    public       postgres    false    261   �w      $           0    0    reflected_elem_topologs_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('reflected_elem_topologs_id_seq', 23, true);
            public       postgres    false    262            @          0    16730    refs 
   TABLE DATA               Z   COPY refs (id, title, host, created_at, updated_at, "desc", category, hidden) FROM stdin;
    public       postgres    false    263   �w      %           0    0    refs_id_seq    SEQUENCE SET     3   SELECT pg_catalog.setval('refs_id_seq', 28, true);
            public       postgres    false    264            B          0    16740 	   resources 
   TABLE DATA               L   COPY resources (id, title, business_id, created_at, updated_at) FROM stdin;
    public       postgres    false    265   fy      &           0    0    resources_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('resources_id_seq', 30, true);
            public       postgres    false    266            D          0    16748    session_elem_topologs 
   TABLE DATA               �   COPY session_elem_topologs (id, process_id, session_id, front_elem_id, space_elem_id, hash, created_at, updated_at, space_id) FROM stdin;
    public       postgres    false    267   2z      '           0    0    session_elem_topologs_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session_elem_topologs_id_seq', 662, true);
            public       postgres    false    268            F          0    16756    session_element_resources 
   TABLE DATA               �   COPY session_element_resources (id, session_element_id, process_id, session_id, resource_id, entities, created_at, updated_at) FROM stdin;
    public       postgres    false    269   �}      (           0    0     session_element_resources_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('session_element_resources_id_seq', 36, true);
            public       postgres    false    270            H          0    16765    session_initial_states 
   TABLE DATA               �   COPY session_initial_states (id, process_id, session_id, title, neutral, is_process_state, "on", on_rate, ses_front_elem_id, ses_space_elem_id, ses_space_id, created_at, updated_at, lang, middle, middleable, oposite, opositable) FROM stdin;
    public       postgres    false    271   1~      )           0    0    session_initial_states_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('session_initial_states_id_seq', 1760, true);
            public       postgres    false    272            J          0    16781    session_proc_elements 
   TABLE DATA               �   COPY session_proc_elements (id, title, "desc", business_id, bprocess_id, session_id, b_type, type_title, space_id, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    273   L�      *           0    0    session_proc_elements_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session_proc_elements_id_seq', 663, true);
            public       postgres    false    274            L          0    16789    session_reaction_state_outs 
   TABLE DATA                  COPY session_reaction_state_outs (id, session_state_id, reaction_id, "on", on_rate, created_at, updated_at, input) FROM stdin;
    public       postgres    false    275   �      +           0    0 "   session_reaction_state_outs_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('session_reaction_state_outs_id_seq', 557, true);
            public       postgres    false    276            N          0    16795    session_reactions 
   TABLE DATA               �   COPY session_reactions (id, bprocess_id, session_id, autostart, element_id, state_ref_id, title, created_at, updated_at) FROM stdin;
    public       postgres    false    277   �      ,           0    0    session_reactions_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('session_reactions_id_seq', 594, true);
            public       postgres    false    278            P          0    16803    session_space_elements 
   TABLE DATA               �   COPY session_space_elements (id, title, "desc", business_id, bprocess_id, session_id, b_type, type_title, own_space_id, owned_space_id, space_role, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    279   	�      -           0    0    session_space_elements_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('session_space_elements_id_seq', 26, true);
            public       postgres    false    280            R          0    16811    session_spaces 
   TABLE DATA               �   COPY session_spaces (id, process_id, session_id, index, container, subbrick, brick_front_id, brick_nested_id, nesting_level, created_at, updated_at) FROM stdin;
    public       postgres    false    281   &�      .           0    0    session_spaces_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('session_spaces_id_seq', 34, true);
            public       postgres    false    282            T          0    16818    session_state_logs 
   TABLE DATA               n   COPY session_state_logs (id, session_id, "on", on_rate, reason, created_at, updated_at, state_id) FROM stdin;
    public       postgres    false    283   ��      /           0    0    session_state_logs_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('session_state_logs_id_seq', 2081, true);
            public       postgres    false    284            V          0    16825    session_switchers 
   TABLE DATA               �   COPY session_switchers (id, bprocess_id, session_id, switch_type, priority, session_state_ref_id, session_state_id, fn, target, override_group, created_at, updated_at) FROM stdin;
    public       postgres    false    285   ��      0           0    0    session_switchers_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('session_switchers_id_seq', 1236, true);
            public       postgres    false    286            X          0    16835    sessionstates 
   TABLE DATA               -  COPY sessionstates (id, process_id, session_id, title, neutral, is_process_state, front_elem_id, space_elem_id, created_at, updated_at, lang, space_id, "on", on_rate, origin_state_id, middle, middleable, oposite, opositable, session_front_elem_id, session_space_id, session_space_elem_id) FROM stdin;
    public       postgres    false    287   �      1           0    0    sessionstates_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('sessionstates_id_seq', 3091, true);
            public       postgres    false    288            Z          0    16851    space_element_reflections 
   TABLE DATA               �   COPY space_element_reflections (id, reflection_id, title, "desc", b_type, type_title, ref_space_id, ref_space_owned_id, space_role, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    289   E�      2           0    0     space_element_reflections_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('space_element_reflections_id_seq', 3, false);
            public       postgres    false    290            \          0    16859    space_elements 
   TABLE DATA               �   COPY space_elements (id, title, "desc", business_id, bprocess_id, b_type, type_title, own_space_id, owned_space_id, space_role, "order", created_at, updated_at) FROM stdin;
    public       postgres    false    291   ��      3           0    0    space_elements_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('space_elements_id_seq', 59, true);
            public       postgres    false    292            ^          0    16867 
   space_refs 
   TABLE DATA               �   COPY space_refs (id, reflection_id, index, container, subbrick, brick_front, brick_nested, "nestingLevel", created_at, updated_at) FROM stdin;
    public       postgres    false    293   �      4           0    0    space_refs_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('space_refs_id_seq', 3, true);
            public       postgres    false    294            `          0    16872 
   state_refs 
   TABLE DATA               �   COPY state_refs (id, reflection_id, title, neutral, process_state, "on", on_rate, ref_front_elem_id, ref_space_elem_id, created_at, updated_at, lang, ref_space_id, middle, middleable, oposite, opositable) FROM stdin;
    public       postgres    false    295   O�      5           0    0    state_refs_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('state_refs_id_seq', 29, true);
            public       postgres    false    296            r          0    19090 
   strategies 
   TABLE DATA               a   COPY strategies (id, ident, middleware_id, is_null_strategy, created_at, updated_at) FROM stdin;
    public       postgres    false    313   k�      6           0    0    strategies_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('strategies_id_seq', 5, true);
            public       postgres    false    312            t          0    19106    strategy_base_refs 
   TABLE DATA               �   COPY strategy_base_refs (id, strategy_id, key, base_type, value_type, value_content, validation_scheme, validation_pattern, created_at, updated_at) FROM stdin;
    public       postgres    false    315   �      7           0    0    strategy_base_refs_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('strategy_base_refs_id_seq', 1, true);
            public       postgres    false    314            v          0    19122    strategy_bases 
   TABLE DATA               �   COPY strategy_bases (id, strategy_id, key, base_type, value_type, value_content, validation_scheme, validation_pattern, created_at, updated_at) FROM stdin;
    public       postgres    false    317   !�      8           0    0    strategy_bases_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('strategy_bases_id_seq', 5, true);
            public       postgres    false    316            x          0    19138    strategy_input_refs 
   TABLE DATA               v   COPY strategy_input_refs (id, strategy_id, op, title, "desc", ident, target_type, created_at, updated_at) FROM stdin;
    public       postgres    false    319   ��      9           0    0    strategy_input_refs_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('strategy_input_refs_id_seq', 1, false);
            public       postgres    false    318            z          0    19154    strategy_inputs 
   TABLE DATA               r   COPY strategy_inputs (id, strategy_id, op, title, "desc", ident, target_type, created_at, updated_at) FROM stdin;
    public       postgres    false    321   �      :           0    0    strategy_inputs_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('strategy_inputs_id_seq', 1, false);
            public       postgres    false    320            |          0    19170    strategy_output_refs 
   TABLE DATA               w   COPY strategy_output_refs (id, strategy_id, op, title, "desc", ident, target_type, created_at, updated_at) FROM stdin;
    public       postgres    false    323   6�      ;           0    0    strategy_output_refs_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('strategy_output_refs_id_seq', 1, false);
            public       postgres    false    322            ~          0    19186    strategy_outputs 
   TABLE DATA               s   COPY strategy_outputs (id, strategy_id, op, title, "desc", ident, target_type, created_at, updated_at) FROM stdin;
    public       postgres    false    325   S�      <           0    0    strategy_outputs_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('strategy_outputs_id_seq', 1, false);
            public       postgres    false    324            p          0    19069    strategy_refs 
   TABLE DATA               s   COPY strategy_refs (id, ident, reflection_id, middleware_id, is_null_strategy, created_at, updated_at) FROM stdin;
    public       postgres    false    311   p�      =           0    0    strategy_refs_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('strategy_refs_id_seq', 1, true);
            public       postgres    false    310            b          0    16888    switcher_refs 
   TABLE DATA               �   COPY switcher_refs (id, reflection_id, switch_type, priority, state_ref_id, fn, target, created_at, updated_at, override_group) FROM stdin;
    public       postgres    false    297   ��      >           0    0    switcher_refs_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('switcher_refs_id_seq', 15, true);
            public       postgres    false    298            d          0    16898    tokens 
   TABLE DATA               T   COPY tokens (uuid, email, "creationTime", "expirationTime", "isSignUp") FROM stdin;
    public       postgres    false    299   ]�      e          0    16904    user 
   TABLE DATA               \   COPY "user" ("userID", "firstName", "lastName", "fullName", email, "avatarURL") FROM stdin;
    public       postgres    false    300   �      f          0    16910    userlogininfo 
   TABLE DATA               9   COPY userlogininfo ("userID", "loginInfoId") FROM stdin;
    public       postgres    false    301   ��      @
           2606    16976    account_group_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_group DROP CONSTRAINT account_group_pkey;
       public         postgres    false    173    173            B
           2606    16978    account_infos_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY account_infos
    ADD CONSTRAINT account_infos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_infos DROP CONSTRAINT account_infos_pkey;
       public         postgres    false    175    175            D
           2606    16980    account_loggers_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY account_loggers
    ADD CONSTRAINT account_loggers_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.account_loggers DROP CONSTRAINT account_loggers_pkey;
       public         postgres    false    177    177            F
           2606    16982    account_plan_history_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT account_plan_history_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.account_plan_history DROP CONSTRAINT account_plan_history_pkey;
       public         postgres    false    180    180            H
           2606    16984    account_plans_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_pkey;
       public         postgres    false    181    181            J
           2606    16986    accounts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY ("userId");
 @   ALTER TABLE ONLY public.accounts DROP CONSTRAINT accounts_pkey;
       public         postgres    false    183    183            �
           2606    19318    action_act_results_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY action_act_results
    ADD CONSTRAINT action_act_results_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.action_act_results DROP CONSTRAINT action_act_results_pkey;
       public         postgres    false    337    337            �
           2606    19340    action_acts_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY action_acts
    ADD CONSTRAINT action_acts_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.action_acts DROP CONSTRAINT action_acts_pkey;
       public         postgres    false    341    341            �
           2606    19329    action_statuses_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY action_statuses
    ADD CONSTRAINT action_statuses_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.action_statuses DROP CONSTRAINT action_statuses_pkey;
       public         postgres    false    339    339            L
           2606    16988    billing_infos_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY billing_infos
    ADD CONSTRAINT billing_infos_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.billing_infos DROP CONSTRAINT billing_infos_pkey;
       public         postgres    false    184    184            N
           2606    16990 
   bills_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_pkey;
       public         postgres    false    186    186            P
           2606    16992    bploggers_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY bploggers
    ADD CONSTRAINT bploggers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.bploggers DROP CONSTRAINT bploggers_pkey;
       public         postgres    false    188    188            R
           2606    16994    bprocesses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bprocesses DROP CONSTRAINT bprocesses_pkey;
       public         postgres    false    190    190            T
           2606    16996    bpsessions_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bpsessions
    ADD CONSTRAINT bpsessions_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bpsessions DROP CONSTRAINT bpsessions_pkey;
       public         postgres    false    192    192            V
           2606    16998    bpspaces_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY bpspaces
    ADD CONSTRAINT bpspaces_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.bpspaces DROP CONSTRAINT bpspaces_pkey;
       public         postgres    false    194    194            X
           2606    17000    bpstaterefs_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.bpstaterefs DROP CONSTRAINT bpstaterefs_pkey;
       public         postgres    false    196    196            Z
           2606    17002    bpstates_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_pkey;
       public         postgres    false    198    198            \
           2606    17004    bpstation_loggers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY bpstation_loggers
    ADD CONSTRAINT bpstation_loggers_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.bpstation_loggers DROP CONSTRAINT bpstation_loggers_pkey;
       public         postgres    false    200    200            ^
           2606    17006    bpstations_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY bpstations
    ADD CONSTRAINT bpstations_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.bpstations DROP CONSTRAINT bpstations_pkey;
       public         postgres    false    202    202            `
           2606    17008    bpswitchers_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.bpswitchers DROP CONSTRAINT bpswitchers_pkey;
       public         postgres    false    204    204            b
           2606    17010    business_services_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY business_services
    ADD CONSTRAINT business_services_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.business_services DROP CONSTRAINT business_services_pkey;
       public         postgres    false    206    206            d
           2606    17012    businesses_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY businesses
    ADD CONSTRAINT businesses_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.businesses DROP CONSTRAINT businesses_pkey;
       public         postgres    false    208    208            f
           2606    17014    cached_removed_resources_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY cached_removed_resources
    ADD CONSTRAINT cached_removed_resources_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.cached_removed_resources DROP CONSTRAINT cached_removed_resources_pkey;
       public         postgres    false    210    210            h
           2606    17016    client_observers_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY client_observers
    ADD CONSTRAINT client_observers_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.client_observers DROP CONSTRAINT client_observers_pkey;
       public         postgres    false    212    212            j
           2606    17018    elem_topologs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_pkey;
       public         postgres    false    214    214            l
           2606    17020    element_resources_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT element_resources_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT element_resources_pkey;
       public         postgres    false    216    216            n
           2606    17022    employees_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public         postgres    false    218    218            �
           2606    19016 
   files_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.files DROP CONSTRAINT files_pkey;
       public         postgres    false    303    303            p
           2606    17024    groups_pkey 
   CONSTRAINT     I   ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_pkey;
       public         postgres    false    221    221            r
           2606    17026    input_loggers_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT input_loggers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.input_loggers DROP CONSTRAINT input_loggers_pkey;
       public         postgres    false    224    224            t
           2606    17028    launch_counters_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY launch_counters
    ADD CONSTRAINT launch_counters_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.launch_counters DROP CONSTRAINT launch_counters_pkey;
       public         postgres    false    226    226            �
           2606    19024    launch_files_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY launch_files
    ADD CONSTRAINT launch_files_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.launch_files DROP CONSTRAINT launch_files_pkey;
       public         postgres    false    305    305            �
           2606    19210    launch_middlewares_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY launch_middlewares
    ADD CONSTRAINT launch_middlewares_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.launch_middlewares DROP CONSTRAINT launch_middlewares_pkey;
       public         postgres    false    327    327            v
           2606    17030    launch_shares_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.launch_shares DROP CONSTRAINT launch_shares_pkey;
       public         postgres    false    228    228            �
           2606    19231    launch_strategies_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY launch_strategies
    ADD CONSTRAINT launch_strategies_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.launch_strategies DROP CONSTRAINT launch_strategies_pkey;
       public         postgres    false    329    329            �
           2606    19252    launch_strategy_bases_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY launch_strategy_bases
    ADD CONSTRAINT launch_strategy_bases_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.launch_strategy_bases DROP CONSTRAINT launch_strategy_bases_pkey;
       public         postgres    false    331    331            �
           2606    19268    launch_strategy_inputs_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY launch_strategy_inputs
    ADD CONSTRAINT launch_strategy_inputs_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.launch_strategy_inputs DROP CONSTRAINT launch_strategy_inputs_pkey;
       public         postgres    false    333    333            �
           2606    19284    launch_strategy_outputs_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY launch_strategy_outputs
    ADD CONSTRAINT launch_strategy_outputs_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.launch_strategy_outputs DROP CONSTRAINT launch_strategy_outputs_pkey;
       public         postgres    false    335    335            x
           2606    17032    launch_warps_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.launch_warps DROP CONSTRAINT launch_warps_pkey;
       public         postgres    false    230    230            z
           2606    17034    logininfo_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY logininfo
    ADD CONSTRAINT logininfo_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.logininfo DROP CONSTRAINT logininfo_pkey;
       public         postgres    false    232    232            �
           2606    19056    middleware_refs_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY middleware_refs
    ADD CONSTRAINT middleware_refs_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.middleware_refs DROP CONSTRAINT middleware_refs_pkey;
       public         postgres    false    309    309            �
           2606    19040    middlewares_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY middlewares
    ADD CONSTRAINT middlewares_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.middlewares DROP CONSTRAINT middlewares_pkey;
       public         postgres    false    307    307            |
           2606    17036    oauth1info_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY oauth1info
    ADD CONSTRAINT oauth1info_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.oauth1info DROP CONSTRAINT oauth1info_pkey;
       public         postgres    false    234    234            ~
           2606    17038    oauth2info_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY oauth2info
    ADD CONSTRAINT oauth2info_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.oauth2info DROP CONSTRAINT oauth2info_pkey;
       public         postgres    false    236    236            �
           2606    17040    observers_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.observers DROP CONSTRAINT observers_pkey;
       public         postgres    false    238    238            �
           2606    17042    openidinfo_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY openidinfo
    ADD CONSTRAINT openidinfo_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.openidinfo DROP CONSTRAINT openidinfo_pkey;
       public         postgres    false    241    241            �
           2606    17044 
   plans_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY plans
    ADD CONSTRAINT plans_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.plans DROP CONSTRAINT plans_pkey;
       public         postgres    false    243    243            �
           2606    17046    proc_element_reflections_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY proc_element_reflections
    ADD CONSTRAINT proc_element_reflections_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.proc_element_reflections DROP CONSTRAINT proc_element_reflections_pkey;
       public         postgres    false    245    245            �
           2606    17048    proc_elements_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.proc_elements DROP CONSTRAINT proc_elements_pkey;
       public         postgres    false    247    247            �
           2606    17050    process_histories_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY process_histories
    ADD CONSTRAINT process_histories_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.process_histories DROP CONSTRAINT process_histories_pkey;
       public         postgres    false    249    249            �
           2606    17052    process_permissions_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_pkey;
       public         postgres    false    251    251            �
           2606    17054    reaction_refs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_pkey;
       public         postgres    false    253    253            �
           2606    17056    reaction_state_out_refs_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.reaction_state_out_refs DROP CONSTRAINT reaction_state_out_refs_pkey;
       public         postgres    false    255    255            �
           2606    17058    reaction_state_outs_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.reaction_state_outs DROP CONSTRAINT reaction_state_outs_pkey;
       public         postgres    false    257    257            �
           2606    17060    reactions_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_pkey;
       public         postgres    false    259    259            �
           2606    19461    reflect_action_mappings_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY reflect_action_mappings
    ADD CONSTRAINT reflect_action_mappings_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.reflect_action_mappings DROP CONSTRAINT reflect_action_mappings_pkey;
       public         postgres    false    345    345            �
           2606    19438    reflect_element_mappings_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY reflect_element_mappings
    ADD CONSTRAINT reflect_element_mappings_pkey PRIMARY KEY (id);
 `   ALTER TABLE ONLY public.reflect_element_mappings DROP CONSTRAINT reflect_element_mappings_pkey;
       public         postgres    false    343    343            �
           2606    17062    reflected_elem_topologs_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_pkey PRIMARY KEY (id);
 ^   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_pkey;
       public         postgres    false    261    261            �
           2606    17064 	   refs_pkey 
   CONSTRAINT     E   ALTER TABLE ONLY refs
    ADD CONSTRAINT refs_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.refs DROP CONSTRAINT refs_pkey;
       public         postgres    false    263    263            �
           2606    17066    refs_title_key 
   CONSTRAINT     H   ALTER TABLE ONLY refs
    ADD CONSTRAINT refs_title_key UNIQUE (title);
 =   ALTER TABLE ONLY public.refs DROP CONSTRAINT refs_title_key;
       public         postgres    false    263    263            �
           2606    17068    resources_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY resources
    ADD CONSTRAINT resources_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.resources DROP CONSTRAINT resources_pkey;
       public         postgres    false    265    265            �
           2606    17070    session_elem_topologs_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT session_elem_topologs_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT session_elem_topologs_pkey;
       public         postgres    false    267    267            �
           2606    17072    session_element_resources_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT session_element_resources_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT session_element_resources_pkey;
       public         postgres    false    269    269            �
           2606    17074    session_initial_states_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT session_initial_states_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT session_initial_states_pkey;
       public         postgres    false    271    271            �
           2606    17076    session_proc_elements_pkey 
   CONSTRAINT     g   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT session_proc_elements_pkey PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT session_proc_elements_pkey;
       public         postgres    false    273    273            �
           2606    17078     session_reaction_state_outs_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT session_reaction_state_outs_pkey PRIMARY KEY (id);
 f   ALTER TABLE ONLY public.session_reaction_state_outs DROP CONSTRAINT session_reaction_state_outs_pkey;
       public         postgres    false    275    275            �
           2606    17080    session_reactions_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT session_reactions_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT session_reactions_pkey;
       public         postgres    false    277    277            �
           2606    17082    session_space_elements_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT session_space_elements_pkey PRIMARY KEY (id);
 \   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT session_space_elements_pkey;
       public         postgres    false    279    279            �
           2606    17084    session_spaces_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT session_spaces_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.session_spaces DROP CONSTRAINT session_spaces_pkey;
       public         postgres    false    281    281            �
           2606    17086    session_state_logs_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.session_state_logs DROP CONSTRAINT session_state_logs_pkey;
       public         postgres    false    283    283            �
           2606    17088    session_switchers_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT session_switchers_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT session_switchers_pkey;
       public         postgres    false    285    285            �
           2606    17090    sessionstates_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT sessionstates_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT sessionstates_pkey;
       public         postgres    false    287    287            �
           2606    17092    space_element_reflections_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY space_element_reflections
    ADD CONSTRAINT space_element_reflections_pkey PRIMARY KEY (id);
 b   ALTER TABLE ONLY public.space_element_reflections DROP CONSTRAINT space_element_reflections_pkey;
       public         postgres    false    289    289            �
           2606    17094    space_elements_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_pkey;
       public         postgres    false    291    291            �
           2606    17096    space_refs_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY space_refs
    ADD CONSTRAINT space_refs_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.space_refs DROP CONSTRAINT space_refs_pkey;
       public         postgres    false    293    293            �
           2606    17098    state_refs_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_pkey;
       public         postgres    false    295    295            �
           2606    19098    strategies_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY strategies
    ADD CONSTRAINT strategies_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.strategies DROP CONSTRAINT strategies_pkey;
       public         postgres    false    313    313            �
           2606    19114    strategy_base_refs_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY strategy_base_refs
    ADD CONSTRAINT strategy_base_refs_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.strategy_base_refs DROP CONSTRAINT strategy_base_refs_pkey;
       public         postgres    false    315    315            �
           2606    19130    strategy_bases_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY strategy_bases
    ADD CONSTRAINT strategy_bases_pkey PRIMARY KEY (id);
 L   ALTER TABLE ONLY public.strategy_bases DROP CONSTRAINT strategy_bases_pkey;
       public         postgres    false    317    317            �
           2606    19146    strategy_input_refs_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY strategy_input_refs
    ADD CONSTRAINT strategy_input_refs_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.strategy_input_refs DROP CONSTRAINT strategy_input_refs_pkey;
       public         postgres    false    319    319            �
           2606    19162    strategy_inputs_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY strategy_inputs
    ADD CONSTRAINT strategy_inputs_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.strategy_inputs DROP CONSTRAINT strategy_inputs_pkey;
       public         postgres    false    321    321            �
           2606    19178    strategy_output_refs_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY strategy_output_refs
    ADD CONSTRAINT strategy_output_refs_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.strategy_output_refs DROP CONSTRAINT strategy_output_refs_pkey;
       public         postgres    false    323    323            �
           2606    19194    strategy_outputs_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY strategy_outputs
    ADD CONSTRAINT strategy_outputs_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.strategy_outputs DROP CONSTRAINT strategy_outputs_pkey;
       public         postgres    false    325    325            �
           2606    19077    strategy_refs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY strategy_refs
    ADD CONSTRAINT strategy_refs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.strategy_refs DROP CONSTRAINT strategy_refs_pkey;
       public         postgres    false    311    311            �
           2606    17100    switcher_refs_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.switcher_refs DROP CONSTRAINT switcher_refs_pkey;
       public         postgres    false    297    297            �
           2606    17102 	   user_pkey 
   CONSTRAINT     M   ALTER TABLE ONLY "user"
    ADD CONSTRAINT user_pkey PRIMARY KEY ("userID");
 :   ALTER TABLE ONLY public."user" DROP CONSTRAINT user_pkey;
       public         postgres    false    300    300            �
           2606    17103    acc_group_employee_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_group
    ADD CONSTRAINT acc_group_employee_fk FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.account_group DROP CONSTRAINT acc_group_employee_fk;
       public       postgres    false    173    2670    218            �
           2606    17108     acc_info_current_biz_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_infos
    ADD CONSTRAINT acc_info_current_biz_business_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.account_infos DROP CONSTRAINT acc_info_current_biz_business_fk;
       public       postgres    false    208    175    2660            �
           2606    17123    account_group_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_group
    ADD CONSTRAINT account_group_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.account_group DROP CONSTRAINT account_group_group_id_fkey;
       public       postgres    false    2672    221    173            �
           2606    17128    account_plans_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);
 V   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_business_id_fkey;
       public       postgres    false    2660    181    208            �
           2606    17133    account_plans_plan_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY account_plans
    ADD CONSTRAINT account_plans_plan_id_fkey FOREIGN KEY (plan_id) REFERENCES plans(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.account_plans DROP CONSTRAINT account_plans_plan_id_fkey;
       public       postgres    false    181    243    2692            q           2606    19341    action_acts_reaction_fk    FK CONSTRAINT     �   ALTER TABLE ONLY action_acts
    ADD CONSTRAINT action_acts_reaction_fk FOREIGN KEY (reaction) REFERENCES session_reactions(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.action_acts DROP CONSTRAINT action_acts_reaction_fk;
       public       postgres    false    341    277    2728            r           2606    19346    action_acts_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY action_acts
    ADD CONSTRAINT action_acts_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.action_acts DROP CONSTRAINT action_acts_session_fk;
       public       postgres    false    341    192    2644            �
           2606    17138    bill_his_fk    FK CONSTRAINT     �   ALTER TABLE ONLY account_plan_history
    ADD CONSTRAINT bill_his_fk FOREIGN KEY (bill_id) REFERENCES bills(id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.account_plan_history DROP CONSTRAINT bill_his_fk;
       public       postgres    false    2638    180    186            �
           2606    17143    billing_infos_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY billing_infos
    ADD CONSTRAINT billing_infos_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.billing_infos DROP CONSTRAINT billing_infos_business_id_fkey;
       public       postgres    false    208    2660    184            �
           2606    17148    bills_current_biz_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY bills
    ADD CONSTRAINT bills_current_biz_business_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.bills DROP CONSTRAINT bills_current_biz_business_fk;
       public       postgres    false    2660    208    186            �
           2606    17158    bprocesses_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.bprocesses DROP CONSTRAINT bprocesses_business_id_fkey;
       public       postgres    false    208    2660    190            �
           2606    17163    bprocesses_service_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bprocesses
    ADD CONSTRAINT bprocesses_service_id_fkey FOREIGN KEY (service_id) REFERENCES business_services(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bprocesses DROP CONSTRAINT bprocesses_service_id_fkey;
       public       postgres    false    190    2658    206            �
           2606    17168    bpsessions_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpsessions
    ADD CONSTRAINT bpsessions_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpsessions DROP CONSTRAINT bpsessions_process_id_fkey;
       public       postgres    false    190    2642    192            �
           2606    17173    bpspaces_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpspaces
    ADD CONSTRAINT bpspaces_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.bpspaces DROP CONSTRAINT bpspaces_process_id_fkey;
       public       postgres    false    194    190    2642            �
           2606    17178    bpstaterefs_session_state_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_session_state_fkey FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.bpstaterefs DROP CONSTRAINT bpstaterefs_session_state_fkey;
       public       postgres    false    287    2738    196            �
           2606    17183    bpstaterefs_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstaterefs
    ADD CONSTRAINT bpstaterefs_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpstaterefs DROP CONSTRAINT bpstaterefs_state_id_fkey;
       public       postgres    false    2650    196    198            �
           2606    17188    bpstates_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_front_elem_id_fkey;
       public       postgres    false    2696    198    247            �
           2606    17193    bpstates_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_process_id_fkey;
       public       postgres    false    2642    190    198            �
           2606    17198    bpstates_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstates
    ADD CONSTRAINT bpstates_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.bpstates DROP CONSTRAINT bpstates_space_elem_id_fkey;
       public       postgres    false    291    2742    198            �
           2606    17203    bpstations_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpstations
    ADD CONSTRAINT bpstations_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpstations DROP CONSTRAINT bpstations_session_id_fkey;
       public       postgres    false    202    192    2644            �
           2606    17208    bpswitchers_session_state_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_session_state_fkey FOREIGN KEY (session_state) REFERENCES sessionstates(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.bpswitchers DROP CONSTRAINT bpswitchers_session_state_fkey;
       public       postgres    false    2738    287    204                        2606    17213    bpswitchers_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY bpswitchers
    ADD CONSTRAINT bpswitchers_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.bpswitchers DROP CONSTRAINT bpswitchers_state_id_fkey;
       public       postgres    false    2650    204    198                       2606    17218 "   business_services_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY business_services
    ADD CONSTRAINT business_services_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id);
 ^   ALTER TABLE ONLY public.business_services DROP CONSTRAINT business_services_business_id_fkey;
       public       postgres    false    2660    206    208                       2606    17223 	   el_res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT el_res_fk FOREIGN KEY (element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT el_res_fk;
       public       postgres    false    2666    216    214                       2606    17228    el_res_sp_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT el_res_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT el_res_sp_bprocess_fk;
       public       postgres    false    2642    216    190                       2606    17233     elem_topologs_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_front_elem_id_fkey;
       public       postgres    false    214    2696    247                       2606    17238    elem_topologs_process_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_process_id_fkey FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_process_id_fkey;
       public       postgres    false    2642    190    214                       2606    17243     elem_topologs_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_space_elem_id_fkey;
       public       postgres    false    291    2742    214                       2606    17248    elem_topologs_space_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY elem_topologs
    ADD CONSTRAINT elem_topologs_space_id_fkey FOREIGN KEY (space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.elem_topologs DROP CONSTRAINT elem_topologs_space_id_fkey;
       public       postgres    false    214    2646    194            	           2606    17253    emp_workbench_fk    FK CONSTRAINT     �   ALTER TABLE ONLY employees
    ADD CONSTRAINT emp_workbench_fk FOREIGN KEY (workbench_id) REFERENCES businesses(id) ON DELETE CASCADE;
 D   ALTER TABLE ONLY public.employees DROP CONSTRAINT emp_workbench_fk;
       public       postgres    false    218    2660    208            
           2606    17258 %   employees_businesses_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT employees_businesses_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.employees_businesses DROP CONSTRAINT employees_businesses_business_id_fkey;
       public       postgres    false    208    2660    219                       2606    17263 %   employees_businesses_employee_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY employees_businesses
    ADD CONSTRAINT employees_businesses_employee_id_fkey FOREIGN KEY (employee_id) REFERENCES employees(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.employees_businesses DROP CONSTRAINT employees_businesses_employee_id_fkey;
       public       postgres    false    219    2670    218                       2606    17268    groups_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY groups
    ADD CONSTRAINT groups_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.groups DROP CONSTRAINT groups_business_id_fkey;
       public       postgres    false    2660    208    221                       2606    17273    input_loggers_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY input_loggers
    ADD CONSTRAINT input_loggers_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.input_loggers DROP CONSTRAINT input_loggers_session_id_fkey;
       public       postgres    false    192    224    2644                       2606    17278    launch_counters_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_counters
    ADD CONSTRAINT launch_counters_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.launch_counters DROP CONSTRAINT launch_counters_bprocess_fk;
       public       postgres    false    226    2642    190            ]           2606    19025    launch_files_file_id_pkey    FK CONSTRAINT     w   ALTER TABLE ONLY launch_files
    ADD CONSTRAINT launch_files_file_id_pkey FOREIGN KEY (file_id) REFERENCES files(id);
 P   ALTER TABLE ONLY public.launch_files DROP CONSTRAINT launch_files_file_id_pkey;
       public       postgres    false    303    305    2752                       2606    17283    launch_shares_biz_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_biz_business_fk FOREIGN KEY (price) REFERENCES businesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.launch_shares DROP CONSTRAINT launch_shares_biz_business_fk;
       public       postgres    false    228    208    2660                       2606    17288    launch_shares_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_shares
    ADD CONSTRAINT launch_shares_sp_session_fk FOREIGN KEY (title) REFERENCES bpsessions(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.launch_shares DROP CONSTRAINT launch_shares_sp_session_fk;
       public       postgres    false    192    2644    228            n           2606    19253 &   launch_strategy_bases_unit_strategy_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_strategy_bases
    ADD CONSTRAINT launch_strategy_bases_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES launch_strategies(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.launch_strategy_bases DROP CONSTRAINT launch_strategy_bases_unit_strategy_fk;
       public       postgres    false    2778    329    331            o           2606    19269 '   launch_strategy_inputs_unit_strategy_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_strategy_inputs
    ADD CONSTRAINT launch_strategy_inputs_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES launch_strategies(id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.launch_strategy_inputs DROP CONSTRAINT launch_strategy_inputs_unit_strategy_fk;
       public       postgres    false    333    329    2778            l           2606    19232    launch_strategy_middleware_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_strategies
    ADD CONSTRAINT launch_strategy_middleware_fk FOREIGN KEY (middleware_id) REFERENCES launch_middlewares(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.launch_strategies DROP CONSTRAINT launch_strategy_middleware_fk;
       public       postgres    false    327    2776    329            p           2606    19285 (   launch_strategy_outputs_unit_strategy_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_strategy_outputs
    ADD CONSTRAINT launch_strategy_outputs_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES launch_strategies(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.launch_strategy_outputs DROP CONSTRAINT launch_strategy_outputs_unit_strategy_fk;
       public       postgres    false    2778    335    329                       2606    17293    launch_warps_launch_elem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_launch_elem_fk FOREIGN KEY (launch_element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.launch_warps DROP CONSTRAINT launch_warps_launch_elem_fk;
       public       postgres    false    2718    230    267                       2606    17298    launch_warps_launch_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_warps
    ADD CONSTRAINT launch_warps_launch_fk FOREIGN KEY (launch_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.launch_warps DROP CONSTRAINT launch_warps_launch_fk;
       public       postgres    false    2644    192    230            �
           2606    17303    lg_b_fk    FK CONSTRAINT     |   ALTER TABLE ONLY bploggers
    ADD CONSTRAINT lg_b_fk FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;
 ;   ALTER TABLE ONLY public.bploggers DROP CONSTRAINT lg_b_fk;
       public       postgres    false    188    2654    202            �
           2606    17308    lg_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY bploggers
    ADD CONSTRAINT lg_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.bploggers DROP CONSTRAINT lg_bprocess_fk;
       public       postgres    false    188    190    2642            ^           2606    19041    middleware_reaction_fk    FK CONSTRAINT     �   ALTER TABLE ONLY middlewares
    ADD CONSTRAINT middleware_reaction_fk FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;
 L   ALTER TABLE ONLY public.middlewares DROP CONSTRAINT middleware_reaction_fk;
       public       postgres    false    307    259    2708            j           2606    19211    middleware_reaction_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_middlewares
    ADD CONSTRAINT middleware_reaction_fk FOREIGN KEY (reaction_id) REFERENCES session_reactions(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.launch_middlewares DROP CONSTRAINT middleware_reaction_fk;
       public       postgres    false    327    277    2728            k           2606    19216    middleware_reaction_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_middlewares
    ADD CONSTRAINT middleware_reaction_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.launch_middlewares DROP CONSTRAINT middleware_reaction_session_fk;
       public       postgres    false    2644    327    192            m           2606    19237    middleware_reaction_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY launch_strategies
    ADD CONSTRAINT middleware_reaction_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.launch_strategies DROP CONSTRAINT middleware_reaction_session_fk;
       public       postgres    false    192    329    2644            _           2606    19057    middleware_ref_reaction_ref_fk    FK CONSTRAINT     �   ALTER TABLE ONLY middleware_refs
    ADD CONSTRAINT middleware_ref_reaction_ref_fk FOREIGN KEY (reaction_id) REFERENCES reaction_refs(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.middleware_refs DROP CONSTRAINT middleware_ref_reaction_ref_fk;
       public       postgres    false    253    309    2702            `           2606    19062    middleware_ref_reflect_fk    FK CONSTRAINT     �   ALTER TABLE ONLY middleware_refs
    ADD CONSTRAINT middleware_ref_reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.middleware_refs DROP CONSTRAINT middleware_ref_reflect_fk;
       public       postgres    false    2712    263    309            a           2606    19078    middleware_ref_reflect_fk    FK CONSTRAINT     �   ALTER TABLE ONLY strategy_refs
    ADD CONSTRAINT middleware_ref_reflect_fk FOREIGN KEY (middleware_id) REFERENCES middleware_refs(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.strategy_refs DROP CONSTRAINT middleware_ref_reflect_fk;
       public       postgres    false    2758    311    309                       2606    17313    observers_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.observers DROP CONSTRAINT observers_bprocess_id_fkey;
       public       postgres    false    2642    238    190                       2606    17318    observers_station_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY observers
    ADD CONSTRAINT observers_station_id_fkey FOREIGN KEY (station_id) REFERENCES bpstations(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.observers DROP CONSTRAINT observers_station_id_fkey;
       public       postgres    false    238    202    2654                       2606    17323 +   proc_element_reflections_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY proc_element_reflections
    ADD CONSTRAINT proc_element_reflections_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 n   ALTER TABLE ONLY public.proc_element_reflections DROP CONSTRAINT proc_element_reflections_reflection_id_fkey;
       public       postgres    false    245    2712    263                       2606    17328    proc_elements_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.proc_elements DROP CONSTRAINT proc_elements_bprocess_id_fkey;
       public       postgres    false    2642    190    247                       2606    17333    proc_elements_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY proc_elements
    ADD CONSTRAINT proc_elements_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.proc_elements DROP CONSTRAINT proc_elements_business_id_fkey;
       public       postgres    false    2660    208    247                       2606    17343 !   process_permissions_bprocess_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_bprocess_fkey FOREIGN KEY (bprocess) REFERENCES bprocesses(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_bprocess_fkey;
       public       postgres    false    2642    190    251                       2606    17348 &   process_permissions_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_elements(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_front_elem_id_fkey;
       public       postgres    false    247    251    2696                       2606    17353 !   process_permissions_group_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_group_id_fkey FOREIGN KEY (group_id) REFERENCES groups(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_group_id_fkey;
       public       postgres    false    2672    251    221                       2606    17358 $   process_permissions_reaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_reaction_id_fkey;
       public       postgres    false    251    2708    259                       2606    17363 &   process_permissions_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY process_permissions
    ADD CONSTRAINT process_permissions_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_elements(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.process_permissions DROP CONSTRAINT process_permissions_space_elem_id_fkey;
       public       postgres    false    2742    251    291            ?           2606    17368    react_topo_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT react_topo_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT react_topo_s_sp_session_fk;
       public       postgres    false    2644    277    192                       2606    17373    reaction_refs_element_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_element_id_fkey FOREIGN KEY (element_id) REFERENCES reflected_elem_topologs(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_element_id_fkey;
       public       postgres    false    253    2710    261                       2606    17378     reaction_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_reflection_id_fkey;
       public       postgres    false    253    263    2712                       2606    17383    reaction_refs_state_ref_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_refs
    ADD CONSTRAINT reaction_refs_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.reaction_refs DROP CONSTRAINT reaction_refs_state_ref_id_fkey;
       public       postgres    false    295    253    2746                        2606    17388 (   reaction_state_out_refs_reaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reaction_refs(id) ON DELETE CASCADE;
 j   ALTER TABLE ONLY public.reaction_state_out_refs DROP CONSTRAINT reaction_state_out_refs_reaction_id_fkey;
       public       postgres    false    253    255    2702            !           2606    17393 &   reaction_state_out_refs_state_ref_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_out_refs
    ADD CONSTRAINT reaction_state_out_refs_state_ref_fkey FOREIGN KEY (state_ref) REFERENCES state_refs(id) ON DELETE CASCADE;
 h   ALTER TABLE ONLY public.reaction_state_out_refs DROP CONSTRAINT reaction_state_out_refs_state_ref_fkey;
       public       postgres    false    255    295    2746            "           2606    17398 $   reaction_state_outs_reaction_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_reaction_id_fkey FOREIGN KEY (reaction_id) REFERENCES reactions(id) ON DELETE CASCADE;
 b   ALTER TABLE ONLY public.reaction_state_outs DROP CONSTRAINT reaction_state_outs_reaction_id_fkey;
       public       postgres    false    2708    259    257            #           2606    17403 !   reaction_state_outs_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reaction_state_outs
    ADD CONSTRAINT reaction_state_outs_state_id_fkey FOREIGN KEY (state_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.reaction_state_outs DROP CONSTRAINT reaction_state_outs_state_id_fkey;
       public       postgres    false    257    2650    198            $           2606    17408    reactions_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_bprocess_id_fkey;
       public       postgres    false    2642    259    190            %           2606    17413    reactions_element_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_element_id_fkey FOREIGN KEY (element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_element_id_fkey;
       public       postgres    false    214    259    2666            &           2606    17418    reactions_state_ref_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reactions
    ADD CONSTRAINT reactions_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES bpstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.reactions DROP CONSTRAINT reactions_state_ref_id_fkey;
       public       postgres    false    2650    259    198            v           2606    19462 )   reflect_action_mappings_element_action_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reflect_action_mappings
    ADD CONSTRAINT reflect_action_mappings_element_action_fk FOREIGN KEY (element_action) REFERENCES reactions(id) ON DELETE CASCADE;
 k   ALTER TABLE ONLY public.reflect_action_mappings DROP CONSTRAINT reflect_action_mappings_element_action_fk;
       public       postgres    false    259    345    2708            w           2606    19467 %   reflect_action_mappings_ref_action_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reflect_action_mappings
    ADD CONSTRAINT reflect_action_mappings_ref_action_fk FOREIGN KEY (ref_action) REFERENCES reaction_refs(id) ON DELETE SET NULL;
 g   ALTER TABLE ONLY public.reflect_action_mappings DROP CONSTRAINT reflect_action_mappings_ref_action_fk;
       public       postgres    false    253    345    2702            x           2606    19472 "   reflect_action_mappings_reflect_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reflect_action_mappings
    ADD CONSTRAINT reflect_action_mappings_reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 d   ALTER TABLE ONLY public.reflect_action_mappings DROP CONSTRAINT reflect_action_mappings_reflect_fk;
       public       postgres    false    2712    345    263            s           2606    19439 ,   reflect_element_mappings_ref_topo_element_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reflect_element_mappings
    ADD CONSTRAINT reflect_element_mappings_ref_topo_element_fk FOREIGN KEY (ref_topo_element) REFERENCES reflected_elem_topologs(id) ON DELETE SET NULL;
 o   ALTER TABLE ONLY public.reflect_element_mappings DROP CONSTRAINT reflect_element_mappings_ref_topo_element_fk;
       public       postgres    false    343    2710    261            t           2606    19444 #   reflect_element_mappings_reflect_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reflect_element_mappings
    ADD CONSTRAINT reflect_element_mappings_reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 f   ALTER TABLE ONLY public.reflect_element_mappings DROP CONSTRAINT reflect_element_mappings_reflect_fk;
       public       postgres    false    2712    343    263            u           2606    19449 ,   reflect_element_mappings_topology_element_fk    FK CONSTRAINT     �   ALTER TABLE ONLY reflect_element_mappings
    ADD CONSTRAINT reflect_element_mappings_topology_element_fk FOREIGN KEY (topology_element_id) REFERENCES elem_topologs(id) ON DELETE CASCADE;
 o   ALTER TABLE ONLY public.reflect_element_mappings DROP CONSTRAINT reflect_element_mappings_topology_element_fk;
       public       postgres    false    343    214    2666            '           2606    17423 *   reflected_elem_topologs_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_front_elem_id_fkey FOREIGN KEY (front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_front_elem_id_fkey;
       public       postgres    false    245    261    2694            (           2606    17428 *   reflected_elem_topologs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_reflection_id_fkey;
       public       postgres    false    263    261    2712            )           2606    17433 *   reflected_elem_topologs_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_space_elem_id_fkey FOREIGN KEY (space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;
 l   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_space_elem_id_fkey;
       public       postgres    false    261    2740    289            *           2606    17438 %   reflected_elem_topologs_space_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY reflected_elem_topologs
    ADD CONSTRAINT reflected_elem_topologs_space_id_fkey FOREIGN KEY (space_id) REFERENCES space_refs(id) ON DELETE CASCADE;
 g   ALTER TABLE ONLY public.reflected_elem_topologs DROP CONSTRAINT reflected_elem_topologs_space_id_fkey;
       public       postgres    false    261    2744    293            +           2606    17443    res_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY resources
    ADD CONSTRAINT res_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 C   ALTER TABLE ONLY public.resources DROP CONSTRAINT res_business_fk;
       public       postgres    false    208    265    2660                       2606    17448    res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY element_resources
    ADD CONSTRAINT res_fk FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.element_resources DROP CONSTRAINT res_fk;
       public       postgres    false    265    216    2716            :           2606    17453    s_proc_el_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT s_proc_el_bprocess_fk;
       public       postgres    false    2642    273    190            ;           2606    17458    s_proc_el_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 U   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT s_proc_el_business_fk;
       public       postgres    false    273    208    2660            <           2606    17463    s_proc_el_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_proc_elements
    ADD CONSTRAINT s_proc_el_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_proc_elements DROP CONSTRAINT s_proc_el_session_fk;
       public       postgres    false    273    192    2644            1           2606    17468    s_res_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT s_res_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT s_res_s_sp_session_fk;
       public       postgres    false    192    269    2644            2           2606    17473    s_res_sp_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT s_res_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT s_res_sp_bprocess_fk;
       public       postgres    false    269    2642    190            G           2606    17478    s_sp_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT s_sp_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 I   ALTER TABLE ONLY public.session_spaces DROP CONSTRAINT s_sp_bprocess_fk;
       public       postgres    false    281    2642    190            C           2606    17483    s_sp_el_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_bprocess_fk;
       public       postgres    false    279    190    2642            D           2606    17488    s_sp_el_business_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_business_fk FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_business_fk;
       public       postgres    false    208    2660    279            E           2606    17493    s_sp_el_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 S   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_session_fk;
       public       postgres    false    192    2644    279            F           2606    17498    s_sp_el_session_space_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_space_elements
    ADD CONSTRAINT s_sp_el_session_space_fk FOREIGN KEY (owned_space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.session_space_elements DROP CONSTRAINT s_sp_el_session_space_fk;
       public       postgres    false    281    2732    279            H           2606    17503    s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_spaces
    ADD CONSTRAINT s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.session_spaces DROP CONSTRAINT s_sp_session_fk;
       public       postgres    false    281    192    2644            N           2606    17508    s_st_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 H   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT s_st_bprocess_fk;
       public       postgres    false    2642    287    190            O           2606    17513    s_st_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT s_st_session_fk;
       public       postgres    false    2644    192    287            P           2606    17518    s_st_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY sessionstates
    ADD CONSTRAINT s_st_state_fk FOREIGN KEY (origin_state_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 E   ALTER TABLE ONLY public.sessionstates DROP CONSTRAINT s_st_state_fk;
       public       postgres    false    287    2722    271            3           2606    17523    ses_el_res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT ses_el_res_fk FOREIGN KEY (session_element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT ses_el_res_fk;
       public       postgres    false    2718    269    267            5           2606    17528    ses_init_state_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_bprocess_fk;
       public       postgres    false    2642    271    190            6           2606    17533    ses_init_state_procelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_procelem_fk FOREIGN KEY (ses_front_elem_id) REFERENCES session_proc_elements(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_procelem_fk;
       public       postgres    false    2724    273    271            7           2606    17538    ses_init_state_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_session_fk;
       public       postgres    false    192    271    2644            8           2606    17543    ses_init_state_space_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_space_fk FOREIGN KEY (ses_space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_space_fk;
       public       postgres    false    271    281    2732            9           2606    17548    ses_init_state_spaceelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_initial_states
    ADD CONSTRAINT ses_init_state_spaceelem_fk FOREIGN KEY (ses_space_elem_id) REFERENCES session_space_elements(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.session_initial_states DROP CONSTRAINT ses_init_state_spaceelem_fk;
       public       postgres    false    2730    271    279            @           2606    17553    ses_react_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_bprocess_fk FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT ses_react_bprocess_fk;
       public       postgres    false    190    277    2642            A           2606    17558    ses_react_element_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_element_fk FOREIGN KEY (element_id) REFERENCES session_elem_topologs(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT ses_react_element_fk;
       public       postgres    false    267    277    2718            =           2606    17563    ses_react_out_reaction_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT ses_react_out_reaction_fk FOREIGN KEY (reaction_id) REFERENCES session_reactions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.session_reaction_state_outs DROP CONSTRAINT ses_react_out_reaction_fk;
       public       postgres    false    277    275    2728            >           2606    17568    ses_react_out_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reaction_state_outs
    ADD CONSTRAINT ses_react_out_state_fk FOREIGN KEY (session_state_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.session_reaction_state_outs DROP CONSTRAINT ses_react_out_state_fk;
       public       postgres    false    271    275    2722            B           2606    17573    ses_react_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_reactions
    ADD CONSTRAINT ses_react_state_fk FOREIGN KEY (state_ref_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.session_reactions DROP CONSTRAINT ses_react_state_fk;
       public       postgres    false    271    277    2722            4           2606    17578 
   ses_res_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_element_resources
    ADD CONSTRAINT ses_res_fk FOREIGN KEY (resource_id) REFERENCES resources(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.session_element_resources DROP CONSTRAINT ses_res_fk;
       public       postgres    false    265    2716    269            I           2606    17583 "   session_state_logs_session_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_session_id_fkey FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.session_state_logs DROP CONSTRAINT session_state_logs_session_id_fkey;
       public       postgres    false    283    2644    192            J           2606    17588     session_state_logs_state_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY session_state_logs
    ADD CONSTRAINT session_state_logs_state_id_fkey FOREIGN KEY (state_id) REFERENCES sessionstates(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.session_state_logs DROP CONSTRAINT session_state_logs_state_id_fkey;
       public       postgres    false    283    2738    287            Q           2606    17593 ,   space_element_reflections_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_element_reflections
    ADD CONSTRAINT space_element_reflections_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 p   ALTER TABLE ONLY public.space_element_reflections DROP CONSTRAINT space_element_reflections_reflection_id_fkey;
       public       postgres    false    2712    289    263            R           2606    17598    space_elements_bprocess_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_bprocess_id_fkey FOREIGN KEY (bprocess_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_bprocess_id_fkey;
       public       postgres    false    291    2642    190            S           2606    17603    space_elements_business_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_business_id_fkey FOREIGN KEY (business_id) REFERENCES businesses(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_business_id_fkey;
       public       postgres    false    208    2660    291            T           2606    17608 "   space_elements_owned_space_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_elements
    ADD CONSTRAINT space_elements_owned_space_id_fkey FOREIGN KEY (owned_space_id) REFERENCES bpspaces(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.space_elements DROP CONSTRAINT space_elements_owned_space_id_fkey;
       public       postgres    false    291    2646    194            U           2606    17613    space_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY space_refs
    ADD CONSTRAINT space_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.space_refs DROP CONSTRAINT space_refs_reflection_id_fkey;
       public       postgres    false    293    2712    263            V           2606    17618 !   state_refs_ref_front_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_front_elem_id_fkey FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_front_elem_id_fkey;
       public       postgres    false    295    245    2694            W           2606    17623 "   state_refs_ref_front_elem_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_front_elem_id_fkey1 FOREIGN KEY (ref_front_elem_id) REFERENCES proc_element_reflections(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_front_elem_id_fkey1;
       public       postgres    false    2694    245    295            X           2606    17628 !   state_refs_ref_space_elem_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_space_elem_id_fkey FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;
 V   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_space_elem_id_fkey;
       public       postgres    false    2740    295    289            Y           2606    17633 "   state_refs_ref_space_elem_id_fkey1    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_ref_space_elem_id_fkey1 FOREIGN KEY (ref_space_elem_id) REFERENCES space_element_reflections(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_ref_space_elem_id_fkey1;
       public       postgres    false    2740    295    289            Z           2606    17638    state_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY state_refs
    ADD CONSTRAINT state_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 R   ALTER TABLE ONLY public.state_refs DROP CONSTRAINT state_refs_reflection_id_fkey;
       public       postgres    false    295    2712    263            d           2606    19115    strategy_base_refs_strategy_fk    FK CONSTRAINT     �   ALTER TABLE ONLY strategy_base_refs
    ADD CONSTRAINT strategy_base_refs_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategy_refs(id) ON DELETE CASCADE;
 [   ALTER TABLE ONLY public.strategy_base_refs DROP CONSTRAINT strategy_base_refs_strategy_fk;
       public       postgres    false    2760    311    315            e           2606    19131    strategy_bases_unit_strategy_fk    FK CONSTRAINT     �   ALTER TABLE ONLY strategy_bases
    ADD CONSTRAINT strategy_bases_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategies(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.strategy_bases DROP CONSTRAINT strategy_bases_unit_strategy_fk;
       public       postgres    false    2762    313    317            f           2606    19147    strategy_input_refs_strategy_fk    FK CONSTRAINT     �   ALTER TABLE ONLY strategy_input_refs
    ADD CONSTRAINT strategy_input_refs_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategy_refs(id) ON DELETE CASCADE;
 ]   ALTER TABLE ONLY public.strategy_input_refs DROP CONSTRAINT strategy_input_refs_strategy_fk;
       public       postgres    false    319    2760    311            g           2606    19163     strategy_inputs_unit_strategy_fk    FK CONSTRAINT     �   ALTER TABLE ONLY strategy_inputs
    ADD CONSTRAINT strategy_inputs_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategies(id) ON DELETE CASCADE;
 Z   ALTER TABLE ONLY public.strategy_inputs DROP CONSTRAINT strategy_inputs_unit_strategy_fk;
       public       postgres    false    321    313    2762            c           2606    19099    strategy_middleware_fk    FK CONSTRAINT     �   ALTER TABLE ONLY strategies
    ADD CONSTRAINT strategy_middleware_fk FOREIGN KEY (middleware_id) REFERENCES middlewares(id) ON DELETE CASCADE;
 K   ALTER TABLE ONLY public.strategies DROP CONSTRAINT strategy_middleware_fk;
       public       postgres    false    2756    313    307            h           2606    19179     strategy_output_refs_strategy_fk    FK CONSTRAINT     �   ALTER TABLE ONLY strategy_output_refs
    ADD CONSTRAINT strategy_output_refs_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategy_refs(id) ON DELETE CASCADE;
 _   ALTER TABLE ONLY public.strategy_output_refs DROP CONSTRAINT strategy_output_refs_strategy_fk;
       public       postgres    false    311    2760    323            i           2606    19195 !   strategy_outputs_unit_strategy_fk    FK CONSTRAINT     �   ALTER TABLE ONLY strategy_outputs
    ADD CONSTRAINT strategy_outputs_unit_strategy_fk FOREIGN KEY (strategy_id) REFERENCES strategies(id) ON DELETE CASCADE;
 \   ALTER TABLE ONLY public.strategy_outputs DROP CONSTRAINT strategy_outputs_unit_strategy_fk;
       public       postgres    false    325    2762    313            b           2606    19083    strategy_ref_reflect_fk    FK CONSTRAINT     �   ALTER TABLE ONLY strategy_refs
    ADD CONSTRAINT strategy_ref_reflect_fk FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.strategy_refs DROP CONSTRAINT strategy_ref_reflect_fk;
       public       postgres    false    2712    311    263            K           2606    17643    sw_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT sw_s_sp_session_fk;
       public       postgres    false    285    192    2644            L           2606    17648    sw_session_state_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_session_state_fk FOREIGN KEY (session_state_id) REFERENCES sessionstates(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT sw_session_state_fk;
       public       postgres    false    2738    287    285            M           2606    17653 
   sw_statefk    FK CONSTRAINT     �   ALTER TABLE ONLY session_switchers
    ADD CONSTRAINT sw_statefk FOREIGN KEY (session_state_ref_id) REFERENCES session_initial_states(id) ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.session_switchers DROP CONSTRAINT sw_statefk;
       public       postgres    false    285    271    2722            [           2606    17658     switcher_refs_reflection_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_reflection_id_fkey FOREIGN KEY (reflection_id) REFERENCES refs(id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.switcher_refs DROP CONSTRAINT switcher_refs_reflection_id_fkey;
       public       postgres    false    263    297    2712            \           2606    17663    switcher_refs_state_ref_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY switcher_refs
    ADD CONSTRAINT switcher_refs_state_ref_id_fkey FOREIGN KEY (state_ref_id) REFERENCES state_refs(id) ON DELETE CASCADE;
 W   ALTER TABLE ONLY public.switcher_refs DROP CONSTRAINT switcher_refs_state_ref_id_fkey;
       public       postgres    false    295    297    2746            ,           2606    17668    topo_bprocess_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_bprocess_fk FOREIGN KEY (process_id) REFERENCES bprocesses(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_bprocess_fk;
       public       postgres    false    267    190    2642            -           2606    17673    topo_bpspace_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_bpspace_fk FOREIGN KEY (space_id) REFERENCES session_spaces(id) ON DELETE CASCADE;
 O   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_bpspace_fk;
       public       postgres    false    281    267    2732            .           2606    17678    topo_procelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_procelem_fk FOREIGN KEY (front_elem_id) REFERENCES session_proc_elements(id) ON DELETE CASCADE;
 P   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_procelem_fk;
       public       postgres    false    2724    267    273            /           2606    17683    topo_s_sp_session_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_s_sp_session_fk FOREIGN KEY (session_id) REFERENCES bpsessions(id) ON DELETE CASCADE;
 T   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_s_sp_session_fk;
       public       postgres    false    192    267    2644            0           2606    17688    topo_spaceelem_fk    FK CONSTRAINT     �   ALTER TABLE ONLY session_elem_topologs
    ADD CONSTRAINT topo_spaceelem_fk FOREIGN KEY (space_elem_id) REFERENCES session_space_elements(id) ON DELETE CASCADE;
 Q   ALTER TABLE ONLY public.session_elem_topologs DROP CONSTRAINT topo_spaceelem_fk;
       public       postgres    false    267    2730    279            �      x������ � �      �   2  x�uW�r�8|�|��*�?�uv�`��Ș���8_�- ����8I��[����	���¬�6C7�����r!�2N���r����*B&��7/���z~�"���7΍�l�0��z�ʃ�%�^���a�a�����Ş;�\�z,	�#��vsf��.?JJZ�X�`E<2����X�HA�U	_�p�k���'�����|;\'*�%�u�T�Ke����Cο8���(�V�<�����25^�>CqM��+4-W��6Զ�f�I��Z�����k����X4s�֢Q�`Ԛ�^��̡�)I^�p�p=6����Kq`���KSf�� ��-����|8E��jŲ���������ݏ���� z�O��Xv�ggګ?���t4/�|R��ީb!`;��������rT�,	X�S	B��-!������賨��m�T{Hd��nl_��e����v� �nII ��>{����S��<�8:���f���gcw�f�S��!��E���~B�*�c�v�j�,�5x��<p���i���o�>�g��~�����ꮭ������`��.̋W�����v0��]w!�ss�
(Nd���э�!o���6��ש�p��X�!2�7��k&��i>]'Ru��	�.��xDlIVDS���i�A��t�]�n?r"�L�8LQƼ�����&����������/�C,/%J�/3�ۓ�leO`�gbGE�%C{�5"u������㋢���%�%_)Ri��x���VSWw?�
�%���0"�	pV�b"��짔��#������6R���B�������j���,'t��H�l�2�$����~����+���d@��؂H��и3�)	���A�r�i��X_�?O��.�E��1����9��ӏ��� ���JI��t���o��v�����&�4ᙫ���5�2�W�nCk���㈝�bW�mݐ�*A�6���	���	R���+�̉XE.S�������7���X:����d*K�ٽ;s���M�];�Gi�8������z-�L�)S��nO�&f"Yf���i��Y5�wO8����T�ϣ�5���oۦLU	��nGc���
���#�.y�� 2�&O����Ď�~4�c{�{�������V�T���]�]�PD�شS�h�E�޸���U�V�T��mK%D���>�����Xh� *_+�Ru��-N���FE�f�*U(�*7�vjH;]��ńEu��jkW�����JK&�W:.���ш�kBU*P0;��Tn��\���Ʊ@��Щ.A6t����c7���e�n� iP��JC���ɏw�9��1ځ�_xNc-f'����7P���1���n���vm��"s�����>I5
��z%}�G��e�,� ��G*N�;x�`!X�M
8����rmR�Jl����t��Ӌ0�)�&NS"��SU�n{>��F:;�ޛ�A��ٓ�?2�GĻ��qt�Oc�E�a�l,����d|`Yw�<n�<_G�N
R�	�nzhu��l�Y��y���ԩ2Au��X{���9������m&�T���_�~��q��      �      x�՝ْ$�q���Oї�����<��(J��8$I�dF��4l ��+|ɬ��̬��L�	2JDW�WF��G��nB6��R5n~{�����/_������/?��������6���?�s�?���W_�~��W���7/�}<������������xu�o�>���緿�����W/B5�x���p�����|{'������x��{ο�����H��X�3�'���7�����W���˻����7�D-9#jУ����_+�E�*
j5!DE*����M @��XEF��'���T���@�IѮbC6!j�	�x�pS2>L�^Ϙ0�~���_����K�L�'z­k��`�)�V��Z�uc��M4�h:��aw����i;�:�WΚ�o�J0?����W_����߭����y�F%����Wx�̅�z�'�]�S/jB�n�оNL��w�GS�@ǚ]$�]�#]:�hJ%��j����إ|���TfSk�:��w���@tL[۶Ӝu�qטgFǁ2�k�H��ȇK��]��Y���}�j�����s,�Z3ì-Bk�d��3�l��܎�fƫ53#k6����̤�o�]� �A��X��A���Hn�A��A�FRi
��L ����ffd͙�c:�a��u������dO-������?Ę53�嗧���g;��6(ԟvt<՘�zk�!x�F=0�ZsԱ���*�1G��[S�c��������\�9jl-�-I�J�gTk�:�`ɬG-a��Ȇ����g�5�9�&��$0�Qn�l-
�f�t/U Ld���I�Ӄ'������p��n1"YwpJ0g����w��%ah3C�w�ڥ�Ȼ-f������C��
A�Y�Y�eV5fɡ��S��&�3Vk�:�·���4ٚ�,_�V��0�G-�$-��5��Z�Ik�ӳF>DJ�\��M��8S��#�\
:(�mx�#�H)��>U�YH����z�s�ܒ���$���h22�b�4������x��͇& ��B�:(gW������Mm�ZqL�<]\{�zw����ə��~d�+TH��|k��@�G���R��џü�h���=�ѦT�P+�%�I�X����*2j��������)nh���yG��}���|�\������P�*]�j��n5���(N�����<E�yid���42��V�ҡf�J*Z��ѝJN�g��eD-��ud�b^�E���8�_�=�ˬ����x��g[�U]���T!M�u�c�!+��U��%���bjK��J㭭���[�(pnW��u��f���m���~[{770���W_����o��ax�F��xL ������<��WK����>���c�Q����3me�I�����I������Ԭ[Ip�°�{�����'d���,���w���6����^m�������X���9�J,d)����,��(��;g�b%��p᧍����30)ɒ�B2l��dң�k;8�%��z���q*����M�������W�TlpF�Rw"�'Q��*�O��u8.q��sZ@��}X�}���W���Tbo����wa�8(�Sx$/�̀Sc���X}�tG�Z5¶�'�QN���Ԃ��8��9�&jd���aϩ1QL��F���`+�;�&&�x��ޗhM*��Wu��S(�W\����Ǭ6&�`#_;���x��	��������QN<�&����$oo7o�^��a���tي4Y��0�	�Q���a[p�K2h28S���W����x����Ӄ&���}q�	w�f�C����/���EI�g�MA`5����`M�<h68�4�j�M��G��A���7l�6�.v�pޛ8����Q��{�[r������Wi��e��#�+�g�{6��)v�mK�ͽ뜰ݻW���fy��c�\{&i�Ksf��%�J�s�S��ۑmJǑ����̘t��,y��9nʰ"�NGV���E��3��ǖ(��z�JuY�%
��U%c��$A8�26�F��6��!����X����fK��e��f���܉(�\���b0 Wc���t��5h13��4�'��f�c�\k�;3�'�`�6�v�c��&-v��2��Yz�k�3#k2r����B�9+���[N�jfF�b���4�����0ٹ���������xyW�pJ��I��RQ���e�	|��b%��H�j>^� mY��Ŕ�[҅�������J7�eG��}W����8���7kBF�@�p�Nzs�lJ����\�6J
�9~»�8<ZЩ ������k�	=����+��Y4�V��rQD�(�{؝�ndg�]G�ڧ��-v��#���#��G��Ax()�a�m�a��tF�<KBU�ʼ�.���i�G!�ʾ\�L���$��߿Pǯ5��uv��Ye+k�@p���a8*[��+�l���AC5�������Q.�٣y#�^0�ng��F�ܕ/9�Wr��v�i!X�^�X�����=��P�ne��&�ں���zڙ&pꂜ�����%���H�iogR�j�sg�b�{5Q���v&e!H^l�΄,~�)8+�u;�r%)H�S�&��܃u�yC��)32i0���{���y�a���fhڔ��'���2�ڔe�B�ғ&cAH��������)��gSf4d��vY��٘GbʑR�UkS���I�������]��z�Ӧ���DN�N�M	R·�X��t��L*<���0)�0C�4���d��4)#i1�>8����q�'H;��#-�:%���B�Ӡ��΄(o��eX�D{!�iPF��H�]���9:�����77����Y
C�7�n_q_�	1��i����ʦe���]7'�f[ٲ\� ����ޯlYX��e�=��a�Z@���3��ve���ҕT{�Y6���ʵ

(fV��W�*�tǷw��Q�ZA�&�[VRFPg������ر�o�������n�c\
헲�a��o��>lef�M��������\e[�*^���4a+�s��H��#�[��Y3c��u(��l��2i0v ���Lk�c*��*��8��>�i8�z\���ŵ�a��~&eJÁ�=m˓a}����=E���)��:m�@��a��ƨ¦��k���$H�*mʑ�����F6��0R���QiSz�:�1*l���D8'��)G�4z�¦ Y>x�!�ˠҦI��/[?PaS��`���l�x�Ҧ��X�&�h�)|����2�զ0)~^�R�bSY�6,��уV�"�-�s�.k�)��p��J�t��!u�Ȼ����"w&J����!�����eP��m�|RhSzR�T�M��ӵ-N�~!>)�)��U���f6ŕ�:;�U�x�O�ٔGdI�	YH7�)��>B�C����M�HÑ�Oy�ΛٔI#�1.x�ꪐmfS.�p ����U��H0z��Y�L�)2�L��k��_�a4�Cv�څ�O�I�	kW�/�hO���*�4)#i�A4�aR���z��@i����h��р���]��\C�C|�%\�R�z	ԍ�kW�/��ځ4�ĝ�ڕ��kȤ����.�_�a�n|�Z�r�k�_�aG:�۬]l�����%;l�b�'i��&@�����/��lsh��׮���HM��~����4L�J��Я]m�$�weF�T�MIxWUSU!�iSF��~��嵫�/ѰY;�L*�����OѐIkR-6=�JCC��i�)BZ�{����jH�~b�arx�v��������k�/�0`j�m�Oa�b��5dRL%��赋�/�0c[.˭�����OҐH�4[���=7�֡N�ґ�T�Ia2���Y�t����g�T�Ii����l%1�Z�¤���Ƭ]l��O��=kW�?I�HEK�A��@C�<��v���$Lx���<l&���a�!�|��[���J��yϭ�����h,^�X�L�I�Hku��r�g��2:MJG�s	��aQ,z�ܜ'x�e$m�w�	��OkXi�,�	��6���LÑ4�    D�ޤ<�ZK���bNj��D��p���p�������O>x���7틞P��-bNNJ���|�L��p����O����W_|���ۗ�g� 5pn��NJ|�A<�q����������x��篿��C2�OS�I9�?�T�QS�|��G�/�ߜ�;��`��0����M�u�����珯��������D���Y��{y\L�.�Žۮ��w��LYX��F��r��Q�vu��JH�t"���&l͍���~lWGy��Lۧ+��g�kX�yM����(�аP�C>���U�k�(��:�/���0� �$��(���w�\��]�is Re�]]弆��乞7lWGy��H��K1���U�iX�M������TC&m6�;���*g4�~/�m�&��pخ��B�Ի1خ�rRÀOÌl��tuڔ������U�h����Uv�6e Ū	ΡnڊqVIzOb4 '�i�F��ɼ`�m;[.���a/g9�䵫�i�<��)h3d<c���!E�j"o5����[�z�-H�vZΌU1/g�)�7�&�6�#{|�zԌ���ÓT��9�V#�l��-��8'"�x�̛X�k��l��Iy+�LM.=���zy+t��#.~�����Z�f��'��F�$�&V�:5G�`����%��ɮ�w6B���|h�w6:3{�����I���w��8��=a��k�i�g��gﾮ?�gxl>����o�"�b�y?�zj./�O��B���?~���g.|��x^΋����� O��R�7柿����q�o����'�o��[��#.�I5�Ϳ�_��>�l�plX�.�B�^�?�1�I��ͯ�o^��3�ѣ�������Q�D������6����Ͽ��?������Un�T�l���of����ҟ�3���?��x�o���=5�z�S����I˕pR"�߯>�b�y�s�'��b ��!��t�~o>z��7?M��N/�����K����w�_O��(�zd,��ZXGKk��Q<�Hh�燯���L����0diD;� �r�\��?|� >4����}���uΟo{]��5�"n�Λ�S��I���_���~��'?�����ſ!`��ԺH�ܜgϋ(�$������oo�>����exS+#��C`��'9�7�b����ǟ����3�'�oh;=�D���[���u�Sl�7���x�>�k�5/��&�ѽ�t��kg5_�`�̊-�1����G:�P+�y�s;��b� ���P����E�����E����R�
+�/!]���Y��*(�m��;n3S���Ye��f���D�j����̅�����bRhb}9�=�z�7��țMO�okx��L@�kXLs�o[�s��#o5|pמ7�\H@���<p�e\{���2�x�מ8�PÌ/K��D-����#Ǯ�p$���k��̱�J$�x�y@w\{�ؕ���%n��iH�h0��Ȭ=H�j����}�b�d^*U����4����N�Ql:�Kŋh�PI+1�ڥ/WkȤxB���%#�M�*o��w�����l�fuq��J��._ߗǵ�`���AC0�o~b��T�'�����^�Ԍ���]9�y��/Z�Ϸݑ�V�^�^B&m.F��Z��qVfBb�Ȼ���i�c�d*24���,%��^TlhFހ9��L¶i�zz
�(��˾��]���[�Yi�R�g�,%]�ߠ��y��˵�h�+T|�BY�;kW�\�!��2a�˛J�L��Ú����
=#�Iy��d���]�h,��m�h��s���!�6U5�x"[�m�h��&��Yx5Y ��"��6�4Oғ����*:m<� śq�B�k�LT|?��15u���q�R�k��E�7��Y�gľ&񬫸q5�z"/������5�z�� ���4�ɼiLBܸ�fZ�x���q�	�,m\Qs��#�Xb7.����%J��&p}Aܸ��R=�78c�m\d3�'`cKix�5ۣ��-<c�d����VO��f{4�F7�&���X�y�,ύˉ.�Sx��ܧ#M�(S?��݋d�W,���ȋ���M��<2t?�qk�F#n��\��������a��w��ecc�oZN���Y����M
Y����mV*{֞�v��#i�)ĵ'�-אf^6W3�I�ړԮאH��鹯_\{��%�BÊ�x3�=I�)"i���.�=Im��ފ��$)FX{��uIڰ7�@��g(�g�P�=I�zˁ.%��ƺq�3�$�b��Qj���΅z"oF��q��=Vm�������¡"�=V�z���F&Ua_��^����;0�J�2�R�y!�a_<z�8M!��X�+5I��S�T�}	ؿg����i^F�d��WYEȂd��qV�c0������kU[(!Pg�����}z��jWj8����m�~`ZÂ/H�ac#��N�2�b![����-԰�%���'�O`��jWj8�f��<m�ʆ|�Q;B��I����߸��}y���^~��#��d��aU*M,8��q?�2/#�R�-��kW�DFG~v�,5X{��et<n2��+�@��"97�"�v��,�k�W;6�-2�o�E\ٴ,U�Y���3�����lY΃�.Cam��Ϝ T,�*��T�S�߾����o��������W�o�q��n��~�_�K�[���rkFTw49Q�q ��:�L��2w���X���M�{V-��G�f|	ؓ�w���X2��lQ���É
�F#~�+��9�d#��UVB���|9{���K4�Z�7o���دI��;6�ĩ`�p��a�hFv�S[ewU2�	�籿�p3J2l0��.B���������j%6�EI�D�`i`��ay�cP��6:F=Jb3�@-�8�"�UR`�8Y�I���r��&�8�Y��#ll��,I'�g�/�ǢJ�48=�7��+ t�æ)����6	:N���$�>���$ꚛ1��ǳ t�6�9� ���Q��"篠�����8��������E�N��Î�/ �X�a	�8%R��Y��f����� ������0 �18W��4p�MHj�����U���6�#�Oӂ��ތ�uhHI��I2��F#yI��Y�� K�ܴ�9���}�MI�(�/O�d*��+܄�GXsS���j��L����0o?���/��<��E�f�Eb�G�S�9����$S+�-W��qr�b{b���*)�9�7���ƶ-	nT�
�JY���V.O2(��w�bNsR��@�D}��:�"��N�W����gn�Nᓤ��M��얐hǪCxțگ�x�$u�I��
(V����N�#�ܑ�S.��Ƌ�U������s�W�>�G�	ٲJP¹@d���f��YŚ^"j��([�%��"���|ҳ9P�n�
C�(Y��02��/^m)7���8QgB�4\��a�0�P��I�]�&�9��o ����4OkWz���I���G�3�q�I?rU��sZ�Έ���!7�k�����	��l�=ay�hǳu죰�	GV��z�g֚�����|�m}��b9)F�8�h(���tN�#}3��&�1Lk[�d��v*�c�Z�>P��Y�;���%��Ex+�xT Ԫ�s���ه�ڛ�~y¢-x>s��O��Y'�9nl &9ϠN����=���k��̩19Z@/���Y%�H��^[Fķ��a,B���tV�?�_ �I���츇�R���Հ.�y�O��5�d�[@DUC�Dg��
rF�;�w����mT�
P��&6$Ω!�z�&����3M�~YY��
�#^p�fe�sA����%��E-��2��RZ���.�y��VdNZ��^�Dفt|U��Y��}�_!��⡲S���w���kirU��|���?�ᅊ�k�F��6W�N�aȆ75!
�ەn������P��],����X�n��]#��Y�]�A��#~s+*��h�|3.:d.�i��r��A	��<�1W�I    	��Ș��qʏ+����"�� ��%�"{��U�n��qU	��G��9����q���H����<a�
��B�S�,�hp��-���)���O;��D�U���E�9O!�!���/<�8���Th���{IYIԐ.Z����&��.}����Ӂ: ��e��Z@�T��s��\��?�9S_;��Z��.�y��Q�)Z-��2c��Li�w�贀.�y��κ)z-�d�\]�>�J8Št��}����p�����@(8< �5"�!����b<�Ҡsy�z�	�Y�]�Y��=~6�z.7s˜�S�u�&�bä��]��-�=��9	E�4W�i؅5�(h.p��SC:+t��E��x��gǛ���w�T�6j@gu��+�$H��?�k��,8yv+ Ԑ.���� iه	�sa�����z#�S��PԬ�Gچ�%L���T5�˄f�"v$u����v���`|G���ZOt��b�h�w���:+�H��i)+��3�U:4,��.Jwv���-����no�ZVé�ͣ����Ĭ%��@呾�uBJZ��)s�Q�?�R��\f�}�$3��P�y#�kU�x���Q|�T�`�j<�'c��b�z�h��wl'��땢^d�ǳAv4sֵ?2y������b�˃��i砄sN�>�o��QQ&rƋ�,m}����4~��OJ���)}�+gl}3�"��]�S.J�OE����3`�26媄s��#|�z���ߵ���W�׊��գ���tqJ8gE��h��W0����Vr^�2P Zq5T�:v\�tV���"v-W�M�
�/��I9I)d�re_�Y�Gx�5e���Q��4���!�r�:0g%ٱg9[�Rt��J���!��$��s���&H�w�:�O%�|�B3/%,�N��������x���,��O?6|x �+�Ƀ� ���®psz
1LΊ�ݡf�{ݕV��ϸ\0O�m&���OȥGׁeo�B��ILGׂeo�B7Ch*���vMX�&]"��V��e��w�8B�W���wX����,,1jՃ:+u�_2�g�ٻ�S2t�i"ŷ�H��l��e:#}J���"=G׮*t����c}�[�l��Y�;��2vd^�d�*c"z����ȳ��=���t䶗UYI�zx .6���#sK�l��%B3>`�?�?Fw�F�9s�j�͋��)�fVՐ�
=�{��<;�f�X�f.�7y�9�[D����=VT�\?tU�b��&+�W.��Q���3��_�3�+�[�0�4w]Vv�����<T<����Tf�i(N5Q�w���.���[�8�;��fNt�pL��BWu����1�sɷG�dfP*)� �N�B��"�S���.��ᑠ��{��}��m`�f=<7��1:�SQHZi>
�-�c�}� �c��Y鷟�}���ǯ>���g�����@.'¹�Ҭ���8��BK������a�O�rG�Ȭ�+��ng0u��pph?(q9�=��	xny�c���hZ��b�n��:w]S���:�P�9�ڥ(�2ƒ��kJ8g�e�$�|�6).S�����[,r�������N)<��'��5��j�`��o���rKΐ/���w�����>����ˇjEܖ0v���Z�~�	�s��3I4��y�\��s{,Y��~��;��:���?P���c�Ľ��i�ޠ3
3x�9'$��-6_�:��FQ8�Y�`_�Y��c.�u�Iڶ�V2��k�b��Ӈ�h��pN-ّ;�r<�(�<w��k�5{Ԅj��V5�����QI�a4l���f�-]:�b
+�Oɾ�g��k��y��:��R�U���� ���u(Q����ET��iKe��[�@�R/ w�3��0�K7m�z�*k2t�])�X�#?<p;�����N-�<ɑKߖD��-��gCuؽ��i���yi��H��4̽$�x���׀��!�ΤS��-�Ƚ��7�R4���.C׍D��;2�(��WU���j�"�a&sUDN��sjɎ���so��5"��k�دԘ�m`ԕ�Jt�u"ٛtv!w������u*�+v���
DN���Ω�<r7M�߻6$:4��=�(У�\�5"ٛtB�#9�1��+��[�]�q�����O������N:�qG^�l��̻4�]]R,c�
��X�{ޙp/��?���r��MHTp�m�Gx��dg8�W��6�G��~s��߿��/?y{��m��޿�ݫ���6���w�?y���Ż/�xՂ3�p�L������^���<a�DcR��k�-c�س�`�.͢D�K
}l���9����/_��ˏ��-�߸~�_#����$��4���O��~}w���m�K�p�Wi)&�}������O�y���z��	T de�)n�.Xp��<הf�y*~���5Р9/��+�\(r�91l��1Tl�[��{��)T�1�9�,qW�YAG�j�lwt	=�2�L"�L�^�H���s�oh�gI8����O�@j�k�R��d���t��#~��q�@�C�U�\/�kY�S�d��V�'ܜ�B\0�#����%i����=*:��q`�10�(�C�B�o<�:W��s"~깫X��wiZ�ؗ��%Ɇ�Q�re�$!G]r�n�<�������uլH�L�f�mM�S�v9�LȲIi�MO|��*����n�RJ3r"q�؋�i����2h����iئ�;�Vd����v)V�i���i*�h����$H.�(P������f��[�������a��� e�W?ИAL�10lQE	�ԫ?r����k�<�����X+\Co���)qjl���VJ�$�(�u_�:�Pk]�����8�'��^�W�R\�%g�T�*K4��$��GŁ*9������_N$2��t=��q�x��4aO��O�(��KG�ؼ*�\���a/���k����;#%���]��^�����_����o^޽>ղ��ʻ-Y��ﬔ�Z��`�yR��.ߵ��o��?2�a�W�]ZG2��Ig��T:��v��6g����	��YǮ��^��h�;{��s�&u�x�C�Z��v�9��O�Oc�|�hKmw^7�>�'�x͑>�.�싷XRl���W�ᑴ�8�oe�%X��$F�4����`��`��.�렜�u�:�{�i՚��3.Ӗ��c�� G�!����v���y�q1��Ov��J]���0x�&s�ʱc�ΜS��ܹE��1���:��Bބ����������Rw�F_���Ѝņ�*��Lg���5�K��*��w�n����x��A�JY��*X.�*�+�u:��ݿJ�&`��/�a�`@n��. {�-����b��� ;K�cq�uP��nIG涃�QH�zu��#p7vN)�(Wtdƙ+�iuQY}����m�.�ԑf �$ڂU�9+������ ��ؕΘ/�[rù!�L+}ˏ]9'�#w4 ��}}���Y8��E���<�۵Xi�\��ﺘ^R��-��^�Ҟps����`oU&Ϊ�[��Y�r"q55	�фUl���[ke\�O�ԏ�=�Ŝz�Gll`�6!����}K۟������qm�su\Z� G]T�ʕ���E<���c!����?+y�BJu} �G)�!](4��%uG�ɬ��z�nQ�]MJt����sj�������h�Ň�=>k6;v��1��4�Hɤ�#�5�ؗsB�#w4��W�p?����m��=�k�/�����&���L}�S�k4v�(��x��<Y���<��{�d$)���÷�ӕ���x���obzUj;�,���sJޑ;�$W(�p���<��e ��9)��W�ss�.�c�V����~r|t�f:�����*Y���J7����ހ�E��P��`j3�2��	+cR�H�M�IYYRڊU�9+��=�x�-G���k�����c����UPN�#usy�gK�Zp�#D*���O�i�t-8T�#2��12�X�M��SXy�I��bej�c-^���hPЍ���vx���)}n���,�T5�`dÓi��w�V�^0c+&&v��Lt��   Mץz�z���.��X���ꁴ�p{k@0�̙ן����pM.����vWʛni���{#NAMJ0����eZm�'��]\��>|�pC9��அ�����TQ��)}G�ܬ�����4�ys,���J� H�p�j��)uG��Q�I����>U���.V��:0���3gVt`?P�`����e�1��Y�c��C��vL��_g��`��\�l�MJ8�D>� �Dg�����yW���bu_�H�ڢ�sb�8r���X�p�����H/W�ԮÇfy��m�s���s�i^)o��T���4έ�+��#Fx����S��ţQ����&���s��_M�u�u�"-��Af7��JNJ8gE�	b��.!8�`�<��4N��Yc̢sV⎝������g�y�ę
"ޯ%>9��*��x�����J�
v<� 2I�aV����{%��"���D	L}wv��i����&�l�Sٓ����+�Q5(:A
Z@��Ñ>�B�~��U|8l�X�ګX$T!�b&� ��mE���X���H�O+]$\����@�vybW�����9+�_���N���]&r�:&K�Fx)��sV���qd�
m�V�v�K�HK!)w$�]ܕnV�o���%t�@�y��~׮Zʇኬ�Dڤ�s��_q�'�g5���O�6j߆ي�5;c�jD��F\���0g�7��N[�=;�ٙs�ȡ��8�%���Y'�?W.��\�<8���� �=�f�����fcw3G�U,ڌc����I`ƨtV摾E���Ʈ+dhi�s��d.� �T�y5&-��2��n���Ǹ-�����z�4$d=-��2���D9������~�Z�_��u�iH]@���:-sO�]�-�M�O�����󏼣�����u (Hz��&��^��#=� �ѱA���(ؙ;L~�9�?�'����)��U�~ n¡B��`&�K���^�"�M��%�n��ϹlgH8#���{	eG�Y1`��sׯ$G��U�bu��,γ�jױdg�%23}4I�T��B�H�(��C�Z8��ݑ�5�)h$0TJǖ����.[�@�`V�Z�OeF_��ZyqrR�J��k����� '�讳���\3�y]���y��T�Vvd�]�p��45k��I[�Tu�����%<���|�f�'ܬ�#q3ƻv$MdPpMA���D��+�\ ����Z>\�(޿}�j��s�}�~��آ�Wwo_}z����5��<LJ\�Ts\�/��i��7���o�������T��#1���|��L��ʉ]eEP�A�+{���y$�,W!�z�cs���B9��L�m�E����֢��,u��sV�>91�p��3��Ԙ:n�E��h�}Bv�����~R����6w�f��"k8*�ї�k��x���(җs"�����C�+�~��^��!x!�B^���0�f�|����c�RUW��;�i���Z�S뷣�6��&�����ݑ�|3Oe�c����횉� 7�VGb��"��4��K�\��I%�^ީ�pN-ב�jE_P��@_J���$9<�I	猾�&fѷ3g�]�y���7S�g�J6�]7�}9��������&�I_L�Lh2�c�v�D��݅Gzg"'���ϑ;JLZ��d��� �]�'��+�Z�#xh��n�Lz��+��)LNk�ִ�3����w�n�DV0��~�/���g��9�o���-�ww�dV�=˶{��{����U�e��m��I7������������g�a[�6      �      x������ � �      �   �  x���=s�6����p�1���I�"���ɀ"(�"	AY�}�;P�%�i�Vᇻ؏wW\W��0���_}5tc�����	0���j�g��d�(��0��C�����Гn�$�=5���D�"#���ǹ(�r}OdK!	e+n�[����6{4;���$}��ajKII!T&-�TO��~�B���b�T�*�"�_<���-�m��Ҕ�j�L3�x�6>�S�_��ٌr����ws��p��G����O�k�V��I(�7�~�!�ɤ_��~z~q�`�h�!_�ӹ9�O�9��*������:m����%]ce���y}Hy]�:o�kV%���v\��.��l��Vɀ	��\C>0gV��x��t�Ռ�mJ�|<)��d*�TS<GTJ`�.��q�Z�|���dR��,s��+���id�Z� f�9]�/�nAk�K���ōk\��&����D�@����S?�]�����e@	��L������Q(@<wѨZ0���	�	�����y��=�O���Jq��_|_mC���F�ȑQP�\�vU�j�[��ʅ�y�ʳ(	�tw쯷afmIu�%Y�[)@�k�i]=u�.0g�T�ե�(�t(yu��yi�nts�޲"��RJb����`�7mՆ�
@N=�}�1M��E����Ää�|߼�;��F���*N���p�i�a�w�T:(NM�ZP@�K�����Լ$�I��|
�^v�׺�#�8�".L����)���O��+~p1��Ԥs�&��)��T@���mՍux~ow��5D�[
	�y�&"�����]�6k~���R�sq
P�~_�C�D�%��T���(
@���վ�{?5>v��OoL�v�!KE����P�q�GO�n�o��Ľ�a]`�R�i2�XO�)N)�\�D�m�4�K�ʒQ���A(��ٍ����F⏯Y��d�[V�k
(�;���l��X�K�`3,k�Mɕ&�������,�!���N]����CU
,�U�5�ƭUBh��O�n~~�"�.�@��u�q?º��SCo�L`rS���]�%�8�~�Ԑ�t�4��<�ꐋ��XO� ���H�eR_e�� �n �$�P&���\�~v��%��9��KY\�GZJ��mv�?�w�ki�@�Q�0-�-� @�܅��8�伌n ��KP��TfN̺2k(�?Լ�ژ��wvƫNH�^tR&�P:��P@����h�{�g�o$h�dˆjdtC�Mxz��-z��H=�q2P#G:�i�v������i
e�$���k��'ҹ��u���kU ]x�
,+)��L�8\�9�����8��z��+��⩜�&b�~�TJ��*��U�!�lJ�\���)2�R��7��f,��~stX���j4�X�������aq,      �   �  x��YY��J~��
�� ȢL�Ĩh����q#&
(d�����G�=�x��.�/++ɬ5�4�Q������L<Dq���*@U����V�HZY�*�y�5���jQ&�m���1h�uF`��Ag����96�����n۬�'�0'Y��p�MӮ�@����=�@�!�v(�Ư.����	�_����^qm�h��g�6M��9�Z� �-�؞Z-���˒�9�C"�y�`=�F�	|��,?���axq���!�J����ի!�u+��`���tO���g��l�C� '�$5�Z��&�l�R��<:j}LV�c҃�B6�F<�Rq%�<Ю!����G��Z����c��	�X�i��S^�O��6���t���B��YEx{5�b���V����+ڞw�i<�%����[������8{��Yv�`v��fV����/�`�T_u]�{ît�Y�7��v(�����ΙS����G�沌�p/(����\`�(�����EX�
h}��ӡ�v4�w)1��w4R%h���k���|1�j�������Ȣ�#G)~�Y�2 �����9Q+\&�������� �@#uZ%	��R��-$	�(j ��Ǻ��0d���f�֋�0��)���g����F�l�q�,H�e����`�ب��].X��mǿ&�]�#;��M�"I!��rj��.���p�[{�ӊ�~k%Lڙ����T���0�?�E�wsxr��Nr�ly׽0�'{l���@��īK�L�;���%92��$ȸ�啠�S{�'V�:#���nuɈ�ƌin-� WJʳ���ba%O��{���3����`��<z��zPC��U�[eC�+y��j �M��t)�h*�gr�������S>�3L	�Qw����Ŭ3\<`�q�ݰ�y�φ�L� �<�����g���ۉX?��'�H��h�A���j���ٛ�^���WT���d�����D�a7m V_���=�ޝ�E���1ё����D��֫1}t�[B'/������A����V߈��ö���c§�g�G!o����q����5�������&A�>�Zž�#���h�*��bT�Va ��H�u=��A�aU�w��^69��zD�꺆��5�թv��V���1H@T��j`�mP8IA��X���K�Peڔ�it��Q8��V4ߵ�� b����%j���m�W���m5�ڤ	}w�ǦSq���G�)0�<�c��^	��J���^�CGw����`7��R	����ܖh�k���'�|�b���l�o���J���a7[���X�7tȬ�3f���Dɟ�\�[��� ����k��5~��j�ܡR1Ue.�ig>ZoF{�6��r�3i�ͧQ�M�F!�x���n1�űV�<�����w����m^�k�8��!6��[�R�V��j �?,IX<)�>�����`,��űu3��5n z����f�345���NR��	IFSٮ�*����4��S�#�������kGp��M�8<Ov�^i�tԁ���?5�x�RG� v�}�I��^R}�t�L-$��:�ڠO*�����h��Z� %���n��Md�#�}��J�: &U,�s<�����^펡W��@�VO�+G?�����s�rř΀��BW��I�͈E9��d��<>P�|�Jy��*A9<��|�|��];��q[�����۝b��l@�;+0F��ؓ�(O��6�ĺˍH�X9e�;Y�Gi��������X��TW}G�Z�z��A���Δ8R	/ ��/:��n�m�,�m����7+a�+Ef�c��5��z#Eo����3����R/��>W�E�GEE���}����U��N�6C��Ո߁������8�FDA���(oǃ����c��)=J8�hm�x��qQ�G���ّ���6HR���'g�<!��!����a�?��9Q�@���/����MuDX12h*�}�|s� �K����I���V��J��4	����ng�2���<��S��=����wR��`M&qz����3q��6�>������&��gB�Qd� �<l��lj1�:���x���&������ņRz�\*$O�T̗�aV�7���g�n��.�$��:U�"�W9Bp���/;��M*Aj$��u�@1d[��5̀��g`�5�;�,���͊#���R|gY�_$�<�`�pJmUE���<=�Rú��OH��\�gs�>P|u ���ϭ�?ǋ ����KQ��>f�os\XM�|�ۄ|#��Y8<�A���������]G����6��7��.d	�m�Y�A�$`��x���I�w��u+����L���?9���U�2È�m0����.�@��
9�����g͹��뤊u���A����C��]�G8	]��3s<G�$�U������B�965vdc�B��Y!?z���xeчXby����"E6���~���Nɜ��ϰ�?I"�X�6����Uf�N(�d-�L��n���פ�_���^υ�f��f��#C��^�W�W�Ts$z�����Z؄��E��NB|�tA
.�%��ӝò��}�c6t�h�$id��ެú�5uC�ٳv��J�� �t�T�e0�%�z�&�.Ձ��Y��\��SeE;�G��X�p{��J\�\Ťv�2���4��$�������6J�4�T�U��8�b����AM͕�����^j���DL(���ym/�]x�Ő%3�P|=��D��	Q+ɧ�bB5*5���f�j"��Ah�k�@B�[bk謖\�cfǷt�XPsm�>-[�-86�S��= A��~��x�Jc��1��S^	ڐ��!J�~ D�&;�
t�E2�vXY��0�#N4�Skm�'��b?~��/��՞      �      x��<ks�8��ǿ�Fjei-S|�e:��d&�Kv���cg2�IHd�WHʏ��/�[�]7@R�,'sSw{��j'�h4��F����
�-ߦ�Dh1/�#-WC��CFVp����Y^��u�W"� �4K+�V'ons��4��ȧU����$^#>�J�;��܋R9+���KV�<�!Dy���H���CYͣ[UŐ5U�m��Ȣ���h�b4g�Y�M�R��u|�X'�&)�c���ʆf=?����%����eT�Q:�^�2�9�:�J��V��ͤ*�8'oߎ� �K9貟% �yt�%bƌ�f�Xn��lQHO^��#MV_i;y���C��K�f}�����m�(cٲ���g7��^-Y�%��Z��Cࢂ)ƒ����bI�g9s	�Dp%�~��u�3�^��RLӹKXJ���i�**��\�D�C�
�t�qpTJQ:ˊ��0��/��5�r�X,�U���hHIV0�c6��_ZJ	Mo�2g~Dci�h�(�]���%�"��n�_ŷ�uH��
&�Yv�2�R���+�"ʑ'�-B�eA� ��U�=���T#��T�CZ��r|�͉M���������\�$FB�W����hΥ��ԛ�󢬠�����Yq�jv��y:s�Y�N�WQ�3��ӑ��
)���E꣰�����]�bwy���9�i����&쇗�/?��w�ϟ/���
U�T�ce(Jm�[��ԥ6Qx�ۓ�5[5��UU����-˱)�cS���U�r����Ѝ	��6T,m�@<S�K�ұ�i��ʱ��&/'����뢜XHg�k��Kۚ�r���P&��1�tǦe[����mq:@���c��-���Y��ۭ�.��?^�c>�m�(ͺnq:�m�s:���6�J��Oj�&�`��,Q�:/5M�K[�F]�ǼԹ�-Լ(u���r@i)�4M�AǪ��&G��_��_54M�\>(�|XjC[{ �b���m ����i�X���=ѱ4U�K�!Q�ϴƢnY��i+��꺡UE�A!�?4�hHU����Q���_:G�ğ��L�Ќ��Tغ|���{�ң�j�L�k�F�}����8r��|�s��@Kp&�+ZHޔ�z�C�(O����E������	�d0L�rZ��{�i�����ww����|���CC��"�����hEV���-�q�ڇęؚd�DU>������K�n�q���Co����eۻ��(@L:�и�q������@��7H?e��״b����m�8�o:�l8,��F���;M�h�'�������9z�)�?h;��Y�M��f���ԓ���.~��������UL�^��o��6���w��x�
�&��wiǤg�ꪫw�J���tD+��A���މ�<%�����"L��
�����p��p��-�������0x�6x�5�1s�Cw�<�G�qV����9�ϡ�p�BS28&�)�6n��a�=�Ǥ�Ô�c�88�A��͚R��f:�Er��
���uH߶XB	��%(ޡ�y�$��)�rЬ4�����l�o�D�����w�7 �^S8T;sbl�`������_��;�t�{�`���]����+�w�J�E>m |���lS�c�a�f2X!��V�#�W�r�w��)^	.)���VN�S�=���v�PB������`��D7��}c r@<f�
��W���G�mO�����=.�ߥ�#0�Z����$(����u�%E�n{�rdz�ce�� ����K&��A��KoP������!v+��ڐC���j����;g!L�a=w[.�5�����w��.�I�U�
�2�߮��U��\p���tTǥ�eua꣹G��9n�0�1���z~3�i���I�厚�H�Q���i5]�~ːE�r4-�Y�4�N�WY�X��0x?�q4O�����'X�w�3o;X��Q =�'�5S��`(�Ԍ�L�PC���S�� �uT��*�_V��� ���%tW��O8G�	�ȑM�L�XQ��/�y���3X���Y�ZQ$4�_c���|�:0�"�R֑~�?V8���b@S$uۃ�f���2�@�(J��m
s�綞b/n�U0��|(�b�g4��[�p��4-O`��
q�B��� _��:`5���ټ�blD�៲��%�zR+U�Y|R�"���T0�J�Q;��װ�I�+�}GI+�*�V3����f -�yɜ�c�!���⠶!T���8^��Z��`��bL����Y4�(��QQ�{
C��F�v"�2��<��N�rUx��t����C�WE2ֆ���@}���ژ�(a��ii�W�43U�03>��/�E��<��fS��� ^�N��m�^���y����=�V�,�hwf�s��eA4M���[PK����=����ĕQ��〘K��b�us&N<B��f�6�Fù٘�*;��;����3Ʀ�Z�� m�6_d��}��d2��:�mSWZ�L�f�x�h�vwY�"�ZM�����.v�J3M��5� ,�D�'.X�huҰ�u<mW�2�E	�y�+�<OמdQ!W�%���c��r��qc`]u�r��uf��(�y>�k�W�t�8�R��o_�9*X��(��(΂\ �.)C�QI »������$ys�������?�������X(b%��(D$� dK�(��IFr��J���I�w�"��v����?�G�7��qqP85]f���[~/s%�8��wq��A[�_ˮuDWRQ��=r����ճ�4��ד���%��3q�y:�ΤS���Xߓ^_�g/?K@��0�.K{��Lθ���~�N�F�ֻtbr�@�R\�]2]69{͟`�{^x5�W%g��o ���0�r���B�p�8�$�Q���(�yI�ٷX����U���=#g_c���|ي�m�N�hoO{Z�#��2~�\�`.�^f�8�z}�Ȧ8��H��l��I�J|�w1Vl���i*4m��Н ��:k[g;ZY�5�0*���E`�Ŕ���q�3�������x�
V��g����YU��+��*�ˬr/��
&/,eK�����V���W��^d��k��a�L�*���Q�`�n	7x/E��9i���$�>�|C��
�.�g�)�c�S&���N �{�x�d��9�88#T.��`w|;s�D#�{?�x��|�~����b����U?%h�v3њׄ�蛸V���B�Gj�$�Ap�H�H��i��^~����B|��%ʷ���ڼ��6+2f���f�%
�u0Y��Z!]�MVg�# h�3�B�z�W����7ըB�0\v]P8��z1��Ǐ@�@̅����Ķ�ɉJ��,
��%z�xhעs?�)��lQ�l���[�^t�Qj^�k_[!	�v��g}�ĸ]RZ�5^'|jc����X%�1dGPD$��+�$��K�dp4�@HԊ	,�KTc���z�z#.?`��n4��� �%�E�US3�=á4ܿ���`��J����m1T+�J�m�\.�$�H�9�N��z~�H�0�{䋅y��הG�%��_�/�q�@P�{8���W�J��梽���.Ȳ �p�	)�UR��#<p�fՠ�묙�u�n!#\Q���E}%�1M�i� ��4=������h�>'/���.���^�HG��U�c��ht�j�]5j�;ן�*A���/���}����mo}����L8x5��jH��5�.����<@GU�j��^��&���7U��ta���	<h�A�W+f(���*�yA�rS��B�o@de)��[+�[6P�!�bcVձ=�(�D�̉j(�a�J}B�^�!
~�<G�]�zb���L�������ò��k�k�"a��o�fAH'���r8��pƀ0%���-�J|��]@�	j����|�����S���dn{e8�<�j�}>���Z����ц��9���b��ݡ7�5Js$���_�O�Kӊ���s�/��=�[�g1����oH�@7�f�^K{=o���K����y@!���"�>!C�o$H����^�4[`�6����:/<�y�s�ͻ2 [�5�� �  ���v��{�\���������M�`�b���D�&�)�Z�sHe�z�v{����9K��a}:X����1�����oHׯ9������t����߳7�:	�ls<0��ei�|ȳ�(+DA�Zwk)]4�uqw�\_��_/�������Ӳ��*,�k��:�ZQ�� ��J�Z17��D\�ͣn��;�j�4���~.߾����a.�������l��t�R�~�p�һ�0���TG����_�����7%{f}����������u��3��r�&���h����`��6���.	�8K�hJ<'���拑8;q�%'�I6A��j�K@��Y�@B��G��F��5{H�ф��#��,͛.I�نK�G�!O�\�c0�-t!_GO�JM��09���ۅ�h�G�d�NR��^�:L#PV^"{�<B�1 sX� |AU�H״�-,ɮ X�Y"���h��zwx��4�d�m�:��{D�&1����ҋ��:Uλ	p؀�;[��jHRԸP[vU�� ��� <�	�n-f����@����̻	e�]B�_oo�_x������V/��⹑~�̳s(@���i��|Q�]�^�	�u���(���)b�VK�r�Z���Zu]һ�9���ө�D�t�\�T<;5�"��-oI1��+s;Ir��<Q���ٓ���OdO�^���1���{/X�M���=i��:���3�k�FΤ�s��t��?�Ci���N���Ci)�?�K9��R�ȡo�P���ќɱR�L�p{<�ȝ�xNd7�R�s(E�j���m�d]ֹ��9������He"�TE9����j"g��;���i3�RߙCi�IsC�9�&��?�Ci�~6��:�>`a���}�>�r�C�ϡ��P�s(�9���}�>�r�C�ϡ��P�s(�9���}�>�r�C�ϡ��P�s(�9���}�>�r�C�ϡ��P�s(�9���}��C�4}�T��r~U���Et�_�e�����|	9��\I�QtG�dSQ�X_ڟ�v�wj��g�GF희����/m�'�&4ERL�DeȦe<?P��n�������������L����Z������u�Y��:��c��������סUm'�VgMo���߇���zǜj��Y������'�Uc'���Ò�@5���n�_������MG˓vE܃���o�wqk�ej��A@��͵���	�ytU���~�~~Q�j��V�Շ�o僃�����      �      x������ � �      �     x�u�1N1E��)���I���4���g�ZH����g&z��t������z�m؄Q/l��m�2)�E�d�Wm5G�t�ЇZw�C����Y�)��Q-I0�y��fYS�q�����!�r�'�'�Q-1{?��<�\5{wb����,��(���i�	�tŎ�k�8�ȣN�]0�ԔU#NX򄸲�����@�(��z�	K�Ȯ����/',���i�����u�9�%TTG�=���Ta��Ϸ]�Ċ���qzND�d�t      �      x������ � �      �      x������ � �      �   f   x��˱�0D��4��@�M�����3���'����{�i0���eǁ�;��rT��9c��-=$T$�?�9/ۤ�sa�-W�-{�W��1uIr|��J)'Q� <      �     x����n�D�קO1{3g�{v�DU�m��&��4���E���,X�g/�BH���
�q&��q�T+�$����3���B�z�Ŧ��� Ap43.g"g�{���op���/�m8>
ۚ~�3f*�N���|"@� �
�Sj*`� ɩ�$���:Hr� ���d|�v�P.H�y��n�Yo�y�nA��xH@��r� ����Gs�O��7*�p�	Eڀ�2S��0�=Z�:S�zΨԱ|X?\_��@�I�q��JdJP'JG�������뙰���s�q#zҨԡ-8��(��E�R�"K��2��u�*�,겺�@�a5r/��:���RFn��������s����Wͯ�o�����y͚��o��w�5ӷ�X�c�K���B3�Ş-mo��ێ�M)d/�j���vL[�|&4��%�h2����K�`�4��?�g��в|���v�EMw�L43.%���D�|�����t}!�K��9̏��Rb����=�ֲ�߱8X�׍>W�8o�Z"��T�ȩע����������I!�gR�#R�cۛ�����;��+�9f�o`�7�*�EQl^-�����G��dH��^��p۳G�Ħ��6�(���+�6vC+ƕ�N���.���+v^��xy����M�~pw�p!G��l�,�ݥ�Lp�e\,'�!kDJ,mr3�A�m�#cć�4f�<�񨔀&�8��4g�7�$\N��)�����KW"�^���3��HN���u���Lh/%yA����B:b�M��f��0�����6�qd�y%�4��CG�p^�V�P��Dcj��L��́��V��.v��KC�N��̌ک�h���G��glg����%C�Y��<"%��wV�e�*v曇�^�{�W�v=@�CKi�M��<*%6�x��C�A�}�p�t9�=�tޛA�J	��f퓰VJ9cᓫ7_\���aY����c<�S�PZ/�x�)#�s*%0����]��N��Q�\��=�Z�g���ٿ��/      �   �  x�}�K��0D��)�w��ߖ�2ǘ�Gˀ�T��:�P*%A�Kᅑl�ؘW,͢���A����E�?p�ƥ�{���R�^>q�}el*�*��.u<��ڄ@4�೔x�^V��I ?�O)�%�7��n�+Z���1�,ՆU��9Y���FeeiJM*�b?K���t�5"�|DYDx��c4- RN�m*���;���g\I��tt��Y>��	צS��d�t�X�z>*����r�~���G��~�}DH��R��=��C�̉�|ￂ����{~ x�K����_s|L��ؐV��1����g�d�s�9k�2J?�r?�9�C�/���S�����Q�>���}����[�?���9�FA�n��>ӈ�d�R�"���(��3z�K�^�s}�n�����xf��/)���G�כ\���Sf�3=+�����W�O�s�2����l��Y.)CEsߥ@�.��Y�lwY	�������H��C��^�_��      �   �   x���K
�0E���*:/)�lGv�d�t��%�@�<i@.8�3(�C�c��喬�d/2ݑ��7�;h�9�.�_�.E��R���28@'���C�!884p"�+�/�b]
�F���(#���<A@s����L�NR&����Z�2���XR����:����+�%VĿ�z�Ċ�o��/-���U���      �      x������ � �      �     x���]�ݸ���U�����9��
�%h'm�63�d������e��,Ap��.i�"i��rRj������_�������N���(!�0">�x*�a6��EBP�����$&��1}��Ղ��o������_���
	�!!�@�?����~|7�O�^6\����MT�j5\$"��@���0\0$j�(����Q�j����f8�bVʝ���eT��!!�r�
�s�,*�E%�/�v��@B��1!^6��EP�MT��XP��Õ4����k���I��#)�**QzA��br�p= ;i�a8��ZE%�-�v��@<B��&H}�N͂Bm�T��p���n/* N ���@rҦ�pZ�%�{Q�R��p,�<f;����[W���p1N��H��MT��j7\�!��X���� &\L��z���&*QaA��r�p,�����'�zV�x�Pt��^.�V�m+]�(�\3\b��XC�K�q��D��n��E�U��� &\O���x�(����	�j�P����̂J7Q�
bA��"r�p] I�kk����<�x�8�}"w*z���\?�����ܺ�
3�۲�,�#�M�բ�O�&����)��p�`� �f;����0 �o��f��O"�~�!��E�b�K����cVK�yGKؙI-�-�%ͼ�����#�t��4�ΚI��r�A���!���v��%b�]H~�ﯿ��v��/�,a�M ����rI�J|���!�9(�I�>����T���1^��}��s�����|[
����~;K�˒NE�Oj�(��44�݀�1�o�����jc7������!fQ�����sH{����A���2����C��5`�9
�7���s��@y����kq�^��A���+d�~��<��%���O� �.�,L�"�&:gW*yo�h%ڔ���މ�ֽ;:�lw�k�P1aw�����/��/�M��_�������V��F�D4�%lJU:}�xT�m��)>�����~�MS"RA��yC�zYX�}2P���h�1K�{��U��`f���'��� G���@H�i��p@��� �.,~J���N�14���S��C�#`�2����r"b�(W*x�y����TDH��gLR��z%��"&G�j�29�-\��Nuo-G�<Ƹ�d�k��fi����h�zOe}�aY�<dxJ���m�;��T�K���si�~��
5%�3���K@Z�!�5�`����f�mP�B��p��evGK}G����˰���������3x�y*��PQɖ����k5PF�Y8�AK�`G�q�,
��Oi���P�Qd �M*
n��Rc!��^�\D�h ��;��5�+��\C��S��x�����9|�{`�Oig�C%�憁j<���N֌4.�&�"<6���¤nS�����q�8�<��g�7ª�r�m��|�!�SA0S��6�l)b<ǫZ�n\fW���9����@���$_��o�G{ͼ�9��R���?ٻ�t�y[��o$&`8�vw�T�y\X����t4��Peǖ�L?��qb�8d��T�<%~
���Ƶ������u���DmIw�y,_�5��~�6�\H@���8�[���s@�r~�7�Z�����*M�!ř���[`����2��J͚���aSt��]h��(�*"�(�D���� KW��}���(�'n��E�o���|��i*�X��	�^
ڼf@���0�}/k����;��!�-G�>�OB>��&�k.�1��ү���y��>uޚu��:�~H�=h�t��YJ�|��^�@ROzGO�Ro������,n��+�̺�.�q̯[�ؓ}��1]Jߝ1M}+�6p�!�� �\ЪDk�sw��U.kc=~�T�jq��c�`]7�PKO��Z�E��	�Gk����m@�+��-\nO��F{v�6���}�g0A`bj��ݴ!%����r�؂���rH~fb�����y-��JX��Zx#k���B�
Ek9`��
�k9$�������gq���^�GO%t@������~ZfU���U轼C8�:$�GM�׾elVǗ�~�R�j��vu�^#u���:����L�\E���if�=-�r�f�����
9De��/��M��#�O<>TX}*Xx	�����p���y	ƈ����P|0�s0�`ã��R�^���l��>���|�x��*?,���U������.n���	�N��:>�X8�o���Ve�/E�{��~+�&/��K�&��$��_
^8�
���^IEk����܅���+�f/��/�ŀ�u˓B��蝤ۑ稵�z�:�5Ǽ�%�}-����8�--��h1�͓�o�1�h���ڠeK�i�6k�;1[
mHQ�R�y�eu��l)��㖂畨�1��X�`�G�bI*Z��d�t��A �]�l�ao��8� k�mwx�@���?�%� �M����$��Fbd�1�%DE�![���s��G�*z�����R��-���9d�s�2z�8�)\E�1�u��C#N��Z3ɇsQ�m��h��u�ƹ�`�&։��ű(Y{+|\T�<�BvR&Z�6�K<N+J�Bm���
���s����SgV�R9����f5�V7k?�0+F��w4���<<��qfu+�ɬ�ܬ>�.��2�0kx�M�F�lǡA��0�;��粭��q�O-f3㞈�������2�bG]����G��v�$�U#��簣.�f՘��9쪫��?YPj����s0�`ܣ�;��Vj�}:y�iu�5�O�8x�^��)�g�ǥ�z��3�_�9~uF&j�Wg:��WgtBҳ�cj>lɰ�R��&^�F߹Y���9�����,��r3=f���
x/mE�1�#��0f@a�e� ��'�
[�j~;$��ʤ��_�:=q<���z|�zX���D~�@�hō0��b�#��i]92�N.����ͣ�����%F�W��Z�����9~x�&j�ɃNf����Ma�G�p,���!;�/�/_�u6��            x���ͮ�8��9�~��7�����6��y�FW�����~���%�$'��y�D�0��͌Z4#M�Wu�\��������36�n�����̗�_6>BN��1���������_����?����������{� �7ȿ��ǿ���?�������gF�.Z�h���5�@�ذ�#i���2c��. UeX 4k(� �2�A�S��S�AL`l��=�����A����B����E�~E����y����((�m�(�SW�a놛xjàu�l[qhEtVcLz��0��aJPن�")� &1���vYeJXW(� �2��W�7*�P�yK�1��R���(��Z�#c�$�m�)۠�+�m�R5����1R,a�8�ah���bc�D�mh���bQBPT�$�D�D	�DF�`�J�`%Jz-EF���D�(A/�HiHa$	��ID�)E�1�"�(��փ�̆�k?�ZL��~��/_���8�2��IIV�FY{j���JaÍ=�cЋ(E¶ ����|ʔmH����)Ue�W�P�A�%lCn�Nc�y�2�v��X)QeJ��(� &3����lCٖ+e��؆��X�m(M��l���)Ac��#c�$²��d�e�
e�T�6��hl�4˘)�"ɰ̯R$)�J)�!I���Q$٢P��"!0�"�z_�H�E{#kI�pM�zs[�Q%١(���%�&F�L�C�n#M�M���>�8�e�5�:!8��'F�O�Zg-�O�O�F�dXI��Q(��(F#R2�M[˨���ڄJɰ�j�F�dX��*V�#�
��h�+�1b��0j����
�YXG����R,��a=�X�X�J��b���b!8�b�G\T�����,�,�$c�J�<J��"��`��T�%
�b!8�d��fPI��y�$�a$,�ؠ�,� b%Y�Y`�F�fIp��f!8�f!0*͒`�DJ�F�`�$�}DJ�F��#�$K���(�Bpɂ�h&�d�-R�(�Bp�R��T��EM�f!8�f�peI*�B�(�Ra�dB�����R�gF�0B�0�d)�X�͌da8�d)���H�b႐�R`��fB�Xz�E#Y���^��p�Rp	�h$K�2�0�������B�(��+��Q,�P,��F�\ɯ�b)fp%K����Q,�}F��!���x轪Q,�����ba8�ba0łO���(�q�Q,���J��j�3�f!8�f����QiX�v��,�v�a4��:��,��4�a4�~�J�T��,��,�Y�U
gU���v�-z�2�"�U���DK�A��X�pV%Z`]�9J�F��r�s*���Q���0����D,�8ǈ⎐,nԝ�H�j�r��Bp<!Y*ܨ;��,��P��da8�d�˓�(�j1�Q,�P,VE��(�
��3��­��b�p��F�0<F�T��u�P,�>]�(���K40���v��b����F���B`K���] K��%4����.2������-U�(�Yp�,��+�8�F��c!Rzoa"�X��%�K��@)�I�b)p!H*ł5B��aK�JT�oa%Y#Yp
'�d��F�(�Bp�d���˕�0��2�+���7�\\�2�+���e%�r��p�5c�"�=�W�%^��q�z��@�"�{��+����ǁ�E0�Px�"<T+��`��Rx�"<<P+�S�b>�W,+��%�B�"�W,�\�b�8P�p^�4v,�FA�7*�k�P���0��2�Qi8��J�F���ި4,�xCi��hxB��f��)���2�V�UI�����,��,p��J��>���d!8�d��iU����x�(؏�N�X`�;J�F��b��i�(�Bp�k,ީ��xGI�Ch�)^�X,�z�(�,����*���bau�{F�0B�X([��(k`�{F�0B�X���^�X,_�#Y!Y���4������da8�d��r��ba;�F�0B�Xx9��f�� ��f!8��,|�Q�Y,����h�Ch����,X���,��,~
�G�f�^d$��_1�,�>�D�&�%Z#Z`��+��
�\�h!8�h�Un��k+<�%�rF��*�W��\��ٶ�-�<��m�L���-pƄW��vb�-�aD��*��
%Z0Ϲ�v�A����۠D�aD<%��n�W<bڭp`T�y�F%Z�$OL��8�j���b���g\(�BpՂ�ӈ�%geD���!<��a��:�}+<��3�����aɩ�~+<�EÈ�C��]PL�Z�1�������A1�Vx(�1��q�&x��`��|�o��uF�<�V0hi	���#��rB�8�}�b n��Fo �rB�8����������C���A1��`0p)!Yl���[���r�f!8�f�}٠�+<R��[��hؗ���AE̿�8�f�M�o����,��,^j�����q��a�"(�
G�Y�+���+����q���`����+<��p9�Y<�p���)�Y�Y<���b��`4p9�Z<�{p������q���X���+<�T#p9�Z�WŃb��`�p9#Zp�F1Wx0��	��-�^���+<�2�\����p��	���b.��pm�\�������qт-�����@���8�h��&�b��pPQ���0��������R�\�È8f (f�
;1��0�ST���!���,pXAP��ub.�aD�'Cp�����q�}���h�� F�rB�x�?(F�
�#Y0'B�x1**F�6zGb.�!K����b ��ȏ� \�C� ��G� \��.p9!X�OG� \�!���,���b n��.�osϿ~�`	�j���,Vߣb ��`�p9!X�$p�c���q��_��[���!��rF��KQ1Wx0։	��1x �P�¢�+<� p9#Y`�.*&�
f21��0�[�R,�0}$�rF��sdQ1 Wx0e���Q,��p�6�� \��Hx:<*�
�Wb.�a$<�p~O"p9#Y�i����+<�\��HXތ���@���8�f��T�b����N���*<W003p����\�@����ᙟ����xX3p�� ����F�Dx:&3p*Nbn��W���X�Scp#�4�1��Tcp#��\�C���u�j.�T�f!0�d�X����F���\�CH��D�\xF#R3p	!X"�G�������p��P����L�F�Fx+#2#p#l|F�\xO+Rp	!WnU�\I��C�e8�\I�-���ദHM�M��Ì�M�o��F�$8�(Q#p�,$fn�����`)?Q#p�W`�,�&�&��5���%�c�I57������p����%�F�B��	��,	6P�j n���D�e8�`I�n@RM�M����	����+�I5 7��G��&��1p;��J�`%X����̿M�djRͿM�ҝ�����tb��&������`%8Qp�x���	Vn�j n���D�Mp������ȕ&j�m��}3�6��I5�/��[C��l��~���,Q�o!W2<d�T�o3<Ֆ��oϘ�CK������~�����~�a&Q�o�W2<��T�o3l%j�-�!K��<��ی�g�����Œ�e���~��i�DM�e8�b�xC��~����~�p��7'���o�&j�-�a4l-%���h��~�p��S��xK�e8�h�����;h�~�pтw�����W�f�b3�6Æ^R��Ͱ��ѷ��,į��,�A��e8�d���j�m�Uj�m�}�Č�͸��}����D��e8�d�H�j�-����)�\)�j�m��uJ��[�Cȕ    ?��Tso��Q6�\a8�\��JV��-�f������+�j�j�m���L��e8�\)�!�Uco,!ej�-�a���:Y5������z�p�R�q���z[ใLM�e8�^)�AVM���25���j��zY5��ʙz[`*3So<&�USo��̎�+�|�������j�m��35����Qf��x�:���8�-SCo#X���z[`9*SCo<u����X�j�m���L�e8�b����z[���L�-�����V��j�m���L�e8�d��L5����A���2F��DV��7�25��0�2�j�m��<25��0�^�˪���7��b
�W*���U�n+<{��q���+X�j�mŅj�-�!�J�Gt�j�m�%j�-�!�JŕռۊKԼ[�C��h���Vx�$S�n	3��}�j�m�;+j�m�G�33��FzV����&j���V�H�̸�
�Y5��q���Vxd:3�n+��fո�
۟�w[�w[a�2���V�ͩq�WȘq�rΪy���x�m0ج�p�m���w�y0���΁b��~���n;w�9�<�Y�e~�m��h�oI�,5?��ppB�Bq�A�E0�G*��ێC�P��[��4K�`�h��y(
�xKr�f��U�����V��'�
-P���<~�m����o;�Jp�``��o;�%K�`�dU�����
O�%9�f���T����O�%9�f���H�'�vN<�s`p:B�Xx���#o���3x�-�!4��M��|����N���G��̞d�;�-��0�����)���G���"��87艁�"��Hx��R��0�����8ؼ���:��T��y�2s*c\p�ש0�,e�8�<���2�e�D�<�"Ie�e�<�)�ype	Uc�E���h�0Ʃ��<O�_P10�aLT����(�0'3�aLQ��z�2��e3�:x2�$����Kr�u�%�QI�(��,��,��T���Q���0�Nv/Y%Y�9��)�Bp�B`T���J�$�a$�QI\˔d!8�d�յ���`{�d��䴻�^g�����L�V:�in�O�ip&�]O�Q^�ә��{wE:��<�ip��1�D��9�1�t8�a�U�<ȩ�1c��<S�1�a�'�#0Ae�E�:�I�yP�լ2�
e�T�<$�1*�0�R�a�c�C��j��<��y��Ĭ&��üL��^��<��*󐦫�P�a�Y,�>U��,�2��4�a4�QiXʨ��,��,F�Y`e�ZJ�`�c4��Y�J�<J�F���FթT�V�Z�Z�����@��*��<���K�����S�v�!T�jf쯍��Uڛy������x���<��y�	����4�a\f��sD�/�qSU���f0�y�c��{.8�y��)�0'0���e�*�0/Q�aNf̃��PT�a^�̃��h�0ƪ̃���(�0�3�aLP�W�	�*<�Rc��Ux6�Ƭ0���
5�<�!4K�����,v�kb4�!4K�����,o��Y�Y*�G%�h�x���p��`4��b����p��`4���UfT�!T�[�����5㴿��m�d����+db�z�y�M�88ms�9k�=�x�M�u�}���P�SN1��e����cU��R@��Y�� �X�1'�,�w�`�,���~J����U���P�0U��}�8��#�ߗ�5䴴T	u;XZ�o�}��e�#��8��s����;��w��k' ��q�a�y��KK���/-5�ܯ�/��3У���0@N�Y�֪�31�n$K٘1��,��9#X)PFV:b�����3E"�V��u_.~�B��'Yg�S5P�ASߝ�6���7ߝI(�ۏm�#@Ve�~gEt��h�i$O1(��D+WF�ƀ�B#%�����
�u6zL,����RFrG�_�r^h�ļ,4�7�lm(|)�a܎�[u����4u݉�a	��N|s݉<R3�	#)P��m���9#і��
e$�:#1��H��iKI���Ȁ���/>0&�#�/��2޽��/~�x[f\�͘/W�L~X�cj��snV]@�S�@e�w&:�9jĺ�;���F]$s0���Xg����x_e$V�36�gB�A���R�r�� Q�f��Wpĸ��I;gh��7�(������ı�$�Em��F��S,@�hl<ά�������(#	��A��S��r��(Q���i��k��>"��8q缛�����v��w��Q�w��w/RŋT,�Ho���8V��N,��4ҿf�-�*Y�F����v�->_�3� o;Զ��³J�!=l�7N�9w�. �zOqM=w&�!Y��v��Τu��[@��ܞ��r�������֝�jan��{�+�WQu�e�sƖm \�v�ub"�Yv;q⽍�ݗ=ad
���a��}<Hb=��g�B�R@���'휁e^kh���V�ۉx�w#��8r�AM��cU��

���f��T 	�<s_l*��Z�휡e6����DK���8}���H��C��"a�����#G�S�$���}M��Ζ����[���s��:��=i�>��m$�[I������r��C�� ����=o�>�a�5N�97�. "U�e���w&8p��N���B����	#��A�0��+��
�'�6Э� �� K��adI�����y�-$OI�rj����}^��WbƑ����X���N6Bh徝��d�F,;q侃�d��F�=�p�]����=����p>`�8d��:.�"ϑ�R��"e$J�{,HB���<
e1!��kx�[��� ��l�����w��Nqྃ�X�.)4���A�0��}:�G�m�ž��(�,0�G+�Q�}B$ܗ��0��X�2'�+�}$H�ݍ�羬�򹽰�o$-�'g`��ޓ�蓳��DZ��Ny� ����V��6R�p��
a+=ѹ�����+�]X���",mQ�};�p_Y�o'�-���2��Y�O�`T�7N����Ni��Q%������ �ND�N;q�N�`�x��"adc�;(F�ǃ��}���BF㔵e��4D)�mD���]��"ɏ-e$~�F�v�`t���%���SZ�nT�?�2..[鉺e��L,���v��}O���L	~��)��#�񜊜W����]��v	/��e�'D,��!��W�T��J�1��R���8�q�h�b|x|��J+��ڵ�����;h��'1�>�c�m$�]���FFpdM@�݌yO�K��/�6��Vz�+�6v��B)�mDY�]��"�+RF��UNk�� 	�A�v�Ćz�N"�P7�`^@DuKZ�n٦=#A����i/$ ��ǒ�(4�{�4EݨK��P��b��_���}"+�P?��@��c��Q�� ���N��Y��E"�{��F��*����S���}Q8��VZ�+˞ �S��	�ܷq�IKt�>�$?V����W�a�>$�>)v�����m�G�'휡eO�#��	��عC,;q쾍����JI�/s���b��eN����\��Ziz�e
����9�n |��I'�/�eWb�_�kİ�@-��X�0���tP:�<��P��O��W������������N(vߋ��IOt�>�$?����0��u��@�o[��S�bj���4C��n�»>'�P�ز_��BoĴ'��HP�9�B#=~�:i���=� 	��]ߓ#�G>��8A���7D7��{��r�N$�Yz�~�黃�J%MQhc�r�IWԿo�> I��m�N���o��sƖ=A�V�����+1oe�����J�]5'=Qhcǁ$MQ���� $��v4��>ݚ[�D���Vo ��s�
����Wb�ߕiİ'��H8ԥ)
�������?��Hb��h�α�˶0��"�P�~l��ߜm�����b{������ͽ�`q�IO�( �_�)�ߏ�~ �K量��{v'�ЕeO�2�Jyo#�    U]Z�K�=I����1�+r���ǃ$�ߎ���}�G��ϲNZ�������@:�~q4�F�Mv'-Q?8�{"��E�ŏ%=ѵ���F����h��J������1|4�I+te��*Q:���6"���$�D��*cd��#���xP��V��9�_C��d��fhx��@8����+��s�N��aP��$�@��z����s7P���:(F�yo�G>'}щ��SĲ��9醮,�@��*ᾃ�gG[']ѥ��$�`�-a$S��n�>$�>��8';C~8�*%��0)F�@�Q�P�� BV��aVpq}�e��&��]ٸ��0(��o�;��I��.rH�~��pD�I34L�/>��P�� <\�IW4�*.OR�A+i��m�����h�\t 	�q�EN��݇p��(휡e;o��P�e#���C�tEì��$5��'8銮m���-&��������
,+���9�v^�Sz��y��w2��jD6v��j���D8�����-������$�d�����:b�5��N�c���Dø �<�������h���^ <��KK4���A��@�7f�'��a���x鉮�� �������Dp�^h?���!�6�����KG��^'�U����s�[��\������>Јؘ{w��E�[��q�ɔ��>X]6�x�;�.�㊧�������v�Ь'(�x^��U<b�O/m�0�xn��HP�x�#��)i��I�S�K��{�~|�q�ڲ�i�R�ۈ8 �/�t_���u�n��.��|�,��]"�܈p�w�����e����� �`__B���d�yy��h�t�(�*Vw��9C�6�H[4���(���C����Ԃ �����]�AxU��h��t7P~x\U��]�/��c�o�{銮,�@���-J��I�Wo��G��2����X4R@ps��̯-͊�(#�z	����������@���"��8�Y'�%�l�''��������f}��N,;q�'	4�$��9
�d@�����d���{�~����ڰ��+�tDI�u"~�Hkx���@��2�db��׽�9#ǥ��PFb�X,/K�yy��h|���z9N�ʗI��	�Yg>��3W �DYA��'=�8�p%3	��F���i���+ ���}�7k�B"�z錎-����@�����i'֩�N�H썲!��@Vcd��}v��ί��362�#�/�A9//9��[!��Y~3YN%x��0j:~���:�>��s�AS�D�p�~��e'���D�x ��Ɂ�9��-/Z��%WpF�kQ�X�V�/nǼ���y<�����A�7�|	;p�L=�?U$l��Q�A���y:�����^z��J]���K�9@D��;�_����ā��2��X�FF<v��l#�ܧ�������Q��Z_��2(r�ۈ����i��i���1���xWS+g��""CI��2F b��GƢ?�,� ��h����w&�!��1r��"��s�L�����`�`��O��}�H����jm���4���30K�;h����;q�;�$�l#e$J����
$���rs����m�,U������s����;h�3w�3;��3�/�%l�@���=5Hb��
u��%�ҫW�����Xv�����Zyo'�N[pi������ �o�	)P9l|��
$�^E3��2���vov�вD���;h��'���.���8v�F�����(F�ܷ���!���ۊ����'dʴ�:6̃/�}g�B��J�A���ja(g�Z�7�3�rK�����1-�� Zb��.!���������v� ư�?�"�^@\X
M�lO��m�³JC�;q�'���"ެ]�p9/�����Gj�Dx��G��/w�':b}b�ȃ����*�Q	�:�th��C�LZ,w1k�\�����'ʸxs^7c^H��'y�ÛYz�b�.���Wuv��w��}�$�ï� �|��ʗu��ֆ�v�ݬ3�J	)�N�D��R���������o����0��\fwXrO����f�����|��������l��F��y�ƴw��u;�-.�J�<9,+~������Y=澚�Kn<��+ q�;d&W*�tY�+O	Y�+�N�m��l!Ѫt�2��S�taaL��,m��\>]p,*]Б.�7�2�a�ߘҗ��WS��7��R)���AڲO�Ь��eҍ}�֫��ho�y��P�XI������R��SU����e�
���a�;tO
��>��U@KT�p�<�!�I���H��åE�L��OX��F�.�t4���V�K!�'2]8�.K�.W�.D�p�AV�.�H���b��t�E�X2]F��ƥ�R���nP���s�.W�:U&�)��[4���"��
ǥ	Ǣ��Z�����H�������D!��L����������
�V&Kd�Ǔ����t�X�tḊt!K
�t�%���B@针����V�Kb�'�����t�X�tḊt!K�?�.�H������t��ta�C1�����t�X�tḊt�U�ȥ%e�D}�PE�Eޘ>K
�W�K��tI?�.I�.TI#)���.�U�<�6]((�.'�"��'�B�U�reN�'S��t	�S,m��\:]N�y�0��2]�>]�+�ta^�t���t��B��҅c�Ӆ�*����πt�|�S�Q�̧��taz"5�I�2](m�5�Y�.K�.W�.D�p�AI��'>����|
ʧ��8��G�|�K˴!��gaT��,u��\>],��j�3 ]3�"�Ӆ�*҅�`����$Z�.�v#q�|ƥ�ҧ���t���H�ϧ�E��}.�?j��"]��>�ْ҅�WW���1}�A�Y@�3������:�q4�7�3�KI�������d/K[�oo�?�4�5�p}Ts�������%*x8V���u_�-�_��ÇK
?�.�H������t	E�.]�"	T��,u��\>]�wS�҅ E]�0Du�0P>]#��G�¡u�(y�t�`\�p,}�p\E��>F�\�`PR�Aԧ<Ŗ�"]�#�)}�.Z�.���ta�)q�±���q邷�Kʺt��MY�.�O��v�G�¡u钩j�҅�Q�B���Br�taJT~<]�_�.�O�@}*��֥ut=*]�@,L�Xñ���r�d�xBZ*L�0��J��M
J'�3���
GV�
כ�\��0*WH�:W�h\�;���V�J�
e������ȕ�C:�ϒ�B+����l�ta�R�p�±���4̆O��l�t!@V�.Q�.�OG���(]8�.]��\��0*]H�>]���*����Kr�t!��t!��ta^�t���t��Ǒ����t�X�t��ZN�.�����>�5�)�>]�"]��x���O���BE��ga\�p��(]�����e3��g@��>EԧU�q8��'��ta.�g���¸t�X�t�?�.TC����)��T�.�M��QC�D+Ӆ9����>�҅c�Ӆ�*���TC�����IY��g�|�x"�?��sd]�0'A2��'YT�p�#O�7δX�}Ib���LC%��G�]�ܛ�ed�����{Ӿ,S�D,o%zӾ��8Ak�Iћ�e�c�"v{���!!�G��f��7��0/.0J���=
��?�ۂ�s�}Np�r��@"z`�p��'K�<.�da�\�\i��.�d��|��1��Sp�(`0Y,m���q�d��
�-��҅"jӅ���RS�����V�˕9��J�K���ʤK�T����E����\�t� ��Ӆ�H��K�`1d�\h�.F�.4Z�.w�,z�!҅=PN��K���,�L�p>8]8�U��a5�X]��P2].�EL[}��hE�ܙ��D��9�^,N��K����b�t� ��ӥ�~8E��D]��P2]�Ƽ�>]h�"]��i�8"]xN��K�t�(�K�� a��8�.�+҅$    �҅���r�-b��ӅF+��ΜF�'�E`Lעx�.<K�.�a=�v�d�\������"]��uSХ	%��B[�tЧ�V�˝9��@�����8]�E���K���2].�y��t�@Q�.$Q�.�Y�t��1��B��rgN�'�"0*�"N��K����<��t �\"N������"@���Jf˅����Ȗ;s<���Q��p��z	$U�8�{F.[��y��l!A��~'�R����B�t��1�o��h>]ޘ��!Z�F�8n�+X�t��˅l�_���a҅)��,Q�.�N�j���7�y�*]*��B4�;��O���`���>r�҅l�_�����M}��K���Կ�1�o��hE�ܙ��!��F�pS_�R�K�2�#�.TS���HT�>OT����R���F#��U��נ�t0g�SaS�1�ߊ��*֑.���g��-�}�HzT��e�v
���}_��� X[�Ҿwf�@�|����CU��O���v�VTi�?A�L݈���/�yn�P�w'{g4+4�ϸT��;7�C��F�d<��Jk������4��埠�vb1�܈�_�	͏�UK���a�V���W�??x���D��.�M�jPT�F�:Z1_0��]�K�+���\s5ӟ�.�̏�_ܰ�q�:!zL����㶴��@#�0�ȍ�K렌!�'�7�i��+�
d�OCR$��t�t_�?\��+�?9c�xP�A �6"<LP��~!.V6�qe�JO�0w��֢��e�W<�tIӠ��Q5���!�'t���)5T鲯cG��t���i��w>`})�Ţ<�t$1`G�CL/�	Α�ei�X�,��~�����|I+PY<ΓB<�D{�.�M��G"ĕ�ǟ��U/?��@=��I�_��u�	�ԟ�ei��L�Ⴧ��ht�>ꚙ�� V�?����`ԖY��0x���U��o�㨶�C�?bd�`5��8����g&�-�v�D�%6[6"ο���d˝����͖s=	e�
�E�ҥK~45Lq�t��	^l3N���xhV͊t"��Y�.$�L�m�Y�.4Z�.w�4z2�.�
���R��5m�J� 3�.�>B�'k��b���_S�OKukQ��������.�t��|��1��Sp�(`0],]����n��B���^
�Kxଫ�d	�휨KJ&K���g]��B��rgNc����p��,]��u�V2W���u��TI�
���HTm4]�@2Ip����	Ba�Ah�$#?���g��>2s��q�̐c�uS�����l����/>5:�x4Uz�P.E��E<[u��h>Uޘ��8]0�.
�*]��LT��$��?2�!�8�.����R�Iԥ	%��B[Ĵӧ�V�˝9�G���M�`8]x�.]�#07��L���U���8]���t)�%�$͉�t!�d�$��T��ӅF+��ΜF�'�E`Du��p��,]��c.�D�Kn�����.���@�t"N��KJ�˅���O�H�;s=�H�Ӆg�ҥ>�Wd���I���ˡ+b�W���U��B�l��!���k�|��1��{����޽�����RYH6��i���=R��?���u��ppyc�����N�,,Y�+���OD��(U�;�
�6W2�O#��4tpߞ��v�Q�(�����x�
���
ӶoP.W�$F劧6-���p��ٵ������$G�+�@#�s�����_߳�Ѻ\	�{���+`T�0=��:rep�xM�����,F�#�k����|����6�7�#Ό'1$�^��He�%J�Aי�F[�ooп?�,�U�x}TĤ�Mo��yfl0����!Q�����*׊�/�T�m՟ޕp���:1b��n����k��(#3��4�)�gJ���^;�(�ǽ��+��{�.��+��$.���qOs�xP�A �6",���hO�2IC{�=�e�N��e����r��i�����l鰽�����*x�m{�������נ	=`,x��q2�p�@7t���H�2�ܑ�uiI9�Kή�����[<�FAw�E�=O�I������v��,w�$��n��¶AaM��V��۔c�b-��r��zt�>��9]8z�|�y�`�
�����w�����=�hӈ՟��u"��ۈ:BHXN���Hp���Ks�yY�=L��*�u�4��F�w�D{���A��+Q�z��!i8n�(ڀ�ug{��������,m���7;JK�N�G�0��FoxOGiia��J��67?��=7�;�Ѭ0=�m�hђO�pD�t��[��ȍ���Q�V9F�q���J�q��݊"?��8�ˤ��\��ճ�j;��b����JDRz8Q��ޣ��:١nkP{2��-�ޭ~�隦A��&ua���u]����_�V��	��ۛ�D�D#��u�Ϧ�|�'+��d*��;:+b]�a'��3)�Ft�����S�2��8����xo[��2}��<�[i6?9c�6��I��	��$����o��ʶA+��J�����-3�3r��i��u>?*b�W7[9���N��8�#B�#�I������]H���>\u4�_��<�},]`K�y�=y�f;�p���Ρy��G�k1�A������g��uкr!�j����,|"����#z�PU�,cA|t"^�k�,�,4Q�X=����XDyt��7��-)��%��9�B����9Ԗ)�b;:6�y�K�c���H��8+��Z�m�pЄ|��������щ�b�L�,;S)#1�2P��t���q�#���n�8B��j'}g?�>�|By;i9���`(� J<1݈���'{Out��CN�t�>��9]:�+�C�u0K�r���,�Q���@�ל�cS����sh��$�X����$��@�y;;�~RZ����U�OJA����0�ά��D ��w6<�����z��w�=L�y����	Љ�����U2�YZ��ݕ�x)�{�w�����f�tppIQ�`Z(XA�8'�Қ.���lV���	��*X&��(�=�~�]u?)�H��0Y!��៴Cg��OAA]Y��Bo��O=Q^��R�?;�8YƂ��D�jJ�W�$fY�%�ww�⥔�	 �M�'�wf�-)	�J6X�`0-,�f$}��ȗC�s6��TP�y�g=�٠����f�'�V��^�̡H��`^��rЙ*�SP�F���<ˡω��ȸ>z!�:ReP]R���b���\@?�HP�H��_M��_��wk�ҡ��O�u�}�9�� 8���^y�C�F�Akĸ��t#%x���.94�e��i�������/��Ġ�y��w���XY��<���:d��Xb��;��P#e$<��j�I3g$��젊b�ycP��Gƻo,��9�}B�1���;���M��$@�##W��IDD��$@�hy}hz�`����<|E�޷+�X��A�},��ĩ�ΤE �>6m�
TF�e���6�����lh#ʇ��eA��W���M�>J����u�-�@�-�{[����x�݉�Q$��zg���A�0r�>��+��9���=�],&��cy8�����i�:���Fbz�8�]֯�D�ᕷ���Īd���{�	�� �c��7���q	��?V`�d@�0��y*PZ�/ic�}��-S�
羝o	��)^��FZ�9���$@G��j/��L�H�S�%�bt%DO���Y<(� �'���{��uh�*H��&/�����Q�)@�ow韜�e�-����o߯��9x��=��u���F|�\ݡ�-�����SڼY�{�_�����a�N������Øc�wuq�p�<��k���N��b��V0��d.�?ov���'�N��f
깟���O�A��lxķC�4ڷ���kz����E*?�D�z"x]����D�tNȏb�e_�����
���"��ZaI��
���:FŅZQ���}V��������6���y��ޝ]9�"�OUe#�k��c��8��G���}��U�rވ8��}]_�    C�~a�y�-a�K$�5��Ӛ��|�/H!i`�P�ñ��hc3�Z|e��
���
�
#t&�~�����4��OZt?i��Ug6�K#xB*�Y}Nt�G�Q�`���x�t�ʽІ(�gJ��s�y��X����3�$TXP��I���N����t���[Pξ�m�:���y39�e�]�:7��|��N���"})���T#�Jz�e�}���k���7�m�e$���#��OH�����$@��ŕ������-^�\ZZ���;s�ۈ�Y�+k�m��W#	�?��}��)x�q0S߅���M� ��'gl�;��I�}� ��'p�:$a.�al"�I�����9-ʃ�.�as[�Y��"�􆟜�]N;i	?ASם�;�~�|w&����cIoYܺy�A�0��=-H�������)�5������A��O�Ų��t�����n���A��O��{7R"~��ؘ�%�*��g�} ��u3��D�12��n��;�A��u�F�s�Ct��J����	#)б���y��Γf���y����Ƿ�yk���^8�Dx~!�2^8u$	�X)#1(��������@�!�X����tA�?V�#;(!����l9q�>��X�| �EO��2!-�<�-��`���y�^l�--����Rk#����>9c�xP�A�w<1�ĉ�6�g�HxW!H[�	�nI��N�<�J���[��$�}��f�F�s7K�;h�/�ґ}�|� �"%=Y�H#o˦$�����o�J���~i�>17î�]���4�ޅH�C���$޽w%��tX��H����W�A�i���+�A��O�̰����tN� �=�v��{��V���t9�ʣ�����o����m��3�A���U��[�Z�K獘`dEc�K獴>��A����8�������
��Ή�WÝ��E�.óm��MF���B��%V�3iv,_> �r'��+�N�˄4o�G;�/��GF���'������젌�������2O��和�p/ƶ.,Ӏ�a��"B��]��v�(#	����1��\D��#W����+bV����Q�(Y�"VH�KYÒ$��Jר@n�ڨ@�6�>��JϨ@�vKL�}��߭~�mT Jۨ�Km�FZ�tXi��6*�Rۼ�)V�F��͋�0q�m^������Q���H�X~�HY��9$(��� ��P7�b�ڦ��ym���9��V�چ�چ%bms&-֭��ILX�t^	�6,�*ڨ�˪�i�n%(sX/sX"�9gR\���aA��a�X�$Y�3�9,Ȣ���σ���=�"��r	/ν��G�]@��{�5/�w&����i�C�]H�n�Vh$ʇ�7�]@� {�ַ���������[��=��X��Gj�+i�n-�� Ѓ��[�LZP*��Cw���qJ�������e*�q���:ɼ���J,//"�{�u���H8�z�ɀ��H���H��#	N�/�*N�������J��wZ'��bq��buy'�� �1r��":�HX�I�SF��3� Ɵ0�[H���<S�@�e��r��<�u����ej���ւ������՛�����#��	�:u\�o�d|� ��j��Ń���y'N|G���U~�����C�� �F3u_�{%?M�_}rƖ� ����x�߉�m$x�?I�0� ��ȡ�xб'}s�s��U��$�)���\��@ď]�y��Ӂ���y"��x�0�Y��Pa'�8#ጋ���)�舫R̋�� K��E%F�YbT�y���,�~%��è@���舫:�;i�aQ�с�:���*ĜH�U�����@Ig$A�*#�=�����~d��O)�-e���AG���'�|���W�e���6Nk1,ϥ��L�1M�g��8�5�Z�"�5Z�\׌H��NS]�a]�%�uͅ�`F���т����FA��NSa�M���1�,���,�o~�TזѠlH��D�w%-R��Ne�\��GF���32Ô~5T�F��3� f�����ӎ��;NJb�w�F���T�'-w���y�IA�� �Ã�-'-h�s���KK[He�s҂p�IK���F�źU�='-����y�iDZ�[u�s҂p�IK���F�źU�=�ލH�^+g$A,���[uZ�с��-q^�Q���4��hA�
�hIU�XRm|�le3��(9�h��k6�|��fZ�Qrp�F��� 4_����k����+��X8_��
W����bb�L�p��P۰ ^۰D�mΤ���젶aA��a�X�$Y��6,(���櫝�,җu���Yz�O��2�wpO,;q�>����F
H����C�� 9i��+r65�ɪ�I���[��`k,K��	�ۈ�坥��$N�G���)#	P:���������GO�Fei�T9��D龮�w#-TQ�#W ���+��	#%"B�#;(.cT�`��u���m���ͳ�Z��w�^���d�>A�����O���8p߉G�ei�b#�=�|s����yTb�%�ֵe,(���DY�r�;�ye$�*#a�4�B��L�X-%�"���Ř�,���Vr�2�y�Ā�w"-� E��+P��c>e�Hx6.�BI��GF.��PF�sr9[�H�`"� ��G��Is�2i�u"V�9A��I�h�Pΰ ^ΰD,g:)�h/Pΰ �3� :���B]�ʆ�ʆ%be�I�F��v�ʆe�ڰ��\m��Z���E��UC��'Z�+i��h�j��O抴͕�H�
�b�OD��JZ�tچ�چ%��͕4o����tFD��&}	��K*Z�jB��������Q�Hm� ms#�׭b��F"��N�S����F��[Ů��Dj��[��ms#-�-��6
Y�ى�0M��ls#-�-��9<ȑ2GA2�F�wZ�[���9O��< r���n-qhLZ�1hLF���	�s-n�i����\�+b�{2�V4�G#���#-�^��l��R�Z�(�X�O��"�R^�lXܐ�F���GZ�
=)��gX�p�����H+)��g[�+;��ш���H��} +��g��|4���=Ҋ�P��aq�=Z[��#-DMT�zy6x�D,n�G[��#�H
UO>8䣁J��ڍ��*���;ģ���#-HI�x�%N��F*8����Yųq��x4R�$L�ڞ|$N�OT�'�@���Q�$��룜�ڛ����Z��AӀ��N|��	�,���$@�0��>-(.��Lxx��R�	���e�}<� �Q��c�0R@Ŭ�ǃ,p�=���ߨ8d��Xb��j��*�2� %��1���="��A�(	�f���a�s^K�k�x�#ݷq��z�+i5PF����+bR���֬1r*�"֟0��}5@�� �ND�V��L�x\h5k� �}
b\��F�G{5kA� ��FA�f'�`5kAÃ��I���y��ڵ�Q�Hm� mÑ$��Z�(@i��(@y�ڤ/Wa�ڵ�Q�*�>��pߕ�Hi��6
�mD�mv|�V��6
�mD�mn�EJ���Q�Hm� ms#͋�կ��DkDP��H��y sxкX� ��O�ޗTk�B���a��*�'��2(�t�r#�'����������ϡ�d/K�;��'���I'v����|�������m���a�;�{��:ȉ�S0O�
;�����̈��p���*��'ff��;�	,7�2�If=K��+m��#.�&��*��ȓ��9M	��UQ�D�5L�%�Ҳm������x��c���36��2�'��8����P�ұ�\��a����|�)�y���m�s9�J��ɹ�u���UZ�O��wgb�5�*-�q�]�8 �]{���ˎ4m9X}��|}�5��-/-�'�-!>�U"xH��v���9K�eߞ�٩�ߞ���/()h`��D{�`��`�D7�N��0�z�;S�M�
<���'2�b��è�H��+���_I�y�P �    g|O�B	����#�#�>�B\�����7�����iJN�9��u�So���0�L�H��a㭤�9�h��t�ז��@{�%F�N¯ʚ(#	P�I���ŊY���)�c>2rE�����H�2� y��1�����)j�\��GF���3�vm�BI���HL�FedZ�����}d�xO��<W@��^��R����/r&�U�t}T�ߡ�;�L�D���X�$��?V>��N����+�����V�A8h��<�3���CXS��N8��'cJˈ<�&rN썗���l��s�f]@� �7�O��o"����lD����BZ����#)�?���Y���y4����Gͨ`�8q�L-#Aia��ļ��Һ
��BI��a��}H��y4 z�8�p��z�؝3������N�����+C��e$������4]<��2�+��1�o����	��P��SG����4ݖ{����~d��8#ץy���)#	P��!t�8}Cl��M�0i�v�8�x?��e�z8���F���$�_��h�E#Z��5I�A:�����߁:�D��Ղ���w~��˻/S�P���}r.��@���@i��w%��w��}7RD���Fp����a��}z�tt���D���&��2�K��h�	NnD�'$8K��ad2h�\E��	o�����"{Dd�Ȱ�8�A�(����5z����~�M13�� ����}gb�����;�!��'����4F��F���}���c$��@Ye�>b`E,���G$a_*ad4��f��Z�'��}��+�}��F�M,���a�#����a�P�F3�]H�i�������
�1��X�
�)��}�44P&@UedE߂�����S*�6�53is�8�ͅ?T܈Sis!��ژ�̤�Ѹ�:��U׾Q&���ϔ�V��p.�t�&��X�üqT����.S�>��3��5ͅ��f���L��ȭ%�<����"�0o�^����
X�X���j��P�\��xƩ�9��Ec��R1Q���fb��H��l ���m��i)��F$^aN!o1Cuj!o�#zx�Ǻ���Z�&/6�L�_	�pl����r�mE�}W�"Rq����W�Z�cFS��I����V�F-�)�_��_��@ᙵ>��t�4@�4J;��8�a*E���a���j���Tv��'��lo��E <I}9���Y�F��J�����Wr�}�<\���7T��	~k����F��o{_u�=y��B"l��l�*�L�P(#3��H�1������(�XO�����s����W�W�4�~j��,���;h�31���W�Ļ�.$���+Ff���tyu����+_�0����²Gp5Pe�w�玅�[�S��$�;(6Y�H<����`?�ܯ�q���r���|���9�}�,߈
Ğ�wS�����{75�/i߀pBR#��8p�A��O{;�-*;��e �I��_-�n��_bwE��ـ��I휻Yg�I�4�݉��!�{�g��Y�4�"��m��^�v?�]�n�0|��!�O���� ���ױ�۝��L;�-��L�+�A�I�\Ow_��QOY5Qy��%��W�/��b��������D=�'��Rf�'����f|'F��	�%6p����Ըk+-�0OֿQU�P5��D�c�V-�̽�%+���F�k�:��M�[�J��jԾuhr��:o���Q3L�Ϊf��2�֩�W�tn��:�<G;c4Q��7�3��3�x�~�t$�dg�i�692�@�:g��p�.�g5�N�BJH���eTpʥ��̸l+.�q���L����� YǍ?�}}�x�_1|9�R��]o�ցY��@~�B�B$��� �L��q��[g��	�x)���4\>���AO���:X(�}��m�:��+�1�J�My��;��ȹ�����w��e�����_��Wt��B6������H�oX�q�0뇫��\f�QT������
t��mO�y�<(�v�e����o��k�̚ߍ��Ư��\xĀ�ai?9g���~��u'�ìN��O�%����N:���^��#O���B�؅�||�[N�O��2������׈�`�I��I��OH�]"?�t����� 9q
��K_-�myd�Mp!.� EXdp!1�wq�ą�ʾ	�D�3��,�#�a��u}F��!�F�7I�"�F|��E�1�8x�M�a������dB?ad���\�*#�ے+b��������1~.����?��o�����Rz�ō���e�ƣ���g�?9���K�4�����"��S�$�|w�@?N�e�c#����p���P���E_�<O�+�O߁(��4��� f�ARY��R�Gdla$>�-FK�J7ad"�{^����g�:h�fT 	v� �ڏI�/or�.o_^��p[]��l���N��q�H+����NG���U#>�$���ț�� i���W�Μ���$�6�̰����4w���Ew"ؿu�߉S�		��U �$0�0q�;#q��+_�0���ts���UO��n�\׉��s��}'�{�,�2K_�Y����C���L�*ߧ>N�-~���!�	\�wO"��A�m ����-�1�s�N�
�,'�Z��'
9��b#Am���1�ՅY�6��1Qo�L@��7�v��a9ot�����N���ƨ7Icd�;�Ɍ���k���H�L�MU��:oe�_<$�-P2OPX�Z�P"� �a��# _:�X��6��">��m��؎tRf�t���mQ�/'{[)##�vg#�ָp��F|��;Gٸ�Ț�伃ʦ��4�xeӈ��r�wX�	���vP�t�te�ذ����#�A=# �)3｡�׈O��B�	)Þ��P��5�W6Xq��{�l�?p�HP�������F�xF��X�	7 ���F@�-��W6B,��V6B����P�t&�[�i��0�M|@5�'ɭ�&�~(r�߃X�@��%����˷ �����=xe#D|���l����M���X䕍^�#V6B�C�|��F@��W6BģM|�ʦ_w��^����]����=V�m:	/������9B�C?|���6��#C>A�#�}k��"G��������	I��E��8Ƙ��&���|ٶ�Ǉ�}Z�����>��f#��
1U��"~e䵪�@x�Ϥ�و����@�l$�,絨yr����LVn6"���3(�l ��絺�9x��Iu�#�h@�l����B*ky���^.��وo
�7��W�NZ˛T0��7Ob؏1��@�l�4�~�/ku�s��f#�WV�{��]��C{�B���>j��}�z�;��1���Ar�oޑ���ޙTj�,&9BbH���=���V�%���^q�BMY����l�=_g�^k4�9;Z���S�+f0�~��bY���	�S�Y�5�ɝ��<��`�Rg$����a��h�qP���j����L�/��A����:��A�x�s���i���䡷z��v�Bo��F�3/��|��`$acd��A�=h�b�-�5N����`��6P�1jɃk� �sk;ǁ[�[�@���*+��z�Y���Bo�"#��A���t�t,���,����@/z��'�lTA7���V��wĶz7"����A�f@�wUX�	l��I����At#���y�#�V�����z7b �z7R|��`Q��`�?��ލ�aU'�V�F�;C�BG ��
����F<N&���(*���ʼ(@�w9X2	���
aB�'��l"P\�	�0K��J�[VLh�Z�A�q� D*7H�uW�k�,?�[hA�ȠUo�J=-���51�k-��=��1EG��^��(a��5K�΢L���)Lg	&�Uޘ�b��Ժt�9���+&��e�J
t�}+h���+�X�}eL�7\ ir���7��1_c�ų���~�`��Wcڽ��dfؙ�^�/��|g�+    &����v/�	P�_VZ����'�PҐ�}��톀��q.���;�����8�x���4,AX�����P@�	��;Ca+H���h���$��*HO��G6B	*#=����362�������Hxl0�.�R6&��
e�>8h~�)�n��l���Tx]��y�y��K�,��:d��.�UO�O�^�5@�		��526V�45il�C�C͌�x
�&Z�+���L�Ѣ1����v^m��2FFx
8�2r}=�=ec^?ڷ�c�~rj�h�aA��WW��&�/�k���9C�6�);g���?�{3����H����V�	mC�:�F��� 9ཀ��o�;�K��a�(��/�>!O��:.��&�F|/ڬ�O�����}��o^���d/K;����6�љ�C���*��>��������!aL���x�d�rd\|�د�%Kv��f���%c�&K��2;
ʿ5��������Z�T׷Y;�O��2�
�'�@��bm���> �:nT��@�X>x��_@J$Ex�!z>څNGubռ�:n�b0��J[�%�վ�x��_@oL?[6��"��Q	�R/K�,G�+��k��I��R�����rX��O�r޹���j�0#�m
���{ެ.�2B�N�\$\!�ѳ�ŉ��i��x�YLj��Y.�L{���^4,�yפ�(��u�_7�P(���ਊ��4yo|�0�|�)PY	hr��r�q��<+
�n(v�8a\��P$��&z��M�O#;�ed*g�_�>����ō�I���}%����U<��}#aՓ*ac�G�c6�����el�������#��L+�1���� $��!Z3�+��e>�=�G��9Ķ�����{'"��܁y�9��ӗco##��g��ƛ�r?�:���L�	>?,��1��f���r�1�|��Έ�}~w߅T�6�w���WK��lxŒ#�_�d;)F:�?U���G��R)#.�T�Y�Fv���DT��*�	���~i�"��8�m��'P�ĸv�F�Ssc����~�|��J,� N>pq#�z��?pqyx\#���1�;(�L>pq#EXWMf����a;h���@�n?'���y�'��NI�Q}�瀪�xl�V�IM�F��ҫc����"��h�-�se����do�26�|&;.��+��o���J���_^�	c�#'G�fr�.�؅B�~�G�B��K�r�m��湇��i���m@�ד?��u��?^����բ+�D�Rt��[>]����jT�K�s����Kͬ$:iV�+sV�L�zY��0�}ŲT��R���Ä5/ͦW��U|�(�g���sy�8���q�"z��f�r�T��\{�o6��k�#��R�GE���kAG!u�o�>]ۉGE��}�$<4 ��%?��(�q�E�9i�X��%?���\�O)R!:	��^��c�6 �[x�>�����`�$����#P\m�?#�6��m�8�p�:#a�$�@	�}uRd�d@Ie$C̔���~�����T���g!���Ҡ�����OS�/�����L��V��_O�����A�|M��^	�8R�����IL�������ɜ���A���H�\I�|�@�l 8�'eV��D�j���
����AG���%��H�����K]�������H���=����8e�J��u�"��0�ɭ�2ۧg�Iz���\Jď�#�ů�NZ,��h�\��GF.�����������1�I��q��>z'1�J��}r��@X/HK�	Z�� Vܝ���8rߋ������d@�0��}/����:q_�C��~y�������[�Y�>-�M�7"��8�1r
�"F�Hxv.�DI��,F����Qg�S�u�l��2d�>Ѯݷ��a�le$�:#	bP9�Id5F�@�##W��FJ���FvP]&"��i{O7};L�&mͣ����1}rƖ� ����x�߉�Q��c�0���a��}<H�=���Cۙ<,�CY�O��2�젵�ĺ���I�\t��'a$���#�)@n�}>Io�e����/S
\��D�}>��o'�s�Y:���XXI+Tc$A,��kR���F
(��� I��˨�α}[�1��&.K�ɹYv1*��'h�31�;�Y�O��}�_�2�?V$��@�0��>5(/�� >��@����2TI��Di�.ݷ�` GKI���H���H��~�����A	ĨϏj`�7ǌ,cA�vK��}g�"�a��g�s�*	��L��I���y;'��$9q�r�>�L�SZڥ e�u;�g*k��H�(������H��R6»k9���!�:�I�経�9k�s�R��<�����y�b R���T̍���V1
�bD�bn�E�����w�q�W�k�k�bv��wRm��l��9��v��LI���ߠT@=���`��g1�0f�<M�rdF��N��Oh@0�y�D��"�y���u�S����1�X�9�j�������b@�'1v{Rg>��pMi8Q�4{Rg>��PP�hJ�$��D�TN�'��s�DR�A4��D���I�cSyyŏ��3�uI+I�8T������)�P�Ӝꗞ�i&6;��e��-Qgoٴ��M��o6��f��V6:�%��+R'n�fb3
҉͖(^<]���fG�GZ�mf6� ]�%�k5W�Nܲ�4g�ӜQ�Ͷ��\�ڟ�̶�挂t�3Jl�9��m3����n�@Q�����Q��.ތ�I^ڬ�ڲ1�{�:÷!�fV^��1|��8+ #(�F��oTŞ����Xo�B�ە�tW�EOtT^���m��.k�j��I�YK�U�@v5r?|à*�r>�W9��`��f��楻Z.=����!b|����g�_0r������J{�͜t��Sc�ِ���Ȑ�7D���GI�YKw�[#��̾!P�q���������	��ޘ����,;��1��t=|{b�z��I�"�8� #	(N����;��!��2�×k���{�
?9�����7Q��_īᣤ�Y	@q5�<|C�*v�>_�y+�G�Ź����$���"6������#�]��>r����o� ��e��qb��$�&%d$ ���qP�����nu�#�V8ǰ�Ɂ�9�:*��-\8�79't���tK8(�����I�%�����I�jj.�HyR&�i�H]�-٨�����pL^^@݊+"ya����O^@��e TE�.f�q�n�-N�6U�s�lT^�����4���� ��$�F. �y�Q��_���G���2��e��qbÇH���/��r�8���t%�.׸�݄���C�L/�ѰA�yq����5��"�o�T]e���j�a�FA�;x��B�7�o%8|����!���FV�����AF�����;>�VYFA%z9|I�36 #(�ᣠ�>k���'Cޞ/6�-0|CD7u��Lj'�ř#{ ���=�2����G����Hq�)?S\BFPnO�1P�}lNDWw"E��+~zq�-� ����D�"6��I�7,�w�H 򫑗��A�;|��m����c�2Jp�D���>DZ�U�� ���q��_���5N�(ؾe���q���$��W		@q�H@L�H'o�����T���81#��1���	@�?9��>�'����[��D?oKtҷtJӅe{�.{-����-1�|t阦��ۑt��,-Se$������Jw��a���t	e�v,� ���>D��J��\@�?|ty�z�z�͙�/�(���û����#Q�(�qx�A�5����8(�;Jw��$����;J�����;JR�h~��w� ��v������#I�/���� q{�X������R��+} ו> 6�+5H�C����H\W��x� ���]@��no.Q��=3;=x߼���Ϛ}�.��*�������_~���04C �5I6��`[�[/ �-����w��7{��V��`�%S����+c.EP3�^A(�Fqz�0�R���C��}t    }+���N���	w7�fe)s�����\�Atp�R���L�g��M`��r�D��ؓ�)�L�	��'��aOj��3I�&8��&D����j3�5�$��C��T��5��$�;��}�ؿ���>bOj��3I�#���At���%��#���ϼ�}���#.����z89M���/��G��V
e���}�tp1�K� �eRF�#�0�XA(�F��l/�����3GFM�8�i�@i��2�/:�����x��PYc��6Nn�r[6������x��!��7�s����#%^R�n)h�A@�W~���S����ڠΗ5	g�ݦ[��i��4��Yc �u�=F�/ⅲ7�~u�p��6��j䩤4j\0�ϔ�;9��a��6�uY`�W�g��,�#ʯ����e�=Iu�gR��((OCF�*�=�AF�H��Mn��{��潁=Inr���0(����<3�O�s;����W�fT�n�1�U�(�ֽ͜�a��7�'��m3�yo��ԙҥuo`$���.I�)]Z��Ay�Hu_{dcT�L�[��yrؼyj��Ժ9��X��_��o��sR?�b�z��*��r�3F>_5sZFA�}q�;t��(��ؽH2�2�u�`$��wv�W���i�!�;����KR'b���a��C0J��;#�:�m��0�u�`ԺC�p��/�LQ�F�6�����Qb���3�m���5(�	�����k^'�����u�R��k^'5���B{"�=�|KF=1sbǲ!P"�7D̽�;�:jwe���OcF���3�0#՝�d�� �>2�G�CFv�VF���GF���7��s��_0r�N�-���u��s�\"�V���]�Ұ��Ef�\.j�Vbћ��Vpiߋ�}��䁑V#��7���s���l#�z�Z� 9�Pf�� �$�wf�
��I|���*N�F�1����^�gL�{w3����Ka�@�D�!b�E�����^63B����ͼI�r�L�e3#����!b7�9�:�i�e3C ����̉�)J�^63B�����PR`����z��(����&E7�Vnf3� �͌��̖du� 7��QP2�㐑������(H'6��vb3@��/��f�LmFA����WA�__ڛ��3ǽ8זq����qbxÇH���/���j���q�,vs�>��3o+��V����zszdk�t�&��=|�����/���jdk� �����m�yˏ�ΜЍ+�Ȃ����31����^k씁�T>2�C43R�5���Lh�"�9���5��f �Q��F$4�T��'4��]�@�m�'4���J�����!�!�7D���;�:Sں#{ ���=b2�3�m1�J�#fdd�S�bd�G�����$DÌ�����#F�@�##{D�F� �zi�(vB�(��j�-�$��r�!�mF���ۜH���{���6C�nns"u���6C ����͉ԉ[����P�f��-֜H��d�SAVsx��:�Ѡ���q ǫp
9ADS�n:2���	�xRC�:�ْ:+Ȥ�"Ojb�D��lI��eRCA<��D��lI��eRCA�v3D��nN�NȊ2�� ��@b�� ��d~CAV�S
r"���V�W�ɤ��xRC�:�ْ:q+ɤ��xRC�:�ْ:q+ˤ��xVC�:�ْ:q+˼f��A�JԵ�-���Ls(��9�u��u�H5�e��@л��
�dz!�L���>ʮ�-��f s���m^$y�ږ~n3 ��� Q�6O�.T�~j�90��@7���2*h�����`�f�(
7R;h�����`�3@9΁�~^�M�g ��~�^���R�L�gN�O���ʙ��\��-� /��Yc �u�n%�E��h_ċ�{��<��'���䇌$��F����F.��yZ��@���mj�ܧ|�H��8זaPm�>@b�8Ѽ���C�������V#/����y2�3g��M	�(�8זqP|���qbz�� ����Y�I@e5�r�0�M�n�~A�~y-y�l�s�}�kd�����Aa�\�ۛ䀳<0�B����g_m�����	��w���+o���8�I�"�^�<�:���F���GF�����vUAx�� �Y ޠ~�b�^��S}{1y{���jg���0�܏0��8�sNx�n� ���>sL�B�O:
צjs�9��}o}?�:�8���!Jb���$�D��=B/��!#����6[��Y��p�#	h���D� ט��>�������G߲lүȸ��m�N~�v&���mI^/�1#(I��)ߜpiBF�3퐑�dr#F�@�##{�0dd� �"2�iP333�O�,�_0����
����{���.���X?;���L�.L���Y}pv�A��P�����E?C�j��A�߁��Y�F"P\����*�p|�}儺C	 �����ڲ'_y���abm�>���{�@���U��dW#/������y��T�݄�n�-eyB�-7Z�0�A�j�01����ۑ��=��1���j�~��AU��Xz��L�r��������|m�>8;�� �����E��.��aD�"��@*���hUF�$��k�i�v���4ɛ;vQM9n'��y�o���;}p���w��J/��|�N�}��>����7����l�S_�T�>ml�^���ѫ�XM>�#����b}p:�+*_/�>@z�ʼ�ԣW/�>���+7����X���潞��������w����n����&[\�_��a�~kWn�}�>@b��}��ʧ�U��bc�f��M��-�6O{F. +�ڲ��j���=@�E��f�Ͽ�W>�La����o���:}p�mA뇴{����oK�E/ʵ�� �oK*YG��<F�9O ����Ht�P�=O��S����Ӽ`�W[��ٲ'hցt�u��tF��3k����-��b� {3� W]U[�}��Az᫝ӧ���[A��m,�F��Ĥ��ӵK�ZY�d����ɬeK�Ȫ��lI!˫G޵Җ-(&Y��~12��w�#bd����֩2�y{�/�Sh�N���=��F��w�ڵ�4r�~�d�F�����I�y��V�B�a�.�x_����k�&1z����6�(/��`Gl�VO����e���}���"�\(p#�̀��62ޜS�~��1���Y=P�1Dy+ۇBl�^^��qF�׎�2#F�V�nӫr�.��褑�������(�/�/�nbSQE��Ol*hZFgH&6���<�[�(�J*3I�e��,7yE�'���?�>�#�����=�Z����?�N��Ӛ�7�{�3>�������W1��R?��K-:�S�F:s��� ����͙��[�S?ñ��I6b}�N%΋��Yd8��n!<I��*>�S�
����}�eK)�4��^|m�Z���1��?���P?����}m�>8G�FA�j�݆^�� ��nK���E�F"P^�<����Z�9��WNZζ�S��G�yj��@��ǉ�El"Ug�.��F. �y9|T�Z��M����ui�6O�K�^ �������1��6Q���{���%�.�4�Bm�>�����W���3�P��}�(���D/�����@�)#	h�n���[J�-|��)�t�;L��&�
[�8��P{ߋ$���
��cW�����u)۱3��a6�Y��s}��8��q�H�5�`���| �cFb�#k$^.�~k�2�g~> ���\?�]�9�,[@�O�z�Q_؜	��c��᫤�㋍�Ȣ��r��I��)oo��"�6R������s ty�w��y9�M�hLpׇz? �C�G����8�� u���~ ��#�!#����=P2R6/������!&���B�q�I�j7(�����]��qbc�'u��ӈ�=P����0#e:�		@f�H@���(o� �'H���k8Q�5OR�{Y�vy�~��,�M��]"���8��D#�o!�S!����h^É*�ٓ:S:����h^�$�$"��fO    �L�(��y̓(fd%&��<I�<BH"�� ;f$ :f����$�

*�RP!���G�C���܆un�%u�V���܆un���k!�ܦ��|�!d��P��m��N��2�� Z��DU�ٓ:q+�4�
Os��D��lI���4��x�C�:����Ls(��N���]7|=���]��<@�zb(4���8��fjG�8��sh^����qRy͞��qy��'��͞��q)��U��'�s4"�� ��<���hT��'�s4"�� ��p�Jq���!���h�É*�A���$R��-�9귥|�>B�odE+�'H6���y'���A�U�hEZ�9�x���v�uV+������y���͖�Y|�Lp(�g8Q~x+:��lI������x�S�r+�Np6����d~9<��@��l@�u���rxn�:�Y@ϴ+uH2�� ��P�Nm ���^�6$:S��L���G/�
�d� �wZbP%�=�����pMm8Q�6{Rg}"�� ��<��4J*�ٓ:�k�����o���E~�A4��D���I�56����h~�$:MT	Ξ�Yf��p8��8��r�=���&��p�r8Q�9{R�D��A��/��?(��w��C�O���۲<t���k3����j�^����x5t�TS�ڎ���
��ا���md��Y��G�۷��>J�r���N��È�=P���11#�ٝ�32�V�Ë�l��r�5�{���cm�p�g�~�!.�[��&��k�q�֚�׽���E܏݁$�k��y��*�$����/������~�+L�!����Kˎ ]�]��v�oO,��r=|�~�(M0��N6�@���S�Q�n)�+؍���܏���z~�����=~$ʻUi�^�=� �\�� �>2�C4�;���ͤ}el�B�q�@�b� YI& �L6���ArMF<�?N�׏�@����V�f4u��[�
�: d�G��cb�no|�`��f��qo��� �Ë�&W/��T�˳�����AA�`K����dck��ew5��L^u�G�L���d2R�	��Dl3d" ����Z͞#+��Ɍf���hFHu^�VF3J�@3��{��wχH��'��MI}�Y7�Rm�>8G˶ �J��� 5�oC��A�T۫�i��$��suV��J#ȭF�o�������dkI�����_X|.��� _����������VڳV?P�s��6T�}Vr7�����'������LY�c����`_�,��>��I�����N����i2�_��p���MӲ���'i:2���g]���2�O�B�P�4+N�>�2#�uҖ�w�4^`:�� kZX�g��W?��U#��F�*��4���[����3)��� ��Պ��$V����3_���� ̩�j���j5�
?�ob~@��� K�.�!�wBҹ��#h��� K�.�~���L��.�*��c���g��6�1��tJ��iC����u����z��h{_���vV���Y_���a�@]F�1�e����QtS��|}�ڃb\��=I��ʞu�;F�ڼ{�Z~��!o���k�m��1�^4����+a�i�y{���l`ڧ�rJ`;y���ne��s=����WˮB��#W��#훹cR�����0> T�6Va�A�Y����96ofN�cr�Ny��(���p�s�A;�l���~��D��%��r���l��K�sr��X��7���Y����^�c޷�o�گv�b��r�-�t�ڮ~p��1Pm�>@]�0�C���ޱ.�P��j������g�m����wsP)G�?���~�z��[���'�hێ$�V��-}��d��9���\[�{��[[�~�9�n�
;Ja�U�[V�g��x�=�'�"�����(VRg�=S&���2�.@Q Xd�@�DQnF��XP��
c�I�bC��1���]�0���xߌ�~�$���^@n]Z6@�+�)�Z8�N�7 �إ�Xi�j�,���\��OTK��r�}��j���X�PE��`�(�AQ�G�p��la��"b%"
�兔�(�@QX��(� ���÷5�o�s�QR}h��~]3y$ז�tm'���VÃ����V����ⰴ�]��j'��jM�K���Q#�͜<4��2QE]�J��9K=�{��|�iW�σs��0�V\�T�9s��5S�	�\[OP�'QRA$=ne�	$19�nh׊��X%ȳe)��@��Cy�,%�r]a{�L�� �BY�"�)OZ{���o�����_���<GP֓�R斊/A���R%}�_���H����dEǰ����A��^��:ex>��J�O�+�2�e9�,���*��͜\��D_u�)B���V��2OXy��|�R�9�s�kA<I��E�G��Z]˯�oV+�CR!=л?.�-�돃��0Y		+�3q
��F�NL6�Ĩi��\]�Z��4,tCs���Y͞����м(��M�Lz�L/����z���� �M� -=���<_}�%���e24ސd+QE�i�������n�cK�t�� ������?_<� T^�j��**/+!e�%�̀�~X�M֊�w/�vM�D�Scm��Oo��=SZA�h��WRc��ʑv�.#��j]aqo�e���ϲ��Uj����V��`��0ODa�+�6Z�(-BQ Xb�@��D��Y��
������ӧ���T��(�3Q V���h�ߺ���Rc�0S�T*d!|n�6
*�
ɦt	M��쯑ܯ���}O�{����0)��������I\��-�I����	����������;���	������5)Au�	���	����	*����^;1�S8 1�ӷe&o b� &n�"N�L܄��MHP܀խ���[O��HP��T�0��@��,���ib�������L��)w�$&@2�:@bPsn17i�e  �$y|z&A۴�-�  9h 1	 s�y& bN���g��&&@�BB �%�a;�2�qc[pDb�M�:� Bb;0Db
�nb{ b�|1�ļDH�8�o�K�i@�A�MdX:X�9��AD��I���i@u�gs��|������ ���9�i&119-�Y" 1���U0,�$ �% b��g��l��2KDb $(M�٥j9� �& bP���$����QAՃ�g��d`ql��oE�`_�~����3ة��T&�'�u";Vp.�*ڜ�����o"��x5�i��L�dg/�xż�u��7�>_0P�:�C�G�����t�Q��	�=�z�VP]V`/,+�D
��H��D���:P� P��𛘛H�ZV_F"�bXN$�'� �@>�8���� ���3��B�@��H����O�)���:Pރ P���K���R9hH��T�`E$��7����@%���X���d`�%y*#�bsHxaKL'�0���tl������@6Ϭ�<əba���yk ��cM��A�����cddc���i��A�H��0'�ms ����CzO��D��I�Ê��J�z?�<���C�L,Yj<5�7�Id3��������
0'�� s�â��v��Q0'�/t A/l��s�Q07��*��s؛07�� �Z��T��H0z�*���[f�Fo b^"
X�� ���T�5��:/�%f�y�NY�Ms��),�jL�t~+���L�Sl�	�n�CU�m�D�_��H(l��&+\�4	j[�7��j YX��AX� �8�����
ZU�y�ts��I�y�pP~�ׅe����nX?	��A�� t �(�3oz�q ��$ '�<h�@'R5�,��[S�ϔ�>�G��	�]Z���'mIē��.^�Ҭ|�d��#m�2���r��;�<6�2{V�gy]h��a����0�`��0OD!�y�A�j��"�a%���H���{�A`vb�@,C�����$K�hJ�<�    b��Ǚ�V�[���	�IU�����1��ݹ�����R�����A:�,��l���-,�#�v9�n����c�/=�,�f��0���YA�j��-�{�M�aP���WiM�3Ż��)�B���t\.�5�#%��.7�� ��b�u �ԁZ ��쨅QVٳ?+ˏz�u�R������D+���,�o$
D�P�(+Q��}�z��Da����ņ�YW��Di��,d9��g|k�o�׍QR�����.׍r��TD�r���6�I�	�R_��j�i�6�Oe̴|������8�t�_�k5`�rwy�j��t-c���@5C����(6�N�Y�:?H�[k;����n1U�!�|��������thY6DJ+�!���u��� v���ba-*CS�/(!-e�����X_�,G��^V�ry�T��l���v����S�gY\AM� )����#�إU;���l`M�3��[����J�	lʗ�B��~C0{�}�Üņԑ�r;����V�"d%$��וz�5AX�I�G��2I��N�\��Y(	sL����7Jf�[�ہ!�{�zX5�ϦL���-��@y�Z�ƍ�2"e����uG�57M�$�D7F�ˎ��5�QR{�:J�Fj�%�$ �$��&&q}��MH�@LH��c������A�F$$�<�0���>��Rw��3H݈�����$o�iי��~ӷY&p�\��L�����(9�NHL��NHL��NHP��$�S�.�.0/%Yt��:�5y����E��u�3�.R���r�<��L�����g��$��[Ձx|&%M��[�`�˖���ۑd$�& ��S������g��SD$�jŤ��41���y\[M���i��u�=.?�2�8X[[[���X�@l���c� y���w��g�i59Ϭ��2h�K��ԏ�X�
XfH$��$�'Bb�+��,�%$��jRb��]fց�cfց����shV�+^ft���U/��������\	��-d�B6�s6�Oz��0R ֱ��*�Ĭӧ�=�*uw���:�g�*�D�J%I��*�&$�r�+���v�$�T��M$�0�*lg�Jҿ	F@����]��Cd�Bj��ّ�j"�� R��Ю"�9��%��]��������Xp�
J�5T��cM��:��T��M��Ǝ�~�:��c�`R��c���؊��α5(?�5 ���\�]��JF�6�ܝ��GH�M����<CHLL�X�z��Iy�&@��5P�1=v	�	�`�H�]b�LB��'@bcGJkl�Hi�E:Bb����lKTF/��xAM@W�lA$V�#$4[�����88��/����/�-�����<N
�����.",i�-����N76�1AD����l$8[@cz46�����a����$6[��BbcGZI`�jH�L��M)0[ ��'� "{NF";EH�������r$0[ 	6� ��i(��#$6[4�9�ǘٖcf�`��p��v慭�:���v�y�ȑu��bs�x�6�AS��@S�x�����k�U��׵�Yi4&+���$��ϯ�6�h�&y��U�I��cf$y�*M$��dH
<Aw�������ݭ����(�eA���JH$�dK9IxX[#�� )`�r��>H
	l��j�08�F<�F"I#%2�8H
<�� �y'v⅜�`�!�s*$��ց��P w�ؙ5@b����=#;GGH����R���O��E�~�I c?	\o��'��r�7���	���7�+wP����M:�'�pr��&}�"C����:78��Y�Jn�ö�Νػ��;+���89o�3��������qv�z�cO�xANz��Y�o�SտVxb������,48�ϱ<}�U�A��°@N�ld��7��7�l���o"yob���o�4{J|;0�z/H|LW�Ob
'�/S8y!�)�$�P�r�JP࠸
.�,	�$�P���~9
�+ G��+��)<v�?�7�t���It��@����<�����.7{�	Q!�7���Z��4�M��4|�ܛf���vf�	����e�ؑ��vdP���Ld%:�A�=Ƞ"�7�#�7�"��J���$���IF=��䒠��U�=��`�d<������$c$r��X�4J�M2Hb!��؉LB�c
�p�t�An�Alr�T>�H��$�a�I�'7� 	>�H09$�< ��O˲���@n�U�M� h!��R߉y�����$���&$�-�;r���ؑ���<wHl��'��X�=6���[w���X&$��+ �� ��y>��y>��B�G� 	>�H����.a��1�݇w�k	��b�B�5�u8�'� ��T�A������a @b���\ɣv��=M�ڳo���H��84���C�):@�ȁC�:�;�B�ûH���DH���M��kǳ-<�����,"1��G�,,��8yh�y������ �� 8��#�X�BZ-�&(j�0��#��,i���WQ#�Y�O+E��*:�Ĭ#�-fhn��I�*f9BŬ�ǡ�*�0���b���X0��n"*�:*��t8aP!'Ęuz��`P��eS�]S�}~�C���@�H$S��8�� +0|c �����F�G��8 8� �> `���0�x-''H���s�)�,�F�=i�{�'�A��_$�A $x��2���F
n� 	*ܛ��$�'�����$��$�LBb�'�)�6�pcHp�A�X�1/YS؍;����r@�o ��H���XR$Xt� x�W�����4��a��Р|��59@�oV�Z �j���ļ�A�+=�`�6_$xQ�4��A��0	���e	H�O�
�	H���A���e��ᶇ�\�����]x-���@��钐�.	��A�δ1�׋`i�`� ��%+@�~��KB�m@��$(L@b�'�2��l��w��=@�~ҏ��!�� ��yyf�������@i��Ϭ����!�'ws��Jy�?�+��$���o� ��?������E�N�e�r�bG���F�������� ��Y�����l��?g#���~���f�(V��Ex����<�&
Ċ@�}٭�JH��( �hQlH�Mr�$
�D���r����޺������W�>@
jݰ�f�M��4��#��?��k$�uH�"�Jٛ_#��NIZ��I��댆���	�i����	�i\���j����i$C�i\?���8!1��8!1�Ӹ��WL���	�i�����l�P�Ĕ���9������uV-2gd�Տ�匬���X��u���21���web�鷉�e��`�e��N��RX�d��&�e=V�lRX^`����E�Y�_�(,�X�o)0��ܷ���s���\[����9�$f!!�ܤ�'U�$d"1�䇯�Ģ���w&1��Y'�N��*N��Ĭ�q|&1�d=>N,�8�"�$f!1��#��<��@v�Xf�OW�s_m]F�=�X��QƊ<NHy侹��U���8ɢ��I�<�h�<NH�����L4g'$�q��;�qB������}�n�y�����n�U!�~����կV�A; �q�b$�r��[9���i�+'ٕ1��]�8 ��S�\9e�nޕ1����8!!���"[9���2��w���hω<�H��`��VND�{s�'�r�}0�8!1��5[9	��ʉv���d��<Hl�$��r���8�0�����VNT�`SRy`�@Ry`�@BbBB�`+WΙ+��a��U�
P5� UC`C�����Sa* $�R�a* ����-���Th�
@��0S��JI1�B�=na���
H���@3�8X���9X���d'=����Ę
H%���T��
H%�����
�� T��91T���C=�Xv��kL�����kbZ�0;$$X]    �C�R;d* ?�R�c* $X���١�K�JR�`vHHL��ɲCT�d�|P�d�!"!8���I��I,;D$�Rce�!���
���e���T �R3	VF5�e���T �,;�5֐#;�O*Y��8���8C�*��+Y���j�
[[H5���TC�.�0��H�Vh�y�7�L��H� ��|�'��f~";j�S;j�'�{��|���;p6����9�}�S�; �+c~"�2��; x:����`~"�����;�L�,"�'�^
d��O$���@w����}af�����7�8�N*�|�T`~"��-p���I�qbq���ȩ�����1�1��9�˜���H 7�"H	���:6I���AR =�M�q��0����<N��8���)��8<�H0�<$V|"\����8XX�q3@��� �� h�5��b�
SY6�
��@n�gRUA�1���U�c�ݕ��7'?�3��
:��	���r�^9۲ԣ�3,a�G�Yy�:�q6�*�W}���W4K��:�p�M��,��:H���t7�6�:�Y�5�Ki���J�R�(�i[o���v��(+�Y���z�sF�u��(,`���BD�_kM�9�h��%H�f�(�2Q �C�H��*�P��bE"���|2r&%*����=.�E�`�������޳�Io�׍Q�,�0���n�De��"ON�6�+��Gؕ� +nX-%@TڣZ?Jf"��?{�:��ʁ��Ϫ�ـ��1��T�Y��rP ��d4*@9 Xdz@�D��:A�e�7YM+P�'�	�2�a}R������ZQI���cxs���BHI����iXk=ee� BT0�[O��hH�%�~�q��'j*�դ��z�57�0_��`@9)�C!I<�E:F�q�*S�2�E���y�tJ���e�N����j^j�3����^t��nr<_�c���D�O����Go^������������S;��n����u�����C5~T���I�E�0��������Z:'J+��A.������h��#5 T ��}g�L-�j?�|;P�-�w���E���I��{�6Jz�{J�4}|���H����N�a�e�������q��(�`���v��ԙ9��u�u�N;Xа^�i��n<���.���(ɴBD�3U��䛋�KK3�6�%��Fi���QX�a���]��"FQ�"����Ϧ�z����w$�/��)�E3Tf�(�����V�o��QRP!���?�-���4��N!�+Z&j��� Yf�!��	fA��,��-�]��鿢,��a���sX�T'��2DPR�!"ߢ�^��6�N!�M�N���Qdy"f��0ZP���HBd�oH�C:�>�?+H���0��SQ��TtNMEn��hU�'�(R%��߆�O��=���-�Nl5h�w�����:{�QTw�?
���Y��*}�����5i�6k];�4�m�T<�5Z���VE�.��	����뷤� ��zݦeMk�?��5���;�虯@�?�[�C\��,�,��S2����{^��`�n1��o+߽�O�����vim����He%5�4B[�����`f�����ê�j��I�H��H�on�߭�?�������랝���'hgܑ$/���u}�Nj�ӂ�0�LKG��#L6�m�����>`�`��:����$����t���ݘ�םs[�=�HN�a��`A�a���o~�[��<�X>���aB�R��o�[�縷a�Ka6�Ka���?f�W����"67"�$�^
�4�kߵ�~ ���Vܳ��Y�|�,�aX>���a��Bc���|E3����,�<�b�c�'Pl�����*z�3��2B�����3'�8צqPz��R�|��=�Y�ͺE��u��Y+ȼ@�2�*sߓA&�W\m�>8M� ȿ@]@X8�.=Y��j� ��/8k��5e AU���=<� ��c���n�!��j���9���|���t%�-�kɮvX����v0��u�źRey�,^�CX�O�Q�����Ü�F�°���'��8N�+��N+G��[V[�+�Z�e~�au�����N�jO+D�os�P�|E߂t�U�t�� �U�^�+)la��x�m=���m��^�Y��:
a���*�o�2z�:�`�
Z.��e�S�W���k�2�Z�8�+pT�g-��2�ԕA��t�Yg�N������㯟�8�(p�ݡ��Q��/J
�,�g}�����N��c8o�����&T`e��*�Y��,K��a�2��Pj�~����u,�c��ο����X�+�!T��!R��!V��!TO�'P�H��Ǩ����ǲcj��/8����;AaT��/������ۤ_tK�4_[6J/е�`� �{j�Uެ��PK��[g��[��Zc���Ҕ����nF���vii[�A�jˀ��v�g�7�Z����|H�-]�Җ���p}��R����XǴ�!}��m�$���J�4{����an��gy�0QܭcX��Oҵ8)�հ�/&���b\�qRjx�U���Lr�0꭫��l����(�]fo�$w��T4��~5o0(�*�Kc���/Xgs)".@����xyle椻s��xП���=��$���7DsG��YC0��]Ha�~�a�ƕt!�!R��m,���]�7 �!_��Oеq�TVR[Z�K����=��-3ص8�"�	R��*}����IU����t��-X�F��'}���㤸��jxд�j�t;;��u��*�[r�k��	�VU���E��1�.6a��X5��H���i�$������%@�G��Y�����0ʊ�aYv�|�>IG1�����Ey��������Q�O��\�6�}��!�!�9��b�7�BC(�Ϊ�W[�Ѕ�@U�#�`n.�+��I��e�^��(,`W����f�d Q�[������V�ԒU���$�*��ܦ�C]�>A׶q�_Im%pZ8���ⰸ�]k���o8lü����I��T��
>�u> 22(�`:3���~P`9P~�j�(�5�_ԽQq���G%"Y{����,���*��Ĕ@P����8���0 r݀`��r��:���o�-�*r�`T�r¨�ԄIY�
J���$���[�>�7,76v=T�Ϻ'����:�A�'��=���*���@9k�Lq�V<��yI����t�E{�Ο���t��-M����#��6÷g�}i��`��fY�"�i[�p�>Hy��<���A�yB��[�߹�K{���G�<��h�k������WA���7��FYe�j���D\��_�� f�o~�%�XI��fi�"Q�(���(,0Q V�H7�t�]�e"
�*ZR{E��Di��,d9�0���0�u\7FI����/+�ܧt���vL��^> ���VÓ&S�Pۦ��{*��v�̪}�t��=��}��5M��m� f�o~�#�0�㫡6N�(��,�	P�(+!Q�,�d(
�e��0Q���(VR'�ZCE�h��b��pX������u���}�yو�`��w��R�$?ul����_X��g����k�"�Q�Q>ڑ< �՚��0�r?�Z�0�U�܃�;�����{�|M;�N)q�ծ%�2rV��\~7S/����R������F���d�gC�DU�dk>�V����@ҵ�P{�O�I	[��M��jCuO[�u��>Z�=������6�t!)�vꓴS����؟�9��f��HA�����]7D*+���Z���io��v��!�e�/N��R}�.�0D�jw�o�c����tz
ֆ�s�m���P��O҅��h -ig��v�0��E}�)Ԯ�t�0�(1�|3�݄P���8JrHM�4z�
@���o~�[��$�X>���aZ�[Rg���aQ�hfT=�E��~�aub'/C%U���!�򏛖ܮ&�I�����l�t��QX>�6�e�렄ATm�g��:|���$    �0L�Bk�
��*�������$��zR��p�]y����e��p�2�y%��@I��9<A�>.m�lD�2�b�0�ֿ���"1s�Eb�囙�0*t2�aXlgì4$�N%��aQ�heTmX��AQ�X�7���l+s&U��y��!�L�L�����?k��	��	)���>��m;�����ں}�Tݾ�3S���6��IK73��In%��'��?kh<��C�/�C�� ڣ����К"�����"e�_������ �7m�K�2S�Kw5�2�OHe%]�}��4W�����'1��_�;�OX�9LV��Zͧ��'���rL&��R���_ďK_����OHq%5�0DKG��[C���]�a�U��� ���t��!Ҭ�yll8��L�0ݝ���U���'�l�ȭ�k-���w�+lXg%��/8k����:��/+sm�vMä�W�Bx���V�Y)�r{�7?����X8���aJ�{R{�}E��GEу�AQtXa��Չ���TEo~��� �Ǆ{�3���2X۫O�ѸQ�_IWj��#m�QX���je%�0����tT�(����1��l�O�M��L�-^^��Լ�}���)�`��'�a�ڟ��/hH�%�Z7�O,�W�?A]�l�|�<�	�u0�Vj��uy��2]N���������ƲrB��v��#k;�ɹ0lVPCo�<RkOuO;�j�6��2�|u#֦�t!�7I����������!�R����+X��Q���c���O�ѰOh�'Ⱦ���\?�	��h��*1K�7F�a�w��b]�c]?L7HZfP���Q}�`o�^�l`m��SS�	�w��S�Y��X��܎��WRCWo�.`Ծj��_~�؅H�X9L�vN������OH���RY%I�Rm�v��$��飖i�Z�8+�Y͟%�O�ފ�^0�`� ��)��I�����E!o�'c�( �RQ �C��JƋ�IU���c�!D��5u����Į��'�`܎�/ڤ�Y}�.԰��UZ۫{��[;�~�,��
;�a�U���a&�Vt���'順a���ayP(:`��q�jഠ��aQ���Ҟ���z+��`����sJ�{R'�:3,�͎��s����o8�NlD��*�pq����>lcM����VХq����j��#��-[��/إX�7V�pi���s/ä���c�}P��3�S�TĚ���a��f}����H:Yz�ҕ�4q�c��#m�QX���jeeⰠ�)���� �0HZ:����tQK}i���q3I�KK5i10�;�.}�X~�jJ���/8k����B`��;z��|�y]@J�y$nO���=7JKq?�g��T/�˦J�N�����>{1��T�V{�w�N~�5/�������[2/����L���~X��UC��[���wBrP��wgo���t|���
f���J��̜��뭩y/-�r^d���G++�ۼQ֬�~�BӊX�:	}٥��|J(��8�;��i�h�m%���t������/6���-�g�fj��du~�1b�@�:'�Z�!�w��B*��8�8#��,`�VY���3��"�#���=H�����깓gܹ���`(gc��N��kqq�=�«�
c���t�[B��$i��ic޵�x��������`��~h8,�iS@���ɧ�R�k m�:76�aFFe�����ջ�2�=h^%!��9���%?Y�1 � �;g��A���� {�%���H�՜Rʫw,S��Ld!e��R���I�$NF��A�L��r��I��vJ��= K�i��/�s���{X'�
������#B�Q�S�SF��[��N(��Kr��n�76��asIj�Ŭ2�T�	{� �d8��S�oV�7�ֹ�:\3����� zy�z��Y��۴1��R�v��޿��S	@�������{%z�:�7�0��{�-���	䄔-���t�����J��F��<X�i(�+�4Bm8x�7<����Rє'6�|�+�j��Ax�"��V��}�p�CA��-�����骾J�F�6E+o����We��7���M<��&��Du~����J�{?��
�p�y������:��|Z{�iK��j�R���Ӥ҂䆲t��U�RI�AZz���������\�e�����ӸhN�"�əM�y.�e�#qT!s�&��,מ�˾�a.�˫cS���e�F�N;����{R'gv'��iz�᲌򜥳y@����l��$�t̛��u�}��ܡ��4��[���h�>Ԫ�.I�<t�S��)Ht�س�w{�9�9Lo2`��3!��uŭ���q��"�/�lZ�u�t{����+����R��Lr昵�?�BǴ���W��r��:7J�+�*���ґ���(,o`G5���o8���r��A:�a�4��L3ɞ�P�w7o�r�&�O�ٶ!�[A�Z����k�zO��j6���X���`ZIg-����¼�YҞqEI�? ԰д��!j�0�@Yn���g�������ӊߒ�9H�e���K���.��ߛ5�Hga�Mú��2#C �႞A�aYK��$�'u@�G�D�F7��z��R�-�9�Y��\^��=���J�o����
=H��S���W?gι�݄��ߵ*�8كs�!��x��~U��^�v����Ϻ��k}�.�4�J�Y�ȆX�������q�x��n[2�Sm�x�^{�Υe �5e0 ���S,�f]�` ��Yu�jg���� (���<U��ޖ���?�VB����.*pV-?v�� ��P���5�_gC,�g}�<R�<>X�1���j�Ҙz����3�X�k�I�n%��xIFYFA�Ƞ�tf�PDy-H
2"@P����$�p��Ƥc<o���(OT�e� �"gա/٩p@A^��Pn>���et�_��ee-�*2"@R�@H�,�cEI�oA��T9�6L~����f�i!`����Y}P��%��@A���L��ڞa�o�i:�6��������(�4�IN�2`TP� ���w��1��s��߰�[Qa^U�d�!��{G����S����qS�䏑e��V�ѲI�"f�_IW"��lP{ٙ����v0`d���Be%�0UQq&�t�(���_���{���ܦ�^HM��$���Hf%]�aCSWAf�=���Za�]>��u���g�f��	+笃NT*psl��8��4��2R��s�e�=뛟�V�E�0
s�7?L�}Kj�%fR�Pu���( ,QQ VfSyfR����X�9D�z��N��Z�8o��7w$�&z|�MS5���z�pGa�sw�~���(U��I�w�w��~�*���y7����a�D1�N��4/ia��X��SbY��9�:��k�a%���`�1���i����zC�6�����W��T���R��҈TѨ85�0ӊ��o�:u�x
�_�<�(
�a}N��1]�aNV���[u��#�-� )��{���a�犯|Ea(����Ix�� �ei�oI�j]:E��h����=XE��/�H��VJ�؛'Z��쏟̼WI���k�S}������
:7J�+�J;���p�m�5
��Q����N�ͤ���j%]��A��*��q5��4�ƽ�H�/i�:�ڏt~ k>�������������*|�j<j� u"i�<jz�eMk��63S�=�X�o�H+�����éj=������%ɨ��9~�m�t���⑶��(,m`G-��2�WQ���Ie%�0H2SW��Y���d����VË&��u�(5��R� +�Y�����/��QX:���aB�R��iL�����4;QQ��� ,�&��;�\?D�|?D��doI^��AA�I�ߤ9�Y16i5<aZ�6K5pVQ!�ܤC�"8K)�IRo̤S�o�ԩ͙�(���(+"��~;�Nl�D��*�x��|��<�Ae���$?���*��9Ү�UaN�2�n`-5P�C�:�ޯ��(��=u��3�g\\AM� )����;6�h�H�� �  ���ӮK�R�_�V^Im�g��������I�l<Ք:t�[VM�jRuT��wY#[A���6/��Q��D�.�*��b�Q�6oH��*+�9|��8�m��6D1nllOfdpǟ����g�x,n~VG��_��oT��U�U(�W�]IM�3Rȫ�퉈$o~C�)���E��ï�|!������7�N�!��v}G$ڤ�Fc�j�'���$y�$��.�>@
+���Z<�N����rX�7��aYI�j�<)5ԏ#�d&iY��&[�&;����/{��
{�7?��V�a ��o~��{%�#�&��b$�LTf�&�2�IuV'�%U��fYr���^�JXA-�()���(-iWޢ�����@Y�76������R%��j����uK}`�o$Ϡ��GI�ߦ�΀�|/6��B'6��b{�EC�W�+w֋QVa�P�FH֜B|�&�	�i����,a9�0A����1J��w�ᖧĬ|zo�ti� )���h�H;yk V6�K5pVm�~�:����$]�a�d����W�g���A�gj����Pa�~nm$j���g}�ފo-�r�}��P���Yz�� 4KE����9(
���a�
l{_`]�!����)�^�.co.�=�'�_��M=�5�F�
z62P$s������1G����h���J�KN�gtR��2�4�yD��SNs��(,�SV�J_Pz��-�}>ئ�Ln�^�iz�S�2���=ae�mYw��sz��=�H������K�C�J�� B)d��qY
�Z�t�C ?��̖go��a�,`��3�-���ӎ�M�K�?�M#,ё���'Յ���2R�����cȜf��*K�x.��/�'[����ܻ`u�)dt<�Y<���!m�r��U}� �}+�0��"�R�?ʻx��#�'AmPN��b7�ej�۠ǎ�������t@`�l��Ѥȣha�PJ���s�{-���w�+Ƚ>��5�8���I�6�i��c�Iö�(>x~��~�?�����㳺�a��r���41Q<I�C2\^�N�n	Xj�<r�7]��Jz���IQ�|{��ٖ�m��� ! ���ʀ��H��:~8���������0�i�o�7M�D� X���O����N*28{˯�c�5�8J:���h����<Pe(*��@a	�Ҋ_H��!wHoſ?��07��^�A�^�hv�"��^���aZ��7��|�Y��0��2�u��ìf���YZ7u�k��1o���ۿ�����pR�         -  x��U��A��_1�V�}}"!�d�� ��F�������h&k�;꽮��B��~��b�v<O��u&��4�Mk,)�v�����)��b{�|Y��/�?����m��4C��pC���@w���R�t���1EA�@w|�t��*�#]�@����JrBw~dt��3$|���>=��~�p$�<@�G�Q��G<$n��<\4��̘&І6D�i��ʚ��øG\58�uL���ڰ�Uu1g�ql1�ѓr��4�Cf ׈�H�\S�7�|'"]F,1�Q���A$�,{���$}�Vd��n�֓A/��b�Y0�z���9���%ë�ҋXB����ۓ}�H6��Ǵj��6�="�@�sD��^c�5��;�c�ϓ�	�18b�1u��Jd�C�{D��WpY�F�;���6������}2���w�6��=r�5���Ҝ�*�B&/$X!9?6HC4��y�*t�{!����-��\�����GR���5,7y�|&�����H��o!�9�[���D�u�Y7Oq���߲�         �  x���AR1E�=��>eI�ls���Ef�Le���垶I�_���󬖾$I݌���[�m������v���|�^7N�w)�q�A��C����ϔ�{D'�օ_B�v�?/����|����+���K�4Y�5��Z���BPV��a��$lI�ˡ��Y��Uhdˌ��"�3����)����5�����������_���|cD�(�%
ͯ��
&�J]"+���Rm��|!�u�~��V�R��jK]�F�E�h+��D��۸�b�Z^ߘ�b �fv)����Z��- �ſ	��ROddjIY��A�U��Ю	�
��ը�" �ʋ&�	��F��)��7U{�P���{Mʊ�/V��F6�p��/!��[V��p�\�/�=�mdY.Gd-S�c�����Nli�6�Ӡ���ׅ�7�q���41���4���`EV!��{�b�{�����]���;�&����`Eλ}�=X1&��ӗ�}zR���{�t�1�4��˥}�ͨͧ�Po&o���������k(^	ك��x}�Lu$���a�}.���Ϥ�:����L*�3��i��M��^k(�eL��v�9QCޜpK��5̌̍&+�^�OV̽$7���{I�m���%Ŗ-1��D��y��=�s[�n ea&(so��Ս�Yf�[��A7�ޤe�]w}��M@w(��2
�!�AR娸�qI��"�A|���Z��{��qg���O.�CNZd���I��B��B��x��R�,��*��Ђ��z��%��9Y(-���24KFiָ�
Muv�n0�[�P��Uy��ģ�B3ַ̮<hA�&��fО�;fWZ�gw�� :�KΡ<hQ�u7�<h6��A[P��*�ݻ
6�5�-*�m��z��I[A��4i+t�Q^hA��B�g4/��yFu���3j-f�y�?�N� ����         c  x��Uˮ�8]���/�x4�����i��M6���4��6M�~}
H�"]�G���S�2��1	C���%,JY�&��M�Y���bâ�I��'���,a���q�<,�؏E���j��'P#o�e)��<;J�bR�X�����Y8��̛��{n��?��&����;���Q�������(MɠN�����5��7q͎L�ϫ�+�ܓ�4fq'���o�^���o8�ޘ~�-�'e��8�w⋥9m��������k�ףl��`Qc*���&�YZ3�hox�A?�,f��F"�3��a�t�N/��'�ot����̫Ќ}{��@��}�����%FD�,e3,���E��v-�Ug�e���4`��0��{D
���V������u@�fKo�)���0Ϳ;[��\2g&6P$�6�Jo�s��4����Dx^�=ar���,�l��8�έ��m?\��d�9z������$_���$�n���ҝt\b�7�	�FT6����M�#Z��F��(r�&C6k5����K���sw��8N4w��Q�%��h��܇�De��C/_��埣a�
�H ��y�AKJg���^��T�酣��O��w�eo�<�
��W���Ѿγ�L�t��?��!����4��3dIn�j���v�NʪdJe���:���@!с/��|ƨ
�$'N�`��H���^U�'�q0�iJ<�i�x�U�Q��A�Z\GP��C1U ��h����s� Gr��ɠ4��ƛ��@$ِ�Ico0���K2#9�֍f�
�H߫/E'���DU`�\Im��N�Y ����Du���I�nV��F�$/vtkı�=O�o<��_̈́n�      	     x����n�0���O�;.PS�ٜ���J T�آ
�7N�$�:v��.ۧ���b��j��cό��B'z�(�4��Z8�����.��z��Pª��r#y�X��k��q�|'$�Ք8�&��\d��b��f
�繎��8��a�q%H�"��!KL�5��"Sd�)��Yg��3C֙1$��C��!����`�~0d?��p!�����mY��TY���_�<g������R��������L�LF��>��q����>�2q���|Ο�s�o�~v����M�ss��W��r�2
\��K���6B���5`0Sű�}�������������\�������J=�R��(��������f%��'6�
��Q�7&���%p+� .�����=�mpE���,�k�nq�+
�p(��s�v]���s7��s���b�CW༸A� ��Jح;7Vd���d�������]ך|��i����>J=H��oL����p)��Dl���hي��ˋ�!��Q(��!���h\��w�,�Z�����J�WyY�� @?I��>���y���/�RR���X|.!0�y���-;ꊑ��p����.�2�/�28Z��@�R�U���Iv�r{{���p�q&��!������gSy��{�/��W`�����{zzt=DD2��Â]�Ɉ�ܠ��(��4͋w�p\#Ea�zev��Z\��p�
�̓�&����~͂����W�Ux��a�m��D�6}	�\��ӓ�����PI            x��]͎Gr>w?E� ��ׅ���XPdCKK"���.t[�`|����0�v�
�7rDVwWVVF��P�_eV��_�n��O�}s���7����OO��������zz�A�;t�8�ƅ��G�#�)c���6i�)M��ݞn���S��3��� -�0�7�p@���ӻ��#Ӷ�� ��SO>�㎨!������mb�����Mw�O�N��wاg���e���qr[b�)��˚xstb::����� (�JG�)Ű�W�)�����&L��D� ��xX�� ����� �#�� �8�P pw,�
�����qʴb�ǧ�g��$��B�1���HC�"u��I]�by"ߚ((��^�����P��/C �J�Έ�C����n#B�[D�����ѿ�C�e W�dϐ�~lCh4Ĕ�CR3�d-^Xɨ_ې�!"��7b�ገѐ�"�F��� Cj������HJgH����!	��@;�!6cD��M������ }���t$�r3B,k����~��b�	�C�/7^�4W�o�.<+��r��M!�<y��0"�Cؚ�O�
y��v3YMj��/8������+&옋ny�em"+^��KJ��z`]|O]�M����W@
fҿ
�Y�_\Ջ�_�mP�.��>���ޠ? �&�-	qz1sVb��g����j;!6]��%�L���m��B]c�Đ������o��B��� ���`��"�2����i
6� !$�+�:�iF�b��3��`���ŕ̄1�7!��i8�ሊ�,�̾�>���QTqE\$fgE�@��\��+1�\�ױ�c���&_�����������MM>B,S��Z(�uü�L���.2$�0�A���J�*�?�dp"��0�N�{B�Mj����9��ɹ&cZ�4�}���:�J]�_fi�G�!�р�ٙC�}�;6!��CK.ٟ$��gd�&��PK;rtGJ�������xx����y���?|��/�����������rx���?����__���?=�������>���O����Ic>�������G�?̇��_����o>|<�����|���t�'S�7�L'v�h�N��X�7Jd�$�ͳ`s}��ߜ�inR^x�������|�U�ۊ[�e˳`��������e�`]�U�5�ΒIJo�[%�Mk�_2�]#���)k�{2��dCu��}	Z��L_������S�EfS�G�8Aɭ�a���M��b�����\�6����f����4�����ç�;�{z\X8�PrشX�����r*j���]Y0��N�F�5E�-I�#y�N��%i "���)i��{[�e��;�WR�"�q�he��z�Z���$u�����!���NK�K� l�����C+0��Ar�\���CZ�eH[D�Kji�bFy���G�^��%8$�T����SR=�b
��L�k�V1gn�D��"�*�#I���P�յ�Z�$A��b;���/�z�����'Wg���qKML��7��v�f�!~���~v�IJu��׾z�����w-�{_�=���&I	D��AC�>S{�����H�6u�R��D"�tl8-H C}����{ה�����mG�Y���`)Y\q�{���F����V�&��#I_G	��R�5F�g�� ��Q{�"﷌�̐&��$;ltt�f�d`iO�-���n���d)P�[PV�Ω
̚v�1�-���hP�;,�cɖ#h�̪v{�$��Y��,k!i�z1-���5D'M3��b�B���"6��:KrӃ.V{��aa��--Wc�����߂F?
f�f�(�Y)Z��"����19�:C�x������_��tz:���=��x�ݩ���e�(�������<c�4�C̗�i��c)�u�1px��ټ�<�R��y�TE4]?���M�b�q����]��fq�0�BE�LG� ����!���n._ �&�e"Qd9�8 ��8�d9��58S�S3Q�ԦM=u�Ҁ8��涊��y��sX�4����n��`��5��V"O�fP+�]>���f
����>��O���AM��8ט�^�W���Wo�������v���-d��Q%ݛ��2������5�EJM�%�A>阦�1c�9�9��&;��M�t�f���X�:�f�4{��r���،��(��gLS��^z�F��i
���|�Ba��G�.�����y�5�e�C�3�)FeZ�莿o����&]�R~�H��G��S��ً��@�d���{%fl3�}�MA*WP�2H��	[�DZCDS�F��CyRU]�䈠Ǭ5T�ޣ%F�H��TY��e�i��Wi�-��3��������r�_ђ�="3Md�֯h�
d����gA�9A�L�2J��*7�3Xg�&�S*]� SMТ*�JC�	Y��U]�f��r��xQ�4%e���[-m��$@���(z\��*c&+�YrFdE&C7Lm����	��Bo�ӕ:O!�g[)�V]�A�uLl��)m�9*Ũ�!���{�,ݒAOHf��7�E��������#H?�n��f���
2�y�<eTm�Y����5_��|�Y���C�I��tH�N��/����x��a���{ZA�#�Z��:_Zv��-�8��N��@�%=>���f��a	0���Sz'�H��Y�W ����2���1r�M�Y�a�*j3E��(a���M�E1�ܲT?:F�5Kܱ�u3?���]��I���N�OMZ򅽔PLA[�5��{b��N9u��b
Z�!���v=�d5 ��;c
ñn��4 ڷK���4�H]�����>�Z�CQ������ĵ�Xi��.іV�o������g����0��9�x�0�Ӷ�������~�YT��%f�@c{f�P�eu/�W��|s!/b��F!��ߣ�*��R�c���I�e!X\٨�+����Jmpe�&/�5�
^�2��#lY��Zz�Q�c.ScW�yM��,�c�?�o�G0�������f�!m���8���Ҳ��sy���S%WԌ��5���0YU:�D5��0Z'њZ@c횔�<e�6�����ʢd�2��f�?���,����r7e�ԏ���K�F��,�+�>�ܫ�����WL�EF�ע�正Y���Sm�Dk������F<R��h�k�����9z�p��9�5��.���fbҿz61� S��Ti���1�r�_XK��ǎ�8;���,�ݑ�v!:!���jg��/���?|���O���N�~���?����p|��~y{��7�+��s�o�����|f\�Pt�.L�+�? ��y,N�jk��1$Pm�r��aQ��Ydb�YjC���4��ѭ0��U�%���{Ț��;��,�!�G �X�f�=�
3�BeR#p4��[�R{�Aew��>��Ȍ�r��O�j_��'	"��-g�=�L]'*��ꕎVd�΁�9��g� �"K��⛛�-%y�.�Q� n������:��7º'j���*�o�%WJ�+֥�S{��Hڶ1X�n��Z6�M�~��2=�K�Œ�V�q�:�7Df:bK�2�.�%ʪv1��[Ț�"�77k�
d	�6��^"KWG�01�-TE?�5���HBJ���MqA�`�rX-�Njì�8Z�^�J쫏�Geh}�-Ԓ}V�ַ鰅�v�z�L�m�B�T�	��z�5�-�f��W��y] !�ޗE&?�)����~�R.6� �z��_�}�����㷯y�9=�׫�x�_cr��ǟ#������z� �[��/l0E��|����R�?��M��y~�lnTK�h��c@&��wgV�ÆEb��o�3��C�<���Mf5z{�T��$u!�9�>�������es��`º�C�A�2�Yksl}���t��v�`���*���Z[�e<�2����Om�Hwu��=��o'���Ьso1k�En�����6�d��]�م�f�{�)��m��Ǽ_��웷���xhֺ��3�Viu��n2%u?����;VP7�yTf�{�R�i���?�ӕ�Y���:��c��׉�Y�B�
��,������tl e  0�yul_A��f�E�0M؂�������o���I��4�%���yKZ����o�f�L���J���l4R�e��Wa�	�(QW���4UW6�T�^��[d�ʃ�i��
4����Bi�J�Y��\9�Ĭ����`#H�u%S����#Sk^�&g������~�}M36�ϺM����a�il 0�9ƴcLY�غ/�9��Ŭ��jG��V���l�	n�v`�Ǽ[Zf�ܲvH�KDV3�
3�M���-1���%訩��
^6s@��2�U�`�A��@�-��
@�lK`k��U ���*U7o���C�. sUgX;?��_k�/>��	��Q�Z�ޓ=�Mq��3���P���,����0���=�*��e��{Ě*�;�̲��=���Ys�,��8�L�v؞!M�HCH����^���Y!2cD}��������ՑD2K�
fp�huV�f���.Wl��{�Ck̒F���󸋷7_����x7�G�����/����JK�W5"k���K��W�D(�f9���:I�s'�t�a�8��,Ed�.�����A��>�����,]�eM���,'��iEMR�cO��z�[ՠ��WH����,s"oU���{���g�aj��q@��,+�ɬ�o^�yq4��aq��Y*2�շ�(�F�M?��&[�0i��Y�2ɜW�~�)Kk��2��s@��V�dN��8�DuT��a����^"sX=�!MY�2�IJ�{Rj��$M7����^�^:SW1V�ɖ	����n#e��-�����{�����J]���j7R��7�LEؕ��mrj�%D�'���CDY9��-�9�@�V�v!�9^z�2OE�]��a���Y~GM�>%�����ip�Ե��47���)Ԫ�d��!s��+HK�+�����eZ�~�)̎j�3�S�
fh�u�2�ć��]L�1-b�o���IȬ̏0�=�RtLK��0��]v�6?Ĥɇ�|��5R$��ЦD֫I���y��o�tW7��M��[//ί1s���_�zqu��̬芎iF�c��n�Y�N�Y�AJ�h�:{�W�[Lf%hM����Ȭ�7����)���:^2��C�<E�Y揔ͩ-ڂVLN�l�X��2����N���� _��_            x������ � �         �  x�}�[��8�o�*�P�zx���sE�S�� A_�Ė(J����͎?��w���C����FxZ������L���x��1�.c,G�C�������R_d��ɣ��C�?I(z)5Q\N����f�(���9�d*�Z�Q8�rƗ���j1��󈦣v4>��k�x���N5�/�|V���G�������1��to+�Dө���שo�7_��N���My0�F���tލ��zJ?��>|S��p�r$s�I\���Y�p���-N}�XN��c���I�p�r<s�)Z���Y�p�rj�i-u>Q8�rZ�`a����D���3N�2<s�h:X��+d���X-N��}G�Y	ņ��mQ@�Z���If�8vQ/�K)�Q@��O�*�B��<�`�ʹ�Q�[�Y�lQ@� �wh�i\�?�;
���xB̘,r�*�4R�2:Y���ф�~�W�xs�g�A*��:I_���������"���b��֔�D᠀�I{1��Qg������<���<���?�!ż-X�qA��y.��N�	=����$�扇eɠ5
HnHsH�N��I0z3�1(�Z�e�F�y����$�̥w0���7�<��!SK��w�ф 0c�I� ��ӳ��}��( t�]M�JCm�ՖbL���=�CFy��02h�BU�Zi�j��uz1ޡ�hB��\pu�j�h�X��4��1�Q@�j�XUe�t޾l�ζjy�ܐ搣�R�7Do�2��Ih�(K�݌�z�����7S3f���j�Qk�K�:6Hl�>�ي��
%Q@れrȼ���DrA�A��Z����$��jdi�y�ܐ����D�Y���B�( �!� �|�k9��( ���C(�V��^���1�jm��E����v��Q@茘p���f�Dc'���74�K���7�E������9��t�O�Mh�t�	W_+�ߌ�YgC&��˧�Q@|C�C�q
}��fe7@�Cx�6�(��d�S~~~�
�!�            x������ � �         H  x��VM��6=��KTH���-��&{�a�Rh�%�a<�>2=�1�<��M�~���R#Q�E�%�s9��:�\��L;=�|%�%��5=��e?)3n���
DE���V����6�H�m9�����q(H�X��<]L��U���g8�<����)� f%�N���"���Σ�|h����~�;�ظ0F~��Ɨ��ưM����[�֗W����MU ��ݭ��z]�Y?�7e	,�J���9����o~UQ,N��[!~�b���� 0`e�֟���ņ$�4��io!M !�e]�\±��&S��-��#߉{���t�w�S)����1%9𜨊���YU����<�QX /���M8�烅�xI��*����z�\�Hҵ��2���L@$�֯SX���/����D"���mV�(9^�o��Q�q����Ş��$	"�:��Q���os�� =�5�e��_;��D�̇!2�zKd�f�]#%��5�A֪Vޛ�y����e<�Qz� ]��N��4澡=�Q( MI]+�l���j�WDQ
i��6�ݶ��}� ��9�g�yg�����#����IK�3�&H�۪j�޿"
JH�-T�����+���j/c[/��k����պ��;m�/���H c���4sm_��{i2N���o��o�����߭�_30�L��>�p�p" K�_���'3�ڵڛ~�X���eD_z=k��Ɇn� =�,'�Sϖ�$aR�ϴ�#�s�
�j�ʟ�G�T_� �
�J2�Qϴ�jn���r¹�Gi	YE:=���S��0��s�;��z�� �	�L�"�)�ݰ`���Ü�J��Ɏ�A:����ܬ\K{w�����g|�T,-�t1E�ЕS�����+=냍��L��x�cؚ���G8J3�2���8O�uVm^#�s�K��e����L���m��.P@^w9�*���  ��"	�<Y���[���

Ff�^�;�a�qw�@�Ih�n�+5jÞ���	�K��ԇ!",��	ͭ
MW��C����1��g�p!�-�	(�^Ʃ��C��wBEY
?( ���         f   x���! ���UL�p���:B�����5���փ�W/�����o���$S^d���%Wnr�!Gt(�VB��V�t*�.塯��V=�`����~���      h   �   x�u�1n!��N�430l�"��X� ��D�ڲ���$M\�D�
>��M}��9=ʵ��}[M��ia m
�,
C�%_喍Y��h)F`�(ͨ�'���l���ۓ�u=\����}5��1Jh.�^3(Pn>Ī/��	��tFr!���� ���zt�~|3�$�3t�x��XHA[�p��?E&�Yx��|J{��"����+Vz{(E2���A�%# ��
<�w"qo�'g��$b�         �  x�}����6E��Wt��x��?��6ڪ�M��oP��&	��(��֏���㟿���2��E�8��`jT���f(!uHHI��!B����uePN$��x���S�`JXk��"@|H�AmdN��L9* =�0ք�CV���3hhO�6e'X�9c�:�LAȊ��c��J�{�!쀡*��<о�J��#�����M�nkO���9E͉������:�����#:=y[F�{b�ݾ�H�������/7'l�,'#��Zi}�6��Y��-%@ț�/l�v���ⶖU �n��^���s�E֔5 ﮕ���}HN��t�:�s���ˬ����A!�t�[�,�+�w�1H���J�#P{H�S	�T[9S�ԣ��ʷ���n)1�(��c�cBR�R<bF��sN|���.��"V`�xW��}��چ��q��a�M ��|X��e��	͇K�񟥶ے2I��"��^��ҹᩕ(eE܀�ZK���q������l�h*AȊ$�x��R�d�ޒ���H$�J��Mփ���	�P�Ҧ���V	��0��2����:;9�wHDD@$Ȱ��&t�Ra\C$
�.�^��"6(�eWB$�{{��lW���z��H*���^�w��S	�m-��mW��7G�=��SB$ě�~���(���IB�ԛ{�ڽ'��z��Hԛk��Xr/[�͍����߃�ʲݸT�n!)�zom^Ӌ췃����mM	�
�7�ϙb/4%�!��[�G���\��y&ۈ�T�/
�Pg.�[r��2{��;%FZA������T}�j}K�H�3�Jm����=%EpM	�vPg�,�W�4GR�B)�7�y�Yir�=�r�#�D�8ogi�W�.�Z[��R<*ř�x��Ô�#��gE�
Cq��R�?MO��e�R<*$ � ,         r  x���An�0E��)�/L̐rȕ/�tc4�+Ķ�AP�{?e�r�%����̟?C�Ҝקsa���ñ?�Z�ǰk��������pc�4�X��v��b�j��7���CZ�9���-7�U�����7>���`Z�똲pf6�BYQH
(�e��Ϳ���x�Y߱f�����G�R�b�B��<�&�x�1��jxb7�7��x���jxby�i�7�4�������?��Ow��?X�^(����,j��>�`����/Ȁ���u�H,xҼ�ח��n��~;�'���8�~�cj���C��e����]�
I�0�2#~��L,��'&|��qw>jgm���8q��=|Ԛ*�D>r�}�q�(�O��T�C4!"s^��ă��b���0ĉ;��1��~ѧ��*�X08	i��?ʔʌ��/¿��Q�<$r͗��`qDS�<&Kts�;�|�b2��^�]Љ����0��<�鎧�U�{��<
�wݏ�S��.`�:��R�>{_x���n������E�ezG��CjxXv�9y�'^�G�~$M�_���wn���S���������j�<��ϛc��iՏ�ӈ$-O1t7���IpT^���i��/�|!S         o  x�uSە�0���p�0 $�������f�$��1xX؛4a̓��r@RVZ�����Hb]�AW����X98e�a��]PDkq聙�9@����!��NCХ�l�g�������@����i%t��^�/1�)Q��W�ឬ) q�(���c?Y^)�Z�9��/����2���� e|�HuZk��A�S��&j$�L�E�C8�KlGՀx�)�m����;���xz���EX�"�?�8�x�w���8;�a)Lj��E�b��Dm~*���]���
+Ѻ��HĎ?p'��+Kȳ�=P��i;�Xwx߉*^�UcG����;�Qމд�s�����>ڔfW��c��2�h�&�:�ѿ���ξ��      j   q   x�u��1C�3U����Z�Z�� s����B!� P��SeH6W����u2�����l��Ͳ<��icC����Fx����r�U�:9��|���d�}s�mk��g�-�,0      �      x������ � �            x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �            x������ � �      !   �  x�u�aϛ6�?��2H�7���u�֭�ޭդ��8�&���:�j�HH"���y|>H^�j/A�Wq%�7��1����RB�)�R`v���
�QHߠ��h���J?A��䞐��K�՞��^�Ld�(P�P�ژ�?l�5�g��y�r|�>��Ր�GB��J��O���DB�Y�Kb�j*��3IL�
\u?����%	A>���v�Ӑ�$Tn�=�z0-�c�P��A����H5�A]���J������v4NM��>����:�e�;�2?�߰�7�U�{O�)�������4�L�����:J����8��h�Z)�����z��	�=C�'�p8<c�&u��7�G�>�H�\oB�u��w�6x�ǥ;j�{��6L]I���?�wUK��G��p��Y�IR����}��$�i�+��~������hG��go�PBq�6Vk�Qϻf&�����}c���R�7���١�s�UG�S�Z��k=u��0+�;Cْ!�Yj�ȼ����S��tt\ᵔn�P�;�2(�?XyC��T/X��RA���k�Fq���JT8�gF-[V[�k�Z/��f�P�=�isd�rU�����R�-eTvQ��6wQ���0T�����W汞��to�f�$*ډ�l� ��߉P��!�׫��O�WP�SP��F3(Q�qp�����y1ᢌ
�]ͥ.�u��R��p!�Dx���h�UI��[N��i�/�[�Z�N�ˇ�/�i�o����Ű4�Ņut�����k����$TsJS���0�w�	�B%{d]�u��P��ʥ�Tz}�v�<�.���}:��1^9�]��`��ЭV?����.�O�>_3�`��=�����p'�ToT�.�-�Sύ��i��7+oQ�m�,��G2��9�m�֝��P���Π��cLN�j'c[h�u�7�x[)32	Z���s���a�D�xS��	cia�.e�t���P����>���ʂ._.v_;��,��/�K�L      n   ,   x�3�J-.Q��LI�I-O,J�}qr�,8M9c���+F��� �*      l   �   x���1
1E��)r���I2��l�m�M!h���wa�@H�������}���}���O��q���JE)�D#�������h�L�3�!�i�(�P�,����<g�>�'	P�� �h������!�o���Pl�      #      x������ � �      %      x������ � �      '      x������ � �      )      x������ � �      *      x������ � �      +   �  x�e�ǒ�XF����k�]�>fF� ��ӏ~*&��Yވ�(���Vv?���?H���"")��]̛8wָ��^x�����p���6�@3[��<���̿࿳_�[-�9����,��}o����{���� xO2#|>mj���'N�@��6�o���F[N)1t9.D�^�?�`v�:�#��*����E��@؅������䶎�!�1��H8���<�{���2)�,{mx��T��? ��/��z�_���d!1N˻Г�cmvԔ*f�-My=�z�It�D����uOz�L�%���<5�����*�;*g�sp�zo2>�G]@*�z̩����a�C��ͼ�T6�9�ɇQY�fg͛��ZKcȁ@����>��ц���s+Y:ouϘ&��f@W���y�ئ���&�������O����Lu���.��	�nv�n���-�פ�����r�'�*J�M�G��BH��>���bοM�ޛ�)*��@9��g�*�['�)0���:�jL�:Q�N��Oȯ ��l<��h�h�o�,��2G�p�A�]�C�*�Z!�t#�u��_\���u�2P�#~�}��yj��Y0�g�r|��L��)!�n?3xdk����,� o��:��q�+�D.T���o����.v������u^���	�����1�\��겶��PbͶ~�5TOlt�6�!�`2n^T-���)�+ȋ�?䨉C��G27����RqS줧��u�@@A����{��T�^��5�N��ƫ��#&)�d:�Z���'�:n�\հ���Tv�Za����ll�dL	&l��h����O:
O�u�ȝu�u��H7t�9��-a��� `���rZ�C:�[}}���5�u����{���u�=J�|�����S������A;�)P�gܸ�ZY�~�RK�uڃ���ڷY�96�^ �����F����KLd/���o�<-G�鴦vֻ3`9I׾��IF�I� f�Ec��x�o�M����-6�oo17gI��6r�"p'��7�Ƥ�� *j�_�2ݒ���nc�%�1�\�����Y��;Ͼ�׾���w��p�c������,�!�*\4 ݕmNsQFE��=9�]]2O`�V��^C�&���>�% �`�~PS����Q�>������<�8P+j%���K�喔e�F���mT��PC�K��g2b׌]�MS��#������� ������*��2�q}p�ee�喞u®���*�|5&NZ; �+j},�}�S��b�z��fJ�a����t�����n,��7����ǅj���i��ܝ�0��P�Y�yۼ�ݝ�	�fS޴�[��� ���q��%�y]�2�X�&��a��nz��]��4A�q���I""I�&��P��ѣ\/��Y�r�{O_���i/1��o6�5Kp���5������2�
�y pf�+�[��@:IW��B�� G�S��^�X��_N�ŉ)�ye�E�Zt�ܭ Q�3y��������!!�ُ�'L+�*�<dW�O�Ɔ*�G۰��"μį�G��>w�l#P�x)G�[�|P�>1�/��M��փ��ꨟ<ǯ�+q>]��q�2�܋�Υ�3�V7���'��%>9���GK�?}¯�k��Ke�ax��m�b��-�C�|��Ћ�Jt@
iY��8����;�I��E��!EZ�'��zO����i�$����ڹ���y�������T�/.��fs �$�����Q�� �Yc]����� �:ΐGۿ��'d��P��4��^�_!$�/��LL۵�tuQY�s�KlHL�3p�gq=z�1�[�[�<�N�9S��ȭ~HW�cŗ�M9T�>"�S���ҍ�-u>�)	ߤP��a�/����ǂ��.�c����e���F�;����Č���*�Gf�SM%%�����W�G \F����[��r�9,T��BJ�M8�PSE՛�ߐ>��W�w՞X��`��3� d@�7^���=z���j�෰$g��'1��z��&�)�X8l��%j���3��#e�γ����ft�9��tu1�C �yE�t/j��_�%9�2ߋ�2O4��8̹:����z�v��8�s[q>��R��؅���&��kJ�x���:�{�n~HW�wF#��c���}������%���E��
�ܦk�	�L������7���b?ՍO��-"[�ч>�*D��dx%�&����/�iqu�p���WT��L��{h�lf��	�������c��YMgW�k��R��n-�T��@�g�3.l|"kN�0Ϭ�Z�����vn��x�T���D���z@���~�2�OӲ`�Ǔ�C ��й���¹͉��P�5͜���Q�7�;X8����H����/h��h��9ɫ���-��`2��f�-M�a��w���I��ٱ��z ��ķ�Yq��8�^5�@�y��0Z�T.���L�i8h�u���
��G$ݱ�i!��?��V/�Ѵb;db�EY�V7l:�2q0j�lK�U�bI��yu܊�0}?%�n��0�g�J�p��ŀ:�����G���zj�L8;�����YA��B��؋ȳԌ�g_6.ڮ7��W6�Y1x9�޺���T!��g�k��nz�
�T�P��W���pI� �G��E!����tu\ۓ'jޝ���ԵͰ0��� 7!0:w�������j\�8��W�Ů���ܮ�g�@1ps1lo��h����͵/���
yu\|É���>���	�!`�t B�(�2��xޚ����y	������ot��H�5�7�����G"���8
�}4Ƥ>��9-���^��B����q�� ����a�-4�����2��KϠ���8uu�q����=7�SmXtI5��/y�z)$���v�1��e�H�?IG!��������      ,   �   x�m�;�0D��)� (�ͧH����f�G �Z;EnO�t#�ћ�q-jeIh���qOT"u4D��MK�|"#	3%�Ô3y]��"t�1���IVȿE5́F:4(��Ŧ	\1� �l������wJs4��F]�����r�}E=n      .   )  x��RAn�0<o^��B�$PnUN� �zA�L�4+;rm_�)�.��3ڝ9�^�� [m�=��T�ج��*���O
�ؐ{?��g�,�����JavG�Azk�H�Ck�J��ޑ�1T�gk�45d|�o5kB6G�g�1���;l�ۓCU�p����t�kG;���v<jG]���?�������SX̯Fi���9Tk;�|��
C5C��N�$��t*瘈��4��"}�:�&�)�������il(9����>���w�"����^*
N����X(����屃ME�Ģ�      0   �  x��Y�n�D�>y����<3^�7($���!P$n*��w6b{��l��AA�^�<@��TU����F����	vj��ծ�O�9s�gCi
_�'Feg���	UJ�m��������e0|��\��2�����p��A��n�x��0�W7j�Fq
NZ�1��g[|2Ϸ��|��φ�'[|:�l�<��n�|~���C��?��q�����/b�x�_>��1��Dz�ob=����o��o<Ŀ�t�V�� �Z����[}b�M�mj��Nv�x�M	���n��M���(�^Jp���-h�Ƭ�v$|�l����y���f!�G��K�[�I��ϔtT�|�N�!��p���V9u.��*������,S�	�I(T�����'-?[_��y0��%>ڥ����q0�lEG=ԓP�C�g������5~����_�o���+R���o�~¥W�۫g~�W?��_=����_��9�QDI����/����n)�].��i�s��������/^��M��{�"�Τ8@6���[�I����h�0E	���]�n�N�B�3U�lѣ�˷�7o�ҕ>�R�U�3!났KG9��7��a#d'�<�A*��҂B�x%�S
�sq������	X���}+)�"�Ks��#
R+r�O��->�;$S��CD9'��di\�����S��&$z�í��6��V���"�I%�S��D/a���N�Q�d�D!�4}��VKNc�T
�8@���b�T�K׻��ʩOy�ь�ֽ,)�Sb�\��J�E��\.a.mfT�.G�:���}߅��4I:�G����Α���LZ��X��>䗤�3G��U-��_5DdX唻���+x ����������V�-Y]�����E՚��b��\�t�O���k��%��ꂖY����g-� 9�d�ͅ0s�䒬d���70*��M������t���ˬ鍟���o�M�4��I��#'+��mLw3�|�<ѣDp}ơ��iv���SQw;�����O��I���f��x>�J.��e&�\8<�LPFǔ���qZ�Ċ��
=��q.���w���k�V�3�s�;ZGS�)��Ј�����&q�a�1Lp"c�����#�����[	�T����fN�%N7���3f����),ZX�ȅQ�ɒ��,�����<�`�������\-D)|h�"6x�������4�J^ܺ����8��jj~!p�x$�Q8�6��Wl���S�����ʦ0���q�K1�%���K���e/w��c����R(�o�`_��Ou�g�^�`��1�[??���Kܧ��ѯ{h��x��?1Rު�,�}
�چ ��3H���1�_<a��Y@B���`D��XH��K�Q8l�;:����k��(��_9��os~��	.Wv��1�ń�9D턃�����)��Ѕ��7��8!VG#�;��9��I�� ���������eK      2      x���Ɏ$�y�ϡ�țF�F�ujy$�<�,�0`�TEU��*��Yݣ��� ���dk�
5od�KDFFv[-3���O��7�����o?�n���n��������n������ZQ��pzټ��6/ݯ^6O��}�N�2M���o�#�F�anL[{m�X����;^�/�,]��j�4��%M������Rk���������v
no��-5�|��"�m��6�;n��}�����}G�_���̍V7R�Z; 59ұ;}xʂ����.��vcr����>����������q�L}�v#ō�7���X��,�r�du�
��Hs#m������~�ԍ7V֪�W���(}X����H��Hr�w82-�$_�KM&�by�1J��TZ
�o�S��A��;�4M���T�S�Vjˆ�ljI�B6���e�����f��iV����-=�����y�ƶ��D�"o����_"l$�N<�v����5m̓A�&�֝+xr���o���m�U$��"���<N�^��*�	��b#=̮ҵj����o��Hf�Fٺu8�*+(��������CZΘ�!�_+���oTXf6,���iD��C�$��ԧK6�8���>7[ɺ�R-K�Z��q��eYYO���,��zv�q���B���,����l]���m>;�Ԇ6m�?��M�|n���(9��K�V��;���R�od� nL�\*�����%ޔ�e)��Rᘘ+4��b
1Μ)��&��rt��P(�t[Y�A	ҩO#tP��1`���!�\G�ѧ	�	��
��rl\�S�{��4��2Ԥħ��A�W�p26$��\�&�)be�0�\�����[�d�e�BQnT�7�����ܔ��@���n�v^����_΍[Ɔ�B�Ұ��a��_3S�̰�)���������W)������.����F��JzY�z��n=/L�a{����뗕]�E��[����]�A͟��-,�w�,Q˸p	�4x�2�LӢ�����k6+�4˧�N�D-~͊�,.tV�L4˧�2΄�*��Ͳ\,�l���k��b�&�1QE�[�e�ԡq��d���EJ��e�Np��t�6�/Qk�%��db�dbՔ����[Z��se|�vS��C�yAŰ:��E��@��g	��69QБ�j������a�����K��`pđ�����yV֞,&튓#�R��*PpO�r)�ǁ���m��1��p�7�׷.���fS�z�`p��m�n�f����ѧ	�ފt�5ck�c��m?h�R֚�����mR�.�A	
�"��e�C�b}y�mpd]�26k��֦>V�s����!Ӄ���$[����8"em{Ck\�Ӏ��o��{CG����ד�[��[�[q��ܞ�-�����-kbCw}�SϖL�&��A�[����  �0���֐��4�@?i{���V�6�����h%�;��5�~��H}��\��y���:�u�n���i�{Lcc��/\�h�,a4l#	����;|����`.J� ��O���� ����M�}y�3]8?�t��z����'�j��
��6i[;G�Ֆ�w��&�pi���/3��239��4�FՍ"�j�iވa��0T^�cK��1��m�7�Zme�Пe�&T�9�|�@s�'y�z��,��,(���&�>\zTX��L���K�U�Sr��ա�j����[�=L��B�B{���*��\l�tz�U��6<pE:�;�4�Z�E;�tl�����~��OAM�z��yӡSП�w�����i������/t"��-�eh+����a�vrn��NʲL�L������7�5r��Z����/>�^O�[���`�r����b|3-�*�0k�(8*������� +8K���o���JN/�s����b\u�&@�{�As)KIA�A�T2�5��{r.�5Q���`�^_t�@�h�iy��uF�1O��oyA���`c���q�������C��MO-_�3��E�����*P�tn��8L�f�j�/��D@ߠ��?SX߈(�ȳ.U�����Юџ��O�p�G0Y���=<fh"�٠g�n�g������@�s��a/�cˊ���F?�4pQ+0l0��Y�j���غ�+U�Oi�uY�N�	�(��؆6-}��,���6�Z��"]+�,��������1�M5f��	1�n-�=wt^LV!���YmknR�"]��!���:�(3jt�Q�-���E����7*Y�9�j@	p����T���Tj�=,�j̡���Ғ5��m��v{��K�2��k6�9����D�k���#So��*�I�(�Z�m�z��4���:�w5E��y�	.h�ۢ{v
�$���� �k�;�48�����W�wB�<�jH{�z'��0{Z����^�yQ��6�%��EA�s��e�����m�p��-�p�y��8�Ͷ,�9�x�����c��D�y 3���X
d%������!|V��R��Ox��&6�;Ã {�!�����(��%x(��Q�A��q�Gas�A�(	��~ޛ+Q#/$_�u����:èOP�zb�k��=+^�u��T��k��O��
,��JMˬ�fX�f��C��V~
�Šr2����|,8X�l�l�L�s,���*�^{`���;���^�>C���e{��
�˄V1��;�R��-֕�Gi���]��(8�y����(��}|�̻�g�ֈ�
��*�{�yw��eq`I8H{�����  g�\�`��~��}iV1կ+Ea�c��%�X��.�)g8M�	ïZ�������9Z���9����q1��ڱ+�%���vs���Ҝ�T�7�^h�4�e���Z�����;���:�l�D�1-��{;�Hp����4��HA��i���y��>��Ү��ͣ�r����U���K?5�\h��1�A Z1��Ts�/tq��T�#T��E��]��Hq؍k/�}*�v|��eG�@�Cf�;���/e�(/LF���tw��,��f��G�'8u�0�04�w������3ќLI�a%�/	S�wۻ���v��Lg��ᅁ�����o�L�F�
��ļ�!F�?x�ﷻ#���`0�H����M�?{w�w���#HCS�^���D���i:��z"O]�N�E��ļ�Em=�'�[3��g��°\h�ñc�b�c�}l�+|w<�vU���5J�IVi����R@��˗���v�!�#��f.�>7s��o��Ti
E���?�Z�1}���w���c�?kc���Tf��u�Ee��M���[á�P"��ho*�v�4ˠ�Mrw������%���ǫ�1+\H9V��a&�H��p��?b��S�
����ma1��݈4��>
�H|걲g.(����-�|�����j0𨴓xyҘ�1�\��tgPX%�/#*�!.E9(�Kt�=\��=4�`A��y���6���HoS)�s[��kA59[UA^�R!M*�A�[X41�.�Ey��N�Zq]�r���A�PS7\� O|�g�����0�9��n_<� |��Q)��� |��Ln�WP4�Z8��TA�����b5�悌�e�U��H�gA���^A��&k��K����`1�\f�m�k�p� *v���z����o(cM]�s:�5��� �N��6�����u�����@T.�^�}�7S8Z�_�V��|��3�{v�m�.�������1<}Kf�IV��~5�����}�U��{���	�֦���	>H�VIT�1��[��e�"�5����`W&�ͤ�NG����{�Al�͌���,�)�gۇn#�N��� �����D�ML�.ɨ��Ո��7��hvF�Qn�*Ma���D�+ϗ�L��CI4��$zw��d�N�De�a����P�p&1�<���^L�����If�$;6zwo�,��AZ� �q�ᄍ%� ���PTA�������}����Unۅ�Է��]�-��B�N�[�7��-��B&O����(K���cC���    �L���t�G�xp��b|tƗWO��[��2mI��T������_o�v�
�T�oވ��yb�}0�^��6�70��_W^-h���P��evE��xp��b|[;�K���������e�tx���>~HA웂o#0;.�Σ�����������}����_������߽�v��_��^����~��a���߁���x����|Σ빉� ��e�,�Xǅo��<�T�#������|Z.��u�����w�������.��w���?��������������7+�N~ӃbɁ�ʛ������|��w���_�����߿�f�������XP:��v���*��	�/p���n��������,\E5���}j2��Ǚ�!	۝�q˧����L���SN��U~�!�1��Xn�#����3~�+ِ�LZ���X��c�R������� i�q�.�TZ��T�Յ-�yW�hF<xd��gk!M�5����>n?j%�|���c��Cb[�/����qd�5@�ߍ��ݨ��8�'�ۘe��p����������;����Tw�� �L������g��>͞4�U?ٿ��#�u�������Z��Lފ���M�Z��6~s8��Z	���N<5�
������&l������u��xsj,��+�9'k4���x�yf:\�OXa�p�Ow��n�s`�m7����[���Af?�1�[ɵ����a4�8N"zp�qV���F�u{�U�	���[n� ��"�m���5��g�Pž�������D������T7��=����i�d/4Q��P)��S'B.�
4,~ay�͖��v?��<c���0=���y�9>���=�UZ���M?I��3K�m�7���L)����~��U࿍�A��~�W�KVP��M-����j�Qݘ	/� g|�Ӹ���m�w�ݩ�"�b�MA�:�NAw������p���z��3��)9h%���S���	V1�Y
|�����p�i(�H�P���h��J1ƃ�w�R��x�/���y���\�0����>��C���Z���qUG����aQ@����:L7QÕW��g��Q�?����*-��:ݒ�P8��٧����D^Q���-b�h@,B�Ŕ<OQ��:����������3Q�4*������D��A������&�B���y�W8d�Z/G���(� �D3��'�TV_~�9�t�Y�хn����z��P�(7���|�z�y����#���X���2Qz����/�5���Hd�*T� �2l)���ܐBaMт
�㞧��t%����-��k
���e"&Y;J;�+"D2@��O�5���TIuo0°�]tA��y(��>���x��sK���x��W+��K��~|��y�{y���N�w�ݱ�#���)HT���Q����t0|a�E��0��xt�7��˲��e��΄���ұ�o�����/7χ����YN�.�l))�����PNZ�yg�4�8������C�e�h|��S*�.3������j��`�b��.�3���OČ:���c�)>�t�g�⛕�����l7���� ��&����በr�|����k5�@��xp�1����/����&<|BQ��΄�$�8==,F�y�5%��.�Kɝ]-f����V3��NÞ�Pΰ^Qf=4j�tVZ� �~��� �d�?L/,��B�K<��ŉi�ᒢ(�@�d��G�1e�� |� I�Ă����:�y!"����<�a!@�º������X�+\�fbS�;˾~�����x:��>u3�R"�d�k��)Y��k���q���Oa���ߞ����qw7��(�a�s��IiaH_�[��h�L���b�n�|�&�r����cW�
��M_&F{Q���d^�uP0\�e���K-=���⃶z����_�����n/<V/g���7�@�VP�î�۾_q4M�f]䆯���%@V+��<���1�Cԭ�ʣ�+Yq��^���vS�"<Tb�7:3a!h��ww�7�FT�])�IgB3"���gN�
���aS��#� &c$Y�t���и��)�X&⣷�_�+���,-v(����2�\���%� x}����K�&��\pA<,�$L��o2y�E�'1$Z�Z[��n�9 Fm�=^L,A�5Nx�J-�^,8���j�@Q�TT��d��#*` Os�Z�%a2����� ��	��,ޙ��ɾ��'d���S�	��ȣ�y���7�Z3��T�k0��9�*xQ�lqԅa t��"��)���*����p}jxք`��r��ɥ�M&#Vf�xԷt=1�b0be�A�^��<�Z�Y��l#��;��-jU���\����J����rH}���]"`�;P���� �����I߂z�A$�ǚ̔/o
*��m�3s��._��<�$������պ�o�>߽�A����iAYD�v}��Q>�l���á�8�����\�F�LG��'�Xa���l��iԥe��%�$�o[n�
(����S��ѩ��N���F�x0���o�@�5��O��pX��r�O�2��sу�� 2�'���!���9[�b�;�nzw>_��=�h�XIѨ��P�I��6
��X
��F�������㇧�sc�G���!ј�K5��m��R(���}��ۄ������l� w��A�K�>/�@O� �e%�0d�*��q��z:����kt�@��'�M���ܽ�@O�lÀ��N��o8�g
2?cV�J��"�hg�F�jwܝ��@����r�@=��F�<�M�|�]���!X۱jg�4{2��K��C馁��bۯ��S�����pS-XS�],ٙF@�ϐ�	�XT!��n�k�L�EA� T�$�Ya14`���xcuՃ�n�w�������g�h�V��g��Y,�,��>�1��~a��L���{����+݇������Md�ڒ^�����.b�Os�|6(�Kx�]e"�U6
$U�yVt1�Ș���7��e���'/��U¦�_B�u���j�iD̝̿��8<>Bh-c�z5��ѽwE�F�@�u������o� �t���uL�m\�����$��Mޜ�~�y9l�0�99�L�G���뺰ۇE�Xh4�v4am
�?�nw'8$��w]q�$z,�V;�:ΧK��s�: %
^)`n3�	��0� ȉ�0�i�Q��8G�C��l���K,��h������3�h�X�^-u��G�/���Pg
�$�Z8��]�[�������D�=^�����X8��@ʷ��>���%|my�b!�MĴDxg�5��V��ӡ�;||�+2������~M��C�r���"�L۔pF��^0�r��)����F�t�m����m��YS�C%��
�O��Qf��d�&&{�A���&Q�>�d"&b���D�GH�G�b� fb����;��̹&hb�ƥ�׫�j��Q�nEQ���긘t|AMam1AɊ� �b\s6�4���7��}N�)(�q�K���u��)%SPJc5�Bj��k�rc���@�<�K���۸��o���9����n��d�[�7g�m�u�K����M�)3}�8�ɼkQ��f�fbF]cX��
���f�i �1�����Q18�z���WD䱿���R��)}V �j�p3&�B�.��0���������)Ԓ5�d�8��zv��&���1����X��":�3G�3���E!��I��`-�GJO�� �Ԯ	�����_�"�"����}|�]o1�B�!�E\튀�PBP-W��u���Oiy�W�η�B�%W8�瀔UCA����`����l��@x�4�����Y�X\�r�l����iƇ���&~��(�jr1[i�}�ͷ�����w9ӓN�PFBe���'�V�4{���=�
�# �H�&��Ѿ#�}�qF��p��%���o��v�x8��2 �u�C�;$��p��e���p��H���8��*�m��l��< �  �>���V��t�=Uڸ)���1Ubz��rB��"��Y%׵������Px���;V���1���Kn�.����S���B}�Oe���Ml
 h5(�y�X��_b���������/�\zn\s��4�tV?}yMp���5��=OWİ�S톉����6���sm��m�F4�MjT��*�I�20Jy�X���/1����y`ޠ���%�e:����g�/�=fW��0σG��c3�Q)���Gd��y��(��ż5I������� �!�PO1�Jr��)�$%��iYK����1$�����J�}�<�p>0����$�?�0�V��mA���d2���#3G��EE��$�	7��ڂ���'ǃ[,�[ޔ��+��
�_�;��_;�K	�i��j���8�4��<o�M�kL�����
���E�l��߁���VN�P H4����"��66���fN��f�>��gT�3Zբ�)?�f:rٍ��ek�f\�gNPAh����������8���>��*!�G@��,���:�6��q��}˃p}P�h��Q����v{xK%O/��x��9�� G����#h���O�][�����'��Z����霐6���R��v���c���E�Sm�-�������twȃ�	'���!B�&�]���P�F����B�@|�]�>W�ʬ9bD��|>;
ja�>\���($Z�����%�e=���R"��-�C��6~���@(��ֶL�b���w��[ATF��X�ꏴ�Q� (#7�T		o@��Y�8����$W���B���B�vZ�=�a ����	ac��{���s�q§��7�5�(2@6n^5כ�G@�8�j�z��������~��[w-      4   f   x�34�,I-.��Kw����/�,�L,(�K�����43�����ehH�j#�Ȑ��M�72�4G���qZ��06KXrZ�I��X���hF��qqq �86      6   j   x�}�;
�0��e�%�zͿ+��L�~@�?À���F���q���0��(.٘+�E�c��s[�Yya�K��W0�Y#�X�=Q��u�]�7Z���!      8   6   x�3�4�42�,�440�4204�50�52W04�22�2�г4���/������ �U      :   v  x���;n1Ck�)����Ϟ%uN��#�Ұ\�΃,��&�b,������8/߯��;���kj>���l�/�*'l��P9��"'E!�%��S�i;K崑�눜t˱=2F����ʰ9�r��;�U�r[-r��)��C��i�!G�3Eo'G�;Eoؑ�N#7�3r=i=�.�S6�����Qu��䨺S�Y�}��-�攇�ˣ
�S��ɣ��ǂ�)�F�3�s����4u��tu�5A�u˪A�u�9��tv�I���n5k`�~Wo����ռ݌��-�7�	�IRmyS.�u�1A�B�8s��!O�p��;Τ I�3�H���D�=�dP}=�d��WHm];z�=������y�?iyI      <   �  x��ױnA�z�+�C�wow}]D�&�Ф!B"D���뜯K����f<�h��.�I��5	�2S���V���c�'�^9}�/�����c�ZFhZAh9�
Њ��Z^ Z�IihUZK����i��5D��H��ȴqh�,�MC4�>�Mk�Zq5=���Lm&=P]eY�������緗���vs��b��E{�Q�Ӥ���&e�Ӥ���%1ӈBL)s�DDay�rB�,,��aX��!ҰH�C,��CL���,�!6�MaG+�X������!v��fJĽ��2��`�e��c)��i�`�|q̼{��`��C\�8����\vr�b������ ��o^���Z���� ���韵8<H����A�g-��{�!�,����4C�Y��A�C���>D�?�#I!�o�� ��D�8���D��i�~ �	W1      �   |  x�u����0Eϡ�4�ccײ�ױ�v�Ɍe)���������(��K�R=��Q*7-;NЬ�/�_�S�PFQ�='Xֶ/�c�q�L(Yo����2�h;N�}�dުL����8��j!o�N�(m�lMu��n���{�'D�.��}����䄞��:%X֞��J֖o��Z��4���^ZN��l�q��f��U)��뎓f���N��'�tUVG+�/-''�t�S�k);N��>��︱���I3]]z�!s�}�Cr�LW���N1t�Ur�|3���2�4��sV��,��O���?8����d�Uھ��q��''˽�O��
���d�q���y����z?Js$|��r�LV�t�h;N�{ex;��6��αy�q�a"�s�>      �     x�u�ɍ�0�fN�O]�l�q,5�Þ�
,�f�Dtp;���|0R��_�'��}j-M)�@r��ǅt�O�T.�zƁ$��)[��b�8��<r=���2�����'^��6&�P-�[�amj����$��&�2�g֦��[�Z�*���%�F~-�S�8�M-Y���Vm#���%�F�����G���2�I�m2EJ7�8p��c+���98p�,��u�����`�HYh�r-\GƁ#e᭬X�m������V6��8R��6���4� ���V�4��}a��E�>T;я�S�}]O���7y�'�j	�nI�T��C��n�x��"�&尶�oU��o��"�~]�����8H�Ko��	l98H�K�!��5��ʲ5�8| ��H�      >   S   x�]���0��c
'0r��N���(臖 	y��3n�=+`��g���o�^r���x�Zi����ό�j���E�."B5#f      @   f  x��QMO1=w�ܼ�MDQ�b8x�!�¥��nC�]�Yq��S�@H0A��f޼��k��Hc����8��mK��zMo��Q�)�c��]eBs�ـ�d���� ��jP�)�y���4 i�?ڸ?�p3�:�.���Pd�H��%�����U+;��H���y�_�A��٪��Fh厷sd�35le�F��2+���x�?��z����v@��ߙ��)?;�6y��6[,�I��1�Ra��� ���69�kf����Tc ��랩���1mk��iR�2����"{^~aJ(��lx0.��AʝX����R� �&r����N%��+����E�nƍ�>�X�EQ� y��      B   �   x�}��
1���)�KK����>�⢃����������C�K��ϗ������((Krl�#q��r0�]X0�A(��	B�C�iC�Y8������BI�J���9M:열��j�ެh��j�z��UC��~F�n���q�Ô�q�5��B�_���P��D���˩�����8V�4�&^Y?�*£G�7��T      D   b  x���A�#!E��ُ�l��!�}�s��$��v�!%�_�
��|0���)����R��[)Wh�A#wn �'}]J�4 ���'Kn@7�+������N��P��H$�@�x�~��BJ
�	�>�P��B��b?���V,�&�:E0:�s���4a�`�2�4a�`-�q� 4a��F�`nM�K6�0NL�� 
X0�aęi��%MXu�_V�� v�p5���KX�%�躚E7�nJ����{�>��{c�92q#[��$m�
��րv+`�WW�%wX5��	����Rk���`�*�!�(J�1�G����@F���4a�`�W1��|���$�C�%G�<(�����'����a��v����aJF�Lk�s��)s�w��sIx�|��B�%i�a/~�W����N+Kf~Q��dy�����x��^%�&��fxȽ.	W۴Eav�M[4��m:�f�T����l�sw�M[4�&��h�۳E}}�ʞc`�jӣ�e�XN��4,��T�H<|\��~�p	�H�O()���K�G���W7����d�d����>���ݯS������a�I�Te��D��
��Z����dQen#M�z2�	��5A��[Q��W ��nQ�u�$�^�x�ݖ~D��$��Y\���[|�5�/G0�/��&�9X�}�]S���ݦ�`�}0M"��fo�Iqe�M��|��⦓1�s2&
^*6O~�/@9��@�ه]��h\�#v�w#a���[���<.sd�i�n�,ԭH�y!��`��/L�����W$>g�g�f��0]?�	b����6��)%�"԰�E��K
�Η��/��h�      F   }   x���A
B1��uz
�Ғi�&�Y�<�����AEw?�'B�� ��� _n�u��V�Y�5s�K���ޜ�12�����0�
�����$FM��E�C�a����{J�L�����3�KI)� ��C�      H     x��\Y�#7��9��Imu��`~�t�H�	�I���Z-˔�2�h�HJ\�ҠàA@ax�x�����ן�?��߆�A��������Y��#�����A���׏�����Wo�4 Eh���??����c�^�M�d�mΊ��NZ��F����h)b�^��6����������?�64��8�{�wK����^!1�Ac|�����ϯ�����Vg�������ř6�a�/\q)Yx�5nA>Z�m�k�2N�M��KPz5nv)�V�g�m���p<��A�v"��z�u=3P:1��}�t�y�X:�EЦcJ���n	ِ�� �s�W�!-�hBb��m@�\1Ew���G5�
Ϥ�	���wq跞)���=�-���S�mca��Mly�ǝA����_�Z�/�k�i�B��(�|�4�Z�-��6�0���:��Sd3'�GT����z�K��6>E[7�<H}����!��(X!�K9ㆍq�׊�p�h���������F��?�X�q��*ۡe�:iT��db����1�%[.n/��PKM���[*�c���Z�A�Ey[�p�s��PU�}��}�Jc�(����0�hǓ�o��ķ;��/ͱ0��4��Q�d_�D�3���pE��ߧG�V��z�zFz�-Lh�̾S���u�#�H��#)������{2��d\���Z3P��ib깘��Ysv�t}L L���B4���CHg�n��(��S�C����5N�v���aؓY����C���&T�QF��9�<�g�0)S����oĄ����܊�xNG�/���r\�u9LXp�TO�q{Y���mj#ϻ����>�h�#�+�X��q���A�`@�縉w&"�"Cb�F�C�@�z�Do��[(�`��
S�,�\�/��5g�qzH�)T��t���Lz�6Z���ʣ�q��22��{�cȐկq8��� z�^ډ�kS�ٝ��d��1�����^ػ�8�<cIJmꓗ�8Š��"��b�C���^��E
���A>gym�b�̨�p��d�r��T�ܠ��V=�nŴr��҈�%�;�h�,;�n�L�E �t�%Tq:��$~qK���k���۔K51��N;
l�R����\��{�R%�����X�;MK��N5��.(fi*�k�1!ޜd�Jyn&h�R�bu�)��]�#`�J�G�i^ɑaR�yL��f��;�]5~~( �Q�H��F�|W�3S*.���QųBFn#����P�aRj��h.��2<�d��P�5�M+�]��/�U�%� ���jyбEV���[�t���4��s$�B�?L;k����	Uu1�Cs�� �����	^Bd��R�^*��h���-<��>ҖY�,�y���Nw���$���g��i��k����n�����P�D&�|ɏHL�q�-q�z:�"J\�M���!W�W*8��ܨ��S����R�iJ
dքV�v_�T��+�t5Ꝋq/h�c��׿����0���We�c6ȯ��]_j�4k��>���c��Eǟ��JFMa����_.��(|�}�<�>��"V�"ב͗^kGn��Co�<s�N~��i�(��9I���|�w@Ll�{ܼ��-G���X���g�8�\�Cݞu�?�A�aH�g���H�Ӵf�	�W�;�y<�W����Kn6�90Fȗ���{�-�!�轚��:��d�)q�=m��m��3湶��WY��L�;́ǐX|�x����Z�n�P�h����d��Q]l�p٥����4�g6��4���Cf�Ke��d���U����ȍY�at��=1����Ȱ�tf�-;��G�:F�[�����cW�����c�a�,��DG�9n�eڣ�����^a�眎�KD��fRU(���tEa�J،�71�O����64|�m���_���&�cT7�\����u�޺��u0m؛6�gx�$x���L'����[J�bL(K�֡����+�] _��0�3\�qI�OU��?_>}��?�RM      J   �  x��YYo�6~��
>�h�"%�K�M�袛E���W�l$� �����1#�\�Y�983�.�?p���\:	�3H��b�]?@���2-|��s�򫤸�J�&o��MQ]���$�u�A�H�WVAIx1�BxoY��v�N9�;&ɘn������w�|A�56��'�7�Cv��Q�o#�ֱg�a�9��-���0��w��S��=_C���N1�W������Y$��f�-���,��L�[r�/��9�_���H�Wq�ۈ&y�&e/��������F�[=����_�;�"R�
�W���� ��hбzc�n�Xrfsi��<R�|���^�>(\��Ȧ�O^k}�-5[h�$͜}~f;ɲ�̃_醏::�ñ��,"uN���\"��e������&!e���.�",�n�^F
j�pk��[���P�z��Y�yf�	����e�8ex�Q�>�q��F�9��	�IH�P���Wu˞}J�,&LrN�g���DB&�����QxvE6��v�}�c�	k�(8�k�6��|�s+d���h��-ʮK���`��V6���/�����%�U#;g�%�})Xn��4��i�z=UG�e[����)JJ��cٕ��b���\�U�eb!U�P�&�O���(��$�2����Q!H;K@N��>ň��^��Կ}�H���86uGȉ(?�s�@����Ş����G���7;ø�и`Nl	�dh��qe:4.�;�lh\�po\9��sҸr�2�;¡��8�z.��`��s!½q<ϿL�Pa�M*^d��F6j�<Z֢�A�[뛤�􌉈mw8� �BZXX	��ځ,���F���!\�=#��}µx�A�D�� �#��Fi�U�Φ��	���b@�4M|���Z��T�����xyD_��W��C�����z(���R��T�r|��(��$��	i�i���KcV.�^cYߋU�+��}��U����}P����;<
j��V��ޔ���ċ��n4YP;?|mZj���$�֒��z�H������/H)�ӌd�	ђ�����Ie�'��f��J��������G��O3�;�ƍ�"�ʐEѮ�g�H�N�"�3�D��O
��C¹߈�'��Î9�k��j4��)�pӠ4$t���1��Q��B�)�Ѱ����4���&>��5�|� ��\�E`�
	��8a񫫂��#�u�>����Q�+f��?�<T&C���yl�0kDQU'�u��WvF]Etx��TP����k�
�x�-�g�U��n%�r���.,���>�H��I��_�4sv��5����2��2����	��Wp
������,�r]6��{̐�ѽ�8�N��GO���՚4�L��T��G!��s�8�G!q���[�]9c�.'�t�5s��Q��lR?M��)�����5�$���� +��#�e���56�?]_\\���      L   �  x��W�m1��S�>�,ʲ�ԙ �#dH�4��$S$#����kF='���b��|�|ܾ����@��5�Ӆ��ˆڄ�C(�P�ψ�b��nU��j�����@\��v�Q].XU���E2tƨ�R�j�c�cϪRPl�NJ��`	�/x��)Q���]�&��د��E�K�.{o��/���z�+] u�m�.̤���\f$��W+.3@�j_b�$����*��xl�ȖI���j!����
�r5Hj�m��f���g�j��YIC���� ����§�E�,���V��؛��c���ul�*|�d��WR,B��DK;���ݠ��-�*>p���HD�*[�1i^)eHۼf��J[d�xE����P��R�J�<!Bɪҍ�P����T>�+��R�(��o�ڋ�֮�t6-�lmǼ��U�F����B�c��n���8����O�� ���.Yj�q���/g�*�u��x<?�>3Q      N   �  x����N1���SУC�b�Zz���CWpH�A�b]�M��Ov�3NF3jC�]�h����y�޾>n��F}�ˉ�i�3�����s���8f4I,�L0er���Y�2�N�Z�azaN3
�L���6ROf'��Q�&S0L-L�Ff�����/�L�Bz��}�h��D��y�Y��7'�<�fa"��慉�:��=��!L)L���V����}>��9��s�YZ%�H��er�։V,�}u@�9��'Ě��G&d��8��FVl��:*Q�����u�yO��,͝��Xr.�D\C�gab�KV���QY���r]���OwD�jQ|��������{�%�y�,ބ�'{aB�^f�!�ً�&g��Ȓ��`
[9O�.���Xϸ�yQȳø��Y���̜?�8L�k�&dǍ��,�s�s�!��`��������z����(3���d������0!��0!����
.L�7C
�F��l��{�      P      x������ � �      R   �   x����!Ek3E��N��pC�ԙ �+V8
"�I$xz� �	=�A�B��Xt��o��(�[�3')��-)��Y�b�G+�~&�I1�.�mӭ�I������8\_�I/w��X���4���}O)� �NK      T   �  x���ͮ�(���Ut?j��`ȵ��[�4�����v�Ӑ�B�aw��<��k2�"����s�_����;�OW��?���1-)���R	B�{�<F�}ZfZ�b��K�ݳw�hy�V�s����m���x�ޏ��]f�$�#C4(M�&q��]�7(�KO�OHW�6y�W�
��`A`~V2�h�ĸx��������8W�፳���h..+��-6i�8@���bD�y�˵:WV�V���;K1�;�̟.�������6n�\~p��WI)Qq��<��V�K��ymHD��=w3[�s�n�n�}�o��,v`�,���v\å6n�R�%\��e΃~H��%R5W��|7�Z�a�:YW٠U�~�=��AX0x�R�q|,�]\�����$l�һ�yl���	��UY�>)OM�	�B�p(��-V|@X�_�̐��ВҬ���`Zx &� 	λ����SN6$=|X������zQ�Cd�Y���Y��ѭ./�Ǌv����/��ȫ	��Hd��Rp�	-���= WDiB8�,�Rܶ����� 4i�D)2��߹�8�i?���5v�	�\>�T[�pZ��n�G�#���'`\p#�r,r��y��RC�] 4����ڄ�Mt��1��i8�/�l�Ħ���ڊc턖D���Is��qA+:��k�6���`*Yq�n��`��;M¥�X�C���7WEs�~m�2J����{�q�s�*���2�гh�8.���U���>7�­M���@T%���Z�Uˡ+�H]5��`=VC"u����{4�R�F(Gft]#��>0I`���K��̏��M����BϢ�In���!K����9>żo8���8�8������wj���}�һ�\#��x�s�iΕ$�u.;]�ʸ$�ύ���q����A"��\:�>��< g�s�DA�8��J�_4��<X�q1��=H۱����q��^�9�w����̬�c WI���;���Yw�0	�ؼ�C�+�DY+���Ln4��*	M����$�� G�Bcu�R�LIpYqq�&if�}�I�w�^�a�u�K��$����RʪI�P�rK��b�]W������ƱW��j*P�`^`^a�S��ڰ��*	�A7ҵQ��|�w��/9w=����������Hq�����8�:ڸ��$Ln��
.Hl�1pD��⯆�@S�F��7Q�ݬ�9�kv���C��a%�ԗ�ϴ=k�r�J"I���}��B�䵒v��\M�[�ER��&�1,�,�$K�i8$ʴ@B*(�5��u��伽��R�E�\+��л�2-V�/�������T���.{,�$��6n������4�G��]k��&���%E�8ʑ�I�6�)4P=W)8��uh�42�ՅT�pWi�ɹ9	�w�U�96�F]����˽\?�l�%vA���y��U�4��s�4��Ӗ,�ݺKZ�j���A��+t��h�����$$�t)��Gt��T�v��|Ϩ5T�ʑ��_g���ѴZ�\����崙$d�A�Vg��pg&��Î#�\�1-L�J$��4��QIc��J�N�|��mf�K_~��:�Әɬ�|2�v�2���z۽��Vq��']��Q����[b��!M+ɗ����,�J�UIj�%�w��� �?�ܖ7���E���ݤ�o�X9�(CI�X�^2�=�j^����^zrF�I��P��<zM*��U_���e[�z��F0ɾ�������WI[� �ޝ���5�����^�W2�ࣲer΀��Y��[�香�V�;�c��F��>СwW=j]B�~-��]ވf����kM�_����}����`�O�;��
�Y��{7�t��omc�j��W�Jw��$`��I����������>��eJc��h@�7�������%�a�&��oi����7F��D?���􁄛�Q�F8�-l{^�x��/"�o��u�Qfs��$��\����s      V   %  x��ZKn�:\sN��C����9DN�M��E6� ��?M���v�U-qʅ�U]�&�KN�$����t�����������x$NB\>S�,���/�?�l����M�́����%=~��?��,a�G�^8�����|YD����u�$�&k��m�$V_Rg�9y��	���,ަT{W�-H��+�7�?��$��%��`s����� �v���I[5)��� d�yV[*� ���������*�|��o��Ժ*�1-őˉ<�g��w����0y�Y]j_�+��3[���R��-,D'�6�;�2B��2B%�#u�-��궄�)h����y2W0����DΘ�h^�& e#h�0���)��g$~/rz�eBAu����̜DO���f=zE���%J����j�������"m[$�RG��}A�\�k�?��� �`�Q�AC�P4��vÜ7EY)K�P�XA��Td�їå��ߢ�!�#saJ�T:~z���U#H�d?����G���8Q��+�}�<�u�����}�.��os�jT[zܿ�����iO���S=9t9���5��s���/p��p<r��gR������Eɇn��c<��Z�X����%!`���`���-q�v����^��M@(Ǌʶ�`~kh���ImyD�!���n��W�G���N)�J/QqP�E�4�s�l��=2�6��������[	�u�Eb��A���č�Tb�_ћ�aa�����V׊��|p����9�Y�E���P)2	�(G��[%2G���#2*H�x�
�i<At�x�[��μr|�n17�P��=��Mǭ��CD�o�2��}/���TS��[��Q������=��\a���[�b5�eL�#�\�՚��j���>�p^+���؄Wx���_��~��~�	�z�ޒ�5q�A�\O�m�c��]�5�!7�1�A1��F؋Ҙa/f�9��J	����:�[�RB�������ۮ����a,-���
6� �*��šta=$� �����*�=��t��� �5�4      X   P  x��\Y�%��������C-�+�����F��a����&�����F�j��ERť�/+^\�׷��~|��ǯ�x��=����������O!>�]�_�~{e��Xo��������^������M������/\J�@�����_���P�M;W��)�k���6�?Rp��Ų�X`��ח���/�p~
��o�g���M|�3 ���+Bk�₿��#�U��-J/B�Ł _ �`mx�^>�%?@}r����Ï5o�t��.%��sbhZB
�6�	�>����ď�+Uz%!�A`��Y�ı/�8x'8y&3m��	����
UC� N��cF�1���Nȱq9��� E(=e\?�' �ӄ^��Kh�<"ʘ�_[xл�pKY�P�9�ޡ�e6d��a�!CX�_\�����2��}
��]���f"�U|	���}	+YD�2���Ĵ��
���r�CQP$	CE&(:B�¨Pi`�Q��ya'�ሀD�b�ءÉq3a,�c�E�E��e
"A��("�(�
cV��i,�F��Lc#�.b��8����`<��E�w�8Q/� ֫Ci^�Ч�H�Z%���u��?��rQ|��--@�.u�`��A��7�hqXE�}5�ʨe�;$5�e�R�!*\c���o`���bL�:����a.�r JW������S[�M7=10׼t�cM`���&�â���ya؄o2�@.%�GmD��`$�)�뤙���K7;&8+^��3	���5���Q�E�7s.�E�����R�E&�Y�qb�I�Ky���PT[+�����Z1�5F�����i	FX�W��w(:B����W�#eJb��cg�ADa�HPΨ⧜�&��쬹z�K����5���=|b���9vߓ��~��S {jby�w�H��u�h��0�559��vᙬs������w��cщم����Q���]ո� *n��7Jy��S�*�5��C}" u
}�C�)�<���)m���iB�(q�
ъN^�t^i�����H���a�QA���*+�c����y%
���+�&�g��P8�����
�$EDQ�J�N}p��+vn&����'3�-J��Ei-ڬ�?2�[9��w�o��ZL�?�[o�d;Dv0�&{"��"�"u(4".A��Γ�)�_��[D�8�^����-7�v"��E���C�������.0�*Ih<�\���R����S��o�V�la�Lf�`Mn�HXn�X�A�v�����u���6n&k��2N�Y�Г���������h��
8y$f��)�g�7 a�@�C ��;? a�@��ձ�b�#��J�8!5��0i�AӘ�i�s�**&������OW��A8�P��"�8gQ��lF0��껆�b�G$��7���f.}���h#ްG?A�,Tx'�kC 7���0�v�:�zU7tќ���ثj�t�;�I�;�]�`X�b��;SW��/���1"V�U�pRN�e*�{���nާc�7>)Oh���D��L�rAT����L�� BO��H�z�*�R��T���߮�
��W��`芥�QN��u��;�b�}QUJ�Etc&8:�t���'R��w��M@DP��� �X9��&�u����<v�s��>�.{� Y��F��g0L'��QW��GU��NjF,2A�k�VB��w9�b�F+��
��ARL7�Uj�oi5�A7,T��Q��6��7j�Z`|*i�=���ހ���*�=�@�����FƧXԌ�z@.��k�Co��믶��p}���n����Y�s������T-{�e�{�d�@�����{Y�� cߒ@V^�ԨU#U��Zw��Z`�QN0���ґN�JC�F�:]$-��,�ʉ8JD�#=t@�[m&�CF��X Ġ53`Ȩ9�rI��6ܼ̅��)�Sf?���b�+ʷ�_�@�ښ�i�]:��S��#� ��tZn���м��)���!���g(D��:N��p����{@���+*\�5��� \��������f���.J�]�>~��.�HwT���ڱ��B����8x@br}�=�D/ ���A���]�-VҿD�K}�`}]n6����!c�%pwq�&c
Q̽Ȅ�ı/ew��Wi��`{Z��e��iz�8ˑ�'Ƿ��η!BE�6���ؙ�s�����ͼ�TR/̓��Z�"��!���d�%v���*M��V*N�D4]�\�#mw%3v@�᝔�p�~5:uR��঩H�YI�p(�f��`�\$�lZ�Y�o&���(��PT���|T�����^V�Z�D���*<��΁6ي��l/���������&�@)��D�H��"Ϯ K��\$\���u���`�Vi�wdG�^������Sh7~T���K�dC�3�G�记�c���0�Wy%3����`�s�Z;��ێQ!Ю�}� j� Z��P����/CX
�!��W���-������F
UC�zӣS�����O9�$�#,����y�\�-�1U�:1dP��g���r<����ʽ�4��N=+��%�@��CO��a}�{P�ZW�N��@'�%��"{������7r�3��_��Q�;?��i �_LB�gJ=����;�Q�J�[i�f�)u�q�y�I��y=��Вla�����g"���%��O{���U��`#��2�4��T���@�� °:�dP"��\ޙ�N�T-d�O�D�AA�?�4E��@'t@����Q�H*(�*&��d��@� �j�0��6S��$�� @)ܤW�=љ�3>��^������}b�����`*z��"]�?�t�p�E�t����8]�\8��ٯ��5C�[m	2W�+'���H�� �����U�(ESa�:e�^b�]�}�G�]:����B��W�M�k'��P��٧�7P��ñ��C���e gӶ��h8 ��{z��t��H��^��"qo�9%.ena놌�>Ή�+��2�˒��h��V�馓�����m4ϵ{�6�6��:���,��l�֕���?�(�cv�C<�O�*W�T��G<���Ep \�!7��N��(D2��j.9����/_���c�      Z   >   x�3�4�.HLNUH�I��T�L��O��L��K�,����9%��y�E@6P Ə+F��� cc      \   P   x�32�,I-.��4�4��L*�L��L��+I��K-���c�8MA$����22�k21���E�q6��h�$N�9��=... �);w      ^   L   x�3�4��4N#�? H��qq�@�M���9�Laʍ!F���&�F�
�VFV&�zf���e�b���� F^�      `     x���Qn� ���S�j�!z�JS�5jG������Pi�D����?�m����o���DCxXP���=�x��04��:{��n����jA��`o�Wm�R �-�b	I�`�V�#lzeD�X��k���#����	E�D�Ֆ�-�����R�7�U�Ęn�����u鯁�<�a�� �(biDvt#�1-GU�d�؊�4MQ4�DKY*ҺH��Q�hv$1I�8��fj@CwH��I.�m�g��8wљ�����<�;�MӼ Ns�      r   w   x�u�1!F�9`�?0Lo<�[nc��fo�6&Rо�|��v;������g�K��<b6���:�$�, ^�s�i]u��P�HD�ZΙ�ɪ�N�� �D�k�\y���3}q�9�      t      x�3�4���,-�c ��"�=... jS      v   �   x�u���0E��+�{}�V誣q0qc��)5 U_ qPaxyɹɹ�H��O�����:�ӻ�����sT���2�G\i�i!AI�Ʃ ��>���7]m�˚P�:h�P��B�6����>D�����8MI��Ƶ��g��E��N��*��8�D~�7�%Wgo�l��Ʋ�	�=�gP9e��jD�I�J�Ls	<I�8-�R�jm�      x      x������ � �      z      x������ � �      |      x������ � �      ~      x������ � �      p   &   x�3�tw	.)J,IM��4��4�L��"�=... �+�      b   �   x�}�;�0D��)�G ��p���i�����D�`�-V��O3���yBX���H#X�s��y	~�X������H�,{ekm�]�+���˶fc���ʎ���QT6`���5�ik�Թ�@Ѧ�9������er!�>jՕ�;"A:9sBs��P��H��h&Y�      d   �  x��X�n"�������Gv��+�V�i'�&�a��}�SN���E�*�mWwUG�L6/��Z���{����Bzq(�4�˖�~;>n�P���cARY!� ����ƕ�C��
W3|ZJ/�Hh��09��͓h)p�ֺ�b�x��5쏗g��W�VRV�nf��T>��҉�9
�LI� dr���3S]|���pw�����zX?>���=���R��Zi��7\I�PV��Ӓ���[�<([�"���,[��R�2�*O����ٍ���+�����蠝��=㠍��"�hEa�Y�ɸ�$#��d4��i|N��v�U�>��Ү�]);���p7ç�&rqZ8[I��V\�vFK縙��㓾�:�$���#��N�8�b�֔, � �Ey11	�4������U�B�����J[ce!y4Br8L΢�R��I����q���}UF�}U'�֚Y	4UW&*� 
&Z�!J��}͚�� ��o�>-�d�J�eFEE��Ѕ�9d3��˪|;H	J��-y"�Q���ȱ�l�6H���q�y����x���e����� �J����뎗3���l���H��M��=��t��ӥ,��N?��������
�w�&�	�q�6�.O)��k�lvi��q�w�9w��'�����2"R�}�y�x����1��mʸM���=nߞy��\s=|(/|܏/<��VAg8x{7��8�ZvE��q�$I��I@�-dr��H�qz���qǴ���f����'g'�����Ҫ��$$YȧO�@��k�S՚�����o|����¼_Us�A�E��!Vs���ڍ�
*�}39�l��W�S��~ُJ�����*:���`F�KUZ>H5�A֪K��)U�$)�)fga�0���}M7v��h�nf���-x�M�5N`�HaM�**���������e�v�ô~��9����6F_�j�OK�"�l�Oi��2ᮬ��i̎1k���i�r�'���0��@�t;`�8	�K>��H���p�kH�r\|?n
���4ף�K������K�k��������U
�b�&Ԇ�&����C�Mi��GX8=Q���1t�_���r�}^F߭�F�Og��e��Q\<o�#�1���M�ktP�t������.x�@�4 .���D�T��H��3T+�+�g��i�[E�1CμF��[��i������Mَǹ�����ݸA�x��&�I�`�Z"�rTA��Y15�wx����ƹ�J�����Vb)�s�VĆ�4�lh�7"䗿��y�~)Θ�1|ƧeT\�+�C���0�"�@֊�,�6K	����p�AX���B�{�!�C�N&��i�gj����Cwq�&�=���>� � ਁb���O���呇�}^B�/�O�d�j}�g�//3�
���
k�^a�-��_�?�m��0Hc	Y#���۠QI�$|Jޗ�8aEH�1�~:��>�'/Q��Ի�(e��>-�u�γ�u=>c�+?�G���r(_��d}���?� ˺�:q����$��Y��x�b���ːr���Ðu��x��߼O1���b=N6-���'���}͛o1����m���Ҭ�ǔ�W���Ӳ���$�Õ~���\�99�r	V���y����`p;`�a4[뛫Ҩ)"�1Z�"�R���>�@dt�B*pts�|ZVc�k�{�Ì�H�Y�mO���--~wi����7�6����w}����.8�\`�k����X𐚳`����V�����N�0��3�	aL�p���R5rQ�A����Ċ���5�L�+���7|Zr�
�DIH&8�(R`�C���ժD�=L�ݣ�s`6�h<ZK�U��i��/�k\� 9�9l!�)��]�_����2X��~w§e���Z ��� ��D6"��6`��h��nﯡ��$�CC;��i��l}�u˃�y�ˠ��j���-I��̜��@wF�wBV�h�(�(�{{��c�h�*����5Ke#3���#V06�����5�SK0COl1r�tJe�9�]Y��+@���bXT��B��W,���n�
T�MD�ظ��"V�Mz����Ȍ^��A���PT�������,�{�Q�q����FW�ς���&rB���2�P�gs�qC������������A�      e   �  x��YisG��\��u#�ຏ��H��c���ZZ{예�:	Gs����W� %R�L�ݙuu��,0&��:SVx�J�B���fg����ZIa�o"	��˥�{l`5�������E�w�o�RҪPt��%IU���%�)x_���q2I��XY��;ݓO��!墽U��+��������̶╵���QU� /��aU�?#.g���0;����r�����p
77�޽�L�j��"R%����B��H-"發��6���qwu8;��YL�e���my\�\��BS�6�)Ic�j͹F/,yY�eK~Y��z?nN��CC��W}��o�g�L�:]3UAF�uT�TE��Ƞ�o!�p��]�O^����+���z<,���3j��ք���8�j���D���H�����atgc1ݟO^z���i�a�-�����2��D�/�f&���N��i
9,��b{����0Fr=)��SԷ`�RH�lp����)�p��n6�If���ܞR?��ܨ�@[F�
�F-��+/�%�'��N�����BXN��0-�	�#WH_꬗m�R�+Q�o�����?\���j���b>ߋ�TIգט�:$��U1E��N����c����nvV�CY^�\���	#<����V��ʰ<���ab�7�p�'%���4;�ٹ>�S�]�/wa�=O�$�c���EB�6F�A�N�d\���!��;�j}��f-^��O8����ZWUF%dԖ
GqǍ$o��ňk׮���N��q���ದ1�a�Z�2,yw}�_�_on���fs�n����"sƒ��a��S�j�I�*�$�fK~��ڵ���'�UNY*8RU����RS�
��J%��ܖ��w������!|��=6-���w�H
����mA��h�,,�\��{���8�3��Hބ���y�7�t�l	�Yx�U�D��H�/���ĕ��4�W{�cYf���E�=��|ь��Zh�C���\	�E�ݗ݆��ɳ�M���ic#/�6�֠�i4��*�3V��mj�ѽY�ɻR.v��L	�]�3d��|������j������g�kQ�����N�e�F`�4m˟�)��r@����K����p<��vQ�?��r$���M��C���I��#�3 �]`X��0�h�H6Рd�
�9��������l�x��gS�!+�� �B��v���슲��7��x 3��3g�kv�U~�We�p)�X�S� �()������{w�8�/^w�ƃ1�s}����R�_��#��A�K`Y���`,yw(�����8��d�^���Oz���h��*�^UcR�.)�9
���	��a�Zb�2U��qMn�94���6�<���I9PN�H80�

$ �nD�c���I�X�J�z�E;�ݣ�1��n��ν"\���!�Jc-�d�@
�ÀC�/||�f����AJ̀�3�ft�=�&[�h�뒜�|7�����q�.�b6�G�()	_}t�f�	nq��X��{�K�ȷu3�d,p}ޗw$$�:@Ř����E'��[����%������x;�]o��v�.>8����	zCP]Kj>svVBD���#�O��)�N����G������!�A�F�[�M���L2F7'���jk�)t���g	�N�x����L �I��1g���H*� �'oj"/��C��G{q����b˭��J0z�ȃ� �	ĉ�\�{d�z$/�>��?���=��X^Mz��3�s�Pԁ��[�D w0L�R�?ggF����Ɩ�=�D�����1�B߿Z��.��vn�>j�Ѣ	�#l����`�cF�BwP�@@D��sq�D���:5D�����㦺=���`��F��A� ���"Z�R-A��X���[�p�2\��g�o#<n��m'���汮�y?-�,�M�g�A"�Mm�*�g���T9Eޮ7=y{jUL3����\�����D���ჩ�k(z�SdY��x�a���
T�,PȅX��Y�ʍEA���x��>��r;9��Y��uH�?��_F�X�,��H��h4�NH�ʒ�\�?�ʾ���]���.��8�~q�"U+��C@	������Z�ᡰ
�D��l���M���Na�ܖ��Z�	��h��@�;T����5�s��-�����oC����훷�����a�P�,cm(f�P�Ӡ*
y'���q�E��2�\55P�l;V�(e
�1 �������@^��#9�����������*?.��0��oE�t�
Hv�P�9�4��� ���lu�:�Jlζ�=ݢvNR���J�:I�0��D] ����t�I�P��N7;���q��v�O\B�p�ht.���>N�6��1İ���n���s�!텇��&���L+��J�Y�S�%g�m���uO^������>��E=�=K��1�t�g#�AK:��F�\sb��!�cʉ#{,?G�A�X����d�.�eD��FC��[d�dv�#��]�á�f�F[hfM�@�RH2d�"^\��6���Yl6",�oY����M�p�� j@��E�,
@ QV�����An��fk��[�l?����h�9��M R�1Hh�+֓_{$�/%��C龟�v\o���G��]Y��#� �,J0����4�$ą�8�#ȟW������ꢟ�{��_�a3���?�^�V�0ܕ�!�����L�h�|<(��T( �8y���/�p���v�����}�8���If[�� ؤ�3 �h�c�V���Z�.Ow����U��n{L�.�%W��Va�]�V�b}���ߚ�(�����O}��9�cY��0�w��[4,�8�^b����C�(�%F���'r� ��w[�����>l'�;�W��r����#��Ra��D;���?GE#��2�q-�����f�*��p��7Nv^b�g��nL�(�1^&�ʶ��7:qS6d����;ߗ�[��&��ɡ���:R��vb�!2�s:By�g�F�f-7�����X�2|)���Fi�B$�(�`�6d�kg/BD�h���iPT'	�\2��/"�����&��f�$�tF��Ę���K6Q�	�n���f;���Ǘ!�.��3�Vf����Q���3R�(0"��d��	��
�h���`-ø��ݸ(�=��Baфnn�K�5�ЁG��P����(D>�~?�ݣ�j.�!����;#|;{U�\�B�D�
/k!�4�_4D�����N�T�.�'�B3�MM�Բ]��C�`���=����>_�G	!��8E��";kPak��"'�{��^�+���|��V�Gn���EM��k�>[C�a��i=۶8o�	��v��x��]y@�cO{�ڎ��3H�YQْs(Bu�e�aȐ�����&'���{���2��w�׊���R��z)z�)l��B��qOn�FwC��zd�se�vW0<�.�JT.�c:�XDR���0�%/ɻ�%��X�pZ`�tW���c����c�=H�q�j4��:��{?������]������S)�S��U
Y�w_x��e���˥�"��A�u�
hz0*��A�v����вc�/X���u�U�?A� ��a�H��^�������/�B�-F��o�z:ϛ���^�Ŗaj��͏�3I+#�Q鶶U���	 �u��By�������ѳ����9�@���x�!T�n�t�F������&��u��x6>�Z�hƫ�>�ZE�9�<�H��U���V���&Z
����rw�	�ճ�ro8��$/�k�)
�X��
�R*)�LF�0��n���:�}��]���/���K�P�QY�9o'FP�ޢ�b��c@�zp&�vl�ݼ������9@�X��O}�h��z�Xnj ���ѷ7	R��B����D���>\���|���z�p��3{A�V�U�U��ќ��K��v������pv��['w9u�H�/H+�JjG<u�7
�����E��V�X|��W��k��      f   t  x�-�I�)E��]p !������*o��*A�Sʩ�c:r��{���ݼh���m��n���mz�m����R�B�4H��}H��pl��ؽ��s�վ�ˡגt�}ꌦMcO��Z{:��ٟ��+�G��ۚ�8��X��j-��%$�w������F��o��uuo�y�W��:�v�wq�M�8����u�����yȽ���Ɠ+#����Ọ�K^v�~-�-�5_[�4����fY>Z���A���ъ�h6n�%��[��{g�')L񤹴������=3y�nV��|"� 纝#s�5��fL7M�)��	D�d��d��6o����~��Igա-1��5BP}���ݛ�U���k�����ڂ
���&Mj�� �|�rc޶K��B{t%�I+����i��޹�f,m[J|�4m�Q�,���%2���F��}-�X�]�����N��/�ɛ���g���8�������9}�e�OS�C����o{`s�-�QJ��j��R}�Y�I���1�^�U��"���TCC�z��E�;�܂zd����_�O}���Ek�Y�0JN�
��}��6�7v EW���g2�n����&�ćs�ϟz�~ﱬ�e���5ԶR��#�:`�
��̙]F�O=d�*Oc��jBW��y����������1FX|f��)*|��s;���i��Zc��to�#�J���o���|9�\����7�x*s8�=x����(_��g-���O�%1yF�MpRK�ܿ�����s�2p�͹H���)��hyS9Q_Vc���"�~ۦ:�"^R�����J?$����ڮ'��U���LV��s&�~�ᖚY�m���58y�P��9G��[l��Pe`��e��Q��8����я���-��-غe$P���f,<�O�u����+����������Ȩ��g)��p;n�ȼŉ@d�ƨ���3	��������$9>���Juj�sn��%֜��3�`���7�V�{�Ǚ�Z@�W�zH:&i'��,ܛ Y���B��|�0����Y	y��\#j�WXBN6rM^����s}VÕ9kJ+��t���#��"�[��/̓�S7śyj�����`��||�BK}I�e���7[�
�%Ֆ�L�C>���tx8����kgV�+)�ҵ���K�2�\^�Ϋ����_|.�V�[��P|��%~�:\q}EC���wzf"."F�E� E7%�-�^��[H~�Ks��BB
M��W,����@P�˫�YVi|xj����*�x���z!.XG��I��!�O_�����ʎ�O/p������V�l��Ap��x��%Nlz|�ս_�_!��vM�_�X)�������)�$\\��-8}�tr4�#)�_MA&��z)�������u�f~�ĿUBWS����एp�PG�)!K�i𲧃}D]�U\輸2�r�	�5�7�9�f^�H/����+%�q3q�W�s��"m��_�I�7�#d[�������x4.N�/b�R�!�H�~��#�#���Gegҵg�w�z�U��xlMЭ��y%���{��*���P�~k��}ӫ�ܲ�s?�� 7����gD�%��H������T6Ȳ=\rMH�N��#�V�y�s�+>�YM��3����;yd뭾�-�s��D�l\Vѩ�W1��;�M,���ݴvkGcʨ�.R!X+p��V�������~{�����|n���k��(AG���w���<b�}an��ʭy��^��v;r�1���|z�S� �(W�M��Q�U|QQ��P�E�F��{�R���a����=ܒ۞,^D��K"�;��ޅ%&+>j)�uy��cJ���<���uG�A����-l��*�J`cd5-o��5���IC$=     