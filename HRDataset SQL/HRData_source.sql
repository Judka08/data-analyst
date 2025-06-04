SELECT 
	RecruitmentSource AS `source`, 
    count(EmpID) AS `number` 
FROM world.hrdataset
	WHERE position = "software engineer" 
GROUP BY RecruitmentSource
ORDER BY source;

