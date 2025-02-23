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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    planet_id integer,
    galaxy_id integer,
    name character varying(30) NOT NULL,
    status boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_billions_of_years numeric(3,1),
    galaxy_type character varying(15),
    description text
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
    diameter_in_km numeric(10,2),
    is_rocky boolean
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
    name character varying(15) NOT NULL,
    planet_type character varying(20),
    is_spherical boolean,
    star_id integer,
    age_in_millions_of_years integer
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
    age_in_millions_of_years integer,
    star_type character varying(20),
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
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


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
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 1, 1, 'Ceres', true);
INSERT INTO public.asteroid VALUES (2, 2, 2, 'Vesta', false);
INSERT INTO public.asteroid VALUES (3, 3, 3, 'Pallas', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.6, 'Spiral', 'The galaxy containing our Solar System.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.0, 'Spiral', 'The nearest spiral galaxy to the Milky Way and on a collision course with it.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 13.7, 'Spiral', 'A member of the Local Group and one of the smaller spiral galaxies.');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 9.0, 'Lenticular', 'A galaxy with a bright nucleus and a large, dark dust lane.');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 4.0, 'Spiral', 'Known for its spiral structure and interaction with a companion galaxy.');
INSERT INTO public.galaxy VALUES (6, 'Cartwheel', 0.5, 'Ring', 'A galaxy that was likely shaped by a collision.');
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 13.2, 'Elliptical', 'A supergiant elliptical galaxy with a massive black hole at its center.');
INSERT INTO public.galaxy VALUES (8, 'Large Magellanic', 13.0, 'Irregular', 'A nearby irregular galaxy and a satellite of the Milky Way.');
INSERT INTO public.galaxy VALUES (9, 'Small Magellanic', 13.1, 'Irregular', 'A smaller companion galaxy to the Large Magellanic Cloud.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 13, 3474.80, true);
INSERT INTO public.moon VALUES (2, 'Phobos', 14, 22.40, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 14, 12.40, true);
INSERT INTO public.moon VALUES (4, 'Io', 15, 3643.20, true);
INSERT INTO public.moon VALUES (5, 'Europa', 15, 3121.60, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 15, 5262.40, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 15, 4820.60, true);
INSERT INTO public.moon VALUES (8, 'Titan', 16, 5150.00, false);
INSERT INTO public.moon VALUES (9, 'Rhea', 16, 1528.00, true);
INSERT INTO public.moon VALUES (10, 'Enceladus', 16, 504.00, true);
INSERT INTO public.moon VALUES (11, 'Triton', 18, 2706.00, true);
INSERT INTO public.moon VALUES (12, 'Miranda', 17, 471.60, true);
INSERT INTO public.moon VALUES (13, 'Ariel', 17, 1156.80, true);
INSERT INTO public.moon VALUES (14, 'Umbriel', 17, 1169.40, true);
INSERT INTO public.moon VALUES (15, 'Oberon', 17, 1522.00, true);
INSERT INTO public.moon VALUES (16, 'Titania', 17, 1577.80, true);
INSERT INTO public.moon VALUES (17, 'Proxima b Moon', 1, 5000.00, true);
INSERT INTO public.moon VALUES (18, 'Betelgeuse b Moon', 2, 2000.00, true);
INSERT INTO public.moon VALUES (19, 'Vega b Moon', 3, 4000.00, true);
INSERT INTO public.moon VALUES (20, 'Rigel b Moon', 4, 3000.00, true);
INSERT INTO public.moon VALUES (21, 'Altair b Moon', 5, 3500.00, false);
INSERT INTO public.moon VALUES (22, 'Polaris b Moon', 6, 6000.00, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Proxima b', 'Rocky', true, 3, 4500);
INSERT INTO public.planet VALUES (2, 'Betelgeuse b', 'Gas Giant', true, 2, 8500);
INSERT INTO public.planet VALUES (3, 'Vega b', 'Gas Giant', true, 4, 455);
INSERT INTO public.planet VALUES (4, 'Rigel b', 'Gas Giant', true, 5, 8000);
INSERT INTO public.planet VALUES (5, 'Altair b', 'Rocky', true, 7, 1100);
INSERT INTO public.planet VALUES (6, 'Polaris b', 'Gas Giant', true, 6, 70000);
INSERT INTO public.planet VALUES (7, 'Antares b', 'Gas Giant', true, 8, 12000);
INSERT INTO public.planet VALUES (8, 'Barnard b', 'Rocky', true, 9, 11000);
INSERT INTO public.planet VALUES (9, 'Deneb b', 'Gas Giant', true, 10, 10000);
INSERT INTO public.planet VALUES (10, 'Sirius b', 'Rocky', true, 1, 242);
INSERT INTO public.planet VALUES (11, 'Mercury', 'Rocky', true, 11, 4600);
INSERT INTO public.planet VALUES (12, 'Venus', 'Rocky', true, 11, 4600);
INSERT INTO public.planet VALUES (13, 'Earth', 'Rocky', true, 11, 4600);
INSERT INTO public.planet VALUES (14, 'Mars', 'Rocky', true, 11, 4600);
INSERT INTO public.planet VALUES (15, 'Jupiter', 'Gas Giant', true, 11, 4600);
INSERT INTO public.planet VALUES (16, 'Saturn', 'Gas Giant', true, 11, 4600);
INSERT INTO public.planet VALUES (17, 'Uranus', 'Ice Giant', true, 11, 4600);
INSERT INTO public.planet VALUES (18, 'Neptune', 'Ice Giant', true, 11, 4600);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 242, 'Main Sequence', 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', 8500, 'Red Supergiant', 1);
INSERT INTO public.star VALUES (3, 'Proxima Centauri', 4600, 'Red Dwarf', 1);
INSERT INTO public.star VALUES (4, 'Vega', 455, 'Main Sequence', 1);
INSERT INTO public.star VALUES (5, 'Rigel', 8000, 'Blue Supergiant', 2);
INSERT INTO public.star VALUES (6, 'Polaris', 70000, 'Yellow Supergiant', 3);
INSERT INTO public.star VALUES (7, 'Altair', 1100, 'Main Sequence', 1);
INSERT INTO public.star VALUES (8, 'Antares', 12000, 'Red Supergiant', 3);
INSERT INTO public.star VALUES (9, 'Barnards Star', 11000, 'Red Dwarf', 1);
INSERT INTO public.star VALUES (10, 'Deneb', 10000, 'Blue Supergiant', 2);
INSERT INTO public.star VALUES (11, 'Sun', 4600, 'Main Sequence', 1);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 18, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 11, true);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


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
-- Name: asteroid unique_asteroid_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT unique_asteroid_name UNIQUE (name);


--
-- Name: asteroid asteroid_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: asteroid asteroid_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

