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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer,
    user_id integer
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: user_table; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.user_table (
    user_id integer NOT NULL,
    username character varying(22)
);


ALTER TABLE public.user_table OWNER TO freecodecamp;

--
-- Name: user_table_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.user_table_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_table_user_id_seq OWNER TO freecodecamp;

--
-- Name: user_table_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.user_table_user_id_seq OWNED BY public.user_table.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: user_table user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_table ALTER COLUMN user_id SET DEFAULT nextval('public.user_table_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (29, 551, 36);
INSERT INTO public.games VALUES (30, 934, 36);
INSERT INTO public.games VALUES (31, 675, 37);
INSERT INTO public.games VALUES (32, 70, 37);
INSERT INTO public.games VALUES (33, 70, 36);
INSERT INTO public.games VALUES (34, 61, 36);
INSERT INTO public.games VALUES (35, 861, 36);
INSERT INTO public.games VALUES (36, 300, 38);
INSERT INTO public.games VALUES (37, 622, 38);
INSERT INTO public.games VALUES (38, 795, 39);
INSERT INTO public.games VALUES (39, 875, 39);
INSERT INTO public.games VALUES (40, 360, 38);
INSERT INTO public.games VALUES (41, 151, 38);
INSERT INTO public.games VALUES (42, 987, 38);
INSERT INTO public.games VALUES (43, 11, 40);
INSERT INTO public.games VALUES (44, 854, 41);
INSERT INTO public.games VALUES (45, 691, 41);
INSERT INTO public.games VALUES (46, 553, 42);
INSERT INTO public.games VALUES (47, 597, 42);
INSERT INTO public.games VALUES (48, 182, 41);
INSERT INTO public.games VALUES (49, 549, 41);
INSERT INTO public.games VALUES (50, 801, 41);
INSERT INTO public.games VALUES (51, 480, 43);
INSERT INTO public.games VALUES (52, 796, 43);
INSERT INTO public.games VALUES (53, 557, 44);
INSERT INTO public.games VALUES (54, 74, 44);
INSERT INTO public.games VALUES (55, 912, 43);
INSERT INTO public.games VALUES (56, 461, 43);
INSERT INTO public.games VALUES (57, 433, 43);
INSERT INTO public.games VALUES (58, 128, 45);
INSERT INTO public.games VALUES (59, 140, 45);
INSERT INTO public.games VALUES (60, 629, 46);
INSERT INTO public.games VALUES (61, 225, 46);
INSERT INTO public.games VALUES (62, 77, 45);
INSERT INTO public.games VALUES (63, 741, 45);
INSERT INTO public.games VALUES (64, 334, 45);
INSERT INTO public.games VALUES (65, 926, 47);
INSERT INTO public.games VALUES (66, 203, 47);
INSERT INTO public.games VALUES (67, 772, 48);
INSERT INTO public.games VALUES (68, 99, 48);
INSERT INTO public.games VALUES (69, 428, 47);
INSERT INTO public.games VALUES (70, 859, 47);
INSERT INTO public.games VALUES (71, 111, 47);
INSERT INTO public.games VALUES (72, 375, 49);
INSERT INTO public.games VALUES (73, 460, 49);
INSERT INTO public.games VALUES (74, 301, 50);
INSERT INTO public.games VALUES (75, 559, 50);
INSERT INTO public.games VALUES (76, 342, 49);
INSERT INTO public.games VALUES (77, 771, 49);
INSERT INTO public.games VALUES (78, 574, 49);
INSERT INTO public.games VALUES (79, 151, 51);
INSERT INTO public.games VALUES (80, 619, 51);
INSERT INTO public.games VALUES (81, 565, 52);
INSERT INTO public.games VALUES (82, 551, 52);
INSERT INTO public.games VALUES (83, 627, 51);
INSERT INTO public.games VALUES (84, 611, 51);
INSERT INTO public.games VALUES (85, 164, 51);
INSERT INTO public.games VALUES (86, 172, 53);
INSERT INTO public.games VALUES (87, 838, 53);
INSERT INTO public.games VALUES (88, 675, 54);
INSERT INTO public.games VALUES (89, 345, 54);
INSERT INTO public.games VALUES (90, 867, 53);
INSERT INTO public.games VALUES (91, 378, 53);
INSERT INTO public.games VALUES (92, 136, 53);


--
-- Data for Name: user_table; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.user_table VALUES (36, 'user_1740973884574');
INSERT INTO public.user_table VALUES (37, 'user_1740973884573');
INSERT INTO public.user_table VALUES (38, 'user_1740974084821');
INSERT INTO public.user_table VALUES (39, 'user_1740974084820');
INSERT INTO public.user_table VALUES (40, 'daniel');
INSERT INTO public.user_table VALUES (41, 'user_1740974289822');
INSERT INTO public.user_table VALUES (42, 'user_1740974289821');
INSERT INTO public.user_table VALUES (43, 'user_1740974396641');
INSERT INTO public.user_table VALUES (44, 'user_1740974396640');
INSERT INTO public.user_table VALUES (45, 'user_1740974497055');
INSERT INTO public.user_table VALUES (46, 'user_1740974497054');
INSERT INTO public.user_table VALUES (47, 'user_1740974565881');
INSERT INTO public.user_table VALUES (48, 'user_1740974565880');
INSERT INTO public.user_table VALUES (49, 'user_1740974647918');
INSERT INTO public.user_table VALUES (50, 'user_1740974647917');
INSERT INTO public.user_table VALUES (51, 'user_1740974684690');
INSERT INTO public.user_table VALUES (52, 'user_1740974684689');
INSERT INTO public.user_table VALUES (53, 'user_1740974749504');
INSERT INTO public.user_table VALUES (54, 'user_1740974749503');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 92, true);


--
-- Name: user_table_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.user_table_user_id_seq', 54, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: user_table user_table_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.user_table
    ADD CONSTRAINT user_table_pkey PRIMARY KEY (user_id);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.user_table(user_id);


--
-- PostgreSQL database dump complete
--

