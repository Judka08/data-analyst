SELECT 
	TermReason AS `Reasons of employees leaving`,
    count(EmpID) AS `Number of employees`
FROM world.hrdataset
WHERE 
	Position = "software engineer" 
    AND EmploymentStatus != "Active"
GROUP BY TermReason
ORDER BY 2 DESC 
LIMIT 10;