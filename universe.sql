--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    galaxy_type character varying(20) NOT NULL,
    galaxy_age_in_billion_years numeric(4,2),
    galaxy_size_in_light_years numeric(4,2),
    no_of_dwarf_star integer,
    no_of_dead_star integer,
    has_dwarf_star boolean,
    has_dead_star boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: multiplanetary_systems; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.multiplanetary_systems (
    multiplanetary_systems_id integer NOT NULL,
    name character varying(50) NOT NULL,
    systems_age_in_billion_years numeric(4,2),
    systems_size_in_light_years numeric(4,2),
    galaxy_id integer
);


ALTER TABLE public.multiplanetary_systems OWNER TO freecodecamp;

--
-- Name: multiplanetary_systems_multiplanetary_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.multiplanetary_systems_multiplanetary_systems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.multiplanetary_systems_multiplanetary_systems_id_seq OWNER TO freecodecamp;

--
-- Name: multiplanetary_systems_multiplanetary_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.multiplanetary_systems_multiplanetary_systems_id_seq OWNED BY public.multiplanetary_systems.multiplanetary_systems_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_description text,
    supports_life boolean,
    has_moon boolean,
    no_of_moons integer,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    stars_age_in_billion_years numeric(4,2),
    star_has_planets boolean NOT NULL,
    no_of_planets integer,
    multiplanetary_systems_id integer,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: multiplanetary_systems multiplanetary_systems_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.multiplanetary_systems ALTER COLUMN multiplanetary_systems_id SET DEFAULT nextval('public.multiplanetary_systems_multiplanetary_systems_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda Galaxy', 'Spiral', 10.01, 11.10, 2, 5, true, true);
INSERT INTO public.galaxy VALUES (2, 'Milky Way Galaxy', 'Spiral', 13.61, 52.85, 0, 0, false, false);
INSERT INTO public.galaxy VALUES (3, 'Cygnus A.', 'Elliptical', 1.00, 2.67, 0, 0, false, false);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', 'Elliptical', 32.10, 11.20, 0, 0, false, false);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel Galaxy', 'Spiral', 12.07, 1.76, 0, 7, false, true);
INSERT INTO public.galaxy VALUES (6, 'Tadpole Galaxy', 'Spiral', 7.89, 4.12, 4, 3, true, true);


--
-- Data for Name: multiplanetary_systems; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.multiplanetary_systems VALUES (1, 'K-0991', 2.11, 3.40, 1);
INSERT INTO public.multiplanetary_systems VALUES (2, 'Solar System', 10.34, 1.40, 2);
INSERT INTO public.multiplanetary_systems VALUES (3, 'Polar System', 12.23, 0.21, 3);
INSERT INTO public.multiplanetary_systems VALUES (4, 'K-010021', 7.82, 8.21, 4);
INSERT INTO public.multiplanetary_systems VALUES (5, 'K-121A', 6.23, 0.54, 2);
INSERT INTO public.multiplanetary_systems VALUES (6, 'K-4509', 6.23, 0.54, 5);
INSERT INTO public.multiplanetary_systems VALUES (7, 'Kripky System', 12.45, 0.12, 6);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'This is also called the Red Planet', false, false, 0, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'This is the hottest planet', false, false, 0, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'This is our planet', true, true, 1, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'This is a small planet', true, true, 2, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'This is the largest planet in solar system', false, true, 92, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'This planet has rings', false, true, 41, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 'This is the coldest planet', false, true, 14, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 'This name is funny', true, true, 27, 1);
INSERT INTO public.planet VALUES (9, 'Sonar', 'This is a new planet', NULL, true, 6, 3);
INSERT INTO public.planet VALUES (10, 'KT=021A', 'They ran out of names', NULL, false, 0, 2);
INSERT INTO public.planet VALUES (11, 'Proton', 'The tiniest planet', false, false, 0, 4);
INSERT INTO public.planet VALUES (12, 'Brown', 'Unknown Planet', true, true, 11, 5);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4.60, true, 8, 2, 2);
INSERT INTO public.star VALUES (2, 'Sirius', 34.98, false, 0, 5, 2);
INSERT INTO public.star VALUES (3, 'Proxima Centuri', 78.21, false, 0, 1, 1);
INSERT INTO public.star VALUES (4, 'Bellatrix', 12.38, true, 64, 6, 5);
INSERT INTO public.star VALUES (5, 'Canopus', 2.33, false, 0, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Vega', 43.08, true, 231, 7, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: multiplanetary_systems_multiplanetary_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.multiplanetary_systems_multiplanetary_systems_id_seq', 7, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: multiplanetary_systems multiplanetary_systems_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.multiplanetary_systems
    ADD CONSTRAINT multiplanetary_systems_name_key UNIQUE (name);


--
-- Name: multiplanetary_systems multiplanetary_systems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.multiplanetary_systems
    ADD CONSTRAINT multiplanetary_systems_pkey PRIMARY KEY (multiplanetary_systems_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: multiplanetary_systems multiplanetary_systems_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.multiplanetary_systems
    ADD CONSTRAINT multiplanetary_systems_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_multiplanetary_systems_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_multiplanetary_systems_id_fkey FOREIGN KEY (multiplanetary_systems_id) REFERENCES public.multiplanetary_systems(multiplanetary_systems_id);


--
-- PostgreSQL database dump complete
--

