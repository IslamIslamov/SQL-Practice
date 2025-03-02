CREATE TABLE nodes (
	point1 	VARCHAR(1) 	NOT NULL,
	point2 	VARCHAR(1) 	NOT NULL,
	cost 	INTEGER 	NOT NULL,
	CONSTRAINT un_nodes UNIQUE(point1, point2)
);

INSERT INTO
      nodes
VALUES
      ('a', 'b', 10),
      ('a', 'c', 15),
      ('a', 'd', 20),
      ('b', 'a', 10),
      ('b', 'd', 25),
      ('b', 'c', 35),
      ('c', 'b', 35),
      ('c', 'd', 30),
      ('c', 'a', 15),
      ('d', 'a', 20),
      ('d', 'b', 25),
      ('d', 'c', 30);

CREATE OR REPLACE VIEW v_all_paths AS
  WITH RECURSIVE all_paths (point1, point2, total_cost, tour) AS (
  	SELECT 
		point1, 
		point2,
		cost::INTEGER AS total_cost,
		point1 || ',' || point2 AS tour
	FROM nodes
	WHERE point1 = 'a'
	UNION ALL
	SELECT 
		n.point1,
		n.point2,
		ap.total_cost + n.cost AS total_cost,
		ap.tour || ',' || n.point2::text AS tour
	FROM all_paths AS ap
		JOIN nodes AS n
			ON ap.point2 = n.point1 
				AND ap.point1 != n.point2
	WHERE LENGTH(ap.tour) < (SELECT COUNT(DISTINCT point1) * 2 FROM nodes)
	)
	
	SELECT 
		total_cost,
		'{' || tour || '}' AS tour
		FROM all_paths AS ap
			WHERE point2 = 'a' 
				AND LENGTH(ap.tour) = 
					(SELECT COUNT(DISTINCT point1) * 2 + 1 FROM nodes)
	ORDER BY
		total_cost ASC,
		tour ASC;

SELECT
	total_cost,
	tour
	FROM v_all_paths
	WHERE total_cost = (SELECT MIN(total_cost) FROM v_all_paths);