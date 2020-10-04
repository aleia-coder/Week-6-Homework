#1 Write a query to select all of the columns in the tutorial.us_housing_units table without using *.

SELECT year, 
      month, 
      month_name, 
      south, 
      west,
      midwest,
      northeast
  FROM tutorial.us_housing_units

- it's showing me each column for us housing units. 

#2 Write a query to select all of the columns in tutorial.us_housing_units and 
rename them so that their first letters are capitalized.

SELECT year as "Year", 
      month as "Month",
      month_name as "Month_Name",
      south as "South",
      west as "West",
      midwest as "Midwest",
      northeast as "Northeast"
      FROM tutorial.us_housing_units

- it's capitalizing the first letter of each column's name. 

#3 Write a query that uses the LIMIT command to restrict the result set to only 15 rows.

SELECT *
  FROM tutorial.us_housing_units
 LIMIT 15

- it restricts the query to the first 15 rows 

#4 Did the West Region ever produce more than 50,000 housing units in one month?

SELECT *
  FROM tutorial.us_housing_units
 WHERE west > 50

- it shows whether the west region produced more than 50,000 housing units, which they did. 

#5 Did the South Region ever produce 20,000 or fewer housing units in one month?

SELECT *
  FROM tutorial.us_housing_units
 WHERE south <= 20

- it shows if the southern region produced less than or equal to 20,000 units in one month, which they did. 

#6 Write a query that only shows rows for which the month name is February.

SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name = 'February'

- it shows all the data from February since 1968

#7 Write a query that only shows rows for which the month_name starts with the letter "N" or 
an earlier letter in the alphabet.

SELECT *
  FROM tutorial.us_housing_units
 WHERE month_name <= 'o'

- 

#8 Write a query that calculates the sum of all four regions in a separate column.

SELECT year,
       month,
       west,
       south,
       midwest,
       northeast,
       west + south + midwest +northeast AS usa_total
  FROM tutorial.us_housing_units

- it shows me the sum of all the regions combined 

#9 Write a query that returns all rows for which more units were produced in the West region 
than in the Midwest and Northeast combined.

SELECT year,
       month,
       west,
       south,
       midwest,
       northeast
  FROM tutorial.us_housing_units
  WHERE west > (midwest + northeast)

- it shows me when west has been greater than both midwest and northeast combined. 

#10 Write a query that calculates the percentage of all houses completed in the United States represented by each region. 
Only return results from the year 2000 and later.

SELECT year,
       month,
       west/(west + south + midwest + northeast)*100 AS west_pct,
       south/(west + south + midwest + northeast)*100 AS south_pct,
       midwest/(west + south + midwest + northeast)*100 AS midwest_pct,
       northeast/(west + south + midwest + northeast)*100 AS northeast_pct
  FROM tutorial.us_housing_units
 WHERE year >= 2000

- it shows me the numerical values as percentages for each region.

#11 Write a query that returns all rows for which Ludacris was a member of the group.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%Ludacris%'

- it shows me all the songs that Ludacris has made and also songs that he has been featured in. 

#12 Write a query that returns all rows for which the first artist listed in the group has a name that begins with "DJ".

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" LIKE 'DJ%'

- it shows every artist that has "DJ" as the beginning of their name. 

#13 Write a query that shows all of the entries for Elvis and M.C. Hammer.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE artist IN ('Elvis Presley', 'M.C. Hammer')

- it shows which rank both Elvis and MC had on the top 100 billboard, along with the songs. 

#14 Write a query that shows all top 100 songs from January 1, 1985 through December 31, 1990.

SELECT *
FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1985 AND 1990

- it shows the top 100 songs between the year of 1985 and 1990. 

#15 Write a query that shows all of the rows for which song_name is null.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name IS NULL 

- it shows the artist, group, rank but not the song name. 

#16 Write a query that surfaces all rows for top-10 hits for which Ludacris is part of the Group.

SELECT *
FROM tutorial.billboard_top_100_year_end
WHERE year_rank <= 10
AND "group" ILIKE '%Ludacris%'

- it shows me each top 10 hits that Ludacris was featured in. 

#17 Write a query that surfaces the top-ranked records in 1990, 2000, and 2010.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank = 1
   AND year IN (1990, 2000, 2010)

- it shows the #1 hit from each year

#18 Write a query that lists all songs from the 1960s with "love" in the title.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year BETWEEN 1960 AND 1969
 AND song_name ILIKE '%love%'

- it shows me all the songs that has the word "love" in it, from the 1960s. 

#19 Write a query that returns all rows for top-10 songs that featured either Katy Perry or Bon Jovi.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank <= 10
   AND ("group" ILIKE '%katy perry%' OR "group" ILIKE '%bon jovi%')

- it shows the top ten songs that include either Katy Perry OR Bon Jovi from any year.

#20 Write a query that returns all songs with titles that contain the word "California" in either the 1970s or 1990s.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE song_name ILIKE '%California%'
   AND (year BETWEEN 1970 AND 1979 OR year BETWEEN 1990 AND 1999)

- it shows me the songs that include the word California between two time periods: 70s or 90s.

#21 Write a query that lists all top-100 recordings that feature Dr. Dre before 2001 or after 2009.

SELECT *
  FROM tutorial.billboard_top_100_year_end
WHERE "group" ILIKE '%Dr. Dre%'
AND (year <= 2000 OR year >= 2010)

- it shows the songs that Dr.Dre made that was before the year 2001, and after 2009.

#22 Write a query that returns all rows for songs that were on the charts in 2013 and do not contain the letter "a".

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
   AND song_name NOT ILIKE '%a%'

- it shows all the hits that were in 2013, from songs that does not include the letter A. 

#23 Write a query that returns all rows from 2012, ordered by song title from Z to A.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2013
 ORDER BY year_rank DESC

- it shows all the song titles in descending order from 2013. 

#24 Write a query that returns all rows from 2010 ordered by rank, with artists ordered alphabetically for each song.

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year = 2010
 ORDER BY year_rank, artist DESC

-it shows me the year rank from 1, then descending. The artist is in alphabetical order according to the song

#25 Write a query that shows all rows for which T-Pain was a group member, ordered by rank on the charts, 
from lowest to highest rank (from 100 to 1).

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE "group" ILIKE '%T-Pain%'
 ORDER BY year_rank DESC

- it shows me every group that T-Pain was a part of, whether it's just him or with someone else. Then it shows 
the rank from the lowest to the highest. 

#26 Write a query that returns songs that ranked between 10 and 20 (inclusive) in 1993, 2003, or 2013. 
Order the results by year and rank, and leave a comment on each line of the WHERE clause to indicate what that line does

SELECT *
  FROM tutorial.billboard_top_100_year_end
 WHERE year_rank BETWEEN 10 AND 20 --shows songs that were ranked between only 10 and 20
 AND year IN (1993, 2003, 2013) --shows me the data from the specific years 
 ORDER BY year, year_rank --shows the order year rank based off each year, between rank 10 and 20

- it shows me the year rank (between 10 and 20), basead off the year, which is in order.



