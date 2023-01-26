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
    name character varying(25) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth integer,
    radius numeric,
    has_life boolean,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_number_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_number_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_number_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(25),
    distance_from_earth integer,
    age_in_millions_of_years integer,
    radius numeric,
    has_life boolean,
    description text,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_number_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_number_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_number_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(25),
    distance_from_star integer,
    age_in_millions_of_years integer,
    radius numeric,
    has_life boolean,
    description text,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_number_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_number_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_number_seq OWNED BY public.planet.planet_id;


--
-- Name: rocket; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rocket (
    rocket_id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text,
    rocket_radius numeric,
    number_of_passengers integer,
    is_air_borne boolean
);


ALTER TABLE public.rocket OWNER TO freecodecamp;

--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rocket_rocket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rocket_rocket_id_seq OWNER TO freecodecamp;

--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rocket_rocket_id_seq OWNED BY public.rocket.rocket_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(25),
    galaxy_id integer NOT NULL,
    distance_from_earth integer,
    has_life boolean,
    description text,
    age_in_million_of_years numeric
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_number_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_number_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_number_seq OWNER TO freecodecamp;

--
-- Name: star_star_number_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_number_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_number_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_number_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_number_seq'::regclass);


--
-- Name: rocket rocket_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket ALTER COLUMN rocket_id SET DEFAULT nextval('public.rocket_rocket_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_number_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Lorna', 21, 345, 4657, true, 'An oceanic galaxy but dull during the day');
INSERT INTO public.galaxy VALUES (2, 'Morna', 223, 3645, 657, false, 'A desert galaxy');
INSERT INTO public.galaxy VALUES (3, 'Felecia', 51, 374, 356, true, 'An exemplary mother nature galaxy');
INSERT INTO public.galaxy VALUES (4, 'raptor', 234, 123, 678, true, 'A havoc galaxy');
INSERT INTO public.galaxy VALUES (5, 'Legend', 567, 345, 900, false, 'Aliens galaxy');
INSERT INTO public.galaxy VALUES (6, 'Mystic', 598, 1000, 435, true, 'Has advanced technology');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'full moon', 160, 947, 200, true, 'Full moon can be seen', 2);
INSERT INTO public.moon VALUES (2, 'half moon', 120, 863, 140, false, 'Half a moon', 5);
INSERT INTO public.moon VALUES (3, 'cresent', 173, 549, 692, false, 'Shape of a banana', 8);
INSERT INTO public.moon VALUES (4, 'Blue moon', 128, 780, 679, true, 'A blue moon rare to see', 7);
INSERT INTO public.moon VALUES (5, 'Lunar', 1099, 60009, 78098, true, 'Happens when moon hides the sun', 1);
INSERT INTO public.moon VALUES (6, 'Solar', 109653, 67890, 7654, true, 'Happens when sun hides the moon', 4);
INSERT INTO public.moon VALUES (7, 'Quarter moon', 3678, 567, 69000, false, 'Quarter of the full moon', 3);
INSERT INTO public.moon VALUES (8, 'Dotted moon', 2009, 789, 8000, false, 'A dotted moon had to see', 6);
INSERT INTO public.moon VALUES (9, 'Combined', 200, 500, 409, false, 'Combined moon with different colours', 9);
INSERT INTO public.moon VALUES (10, 'Red moon', 300, 500, 567, true, 'Red moon in accidnetal fire areas', 12);
INSERT INTO public.moon VALUES (11, 'full moon', 160, 947, 200, true, 'Full moon can be seen', 2);
INSERT INTO public.moon VALUES (12, 'half moon', 120, 863, 140, false, 'Half a moon', 5);
INSERT INTO public.moon VALUES (13, 'cresent', 173, 549, 692, false, 'Shape of a banana', 8);
INSERT INTO public.moon VALUES (14, 'Blue moon', 128, 780, 679, true, 'A blue moon rare to see', 7);
INSERT INTO public.moon VALUES (15, 'Lunar', 1099, 60009, 78098, true, 'Happens when moon hides the sun', 1);
INSERT INTO public.moon VALUES (16, 'Solar', 109653, 67890, 7654, true, 'Happens when sun hides the moon', 4);
INSERT INTO public.moon VALUES (17, 'Quarter moon', 3678, 567, 69000, false, 'Quarter of the full moon', 3);
INSERT INTO public.moon VALUES (18, 'Dotted moon', 2009, 789, 8000, false, 'A dotted moon had to see', 6);
INSERT INTO public.moon VALUES (19, 'Combined', 200, 500, 409, false, 'Combined moon with different colours', 9);
INSERT INTO public.moon VALUES (20, 'Red moon', 300, 500, 567, true, 'Red moon in accidnetal fire areas', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 345, 2345, 23900, true, 'Beautiful planet that holds the human race', 2);
INSERT INTO public.planet VALUES (2, 'Venus', 234, 567, 20087, false, 'Hottest planet present in the galaxy', 2);
INSERT INTO public.planet VALUES (3, 'Saturn', 152, 2356, 90000, false, 'Biggest planet', 1);
INSERT INTO public.planet VALUES (4, 'Mars', 456, 3456, 789000, false, 'Similar name to a human chocolate', 1);
INSERT INTO public.planet VALUES (5, 'Pluto', 678, 5690, 50098, false, 'Dwarf planet and was rejected as a planet', 3);
INSERT INTO public.planet VALUES (6, 'Uranus', 137, 890, 789000, false, 'Has a funny name', 3);
INSERT INTO public.planet VALUES (7, 'Earth', 345, 2345, 23900, true, 'Beautiful planet that holds the human race', 2);
INSERT INTO public.planet VALUES (8, 'Venus', 234, 567, 20087, false, 'Hottest planet present in the galaxy', 2);
INSERT INTO public.planet VALUES (9, 'Saturn', 152, 2356, 90000, false, 'Biggest planet', 1);
INSERT INTO public.planet VALUES (10, 'Mars', 456, 3456, 789000, false, 'Similar name to a human chocolate', 1);
INSERT INTO public.planet VALUES (11, 'Pluto', 678, 5690, 50098, false, 'Dwarf planet and was rejected as a planet', 3);
INSERT INTO public.planet VALUES (12, 'Uranus', 137, 890, 789000, false, 'Has a funny name', 3);


