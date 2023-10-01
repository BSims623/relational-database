--
-- PostgreSQL database dump
--

-- Dumped from database version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.16 (Ubuntu 12.16-0ubuntu0.20.04.1)

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
-- Name: company; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.company (
    company_id integer NOT NULL,
    name character varying(40) NOT NULL,
    planet_id integer,
    private boolean
);


ALTER TABLE public.company OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type text,
    diameter_light_years text,
    age_billion_years numeric(8,2)
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    planet_id integer,
    diameter_km numeric(5,1),
    distance_from_planet_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer,
    name character varying(30) NOT NULL,
    number_of_moons integer,
    diameter_km numeric(7,1),
    has_ring_system boolean,
    has_global_magnetic_field boolean
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
-- Name: space_exploration_companies_company_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.space_exploration_companies_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.space_exploration_companies_company_id_seq OWNER TO freecodecamp;

--
-- Name: space_exploration_companies_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.space_exploration_companies_company_id_seq OWNED BY public.company.company_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_id integer,
    type text,
    age_billion_years numeric(5,2),
    constellation character varying(30)
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
-- Name: company company_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.company ALTER COLUMN company_id SET DEFAULT nextval('public.space_exploration_companies_company_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: company; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.company VALUES (1, 'Boeing', 3, false);
INSERT INTO public.company VALUES (2, 'SpaceX', 3, true);
INSERT INTO public.company VALUES (3, 'Northrop Grumman Innovation Systems', 3, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'barred spiral galaxy', '100,000', 13.61);
INSERT INTO public.galaxy VALUES (3, 'Alcyoneus', 'giant radio galaxy', '16,300,000', 13.40);
INSERT INTO public.galaxy VALUES (4, 'Andromeda', 'spiral galaxy', '2220,000', 10.01);
INSERT INTO public.galaxy VALUES (5, 'Cigar Galaxy', 'prototype starburst galaxy', '37,000', 0.50);
INSERT INTO public.galaxy VALUES (6, 'Fireworks Galaxy', 'intermediate spiral galaxy', '40,000', 10.00);
INSERT INTO public.galaxy VALUES (7, 'Sombrero Galaxy', 'spiral', '49,000', 13.25);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 3474.8, 384400);
INSERT INTO public.moon VALUES (2, 'Ganymede', 5, 5268.2, 1070000);
INSERT INTO public.moon VALUES (3, 'Europa', 5, 3121.6, 671000);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3640.0, 262000);
INSERT INTO public.moon VALUES (5, 'Enceladus', 6, 504.2, 238000);
INSERT INTO public.moon VALUES (6, 'Titan', 6, 5149.5, 1221870);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4820.6, 1883000);
INSERT INTO public.moon VALUES (8, 'Iapetus', 6, 1469.0, 3561000);
INSERT INTO public.moon VALUES (9, 'Mimas', 6, 5150.0, 1200000);
INSERT INTO public.moon VALUES (10, 'Phobos', 4, 22.2, 6000);
INSERT INTO public.moon VALUES (11, 'Triton', 8, 2706.8, 354800);
INSERT INTO public.moon VALUES (12, 'Charon', 9, 1212.0, 19640);
INSERT INTO public.moon VALUES (13, 'Adrastea', 5, 16.4, 129000);
INSERT INTO public.moon VALUES (14, 'Eirene', 5, 4.0, 23974000);
INSERT INTO public.moon VALUES (15, 'Callirrhoe', 5, 9.6, 24100000);
INSERT INTO public.moon VALUES (16, 'Eupheme', 5, 2.0, 19622000);
INSERT INTO public.moon VALUES (17, 'Cyllene', 5, 2.0, 23396000);
INSERT INTO public.moon VALUES (18, 'Herse', 5, 2.0, 23400000);
INSERT INTO public.moon VALUES (19, 'Arche', 5, 3.0, 23717000);
INSERT INTO public.moon VALUES (20, 'Deimos', 4, 12.4, 23460);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 0, 4879.4, false, true);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 0, 12104.0, false, false);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 1, 12756.0, false, true);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 2, 6792.0, false, false);
INSERT INTO public.planet VALUES (5, 1, 'Jupiter', 92, 142984.0, true, true);
INSERT INTO public.planet VALUES (6, 1, 'Saturn', 83, 120536.0, true, true);
INSERT INTO public.planet VALUES (7, 1, 'Uranus', 27, 51118.0, true, true);
INSERT INTO public.planet VALUES (8, 1, 'Neptune', 14, 49528.0, true, true);
INSERT INTO public.planet VALUES (9, 1, 'Pluto', 5, 2376.0, false, NULL);
INSERT INTO public.planet VALUES (10, 7, '14 Andromedae b', 0, 257371.2, NULL, NULL);
INSERT INTO public.planet VALUES (11, 8, 'Proxima Centauri B', 0, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 9, 'Kepler 186f', NULL, 14908.0, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (3, 'Vega', 2, 'Blueish White AOV', 0.45, 'Lyra');
INSERT INTO public.star VALUES (2, 'Sirius', 2, 'Faint White Dwarf Star', 0.23, 'Canis Major');
INSERT INTO public.star VALUES (4, 'Betelgeuse', 2, 'Semiregular Variable Star', 0.10, 'Orion');
INSERT INTO public.star VALUES (5, 'Antares', 2, 'M1 Red Supergiant Star', 0.11, 'Scorpius');
INSERT INTO public.star VALUES (6, 'Rigel', 2, 'Blue Supergiant Star', 0.08, 'Orion');
INSERT INTO public.star VALUES (1, 'Sun', 2, 'Yellow Dwarf Star', 4.50, 'NULL');
INSERT INTO public.star VALUES (7, '14 Andromedae', 4, 'Red Giant Star', 5.00, 'Andromeda');
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 2, 'Red Dwarf Star', 4.85, 'Centaurus');
INSERT INTO public.star VALUES (9, 'Kepler 186', 2, 'M1-Type Dwarf Star', 4.00, 'Cygnus');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: space_exploration_companies_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.space_exploration_companies_company_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: company space_exploration_companies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT space_exploration_companies_name_key UNIQUE (name);


--
-- Name: company space_exploration_companies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT space_exploration_companies_pkey PRIMARY KEY (company_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_name UNIQUE (name);


--
-- Name: star unique_star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_name UNIQUE (name);


--
-- Name: star fk_galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: company fk_planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.company
    ADD CONSTRAINT fk_planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

