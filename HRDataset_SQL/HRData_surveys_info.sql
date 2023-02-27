SELECT 
Position, 
ROUND(AVG(EngagementSurvey),1) AS `Average of Engagement Survey`,
ROUND(AVG(EmpSatisfaction),1) AS `Average of Employee Satisfaction` 
FROM world.hrdataset
WHERE Position = "software engineer"
AND EmploymentStatus = "Active"
GROUP BY Position;