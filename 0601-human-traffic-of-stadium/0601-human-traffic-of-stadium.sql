with t as(SELECT id, visit_date, people, id-ROW_NUMBER() OVER() as diff FROM stadium WHERE people >=100),
b as(SELECT id, visit_date, people, count(*) OVER(PARTITION BY diff) AS cnt FROM t )

SELECT id, visit_date, people FROM b WHERE cnt >=3 ORDER BY visit_date