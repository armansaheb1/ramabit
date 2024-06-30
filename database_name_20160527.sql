--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
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
-- Name: auctions_act; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_act (
    aucid integer NOT NULL,
    act integer NOT NULL
);


ALTER TABLE public.auctions_act OWNER TO ramabitc_ars;

--
-- Name: auctions_addamountreq; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_addamountreq (
    id integer NOT NULL,
    amount double precision NOT NULL,
    link character varying(1000),
    currency_id integer,
    user_id integer
);


ALTER TABLE public.auctions_addamountreq OWNER TO ramabitc_ars;

--
-- Name: auctions_addamountreq_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_addamountreq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_addamountreq_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_addamountreq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_addamountreq_id_seq OWNED BY auctions_addamountreq.id;


--
-- Name: auctions_adminverifybank; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_adminverifybank (
    id integer NOT NULL,
    bankimg character varying(100),
    bankc integer,
    action boolean NOT NULL,
    user_id integer
);


ALTER TABLE public.auctions_adminverifybank OWNER TO ramabitc_ars;

--
-- Name: auctions_adminverifybank_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_adminverifybank_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_adminverifybank_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_adminverifybank_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_adminverifybank_id_seq OWNED BY auctions_adminverifybank.id;


--
-- Name: auctions_adminverifymelli; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_adminverifymelli (
    id integer NOT NULL,
    melliimg character varying(100),
    mellic integer,
    action boolean NOT NULL,
    user_id integer
);


ALTER TABLE public.auctions_adminverifymelli OWNER TO ramabitc_ars;

--
-- Name: auctions_adminverifymelli_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_adminverifymelli_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_adminverifymelli_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_adminverifymelli_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_adminverifymelli_id_seq OWNED BY auctions_adminverifymelli.id;


--
-- Name: auctions_appsettings; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_appsettings (
    id integer NOT NULL,
    welcometitle character varying(100) NOT NULL,
    welcometext text NOT NULL
);


ALTER TABLE public.auctions_appsettings OWNER TO ramabitc_ars;

--
-- Name: auctions_appsettings_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_appsettings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_appsettings_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_appsettings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_appsettings_id_seq OWNED BY auctions_appsettings.id;


--
-- Name: auctions_askamountreq; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_askamountreq (
    id integer NOT NULL,
    amount double precision NOT NULL,
    link character varying(1000),
    currency_id integer,
    user_id integer
);


ALTER TABLE public.auctions_askamountreq OWNER TO ramabitc_ars;

--
-- Name: auctions_askamountreq_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_askamountreq_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_askamountreq_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_askamountreq_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_askamountreq_id_seq OWNED BY auctions_askamountreq.id;


--
-- Name: auctions_banner; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_banner (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    pic character varying(100) NOT NULL
);


ALTER TABLE public.auctions_banner OWNER TO ramabitc_ars;

--
-- Name: auctions_banner_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_banner_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_banner_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_banner_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_banner_id_seq OWNED BY auctions_banner.id;


--
-- Name: auctions_bazdid; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_bazdid (
    id integer NOT NULL,
    date date NOT NULL,
    count integer
);


ALTER TABLE public.auctions_bazdid OWNER TO ramabitc_ars;

--
-- Name: auctions_bazdid_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_bazdid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_bazdid_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_bazdid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_bazdid_id_seq OWNED BY auctions_bazdid.id;


--
-- Name: auctions_bid; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_bid (
    id integer NOT NULL,
    deposit double precision NOT NULL,
    option character varying(100),
    date_field date NOT NULL,
    plan_id integer,
    user_id integer
);


ALTER TABLE public.auctions_bid OWNER TO ramabitc_ars;

--
-- Name: auctions_bid_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_bid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_bid_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_bid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_bid_id_seq OWNED BY auctions_bid.id;


--
-- Name: auctions_blog; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_blog (
    id integer NOT NULL,
    date date NOT NULL,
    title character varying(100) NOT NULL,
    text character varying(10000) NOT NULL,
    pic character varying(100) NOT NULL
);


ALTER TABLE public.auctions_blog OWNER TO ramabitc_ars;

--
-- Name: auctions_blog_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_blog_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_blog_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_blog_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_blog_id_seq OWNED BY auctions_blog.id;


--
-- Name: auctions_cat; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_cat (
    name character varying(100) NOT NULL
);


ALTER TABLE public.auctions_cat OWNER TO ramabitc_ars;

--
-- Name: auctions_currencies; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_currencies (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    brand character varying(100),
    pic character varying(100),
    qr character varying(100),
    address character varying(1000),
    price double precision NOT NULL,
    align integer
);


ALTER TABLE public.auctions_currencies OWNER TO ramabitc_ars;

--
-- Name: auctions_currencies_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_currencies_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_currencies_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_currencies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_currencies_id_seq OWNED BY auctions_currencies.id;