--
-- Data for Name: rocket; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rocket VALUES (2, 'Lorna rocket', 'First of its kind', 2345564667, 23, false);
INSERT INTO public.rocket VALUES (3, 'bOYENG', 'Looks like a plane', 234, 256, true);
INSERT INTO public.rocket VALUES (4, 'Fighterrocket', 'Used in launching satelights in far areas', 369, 900, true);
INSERT INTO public.rocket VALUES (1, 'az34er', 'az34er rocket used for secret service', 2345, 12, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Tanzanite', 1, 345, false, 'Beautiful star can be seen in February only', 345);
INSERT INTO public.star VALUES (2, 'Emerald', 3, 234, false, 'A green star which is named after the emerald stone', 256);
INSERT INTO public.star VALUES (3, 'Scarlet', 2, 2356, false, 'Oldest star noticed', 7644);
INSERT INTO public.star VALUES (4, 'Gold', 2, 3456, false, 'A beautiful yellow which is slightly dark and valued by humans', 345);
INSERT INTO public.star VALUES (5, 'Silver', 1, 678, false, 'A beautiful colour used to make ornaments', 567);
INSERT INTO public.star VALUES (6, 'Pearls', 3, 890, true, 'Extracted from living animals', 467);


--
-- Name: galaxy_galaxy_number_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_number_seq', 6, true);


--
-- Name: moon_moon_number_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_number_seq', 20, true);


--
-- Name: planet_planet_number_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_number_seq', 12, true);


--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rocket_rocket_id_seq', 4, true);


--
-- Name: star_star_number_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_number_seq', 6, true);


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
-- Name: rocket rocket_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT rocket_pkey PRIMARY KEY (rocket_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: rocket unique_rocket_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT unique_rocket_id UNIQUE (rocket_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: moon fk_moon_planet_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet_fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_star_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star_fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


