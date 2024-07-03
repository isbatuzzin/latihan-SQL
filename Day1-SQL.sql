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
select count(mov_id) total, mov_year
    from movie
    group by mov_year
    order by total desc
    limit 1;

--5.	Find actor that has played as Sean Maguire
select m.mov_title, concat(a.act_fname, ' ',a.act_lname) actor_name, c.role
from movie m join movie_cast c on m.mov_id = c.mov_id
    join actor a on a.act_id = c.act_id
where c.role='Sean Maguire';

--6.	Find a movie with the lowest rating
select r.rev_stars, m.mov_title
    from movie m join rating r on m.mov_id = r.mov_id
    order by r.rev_stars asc;
    limit 1;

--7.	Find how many female actor who acted in 21st century

--8.	Find actor that has played in more than one movie

--9.	Find female actor whose movies received a highest rating
select a.act_id, concat(a.act_fname, ' ',a.act_lname)  actor_name, r.rev_stars 
    from actor a
    inner join movie_cast mc on a.act_id = mc.act_id
    inner join rating r on r.mov_id = mc.mov_id
where a.act_gender = 'F'
order by r.rev_stars desc
limit 1;


--10.	Find reviewer who never give the low rating (below 8)

--11.	Find the number of director who directed drama movies

--12.	Count the number of male and female actor
select act_gender, count(act_gender) 
from actor 
group by act_gender;

-- atau bisa ini 
select 
    case 
        when act_gender = 'M' then 'Male'
        when act_gender = 'F' then 'Female'
        else 'no gender'
    end as gender_label, 
    count(act_gender)
from actor 
group by act_gender;

