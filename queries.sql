INSERT INTO person
  (first_name,last_name,doB,poB)
  VALUES
  ("Rami","Malek",DATE("1981-05-12"),"California"),
  ("Tim","Robbins",DATE("1958-10-16"),"California"),
  ("Morgan","Freeman",DATE("1937-06-01"),"Tennessee"),
  ("Frank","Darabont",DATE("1959-02-28"),"France"),
  ("Stephan","King",DATE("1947-09-21"),"Maine"),

  ("Marlon","Brando",DATE("1924-04-03"),"Nebraska"),
  ("Al","Pacino",DATE("1940-04-25"),"New York"),
  ("Francis","Ford",DATE("1939-04-7"),"Michigan"),
  ("Mario","Puzo",DATE("1920-10-15"),"Newyork"),

  ("Christian","Bale",DATE("1975-02-28"),"California"),
  ("Heath","Ledger",DATE("1972-05-26"),"Arizona"),
  ("Michael","Caine",DATE("1955-07-03"),"Arkansas"),
  ("Maggie","Gyllenhaal",DATE("1980-02-28"),"London"),
  ("Gary","Oldman",DATE("1955-02-28"),"California")

;

INSERT INTO award
  (year,type)
  VALUES
  (2008,"Oscar Best Actor"),
  (1994,"Oscar Best Picture"),
  (1973,"Oscar Best Script")

;

INSERT INTO genre
  (name)
  VALUES
  ('action'),
  ('adventure'),
  ('comedy'),
  ('drama'),
  ('historical'),
  ('horror'),
  ('musicals/dance'),
  ('romance'),
  ('rom-com'),
  ('sci-fi'),
  ('war'),
  ('westerns');

INSERT INTO movie
  (name,year,director_id,rating,writer_id,producer_id)
  VALUES
  ("The Godfather",1973,8,"R",9,8),
  ("Shawshank Redemption",1994,4,"PG-13",5,4),
  ("The Dark Knight",2008,3,"PG",13,14)
;

INSERT INTO movie_staff
 (actor_id,movie_id)
 VALUES
 (2,2),
 (3,2),
 (6,1),
 (7,1),
 (10,3),
 (11,3),
 (12,3),
 (13,3),
 (14,3)
;

*/

INSERT INTO movie_genre
 (movie_id,genre_name)
 VALUES
 (1,"drama"),
 (2,"drama"),
 (3,"action"),
 (3,"drama")
;

INSERT INTO claims
 (award_id,movie_id,person_id)
 VALUES
 (1,3,11),
 (2,2,null),
 (3,1,9)
;
