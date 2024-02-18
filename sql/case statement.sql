-- CASE STATEMNET--
--ALEXI KURSUS --

SELECT FirstName,Lastname, Age
CASE
  WHEN Age > 30 THEN 'Old'
  ELSE 'YOUNG'
END
FROM SQLTutorial.dbo.EmployeeDemographics
WHERE Age is NOT NULL
ORDER BY Age

  -- lisaklauslid --
  SELECT FirstName,Lastname, Age
  CASE
    WHEN Age > 30 THEN 'Old'
    WHEN Age BETWEEN 27 AND 30 THEN 'Young'
    ELSE 'Baby'
  END
  FROM SQLTutorial.dbo.EmployeeDemographics
  WHERE Age is NOT NULL
  ORDER BY Age

  ---Keeruliosem koos JOINiga --
-- END AS SalaryAfterRaise  - annab tulbale nime--
  SELECT FirstName,Lastname, JobTitle, Salary
  CASE
    WHEN JobTitle 'Salesman' THEN Salary + (Salary * .10)
    WHEN JobTitle 'Accountant' THEN Salary + (Salary * .05)
    WHEN JobTitle 'HR' THEN Salary + (Salary * .00001)
    ELSE Salary + (salary * 0.3)
  END
  FROM SQLTutorial.dbo.EmployeeDemographics
  JOIN SQLTutorial.dbo.EmployeeSalary
