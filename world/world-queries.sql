
-- 1. ¿Cuántos idiomas tiene el país con código 'USA'?

SELECT COUNT(*)
	FROM country c, countrylanguage l
	WHERE c.code = l.countrycode
	AND c.code = 'USA'


-- 2. ¿Cuál es el promedio de porcentaje de lenguaje 'Spanish' 
-- en los paises que sí lo hablan de la región 'Caribbean'?

SELECT AVG(percentage)
	FROM country c, countrylanguage l
	WHERE c.code = l.countrycode
	AND c.region = 'Caribbean'
	AND language = 'Spanish'


-- 3. ¿En cuantos paises no se habla el lenguaje 'English'?

SELECT 
	(SELECT COUNT(*)
		FROM country c)
	-
	(SELECT COUNT(*)
		FROM country c, countrylanguage l
		WHERE c.code = l.countrycode
		AND l.language = 'English')


-- 4. ¿Cuántas personas de manera aproximada de la ciudad
-- 'Mumbai' del país 'IND' hablan lenguaje 'Hindi' según 
-- su porcentaje?

SELECT ROUND(
	(SELECT population
		FROM city
		WHERE name = 'Mumbai (Bombay)' )
	*
	(SELECT percentage
		FROM country c, countrylanguage l
		WHERE c.code = l.countrycode
		AND c.code = 'IND'
		AND l.language = 'Hindi')
	/
	100)

-- 5. Mostrar una tabla categorizada por el nivel expectativa 
-- de vida nula, baja, media y alta de países. Los resultados 
-- deben estar agrupados por continente. 
-- (Usar tablas dinamicas con CASE)

SELECT * FROM (
	(SELECT continent,
		sum (CASE WHEN lifeexpectancy IS NULL THEN 1 ELSE 0 END) nula,
		sum (CASE WHEN lifeexpectancy<50 THEN 1 ELSE 0 END) baja,
		sum (CASE WHEN (lifeexpectancy>=50 AND lifeexpectancy<65) THEN 1 ELSE 0 END) media,
		sum (CASE WHEN lifeexpectancy>=65 THEN 1 ELSE 0 END) alta,
		count(name) as subtotal
		FROM country
		GROUP BY continent order by continent)
	UNION
	(SELECT 'TOTAL',
		sum (CASE WHEN lifeexpectancy IS NULL THEN 1 ELSE 0 END) nula,
		sum (CASE WHEN lifeexpectancy<50 THEN 1 ELSE 0 END) baja,
		sum (CASE WHEN (lifeexpectancy>=50 AND lifeexpectancy<65) THEN 1 ELSE 0 END) media,
		sum (CASE WHEN lifeexpectancy>=65 THEN 1 ELSE 0 END) alta,
		count(name) as subtotal
		FROM country)) AS t
	ORDER BY continent
