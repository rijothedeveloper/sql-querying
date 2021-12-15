-- Comments in SQL Start with dash-dash --
-- Find the app with an ID of 1880.
select * from analytics where id = 1880;

-- 2. Find the ID and app name for all apps that were last updated on August 01, 2018.
SELECT id, app_name FROM analytics
   WHERE last_updated = '2018-08-01';

-- Count the number of apps in each category, e.g. “Family | 1972”.
select category, count(id) from analytics group by category;

--Find the top 5 most-reviewed apps and the number of reviews for each.
select app_name from analytics order by reviews DESC Limit 5;

--Find the app that has the most reviews with a rating greater than equal to 4.8.
select app_name from analytics where rating >= 4.8  order by reviews DESC Limit 1;

--Find the average rating for each category ordered by the highest rated to lowest rated.
select category, avg(rating) as avg_rate from analytics group by category order by avg_rate DESC;

--Find the name, price, and rating of the most expensive app with a rating that’s less than 3.
select app_name, price, rating from analytics where rating < 3 order by price desc limit 1;

--Find all apps with a min install not exceeding 50, that have a rating. Order your results by highest rated first.
select * from analytics where min_installs <= 50 and rating > 0 order by rating desc;

--Find the names of all apps that are rated less than 3 with at least 10000 reviews.
select app_name from analytics where rating < 3 and reviews >= 10000;

--Find the top 10 most-reviewed apps that cost between 10 cents and a dollar.
select * from analytics where price between 0.10 and 1 order by reviews DESC limit 10;

--Find the most out of date app. Hint: You don’t need to do it this way, but it’s possible to do with a subquery: http://www.postgresqltutorial.com/postgresql-max-function/
SELECT * FROM analytics 
  WHERE last_updated = (SELECT MIN(last_updated) FROM analytics);

--Find the most expensive app 
select * from analytics where price = (select MAX(price) from analytics);

--Count all the reviews in the Google Play Store.
select count(reviews) from analytics;

--Find all the categories that have more than 300 apps in them.
select category from analytics group by category having count(*) > 300;

-- Find the app that has the highest proportion of min_installs to reviews, among apps that have been installed at least 100,000 times. Display the name of the app along with the number of reviews, the min_installs, and the proportion.
select app_name, reviews, min_installs, min_installs/reviews as propotion from analytics where min_installs > 100000 order by propotion DESC limit 1;