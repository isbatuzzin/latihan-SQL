-- 1.	Find a movie title that has a character named Alice Harford
select m.mov_id, m.mov_title, mc.role
from movie m 
inner join movie_cast mc on m.mov_id = mc.mov_id
where mc.role = 'Alice Harford';

--2.	Find each genre of each movies
select m.mov_id, m.mov_title, mgenres.gent
from movie m 
left join (select mg.mov_id as movid, g.gen_title as gent from movie_genres mg, genres g where mg.gen_id=g.gen_id) mgenres  on m.mov_id = mgenres.movid;


--3.	Find the most favorite genre (using average rating of each genre)


--4.	Find what year that has most movies (movies of each year)

--5.	Find actor that has played as Sean Maguire

--6.	Find a movie with the lowest rating

--7.	Find how many female actor who acted in 21st century

--8.	Find actor that has played in more than one movie

--9.	Find female actor whose movies received a highest rating

--10.	Find reviewer who never give the low rating (below 8)

--11.	Find the number of director who directed drama movies

--12.	Count the number of male and female actor

