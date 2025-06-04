SELECT 
	Position, 
	ROUND(AVG(Salary)) AS `Average salary`
FROM world.hrdataset
WHERE 
	Position = "software engineer" 
    AND EmploymentStatus = "active"
GROUP BY Position;