--
-- Name: auctions_details; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_details (
    id integer NOT NULL,
    page character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.auctions_details OWNER TO ramabitc_ars;

--
-- Name: auctions_details_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_details_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_details_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_details_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_details_id_seq OWNED BY auctions_details.id;


--
-- Name: auctions_elan; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_elan (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    text character varying(1000) NOT NULL,
    pic character varying(100) NOT NULL
);


ALTER TABLE public.auctions_elan OWNER TO ramabitc_ars;

--
-- Name: auctions_elan_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_elan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_elan_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_elan_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_elan_id_seq OWNED BY auctions_elan.id;


--
-- Name: auctions_forget; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_forget (
    email character varying(200),
    key uuid NOT NULL
);


ALTER TABLE public.auctions_forget OWNER TO ramabitc_ars;

--
-- Name: auctions_general; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_general (
    id integer NOT NULL,
    title character varying(300) NOT NULL,
    banner_title character varying(100) NOT NULL,
    banner_text character varying(300) NOT NULL
);


ALTER TABLE public.auctions_general OWNER TO ramabitc_ars;

--
-- Name: auctions_general_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_general_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_general_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_general_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_general_id_seq OWNED BY auctions_general.id;


--
-- Name: auctions_job; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_job (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    text character varying(10000) NOT NULL,
    job character varying(10000),
    username character varying(100) NOT NULL,
    user_id integer
);


ALTER TABLE public.auctions_job OWNER TO ramabitc_ars;

--
-- Name: auctions_job_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_job_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_job_id_seq OWNED BY auctions_job.id;


--
-- Name: auctions_miners; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_miners (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    pic character varying(100) NOT NULL,
    des text NOT NULL,
    rate double precision,
    period character varying(100),
    price double precision NOT NULL,
    profit double precision NOT NULL,
    currency_id integer NOT NULL
);


ALTER TABLE public.auctions_miners OWNER TO ramabitc_ars;

--
-- Name: auctions_miners_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_miners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_miners_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_miners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_miners_id_seq OWNED BY auctions_miners.id;


--
-- Name: auctions_news; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_news (
    id integer NOT NULL,
    date date NOT NULL,
    title character varying(100) NOT NULL,
    text character varying(10000) NOT NULL,
    pic character varying(100) NOT NULL,
    place character varying(100) NOT NULL
);


ALTER TABLE public.auctions_news OWNER TO ramabitc_ars;

--
-- Name: auctions_news_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_news_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_news_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_news_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_news_id_seq OWNED BY auctions_news.id;


--
-- Name: auctions_notification; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_notification (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    text character varying(1000) NOT NULL,
    user_id integer,
    read boolean NOT NULL
);


ALTER TABLE public.auctions_notification OWNER TO ramabitc_ars;

--
-- Name: auctions_notification_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_notification_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_notification_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_notification_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_notification_id_seq OWNED BY auctions_notification.id;


--
-- Name: auctions_pages; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_pages (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    title character varying(100) NOT NULL,
    text text NOT NULL
);


ALTER TABLE public.auctions_pages OWNER TO ramabitc_ars;

--
-- Name: auctions_pages_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_pages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_pages_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_pages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_pages_id_seq OWNED BY auctions_pages.id;


--
-- Name: auctions_plans; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_plans (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    des text NOT NULL,
    percent double precision,
    mini double precision,
    maxi double precision,
    period character varying(100),
    currency_id integer
);


ALTER TABLE public.auctions_plans OWNER TO ramabitc_ars;

--
-- Name: auctions_plans_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_plans_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_plans_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_plans_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_plans_id_seq OWNED BY auctions_plans.id;


--
-- Name: auctions_post; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_post (
    id integer NOT NULL,
    date date NOT NULL,
    title character varying(100) NOT NULL,
    text character varying(10000) NOT NULL,
    pic character varying(100) NOT NULL,
    place character varying(100) NOT NULL,
    app boolean NOT NULL,
    index boolean NOT NULL
);


ALTER TABLE public.auctions_post OWNER TO ramabitc_ars;

--
-- Name: auctions_post_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_post_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_post_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_post_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_post_id_seq OWNED BY auctions_post.id;


--
-- Name: auctions_product; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_product (
    id integer NOT NULL,
    title character varying(100) NOT NULL,
    pic character varying(100) NOT NULL,
    des text NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.auctions_product OWNER TO ramabitc_ars;

--
-- Name: auctions_product_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_product_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_product_id_seq OWNED BY auctions_product.id;


--
-- Name: auctions_productorder; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_productorder (
    id integer NOT NULL,
    firs_name character varying(100) NOT NULL,
    last_name character varying(100) NOT NULL,
    address text NOT NULL,
    postal_code text NOT NULL
);


ALTER TABLE public.auctions_productorder OWNER TO ramabitc_ars;

--
-- Name: auctions_productorder_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_productorder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_productorder_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_productorder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_productorder_id_seq OWNED BY auctions_productorder.id;


--
-- Name: auctions_profitlist; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_profitlist (
    id integer NOT NULL,
    date date NOT NULL,
    invid integer,
    amount double precision NOT NULL,
    currency_id integer,
    plan_id integer,
    user_id integer
);


ALTER TABLE public.auctions_profitlist OWNER TO ramabitc_ars;

--
-- Name: auctions_profitlist_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_profitlist_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_profitlist_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_profitlist_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_profitlist_id_seq OWNED BY auctions_profitlist.id;


--
-- Name: auctions_rentedminer; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_rentedminer (
    id integer NOT NULL,
    start_date timestamp with time zone NOT NULL,
    last_check timestamp with time zone NOT NULL,
    paid double precision,
    done boolean NOT NULL,
    miner_id integer,
    user_id integer
);


ALTER TABLE public.auctions_rentedminer OWNER TO ramabitc_ars;

--
-- Name: auctions_rentedminer_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_rentedminer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_rentedminer_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_rentedminer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_rentedminer_id_seq OWNED BY auctions_rentedminer.id;


--
-- Name: auctions_settings; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_settings (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    address character varying(300) NOT NULL,
    tel character varying(100) NOT NULL,
    email character varying(100) NOT NULL,
    telegram character varying(300) NOT NULL,
    whatsapp character varying(300) NOT NULL,
    instagram character varying(300) NOT NULL,
    facebook character varying(300) NOT NULL,
    logo character varying(100),
    s1 double precision NOT NULL,
    s2 double precision NOT NULL,
    s3 double precision NOT NULL,
    s4 double precision NOT NULL
);


ALTER TABLE public.auctions_settings OWNER TO ramabitc_ars;

--
-- Name: auctions_settings_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_settings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_settings_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_settings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_settings_id_seq OWNED BY auctions_settings.id;


--
-- Name: auctions_subjects; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_subjects (
    id integer NOT NULL,
    date date NOT NULL,
    lastdate date NOT NULL,
    act integer,
    read boolean NOT NULL,
    title character varying(100) NOT NULL,
    aread boolean NOT NULL,
    user_id integer
);


ALTER TABLE public.auctions_subjects OWNER TO ramabitc_ars;

--
-- Name: auctions_subjects_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_subjects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_subjects_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_subjects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_subjects_id_seq OWNED BY auctions_subjects.id;


--
-- Name: auctions_tickets; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_tickets (
    id integer NOT NULL,
    date date NOT NULL,
    subid integer,
    text character varying(1000) NOT NULL,
    pic character varying(100),
    sender integer NOT NULL
);


ALTER TABLE public.auctions_tickets OWNER TO ramabitc_ars;

--
-- Name: auctions_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_tickets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_tickets_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_tickets_id_seq OWNED BY auctions_tickets.id;


--
-- Name: auctions_timer; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_timer (
    id integer NOT NULL,
    date timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.auctions_timer OWNER TO ramabitc_ars;

--
-- Name: auctions_timer_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_timer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_timer_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_timer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_timer_id_seq OWNED BY auctions_timer.id;


--
-- Name: auctions_transaction; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_transaction (
    id integer NOT NULL,
    date date NOT NULL,
    amount double precision NOT NULL,
    act integer,
    currency_id integer,
    user_id integer
);


ALTER TABLE public.auctions_transaction OWNER TO ramabitc_ars;

--
-- Name: auctions_transaction_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_transaction_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_transaction_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_transaction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_transaction_id_seq OWNED BY auctions_transaction.id;


--
-- Name: auctions_user; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    email character varying(254),
    is_staff boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    ref character varying(100) NOT NULL,
    username character varying(100),
    inv character varying(100),
    name character varying(100),
    lastname character varying(100),
    mobile character varying(100),
    is_active boolean NOT NULL,
    is_verified boolean NOT NULL
);


ALTER TABLE public.auctions_user OWNER TO ramabitc_ars;

--
-- Name: auctions_user_groups; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auctions_user_groups OWNER TO ramabitc_ars;

--
-- Name: auctions_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_user_groups_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_user_groups_id_seq OWNED BY auctions_user_groups.id;


--
-- Name: auctions_user_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_user_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_user_id_seq OWNED BY auctions_user.id;


--
-- Name: auctions_user_level1; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_user_level1 (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL
);


ALTER TABLE public.auctions_user_level1 OWNER TO ramabitc_ars;

--
-- Name: auctions_user_level1_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_user_level1_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_user_level1_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_user_level1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_user_level1_id_seq OWNED BY auctions_user_level1.id;


--
-- Name: auctions_user_level2; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_user_level2 (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL
);


ALTER TABLE public.auctions_user_level2 OWNER TO ramabitc_ars;

--
-- Name: auctions_user_level2_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_user_level2_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_user_level2_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_user_level2_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_user_level2_id_seq OWNED BY auctions_user_level2.id;


--
-- Name: auctions_user_level3; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_user_level3 (
    id integer NOT NULL,
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL
);


ALTER TABLE public.auctions_user_level3 OWNER TO ramabitc_ars;

--
-- Name: auctions_user_level3_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_user_level3_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_user_level3_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_user_level3_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_user_level3_id_seq OWNED BY auctions_user_level3.id;


--
-- Name: auctions_user_user_permissions; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auctions_user_user_permissions OWNER TO ramabitc_ars;

--
-- Name: auctions_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_user_user_permissions_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_user_user_permissions_id_seq OWNED BY auctions_user_user_permissions.id;


--
-- Name: auctions_verify; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_verify (
    id integer NOT NULL,
    mobilev boolean,
    mobilec integer,
    emailv boolean,
    emailc integer,
    melliv integer,
    bankv integer,
    user_id integer
);


ALTER TABLE public.auctions_verify OWNER TO ramabitc_ars;

--
-- Name: auctions_verify_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_verify_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_verify_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_verify_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_verify_id_seq OWNED BY auctions_verify.id;


--
-- Name: auctions_wallet; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auctions_wallet (
    id integer NOT NULL,
    amount double precision NOT NULL,
    currency_id integer,
    user_id integer
);


ALTER TABLE public.auctions_wallet OWNER TO ramabitc_ars;

--
-- Name: auctions_wallet_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auctions_wallet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auctions_wallet_id_seq OWNER TO ramabitc_ars;

--
-- Name: auctions_wallet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auctions_wallet_id_seq OWNED BY auctions_wallet.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO ramabitc_ars;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auth_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO ramabitc_ars;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auth_group_id_seq OWNED BY auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO ramabitc_ars;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO ramabitc_ars;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auth_group_permissions_id_seq OWNED BY auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO ramabitc_ars;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE auth_permission_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO ramabitc_ars;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE auth_permission_id_seq OWNED BY auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO ramabitc_ars;

--
-- Name: chat_chatroom; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE chat_chatroom (
    id bigint NOT NULL,
    date timestamp with time zone NOT NULL,
    last_update timestamp with time zone NOT NULL,
    read1 boolean NOT NULL,
    read2 boolean NOT NULL,
    unread1 integer NOT NULL,
    unread2 integer NOT NULL,
    user1_id bigint NOT NULL,
    user2_id bigint NOT NULL
);


ALTER TABLE public.chat_chatroom OWNER TO ramabitc_ars;

--
-- Name: chat_chatroom_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE chat_chatroom_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_chatroom_id_seq OWNER TO ramabitc_ars;

--
-- Name: chat_chatroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE chat_chatroom_id_seq OWNED BY chat_chatroom.id;


--
-- Name: chat_chatsession; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE chat_chatsession (
    id bigint NOT NULL,
    create_date timestamp with time zone NOT NULL,
    update_date timestamp with time zone NOT NULL,
    name character varying(100),
    username character varying(100),
    uri character varying(200) NOT NULL,
    owner_id bigint
);


ALTER TABLE public.chat_chatsession OWNER TO ramabitc_ars;

--
-- Name: chat_chatsession_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE chat_chatsession_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_chatsession_id_seq OWNER TO ramabitc_ars;

--
-- Name: chat_chatsession_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE chat_chatsession_id_seq OWNED BY chat_chatsession.id;


--
-- Name: chat_chatsessionmessage; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE chat_chatsessionmessage (
    id bigint NOT NULL,
    create_date timestamp with time zone NOT NULL,
    update_date timestamp with time zone NOT NULL,
    message text NOT NULL,
    seen boolean NOT NULL,
    aseen boolean NOT NULL,
    chat_session_id bigint NOT NULL,
    user_id bigint
);


ALTER TABLE public.chat_chatsessionmessage OWNER TO ramabitc_ars;

--
-- Name: chat_chatsessionmessage_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE chat_chatsessionmessage_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_chatsessionmessage_id_seq OWNER TO ramabitc_ars;

--
-- Name: chat_chatsessionmessage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE chat_chatsessionmessage_id_seq OWNED BY chat_chatsessionmessage.id;


--
-- Name: chat_chattext; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE chat_chattext (
    id bigint NOT NULL,
    text character varying(100) NOT NULL,
    date timestamp with time zone NOT NULL,
    room_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.chat_chattext OWNER TO ramabitc_ars;

--
-- Name: chat_chattext_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE chat_chattext_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_chattext_id_seq OWNER TO ramabitc_ars;

--
-- Name: chat_chattext_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE chat_chattext_id_seq OWNED BY chat_chattext.id;


--
-- Name: chat_chatuser; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE chat_chatuser (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    mobile character varying(100),
    email character varying(100)
);


ALTER TABLE public.chat_chatuser OWNER TO ramabitc_ars;

--
-- Name: chat_chatuser_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE chat_chatuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.chat_chatuser_id_seq OWNER TO ramabitc_ars;

--
-- Name: chat_chatuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE chat_chatuser_id_seq OWNED BY chat_chatuser.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO ramabitc_ars;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE django_admin_log_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO ramabitc_ars;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE django_admin_log_id_seq OWNED BY django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO ramabitc_ars;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE django_content_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO ramabitc_ars;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE django_content_type_id_seq OWNED BY django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO ramabitc_ars;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: ramabitc_ars
--

CREATE SEQUENCE django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO ramabitc_ars;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: ramabitc_ars
--

ALTER SEQUENCE django_migrations_id_seq OWNED BY django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE TABLE django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO ramabitc_ars;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_addamountreq ALTER COLUMN id SET DEFAULT nextval('auctions_addamountreq_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_adminverifybank ALTER COLUMN id SET DEFAULT nextval('auctions_adminverifybank_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_adminverifymelli ALTER COLUMN id SET DEFAULT nextval('auctions_adminverifymelli_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_appsettings ALTER COLUMN id SET DEFAULT nextval('auctions_appsettings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_askamountreq ALTER COLUMN id SET DEFAULT nextval('auctions_askamountreq_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_banner ALTER COLUMN id SET DEFAULT nextval('auctions_banner_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_bazdid ALTER COLUMN id SET DEFAULT nextval('auctions_bazdid_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_bid ALTER COLUMN id SET DEFAULT nextval('auctions_bid_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_blog ALTER COLUMN id SET DEFAULT nextval('auctions_blog_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_currencies ALTER COLUMN id SET DEFAULT nextval('auctions_currencies_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_details ALTER COLUMN id SET DEFAULT nextval('auctions_details_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_elan ALTER COLUMN id SET DEFAULT nextval('auctions_elan_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_general ALTER COLUMN id SET DEFAULT nextval('auctions_general_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_job ALTER COLUMN id SET DEFAULT nextval('auctions_job_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_miners ALTER COLUMN id SET DEFAULT nextval('auctions_miners_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_news ALTER COLUMN id SET DEFAULT nextval('auctions_news_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_notification ALTER COLUMN id SET DEFAULT nextval('auctions_notification_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_pages ALTER COLUMN id SET DEFAULT nextval('auctions_pages_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_plans ALTER COLUMN id SET DEFAULT nextval('auctions_plans_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_post ALTER COLUMN id SET DEFAULT nextval('auctions_post_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_product ALTER COLUMN id SET DEFAULT nextval('auctions_product_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_productorder ALTER COLUMN id SET DEFAULT nextval('auctions_productorder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_profitlist ALTER COLUMN id SET DEFAULT nextval('auctions_profitlist_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_rentedminer ALTER COLUMN id SET DEFAULT nextval('auctions_rentedminer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_settings ALTER COLUMN id SET DEFAULT nextval('auctions_settings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_subjects ALTER COLUMN id SET DEFAULT nextval('auctions_subjects_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_tickets ALTER COLUMN id SET DEFAULT nextval('auctions_tickets_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_timer ALTER COLUMN id SET DEFAULT nextval('auctions_timer_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_transaction ALTER COLUMN id SET DEFAULT nextval('auctions_transaction_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user ALTER COLUMN id SET DEFAULT nextval('auctions_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_groups ALTER COLUMN id SET DEFAULT nextval('auctions_user_groups_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_level1 ALTER COLUMN id SET DEFAULT nextval('auctions_user_level1_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_level2 ALTER COLUMN id SET DEFAULT nextval('auctions_user_level2_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_level3 ALTER COLUMN id SET DEFAULT nextval('auctions_user_level3_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('auctions_user_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_verify ALTER COLUMN id SET DEFAULT nextval('auctions_verify_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_wallet ALTER COLUMN id SET DEFAULT nextval('auctions_wallet_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auth_group ALTER COLUMN id SET DEFAULT nextval('auth_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('auth_group_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auth_permission ALTER COLUMN id SET DEFAULT nextval('auth_permission_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chatroom ALTER COLUMN id SET DEFAULT nextval('chat_chatroom_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chatsession ALTER COLUMN id SET DEFAULT nextval('chat_chatsession_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chatsessionmessage ALTER COLUMN id SET DEFAULT nextval('chat_chatsessionmessage_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chattext ALTER COLUMN id SET DEFAULT nextval('chat_chattext_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chatuser ALTER COLUMN id SET DEFAULT nextval('chat_chatuser_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY django_admin_log ALTER COLUMN id SET DEFAULT nextval('django_admin_log_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY django_content_type ALTER COLUMN id SET DEFAULT nextval('django_content_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY django_migrations ALTER COLUMN id SET DEFAULT nextval('django_migrations_id_seq'::regclass);


--
-- Data for Name: auctions_act; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_act (aucid, act) FROM stdin;
\.


--
-- Data for Name: auctions_addamountreq; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_addamountreq (id, amount, link, currency_id, user_id) FROM stdin;
\.


--
-- Name: auctions_addamountreq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_addamountreq_id_seq', 48, true);


--
-- Data for Name: auctions_adminverifybank; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_adminverifybank (id, bankimg, bankc, action, user_id) FROM stdin;
\.


--
-- Name: auctions_adminverifybank_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_adminverifybank_id_seq', 1, false);


--
-- Data for Name: auctions_adminverifymelli; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_adminverifymelli (id, melliimg, mellic, action, user_id) FROM stdin;
\.


--
-- Name: auctions_adminverifymelli_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_adminverifymelli_id_seq', 1, false);


--
-- Data for Name: auctions_appsettings; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_appsettings (id, welcometitle, welcometext) FROM stdin;
1	به پلتفرم رامابیت خوش آمدید	رامابیت اولین پلتفرم تخصصی استیکینگ و استخراج ابری ارز دیجیتال در ایران\r\n\r\nبا بیش از ۵ سال سابقه\r\nبا بیش از ۵۰۰۰۰ کاربر\r\nبا پشتیبانی شبانه روزی
\.


--
-- Name: auctions_appsettings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_appsettings_id_seq', 1, true);


--
-- Data for Name: auctions_askamountreq; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_askamountreq (id, amount, link, currency_id, user_id) FROM stdin;
\.


--
-- Name: auctions_askamountreq_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_askamountreq_id_seq', 9, true);


--
-- Data for Name: auctions_banner; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_banner (id, title, pic) FROM stdin;
1	1	blog/b3_8aCqnXR.png
\.


--
-- Name: auctions_banner_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_banner_id_seq', 1, true);


--
-- Data for Name: auctions_bazdid; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_bazdid (id, date, count) FROM stdin;
\.


--
-- Name: auctions_bazdid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_bazdid_id_seq', 1, false);


--
-- Data for Name: auctions_bid; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_bid (id, deposit, option, date_field, plan_id, user_id) FROM stdin;
1	0.00192000000000000005	add	2024-05-29	2	6
6	100	wal	2024-06-06	17	17
7	2748	add	2024-06-06	23	29
8	1911	add	2024-06-06	20	29
9	1.12671800000000011	add	2024-06-06	9	29
12	0.00587999999999999981	add	2024-06-06	2	29
13	624	add	2024-06-06	38	29
14	16.9100000000000001	add	2024-06-06	41	29
15	348789774456	add	2024-06-06	44	29
16	0.281000000000000028	add	2024-06-06	47	29
17	0.57999999999999996	add	2024-06-06	38	29
18	87.6800000000000068	add	2024-06-06	50	29
19	112	add	2024-06-06	56	29
20	1575	add	2024-06-06	56	29
21	108	add	2024-06-06	53	29
22	5.37000000000000011	add	2024-06-06	59	29
23	30023	add	2024-06-06	62	29
24	41.740000000000002	add	2024-06-06	26	29
27	115	add	2024-06-12	40	31
29	8.09999999999999964	add	2024-06-26	59	29
30	13825000	add	2024-06-26	29	29
\.


--
-- Name: auctions_bid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_bid_id_seq', 30, true);


--
-- Data for Name: auctions_blog; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_blog (id, date, title, text, pic) FROM stdin;
\.


--
-- Name: auctions_blog_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_blog_id_seq', 1, false);


--
-- Data for Name: auctions_cat; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_cat (name) FROM stdin;
\.


--
-- Data for Name: auctions_currencies; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_currencies (id, name, brand, pic, qr, address, price, align) FROM stdin;
2	BITCOIN	BTC	cur/bitcoin-btc-logo.png	cur/6d9ada45-e1bd-4dbf-aa7e-22eb661ca9c4.jpg	bc1qknhemnm5rqzfklcqcs2f8ecp7hmga6cdlxgy4w	66057.7768542540143	2
16	XRP 	XRP	cur/xrp-xrp-logo.png	cur/photo11767790451.jpg	rn7UeawSw58Rt8gw6zJJ1zsuEfDKerw4e8	0.491549175157634077	99
6	Tether Trc20	USDT	cur/tether-cryptocurrency-icon-2048x2048-dp13oydi_7aVw53M.png	cur/c6b10d0f-9b4f-47e0-a966-fe36bd853782.jpg	TFqkUM4xMxSZx36uCXjvAWRRFS7UmX6NVg	0.999442633728706897	1
3	DogeCoin	DOGE	cur/Dogecoin_Logo.png	cur/photo11595606682.jpg	DGD8KCEgY7vfA6zHxxR3w5yRKqyBtEKpPL	0.136196291771408129	4
5	Ethereum	ETH	cur/6250754.png	cur/8d9997aa-f5dd-4347-8cef-986ff594d299.jpg	0xb987db54ae8CAc0F883d0Db410E0ba4C1C1B8735	3556.3322652459342	3
20	Dash 	DASH	cur/dash-dash-logo.png	cur/photo11767929487.jpg	XgVC7PJGKUNBwqqMu4XMPA6HRRVwxmSehv	26.0286413661542078	98
18	BNB	BNB	cur/bnb-bnb-logo.png	cur/photo11767878542.jpg	0xb987db54ae8CAc0F883d0Db410E0ba4C1C1B8735	604.949343198137285	5
19	Ethereum Classic	ETC	cur/ethereum-classic-etc-logo.png	cur/photo11767906803.jpg	0x2A90eDF762a298e81F64a6061efaC3757211A195	25.5484884674256563	97
8	ATOM	ATOM	cur/cosmos-atom-logo.png	cur/photo11767486605.jpg	cosmos19nfpgmgaajl5ytscvk5e8z2xsxvka4vdksmz8f	7.10209003639360237	96
13	Baby Doge Coin	BabyDoge	cur/baby-doge-coin-babydoge-logo.png	cur/photo11767715303.jpg	0xb987db54ae8CAc0F883d0Db410E0ba4C1C1B8735	0	95
23	Polkadot 	DOT	cur/polkadot-new-dot-logo.png	cur/photo11767995091.jpg	16gmZftLoapjA2JqhQnTUpqxHVc9ezQVFR1NKHQ5pqQS1YJB	6.17944615905346861	94
11	Pepe	PEPE	cur/pepe-pepe-logo.png	cur/photo11767654062.jpg	0xb987db54ae8CAc0F883d0Db410E0ba4C1C1B8735	1.17644522626011092e-05	93
14	Tezos 	XTZ	cur/tezos-xtz-logo.png	cur/photo11767734306.jpg	tz1WWxtFvkKjNDjQ5XoT7QWUsFmFj19e5His	0.81266630017443775	92
24	Bitcoin Cash	BCH	cur/bitcoin-cash-bch-logo_fXP2cmV.png	cur/photo11768046349.jpg	qqcxakkppmwkzzwpnxcjnexahj6zes2ya5zkefal5y	428.557035750675595	91
4	Tron	TRX	cur/40b665bd_2910_210301061731.png	cur/bc357ba9-39c8-41d4-a494-ee7bf63f026a.jpg	TRaBb1FtKHkDHgyvNjiUfo3gxD8E8tWjv2	0.115349848013846942	90
17	Cardano 	ADA	cur/cardano-ada-logo.png	cur/photo11767811353.jpg	addr1qyr44t3vv68frgnfqy2wn9c25u3jxu78v7xkmrahydddg344uzn8w54mkve5n6prnwm9mwrzl5hrj8r76yqffe8j46es84jzas	0.412094378800398786	89
21	Solana 	SOL	cur/solana-sol-logo.png	cur/photo11767946869.jpg	4vXJTi4wmkKXk8WPaNEzx48WtsrBVLUkJPwZyu6VhQo9	144.437064849673106	88
12	Fantom 	FTM	cur/fantom-ftm-logo.png	cur/photo11767682966.jpg	0xb987db54ae8CAc0F883d0Db410E0ba4C1C1B8735	0.625044513163341642	87
22	BitTorrent 	BTT	cur/bittorrent-bttold-logo.png	cur/photo11767965955.jpg	0xb987db54ae8CAc0F883d0Db410E0ba4C1C1B8735	9.92539351022883595e-07	86
25	Polygon 	MATIC	cur/polygon-matic-logo.png	cur/photo11768965534.jpg	0xb987db54ae8CAc0F883d0Db410E0ba4C1C1B8735	0.610686357900336763	85
10	SushiSwap	SUSHI	cur/sushiswap-sushi-logo.png	cur/photo11767618430.jpg	0xb987db54ae8CAc0F883d0Db410E0ba4C1C1B8735	0.948497063070119051	84
9	Shiba Inu	SHIB	cur/shiba-inu-shib-logo.png	cur/photo11767521681.jpg	0xb987db54ae8CAc0F883d0Db410E0ba4C1C1B8735	2.068716076114848e-05	83
15	Litecoin 	LTC	cur/litecoin-ltc-logo_UBpNXyI.png	cur/photo11767750876.jpg	ltc1qq3kv8m4rrmsprw0cwtmlhjg00pjmxfny9mxruf	79.1166361630335615	81
26	VeChain	VET	cur/vechain-vet-logo.png	cur/photo11853283306.jpg	0xf7FC5317A8DCCEA148348F8fc6B682B9357E5F01	0.0284838462391717381	82
\.


--
-- Name: auctions_currencies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_currencies_id_seq', 26, true);


--
-- Data for Name: auctions_details; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_details (id, page, title, text) FROM stdin;
15	charge	راهنما	برای شارژ حساب کاربری ابتدا ولت خود را در صرافی یا کیف پول مبدا وارد نموده و سپس اقدام به انتقال مقدار مورد نظر ارز نمایید پس از تکمیل انتقال کد پیگیری و مبلغ دقیق را در قسمت زیر وارد نموده و گزینه تایید را بزنید
16	balances	مدیریت موجودی	برای واریز یا برداشت هر ارز و شارژ کیف پول خود ابتدا ارز را انتخاب نموده و سپس اقدام به واریز یا برداشت کنید
\.


--
-- Name: auctions_details_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_details_id_seq', 16, true);


--
-- Data for Name: auctions_elan; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_elan (id, title, text, pic) FROM stdin;
\.


--
-- Name: auctions_elan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_elan_id_seq', 1, false);


--
-- Data for Name: auctions_forget; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_forget (email, key) FROM stdin;
armansaheb@gmail.com	0ad3fd03-2eb5-4455-b7fe-b182d0edb093
mohamadsarafex@gmail.com	05f143d7-7894-496b-af90-bea0e684d708
\.


--
-- Data for Name: auctions_general; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_general (id, title, banner_title, banner_text) FROM stdin;
\.


--
-- Name: auctions_general_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_general_id_seq', 1, false);


--
-- Data for Name: auctions_job; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_job (id, title, text, job, username, user_id) FROM stdin;
\.


--
-- Name: auctions_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_job_id_seq', 1, false);


--
-- Data for Name: auctions_miners; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_miners (id, title, pic, des, rate, period, price, profit, currency_id) FROM stdin;
11	Antminer L3++ (580Mh) Bitmain	miner/images.jpg	دستگاه ماینر مدل Antminer L3++ از محصولات ایده آل و کاربردی برند بیت مین می باشد که با برخورداری از هش ریت 580 مگاهش ریت بر ثانیه به بازار های جهانی تجهیزات ماینینگ ارائه شده است. این دستگاه که برای استخراج ارز دیجیتال مورد استفاده قرار می گیرد، از کیفیت بسیار بالایی برخوردار بوده و عملیات استخراج را به خوبی انجام می دهد. دستگاه انت ماینر L3++ از ابعادی برابر با 352*130*188 میلیمتر و وزن 4400 گرم بهره برده که فضای زیادی را اشغال نمی کند و به کاربر این امکان را می دهد تا آن را به راحتی روی میز قرار دهد. میزان نویز در دستگاه ماینینگ بیت مین مدل Antminer L3++ 580Mh/s برابر با 76 دسی بل تخمین زده شده که در زمان کارکرد صدای کمی را از خود تولید می کند\r\nاز این دستگاه برای استخراج دوج کوین استفاده می شود\r\nبازگشت سرمایه با توجه به قیمت فعلی دوج کوین ۷۲ روز\r\nاستخراج دوجکوین\r\nقابلیت استفاده	580	30	369	969	3
6	ماینر Innosilicon T3-57th BTC	miner/7e47c56b-4846-4a9a-9770-a03e98a7281c_gPseTjA.jpg	دستگاه ماینینگ مدل T3 محصولی از شرکت Innosilicon است که در آکوست 2019 با ابعاد 430 * 220 * 140 میلیمتر و وزن 10 کیلوگرم تولید شده و در بازار قطعات کامپیوتر به فروش می رسد. این دستگاه ماینر دارای الگوریتم SHA-256 است که می تواند ارزهایی مانند Acoin (ACOIN) و Bitcoin (BTC) و BitcoinCash (BCH) و Crown (CRW) و Curecoin (CURE) و eMark (DEM) و Joulecoin (XJO) و Peercoin (PPC) و Terracoin (TRC) و Unbreakable (UNB) را استخراج نماید.\r\nبا توجه به قیمت مناسب این دستگاه از جمله ماینر های ابری مقرون به صرفه استخراج با بازگشت سرمایه 6 ماهه می باشد	57	360	449	0.0126000000000000001	2
3	ماینر Bitmain Antminer S19 Pro 128th (plus+)	miner/bitmain-antminer-s19-pro-110th-asic-miner-itbazar.com-1x.jpg	دستگاه ماینر ANTMINER Pro 128th (plus+) به 4 فن خنک کننده مجهز شده که باعث خنک تر شدن دستگاه و جلوگیری از حرارت و بالا رفتن دما میشود. این ماینر یکی از پرفروش ترین ماینر های حال حاضر بازار و جزو ۱۰ ماینر محبوب کلود ماینینگ بوده است.\r\nاز مزایای اجاره این ماینر می توان به بازدهی بالا با توجه به رشد قیمتی بیت کوین اشاره داشت که به نوعی سرمایه گذاری دائمی با نرخ سود تضمین شده را در اختیار کاربران قرار می دهد	127.209999999999994	365	1099	0.032599999999999997	2
10	ماینر AvalonMiner A۱۱۶۶ Pro	miner/Canaan-Avalon-1166-Pro-review.jpg	ماینر AvalonMiner A۱۱۶۶ Pro یکی از بهترین دستگاه‌های ماینر برای استخراج بیت کوین، بیت کوین کش و سایر رمزارزها با الگوریتم SHA-256 است. \r\nاین دستگاه با راندمان j/Gh0.042 یکی از کارآمدترین سخت افزارهای ماینینگ است\r\nبازگشت سرمایه 5 ماه\r\nقابلیت اجاره: ماهانه\r\nارزش سود ماهیانه به ارزش حال.162 دلار\r\nجزو 5 ماینر برتر سال ۲۰۱۷\r\nظرفیت محدود\r\nمناسب برای افراد با سرمایه پایین	81	30	125	0.00235000000000000009	2
\.


--
-- Name: auctions_miners_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_miners_id_seq', 11, true);


--
-- Data for Name: auctions_news; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_news (id, date, title, text, pic, place) FROM stdin;
\.


--
-- Name: auctions_news_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_news_id_seq', 1, false);


--
-- Data for Name: auctions_notification; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_notification (id, title, text, user_id, read) FROM stdin;
31	ورود	با موفقیت به حساب خود وارد شدید	29	t
44	ورود	با موفقیت به حساب خود وارد شدید	29	t
10	ورود	با موفقیت به حساب خود وارد شدید	29	t
47	ورود	با موفقیت به حساب خود وارد شدید	29	t
38	ورود	با موفقیت به حساب خود وارد شدید	29	t
39	ورود	با موفقیت به حساب خود وارد شدید	29	t
16	ورود	با موفقیت به حساب خود وارد شدید	29	t
20	ورود	با موفقیت به حساب خود وارد شدید	29	t
40	ورود	با موفقیت به حساب خود وارد شدید	29	t
25	ورود	با موفقیت به حساب خود وارد شدید	29	t
59	ورود	با موفقیت به حساب خود وارد شدید	29	t
1	ورود	با موفقیت به حساب خود وارد شدید	1	t
8	ورود	با موفقیت به حساب خود وارد شدید	1	t
60	ورود	با موفقیت به حساب خود وارد شدید	1	t
61	ورود	با موفقیت به حساب خود وارد شدید	1	t
3	ورود	با موفقیت به حساب خود وارد شدید	1	t
13	ورود	با موفقیت به حساب خود وارد شدید	1	t
69	ورود	با موفقیت به حساب خود وارد شدید	1	t
54	ورود	با موفقیت به حساب خود وارد شدید	29	t
34	ورود	با موفقیت به حساب خود وارد شدید	29	t
26	ورود	با موفقیت به حساب خود وارد شدید	29	t
42	ورود	با موفقیت به حساب خود وارد شدید	29	t
28	ورود	با موفقیت به حساب خود وارد شدید	29	t
29	ورود	با موفقیت به حساب خود وارد شدید	29	t
9	ورود	با موفقیت به حساب خود وارد شدید	30	t
15	ورود	با موفقیت به حساب خود وارد شدید	29	t
43	ورود	با موفقیت به حساب خود وارد شدید	29	t
33	ورود	با موفقیت به حساب خود وارد شدید	29	t
6	ورود	با موفقیت به حساب خود وارد شدید	29	t
30	ورود	با موفقیت به حساب خود وارد شدید	17	t
4	ورود	با موفقیت به حساب خود وارد شدید	17	t
48	ورود	با موفقیت به حساب خود وارد شدید	17	t
50	ورود	با موفقیت به حساب خود وارد شدید	17	t
52	ورود	با موفقیت به حساب خود وارد شدید	17	f
7	ورود	با موفقیت به حساب خود وارد شدید	29	t
32	ورود	با موفقیت به حساب خود وارد شدید	29	t
41	ورود	با موفقیت به حساب خود وارد شدید	29	t
51	ورود	با موفقیت به حساب خود وارد شدید	17	t
5	ورود	با موفقیت به حساب خود وارد شدید	17	t
53	ورود	با موفقیت به حساب خود وارد شدید	29	t
49	ورود	با موفقیت به حساب خود وارد شدید	31	t
21	ورود	با موفقیت به حساب خود وارد شدید	29	t
45	ورود	با موفقیت به حساب خود وارد شدید	29	t
36	ورود	با موفقیت به حساب خود وارد شدید	29	t
37	ورود	با موفقیت به حساب خود وارد شدید	29	t
17	ورود	با موفقیت به حساب خود وارد شدید	29	t
64	ورود	با موفقیت به حساب خود وارد شدید	29	t
65	ورود	با موفقیت به حساب خود وارد شدید	29	t
66	ورود	با موفقیت به حساب خود وارد شدید	29	t
23	ورود	با موفقیت به حساب خود وارد شدید	29	t
24	ورود	با موفقیت به حساب خود وارد شدید	29	t
22	ورود	با موفقیت به حساب خود وارد شدید	17	t
27	ورود	با موفقیت به حساب خود وارد شدید	17	t
58	ورود	با موفقیت به حساب خود وارد شدید	1	t
73	ورود	با موفقیت به حساب خود وارد شدید	1	t
12	ورود	با موفقیت به حساب خود وارد شدید	1	t
62	ورود	با موفقیت به حساب خود وارد شدید	17	f
63	ورود	با موفقیت به حساب خود وارد شدید	34	f
35	ورود	با موفقیت به حساب خود وارد شدید	29	t
67	ورود	با موفقیت به حساب خود وارد شدید	17	f
18	ورود	با موفقیت به حساب خود وارد شدید	29	t
46	ورود	با موفقیت به حساب خود وارد شدید	29	t
68	ورود	با موفقیت به حساب خود وارد شدید	17	f
74	ورود	با موفقیت به حساب خود وارد شدید	29	t
19	ورود	با موفقیت به حساب خود وارد شدید	29	t
56	ورود	با موفقیت به حساب خود وارد شدید	29	t
70	ورود	با موفقیت به حساب خود وارد شدید	37	t
72	ورود	با موفقیت به حساب خود وارد شدید	39	f
75	ورود	با موفقیت به حساب خود وارد شدید	34	f
71	ورود	با موفقیت به حساب خود وارد شدید	38	t
11	ورود	با موفقیت به حساب خود وارد شدید	1	t
14	ورود	با موفقیت به حساب خود وارد شدید	1	t
76	ورود	با موفقیت به حساب خود وارد شدید	1	t
78	ورود	با موفقیت به حساب خود وارد شدید	1	t
79	ورود	با موفقیت به حساب خود وارد شدید	1	t
55	ورود	با موفقیت به حساب خود وارد شدید	29	t
77	ورود	با موفقیت به حساب خود وارد شدید	29	t
80	ورود	با موفقیت به حساب خود وارد شدید	29	t
81	ورود	با موفقیت به حساب خود وارد شدید	29	t
82	ورود	با موفقیت به حساب خود وارد شدید	29	t
83	ورود	با موفقیت به حساب خود وارد شدید	29	f
84	ورود	با موفقیت به حساب خود وارد شدید	29	f
85	ورود	با موفقیت به حساب خود وارد شدید	1	f
86	ورود	با موفقیت به حساب خود وارد شدید	1	f
87	ورود	با موفقیت به حساب خود وارد شدید	1	f
88	ورود	با موفقیت به حساب خود وارد شدید	1	f
89	ورود	با موفقیت به حساب خود وارد شدید	1	f
90	ورود	با موفقیت به حساب خود وارد شدید	1	f
91	ورود	با موفقیت به حساب خود وارد شدید	1	f
92	ورود	با موفقیت به حساب خود وارد شدید	1	f
93	ورود	با موفقیت به حساب خود وارد شدید	1	f
94	ورود	با موفقیت به حساب خود وارد شدید	1	f
95	ورود	با موفقیت به حساب خود وارد شدید	1	f
96	ورود	با موفقیت به حساب خود وارد شدید	1	f
97	ورود	با موفقیت به حساب خود وارد شدید	47	f
98	ورود	با موفقیت به حساب خود وارد شدید	47	f
99	ورود	با موفقیت به حساب خود وارد شدید	47	f
100	ورود	با موفقیت به حساب خود وارد شدید	48	t
\.


--
-- Name: auctions_notification_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_notification_id_seq', 100, true);


--
-- Data for Name: auctions_pages; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_pages (id, name, title, text) FROM stdin;
1	aboutus	درباره ما	<h3>شرکت<strong> داده پرداز راما</strong> مجموعه ای کارآفرین در زمینه <strong>کریپتو کارنسی </strong>می باشد. این شرکت با سابقه ای موفق بیش از 5 سال در کنار شما حضوری فعال داشته است. تمامی فعالیت های ما مطابق با قوانین روز ایران می باشد.</h3><h3>آدرس: تهران بلوار فردوسی ساختمان تجارت جهانی طبقه دوم شرکت (<strong>داده پرداز راما</strong>)</h3>
2	contactus	تماس با ما	<p><strong>شماره پشتیبانی شرکت:</strong></p><p><strong>شعبه تهران: در دست اقدام</strong></p><p>شماره داِئمی:</p><p><strong>850874979808</strong></p><p>آیدی تلگرام:</p><p><strong>@ramabitsup</strong></p>
\.


--
-- Name: auctions_pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_pages_id_seq', 2, true);


--
-- Data for Name: auctions_plans; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_plans (id, title, des, percent, mini, maxi, period, currency_id) FROM stdin;
20	پلن ترون سالیانه	ماهیانه با سود 7 درصد \nترید روی طلا\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای بلند مدت	7	\N	\N	year	4
21	پلن دوج کوین ماهانه	ماهیانه با سود 4 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای کوتاه مدت	4	\N	\N	month	3
2	پلن بیتکوین سالیانه (فول استیکینگ)	ین سالیانه با سود ماهیانه 8 درصد مرکب\nاین پلن قابلیت لغو را ندارد\n	8	\N	\N	year	2
22	پلن دوج کوین شش ماهه	ماهیانه با سود 5 درصد \nترید گردشی کریپتو\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای میان مدت	5	\N	\N	half-year	3
3	پلن بیتکوین ماهانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید روی طلا\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های کوتاه مدت	5	\N	\N	month	2
23	پلن دوج کوین سالیانه	ماهیانه با سود 7 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای بلند مدت	7	\N	\N	year	3
5	پلن بیتکوین سالانه	ماهیانه با سود 7 درصد \nترید روی بیتکوین و اتریوم\nقابلیت لغو لحظه ای \nمناسب برای تریدر ها\nضمانت عدم زیان	4	\N	\N	year	2
6	پلن بیتکوین شش ماهه	ماهیانه با سود 5.5 درصد \nترید روی بیتکوین و اتریوم\nقابلیت لغو لحظه ای \nمناسب برای تریدر ها\nضمانت عدم زیان	5.5	\N	\N	half-year	2
7	پلن بیتکوین ماهیانه	ماهیانه با سود 4 درصد \nترید روی اتریوم و ریپل\nقابلیت لغو لحظه ای \nمناسب برای تریدر ها\nضمانت عدم زیان	4	\N	\N	month	2
8	پلن هولد روز شمار	روزانه با سود 0.1 درصد\nبه ازای هر روز هولد سود دریافت کنید\nمناسب برای تریدر های روزانه\nضمانت عدم زیان	0.100000000000000006	\N	\N	day	2
4	پلن بیتکوین شش  ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های  میان مدت	6.5	\N	\N	half-year	2
10	پلن اتریوم شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های میان مدت	6.5	\N	\N	half-year	5
11	پلن اتریوم ماهیانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در کریپتو\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های کوتاه مدت	5	\N	\N	month	5
12	پلن اتریوم سالانه 	ماهیانه با سود 7 درصد \nترید گردشی طلا\nدارای قابلیت لغو پلن \nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای تریدر های بلند مدت	7	\N	\N	year	5
13	پلن اتریوم شش ماهه	ماهیانه با سود 5 درصد \nترید گردشی کریپتو\nدارای قابلیت لغو پلن\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای تریدر های میان مدت	5	\N	\N	half-year	5
14	پلن اتریوم ماهانه	ماهیانه با سود 4 درصد \nترید گردشی روی کریپتو\nدارای قابلیت لغو پلن\nمناسب برای هولدر های بلند مدت\nدارای ضمانت عدم زیان	4	\N	\N	month	5
15	پلن تتر ماهیانه	ماهیانه با سود 4 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای کوتاه مدت	4	\N	\N	month	6
16	پلن تتر شش  ماهه	ماهیانه با سود 5 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای میان مدت	5	\N	\N	half-year	6
17	پلن تتر سالانه	ماهیانه با سود 7 درصد \nترید روی طلا\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای بلند مدت	7	\N	\N	year	6
18	پلن ترون ماهیانه	ماهیانه با سود 4 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای کوتاه مدت	4	\N	\N	month	4
19	پلن ترون شش ماهه	ماهیانه با سود 5 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای میان مدت	5	\N	\N	half-year	4
24	پلن اتم ماهیانه	ماهیانه با سود 4 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای کوتاه مدت	4	\N	\N	month	8
25	پلن اتم شش ماهه	ماهیانه با سود 5 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای میان مدت 	5	\N	\N	half-year	8
26	پلن اتم سالیانه	ماهیانه با سود 7 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای بلند مدت	7	\N	\N	year	8
27	پلن شیبا ماهیانه	ماهیانه با سود 4 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای کوتاه مدت	4	\N	\N	month	9
28	پلن شیبا شش ماهه	ماهیانه با سود 5 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای میان مدت	5	\N	\N	half-year	9
29	پلن شیبا سالیانه	ماهیانه با سود 7 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای بلند مدت	7	\N	\N	year	9
30	پلن سوشی ماهیانه	ماهیانه با سود 4 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای کوتاه مدت	4	\N	\N	month	10
31	پلن سوشی شش ماهه	ماهیانه با سود 5 درصد \nترید گردشی فارکس\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای میان مدت	5	\N	\N	half-year	10
32	پلن سوشی سالیانه	ماهیانه با سود 7 درصد \nترید روی طلا\nدارای قابلیت لغو پلن\nدارای ضمانت عدم زیان\nمناسب برای هولدر ها و تریدرهای بلند مدت	7	\N	\N	year	10
38	پلن ریپل سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	16
39	پلن ریپل شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	6.5	\N	\N	half-year	16
40	پلن ریپل ماهیانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nمناسب برای هولدر های کوتاه مدت	5	\N	\N	month	16
41	پلن دش سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	20
42	پلن دش شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	6.5	\N	\N	half-year	20
43	پلن دش ماهانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nمناسب برای هولدر های کوتاه مدت	5	\N	\N	month	20
44	پلن بیبی دوج سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	13
45	پلن بیبی دوج شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	6.5	\N	\N	half-year	13
46	پلن بیبی دوج ماهانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های کوتاه مدت	5	\N	\N	month	13
47	پلن باینانس کوین سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	18
48	پلن باینانس کوین شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	6.5	\N	\N	half-year	18
49	پلن باینانس کوین ماهانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	5	\N	\N	month	18
50	پلن پولکادات سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	23
51	پلن پولکادات شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	6.5	\N	\N	half-year	23
52	پلن پولکادات ماهانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nمناسب برای هولدر های 	5	\N	\N	month	23
53	پلن تزوس سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	14
54	پلن تزوس شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	6.5	\N	\N	half-year	14
55	پلن تزوس ماهانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های کوتاه مدت	5	\N	\N	month	14
56	پلن کاردانو سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	17
57	پلن کاردانو شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	6.5	\N	\N	half-year	17
9	پلن اتریوم سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	5
58	پلن کاردانو ماهیانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	5	\N	\N	month	17
59	پلن سولانا سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	21
60	پلن سولانا شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	6.5	\N	\N	half-year	21
61	پلن سولانا ماهانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nمناسب برای هولدر های بلند مدت	5	\N	\N	month	21
62	پلن ویچین سالانه (فول استیکینگ)	ماهیانه با سود 8 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	8	\N	\N	year	26
63	پلن ویچین شش ماهه (فول استیکینگ)	ماهیانه با سود 6.5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	6.5	\N	\N	half-year	26
64	پلن ویچین ماهانه (فول استیکینگ)	ماهیانه با سود 5 درصد \nترید گردشی در فارکس\nاین پلن قابلیت لغو را ندارد\nدارای ضمانت بیمه افت قیمت ارز\nمناسب برای هولدر های بلند مدت	5	\N	\N	month	26
\.


--
-- Name: auctions_plans_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_plans_id_seq', 64, true);


--
-- Data for Name: auctions_post; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_post (id, date, title, text, pic, place, app, index) FROM stdin;
3	2024-05-21	ماینینگ ارز دیجیتال	ماینینگ (Mining) یا همان استخراج ارزهای دیجیتال، فرایندی است که طی آن، واحدهای جدید ارزهای دیجیتال ایجاد و تراکنش‌ها بر روی بلاک چین تأیید می‌شوند. ماینینگ یکی از ارکان اصلی شبکه‌های ارزهای دیجیتال مبتنی بر اجماع اثبات کار (PoW) محسوب می‌شود. در واقع، ماینرها یا استخراج‌کنندگان با به کارگیری قدرت محاسباتی سیستم‌های پردازنده خود، در تأیید تراکنش‌ها و تأمین امنیت شبکه سهیم می‌شوند. ماینرها در ازای این مشارکت، پاداش ماینینگ در قالب واحدهای جدید آن ارز دیجیتال دریافت می‌کنند.	blog/Mining-digital-currency-at-home.jpg	normal	f	t
2	2024-05-21	استیکینگ	استیکینگ (Staking) ارز دیجیتال فرایندی است که طی آن، هولدرها به صورت داوطلبانه، بخشی از دارایی‌ کریپتویی خود را در یک شبکه قفل می‌کنند تا در اعتبارسنجی (Validation) تراکنش‌ها مشارکت کنند. در قبال کمک به تایید بلاک‌های زنجیره و یا تامین نقدینگی، استیک‌کنندگان پاداشی را دریافت می‌کنند.	blog/staking03.jpg	normal	f	t
1	2024-05-21	قابلیت استخراج ابری (بدون هزینه برق کاملا قانونی)	برخلاف استخراج ارز دیجیتال سنتی که در آن‌ها افراد مجبور بودند سخت‌افزارهای خود را در خانه‌، محل‌کار یا انبارهای شخصی نگهداری کنند، در استخراج ابری این سخت‌افزارها در مراکز داده‌ شرکت‌های ارائه‌دهنده‌ این سرویس نگهداری می‌شوند. دیگر کاربر با نگهداری و سرهم‌بندی این سخت‌افزارها کاری ندارد و نیاز هم نیست که نگران مصرف برق، خرابی یا دیگر مشکلات احتمالی باشد. همه‌ این دردسرها را شرکت‌های ارائه‌دهنده متحمل می‌شوند و در عوض مشتری‌های آن مبلغی را به آن‌ها پرداخت می‌کنند.	blog/images.png	normal	t	t
\.


--
-- Name: auctions_post_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_post_id_seq', 5, true);


--
-- Data for Name: auctions_product; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_product (id, title, pic, des, price) FROM stdin;
1	کول ولت اس | CoolWallet S	miner/coolwallet-pro-10.jpg	کیف پول کول ولت اس | CoolWallet S که تولید شرکت CoolBitX است یکی از امن ترین کیف پول های سخت افزاری می باشد که می توان گفت رقیب سر سخت کیف پول سخت افزاری لجر نانو ایکس | Ledger Nano X است.\r\n\r\nکیف پول سخت افزاری کول ولت اس به علت داشتن تراشه امنیتی خاصی از امنیت بسیار بالایی بر خوردار است، همچنین این کیف پول سخت افزاری برای تایید تراکنش و انتقال، نیاز به تاییدیه 1+2 مرحله ای دارد.\r\n\r\nاین کیف پول سخت افزاری آفلاین می باشد و فقط شما برای انتقال و انجام تراکنش نیاز به روشن کردن کارت دارید که از طریق بلوتوث به موبایل شما متصل می شود و با استفاده از اپلیکیشن CoolBitX تراکنش انجام می شود.	0
\.


--
-- Name: auctions_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_product_id_seq', 1, true);


--
-- Data for Name: auctions_productorder; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_productorder (id, firs_name, last_name, address, postal_code) FROM stdin;
\.


--
-- Name: auctions_productorder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_productorder_id_seq', 1, false);


--
-- Data for Name: auctions_profitlist; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_profitlist (id, date, invid, amount, currency_id, plan_id, user_id) FROM stdin;
1	2024-05-27	5646	1100	6	\N	1
2	2024-06-16	1	0.400000000000000022	6	\N	1
3	2024-06-16	1	0.200000000000000011	6	\N	1
4	2024-06-16	1	0.100000000000000006	6	\N	1
\.


--
-- Name: auctions_profitlist_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_profitlist_id_seq', 4, true);


--
-- Data for Name: auctions_rentedminer; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_rentedminer (id, start_date, last_check, paid, done, miner_id, user_id) FROM stdin;
11	2024-06-02 00:28:08.290475+03:30	2024-06-29 13:30:02.923584+03:30	0.000926658950621053572	f	6	17
4	2024-05-26 15:55:43.197839+03:30	2024-06-29 13:30:02.930868+03:30	0.00145116365742144812	f	10	1
14	2024-06-13 15:00:54.489844+03:30	2024-06-29 13:30:02.937848+03:30	0.00119682191780385032	f	3	29
5	2024-05-26 15:56:59.918305+03:30	2024-06-29 13:30:02.94478+03:30	0.00092663464506549751	f	6	1
15	2024-06-13 15:01:55.741255+03:30	2024-06-29 13:30:02.950044+03:30	0.00119675989345073043	f	3	29
6	2024-05-26 15:56:59.920209+03:30	2024-06-29 13:30:02.954855+03:30	0.00092663464506549751	f	6	1
16	2024-06-18 19:37:39.204448+03:30	2024-06-29 13:30:02.959788+03:30	0.000981969558596169391	f	3	34
7	2024-06-02 00:28:08.283052+03:30	2024-06-29 13:30:02.964529+03:30	0.00092663464506549751	f	6	17
17	2024-06-18 19:38:07.285283+03:30	2024-06-29 13:30:02.969311+03:30	0.000384805555560927557	f	6	34
12	2024-06-03 14:18:02.694995+03:30	2024-06-29 13:30:02.974106+03:30	0.000880962885807219567	f	6	17
1	2024-05-26 12:44:08.914834+03:30	2024-06-29 13:30:02.97891+03:30	0.00145116365742144812	f	10	1
8	2024-06-02 00:28:08.285843+03:30	2024-06-29 13:30:02.98375+03:30	0.000926658950621053572	f	6	17
13	2024-06-06 10:32:39.628465+03:30	2024-06-29 13:30:02.988498+03:30	0.00187418566928108043	f	3	17
9	2024-06-02 00:28:08.287373+03:30	2024-06-29 13:30:02.993314+03:30	0.000926658950621053572	f	6	17
2	2024-05-26 12:44:08.917413+03:30	2024-06-29 13:30:02.998227+03:30	0.00145116365742144812	f	10	1
10	2024-06-02 00:28:08.288978+03:30	2024-06-29 13:30:03.003139+03:30	0.000926658950621053572	f	6	17
3	2024-05-26 15:55:43.193721+03:30	2024-06-29 13:30:03.008041+03:30	0.00145116365742144812	f	10	1
\.


--
-- Name: auctions_rentedminer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_rentedminer_id_seq', 17, true);


--
-- Data for Name: auctions_settings; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_settings (id, name, address, tel, email, telegram, whatsapp, instagram, facebook, logo, s1, s2, s3, s4) FROM stdin;
1	adsa	safsaf	safsa	fsaf	safsaf	safsfa	sfafsa	safsaf	settings/image_file_name_here_6_1.png	8	6	4	2
\.


--
-- Name: auctions_settings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_settings_id_seq', 1, true);


--
-- Data for Name: auctions_subjects; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_subjects (id, date, lastdate, act, read, title, aread, user_id) FROM stdin;
5	2024-06-01	2024-06-01	0	t	jchchf	f	12
6	2024-06-02	2024-06-02	0	t	sdgsdg	f	1
7	2024-06-02	2024-06-02	0	t	fdhdf	f	1
8	2024-06-08	2024-06-08	0	t	کل پلن یکساله تزوس میخوام ببندم	f	29
9	2024-06-08	2024-06-08	0	t	میخوام این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
10	2024-06-08	2024-06-08	0	t	میخوام این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
11	2024-06-08	2024-06-08	0	t	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
12	2024-06-08	2024-06-08	0	t	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
13	2024-06-08	2024-06-08	0	t	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
14	2024-06-08	2024-06-08	0	t	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
15	2024-06-08	2024-06-08	0	t	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
16	2024-06-08	2024-06-08	0	t	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
17	2024-06-08	2024-06-08	0	t	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
18	2024-06-08	2024-06-08	0	t	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
20	2024-06-08	2024-06-08	0	t	عذز خواهی بابت ضعیف بودن نت یک پیام چند بار فرستاده شد	f	29
1	2024-06-01	2024-06-01	1	f	ars	f	1
19	2024-06-08	2024-06-08	1	f	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم	f	29
21	2024-06-14	2024-06-14	0	t	اختلاف حساب	f	31
23	2024-06-14	2024-06-14	0	t	اختلاف حساب	f	31
22	2024-06-14	2024-06-14	1	f	اختلاف حساب	f	31
24	2024-06-14	2024-06-14	2	f	اختلاف حساب	f	31
25	2024-06-15	2024-06-15	1	f	answer	f	31
\.


--
-- Name: auctions_subjects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_subjects_id_seq', 25, true);


--
-- Data for Name: auctions_tickets; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_tickets (id, date, subid, text, pic, sender) FROM stdin;
1	2024-06-01	1	جفت ارز چیست	ticket/image_file_name_here_6_1.png	1
2	2024-06-01	2	sdgsfsd	ticket/image_file_name_here_6_1_XWfvOLp.png	12
3	2024-06-01	5	jcjvjcjffn		0
4	2024-06-01	5	sdgdgsd	ticket/image_file_name_here_6_1_mLfEqNU.png	1
5	2024-06-02	6	dsgdsg		0
6	2024-06-02	7	fdhdfhdf		0
7	2024-06-02	1	dfhgfh		0
8	2024-06-02	1	یبلیب		0
9	2024-06-02	1	بیسششس		0
10	2024-06-02	1	بیسششس		0
11	2024-06-02	1	بیسششس		0
12	2024-06-02	1			0
13	2024-06-02	1	یبسیسب		0
14	2024-06-02	1	یبسیسبسیر		0
15	2024-06-02	1	یبسیسزبسیر		0
16	2024-06-02	1	dgffd		0
17	2024-06-02	1	sdas		0
18	2024-06-02	1	fe		0
19	2024-06-08	8	کل پلن شش یکساله تزوس میخوام ببندم 		0
20	2024-06-08	9	میخوام این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
21	2024-06-08	10	میخوام این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
22	2024-06-08	11	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
23	2024-06-08	12	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
24	2024-06-08	13	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
25	2024-06-08	14	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
26	2024-06-08	15	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
27	2024-06-08	16	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
28	2024-06-08	17	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
29	2024-06-08	18	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
30	2024-06-08	19	میخوام کل این پلن باینانس کوین سالانه (فول استیکینگ) ببندم		0
31	2024-06-08	20	عذز خواهی بابت ضعیف بودن نت یک پیام چند بار فرستاده شد		0
32	2024-06-09	1	ars		1
33	2024-06-09	1	اه		1
34	2024-06-12	19	درود احتراما از ارسال چندین پیام خود داری نمایید		1
35	2024-06-12	19	پلن های شما سالیانه و نوع مشارکت در منافع می باشد آیا حاضر به پرداخت جریمه می باشید؟		1
36	2024-06-14	21	سلام . وقتتون بخیر \nبا کمک پشتیبانی تونستم وارد سایت بشم \nاما متاسفانه تعداد ارزهام خیلی کم شده \nADA : 151.86\nxrp : 115.977\nAtom: 5991.7\nاینا تعدادی بود که من گرفته بودم اما همه اینا کم شده بخصوص اتم که زده ۳.۵۸\nموضضوع دیگه اینکه تاریخ ثبت ارزهام         5 سپتامبر ۲۰۲۳ بود اما اینجا همه رو اشتباه ثبت کرده\n\nلطفا راهنماییم کنید		0
37	2024-06-14	22	سلام . وقتتون بخیر \nبا کمک پشتیبانی تونستم وارد سایت بشم \nاما متاسفانه تعداد ارزهام خیلی کم شده \nADA : 151.86\nxrp : 115.977\nAtom: 5991.7\nاینا تعدادی بود که من گرفته بودم اما همه اینا کم شده بخصوص اتم که زده ۳.۵۸\nموضضوع دیگه اینکه تاریخ ثبت ارزهام         5 سپتامبر ۲۰۲۳ بود اما اینجا همه رو اشتباه ثبت کرده\n\nلطفا راهنماییم کنید		0
38	2024-06-14	23	سلام . وقتتون بخیر \nبا کمک پشتیبانی تونستم وارد سایت بشم \nاما متاسفانه تعداد ارزهام خیلی کم شده \nADA : 151.86\nxrp : 115.977\nAtom: 5991.7\nاینا تعدادی بود که من گرفته بودم اما همه اینا کم شده بخصوص اتم که زده ۳.۵۸\nموضضوع دیگه اینکه تاریخ ثبت ارزهام         5 سپتامبر ۲۰۲۳ بود اما اینجا همه رو اشتباه ثبت کرده\n\nلطفا راهنماییم کنید		0
39	2024-06-14	24	سلام . وقتتون بخیر \nبا کمک پشتیبانی تونستم وارد سایت بشم \nاما متاسفانه تعداد ارزهام خیلی کم شده \nADA : 151.86\nxrp : 115.977\nAtom: 5991.7\nاینا تعدادی بود که من گرفته بودم اما همه اینا کم شده بخصوص اتم که زده ۳.۵۸\nموضضوع دیگه اینکه تاریخ ثبت ارزهام         5 سپتامبر ۲۰۲۳ بود اما اینجا همه رو اشتباه ثبت کرده\n\nلطفا راهنماییم کنید		0
40	2024-06-14	24	سلام عزض ادب و احترام \nبرای تاریخ نگرانی نداشته باشید ما آپدیت بزرگی داشتیم و به اجبار خیلی از پلن هارو از اول وارد کردیم		1
41	2024-06-14	24	در مورد اتم که ورژن قبلی اشتباه ثبت کرده بود شما میتونین خودتون بررسی کنید و این عددی که اینجا ثبت شده فقط باگ سایت قبلی بود		1
42	2024-06-14	24	کاردانو و ریپل شما هم بررسی شد و به حسابتون اضافه میشه		1
43	2024-06-14	22	دوست عزیز در تیکت قبلی به شما پاسخ داده شد از ارسال تیکت های یکسان جدا خودداری نمایید شما با هر بار تیکت زدن به انتهای صف منتقل خواهید شد		1
44	2024-06-15	24	در مورد اتم که ورژن قبلی اشتباه ثبت کرده بود شما میتونین خودتون بررسی کنید و این عددی که اینجا ثبت شده فقط باگ سایت قبلی بود\n\nسلام . من متوجه این منظورتون نشدم . یعنی من الان موجودی اتمم فقط همین قدره ؟ ۳.۵۸ ؟\nدر مورد تاریخ و شهریور امسال پلن یکسالم تموم میشه و باید یود پول واریز بشه اما شما دوباره از اول شروع کردید . یعنی باز باید یکسال منتظر بمونم ؟\n\nدر مورد پیام دادن . من فقط یکبار ارسال میکنم اما نمیدونم چرا چندین بار ارسال میشه . شاید باگ سایتتون باشه 		0
45	2024-06-15	25	در مورد اتم که ورژن قبلی اشتباه ثبت کرده بود شما میتونین خودتون بررسی کنید و این عددی که اینجا ثبت شده فقط باگ سایت قبلی بود سلام . من متوجه این منظورتون نشدم . یعنی من الان موجودی اتمم فقط همین قدره ؟ ۳.۵۸ ؟ در مورد تاریخ و شهریور امسال پلن یکسالم تموم میشه و باید یود پول واریز بشه اما شما دوباره از اول شروع کردید . یعنی باز باید یکسال منتظر بمونم ؟ در مورد پیام دادن . من فقط یکبار ارسال میکنم اما نمیدونم چرا چندین بار ارسال میشه . شاید باگ سایتتون باشه		0
46	2024-06-15	25	احتمالا سرعت اینترنتتون ضعیفه\nدر مورد زمان عرض کردم خدمتتون شما شهریور ماه براتون ثبت شده و میتونین بدون هیچ گونه کسوری برداشت کنید \nدر رابطه با موجودی هم عرض کردم شما باید صبور باشید تیم ما بررسی کاملی روی واریزی ها در حال انجام داره و نهایتا طی چند روز آینده سود و زیان اکانت شما هم بررسی و به نظر شما خواهد رسید 		1
47	2024-06-18	25	ممنونم 🙏🏻		0
48	2024-06-22	25	موفق باشید		1
\.


--
-- Name: auctions_tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_tickets_id_seq', 48, true);


--
-- Data for Name: auctions_timer; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_timer (id, date, user_id) FROM stdin;
1	2024-06-26 17:44:02.776279+03:30	1
\.


--
-- Name: auctions_timer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_timer_id_seq', 1, true);


--
-- Data for Name: auctions_transaction; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_transaction (id, date, amount, act, currency_id, user_id) FROM stdin;
1	2024-06-14	157.60499999999999	1	6	29
2	2024-06-13	1	2	6	1
3	2024-06-02	10000	1	6	17
4	2024-06-06	0.281000000000000028	1	18	29
5	2024-06-12	96.2999999999999972	1	17	31
6	2024-06-13	1	1	6	1
7	2024-06-13	1	1	6	1
8	2024-06-13	9237251	2	9	29
9	2024-05-31	0.00192000000000000005	1	2	6
10	2024-06-13	1	1	6	1
11	2024-06-16	1111	1	6	1
12	2024-06-16	414	1	6	1
13	2024-06-16	20	1	6	1
14	2024-06-16	10	1	6	1
15	2024-06-16	20	1	6	1
16	2024-06-18	1	2	6	29
17	2024-06-18	1	2	6	29
18	2024-06-18	2	1	6	29
19	2024-06-18	2	1	6	29
20	2024-06-18	2	2	6	29
21	2024-06-18	2	1	6	29
22	2024-06-18	2	1	6	29
23	2024-06-18	4	2	6	29
24	2024-06-18	1551	1	6	34
25	2024-06-22	1	1	6	1
26	2024-06-22	1	1	6	1
27	2024-06-22	1	1	6	1
28	2024-06-22	1000	2	6	1
29	2024-06-26	1.30000000000000004	1	8	31
30	2024-06-26	98	1	17	31
31	2024-06-26	18	1	16	31
32	2024-06-26	157	2	6	29
33	2024-06-26	0.00187999999999999994	2	2	29
34	2024-06-26	0.00101000000000000005	1	2	29
35	2024-06-26	28.1000000000000014	1	21	29
36	2024-06-26	19.7199999999999989	2	21	29
37	2024-06-26	13825106	1	9	29
38	2024-06-27	617	1	6	34
\.


--
-- Name: auctions_transaction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_transaction_id_seq', 38, true);


--
-- Data for Name: auctions_user; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_user (id, password, last_login, is_superuser, email, is_staff, date_joined, ref, username, inv, name, lastname, mobile, is_active, is_verified) FROM stdin;
6	pbkdf2_sha256$260000$vRORvSo7IJAIwcGMZCd1Z7$aGuoE4AlIiAKOeLpBlmgfEGrMLMAo4DHOXt6NWzrBSg=	2024-05-31 17:08:02.563462+03:30	f		f	2024-05-27 00:25:50.728708+03:30	2c976de9-831c-45df-a362-5ed7699b3301	mobintalebpor	\N	مبین	طالب پور	09333466764	t	f
16	pbkdf2_sha256$260000$rEPCuh6UPCkCZ4504pxovd$eysDZQqKt23uXEa2mFD+tVD/+9Ow2eYKnOI15w7pG6E=	2024-06-02 14:44:18.784282+03:30	f	armansaheb@hotmail.com	f	2024-05-31 16:00:20+03:30	cebbd401-0da1-4e13-b89a-2933cf8efd00	armansaheb5	\N	ars	ars	000	t	f
13	pbkdf2_sha256$260000$7N2qvWLbxvufm7Ac65HlkL$v0tPQF5dcK/xHoOBzVcHykFcCB9yFQpWqU1ADXHGDEU=	2024-05-31 16:09:05.008132+03:30	f	ahmad.kameli121@gmail.com	f	2024-05-31 14:25:57+03:30	4312a866-7708-4e80-a454-236b5bcc4108	ariya_boy	\N	ahmad	kameli	09058075975	t	f
44	pbkdf2_sha256$260000$jbMhc4j1HWsfjka2YKAxyC$E2mWWnDkhgK1n6tezpViEOx4qyM54yr4tso8xLztW5w=	2024-06-22 18:21:11.844352+03:30	f	diadalir@gmail.com	f	2024-06-22 18:20:54.658251+03:30	799f0de8-2a1d-4cdc-a75d-5b39c3b70636	diadalir	\N	دیا	دلیر	09014633716	t	f
30	pbkdf2_sha256$260000$86es5CBzPG90jdli21cxbC$+W/VoQ+627l2bXztCfQEzjMO6oCvl+jjf+y7uYhd+4E=	2024-06-06 18:22:58.454823+03:30	f	milad.rahmany777@gmail.com	f	2024-06-06 18:10:38.114107+03:30	e96992a1-483b-4b24-949b-7d6dd530c840	lucifer777	\N	میلاد	باقرزاده رحمانی	09113222909	t	f
14	pbkdf2_sha256$260000$HhfMEcdU4f3asO1ijm39VZ$KNX//VxEIdUhwQpQ5XZYWixGks3y/cQRbfENgCwscXQ=	2024-05-31 16:37:59.424389+03:30	f	Armansaheb@hotmail.com	f	2024-05-31 14:32:36+03:30	f411e5ae-15f4-4d67-895d-5efe512cbe99	armansaheb1994	\N	Arman	Saheb	0000000000	t	f
38	pbkdf2_sha256$260000$40ez5myokTK91QkWyYnYga$rbokotFzRB0W6vhh+FnhH6Pi7ars3nMUOWKsd+ejhN4=	2024-06-22 10:24:37.326199+03:30	f	mohamadsarafex@gmail.com	f	2024-06-19 22:26:19.999774+03:30	cffac2ea-7f20-4230-9736-4bb7fb10d55f	m.kazemzadeh	\N	محمد	کاظم زاده	09111004196	t	f
5	pbkdf2_sha256$260000$5WcYJ2R8dwieb2Ycobs9vI$vSH10QxMeABuzNqSRt2UPJguWMmENJXRljdjOAe4reA=	2024-05-31 16:01:17.590333+03:30	f		f	2024-05-25 21:21:45.977632+03:30	31aa52ab-cf19-4d62-a825-a07838b60112	armansaheb	\N	Arman	Saheb	000000000	t	f
17	pbkdf2_sha256$260000$UiK33lCJeX21JJFoApj6mM$jC9qldvGnDhiW//zVrXlEchQGo5PiHL/7EW6akqLitM=	2024-06-19 08:00:51.971906+03:30	f	ahmad.kameli121@gmail.com	f	2024-06-02 00:19:10.530871+03:30	34a6ad7d-be7b-48aa-8f23-90c265b9cc83	pabking	\N	احمد	احمد	\N	t	f
1	pbkdf2_sha256$260000$ZCWDTSrtLzZccIrxadsBZd$5QisZ3XKFyf8y/YBHH30xyOj+PyG17xS+lhau7zV314=	2024-06-26 17:44:00.835012+03:30	t	armansaheb@gmail.com	t	2024-05-21 11:25:57+03:30	1b3bfa0c-dce4-42e1-b726-e09d6bbf1a16	admin	1b3bfa0c-dce4-42e1-b726-e09d6bbf1a16	admin	admin	000	t	f
40	pbkdf2_sha256$260000$udg2BNV3hUi31qwCO9qGMx$PJZOwDwLaki46yxkG6vxwmuSI0nDKlFUNTg+AzJFz7c=	2024-06-22 10:31:40.88707+03:30	f	erfana169@gmail.com	f	2024-06-22 10:31:04.848718+03:30	5f61cea7-d783-43f6-9b46-af79bc494151	عرفان	\N	عرفان	علیشاه	09025360433	t	f
31	pbkdf2_sha256$260000$aarDUMFei1NJU3WrLrZrmu$BR7hu46ypSgDR4NmLbb/Qu7w7LnwrzfW6VlDSrTfz50=	2024-06-14 01:30:25.755671+03:30	f	architect.map@gmail.com	f	2024-06-12 18:27:52.897141+03:30	686e5090-8487-46d4-aff7-8e9b47d32cd1	architect.map	\N	میثم	اکبری	09129467982	t	f
46	pbkdf2_sha256$260000$vMmHbJmVRv2XjLVbUQkL6I$NA/8sxzbsWGxGsfeisjebcadaYK6cNVhhpuQ+md3p+4=	\N	f	Aa@gmail.com	f	2024-06-26 23:44:29.419834+03:30	b24a89bd-7c6f-459e-9c20-405e9b6c46a5	alia	ad4b6c3f-25a9-44b4-ae04-3cb402222c41	A	A	Uw	t	f
12	pbkdf2_sha256$260000$QeSHEVV5dAe1GKJEWW3HdX$RAvHct6ElZrQiXb6XRM2+o0XKC9M/+1+UjhmUgH10p4=	2024-06-19 14:36:46.140557+03:30	f	dashmajid.apachi@gmail.com	f	2024-05-29 18:05:44+03:30	c55143ee-1067-4162-9690-1df9dbf31bf8	amirhsaheb	1b3bfa0c-dce4-42e1-b726-e09d6bbf1a16	amirhossein	saheb	09188574941	t	f
48	pbkdf2_sha256$260000$TDpGvU5IM3S8sXhhDcsE34$NIK2y/yJhQCJ8Pzom6TosUPM5PakQ0M05hvsp9NV7G0=	2024-06-29 00:02:40.778704+03:30	f	morteza.aliyar1382@gmail.com	f	2024-06-29 00:02:13.477979+03:30	2a92bbb3-9fad-4e61-ae4c-710685e4ee89	alex	\N	.ahdi	aliyar	0767624057	t	f
47	pbkdf2_sha256$260000$FhhuSWXgOQAXewF0BkNqRi$SH4PE1vusI1/tFgFluXCkPShKCeEiJAKtpeCfERrJpM=	2024-06-27 21:40:54.198742+03:30	f	mortezashabani402@gmail.com	f	2024-06-27 21:28:02.349566+03:30	395986eb-6a16-428e-b866-969f408f1bd3	morteza2000	\N	Morteza	shabani	09361197631	t	f
41	pbkdf2_sha256$260000$ngYoMMybI5w57SOU5VdLie$CKbDKUmxuTYvR+d1+/YHq4uhaAEwegERWu0gpsQmOxg=	2024-06-22 15:53:31.325917+03:30	f	componic1347@gmail.com	f	2024-06-22 15:52:53.025982+03:30	7180bd99-2539-430a-adc8-15ac4c4ec1e9	confirm	\N	حسن	احمدی	09121763164	t	f
36	pbkdf2_sha256$260000$VZFTsILUMIhbAGdmce1Zhn$0GHEHukkUBF1rJNzyvjNKxcqxhNHYInAT8wFVj33BK4=	2024-06-17 17:52:24.202556+03:30	f	ghg@gbf.com	f	2024-06-17 17:52:07.674433+03:30	86fbe929-3f3a-4ee5-a83d-c2cfd59a2bf7	aaaaa	\N	aaaa	aaaa	0987654321	t	f
39	pbkdf2_sha256$260000$4zwLtPr5iXUzbYeCysxS0X$VciHBh5FbgGj3fdlAST6ONXbncIXLMSlQ93CgiY6U+8=	2024-06-20 14:37:47.836594+03:30	f	nikmehrkimia@gmail.com	f	2024-06-20 10:23:07.829308+03:30	4877583a-fe29-4f91-bff9-2721a2ed9ec7	kimia	\N	کیمیا	نیک مهر	۰۹۰۲۵۴۴۱۰۲۹	t	f
42	pbkdf2_sha256$260000$Jeul91SCfGtrnFpFpc6X1I$OoG7zXI46ujiSTbXOAIjsR47Uu2ztmip0CfkaKJPc9g=	\N	f	diadalir@gmail.com	f	2024-06-22 18:11:38.834748+03:30	aaa56529-b639-424c-ba82-bbf7a3bdee6e	dia	\N	dalir	دیا دلیر	09014633716	t	f
37	pbkdf2_sha256$260000$rtr4mv1HHdAW3cZmK4hYcY$G99C0/k/ZwF/cvFeC3qiE2Co0KjgqZmJkGlB2+CE1PM=	2024-06-27 22:13:54.233326+03:30	f	zsh84_myth@yahoo.com	f	2024-06-19 17:02:33.343078+03:30	cec10b82-2d7a-4aa9-99d6-db2d97aa64ed	zsh84myth	\N	ایمان	فردائی	09163721198	t	f
34	pbkdf2_sha256$260000$gQMEkdX7TUkmx0gqc7uCjc$wT4utsr0zFmEGu2X7G5v6V3JsaLfkyw4uW6V6RpfXMY=	2024-06-27 19:52:31.830666+03:30	f	Bzvahva@gmail.com	f	2024-06-17 16:48:14.413923+03:30	ad4b6c3f-25a9-44b4-ae04-3cb402222c41	abi	\N	Ahmad	Ahmade	090000000	t	f
45	pbkdf2_sha256$260000$fr5aTtdv5ABW3CCZ24xpwE$mu+dyc4GqzyqD0bL0BkTtxcKmYZh8CDmy8ZUk88OL0w=	2024-06-26 20:00:52.899201+03:30	f	Mamadabedi73@gmail.com	f	2024-06-26 20:00:36.967857+03:30	d9ac7031-cec1-4d0b-8a99-b039d9bdb6dc	mamad	\N	mohmad	Abdi	Mamadabedi73@gmail.com	t	f
29	pbkdf2_sha256$260000$lCPRPqrSRcy2BYLc8f4Gjo$YPxC0mbXvMULYjuAoMf2zjjPygMcTHJkf6qfYeZmt3o=	2024-06-28 13:25:45.460476+03:30	f	miladzmf00@gmail.com	f	2024-06-06 13:45:17.148728+03:30	54e62da1-424c-4ccd-bfc7-8332187a77a5	miladzmf00	\N	میلاد	زاهدی	09380446715	t	f
\.


--
-- Data for Name: auctions_user_groups; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Name: auctions_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_user_groups_id_seq', 1, false);


--
-- Name: auctions_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_user_id_seq', 48, true);


--
-- Data for Name: auctions_user_level1; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_user_level1 (id, from_user_id, to_user_id) FROM stdin;
\.


--
-- Name: auctions_user_level1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_user_level1_id_seq', 1, false);


--
-- Data for Name: auctions_user_level2; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_user_level2 (id, from_user_id, to_user_id) FROM stdin;
\.


--
-- Name: auctions_user_level2_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_user_level2_id_seq', 1, false);


--
-- Data for Name: auctions_user_level3; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_user_level3 (id, from_user_id, to_user_id) FROM stdin;
\.


--
-- Name: auctions_user_level3_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_user_level3_id_seq', 1, false);


--
-- Data for Name: auctions_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: auctions_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_user_user_permissions_id_seq', 1, false);


--
-- Data for Name: auctions_verify; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_verify (id, mobilev, mobilec, emailv, emailc, melliv, bankv, user_id) FROM stdin;
\.


--
-- Name: auctions_verify_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_verify_id_seq', 1, false);


--
-- Data for Name: auctions_wallet; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auctions_wallet (id, amount, currency_id, user_id) FROM stdin;
9	106	9	29
5	6107	6	17
14	2	17	29
10	5.65999999999999659	14	29
33	1.30000000000000004	8	31
32	0	6	30
21	0.604999999999989768	6	29
17	4.1078251911130792e-14	16	29
12	0.281200000000000117	21	29
28	0.00152370585996049039	2	29
31	0.00136686144408274565	2	34
6	0.00738869977689476497	2	17
1	0.00865848063320011699	2	1
2	1916.29999999999995	6	1
34	98	17	31
30	620	6	34
35	18	16	31
\.


--
-- Name: auctions_wallet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auctions_wallet_id_seq', 35, true);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auth_group (id, name) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auth_group_id_seq', 1, false);


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auth_group_permissions_id_seq', 1, false);


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add user	1	add_user
2	Can change user	1	change_user
3	Can delete user	1	delete_user
4	Can view user	1	view_user
5	Can add act	2	add_act
6	Can change act	2	change_act
7	Can delete act	2	delete_act
8	Can view act	2	view_act
9	Can add banner	3	add_banner
10	Can change banner	3	change_banner
11	Can delete banner	3	delete_banner
12	Can view banner	3	view_banner
13	Can add bazdid	4	add_bazdid
14	Can change bazdid	4	change_bazdid
15	Can delete bazdid	4	delete_bazdid
16	Can view bazdid	4	view_bazdid
17	Can add blog	5	add_blog
18	Can change blog	5	change_blog
19	Can delete blog	5	delete_blog
20	Can view blog	5	view_blog
21	Can add cat	6	add_cat
22	Can change cat	6	change_cat
23	Can delete cat	6	delete_cat
24	Can view cat	6	view_cat
25	Can add currencies	7	add_currencies
26	Can change currencies	7	change_currencies
27	Can delete currencies	7	delete_currencies
28	Can view currencies	7	view_currencies
29	Can add details	8	add_details
30	Can change details	8	change_details
31	Can delete details	8	delete_details
32	Can view details	8	view_details
33	Can add elan	9	add_elan
34	Can change elan	9	change_elan
35	Can delete elan	9	delete_elan
36	Can view elan	9	view_elan
37	Can add forget	10	add_forget
38	Can change forget	10	change_forget
39	Can delete forget	10	delete_forget
40	Can view forget	10	view_forget
41	Can add general	11	add_general
42	Can change general	11	change_general
43	Can delete general	11	delete_general
44	Can view general	11	view_general
45	Can add miners	12	add_miners
46	Can change miners	12	change_miners
47	Can delete miners	12	delete_miners
48	Can view miners	12	view_miners
49	Can add news	13	add_news
50	Can change news	13	change_news
51	Can delete news	13	delete_news
52	Can view news	13	view_news
53	Can add pages	14	add_pages
54	Can change pages	14	change_pages
55	Can delete pages	14	delete_pages
56	Can view pages	14	view_pages
57	Can add plans	15	add_plans
58	Can change plans	15	change_plans
59	Can delete plans	15	delete_plans
60	Can view plans	15	view_plans
61	Can add post	16	add_post
62	Can change post	16	change_post
63	Can delete post	16	delete_post
64	Can view post	16	view_post
65	Can add product	17	add_product
66	Can change product	17	change_product
67	Can delete product	17	delete_product
68	Can view product	17	view_product
69	Can add product order	18	add_productorder
70	Can change product order	18	change_productorder
71	Can delete product order	18	delete_productorder
72	Can view product order	18	view_productorder
73	Can add settings	19	add_settings
74	Can change settings	19	change_settings
75	Can delete settings	19	delete_settings
76	Can view settings	19	view_settings
77	Can add tickets	20	add_tickets
78	Can change tickets	20	change_tickets
79	Can delete tickets	20	delete_tickets
80	Can view tickets	20	view_tickets
81	Can add wallet	21	add_wallet
82	Can change wallet	21	change_wallet
83	Can delete wallet	21	delete_wallet
84	Can view wallet	21	view_wallet
85	Can add verify	22	add_verify
86	Can change verify	22	change_verify
87	Can delete verify	22	delete_verify
88	Can view verify	22	view_verify
89	Can add transactions	23	add_transactions
90	Can change transactions	23	change_transactions
91	Can delete transactions	23	delete_transactions
92	Can view transactions	23	view_transactions
93	Can add subjects	24	add_subjects
94	Can change subjects	24	change_subjects
95	Can delete subjects	24	delete_subjects
96	Can view subjects	24	view_subjects
97	Can add rented miner	25	add_rentedminer
98	Can change rented miner	25	change_rentedminer
99	Can delete rented miner	25	delete_rentedminer
100	Can view rented miner	25	view_rentedminer
101	Can add profitlist	26	add_profitlist
102	Can change profitlist	26	change_profitlist
103	Can delete profitlist	26	delete_profitlist
104	Can view profitlist	26	view_profitlist
105	Can add job	27	add_job
106	Can change job	27	change_job
107	Can delete job	27	delete_job
108	Can view job	27	view_job
109	Can add bid	28	add_bid
110	Can change bid	28	change_bid
111	Can delete bid	28	delete_bid
112	Can view bid	28	view_bid
113	Can add askamountreq	29	add_askamountreq
114	Can change askamountreq	29	change_askamountreq
115	Can delete askamountreq	29	delete_askamountreq
116	Can view askamountreq	29	view_askamountreq
117	Can add adminverifymelli	30	add_adminverifymelli
118	Can change adminverifymelli	30	change_adminverifymelli
119	Can delete adminverifymelli	30	delete_adminverifymelli
120	Can view adminverifymelli	30	view_adminverifymelli
121	Can add adminverifybank	31	add_adminverifybank
122	Can change adminverifybank	31	change_adminverifybank
123	Can delete adminverifybank	31	delete_adminverifybank
124	Can view adminverifybank	31	view_adminverifybank
125	Can add addamountreq	32	add_addamountreq
126	Can change addamountreq	32	change_addamountreq
127	Can delete addamountreq	32	delete_addamountreq
128	Can view addamountreq	32	view_addamountreq
129	Can add permission	33	add_permission
130	Can change permission	33	change_permission
131	Can delete permission	33	delete_permission
132	Can view permission	33	view_permission
133	Can add group	34	add_group
134	Can change group	34	change_group
135	Can delete group	34	delete_group
136	Can view group	34	view_group
137	Can add content type	35	add_contenttype
138	Can change content type	35	change_contenttype
139	Can delete content type	35	delete_contenttype
140	Can view content type	35	view_contenttype
141	Can add chat user	36	add_chatuser
142	Can change chat user	36	change_chatuser
143	Can delete chat user	36	delete_chatuser
144	Can view chat user	36	view_chatuser
145	Can add chat session	37	add_chatsession
146	Can change chat session	37	change_chatsession
147	Can delete chat session	37	delete_chatsession
148	Can view chat session	37	view_chatsession
149	Can add chat session message	38	add_chatsessionmessage
150	Can change chat session message	38	change_chatsessionmessage
151	Can delete chat session message	38	delete_chatsessionmessage
152	Can view chat session message	38	view_chatsessionmessage
153	Can add chat room	39	add_chatroom
154	Can change chat room	39	change_chatroom
155	Can delete chat room	39	delete_chatroom
156	Can view chat room	39	view_chatroom
157	Can add chat text	40	add_chattext
158	Can change chat text	40	change_chattext
159	Can delete chat text	40	delete_chattext
160	Can view chat text	40	view_chattext
161	Can add log entry	41	add_logentry
162	Can change log entry	41	change_logentry
163	Can delete log entry	41	delete_logentry
164	Can view log entry	41	view_logentry
165	Can add session	42	add_session
166	Can change session	42	change_session
167	Can delete session	42	delete_session
168	Can view session	42	view_session
169	Can add Token	43	add_token
170	Can change Token	43	change_token
171	Can delete Token	43	delete_token
172	Can view Token	43	view_token
173	Can add Token	44	add_tokenproxy
174	Can change Token	44	change_tokenproxy
175	Can delete Token	44	delete_tokenproxy
176	Can view Token	44	view_tokenproxy
177	Can add notification	45	add_notification
178	Can change notification	45	change_notification
179	Can delete notification	45	delete_notification
180	Can view notification	45	view_notification
181	Can add transaction	46	add_transaction
182	Can change transaction	46	change_transaction
183	Can delete transaction	46	delete_transaction
184	Can view transaction	46	view_transaction
185	Can add app settings	47	add_appsettings
186	Can change app settings	47	change_appsettings
187	Can delete app settings	47	delete_appsettings
188	Can view app settings	47	view_appsettings
189	Can add timer	48	add_timer
190	Can change timer	48	change_timer
191	Can delete timer	48	delete_timer
192	Can view timer	48	view_timer
\.


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('auth_permission_id_seq', 192, true);


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY authtoken_token (key, created, user_id) FROM stdin;
28be5bb7997f6d981e176e26a53c2614870a5613	2024-05-21 11:27:09.822187+03:30	1
3833c2a2ba768fcae76610c076dbfbe07c6d17e0	2024-05-25 21:21:52.350767+03:30	5
f5b27bbec07895c8ecfa834381882fce785fbd42	2024-05-27 00:26:02.224256+03:30	6
ddc7656913af72cb9c0ca458ae31013763cb71eb	2024-05-29 18:09:26.179681+03:30	12
ac4277a807e999eb0a6e07ff89d7b45db88c7431	2024-05-31 15:33:44.271226+03:30	14
627c6a34fd44729587719c2c533d21b02bfc0426	2024-05-31 16:09:05.006574+03:30	13
86cc319c466f7534ec9dc1a831bcfd4aee82cc3e	2024-05-31 16:42:56.315585+03:30	16
cba9e65fea15ec9e25237a36a586a10628202a18	2024-06-02 00:19:25.399113+03:30	17
5b56adbf8faf4635c1383583c84eef7004fc0eaf	2024-06-06 13:45:29.952021+03:30	29
bb66c77f7735263e9d38ba81f0bfb897a2007200	2024-06-06 18:10:47.927287+03:30	30
2d4c264ff8232843172ad117b6f4e55d3408fb1b	2024-06-12 18:28:02.401409+03:30	31
8e06275eb18bfb0ec6f00b7b807f9ca9098a9116	2024-06-17 16:48:26.212704+03:30	34
a692f7357de5ddb239e4a70378b54573e2123f5b	2024-06-17 17:52:24.200927+03:30	36
bf3b52d20d8c6d413958b03732ff8b17ceb1c0d4	2024-06-19 17:03:10.31318+03:30	37
befd533792a51c99c2e11af10410ee6ae98ce45c	2024-06-19 22:27:39.158039+03:30	38
502bc08d91c6e84f7e9c93c078ff03b45a750d2b	2024-06-20 10:23:26.987575+03:30	39
81bd92fbd406ddfef3a101863678ffa155e6557c	2024-06-22 10:31:40.885281+03:30	40
715c60bf51a68f4c8d0c1e546e9489e0b44057e7	2024-06-22 15:53:31.323894+03:30	41
ba6914681d583ca45aea5bc6f7999e02b459e608	2024-06-22 18:21:11.84278+03:30	44
4bbc9ab7c854275754041d9700c4b98b8dc38f57	2024-06-23 20:11:39.44875+03:30	42
b9b9ca7c902db3e99bb77eb4f6e6e142f2b46c00	2024-06-26 20:00:52.897615+03:30	45
806cb76dc5a2098a86a8f9c04183bfc97a881dde	2024-06-27 21:29:12.691148+03:30	47
6dce712cca11fe42a5e49a32d5662485686e11ce	2024-06-29 00:02:40.777191+03:30	48
\.


--
-- Data for Name: chat_chatroom; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY chat_chatroom (id, date, last_update, read1, read2, unread1, unread2, user1_id, user2_id) FROM stdin;
\.


--
-- Name: chat_chatroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('chat_chatroom_id_seq', 1, false);


--
-- Data for Name: chat_chatsession; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY chat_chatsession (id, create_date, update_date, name, username, uri, owner_id) FROM stdin;
1	2024-05-21 11:36:03.881797+03:30	2024-05-21 11:36:03.881817+03:30	\N	\N	854f8e4e18a8496	1
2	2024-05-23 11:30:03.108639+03:30	2024-05-23 11:30:03.108682+03:30	\N	\N	dbd2b2a3a9a04e1	2
3	2024-05-24 21:46:59.705629+03:30	2024-05-24 21:46:59.705667+03:30	\N	\N	3867b6b101d6478	3
4	2024-05-24 21:46:59.706209+03:30	2024-05-24 21:46:59.70624+03:30	\N	\N	acf727d38f3a450	4
5	2024-05-25 11:12:45.91376+03:30	2024-05-25 11:12:45.91378+03:30	\N	\N	5bdd7fef1764472	5
6	2024-05-25 23:47:13.858071+03:30	2024-05-25 23:47:13.858104+03:30	\N	\N	62008a40f079411	6
7	2024-05-25 23:57:49.677302+03:30	2024-05-25 23:57:49.677332+03:30	\N	\N	89bbd4cf0abe4da	7
8	2024-05-26 00:10:23.156761+03:30	2024-05-26 00:10:23.156803+03:30	\N	\N	0a9c2903e049460	8
9	2024-05-27 10:17:22.008411+03:30	2024-05-27 10:17:22.008431+03:30	\N	\N	665931d7f954475	9
10	2024-05-27 16:11:05.546364+03:30	2024-05-27 16:11:05.546383+03:30	\N	\N	da7e0c37c422400	10
11	2024-05-27 18:55:40.809642+03:30	2024-05-27 18:55:40.809679+03:30	\N	\N	f434d953e7a9473	11
12	2024-05-28 12:41:56.656712+03:30	2024-05-28 12:41:56.656762+03:30	\N	\N	ee39576c77ce46e	12
13	2024-05-28 16:04:25.662538+03:30	2024-05-28 16:04:25.662557+03:30	\N	\N	e14da5c60cd44c1	13
14	2024-05-28 16:06:27.592465+03:30	2024-05-28 16:06:27.592483+03:30	\N	\N	9d739e7cda2145a	14
15	2024-05-28 16:32:55.706555+03:30	2024-05-28 16:32:55.70662+03:30	\N	\N	f7284f771a85437	15
16	2024-05-29 22:41:31.20086+03:30	2024-05-29 22:41:31.200921+03:30	\N	\N	be23eda8e140435	16
17	2024-05-30 16:10:42.680451+03:30	2024-05-30 16:10:42.680505+03:30	\N	\N	f9270dff125d42e	17
18	2024-05-31 14:36:26.416027+03:30	2024-05-31 14:36:26.41606+03:30	\N	\N	e4ea0c0bca2a40b	18
19	2024-06-01 10:48:16.193964+03:30	2024-06-01 10:48:16.194008+03:30	\N	\N	d15b2d28936048b	19
20	2024-06-01 15:06:54.576148+03:30	2024-06-01 15:06:54.576182+03:30	\N	\N	6445e1f5b771490	20
21	2024-06-02 00:27:12.433286+03:30	2024-06-02 00:27:12.433345+03:30	\N	\N	3a7fff21773b453	21
22	2024-06-02 13:49:49.34707+03:30	2024-06-02 13:49:49.347109+03:30	\N	\N	54e2213c74d04b3	22
23	2024-06-06 13:48:18.842319+03:30	2024-06-06 13:48:18.842359+03:30	\N	\N	a5fdcf64fc8d447	23
24	2024-06-06 18:11:37.537045+03:30	2024-06-06 18:11:37.537101+03:30	\N	\N	4af365cb5d7a4eb	24
25	2024-06-12 18:28:49.256324+03:30	2024-06-12 18:28:49.256379+03:30	\N	\N	ff0bf84d1ace4d7	25
26	2024-06-14 18:55:46.961697+03:30	2024-06-14 18:55:46.961741+03:30	\N	\N	92ac6f81496d48a	26
27	2024-06-16 18:26:31.267331+03:30	2024-06-16 18:26:31.267367+03:30	\N	\N	4b2dda07029a428	27
28	2024-06-17 16:48:32.221587+03:30	2024-06-17 16:48:32.221622+03:30	\N	\N	a7f4eebb51c14d8	28
29	2024-06-19 14:32:42.31657+03:30	2024-06-19 14:32:42.316655+03:30	\N	\N	afbf9f80a7804fd	29
30	2024-06-19 16:56:52.73524+03:30	2024-06-19 16:56:52.735298+03:30	\N	\N	d6571cc694154ce	30
31	2024-06-19 22:27:54.287177+03:30	2024-06-19 22:27:54.287219+03:30	\N	\N	9ba4f3c29d22405	31
32	2024-06-20 10:24:40.295053+03:30	2024-06-20 10:24:40.29509+03:30	\N	\N	5c8e804e02aa4bc	32
33	2024-06-22 15:20:25.93792+03:30	2024-06-22 15:20:25.937987+03:30	\N	\N	baa686b8560b4c1	33
34	2024-06-22 15:25:39.362833+03:30	2024-06-22 15:25:39.36287+03:30	\N	\N	dab1c6dbb7884a4	34
35	2024-06-22 16:26:32.545929+03:30	2024-06-22 16:26:32.545987+03:30	\N	\N	9498e189e852468	35
36	2024-06-22 18:22:30.088932+03:30	2024-06-22 18:22:30.088972+03:30	\N	\N	3e55ff0aa06b48c	36
37	2024-06-26 20:01:18.231545+03:30	2024-06-26 20:01:18.231594+03:30	\N	\N	ce5b1f3bc28d486	37
38	2024-06-27 21:31:20.664314+03:30	2024-06-27 21:31:20.664366+03:30	\N	\N	ad715da88f5647d	38
39	2024-06-29 00:03:04.865984+03:30	2024-06-29 00:03:04.86603+03:30	\N	\N	90d7b324be87446	39
\.


--
-- Name: chat_chatsession_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('chat_chatsession_id_seq', 39, true);


--
-- Data for Name: chat_chatsessionmessage; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY chat_chatsessionmessage (id, create_date, update_date, message, seen, aseen, chat_session_id, user_id) FROM stdin;
31	2024-05-28 16:08:39.772549+03:30	2024-05-31 15:29:31.653738+03:30	hello	t	t	14	14
27	2024-05-28 16:06:30.270916+03:30	2024-05-31 15:29:31.654633+03:30	hi	t	t	14	14
28	2024-05-28 16:06:50.250505+03:30	2024-05-31 15:29:31.655455+03:30	hi	t	t	14	14
26	2024-05-28 16:06:03.412067+03:30	2024-06-15 17:33:56.496004+03:30	hi	f	t	1	1
23	2024-05-28 16:04:18.868939+03:30	2024-06-15 17:33:56.498256+03:30	hihi	f	t	1	1
1	2024-05-23 11:30:42.228492+03:30	2024-06-08 00:20:17.713856+03:30	سلام سایت کی وصل میشه؟ واریزی و برداشت حساب دارم	t	t	2	2
65	2024-05-31 15:11:27.695254+03:30	2024-06-21 12:43:44.239435+03:30	اپدیت شما تموم شد؟	t	t	18	18
2	2024-05-23 11:31:05.656505+03:30	2024-06-08 00:20:17.715202+03:30	آپدیت سایت دقیقا کی تموم میشه؟	t	t	2	2
7	2024-05-26 09:38:50.982664+03:30	2024-06-08 00:20:17.715979+03:30	جوابی ازتون نگرفتم؟!!	t	t	2	2
8	2024-05-27 09:17:59.389235+03:30	2024-06-08 00:20:17.716779+03:30	چرا  کسی جواب نمیده؟	t	t	2	2
64	2024-05-31 15:10:41.162765+03:30	2024-06-21 12:43:44.240401+03:30	سلام خوبین؟	t	t	18	18
6	2024-05-25 11:12:58.014516+03:30	2024-06-02 00:00:07.911847+03:30	سحی	t	t	5	5
32	2024-05-28 16:09:17.676315+03:30	2024-05-31 15:29:31.656249+03:30	hi	t	t	14	14
10	2024-05-27 18:59:43.429297+03:30	2024-06-02 00:04:36.760732+03:30	حتی مجدد تایپ میکنم ایمیل و رمز ورود بعد تصویر امنیتی را که پازل باشه درست در جای خالی میگذارم باز مجدد گیر میکنه و داخل داشبورد حسابم نمیشه؟؟!!	t	t	11	11
56	2024-05-31 15:10:37.293579+03:30	2024-06-21 12:43:44.241287+03:30	سلام خوبین؟	t	t	18	18
37	2024-05-30 17:04:41.150573+03:30	2024-06-02 00:04:29.310846+03:30	,خهکخمهننحخکن	t	t	17	17
38	2024-05-30 17:14:22.461673+03:30	2024-06-02 00:04:29.311665+03:30	aaa	t	t	17	17
20	2024-05-28 16:00:57.984713+03:30	2024-05-28 16:08:15.277865+03:30	hihi	t	t	9	9
21	2024-05-28 16:01:31.200621+03:30	2024-05-28 16:08:15.279098+03:30	kll;hihi	t	t	9	9
60	2024-05-31 15:10:41.052048+03:30	2024-06-21 12:43:44.242134+03:30	سلام خوبین؟	t	t	18	18
59	2024-05-31 15:10:38.249311+03:30	2024-06-21 12:43:44.243044+03:30	سلام خوبین؟	t	t	18	18
63	2024-05-31 15:10:41.107488+03:30	2024-06-21 12:43:44.24391+03:30	سلام خوبین؟	t	t	18	18
62	2024-05-31 15:10:41.097018+03:30	2024-06-21 12:43:44.244741+03:30	سلام خوبین؟	t	t	18	18
22	2024-05-28 16:02:01.724943+03:30	2024-05-28 16:08:15.280155+03:30	kll;hihip['	t	t	9	9
12	2024-05-28 15:55:55.638521+03:30	2024-05-28 16:08:15.281131+03:30	hi	t	t	9	9
13	2024-05-28 15:56:51.114581+03:30	2024-05-28 16:08:15.281961+03:30	hi	t	t	9	9
14	2024-05-28 15:57:24.788841+03:30	2024-05-28 16:08:15.282875+03:30	hihi	t	t	9	9
15	2024-05-28 15:58:13.495568+03:30	2024-05-28 16:08:15.283686+03:30	hi	t	t	9	9
16	2024-05-28 15:58:52.856009+03:30	2024-05-28 16:08:15.284468+03:30	hi	t	t	9	9
17	2024-05-28 15:59:40.447744+03:30	2024-05-28 16:08:15.285328+03:30	hi	t	t	9	9
18	2024-05-28 16:00:09.665764+03:30	2024-05-28 16:08:15.286098+03:30	hi	t	t	9	9
19	2024-05-28 16:00:49.13523+03:30	2024-05-28 16:08:15.286882+03:30	hihi	t	t	9	9
30	2024-05-28 16:08:19.952475+03:30	2024-05-28 16:08:19.952496+03:30	hi	f	t	9	9
58	2024-05-31 15:10:37.585637+03:30	2024-06-21 12:43:44.245619+03:30	سلام خوبین؟	t	t	18	18
55	2024-05-31 15:10:37.040736+03:30	2024-06-21 12:43:44.246452+03:30	سلام خوبین؟	t	t	18	18
29	2024-05-28 16:08:02.652269+03:30	2024-05-31 15:29:31.649501+03:30	hi	t	t	14	14
4	2024-05-25 11:12:49.491586+03:30	2024-06-02 00:00:07.913352+03:30	سلام	t	t	5	5
5	2024-05-25 11:12:56.721005+03:30	2024-06-02 00:00:07.914345+03:30	تیشخهعب	t	t	5	5
57	2024-05-31 15:10:37.399379+03:30	2024-06-21 12:43:44.247297+03:30	سلام خوبین؟	t	t	18	18
54	2024-05-31 15:10:36.605161+03:30	2024-06-21 12:43:44.248107+03:30	سلام خوبین؟	t	t	18	18
11	2024-05-28 12:42:36.279524+03:30	2024-06-10 23:27:52.224981+03:30	سلام سایت کلا بسته شد تکلیف سرمایه ما چیشد	t	t	12	12
25	2024-05-28 16:05:33.827802+03:30	2024-06-11 23:38:52.122388+03:30	hi	f	t	13	13
33	2024-05-28 16:33:20.90438+03:30	2024-06-15 19:49:36.193828+03:30	سلام وقت بخیر سایت راما بیت چرا بالا نمیاد	t	t	15	15
67	2024-06-01 10:48:23.084235+03:30	2024-06-14 15:55:08.104353+03:30	slm	t	t	19	19
68	2024-06-01 10:48:25.108452+03:30	2024-06-14 15:55:08.105283+03:30	slm	t	t	19	19
78	2024-06-01 18:49:50.45298+03:30	2024-06-14 15:55:08.106125+03:30	چرا نمیتونم وارد پنل کاربریم شم ؟	t	t	19	19
69	2024-06-01 10:48:26.049662+03:30	2024-06-14 15:55:08.106911+03:30	slm	t	t	19	19
71	2024-06-01 10:48:26.421424+03:30	2024-06-14 15:55:08.107714+03:30	slm	t	t	19	19
72	2024-06-01 10:48:29.823811+03:30	2024-06-14 15:55:08.108496+03:30	slm	t	t	19	19
73	2024-06-01 10:48:32.60667+03:30	2024-06-14 15:55:08.109311+03:30	slm	t	t	19	19
74	2024-06-01 10:48:35.275458+03:30	2024-06-14 15:55:08.11022+03:30	slm	t	t	19	19
75	2024-06-01 10:48:35.432726+03:30	2024-06-14 15:55:08.110983+03:30	slm	t	t	19	19
77	2024-06-01 18:10:17.383558+03:30	2024-06-12 18:48:31.954922+03:30	salam	t	t	20	20
34	2024-05-30 16:46:57.61184+03:30	2024-06-02 00:04:29.307789+03:30	/kkzxjlflsdjflisdjfksdkfjds	t	t	17	17
61	2024-05-31 15:10:41.065644+03:30	2024-06-21 12:43:44.238139+03:30	سلام خوبین؟	t	t	18	18
35	2024-05-30 16:47:16.643207+03:30	2024-06-02 00:04:29.309065+03:30	g/kljgdfkljklfjgldf	f	t	17	1
82	2024-06-02 00:00:57.785377+03:30	2024-06-10 23:27:52.226427+03:30	سلام عرض ادب بسته نشده قربان تحت مدیریت جدید و سایت جدید انجام میشه	f	t	12	12
24	2024-05-28 16:04:54.274439+03:30	2024-06-11 23:38:52.121193+03:30	hi	f	t	13	13
36	2024-05-30 17:04:17.353506+03:30	2024-06-02 00:04:29.309989+03:30	.klhjjhlkjyhkuhljkhk.hjlkh	f	t	17	1
39	2024-05-30 17:15:27.767999+03:30	2024-06-02 00:04:29.312482+03:30	dddd	t	t	17	17
40	2024-05-30 17:17:29.14997+03:30	2024-06-02 00:04:29.313336+03:30	hh	t	t	17	17
41	2024-05-30 17:18:34.832391+03:30	2024-06-02 00:04:29.314135+03:30	hh	t	t	17	17
42	2024-05-30 17:19:04.520775+03:30	2024-06-02 00:04:29.314937+03:30	dddfgjj	t	t	17	17
43	2024-05-30 17:21:02.78795+03:30	2024-06-02 00:04:29.315715+03:30	lkhgxzadfvcghh	t	t	17	17
44	2024-05-30 17:21:09.970675+03:30	2024-06-02 00:04:29.316503+03:30	lkhgxzadfvcghh	t	t	17	17
45	2024-05-30 17:22:23.331413+03:30	2024-06-02 00:04:29.317324+03:30	ncncnfjf	t	t	17	17
46	2024-05-30 17:23:52.876654+03:30	2024-06-02 00:04:29.318282+03:30	gggghy	t	t	17	17
47	2024-05-30 17:25:26.682524+03:30	2024-06-02 00:04:29.319103+03:30	gcdyhkogd	t	t	17	17
48	2024-05-30 17:25:27.052146+03:30	2024-06-02 00:04:29.31989+03:30	gcdyhkogd	t	t	17	17
49	2024-05-30 17:25:52.225562+03:30	2024-06-02 00:04:29.320689+03:30	lkhgdانناللاتنن	t	t	17	17
50	2024-05-30 17:26:01.669688+03:30	2024-06-02 00:04:29.321568+03:30	lkhgdانناللاتنن	t	t	17	17
51	2024-05-30 17:26:34.65443+03:30	2024-06-02 00:04:29.322566+03:30	االللتت	t	t	17	17
52	2024-05-30 17:27:25.625796+03:30	2024-06-02 00:04:29.323363+03:30	ل آن لزذتتببل	t	t	17	17
53	2024-05-30 17:41:29.187558+03:30	2024-06-02 00:04:29.324155+03:30	الان با	t	t	17	17
79	2024-06-01 20:01:37.245763+03:30	2024-06-02 00:04:29.324992+03:30	heheh	t	t	17	17
80	2024-06-01 20:08:36.073822+03:30	2024-06-02 00:04:29.325854+03:30	svdvdb\n	t	t	17	17
81	2024-06-01 20:18:33.564277+03:30	2024-06-02 00:04:29.326663+03:30	fghgf	t	t	17	17
3	2024-05-24 17:10:22.730215+03:30	2024-06-15 17:33:56.493613+03:30	hi	t	t	1	1
66	2024-06-01 10:48:21.941528+03:30	2024-06-14 15:55:08.098915+03:30	slm	t	t	19	19
9	2024-05-27 18:57:51.000885+03:30	2024-06-02 00:04:36.759351+03:30	سلام ایمیل و پسورد سیو شده در کامپیوتر ام قبل آپدیت با همان ایمیل و کاربری وارد داشبورد خودم میشدم الان میزنم بعد تصویر امنیتی درست انتخاب میکنم گیر میکنه وارد حسابم نمیشه؟؟!!!	t	t	11	11
88	2024-06-02 00:04:54.783676+03:30	2024-06-02 00:04:54.783696+03:30	با سلام لطفا با پشتیبانی سایت در ارتباط باشید 	f	t	11	11
89	2024-06-02 00:05:06.440897+03:30	2024-06-02 00:05:06.440918+03:30	@ramabitsup	f	t	11	11
102	2024-06-08 18:00:21.259124+03:30	2024-06-21 12:43:44.249797+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
103	2024-06-08 18:00:22.360575+03:30	2024-06-21 12:43:44.251453+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
87	2024-06-02 00:02:57.115815+03:30	2024-06-14 15:55:08.113465+03:30	@ramabitsup	t	t	19	19
70	2024-06-01 10:48:26.243374+03:30	2024-06-14 15:55:08.114243+03:30	slm	t	t	19	19
83	2024-06-02 00:01:55.084325+03:30	2024-06-10 23:27:52.227301+03:30	شما میتونید جهت هاهنگی برای پیگیری اکانت با آیدی پشتیبانی در ارتباط باشید 	f	t	12	12
84	2024-06-02 00:02:06.033433+03:30	2024-06-10 23:27:52.228121+03:30	@ramabitsup	f	t	12	12
76	2024-06-01 10:49:16.26097+03:30	2024-06-14 15:55:08.114987+03:30	چرا نمیتونم وارد پنل کاربریم شم ؟	t	t	19	19
106	2024-06-08 18:00:23.367333+03:30	2024-06-21 12:43:44.252293+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
98	2024-06-06 19:39:39.39488+03:30	2024-06-25 00:23:50.603248+03:30	بله مبلغ سود که مشاهده میکنید به انضمام هزینه ای که ابتدای دوره پرداخت میکنید	t	t	24	24
132	2024-06-10 23:35:50.147271+03:30	2024-06-20 12:41:56.560566+03:30	پوارطلهعذبق بیخع یج هی	t	t	21	21
85	2024-06-02 00:02:45.781133+03:30	2024-06-14 15:55:08.111754+03:30	با سلام لطفا برای پیگیری اکانت با آیدی پشتیبانی در ارتباط باشید	t	t	19	19
128	2024-06-10 23:35:02.538257+03:30	2024-06-20 12:41:56.561326+03:30	سیبنا ب	t	t	21	21
93	2024-06-06 15:55:40.438842+03:30	2024-06-08 10:05:38.398488+03:30	آیدی پشتیبانی را مینویسید؟	t	t	4	4
94	2024-06-06 15:55:41.741784+03:30	2024-06-08 10:05:38.399905+03:30	آیدی پشتیبانی را مینویسید؟	t	t	4	4
99	2024-06-06 20:45:31.111882+03:30	2024-06-08 10:05:38.400814+03:30	از قسمت ارتباط با ما بردارید	t	t	4	4
131	2024-06-10 23:35:49.966188+03:30	2024-06-20 12:41:56.562099+03:30	پوارطلهعذبق بیخع یج هی	t	t	21	21
105	2024-06-08 18:00:23.365412+03:30	2024-06-21 12:43:44.250645+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
100	2024-06-08 00:20:37.413017+03:30	2024-06-08 00:20:37.413038+03:30	سلام عرض ادب و احترام	f	t	2	2
101	2024-06-08 00:21:40.791575+03:30	2024-06-08 00:21:40.791596+03:30	شما میتونین باپشتیبانی تلگرام تا زمان تکمیل آ‍پدیت در ارتباط باشید	f	t	2	2
97	2024-06-06 19:38:58.491743+03:30	2024-06-25 00:23:50.599818+03:30	درود	t	t	24	24
121	2024-06-10 18:04:08.213826+03:30	2024-06-28 18:19:30.700788+03:30	درود ظاهرا بنده هیچ یک از پلن های خودمونمیتونم ببندم؟	t	t	23	23
91	2024-06-02 00:06:31.390565+03:30	2024-06-15 19:49:36.195212+03:30	برای توضیحات تکمیلی با پشتیبانی در ارتباط باشید	f	t	15	15
104	2024-06-08 18:00:22.785604+03:30	2024-06-21 12:43:44.248955+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
95	2024-06-06 18:32:41.09528+03:30	2024-06-25 00:23:50.601204+03:30	سلام عزیزم هنگام برداشت اصل پول رو هم بهمون میدید 	t	t	24	24
96	2024-06-06 18:33:09.221752+03:30	2024-06-25 00:23:50.602376+03:30	ن درصد سودی که نوشتید با اصل دوره یا فقط سود پول هست 	t	t	24	24
92	2024-06-02 00:06:47.325774+03:30	2024-06-15 19:49:36.196256+03:30	@ramabitsup	f	t	15	15
90	2024-06-02 00:06:13.725895+03:30	2024-06-15 19:49:36.197148+03:30	سلام عرض ادب بعد از آپدیت و تکمیل کار میتونید پیگیری کنید	f	t	15	15
86	2024-06-02 00:02:47.774478+03:30	2024-06-14 15:55:08.112704+03:30	با سلام لطفا برای پیگیری اکانت با آیدی پشتیبانی در ارتباط باشید	t	t	19	19
129	2024-06-10 23:35:09.29504+03:30	2024-06-20 12:41:56.558626+03:30	ه بهعبه بهدبهب بگدی بیحکخ  یا 	t	t	21	21
127	2024-06-10 23:34:55.490113+03:30	2024-06-20 12:41:56.55976+03:30	پلرذر	t	t	21	21
123	2024-06-10 23:27:05.03638+03:30	2024-06-21 12:43:44.254067+03:30	سلام روز بخیر	t	t	18	18
113	2024-06-08 18:00:38.273856+03:30	2024-06-21 12:43:44.255737+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
118	2024-06-08 18:00:54.394707+03:30	2024-06-21 12:43:44.25661+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
114	2024-06-08 18:00:54.054582+03:30	2024-06-21 12:43:44.257425+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
107	2024-06-08 18:00:23.431671+03:30	2024-06-21 12:43:44.258278+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
115	2024-06-08 18:00:54.238547+03:30	2024-06-21 12:43:44.259104+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
110	2024-06-08 18:00:38.227648+03:30	2024-06-21 12:43:44.259959+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
116	2024-06-08 18:00:54.352266+03:30	2024-06-21 12:43:44.260765+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
125	2024-06-10 23:27:31.542946+03:30	2024-06-21 12:43:44.261619+03:30	ق چت آنلاین	t	t	18	18
111	2024-06-08 18:00:38.227812+03:30	2024-06-21 12:43:44.262451+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
120	2024-06-08 18:01:09.004743+03:30	2024-06-21 12:43:44.264172+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
124	2024-06-10 23:27:22.943674+03:30	2024-06-21 12:43:44.265352+03:30	شما باید تیکت ثبت کنید	t	t	18	18
109	2024-06-08 18:00:38.069704+03:30	2024-06-21 12:43:44.266227+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
122	2024-06-10 18:04:41.910635+03:30	2024-06-28 18:19:30.702331+03:30	یک راهنمایی میکنید کدوم پلن های خودمو میتونم ببندم؟ 	t	t	23	23
130	2024-06-10 23:35:39.947259+03:30	2024-06-20 12:41:56.562847+03:30	توغسس	t	t	21	21
117	2024-06-08 18:00:54.382097+03:30	2024-06-21 12:43:44.25311+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
108	2024-06-08 18:00:37.825613+03:30	2024-06-21 12:43:44.254902+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
126	2024-06-10 23:28:45.37744+03:30	2024-06-25 00:23:50.604292+03:30	به طور مثال 	t	t	24	24
119	2024-06-08 18:00:54.445973+03:30	2024-06-21 12:43:44.268+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
142	2024-06-14 00:57:37.810208+03:30	2024-06-18 02:42:00.552093+03:30	وقتتون بخیر 	t	t	25	25
181	2024-06-24 18:27:26.006334+03:30	2024-06-25 00:23:50.607086+03:30	بعد پایان دوره اصل پولی که اجاره کردیم که میدید درسته	t	t	24	24
138	2024-06-12 17:42:31.858618+03:30	2024-06-25 00:23:50.610181+03:30	سود استخراج را به صورت لحظه ای دریافت میکنید	t	t	24	24
182	2024-06-24 18:27:27.303095+03:30	2024-06-25 00:23:50.612923+03:30	بعد پایان دوره اصل پولی که اجاره کردیم که میدید درسته	t	t	24	24
180	2024-06-23 19:54:56.502403+03:30	2024-06-23 19:54:56.502425+03:30	سلام وقت بخیر در خدمتم	f	t	33	1
176	2024-06-22 18:22:39.66892+03:30	2024-06-26 15:54:55.72315+03:30	سلام	t	t	36	36
183	2024-06-24 18:28:01.712228+03:30	2024-06-25 00:23:50.6138+03:30	فهمیدم مرسی	t	t	24	24
164	2024-06-20 16:09:31.275923+03:30	2024-06-28 18:19:30.703506+03:30		t	t	23	23
172	2024-06-22 18:22:38.416104+03:30	2024-06-26 15:54:55.716242+03:30	سلام	t	t	36	36
140	2024-06-14 00:57:11.558943+03:30	2024-06-14 15:55:08.115772+03:30	سلام 	t	t	19	19
171	2024-06-22 18:22:37.946384+03:30	2024-06-26 15:54:55.717656+03:30	سلام	t	t	36	36
173	2024-06-22 18:22:38.843809+03:30	2024-06-26 15:54:55.718584+03:30	سلام	t	t	36	36
170	2024-06-22 15:25:52.527219+03:30	2024-06-23 20:08:53.054635+03:30	سلام وقت بخیر 	t	t	34	34
160	2024-06-16 18:26:34.35477+03:30	2024-06-17 22:11:11.912109+03:30	zC	t	t	27	27
179	2024-06-23 19:54:35.157861+03:30	2024-06-23 20:08:53.055738+03:30	سلام وقت بخیر در خدمتم	f	t	34	1
167	2024-06-21 00:43:47.764333+03:30	2024-06-27 22:16:55.859592+03:30	با این ایدی در تلگرام در ارتباط باشید 	t	t	30	1
161	2024-06-16 18:27:32.895764+03:30	2024-06-17 22:11:11.914868+03:30	mnhfkh	t	t	27	1
143	2024-06-14 00:57:53.727712+03:30	2024-06-18 02:42:00.541169+03:30	من تونستم وارد حسابم بشم 	t	t	25	25
144	2024-06-14 00:58:11.102331+03:30	2024-06-18 02:42:00.543685+03:30	اما تعداد ارزهام خیلی کم شده 	t	t	25	25
145	2024-06-14 00:59:33.719362+03:30	2024-06-18 02:42:00.544575+03:30	تاریخ ثبتم بوده ۵ سپتامبر ۲۰۲۳ اما این زده ۱۲٫۰۶٫۲۰۲۴	t	t	25	25
153	2024-06-15 17:34:00.302456+03:30	2024-06-15 17:34:00.302477+03:30	ghjgj	f	t	1	1
154	2024-06-15 17:34:01.208873+03:30	2024-06-15 17:34:01.208912+03:30	ghjgj	f	t	1	1
146	2024-06-14 00:59:53.516842+03:30	2024-06-18 02:42:00.545502+03:30	لطفا راهنماییم میکنید که مشکل از کجاست ؟ 	t	t	25	25
147	2024-06-14 01:00:17.320562+03:30	2024-06-18 02:42:00.546411+03:30	من اتم ۵۹۱.۷ تا داشتم 	t	t	25	25
133	2024-06-12 17:36:09.868689+03:30	2024-06-28 18:19:30.704526+03:30	با سلام 	t	t	23	23
163	2024-06-19 16:57:27.30836+03:30	2024-06-27 22:16:55.860409+03:30	من قبلا عصو سایت بودم ولی الان نمیتونم وارد بشم	t	t	30	30
135	2024-06-12 17:36:43.378974+03:30	2024-06-28 18:19:30.705394+03:30	با توجه به اینکه پلن های شما اکثرا تازه تمدید شده و از نوع سالانه هستند خیر نمیتوانید 	t	t	23	23
134	2024-06-12 17:36:40.523077+03:30	2024-06-28 18:19:30.706273+03:30	با توجه به اینکه پلن های شما اکثرا تازه تمدید شده و از نوع سالانه هستند خیر نمیتوانید 	t	t	23	23
148	2024-06-14 01:00:30.875073+03:30	2024-06-18 02:42:00.547233+03:30	الان زده ۳.۵۸	t	t	25	25
149	2024-06-14 01:00:55.647737+03:30	2024-06-18 02:42:00.548053+03:30	کاردانو ۱۵۱.۸۶ داشتم 	t	t	25	25
152	2024-06-14 15:54:34.875845+03:30	2024-06-18 02:42:00.548832+03:30	سلام وقت بخیر پشتیبانی سایت بهتون پاسخ داد	t	t	25	25
150	2024-06-14 01:01:08.031831+03:30	2024-06-18 02:42:00.549747+03:30	الان زده ۵۶	t	t	25	25
151	2024-06-14 01:01:31.472941+03:30	2024-06-18 02:42:00.550547+03:30	ریپل ۱۱۵.۹۷ داشتم الان زده ۱۱۵	t	t	25	25
141	2024-06-14 00:57:36.335512+03:30	2024-06-18 02:42:00.551265+03:30	وقتتون بخیر 	t	t	25	25
174	2024-06-22 18:22:39.077564+03:30	2024-06-26 15:54:55.71948+03:30	سلام	t	t	36	36
112	2024-06-08 18:00:38.243829+03:30	2024-06-21 12:43:44.26715+03:30	سلام خسته نباشین وقتتون بخیر من قبل اپدیت یه پلن سالیانه فول استیکینگ زوفعال کردم وبعد دوماه الان میخوام بستن پلن رو انتخاب کنم ولی متاسفانه با نوتیو اخطار مواجه میشم که باید تیکت ثبت کنم میشه راهنماییم کنیدمن عکس رو کجا براتون بفرستم؟!!  	t	t	18	18
162	2024-06-19 16:57:01.295038+03:30	2024-06-27 22:16:55.861231+03:30	سلام وقت بخیر	t	t	30	30
166	2024-06-21 00:43:35.464744+03:30	2024-06-27 22:16:55.858192+03:30	@ramabitsup	t	t	30	1
184	2024-06-24 20:38:43.966733+03:30	2024-06-25 00:23:50.611111+03:30	براتون با مثال توضیح داده شد	t	t	24	1
136	2024-06-12 17:40:56.847615+03:30	2024-06-25 00:23:50.611966+03:30	شما ماینری خریداری میکنید به ارزش ۱۰۰۰ دلار بعد از اتمام زمان	t	t	24	24
168	2024-06-22 15:20:39.663889+03:30	2024-06-23 19:54:47.947783+03:30	سلام	t	t	33	33
169	2024-06-22 15:23:06.346514+03:30	2024-06-23 19:54:47.948939+03:30	وقت بخیر	t	t	33	33
139	2024-06-12 17:43:16.15633+03:30	2024-06-25 00:23:50.605181+03:30	هزینه ابندایی بابت اجاره بوده و قابل بازیابی نیست	t	t	24	24
165	2024-06-21 00:43:21.149419+03:30	2024-06-27 22:16:55.862007+03:30	سلام عرض ادب و احترام	t	t	30	1
177	2024-06-23 19:54:04.793131+03:30	2024-06-26 15:54:55.720324+03:30	سلام عرض ادب 	f	t	36	1
137	2024-06-12 17:41:59.799517+03:30	2024-06-25 00:23:50.606199+03:30	شما ۲۰۰۰ دلار مجموعا دریافت کرده اید 	t	t	24	24
178	2024-06-23 19:54:13.065988+03:30	2024-06-26 15:54:55.721198+03:30	چه کمکی از من ساختست؟	f	t	36	1
175	2024-06-22 18:22:39.556766+03:30	2024-06-26 15:54:55.722035+03:30	سلام	t	t	36	36
\.


--
-- Name: chat_chatsessionmessage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('chat_chatsessionmessage_id_seq', 184, true);


--
-- Data for Name: chat_chattext; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY chat_chattext (id, text, date, room_id, user_id) FROM stdin;
\.


--
-- Name: chat_chattext_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('chat_chattext_id_seq', 1, false);


--
-- Data for Name: chat_chatuser; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY chat_chatuser (id, name, mobile, email) FROM stdin;
17	amirhsaheb	09188574941	dashmajid.apachi@gmail.com
2	miladzmf00@gmail.com	9358920555zm	\N
3	میلاد زاهدی	09380446715	\N
4	میلاد زاهدی	09380446715	\N
5	نست	تشستی	\N
6	Mobintalebpourkordi	09333466764	\N
7	Elnaz	09155158698	\N
8	Eli	09155158698	\N
38	morteza2000	09361197631	mortezashabani402@gmail.com
1	admin	000	\N
9	armansaheb	000000000	\N
10	fghgf	000	dfsds@sfgds.dfgs
11	milad	09380446715	miladzmf00@gmail.com
12	بهنام پاکمنش	09113220993	Pakmanesh.mp@gmail.com
14	armansaheb	000000000	
15	میثم شه بخش	09380237224	meysam24430@gmail.com
16	Mobintalebpourkordi	09333466764	mobintalebpor31@gmail.com
30	ایمان	فردایی	zsh84_myth@yahoo.com
23	miladzmf00	09380446715	miladzmf00@gmail.com
22	admin	000	armansaheb@gmail.com
28	abi	090000000	Bzvahva@gmail.com
39	alex	0767624057	morteza.aliyar1382@gmail.com
20	armansaheb5	000	armansaheb@hotmail.com
25	architect.map	09129467982	architect.map@gmail.com
26	atom	09198707421	Hsgsn@gmail.com
31	m.kazemzadeh	09111004196	mohamadsarafex@gmail.com
33	سیدزاده 	۰۹۱۲۱۷۶۳۱۶۴	Componic@yahoo.com 
34	سیدزاده	۰۹۱۲۱۷۶۳۱۶۴	componic@yahoo.com 
27	Z c	Z c	ZC
35	عرفان	09025360433	erfana169@gmail.com
13	admin	000	
18	mobintalebpor	09333466764	
19	meysam akbari	09129467982	architect.map@gmail.com
36	diadalir	09014633716	diadalir@gmail.com
32	kimia	۰۹۰۲۵۴۴۱۰۲۹	nikmehrkimia@gmail.com
21	pabking	\N	ahmad.kameli121@gmail.com
29	aaaaa	0987654321	ghg@gbf.com
24	lucifer777	09113222909	milad.rahmany777@gmail.com
37	mamad	Mamadabedi73@gmail.com	Mamadabedi73@gmail.com
\.


--
-- Name: chat_chatuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('chat_chatuser_id_seq', 39, true);


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
5	2024-05-25 09:37:28.083408+03:30	1	aboutus	1	[{"added": {}}]	14	1
6	2024-05-25 09:37:49.158521+03:30	2	contactus	1	[{"added": {}}]	14	1
7	2024-05-25 09:39:08.861187+03:30	1	Transactions object (1)	1	[{"added": {}}]	23	1
8	2024-05-25 09:52:22.70019+03:30	1	Transactions object (1)	3		23	1
9	2024-05-25 09:54:45.596408+03:30	b6ebaeb6-3b59-4c7b-87ac-1aaf05d9951e	Transactions object (b6ebaeb6-3b59-4c7b-87ac-1aaf05d9951e)	1	[{"added": {}}]	23	1
10	2024-05-25 09:58:33.616484+03:30	a060bb52-a	Transactions object (a060bb52-a)	1	[{"added": {}}]	23	1
11	2024-05-26 02:06:56.787758+03:30	1	(1)(1)admin 1.0	1	[{"added": {}}]	21	1
12	2024-05-26 12:14:40.267426+03:30	1	Banner object (1)	1	[{"added": {}}]	3	1
13	2024-05-26 12:17:39.001544+03:30	2	(2)(1)admin 1000.0	1	[{"added": {}}]	21	1
14	2024-05-26 12:26:42.565529+03:30	3	ماینر Bitmain Antminer S19 Pro 110Th (3)	2	[{"changed": {"fields": ["Pic", "Des", "Period"]}}]	12	1
15	2024-05-26 12:26:52.740621+03:30	6	ماینر Innosilicon T3-50T BTC (6)	2	[{"changed": {"fields": ["Pic", "Des", "Period"]}}]	12	1
16	2024-05-26 12:27:01.024303+03:30	10	ماینر AvalonMiner A۱۱۶۶ Pro (10)	2	[{"changed": {"fields": ["Pic", "Des", "Period"]}}]	12	1
17	2024-05-26 12:27:08.283538+03:30	11	Antminer L3++ (580Mh) Bitmain (11)	2	[{"changed": {"fields": ["Pic", "Des", "Period"]}}]	12	1
18	2024-05-26 12:57:33.366499+03:30	7	ram	1	[{"added": {}}]	7	1
19	2024-05-26 12:57:59.656795+03:30	7	ram	3		7	1
20	2024-05-26 13:25:53.671601+03:30	2	BTC	2	[{"changed": {"fields": ["Pic"]}}]	7	1
21	2024-05-26 17:51:48.843139+03:30	1	(1)(1)admin 0.001	2	[{"changed": {"fields": ["Amount"]}}]	21	1
22	2024-05-27 14:44:16.928755+03:30	5	post object (5)	1	[{"added": {}}]	16	1
23	2024-05-27 14:45:20.326638+03:30	5	post object (5)	3		16	1
24	2024-05-27 16:34:55.943407+03:30	b6ebaeb6-3	Transactions object (b6ebaeb6-3)	2	[{"changed": {"fields": ["Act"]}}]	23	1
25	2024-05-27 16:55:32.78531+03:30	1	(1)admin5646	1	[{"added": {}}]	26	1
26	2024-05-30 16:46:57.613001+03:30	34	ChatSessionMessage object (34)	1	[{"added": {}}]	38	1
27	2024-05-30 16:47:16.644089+03:30	35	ChatSessionMessage object (35)	1	[{"added": {}}]	38	1
28	2024-05-30 16:47:46.165929+03:30	35	ChatSessionMessage object (35)	2	[{"changed": {"fields": ["User"]}}]	38	1
29	2024-05-30 16:48:16.21317+03:30	35	ChatSessionMessage object (35)	2	[{"changed": {"fields": ["User"]}}]	38	1
30	2024-05-30 17:04:17.354431+03:30	36	ChatSessionMessage object (36)	1	[{"added": {}}]	38	1
31	2024-05-30 17:04:19.456266+03:30	36	ChatSessionMessage object (36)	2	[]	38	1
32	2024-05-30 17:04:41.15124+03:30	37	ChatSessionMessage object (37)	1	[{"added": {}}]	38	1
33	2024-05-30 17:06:10.1911+03:30	37	ChatSessionMessage object (37)	2	[{"changed": {"fields": ["Message"]}}]	38	1
34	2024-05-30 17:06:33.373975+03:30	37	ChatSessionMessage object (37)	2	[{"changed": {"fields": ["Message"]}}]	38	1
35	2024-05-30 17:57:33.147985+03:30	1	settings object (1)	1	[{"added": {}}]	19	1
36	2024-05-31 15:43:36.827316+03:30	14	(14)armansaheb1994	2	[{"changed": {"fields": ["password"]}}]	1	1
37	2024-05-31 15:46:30.74991+03:30	14	(14)armansaheb1994	2	[{"changed": {"fields": ["password"]}}]	1	1
38	2024-05-31 16:02:01.793116+03:30	16	(16)armansaheb5	2	[{"changed": {"fields": ["password"]}}]	1	1
39	2024-05-31 16:06:56.49745+03:30	16	(16)armansaheb5	2	[{"changed": {"fields": ["Is active"]}}]	1	1
40	2024-05-31 16:07:55.474301+03:30	15	(15)armansaheb@gmail.com	2	[{"changed": {"fields": ["Is active"]}}]	1	1
41	2024-05-31 16:08:01.806253+03:30	16	(16)armansaheb5	2	[]	1	1
42	2024-05-31 16:08:07.360401+03:30	14	(14)armansaheb1994	2	[{"changed": {"fields": ["Is active"]}}]	1	1
43	2024-05-31 16:08:15.975733+03:30	13	(13)ariya_boy	2	[{"changed": {"fields": ["Is active"]}}]	1	1
44	2024-05-31 16:08:20.670441+03:30	12	(12)amirhsaheb	2	[]	1	1
45	2024-05-31 16:12:23.595753+03:30	6	(6)mobintalebpor	2	[{"changed": {"fields": ["password"]}}]	1	1
46	2024-05-31 16:20:17.363441+03:30	15	(15)armansaheb@gmail.com	3		1	1
47	2024-05-31 16:20:25.675544+03:30	1	(1)admin	2	[{"changed": {"fields": ["Email"]}}]	1	1
48	2024-06-01 17:51:59.504027+03:30	1	Subjects object (1)	1	[{"added": {}}]	24	1
49	2024-06-01 17:53:25.488779+03:30	1	Tickets object (1)	1	[{"added": {}}]	20	1
50	2024-06-01 18:50:10.428418+03:30	2	Subjects object (2)	1	[{"added": {}}]	24	1
51	2024-06-01 18:50:26.999576+03:30	2	Tickets object (2)	1	[{"added": {}}]	20	1
52	2024-06-01 18:53:44.090301+03:30	3	Subjects object (3)	1	[{"added": {}}]	24	1
53	2024-06-01 18:54:41.760195+03:30	3	Subjects object (3)	3		24	1
54	2024-06-01 18:56:30.219638+03:30	4	Subjects object (4)	1	[{"added": {}}]	24	1
55	2024-06-01 19:09:49.138469+03:30	4	Subjects object (4)	2	[{"changed": {"fields": ["Act"]}}]	24	1
56	2024-06-01 19:11:07.797375+03:30	4	Subjects object (4)	2	[{"changed": {"fields": ["Act"]}}]	24	1
57	2024-06-01 19:12:07.075358+03:30	4	Subjects object (4)	2	[{"changed": {"fields": ["Act"]}}]	24	1
58	2024-06-01 20:03:58.619277+03:30	4	Tickets object (4)	1	[{"added": {}}]	20	1
59	2024-06-01 20:19:43.098887+03:30	2	Subjects object (2)	3		24	1
60	2024-06-01 20:19:47.934572+03:30	4	Subjects object (4)	3		24	1
61	2024-06-02 15:12:39.9816+03:30	15	charge	1	[{"added": {}}]	8	1
62	2024-06-02 21:08:28.126612+03:30	1	Subjects object (1)	2	[{"changed": {"fields": ["Act"]}}]	24	1
63	2024-06-02 21:10:06.695904+03:30	1	Subjects object (1)	2	[{"changed": {"fields": ["Act"]}}]	24	1
64	2024-06-02 21:10:26.499235+03:30	1	Subjects object (1)	2	[]	24	1
65	2024-06-06 13:19:09.457831+03:30	10	(10)aaaaaaaa	3		1	1
66	2024-06-06 13:19:09.459473+03:30	11	(11)bbbbbbbb	3		1	1
67	2024-06-06 13:19:09.460249+03:30	24	(24)cghtgfh	3		1	1
68	2024-06-06 13:19:09.461391+03:30	26	(26)chgftgh	3		1	1
69	2024-06-06 13:19:09.462069+03:30	7	(7)dfsdf	3		1	1
70	2024-06-06 13:19:09.462751+03:30	8	(8)fghgf	3		1	1
71	2024-06-06 13:19:09.463406+03:30	25	(25)gdfgf	3		1	1
72	2024-06-06 13:19:09.464123+03:30	23	(23)guvkvknljljlljl	3		1	1
73	2024-06-06 13:19:09.464732+03:30	20	(20)jdjdhsh	3		1	1
74	2024-06-06 13:19:09.465327+03:30	21	(21)jvjfjfh	3		1	1
75	2024-06-06 13:19:09.465921+03:30	22	(22)jvjfjfh1	3		1	1
76	2024-06-06 13:19:09.466548+03:30	9	(9)m	3		1	1
77	2024-06-06 13:19:09.467164+03:30	18	(18)sdfsddsfdf	3		1	1
78	2024-06-06 13:19:09.467758+03:30	27	(27)xfgfdg	3		1	1
79	2024-06-06 15:02:09.24848+03:30	15	charge	2	[{"changed": {"fields": ["Title", "Text"]}}]	8	1
80	2024-06-06 15:24:40.995341+03:30	19	(19)alimamad	3		1	1
81	2024-06-07 16:39:31.903461+03:30	2	BTC	2	[{"changed": {"fields": ["Align"]}}]	7	1
82	2024-06-07 16:40:09.538607+03:30	6	USDT	2	[{"changed": {"fields": ["Align"]}}]	7	1
83	2024-06-07 16:40:14.84238+03:30	5	ETH	2	[{"changed": {"fields": ["Align"]}}]	7	1
84	2024-06-07 16:40:25.790971+03:30	3	DOGE	2	[{"changed": {"fields": ["Align"]}}]	7	1
85	2024-06-07 16:40:41.189582+03:30	18	BNB	2	[{"changed": {"fields": [" \\u0646\\u0627\\u0645 \\u0627\\u0631\\u0632", "Align"]}}]	7	1
86	2024-06-10 01:16:15.630496+03:30	11	Antminer L3++ (580Mh) Bitmain (11)	2	[{"changed": {"fields": ["Des"]}}]	12	1
87	2024-06-10 01:25:31.494778+03:30	3	ماینر Bitmain Antminer S19 Pro 110Th (3)	2	[{"changed": {"fields": ["Des", "Rate", "Period", "Profit"]}}]	12	1
88	2024-06-10 01:27:32.745395+03:30	3	ماینر Bitmain Antminer S19 Pro 128th (plus+) (3)	2	[{"changed": {"fields": ["Title", "Des"]}}]	12	1
89	2024-06-10 01:38:27.276231+03:30	10	ماینر AvalonMiner A۱۱۶۶ Pro (10)	2	[{"changed": {"fields": ["Des", "Profit"]}}]	12	1
90	2024-06-10 01:41:06.61067+03:30	6	ماینر Innosilicon T3-57th BTC (6)	2	[{"changed": {"fields": ["Title", "Profit"]}}]	12	1
91	2024-06-10 23:03:50.921992+03:30	11	(29)miladzmf00   ,   پلن شیبا سالیانه (29)   ,   26363629.0   ,   2024-06-06	3		28	1
92	2024-06-10 23:04:35.945529+03:30	9	(9)(29)miladzmf00 9237251.0	2	[{"changed": {"fields": ["Amount"]}}]	21	1
93	2024-06-10 23:04:54.098567+03:30	21	(21)(29)miladzmf00 729.395	2	[{"changed": {"fields": ["Amount"]}}]	21	1
94	2024-06-12 17:28:32.205393+03:30	7	(7)(29)miladzmf00 350.0	2	[{"changed": {"fields": ["Currency", "Amount"]}}]	21	1
95	2024-06-13 14:19:27.042173+03:30	16	balances	1	[{"added": {}}]	8	1
96	2024-06-13 14:54:37.671143+03:30	18	(18)(29)miladzmf00 0.0	3		21	1
97	2024-06-13 14:55:33.99654+03:30	27	(27)(31)architect.map 0.0	3		21	1
98	2024-06-13 14:55:33.998375+03:30	26	(26)(31)architect.map 0.0	3		21	1
99	2024-06-13 14:55:33.999261+03:30	25	(25)(31)architect.map 0.0	3		21	1
100	2024-06-13 14:55:34.000045+03:30	24	(24)(31)architect.map 0.0	3		21	1
101	2024-06-13 14:55:34.000765+03:30	23	(23)(30)lucifer777 0.0	3		21	1
102	2024-06-13 14:55:34.001515+03:30	22	(22)(29)miladzmf00 0.0	3		21	1
103	2024-06-13 14:55:34.002271+03:30	20	(20)(29)miladzmf00 0.0	3		21	1
104	2024-06-13 14:55:34.003011+03:30	19	(19)(29)miladzmf00 0.0	3		21	1
105	2024-06-13 14:55:34.003699+03:30	16	(16)(29)miladzmf00 0.0	3		21	1
106	2024-06-13 14:55:34.00435+03:30	15	(15)(29)miladzmf00 0.0	3		21	1
107	2024-06-13 14:55:34.005027+03:30	13	(13)(29)miladzmf00 0.0	3		21	1
108	2024-06-13 14:55:34.005693+03:30	11	(11)(29)miladzmf00 0.0	3		21	1
109	2024-06-13 14:55:34.006335+03:30	8	(8)(29)miladzmf00 0.0	3		21	1
110	2024-06-13 14:55:34.007119+03:30	4	(4)(6)mobintalebpor 0.0	3		21	1
111	2024-06-13 14:55:34.007742+03:30	3	(3)(6)mobintalebpor 0.0	3		21	1
112	2024-06-13 14:59:46.023328+03:30	7	(USDT)(29)miladzmf00 350.0	3		21	1
113	2024-06-13 14:59:53.166676+03:30	21	(USDT)(29)miladzmf00 1099.0	2	[{"changed": {"fields": ["Amount"]}}]	21	1
114	2024-06-15 19:05:04.540851+03:30	159	ChatSessionMessage object (159)	3		38	1
115	2024-06-15 19:05:04.543929+03:30	158	ChatSessionMessage object (158)	3		38	1
116	2024-06-15 19:05:04.544717+03:30	157	ChatSessionMessage object (157)	3		38	1
117	2024-06-15 19:05:04.545428+03:30	156	ChatSessionMessage object (156)	3		38	1
118	2024-06-15 19:05:04.546166+03:30	155	ChatSessionMessage object (155)	3		38	1
119	2024-06-16 00:10:31.755575+03:30	2	Transactions object (2)	2	[{"changed": {"fields": ["Id"]}}]	23	1
120	2024-06-16 00:13:55.80602+03:30	<function 	Transactions object (<function )	3		23	1
121	2024-06-16 00:21:22.653198+03:30	99	Transactions object (99)	3		23	1
122	2024-06-16 00:21:22.655094+03:30	98	Transactions object (98)	3		23	1
123	2024-06-16 00:21:22.655896+03:30	97	Transactions object (97)	3		23	1
124	2024-06-16 00:21:22.656656+03:30	96	Transactions object (96)	3		23	1
125	2024-06-16 00:21:22.657439+03:30	95	Transactions object (95)	3		23	1
126	2024-06-16 00:21:22.658188+03:30	94	Transactions object (94)	3		23	1
127	2024-06-16 00:21:22.659044+03:30	93	Transactions object (93)	3		23	1
128	2024-06-16 00:21:22.659704+03:30	92	Transactions object (92)	3		23	1
129	2024-06-16 00:21:22.660306+03:30	91	Transactions object (91)	3		23	1
130	2024-06-16 00:21:22.660947+03:30	90	Transactions object (90)	3		23	1
131	2024-06-16 00:21:22.661594+03:30	9	Transactions object (9)	3		23	1
132	2024-06-16 00:21:22.662197+03:30	8	Transactions object (8)	3		23	1
133	2024-06-16 00:21:22.662911+03:30	78	Transactions object (78)	3		23	1
134	2024-06-16 00:21:22.66358+03:30	77	Transactions object (77)	3		23	1
135	2024-06-16 00:21:22.66425+03:30	76	Transactions object (76)	3		23	1
136	2024-06-16 00:21:22.664917+03:30	75	Transactions object (75)	3		23	1
137	2024-06-16 00:21:22.665535+03:30	74	Transactions object (74)	3		23	1
138	2024-06-16 00:21:22.666181+03:30	73	Transactions object (73)	3		23	1
139	2024-06-16 00:21:22.666809+03:30	72	Transactions object (72)	3		23	1
140	2024-06-16 00:21:22.667393+03:30	71	Transactions object (71)	3		23	1
141	2024-06-16 00:21:22.668063+03:30	70	Transactions object (70)	3		23	1
142	2024-06-16 00:21:22.668725+03:30	7	Transactions object (7)	3		23	1
143	2024-06-16 00:21:22.669517+03:30	69	Transactions object (69)	3		23	1
144	2024-06-16 00:21:22.67019+03:30	68	Transactions object (68)	3		23	1
145	2024-06-16 00:21:22.670842+03:30	67	Transactions object (67)	3		23	1
146	2024-06-16 00:21:22.671527+03:30	66	Transactions object (66)	3		23	1
147	2024-06-16 00:21:22.672185+03:30	65	Transactions object (65)	3		23	1
148	2024-06-16 00:21:22.672792+03:30	64	Transactions object (64)	3		23	1
149	2024-06-16 00:21:22.673411+03:30	63	Transactions object (63)	3		23	1
150	2024-06-16 00:21:22.67405+03:30	62	Transactions object (62)	3		23	1
151	2024-06-16 00:21:22.674695+03:30	61	Transactions object (61)	3		23	1
152	2024-06-16 00:21:22.675298+03:30	60	Transactions object (60)	3		23	1
153	2024-06-16 00:21:22.675964+03:30	6	Transactions object (6)	3		23	1
154	2024-06-16 00:21:22.676573+03:30	59	Transactions object (59)	3		23	1
155	2024-06-16 00:21:22.67723+03:30	58	Transactions object (58)	3		23	1
156	2024-06-16 00:21:22.677825+03:30	57	Transactions object (57)	3		23	1
157	2024-06-16 00:21:22.678417+03:30	56	Transactions object (56)	3		23	1
158	2024-06-16 00:21:22.679018+03:30	55	Transactions object (55)	3		23	1
159	2024-06-16 00:21:22.679794+03:30	54	Transactions object (54)	3		23	1
160	2024-06-16 00:21:22.680401+03:30	53	Transactions object (53)	3		23	1
161	2024-06-16 00:21:22.681095+03:30	52	Transactions object (52)	3		23	1
162	2024-06-16 00:21:22.681791+03:30	51	Transactions object (51)	3		23	1
163	2024-06-16 00:21:22.682452+03:30	50	Transactions object (50)	3		23	1
164	2024-06-16 00:21:22.683096+03:30	5	Transactions object (5)	3		23	1
165	2024-06-16 00:21:22.683703+03:30	48	Transactions object (48)	3		23	1
166	2024-06-16 00:21:22.684322+03:30	47	Transactions object (47)	3		23	1
167	2024-06-16 00:21:22.684935+03:30	46	Transactions object (46)	3		23	1
168	2024-06-16 00:21:22.685517+03:30	45	Transactions object (45)	3		23	1
169	2024-06-16 00:21:22.68621+03:30	44	Transactions object (44)	3		23	1
170	2024-06-16 00:21:22.686877+03:30	43	Transactions object (43)	3		23	1
171	2024-06-16 00:21:22.68768+03:30	42	Transactions object (42)	3		23	1
172	2024-06-16 00:21:22.688454+03:30	41	Transactions object (41)	3		23	1
173	2024-06-16 00:21:22.689213+03:30	40	Transactions object (40)	3		23	1
174	2024-06-16 00:21:22.689972+03:30	4	Transactions object (4)	3		23	1
175	2024-06-16 00:21:22.690775+03:30	39	Transactions object (39)	3		23	1
176	2024-06-16 00:21:22.691362+03:30	38	Transactions object (38)	3		23	1
177	2024-06-16 00:21:22.692016+03:30	37	Transactions object (37)	3		23	1
178	2024-06-16 00:21:22.6926+03:30	36	Transactions object (36)	3		23	1
179	2024-06-16 00:21:22.693233+03:30	35	Transactions object (35)	3		23	1
180	2024-06-16 00:21:22.693877+03:30	34	Transactions object (34)	3		23	1
181	2024-06-16 00:21:22.694518+03:30	33	Transactions object (33)	3		23	1
182	2024-06-16 00:21:22.695128+03:30	32	Transactions object (32)	3		23	1
183	2024-06-16 00:21:22.695737+03:30	31	Transactions object (31)	3		23	1
184	2024-06-16 00:21:22.696303+03:30	30	Transactions object (30)	3		23	1
185	2024-06-16 00:21:22.696896+03:30	3	Transactions object (3)	3		23	1
186	2024-06-16 00:21:22.697526+03:30	24	Transactions object (24)	3		23	1
187	2024-06-16 00:21:22.69812+03:30	23	Transactions object (23)	3		23	1
188	2024-06-16 00:21:22.698793+03:30	22	Transactions object (22)	3		23	1
189	2024-06-16 00:21:22.699437+03:30	21	Transactions object (21)	3		23	1
190	2024-06-16 00:21:22.700239+03:30	20	Transactions object (20)	3		23	1
191	2024-06-16 00:21:22.700887+03:30	2	Transactions object (2)	3		23	1
192	2024-06-16 00:21:22.701472+03:30	19	Transactions object (19)	3		23	1
193	2024-06-16 00:21:22.702116+03:30	18	Transactions object (18)	3		23	1
194	2024-06-16 00:21:22.702733+03:30	17	Transactions object (17)	3		23	1
195	2024-06-16 00:21:22.70331+03:30	16	Transactions object (16)	3		23	1
196	2024-06-16 00:21:22.703937+03:30	15	Transactions object (15)	3		23	1
197	2024-06-16 00:21:22.704619+03:30	14	Transactions object (14)	3		23	1
198	2024-06-16 00:21:22.705258+03:30	13	Transactions object (13)	3		23	1
199	2024-06-16 00:21:22.705919+03:30	12	Transactions object (12)	3		23	1
200	2024-06-16 00:21:22.706519+03:30	11	Transactions object (11)	3		23	1
201	2024-06-16 00:21:22.707154+03:30	108	Transactions object (108)	3		23	1
202	2024-06-16 00:21:22.707779+03:30	107	Transactions object (107)	3		23	1
203	2024-06-16 00:21:22.708356+03:30	106	Transactions object (106)	3		23	1
204	2024-06-16 00:21:49.26592+03:30	105	Transactions object (105)	3		23	1
205	2024-06-16 00:21:49.267353+03:30	104	Transactions object (104)	3		23	1
206	2024-06-16 00:21:49.268169+03:30	103	Transactions object (103)	3		23	1
207	2024-06-16 00:21:49.268903+03:30	102	Transactions object (102)	3		23	1
208	2024-06-16 00:21:49.269651+03:30	101	Transactions object (101)	3		23	1
209	2024-06-16 00:21:49.270365+03:30	100	Transactions object (100)	3		23	1
210	2024-06-16 00:21:49.271126+03:30	10	Transactions object (10)	3		23	1
211	2024-06-16 00:21:49.271793+03:30	1	Transactions object (1)	3		23	1
212	2024-06-16 00:22:38.091138+03:30	1	Transactions object (1)	2	[{"changed": {"fields": ["Id"]}}]	23	1
213	2024-06-16 00:22:44.13959+03:30	2	Transactions object (2)	2	[{"changed": {"fields": ["Id"]}}]	23	1
214	2024-06-16 00:22:45.789932+03:30	3	Transactions object (3)	2	[{"changed": {"fields": ["Id"]}}]	23	1
215	2024-06-16 00:22:48.109738+03:30	4	Transactions object (4)	2	[{"changed": {"fields": ["Id"]}}]	23	1
216	2024-06-16 00:22:50.866201+03:30	5	Transactions object (5)	2	[{"changed": {"fields": ["Id"]}}]	23	1
217	2024-06-16 00:22:54.151458+03:30	6	Transactions object (6)	2	[{"changed": {"fields": ["Id"]}}]	23	1
218	2024-06-16 00:22:57.968333+03:30	7	Transactions object (7)	2	[{"changed": {"fields": ["Id"]}}]	23	1
219	2024-06-16 00:23:00.63628+03:30	8	Transactions object (8)	2	[{"changed": {"fields": ["Id"]}}]	23	1
220	2024-06-16 00:23:04.538089+03:30	9	Transactions object (9)	2	[{"changed": {"fields": ["Id"]}}]	23	1
221	2024-06-16 00:23:08.39322+03:30	10	Transactions object (10)	2	[{"changed": {"fields": ["Id"]}}]	23	1
222	2024-06-16 00:23:49.198169+03:30	11	Transactions object (11)	2	[{"changed": {"fields": ["Id"]}}]	23	1
223	2024-06-16 00:23:55.72036+03:30	12	Transactions object (12)	2	[{"changed": {"fields": ["Id"]}}]	23	1
224	2024-06-16 00:23:58.337042+03:30	13	Transactions object (13)	2	[{"changed": {"fields": ["Id"]}}]	23	1
225	2024-06-16 00:24:04.485801+03:30	14	Transactions object (14)	2	[{"changed": {"fields": ["Id"]}}]	23	1
226	2024-06-16 00:24:07.805022+03:30	15	Transactions object (15)	2	[{"changed": {"fields": ["Id"]}}]	23	1
227	2024-06-16 00:24:12.084156+03:30	16	Transactions object (16)	2	[{"changed": {"fields": ["Id"]}}]	23	1
228	2024-06-16 00:24:14.37004+03:30	17	Transactions object (17)	2	[{"changed": {"fields": ["Id"]}}]	23	1
229	2024-06-16 00:24:18.101228+03:30	18	Transactions object (18)	2	[{"changed": {"fields": ["Id"]}}]	23	1
230	2024-06-16 00:24:21.261564+03:30	19	Transactions object (19)	2	[{"changed": {"fields": ["Id"]}}]	23	1
231	2024-06-16 00:24:24.05894+03:30	20	Transactions object (20)	2	[{"changed": {"fields": ["Id"]}}]	23	1
232	2024-06-16 00:24:27.483408+03:30	21	Transactions object (21)	2	[{"changed": {"fields": ["Id"]}}]	23	1
233	2024-06-16 00:25:40.149638+03:30	22	Transactions object (22)	2	[{"changed": {"fields": ["Id"]}}]	23	1
234	2024-06-16 00:26:19.307359+03:30	9	Transactions object (9)	3		23	1
235	2024-06-16 00:26:19.309078+03:30	8	Transactions object (8)	3		23	1
236	2024-06-16 00:26:19.309867+03:30	7	Transactions object (7)	3		23	1
237	2024-06-16 00:26:19.310594+03:30	6	Transactions object (6)	3		23	1
238	2024-06-16 00:26:19.311325+03:30	5	Transactions object (5)	3		23	1
239	2024-06-16 00:26:19.312073+03:30	4	Transactions object (4)	3		23	1
240	2024-06-16 00:26:19.312819+03:30	3	Transactions object (3)	3		23	1
241	2024-06-16 00:26:19.313511+03:30	22	Transactions object (22)	3		23	1
242	2024-06-16 00:26:19.31415+03:30	21	Transactions object (21)	3		23	1
243	2024-06-16 00:26:19.314793+03:30	20	Transactions object (20)	3		23	1
244	2024-06-16 00:26:19.315435+03:30	2	Transactions object (2)	3		23	1
245	2024-06-16 00:26:19.31609+03:30	19	Transactions object (19)	3		23	1
246	2024-06-16 00:26:19.316755+03:30	18	Transactions object (18)	3		23	1
247	2024-06-16 00:26:19.317396+03:30	17	Transactions object (17)	3		23	1
248	2024-06-16 00:26:19.318058+03:30	16	Transactions object (16)	3		23	1
249	2024-06-16 00:26:19.318735+03:30	15	Transactions object (15)	3		23	1
250	2024-06-16 00:26:19.319372+03:30	14	Transactions object (14)	3		23	1
251	2024-06-16 00:26:19.320218+03:30	13	Transactions object (13)	3		23	1
252	2024-06-16 00:26:19.320899+03:30	12	Transactions object (12)	3		23	1
253	2024-06-16 00:26:19.321595+03:30	11	Transactions object (11)	3		23	1
254	2024-06-16 00:26:19.322268+03:30	10	Transactions object (10)	3		23	1
255	2024-06-16 00:26:19.322974+03:30	1	Transactions object (1)	3		23	1
256	2024-06-16 00:26:57.776329+03:30	1	Transactions object (1)	2	[{"changed": {"fields": ["Id"]}}]	23	1
257	2024-06-16 00:27:08.184083+03:30	072a142d-c	Transactions object (072a142d-c)	3		23	1
258	2024-06-16 00:27:16.028555+03:30	2	Transactions object (2)	2	[{"changed": {"fields": ["Id"]}}]	23	1
259	2024-06-16 00:27:23.762805+03:30	3f8bd36f-2	Transactions object (3f8bd36f-2)	3		23	1
260	2024-06-16 00:27:29.486039+03:30	3	Transactions object (3)	2	[{"changed": {"fields": ["Id"]}}]	23	1
261	2024-06-16 00:27:38.437773+03:30	46106f70-e	Transactions object (46106f70-e)	3		23	1
262	2024-06-16 00:28:04.520249+03:30	4	Transactions object (4)	2	[{"changed": {"fields": ["Id"]}}]	23	1
263	2024-06-16 00:28:34.204447+03:30	00d85787-e	Transactions object (00d85787-e)	3		23	1
264	2024-06-16 00:28:45.698981+03:30	5	Transactions object (5)	2	[{"changed": {"fields": ["Id"]}}]	23	1
265	2024-06-16 00:28:56.673772+03:30	5f3d9284-7	Transactions object (5f3d9284-7)	3		23	1
266	2024-06-16 00:29:03.161064+03:30	6	Transactions object (6)	2	[{"changed": {"fields": ["Id"]}}]	23	1
267	2024-06-16 00:29:13.453775+03:30	6bda4d72-2	Transactions object (6bda4d72-2)	3		23	1
268	2024-06-16 00:29:19.121605+03:30	7	Transactions object (7)	2	[{"changed": {"fields": ["Id"]}}]	23	1
269	2024-06-16 00:29:28.309955+03:30	7d8485d7-a	Transactions object (7d8485d7-a)	3		23	1
270	2024-06-16 00:29:41.488016+03:30	8-c	Transactions object (8-c)	2	[{"changed": {"fields": ["Id"]}}]	23	1
271	2024-06-16 00:30:17.577801+03:30	8	Transactions object (8)	2	[{"changed": {"fields": ["Id"]}}]	23	1
272	2024-06-16 00:30:23.249227+03:30	7e761ab2-c	Transactions object (7e761ab2-c)	3		23	1
273	2024-06-16 00:30:25.843185+03:30	8a736305-8	Transactions object (8a736305-8)	3		23	1
274	2024-06-16 00:31:03.060057+03:30	9936d782-4	Transactions object (9936d782-4)	3		23	1
275	2024-06-16 00:31:38.590245+03:30	9	Transactions object (9)	2	[{"changed": {"fields": ["Id"]}}]	23	1
276	2024-06-16 00:31:45.083511+03:30	8f89b97c-e	Transactions object (8f89b97c-e)	3		23	1
277	2024-06-16 00:31:49.984125+03:30	f9cad302-f	Transactions object (f9cad302-f)	3		23	1
278	2024-06-16 00:31:54.059394+03:30	cb6f3994-a	Transactions object (cb6f3994-a)	3		23	1
279	2024-06-16 00:31:57.897444+03:30	c16af1a0-f	Transactions object (c16af1a0-f)	3		23	1
280	2024-06-16 00:32:02.209277+03:30	b6ebaeb6-3	Transactions object (b6ebaeb6-3)	3		23	1
281	2024-06-16 00:32:06.906682+03:30	b2abbc12-2	Transactions object (b2abbc12-2)	3		23	1
282	2024-06-16 00:32:15.45716+03:30	9	Transactions object (9)	2	[{"changed": {"fields": ["Id"]}}]	23	1
283	2024-06-16 00:32:23.231518+03:30	ae61003f-3	Transactions object (ae61003f-3)	3		23	1
284	2024-06-16 00:32:44.400614+03:30	a060bb52-a	Transactions object (a060bb52-a)	3		23	1
285	2024-06-16 00:32:47.568323+03:30	9b4ebbcc-1	Transactions object (9b4ebbcc-1)	3		23	1
286	2024-06-16 00:33:07.457871+03:30	10	Transactions object (10)	2	[{"changed": {"fields": ["Id"]}}]	23	1
287	2024-06-16 00:33:19.033261+03:30	8-c	Transactions object (8-c)	3		23	1
288	2024-06-17 17:08:34.367203+03:30	16	balances	2	[{"changed": {"fields": ["Title", "Text"]}}]	8	1
289	2024-06-24 13:16:11.090327+03:30	1	AppSettings object (1)	1	[{"added": {}}]	47	1
290	2024-06-24 13:18:40.188783+03:30	1	AppSettings object (1)	2	[{"changed": {"fields": ["Welcometitle", "Welcometext"]}}]	47	1
291	2024-06-24 13:27:38.871887+03:30	1	AppSettings object (1)	2	[]	47	1
292	2024-06-24 13:29:22.100465+03:30	1	AppSettings object (1)	2	[{"changed": {"fields": ["Welcometext"]}}]	47	1
\.


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('django_admin_log_id_seq', 292, true);


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY django_content_type (id, app_label, model) FROM stdin;
1	auctions	user
2	auctions	act
3	auctions	banner
4	auctions	bazdid
5	auctions	blog
6	auctions	cat
7	auctions	currencies
8	auctions	details
9	auctions	elan
10	auctions	forget
11	auctions	general
12	auctions	miners
13	auctions	news
14	auctions	pages
15	auctions	plans
16	auctions	post
17	auctions	product
18	auctions	productorder
19	auctions	settings
20	auctions	tickets
21	auctions	wallet
22	auctions	verify
23	auctions	transactions
24	auctions	subjects
25	auctions	rentedminer
26	auctions	profitlist
27	auctions	job
28	auctions	bid
29	auctions	askamountreq
30	auctions	adminverifymelli
31	auctions	adminverifybank
32	auctions	addamountreq
33	auth	permission
34	auth	group
35	contenttypes	contenttype
36	chat	chatuser
37	chat	chatsession
38	chat	chatsessionmessage
39	chat	chatroom
40	chat	chattext
41	admin	logentry
42	sessions	session
43	authtoken	token
44	authtoken	tokenproxy
45	auctions	notification
46	auctions	transaction
47	auctions	appsettings
48	auctions	timer
\.


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('django_content_type_id_seq', 48, true);


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2024-05-21 11:25:12.13147+03:30
2	contenttypes	0002_remove_content_type_name	2024-05-21 11:25:12.142591+03:30
3	auth	0001_initial	2024-05-21 11:25:12.169147+03:30
4	auth	0002_alter_permission_name_max_length	2024-05-21 11:25:12.173487+03:30
5	auth	0003_alter_user_email_max_length	2024-05-21 11:25:12.178429+03:30
6	auth	0004_alter_user_username_opts	2024-05-21 11:25:12.183467+03:30
7	auth	0005_alter_user_last_login_null	2024-05-21 11:25:12.188562+03:30
8	auth	0006_require_contenttypes_0002	2024-05-21 11:25:12.190001+03:30
9	auth	0007_alter_validators_add_error_messages	2024-05-21 11:25:12.195137+03:30
10	auth	0008_alter_user_username_max_length	2024-05-21 11:25:12.200024+03:30
11	auth	0009_alter_user_last_name_max_length	2024-05-21 11:25:12.204696+03:30
12	auth	0010_alter_group_name_max_length	2024-05-21 11:25:12.210714+03:30
13	auth	0011_update_proxy_permissions	2024-05-21 11:25:12.217887+03:30
14	auth	0012_alter_user_first_name_max_length	2024-05-21 11:25:12.222505+03:30
15	auctions	0001_initial	2024-05-21 11:25:12.529587+03:30
16	admin	0001_initial	2024-05-21 11:26:48.228409+03:30
17	admin	0002_logentry_remove_auto_add	2024-05-21 11:26:48.241874+03:30
18	admin	0003_logentry_add_action_flag_choices	2024-05-21 11:26:48.256743+03:30
19	authtoken	0001_initial	2024-05-21 11:26:48.300715+03:30
20	authtoken	0002_auto_20160226_1747	2024-05-21 11:26:48.354797+03:30
21	authtoken	0003_tokenproxy	2024-05-21 11:26:48.357756+03:30
22	authtoken	0004_alter_tokenproxy_options	2024-05-21 11:26:48.362816+03:30
23	sessions	0001_initial	2024-05-21 11:26:48.372562+03:30
24	chat	0001_initial	2024-05-21 11:27:04.80266+03:30
25	auctions	0002_alter_transactions_id	2024-05-25 09:53:46.934594+03:30
26	auctions	0003_alter_transactions_id	2024-05-25 09:55:51.831233+03:30
27	auctions	0004_alter_transactions_id	2024-05-25 09:58:20.286337+03:30
28	auctions	0005_alter_transactions_id	2024-05-25 12:37:57.442973+03:30
29	auctions	0006_alter_transactions_id	2024-05-27 15:50:16.383893+03:30
30	chat	0002_chatuser_email	2024-05-27 15:50:16.391435+03:30
31	auctions	0007_auto_20240527_1559	2024-05-27 15:59:13.005547+03:30
32	auctions	0008_auto_20240527_1655	2024-05-27 16:55:22.896226+03:30
33	auctions	0009_alter_transactions_id	2024-05-28 16:12:40.77722+03:30
34	auctions	0010_alter_transactions_id	2024-05-31 16:30:40.073481+03:30
35	auctions	0011_auto_20240603_1139	2024-06-03 11:39:27.172532+03:30
36	auctions	0012_alter_transactions_id	2024-06-03 11:39:51.723679+03:30
37	auctions	0013_alter_transactions_id	2024-06-03 11:41:46.018053+03:30
38	auctions	0014_alter_transactions_id	2024-06-03 11:41:46.038097+03:30
39	auctions	0015_alter_transactions_id	2024-06-03 11:41:46.081375+03:30
40	auctions	0016_alter_transactions_id	2024-06-03 11:41:46.09692+03:30
41	auctions	0017_alter_transactions_id	2024-06-03 11:41:46.11247+03:30
42	auctions	0018_alter_transactions_id	2024-06-03 11:42:55.442346+03:30
43	auctions	0019_auto_20240603_1145	2024-06-03 11:45:43.836697+03:30
44	auctions	0020_auto_20240603_1159	2024-06-03 11:59:24.568936+03:30
45	auctions	0021_auto_20240603_1323	2024-06-03 13:23:48.316973+03:30
46	auctions	0022_alter_transactions_id	2024-06-03 13:51:01.752687+03:30
47	auctions	0023_alter_transactions_id	2024-06-03 13:51:55.788948+03:30
48	auctions	0024_alter_transactions_id	2024-06-03 14:06:46.959883+03:30
49	auctions	0025_auto_20240607_1636	2024-06-07 16:36:44.095841+03:30
50	auctions	0026_alter_transactions_id	2024-06-15 19:40:08.767435+03:30
51	auctions	0012_auto_20240615_1946	2024-06-15 19:47:24.605731+03:30
52	auctions	0002_auto_20240615_2357	2024-06-15 23:58:15.591107+03:30
53	auctions	0003_auto_20240615_2358	2024-06-15 23:59:08.648414+03:30
54	auctions	0007_alter_transactions_id	2024-06-16 00:38:45.125624+03:30
55	auctions	0008_alter_transactions_id	2024-06-16 00:52:08.708468+03:30
56	auctions	0009_transaction	2024-06-16 00:55:02.046711+03:30
57	auctions	0010_delete_transactions	2024-06-16 01:06:15.005672+03:30
58	auctions	0011_appsettings	2024-06-24 13:09:31.184393+03:30
59	auctions	0012_auto_20240626_1719	2024-06-26 17:19:14.936314+03:30
60	auctions	0013_alter_timer_date	2024-06-26 17:26:04.649676+03:30
\.


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ramabitc_ars
--

SELECT pg_catalog.setval('django_migrations_id_seq', 60, true);


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: ramabitc_ars
--

COPY django_session (session_key, session_data, expire_date) FROM stdin;
hce4lqwx44qguxdzk0pz75rm46pgi3o8	.eJxVjDsOwjAQBe_iGlks9uKYkj5niNbrFxxAjpRPhbg7REoB7ZuZ9zKdrEvp1hlTN2RzMWQOv1sSfaBuIN-l3karY12mIdlNsTudbTtmPK-7-3dQZC7fminAkaeQAELvI8XopFEORApVz30SbjiygM9ZXICcoN6phxyZzPsD4ho4Lg:1sB9UJ:jiDwAEqf-r_UL5gjwacD_oJ8aFBYuGX-slpeRhxRFI0	2024-06-09 12:14:19.319425+03:30
l9m58vxttyxi8dap1o4xhuoc596nxufo	.eJxVjMEOwiAQRP-FsyGlBcp69N5vILsslaqBpLQn479Lkx70NnnzZt7C474lv9e4-oXFVShx-WWE4RnzUfAD873IUPK2LiQPRZ5tlVPh-Lqd7t9Bwpra2oXOElEwJhrjcLCxZcUaXM80G3bYaQgaWUE_autGAELbSBxmq4HF5wv1Uzgg:1sE2v5:DC1DpFX2-s9mGKB2KiEiyWboWV90RwWS9KjSOI0ZdGQ	2024-06-17 11:49:55.385553+03:30
oie81izta6aw83s3m0grm7vfct8mk547	.eJxVjMEOwiAQRP-FsyGlBcp69N5vILsslaqBpLQn479Lkx70NnnzZt7C474lv9e4-oXFVShx-WWE4RnzUfAD873IUPK2LiQPRZ5tlVPh-Lqd7t9Bwpra2oXOElEwJhrjcLCxZcUaXM80G3bYaQgaWUE_autGAELbSBxmq4HF5wv1Uzgg:1sFAsd:6c7DvOErN5a2DIzTmWn3V6pgAsv3VwBNBcScl8IL2JU	2024-06-20 14:32:03.424404+03:30
5l8e1kfpwy7gh0g5vpouh3l2vly7i7jt	.eJxVjMEOwiAQRP-FsyGlBcp69N5vILsslaqBpLQn479Lkx70NnnzZt7C474lv9e4-oXFVShx-WWE4RnzUfAD873IUPK2LiQPRZ5tlVPh-Lqd7t9Bwpra2oXOElEwJhrjcLCxZcUaXM80G3bYaQgaWUE_autGAELbSBxmq4HF5wv1Uzgg:1sFgVK:aBoied1JCLG4lvlK0kEC6kFgGp91hwTpxs789z8u6bE	2024-06-22 00:18:06.457068+03:30
cudzrghw16ylun4v3ki201jiecnix96c	.eJxVjMEOwiAQRP-FsyGlBcp69N5vILsslaqBpLQn479Lkx70NnnzZt7C474lv9e4-oXFVShx-WWE4RnzUfAD873IUPK2LiQPRZ5tlVPh-Lqd7t9Bwpra2oXOElEwJhrjcLCxZcUaXM80G3bYaQgaWUE_autGAELbSBxmq4HF5wv1Uzgg:1sGQKS:HZtz6IUxSJWlG86JTv9mNDjnxRN6iY7KRFCsRbGH-28	2024-06-24 01:13:56.701396+03:30
9s6i0swmog0vrgywt5gmbaind2kd9265	.eJxVjMEOwiAQRP-FsyGlBcp69N5vILsslaqBpLQn479Lkx70NnnzZt7C474lv9e4-oXFVShx-WWE4RnzUfAD873IUPK2LiQPRZ5tlVPh-Lqd7t9Bwpra2oXOElEwJhrjcLCxZcUaXM80G3bYaQgaWUE_autGAELbSBxmq4HF5wv1Uzgg:1sGkkv:ZgpsArGPaOlGDgLTm1Kz2IbzSpz_s_RzQze5biaCvsY	2024-06-24 23:02:37.274083+03:30
qmu60boepu8d4nmqtr37lr4z4xqufr1e	.eJxVjMEOwiAQRP-FsyGlBcp69N5vILsslaqBpLQn479Lkx70NnnzZt7C474lv9e4-oXFVShx-WWE4RnzUfAD873IUPK2LiQPRZ5tlVPh-Lqd7t9Bwpra2oXOElEwJhrjcLCxZcUaXM80G3bYaQgaWUE_autGAELbSBxmq4HF5wv1Uzgg:1sHhy4:A0wFg_uIIR3UqGxbhQJ9dgV1GX2whsNqd5-6hFlHdpM	2024-06-27 14:16:08.125942+03:30
lfswnf3pnjsspwcpbpvixxwonjusy01z	.eJxVjMEOwiAQRP-FsyGlBcp69N5vILsslaqBpLQn479Lkx70NnnzZt7C474lv9e4-oXFVShx-WWE4RnzUfAD873IUPK2LiQPRZ5tlVPh-Lqd7t9Bwpra2oXOElEwJhrjcLCxZcUaXM80G3bYaQgaWUE_autGAELbSBxmq4HF5wv1Uzgg:1sLgGT:ds7uOF1pgHYew_P_aykiTgsrJxDBfSGG8RsFNiDeKlY	2024-07-08 13:15:33.060023+03:30
sp6ruq56c4o1wg2w8ogckvr39c1msukl	.eJxVjMEOwiAQRP-FsyGlBcp69N5vILsslaqBpLQn479Lkx70NnnzZt7C474lv9e4-oXFVShx-WWE4RnzUfAD873IUPK2LiQPRZ5tlVPh-Lqd7t9Bwpra2oXOElEwJhrjcLCxZcUaXM80G3bYaQgaWUE_autGAELbSBxmq4HF5wv1Uzgg:1sMT4M:Nc3ECkBf6xY6jDE5WC7llCJ3dwWR8u1qTRWfOeeA068	2024-07-10 17:22:18.41675+03:30
\.


--
-- Name: auctions_act_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_act
    ADD CONSTRAINT auctions_act_pkey PRIMARY KEY (aucid);


--
-- Name: auctions_addamountreq_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_addamountreq
    ADD CONSTRAINT auctions_addamountreq_pkey PRIMARY KEY (id);


--
-- Name: auctions_adminverifybank_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_adminverifybank
    ADD CONSTRAINT auctions_adminverifybank_pkey PRIMARY KEY (id);


--
-- Name: auctions_adminverifymelli_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_adminverifymelli
    ADD CONSTRAINT auctions_adminverifymelli_pkey PRIMARY KEY (id);


--
-- Name: auctions_appsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_appsettings
    ADD CONSTRAINT auctions_appsettings_pkey PRIMARY KEY (id);


--
-- Name: auctions_askamountreq_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_askamountreq
    ADD CONSTRAINT auctions_askamountreq_pkey PRIMARY KEY (id);


--
-- Name: auctions_banner_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_banner
    ADD CONSTRAINT auctions_banner_pkey PRIMARY KEY (id);


--
-- Name: auctions_bazdid_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_bazdid
    ADD CONSTRAINT auctions_bazdid_pkey PRIMARY KEY (id);


--
-- Name: auctions_bid_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_bid
    ADD CONSTRAINT auctions_bid_pkey PRIMARY KEY (id);


--
-- Name: auctions_blog_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_blog
    ADD CONSTRAINT auctions_blog_pkey PRIMARY KEY (id);


--
-- Name: auctions_cat_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_cat
    ADD CONSTRAINT auctions_cat_pkey PRIMARY KEY (name);


--
-- Name: auctions_currencies_align_key; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_currencies
    ADD CONSTRAINT auctions_currencies_align_key UNIQUE (align);


--
-- Name: auctions_currencies_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_currencies
    ADD CONSTRAINT auctions_currencies_pkey PRIMARY KEY (id);


--
-- Name: auctions_details_page_key; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_details
    ADD CONSTRAINT auctions_details_page_key UNIQUE (page);


--
-- Name: auctions_details_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_details
    ADD CONSTRAINT auctions_details_pkey PRIMARY KEY (id);


--
-- Name: auctions_elan_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_elan
    ADD CONSTRAINT auctions_elan_pkey PRIMARY KEY (id);


--
-- Name: auctions_forget_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_forget
    ADD CONSTRAINT auctions_forget_pkey PRIMARY KEY (key);


--
-- Name: auctions_general_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_general
    ADD CONSTRAINT auctions_general_pkey PRIMARY KEY (id);


--
-- Name: auctions_job_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_job
    ADD CONSTRAINT auctions_job_pkey PRIMARY KEY (id);


--
-- Name: auctions_miners_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_miners
    ADD CONSTRAINT auctions_miners_pkey PRIMARY KEY (id);


--
-- Name: auctions_news_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_news
    ADD CONSTRAINT auctions_news_pkey PRIMARY KEY (id);


--
-- Name: auctions_notification_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_notification
    ADD CONSTRAINT auctions_notification_pkey PRIMARY KEY (id);


--
-- Name: auctions_pages_name_key; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_pages
    ADD CONSTRAINT auctions_pages_name_key UNIQUE (name);


--
-- Name: auctions_pages_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_pages
    ADD CONSTRAINT auctions_pages_pkey PRIMARY KEY (id);


--
-- Name: auctions_plans_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_plans
    ADD CONSTRAINT auctions_plans_pkey PRIMARY KEY (id);


--
-- Name: auctions_post_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_post
    ADD CONSTRAINT auctions_post_pkey PRIMARY KEY (id);


--
-- Name: auctions_product_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_product
    ADD CONSTRAINT auctions_product_pkey PRIMARY KEY (id);


--
-- Name: auctions_productorder_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_productorder
    ADD CONSTRAINT auctions_productorder_pkey PRIMARY KEY (id);


--
-- Name: auctions_profitlist_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_profitlist
    ADD CONSTRAINT auctions_profitlist_pkey PRIMARY KEY (id);


--
-- Name: auctions_rentedminer_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_rentedminer
    ADD CONSTRAINT auctions_rentedminer_pkey PRIMARY KEY (id);


--
-- Name: auctions_settings_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_settings
    ADD CONSTRAINT auctions_settings_pkey PRIMARY KEY (id);


--
-- Name: auctions_subjects_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_subjects
    ADD CONSTRAINT auctions_subjects_pkey PRIMARY KEY (id);


--
-- Name: auctions_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_tickets
    ADD CONSTRAINT auctions_tickets_pkey PRIMARY KEY (id);


--
-- Name: auctions_timer_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_timer
    ADD CONSTRAINT auctions_timer_pkey PRIMARY KEY (id);


--
-- Name: auctions_transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_transaction
    ADD CONSTRAINT auctions_transaction_pkey PRIMARY KEY (id);


--
-- Name: auctions_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_groups
    ADD CONSTRAINT auctions_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auctions_user_groups_user_id_group_id_1f941809_uniq; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_groups
    ADD CONSTRAINT auctions_user_groups_user_id_group_id_1f941809_uniq UNIQUE (user_id, group_id);


--
-- Name: auctions_user_level1_from_user_id_to_user_id_52fbd7ca_uniq; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_level1
    ADD CONSTRAINT auctions_user_level1_from_user_id_to_user_id_52fbd7ca_uniq UNIQUE (from_user_id, to_user_id);


--
-- Name: auctions_user_level1_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_level1
    ADD CONSTRAINT auctions_user_level1_pkey PRIMARY KEY (id);


--
-- Name: auctions_user_level2_from_user_id_to_user_id_181ce980_uniq; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_level2
    ADD CONSTRAINT auctions_user_level2_from_user_id_to_user_id_181ce980_uniq UNIQUE (from_user_id, to_user_id);


--
-- Name: auctions_user_level2_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_level2
    ADD CONSTRAINT auctions_user_level2_pkey PRIMARY KEY (id);


--
-- Name: auctions_user_level3_from_user_id_to_user_id_a2598824_uniq; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_level3
    ADD CONSTRAINT auctions_user_level3_from_user_id_to_user_id_a2598824_uniq UNIQUE (from_user_id, to_user_id);


--
-- Name: auctions_user_level3_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_level3
    ADD CONSTRAINT auctions_user_level3_pkey PRIMARY KEY (id);


--
-- Name: auctions_user_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user
    ADD CONSTRAINT auctions_user_pkey PRIMARY KEY (id);


--
-- Name: auctions_user_ref_key; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user
    ADD CONSTRAINT auctions_user_ref_key UNIQUE (ref);


--
-- Name: auctions_user_user_permi_user_id_permission_id_f092bc2e_uniq; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_user_permissions
    ADD CONSTRAINT auctions_user_user_permi_user_id_permission_id_f092bc2e_uniq UNIQUE (user_id, permission_id);


--
-- Name: auctions_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user_user_permissions
    ADD CONSTRAINT auctions_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auctions_user_username_key; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_user
    ADD CONSTRAINT auctions_user_username_key UNIQUE (username);


--
-- Name: auctions_verify_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_verify
    ADD CONSTRAINT auctions_verify_pkey PRIMARY KEY (id);


--
-- Name: auctions_wallet_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auctions_wallet
    ADD CONSTRAINT auctions_wallet_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: chat_chatroom_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY chat_chatroom
    ADD CONSTRAINT chat_chatroom_pkey PRIMARY KEY (id);


--
-- Name: chat_chatsession_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY chat_chatsession
    ADD CONSTRAINT chat_chatsession_pkey PRIMARY KEY (id);


--
-- Name: chat_chatsessionmessage_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY chat_chatsessionmessage
    ADD CONSTRAINT chat_chatsessionmessage_pkey PRIMARY KEY (id);


--
-- Name: chat_chattext_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY chat_chattext
    ADD CONSTRAINT chat_chattext_pkey PRIMARY KEY (id);


--
-- Name: chat_chatuser_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY chat_chatuser
    ADD CONSTRAINT chat_chatuser_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

ALTER TABLE ONLY django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: auctions_addamountreq_currency_id_9f53638b; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_addamountreq_currency_id_9f53638b ON auctions_addamountreq USING btree (currency_id);


--
-- Name: auctions_addamountreq_user_id_142596c2; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_addamountreq_user_id_142596c2 ON auctions_addamountreq USING btree (user_id);


--
-- Name: auctions_adminverifybank_user_id_dea85143; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_adminverifybank_user_id_dea85143 ON auctions_adminverifybank USING btree (user_id);


--
-- Name: auctions_adminverifymelli_user_id_838bff28; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_adminverifymelli_user_id_838bff28 ON auctions_adminverifymelli USING btree (user_id);


--
-- Name: auctions_askamountreq_currency_id_7acba0ff; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_askamountreq_currency_id_7acba0ff ON auctions_askamountreq USING btree (currency_id);


--
-- Name: auctions_askamountreq_user_id_1fa59c52; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_askamountreq_user_id_1fa59c52 ON auctions_askamountreq USING btree (user_id);


--
-- Name: auctions_bid_plan_id_2f9f8de8; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_bid_plan_id_2f9f8de8 ON auctions_bid USING btree (plan_id);


--
-- Name: auctions_bid_user_id_6b863bd2; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_bid_user_id_6b863bd2 ON auctions_bid USING btree (user_id);


--
-- Name: auctions_cat_name_37336829_like; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_cat_name_37336829_like ON auctions_cat USING btree (name varchar_pattern_ops);


--
-- Name: auctions_details_page_52b25a1e_like; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_details_page_52b25a1e_like ON auctions_details USING btree (page varchar_pattern_ops);


--
-- Name: auctions_job_user_id_1e9d88c1; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_job_user_id_1e9d88c1 ON auctions_job USING btree (user_id);


--
-- Name: auctions_miners_currency_id_68c197c3; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_miners_currency_id_68c197c3 ON auctions_miners USING btree (currency_id);


--
-- Name: auctions_notification_user_id_44f032e2; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_notification_user_id_44f032e2 ON auctions_notification USING btree (user_id);


--
-- Name: auctions_pages_name_23e2839b_like; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_pages_name_23e2839b_like ON auctions_pages USING btree (name varchar_pattern_ops);


--
-- Name: auctions_plans_currency_id_d21cf0a1; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_plans_currency_id_d21cf0a1 ON auctions_plans USING btree (currency_id);


--
-- Name: auctions_profitlist_currency_id_475dfb17; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_profitlist_currency_id_475dfb17 ON auctions_profitlist USING btree (currency_id);


--
-- Name: auctions_profitlist_plan_id_66ee6c43; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_profitlist_plan_id_66ee6c43 ON auctions_profitlist USING btree (plan_id);


--
-- Name: auctions_profitlist_user_id_ef82725d; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_profitlist_user_id_ef82725d ON auctions_profitlist USING btree (user_id);


--
-- Name: auctions_rentedminer_miner_id_9b3b0536; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_rentedminer_miner_id_9b3b0536 ON auctions_rentedminer USING btree (miner_id);


--
-- Name: auctions_rentedminer_user_id_797273ae; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_rentedminer_user_id_797273ae ON auctions_rentedminer USING btree (user_id);


--
-- Name: auctions_subjects_user_id_43e2cd89; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_subjects_user_id_43e2cd89 ON auctions_subjects USING btree (user_id);


--
-- Name: auctions_timer_user_id_557903bf; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_timer_user_id_557903bf ON auctions_timer USING btree (user_id);


--
-- Name: auctions_transaction_currency_id_f84f605d; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_transaction_currency_id_f84f605d ON auctions_transaction USING btree (currency_id);


--
-- Name: auctions_transaction_user_id_92f4a1df; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_transaction_user_id_92f4a1df ON auctions_transaction USING btree (user_id);


--
-- Name: auctions_user_groups_group_id_beef25ba; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_groups_group_id_beef25ba ON auctions_user_groups USING btree (group_id);


--
-- Name: auctions_user_groups_user_id_cdaa1ab3; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_groups_user_id_cdaa1ab3 ON auctions_user_groups USING btree (user_id);


--
-- Name: auctions_user_level1_from_user_id_e4fc9d7e; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_level1_from_user_id_e4fc9d7e ON auctions_user_level1 USING btree (from_user_id);


--
-- Name: auctions_user_level1_to_user_id_191308e3; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_level1_to_user_id_191308e3 ON auctions_user_level1 USING btree (to_user_id);


--
-- Name: auctions_user_level2_from_user_id_809ba92f; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_level2_from_user_id_809ba92f ON auctions_user_level2 USING btree (from_user_id);


--
-- Name: auctions_user_level2_to_user_id_5506d7fd; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_level2_to_user_id_5506d7fd ON auctions_user_level2 USING btree (to_user_id);


--
-- Name: auctions_user_level3_from_user_id_71a96739; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_level3_from_user_id_71a96739 ON auctions_user_level3 USING btree (from_user_id);


--
-- Name: auctions_user_level3_to_user_id_bd28f946; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_level3_to_user_id_bd28f946 ON auctions_user_level3 USING btree (to_user_id);


--
-- Name: auctions_user_ref_54ba4088_like; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_ref_54ba4088_like ON auctions_user USING btree (ref varchar_pattern_ops);


--
-- Name: auctions_user_user_permissions_permission_id_6cab40d7; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_user_permissions_permission_id_6cab40d7 ON auctions_user_user_permissions USING btree (permission_id);


--
-- Name: auctions_user_user_permissions_user_id_fec24fe0; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_user_permissions_user_id_fec24fe0 ON auctions_user_user_permissions USING btree (user_id);


--
-- Name: auctions_user_username_0a343f0a_like; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_user_username_0a343f0a_like ON auctions_user USING btree (username varchar_pattern_ops);


--
-- Name: auctions_verify_user_id_7f1916f8; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_verify_user_id_7f1916f8 ON auctions_verify USING btree (user_id);


--
-- Name: auctions_wallet_currency_id_79ef43f5; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_wallet_currency_id_79ef43f5 ON auctions_wallet USING btree (currency_id);


--
-- Name: auctions_wallet_user_id_63b79fb5; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auctions_wallet_user_id_63b79fb5 ON auctions_wallet USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auth_group_name_a6ea08ec_like ON auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: chat_chatroom_user1_id_8058b223; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX chat_chatroom_user1_id_8058b223 ON chat_chatroom USING btree (user1_id);


--
-- Name: chat_chatroom_user2_id_72f3f217; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX chat_chatroom_user2_id_72f3f217 ON chat_chatroom USING btree (user2_id);


--
-- Name: chat_chatsession_owner_id_aec267f8; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX chat_chatsession_owner_id_aec267f8 ON chat_chatsession USING btree (owner_id);


--
-- Name: chat_chatsessionmessage_chat_session_id_377a3b7c; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX chat_chatsessionmessage_chat_session_id_377a3b7c ON chat_chatsessionmessage USING btree (chat_session_id);


--
-- Name: chat_chatsessionmessage_user_id_b5f88be1; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX chat_chatsessionmessage_user_id_b5f88be1 ON chat_chatsessionmessage USING btree (user_id);


--
-- Name: chat_chattext_room_id_a983cfaf; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX chat_chattext_room_id_a983cfaf ON chat_chattext USING btree (room_id);


--
-- Name: chat_chattext_user_id_7f221cd8; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX chat_chattext_user_id_7f221cd8 ON chat_chattext USING btree (user_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX django_session_expire_date_a5c62663 ON django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: ramabitc_ars; Tablespace: 
--

CREATE INDEX django_session_session_key_c0390e0f_like ON django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: auctions_addamountre_currency_id_9f53638b_fk_auctions_; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_addamountreq
    ADD CONSTRAINT auctions_addamountre_currency_id_9f53638b_fk_auctions_ FOREIGN KEY (currency_id) REFERENCES auctions_currencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_addamountreq_user_id_142596c2_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_addamountreq
    ADD CONSTRAINT auctions_addamountreq_user_id_142596c2_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_adminverifybank_user_id_dea85143_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_adminverifybank
    ADD CONSTRAINT auctions_adminverifybank_user_id_dea85143_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_adminverifymelli_user_id_838bff28_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_adminverifymelli
    ADD CONSTRAINT auctions_adminverifymelli_user_id_838bff28_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_askamountre_currency_id_7acba0ff_fk_auctions_; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_askamountreq
    ADD CONSTRAINT auctions_askamountre_currency_id_7acba0ff_fk_auctions_ FOREIGN KEY (currency_id) REFERENCES auctions_currencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_askamountreq_user_id_1fa59c52_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_askamountreq
    ADD CONSTRAINT auctions_askamountreq_user_id_1fa59c52_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_bid_plan_id_2f9f8de8_fk_auctions_plans_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_bid
    ADD CONSTRAINT auctions_bid_plan_id_2f9f8de8_fk_auctions_plans_id FOREIGN KEY (plan_id) REFERENCES auctions_plans(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_bid_user_id_6b863bd2_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_bid
    ADD CONSTRAINT auctions_bid_user_id_6b863bd2_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_job_user_id_1e9d88c1_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_job
    ADD CONSTRAINT auctions_job_user_id_1e9d88c1_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_miners_currency_id_68c197c3_fk_auctions_currencies_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_miners
    ADD CONSTRAINT auctions_miners_currency_id_68c197c3_fk_auctions_currencies_id FOREIGN KEY (currency_id) REFERENCES auctions_currencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_notification_user_id_44f032e2_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_notification
    ADD CONSTRAINT auctions_notification_user_id_44f032e2_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_plans_currency_id_d21cf0a1_fk_auctions_currencies_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_plans
    ADD CONSTRAINT auctions_plans_currency_id_d21cf0a1_fk_auctions_currencies_id FOREIGN KEY (currency_id) REFERENCES auctions_currencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_profitlist_currency_id_475dfb17_fk_auctions_; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_profitlist
    ADD CONSTRAINT auctions_profitlist_currency_id_475dfb17_fk_auctions_ FOREIGN KEY (currency_id) REFERENCES auctions_currencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_profitlist_plan_id_66ee6c43_fk_auctions_plans_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_profitlist
    ADD CONSTRAINT auctions_profitlist_plan_id_66ee6c43_fk_auctions_plans_id FOREIGN KEY (plan_id) REFERENCES auctions_plans(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_profitlist_user_id_ef82725d_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_profitlist
    ADD CONSTRAINT auctions_profitlist_user_id_ef82725d_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_rentedminer_miner_id_9b3b0536_fk_auctions_miners_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_rentedminer
    ADD CONSTRAINT auctions_rentedminer_miner_id_9b3b0536_fk_auctions_miners_id FOREIGN KEY (miner_id) REFERENCES auctions_miners(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_rentedminer_user_id_797273ae_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_rentedminer
    ADD CONSTRAINT auctions_rentedminer_user_id_797273ae_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_subjects_user_id_43e2cd89_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_subjects
    ADD CONSTRAINT auctions_subjects_user_id_43e2cd89_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_timer_user_id_557903bf_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_timer
    ADD CONSTRAINT auctions_timer_user_id_557903bf_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_transaction_currency_id_f84f605d_fk_auctions_; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_transaction
    ADD CONSTRAINT auctions_transaction_currency_id_f84f605d_fk_auctions_ FOREIGN KEY (currency_id) REFERENCES auctions_currencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_transaction_user_id_92f4a1df_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_transaction
    ADD CONSTRAINT auctions_transaction_user_id_92f4a1df_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_groups_group_id_beef25ba_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_groups
    ADD CONSTRAINT auctions_user_groups_group_id_beef25ba_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_groups_user_id_cdaa1ab3_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_groups
    ADD CONSTRAINT auctions_user_groups_user_id_cdaa1ab3_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_level1_from_user_id_e4fc9d7e_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_level1
    ADD CONSTRAINT auctions_user_level1_from_user_id_e4fc9d7e_fk_auctions_user_id FOREIGN KEY (from_user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_level1_to_user_id_191308e3_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_level1
    ADD CONSTRAINT auctions_user_level1_to_user_id_191308e3_fk_auctions_user_id FOREIGN KEY (to_user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_level2_from_user_id_809ba92f_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_level2
    ADD CONSTRAINT auctions_user_level2_from_user_id_809ba92f_fk_auctions_user_id FOREIGN KEY (from_user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_level2_to_user_id_5506d7fd_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_level2
    ADD CONSTRAINT auctions_user_level2_to_user_id_5506d7fd_fk_auctions_user_id FOREIGN KEY (to_user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_level3_from_user_id_71a96739_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_level3
    ADD CONSTRAINT auctions_user_level3_from_user_id_71a96739_fk_auctions_user_id FOREIGN KEY (from_user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_level3_to_user_id_bd28f946_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_level3
    ADD CONSTRAINT auctions_user_level3_to_user_id_bd28f946_fk_auctions_user_id FOREIGN KEY (to_user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_user_p_permission_id_6cab40d7_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_user_permissions
    ADD CONSTRAINT auctions_user_user_p_permission_id_6cab40d7_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_user_user_p_user_id_fec24fe0_fk_auctions_; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_user_user_permissions
    ADD CONSTRAINT auctions_user_user_p_user_id_fec24fe0_fk_auctions_ FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_verify_user_id_7f1916f8_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_verify
    ADD CONSTRAINT auctions_verify_user_id_7f1916f8_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_wallet_currency_id_79ef43f5_fk_auctions_currencies_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_wallet
    ADD CONSTRAINT auctions_wallet_currency_id_79ef43f5_fk_auctions_currencies_id FOREIGN KEY (currency_id) REFERENCES auctions_currencies(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auctions_wallet_user_id_63b79fb5_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auctions_wallet
    ADD CONSTRAINT auctions_wallet_user_id_63b79fb5_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token_user_id_35299eff_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatroom_user1_id_8058b223_fk_chat_chatuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chatroom
    ADD CONSTRAINT chat_chatroom_user1_id_8058b223_fk_chat_chatuser_id FOREIGN KEY (user1_id) REFERENCES chat_chatuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatroom_user2_id_72f3f217_fk_chat_chatuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chatroom
    ADD CONSTRAINT chat_chatroom_user2_id_72f3f217_fk_chat_chatuser_id FOREIGN KEY (user2_id) REFERENCES chat_chatuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatsession_owner_id_aec267f8_fk_chat_chatuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chatsession
    ADD CONSTRAINT chat_chatsession_owner_id_aec267f8_fk_chat_chatuser_id FOREIGN KEY (owner_id) REFERENCES chat_chatuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatsessionmess_chat_session_id_377a3b7c_fk_chat_chat; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chatsessionmessage
    ADD CONSTRAINT chat_chatsessionmess_chat_session_id_377a3b7c_fk_chat_chat FOREIGN KEY (chat_session_id) REFERENCES chat_chatsession(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chatsessionmessage_user_id_b5f88be1_fk_chat_chatuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chatsessionmessage
    ADD CONSTRAINT chat_chatsessionmessage_user_id_b5f88be1_fk_chat_chatuser_id FOREIGN KEY (user_id) REFERENCES chat_chatuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chattext_room_id_a983cfaf_fk_chat_chatroom_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chattext
    ADD CONSTRAINT chat_chattext_room_id_a983cfaf_fk_chat_chatroom_id FOREIGN KEY (room_id) REFERENCES chat_chatroom(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: chat_chattext_user_id_7f221cd8_fk_chat_chatuser_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY chat_chattext
    ADD CONSTRAINT chat_chattext_user_id_7f221cd8_fk_chat_chatuser_id FOREIGN KEY (user_id) REFERENCES chat_chatuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log_user_id_c564eba6_fk_auctions_user_id; Type: FK CONSTRAINT; Schema: public; Owner: ramabitc_ars
--

ALTER TABLE ONLY django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auctions_user_id FOREIGN KEY (user_id) REFERENCES auctions_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: auctions_act; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_act FROM PUBLIC;
REVOKE ALL ON TABLE auctions_act FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_act TO ramabitc_ars;
GRANT ALL ON TABLE auctions_act TO ramabitc_newramabit;


--
-- Name: auctions_addamountreq; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_addamountreq FROM PUBLIC;
REVOKE ALL ON TABLE auctions_addamountreq FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_addamountreq TO ramabitc_ars;
GRANT ALL ON TABLE auctions_addamountreq TO ramabitc_newramabit;


--
-- Name: auctions_adminverifybank; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_adminverifybank FROM PUBLIC;
REVOKE ALL ON TABLE auctions_adminverifybank FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_adminverifybank TO ramabitc_ars;
GRANT ALL ON TABLE auctions_adminverifybank TO ramabitc_newramabit;


--
-- Name: auctions_adminverifymelli; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_adminverifymelli FROM PUBLIC;
REVOKE ALL ON TABLE auctions_adminverifymelli FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_adminverifymelli TO ramabitc_ars;
GRANT ALL ON TABLE auctions_adminverifymelli TO ramabitc_newramabit;


--
-- Name: auctions_appsettings; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_appsettings FROM PUBLIC;
REVOKE ALL ON TABLE auctions_appsettings FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_appsettings TO ramabitc_ars;
GRANT ALL ON TABLE auctions_appsettings TO ramabitc_newramabit;


--
-- Name: auctions_askamountreq; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_askamountreq FROM PUBLIC;
REVOKE ALL ON TABLE auctions_askamountreq FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_askamountreq TO ramabitc_ars;
GRANT ALL ON TABLE auctions_askamountreq TO ramabitc_newramabit;


--
-- Name: auctions_banner; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_banner FROM PUBLIC;
REVOKE ALL ON TABLE auctions_banner FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_banner TO ramabitc_ars;
GRANT ALL ON TABLE auctions_banner TO ramabitc_newramabit;


--
-- Name: auctions_bazdid; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_bazdid FROM PUBLIC;
REVOKE ALL ON TABLE auctions_bazdid FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_bazdid TO ramabitc_ars;
GRANT ALL ON TABLE auctions_bazdid TO ramabitc_newramabit;


--
-- Name: auctions_bid; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_bid FROM PUBLIC;
REVOKE ALL ON TABLE auctions_bid FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_bid TO ramabitc_ars;
GRANT ALL ON TABLE auctions_bid TO ramabitc_newramabit;


--
-- Name: auctions_blog; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_blog FROM PUBLIC;
REVOKE ALL ON TABLE auctions_blog FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_blog TO ramabitc_ars;
GRANT ALL ON TABLE auctions_blog TO ramabitc_newramabit;


--
-- Name: auctions_cat; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_cat FROM PUBLIC;
REVOKE ALL ON TABLE auctions_cat FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_cat TO ramabitc_ars;
GRANT ALL ON TABLE auctions_cat TO ramabitc_newramabit;


--
-- Name: auctions_currencies; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_currencies FROM PUBLIC;
REVOKE ALL ON TABLE auctions_currencies FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_currencies TO ramabitc_ars;
GRANT ALL ON TABLE auctions_currencies TO ramabitc_newramabit;


--
-- Name: auctions_details; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_details FROM PUBLIC;
REVOKE ALL ON TABLE auctions_details FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_details TO ramabitc_ars;
GRANT ALL ON TABLE auctions_details TO ramabitc_newramabit;


--
-- Name: auctions_elan; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_elan FROM PUBLIC;
REVOKE ALL ON TABLE auctions_elan FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_elan TO ramabitc_ars;
GRANT ALL ON TABLE auctions_elan TO ramabitc_newramabit;


--
-- Name: auctions_forget; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_forget FROM PUBLIC;
REVOKE ALL ON TABLE auctions_forget FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_forget TO ramabitc_ars;
GRANT ALL ON TABLE auctions_forget TO ramabitc_newramabit;


--
-- Name: auctions_general; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_general FROM PUBLIC;
REVOKE ALL ON TABLE auctions_general FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_general TO ramabitc_ars;
GRANT ALL ON TABLE auctions_general TO ramabitc_newramabit;


--
-- Name: auctions_job; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_job FROM PUBLIC;
REVOKE ALL ON TABLE auctions_job FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_job TO ramabitc_ars;
GRANT ALL ON TABLE auctions_job TO ramabitc_newramabit;


--
-- Name: auctions_miners; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_miners FROM PUBLIC;
REVOKE ALL ON TABLE auctions_miners FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_miners TO ramabitc_ars;
GRANT ALL ON TABLE auctions_miners TO ramabitc_newramabit;


--
-- Name: auctions_news; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_news FROM PUBLIC;
REVOKE ALL ON TABLE auctions_news FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_news TO ramabitc_ars;
GRANT ALL ON TABLE auctions_news TO ramabitc_newramabit;


--
-- Name: auctions_notification; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_notification FROM PUBLIC;
REVOKE ALL ON TABLE auctions_notification FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_notification TO ramabitc_ars;
GRANT ALL ON TABLE auctions_notification TO ramabitc_newramabit;


--
-- Name: auctions_pages; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_pages FROM PUBLIC;
REVOKE ALL ON TABLE auctions_pages FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_pages TO ramabitc_ars;
GRANT ALL ON TABLE auctions_pages TO ramabitc_newramabit;


--
-- Name: auctions_plans; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_plans FROM PUBLIC;
REVOKE ALL ON TABLE auctions_plans FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_plans TO ramabitc_ars;
GRANT ALL ON TABLE auctions_plans TO ramabitc_newramabit;


--
-- Name: auctions_post; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_post FROM PUBLIC;
REVOKE ALL ON TABLE auctions_post FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_post TO ramabitc_ars;
GRANT ALL ON TABLE auctions_post TO ramabitc_newramabit;


--
-- Name: auctions_product; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_product FROM PUBLIC;
REVOKE ALL ON TABLE auctions_product FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_product TO ramabitc_ars;
GRANT ALL ON TABLE auctions_product TO ramabitc_newramabit;


--
-- Name: auctions_productorder; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_productorder FROM PUBLIC;
REVOKE ALL ON TABLE auctions_productorder FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_productorder TO ramabitc_ars;
GRANT ALL ON TABLE auctions_productorder TO ramabitc_newramabit;


--
-- Name: auctions_profitlist; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_profitlist FROM PUBLIC;
REVOKE ALL ON TABLE auctions_profitlist FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_profitlist TO ramabitc_ars;
GRANT ALL ON TABLE auctions_profitlist TO ramabitc_newramabit;


--
-- Name: auctions_rentedminer; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_rentedminer FROM PUBLIC;
REVOKE ALL ON TABLE auctions_rentedminer FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_rentedminer TO ramabitc_ars;
GRANT ALL ON TABLE auctions_rentedminer TO ramabitc_newramabit;


--
-- Name: auctions_settings; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_settings FROM PUBLIC;
REVOKE ALL ON TABLE auctions_settings FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_settings TO ramabitc_ars;
GRANT ALL ON TABLE auctions_settings TO ramabitc_newramabit;


--
-- Name: auctions_subjects; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_subjects FROM PUBLIC;
REVOKE ALL ON TABLE auctions_subjects FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_subjects TO ramabitc_ars;
GRANT ALL ON TABLE auctions_subjects TO ramabitc_newramabit;


--
-- Name: auctions_tickets; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_tickets FROM PUBLIC;
REVOKE ALL ON TABLE auctions_tickets FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_tickets TO ramabitc_ars;
GRANT ALL ON TABLE auctions_tickets TO ramabitc_newramabit;


--
-- Name: auctions_timer; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_timer FROM PUBLIC;
REVOKE ALL ON TABLE auctions_timer FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_timer TO ramabitc_ars;
GRANT ALL ON TABLE auctions_timer TO ramabitc_newramabit;


--
-- Name: auctions_transaction; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_transaction FROM PUBLIC;
REVOKE ALL ON TABLE auctions_transaction FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_transaction TO ramabitc_ars;
GRANT ALL ON TABLE auctions_transaction TO ramabitc_newramabit;


--
-- Name: auctions_user; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_user FROM PUBLIC;
REVOKE ALL ON TABLE auctions_user FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_user TO ramabitc_ars;
GRANT ALL ON TABLE auctions_user TO ramabitc_newramabit;


--
-- Name: auctions_user_groups; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_user_groups FROM PUBLIC;
REVOKE ALL ON TABLE auctions_user_groups FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_user_groups TO ramabitc_ars;
GRANT ALL ON TABLE auctions_user_groups TO ramabitc_newramabit;


--
-- Name: auctions_user_level1; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_user_level1 FROM PUBLIC;
REVOKE ALL ON TABLE auctions_user_level1 FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_user_level1 TO ramabitc_ars;
GRANT ALL ON TABLE auctions_user_level1 TO ramabitc_newramabit;


--
-- Name: auctions_user_level2; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_user_level2 FROM PUBLIC;
REVOKE ALL ON TABLE auctions_user_level2 FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_user_level2 TO ramabitc_ars;
GRANT ALL ON TABLE auctions_user_level2 TO ramabitc_newramabit;


--
-- Name: auctions_user_level3; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_user_level3 FROM PUBLIC;
REVOKE ALL ON TABLE auctions_user_level3 FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_user_level3 TO ramabitc_ars;
GRANT ALL ON TABLE auctions_user_level3 TO ramabitc_newramabit;


--
-- Name: auctions_user_user_permissions; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_user_user_permissions FROM PUBLIC;
REVOKE ALL ON TABLE auctions_user_user_permissions FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_user_user_permissions TO ramabitc_ars;
GRANT ALL ON TABLE auctions_user_user_permissions TO ramabitc_newramabit;


--
-- Name: auctions_verify; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_verify FROM PUBLIC;
REVOKE ALL ON TABLE auctions_verify FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_verify TO ramabitc_ars;
GRANT ALL ON TABLE auctions_verify TO ramabitc_newramabit;


--
-- Name: auctions_wallet; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auctions_wallet FROM PUBLIC;
REVOKE ALL ON TABLE auctions_wallet FROM ramabitc_ars;
GRANT ALL ON TABLE auctions_wallet TO ramabitc_ars;
GRANT ALL ON TABLE auctions_wallet TO ramabitc_newramabit;


--
-- Name: auth_group; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auth_group FROM PUBLIC;
REVOKE ALL ON TABLE auth_group FROM ramabitc_ars;
GRANT ALL ON TABLE auth_group TO ramabitc_ars;
GRANT ALL ON TABLE auth_group TO ramabitc_newramabit;


--
-- Name: auth_group_permissions; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auth_group_permissions FROM PUBLIC;
REVOKE ALL ON TABLE auth_group_permissions FROM ramabitc_ars;
GRANT ALL ON TABLE auth_group_permissions TO ramabitc_ars;
GRANT ALL ON TABLE auth_group_permissions TO ramabitc_newramabit;


--
-- Name: auth_permission; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE auth_permission FROM PUBLIC;
REVOKE ALL ON TABLE auth_permission FROM ramabitc_ars;
GRANT ALL ON TABLE auth_permission TO ramabitc_ars;
GRANT ALL ON TABLE auth_permission TO ramabitc_newramabit;


--
-- Name: authtoken_token; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE authtoken_token FROM PUBLIC;
REVOKE ALL ON TABLE authtoken_token FROM ramabitc_ars;
GRANT ALL ON TABLE authtoken_token TO ramabitc_ars;
GRANT ALL ON TABLE authtoken_token TO ramabitc_newramabit;


--
-- Name: chat_chatroom; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE chat_chatroom FROM PUBLIC;
REVOKE ALL ON TABLE chat_chatroom FROM ramabitc_ars;
GRANT ALL ON TABLE chat_chatroom TO ramabitc_ars;
GRANT ALL ON TABLE chat_chatroom TO ramabitc_newramabit;


--
-- Name: chat_chatsession; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE chat_chatsession FROM PUBLIC;
REVOKE ALL ON TABLE chat_chatsession FROM ramabitc_ars;
GRANT ALL ON TABLE chat_chatsession TO ramabitc_ars;
GRANT ALL ON TABLE chat_chatsession TO ramabitc_newramabit;


--
-- Name: chat_chatsessionmessage; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE chat_chatsessionmessage FROM PUBLIC;
REVOKE ALL ON TABLE chat_chatsessionmessage FROM ramabitc_ars;
GRANT ALL ON TABLE chat_chatsessionmessage TO ramabitc_ars;
GRANT ALL ON TABLE chat_chatsessionmessage TO ramabitc_newramabit;


--
-- Name: chat_chattext; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE chat_chattext FROM PUBLIC;
REVOKE ALL ON TABLE chat_chattext FROM ramabitc_ars;
GRANT ALL ON TABLE chat_chattext TO ramabitc_ars;
GRANT ALL ON TABLE chat_chattext TO ramabitc_newramabit;


--
-- Name: chat_chatuser; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE chat_chatuser FROM PUBLIC;
REVOKE ALL ON TABLE chat_chatuser FROM ramabitc_ars;
GRANT ALL ON TABLE chat_chatuser TO ramabitc_ars;
GRANT ALL ON TABLE chat_chatuser TO ramabitc_newramabit;


--
-- Name: django_admin_log; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE django_admin_log FROM PUBLIC;
REVOKE ALL ON TABLE django_admin_log FROM ramabitc_ars;
GRANT ALL ON TABLE django_admin_log TO ramabitc_ars;
GRANT ALL ON TABLE django_admin_log TO ramabitc_newramabit;


--
-- Name: django_content_type; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE django_content_type FROM PUBLIC;
REVOKE ALL ON TABLE django_content_type FROM ramabitc_ars;
GRANT ALL ON TABLE django_content_type TO ramabitc_ars;
GRANT ALL ON TABLE django_content_type TO ramabitc_newramabit;


--
-- Name: django_migrations; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE django_migrations FROM PUBLIC;
REVOKE ALL ON TABLE django_migrations FROM ramabitc_ars;
GRANT ALL ON TABLE django_migrations TO ramabitc_ars;
GRANT ALL ON TABLE django_migrations TO ramabitc_newramabit;


--
-- Name: django_session; Type: ACL; Schema: public; Owner: ramabitc_ars
--

REVOKE ALL ON TABLE django_session FROM PUBLIC;
REVOKE ALL ON TABLE django_session FROM ramabitc_ars;
GRANT ALL ON TABLE django_session TO ramabitc_ars;
GRANT ALL ON TABLE django_session TO ramabitc_newramabit;


--
-- PostgreSQL database dump complete
--

