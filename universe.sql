--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass_kg numeric NOT NULL,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.blackhole_blackhole_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.blackhole_blackhole_id_seq OWNER TO freecodecamp;

--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.blackhole_blackhole_id_seq OWNED BY public.blackhole.blackhole_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    size numeric NOT NULL,
    shape text NOT NULL,
    has_black_hole boolean NOT NULL,
    num_stars integer NOT NULL,
    name character varying(30) NOT NULL
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
    type character varying(50) NOT NULL,
    orbital_period_days numeric NOT NULL,
    surface_temperature_celsius integer NOT NULL,
    is_in_habitable_zone boolean NOT NULL,
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL
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
    type character varying(100) NOT NULL,
    distance_from_star numeric NOT NULL,
    diameter_km integer NOT NULL,
    has_moons boolean NOT NULL,
    star_id integer NOT NULL,
    name character varying(30)
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
    type character varying(50) NOT NULL,
    mass_kg integer NOT NULL,
    radius_km integer NOT NULL,
    is_supernova boolean NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50)
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
-- Name: blackhole blackhole_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole ALTER COLUMN blackhole_id SET DEFAULT nextval('public.blackhole_blackhole_id_seq'::regclass);


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
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Sagittarius A', 4.31, 1);
INSERT INTO public.blackhole VALUES (2, 'M87', 6.5, 3);
INSERT INTO public.blackhole VALUES (4, 'Cygnus X-1', 15, 1);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1500000000000, 'Spiral', true, 20000000, 'Milky Way');
INSERT INTO public.galaxy VALUES (2, 2000000000000, 'Spiral', true, 300000000, 'Andromeda');
INSERT INTO public.galaxy VALUES (3, 500000000000, 'Spiral', true, 500000000, 'Triangulum');
INSERT INTO public.galaxy VALUES (4, 750000000000, 'Spiral', true, 100000000, 'Pinwheel');
INSERT INTO public.galaxy VALUES (5, 800000000000, 'Spiral', false, 800000000, 'Whirlpool');
INSERT INTO public.galaxy VALUES (6, 600000000000, 'Eliipitical', false, 40000000, 'Sombrero');
INSERT INTO public.galaxy VALUES (7, 1.0, 'Irregular', false, 100000000, 'Large Magellanic Cloud');
INSERT INTO public.galaxy VALUES (8, 7.0, 'Irregular', false, 200000000, 'Small Magellenic Cloud');
INSERT INTO public.galaxy VALUES (9, 1.5, 'Irregular', false, 5000000, 'Andromeda II');
INSERT INTO public.galaxy VALUES (10, 3.0, 'Spiral', false, 70000000, 'Bodes Galaxy');
INSERT INTO public.galaxy VALUES (11, 1.0, 'Elliptical', true, 800000000, 'Centaurus A');
INSERT INTO public.galaxy VALUES (12, 6.5, 'Barred Spiral', false, 500000000, 'Messier 83');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Natural Satellite', 27.32, -233, true, 5, 'Moon');
INSERT INTO public.moon VALUES (3, 'Natural Satellite', 27.32, -60, false, 6, 'Moon');
INSERT INTO public.moon VALUES (4, 'Natural Satellite', 1.26, -40, false, 6, 'Deimos');
INSERT INTO public.moon VALUES (5, 'Natural Satellite', 3.55, -170, true, 7, 'Europa');
INSERT INTO public.moon VALUES (6, 'Natural Satellite', 7.15, -180, true, 7, 'Ganymede');
INSERT INTO public.moon VALUES (7, 'Natural Satellite', 0.32, -60, false, 4, 'Phobos');
INSERT INTO public.moon VALUES (8, 'Natural Satellite', 3.55, -170, true, 9, 'Europa');
INSERT INTO public.moon VALUES (9, 'Natural Satellite', 26.69, -145, true, 9, 'Calisto');
INSERT INTO public.moon VALUES (10, 'Natural Satellite', 26.69, -145, true, 10, 'Titan');
INSERT INTO public.moon VALUES (11, 'Natural Satellite', 26.69, -145, true, 11, 'Enceladus');
INSERT INTO public.moon VALUES (12, 'Natural Satellite', 26.69, -145, true, 11, 'Mimas');
INSERT INTO public.moon VALUES (14, 'Natural Satellite', 26.69, -145, true, 12, 'Triton');
INSERT INTO public.moon VALUES (15, 'Natural Satellite', 26.69, -145, true, 9, 'Io');
INSERT INTO public.moon VALUES (16, 'Natural Satellite', 26.69, -145, true, 12, 'Phoebe');
INSERT INTO public.moon VALUES (17, 'Natural Satellite', 26.69, -145, true, 8, 'Charon');
INSERT INTO public.moon VALUES (18, 'Natural Satellite', 26.69, -145, true, 9, 'Lapetus');
INSERT INTO public.moon VALUES (19, 'Natural Satellite', 26.69, -145, true, 7, 'Ariel');
INSERT INTO public.moon VALUES (20, 'Natural Satellite', 26.69, -145, true, 8, 'Umbriel');
INSERT INTO public.moon VALUES (21, 'Natural Satellite', 26.69, -145, true, 9, 'Oberon');
INSERT INTO public.moon VALUES (22, 'Natural Satellite', 26.69, -145, true, 10, 'Miranda');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Terrestial', 57909050, 4879, false, 1, 'Mercury');
INSERT INTO public.planet VALUES (4, 'Terrestial', 108208000, 12104, false, 1, 'Venus');
INSERT INTO public.planet VALUES (5, 'Terrestial', 149598261, 12742, true, 1, 'Earth');
INSERT INTO public.planet VALUES (6, 'Terrestial', 227943824, 6779, true, 1, 'Mars');
INSERT INTO public.planet VALUES (7, 'Gas Giant', 778340821, 139820, true, 1, 'Jupiter');
INSERT INTO public.planet VALUES (8, 'Gas Giant', 1426666422, 139820, true, 1, 'Saturn');
INSERT INTO public.planet VALUES (9, 'Ice Giant', 2870658136, 50724, true, 1, 'Uranus');
INSERT INTO public.planet VALUES (10, 'Ice Giant', 4498396441, 49244, true, 1, 'Neptune');
INSERT INTO public.planet VALUES (11, 'Terrestial', 2400000000, 12742, true, 2, 'Alpha Centauri Bb');
INSERT INTO public.planet VALUES (12, 'Terrestial', 4240000000, 6787, false, 4, 'Proxima Centauri b');
INSERT INTO public.planet VALUES (14, 'Terrestial', 240000000, 12104, false, 6, 'Vega b');
INSERT INTO public.planet VALUES (15, 'Gas Giant', 2690000000, 116480, false, 5, 'Betelgeuse B');
INSERT INTO public.planet VALUES (16, 'Ice Giant', 1890000000, 50724, true, 3, 'Rigel b');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'G-type', 2, 695700, false, 1, 'Sun');
INSERT INTO public.star VALUES (2, 'G-Type', 2, 8340264, false, 1, 'Alpha Centauri A');
INSERT INTO public.star VALUES (3, 'K-Type', 1, 799031, false, 1, 'Alpha Centauri B');
INSERT INTO public.star VALUES (4, 'M-type', 2, 114792, false, 1, 'Proxima Centauri');
INSERT INTO public.star VALUES (5, 'A-type', 2, 19710000, false, 1, 'Sirius A');
INSERT INTO public.star VALUES (6, 'White Dwarf', 1, 119000, false, 1, 'Sirius B');


--
-- Name: blackhole_blackhole_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.blackhole_blackhole_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: blackhole name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT name_key UNIQUE (name);


--
-- Name: planet planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id_key UNIQUE (planet_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_key UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: blackhole blackhole_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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
-- PostgreSQL database dump complete
--

