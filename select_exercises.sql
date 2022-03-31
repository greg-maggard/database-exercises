USE albums_db;

SELECT COUNT(*) FROM albums;
-- how many rows are in the 'albums' table?
-- 	There are 31 rows in this table. 

-- How many unique artist names are in the albums table?
SELECT COUNT(DISTINCT artist) FROM albums;
-- There are 23 unique names. 

-- What is the primary key for the albums table?
DESCRIBE albums;
-- 'id' is the primary key.

-- What is the oldest release date for any album in the albums table? 
SELECT MIN(release_date) from albums;
		-- The oldest release date is 1967.
-- What is the most recent release date?
SELECT MAX(release_date) from albums;
		-- The most recent release date is 2011.
        
-- The name of all albums by Pink Floyd.
SELECT name FROM albums WHERE artist = 'Pink Floyd';
		-- The Dark Side of the Moon
        -- The Wall
        
-- The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date FROM albums WHERE name = 'Sgt. Pepper''s Lonely Hearts Club Band';
		-- 1967
        
-- The genre for the album Nevermind
SELECT genre FROM albums WHERE name = 'Nevermind';
-- 'Grunge, Alternative rock'

-- Which albums were released in the 1990s
SELECT name FROM albums WHERE release_date BETWEEN 1989 AND 2000;
-- Listed below when the query is run.

-- Which albums had less than 20 million certified sales?
SELECT name FROM albums WHERE sales < 20;
-- Listed below when the query is run.

-- All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT name FROM albums WHERE genre = 'Rock';
-- Names shown below when query is run. This query only returns the albums whose 'genre' field is an *exact* match with "Rock", not just those that contain it.


