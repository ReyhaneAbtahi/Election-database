--Tables
---Branch

CREATE TABLE [dbo].[Branch](
	[Election_branch_id] [int] IDENTITY(1,1) NOT NULL,
	[City_id] [int] NOT NULL,
	[Address] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Election_branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Branch]  WITH NOCHECK ADD FOREIGN KEY([City_id])
REFERENCES [dbo].[City] ([City_id])
GO

---Candidate

CREATE TABLE [dbo].[Candidate](
	[Candidate_id] [int] IDENTITY(1,1) NOT NULL,
	[National_number] [nchar](10) NOT NULL,
	[Election_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Candidate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[National_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD FOREIGN KEY([Election_id])
REFERENCES [dbo].[Election] ([Election_id])
GO

ALTER TABLE [dbo].[Candidate]  WITH CHECK ADD FOREIGN KEY([National_number])
REFERENCES [dbo].[Person] ([National_number])
GO

---City

CREATE TABLE [dbo].[City](
	[City_id] [int] IDENTITY(1,1) NOT NULL,
	[Province_id] [int] NOT NULL,
	[City_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[City_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[City]  WITH CHECK ADD FOREIGN KEY([Province_id])
REFERENCES [dbo].[Province] ([Province_id])
GO

---Election

CREATE TABLE [dbo].[Election](
	[Election_id] [int] IDENTITY(1,1) NOT NULL,
	[Election_type_id] [int] NOT NULL,
	[Number_of_candidates] [int] NULL,
	[Election_date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[Election_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Election]  WITH CHECK ADD FOREIGN KEY([Election_type_id])
REFERENCES [dbo].[Election_type] ([Election_type_id])
GO

---Election_Branch

CREATE TABLE [dbo].[Election_Branch](
	[Election_id] [int] NOT NULL,
	[Election_branch_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Election_id] ASC,
	[Election_branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Election_Branch]  WITH CHECK ADD FOREIGN KEY([Election_id])
REFERENCES [dbo].[Election] ([Election_id])
GO

ALTER TABLE [dbo].[Election_Branch]  WITH CHECK ADD FOREIGN KEY([Election_branch_id])
REFERENCES [dbo].[Branch] ([Election_branch_id])
GO

---Election_type

CREATE TABLE [dbo].[Election_type](
	[Election_type_id] [int] IDENTITY(1,1) NOT NULL,
	[Election_type] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Election_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

---Person

CREATE TABLE [dbo].[Person](
	[National_number] [nchar](10) NOT NULL,
	[First_name] [varchar](50) NOT NULL,
	[Last_name] [varchar](50) NOT NULL,
	[Birth_date] [date] NOT NULL,
	[Political_party_id] [int] NULL,
	[City_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[National_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Person]  WITH NOCHECK ADD FOREIGN KEY([City_id])
REFERENCES [dbo].[City] ([City_id])
GO

ALTER TABLE [dbo].[Person]  WITH NOCHECK ADD FOREIGN KEY([Political_party_id])
REFERENCES [dbo].[Political_party] ([Political_party_id])
GO

---Political_Party

CREATE TABLE [dbo].[Political_party](
	[Political_party_id] [int] IDENTITY(1,1) NOT NULL,
	[Political_party_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Political_party_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

---Province

CREATE TABLE [dbo].[Province](
	[Province_id] [int] IDENTITY(1,1) NOT NULL,
	[Province_name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Province_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

---Staff

CREATE TABLE [dbo].[Staff](
	[Staff_id] [int] IDENTITY(1,1) NOT NULL,
	[National_number] [nchar](10) NOT NULL,
	[Election_branch_id] [int] NOT NULL,
	[Salary] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Staff_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[National_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([Election_branch_id])
REFERENCES [dbo].[Branch] ([Election_branch_id])
GO

ALTER TABLE [dbo].[Staff]  WITH CHECK ADD FOREIGN KEY([National_number])
REFERENCES [dbo].[Person] ([National_number])
GO

---Supervisor

CREATE TABLE [dbo].[Supervisor](
	[Supervisor_id] [int] IDENTITY(1,1) NOT NULL,
	[National_number] [nchar](10) NOT NULL,
	[Election_branch_id] [int] NOT NULL,
	[Salary] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[Supervisor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[National_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Supervisor]  WITH CHECK ADD FOREIGN KEY([Election_branch_id])
REFERENCES [dbo].[Branch] ([Election_branch_id])
GO

ALTER TABLE [dbo].[Supervisor]  WITH CHECK ADD FOREIGN KEY([National_number])
REFERENCES [dbo].[Person] ([National_number])
GO

---Vote

CREATE TABLE [dbo].[Vote](
	[Voter_id] [int] NOT NULL,
	[Candidate_id] [int] NOT NULL,
	[Election_branch_id] [int] NOT NULL,
	[Vote_time] [time](7) NULL,
	[Election_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Voter_id] ASC,
	[Candidate_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Vote]  WITH NOCHECK ADD FOREIGN KEY([Candidate_id])
REFERENCES [dbo].[Candidate] ([Candidate_id])
GO

ALTER TABLE [dbo].[Vote]  WITH NOCHECK ADD FOREIGN KEY([Election_branch_id])
REFERENCES [dbo].[Branch] ([Election_branch_id])
GO

ALTER TABLE [dbo].[Vote]  WITH NOCHECK ADD FOREIGN KEY([Election_id])
REFERENCES [dbo].[Election] ([Election_id])
GO

ALTER TABLE [dbo].[Vote]  WITH NOCHECK ADD FOREIGN KEY([Voter_id])
REFERENCES [dbo].[Voter] ([Voter_id])
GO

---Voter

CREATE TABLE [dbo].[Voter](
	[Voter_id] [int] IDENTITY(1,1) NOT NULL,
	[National_number] [nchar](10) NOT NULL,
	[Election_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Voter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Voter]  WITH CHECK ADD FOREIGN KEY([Election_id])
REFERENCES [dbo].[Election] ([Election_id])
GO

ALTER TABLE [dbo].[Voter]  WITH CHECK ADD FOREIGN KEY([National_number])
REFERENCES [dbo].[Person] ([National_number])
GO

--Viwes
---Candidate_details : show complete information of candidates

create view [dbo].[Candidate_details] as
(
	select Candidate_id, Candidate.National_number, First_name, Last_name, Birth_date, Political_party_name,
		   Province_name, City_name, Election_type
	from Candidate join Person on(Candidate.National_number = Person.National_number)
	join Political_party on (Person.Political_party_id = Political_party.Political_party_id)
	join City on (City.City_id = Person.City_id)
	join Province on (City.Province_id = Province.Province_id)
	join Election on (Candidate.Election_id = Election.Election_id)
	join Election_type on (Election.Election_type_id = Election_type.Election_type_id)
)

---Candidate_votes : show number of votes for each candidate

create view [dbo].[Candidate_votes] as
(
	select Vote.Candidate_id, First_name, Last_name, count(*) as votes
	from Vote join Candidate on (Vote.Candidate_id = Candidate.Candidate_id)
	join Person on(Candidate.National_number = Person.National_number)
	group by Vote.Candidate_id, First_name, Last_name
)

---Province_City_votes : show number of votes grouped by rollup(province, city)

create view [dbo].[Province_City_votes] as
(
	select Province_name, City.City_name, count(*) as votes
	from Vote join Branch on (Vote.Election_branch_id = Branch.Election_branch_id)
	join City on (City.City_id = Branch.City_id)
	join Province on (City.Province_id = Province.Province_id)
	group by rollup(Province_name, City.City_name)
)

---Staff_details : show complete information of staffs

create view [dbo].[Staff_details] as
(
	select Staff_id, Staff.National_number, First_name, Last_name, Birth_date, Political_party_name,
		   P1.Province_name as Staff_Province, C1.City_name as Staff_city, 
		   P2.Province_name as Branch_Province, C2.City_name as Branch_city, [Address], Salary
	from Staff join Person on(Staff.National_number = Person.National_number)
	join Political_party on (Person.Political_party_id = Political_party.Political_party_id)
	join City as C1 on (C1.City_id = Person.City_id)
	join Province P1 on (C1.Province_id = P1.Province_id)
	join Branch on (Branch.Election_branch_id = Staff.Election_branch_id)
	join City as C2 on (C2.City_id = Branch.City_id)
	join Province P2 on (C2.Province_id = P2.Province_id)
)

---Supervisor_details : show complete information of supervisors

create view [dbo].[Supervisor_details] as
(
	select Supervisor_id, Supervisor.National_number, First_name, Last_name, Birth_date, Political_party_name,
		   P1.Province_name as Supervisor_Province, C1.City_name as Supervisor_city, 
		   P2.Province_name as Branch_Province, C2.City_name as Branch_city, [Address], Salary
	from Supervisor join Person on(Supervisor.National_number = Person.National_number)
	join Political_party on (Person.Political_party_id = Political_party.Political_party_id)
	join City as C1 on (C1.City_id = Person.City_id)
	join Province P1 on (C1.Province_id = P1.Province_id)
	join Branch on (Branch.Election_branch_id = Supervisor.Election_branch_id)
	join City as C2 on (C2.City_id = Branch.City_id)
	join Province P2 on (C2.Province_id = P2.Province_id)
)

---Voter_details : show complete information of voters

create view [dbo].[Voter_details] as
(
	select Voter_id, Voter.National_number, First_name, Last_name, Birth_date, Political_party_name,
		   Province_name, City_name, Election_type
	from Voter join Person on(Voter.National_number = Person.National_number)
	join Political_party on (Person.Political_party_id = Political_party.Political_party_id)
	join City on (City.City_id = Person.City_id)
	join Province on (City.Province_id = Province.Province_id)
	join Election on (Voter.Election_id = Election.Election_id)
	join Election_type on (Election.Election_type_id = Election_type.Election_type_id)
)

--Functions
---Fnc_GetBranch_Address : return address of branches located in specific city

create function [dbo].[Fnc_GetBranch_Address](@City_name varchar(50))
returns table
AS
return
(
	select Election_branch_id, [address] 
	from Branch join city on(Branch.City_id = City.City_id)
	where City_name = @City_name
)

---Fnc_CheckCandidate_Age : check candidate's age be more than 40

create function [dbo].[Fnc_CheckCandidate_Age](@National_number char(10), @Election_id int)
returns varchar(100)
as
begin

declare @ErrorMessage VARCHAR(100)
set @ErrorMessage = ''

declare @Birth_date Date
declare @Election_date Date

select @Birth_date = Birth_date from Person where National_number = @National_number
select @Election_date = Election_date from Election where Election_id = @Election_id
if ((DATEDIFF(MONTH, @Birth_date, @Election_date) - CASE WHEN DATEPART(DAY, @Birth_date) > DATEPART(DAY, @Election_date) THEN 1 ELSE 0 END) / 12) >= 40
begin
	set @ErrorMessage = 'شخص واجد شرایط نامزدی انتخابات است'
end
else
begin
	set @ErrorMessage = 'شخص واجد شرایط نامزدی انتخابات نیست'
end

return @ErrorMessage
end

---Fnc_CheckVoter_Age : check voter's age be more than 18

create function [dbo].[Fnc_CheckVoter_Age](@National_number char(10), @Election_id int)
returns varchar(100)
as
begin

declare @ErrorMessage VARCHAR(100)
set @ErrorMessage = ''

declare @Birth_date Date
declare @Election_date Date

select @Birth_date = Birth_date from Person where National_number = @National_number
select @Election_date = Election_date from Election where Election_id = @Election_id
if ((DATEDIFF(MONTH, @Birth_date, @Election_date) - CASE WHEN DATEPART(DAY, @Birth_date) > DATEPART(DAY, @Election_date) THEN 1 ELSE 0 END) / 12) >= 18
begin
	set @ErrorMessage = 'شخص واجد شرایط رای دادن است'
end
else
begin
	set @ErrorMessage = 'شخص واجد شرایط رای دادن نیست'
end

return @ErrorMessage
end

---Fnc_CheckNational_number : check validity of National_number

CREATE FUNCTION [dbo].[Fnc_CheckNational_number]	(@National_number VARCHAR(10))
RETURNS VARCHAR(100)
AS

BEGIN

DECLARE @ErrorMessage VARCHAR(100)
	,@C INT
	,@N INT
	,@R INT
SET @ErrorMessage = ''

IF (
	LEN(@National_number) <> 10
	OR @National_number = '0000000000'
	OR @National_number = '1111111111'
	OR @National_number = '2222222222'
	OR @National_number = '3333333333'
	OR @National_number = '4444444444'
	OR @National_number = '5555555555'
	OR @National_number = '6666666666'
	OR @National_number = '7777777777'
	OR @National_number = '8888888888'
	OR @National_number = '9999999999'
	)
BEGIN
	SET @ErrorMessage = 'کد ملی نامعتبر است'
END
ELSE
BEGIN

	SET @C = cast(SUBSTRING(@National_number, 10, 1) as int)

	SET @N = (cast(SUBSTRING(@National_number, 1, 1) as int) * 10) +
		(cast(SUBSTRING(@National_number, 2, 1) as int) * 9) +
		(cast(SUBSTRING(@National_number, 3, 1) as int) * 8) +
		(cast(SUBSTRING(@National_number, 4, 1) as int) * 7) +
		(cast(SUBSTRING(@National_number, 5, 1) as int) * 6) +
		(cast(SUBSTRING(@National_number, 6, 1) as int) * 5) +
		(cast(SUBSTRING(@National_number, 7, 1) as int) * 4) +
		(cast(SUBSTRING(@National_number, 8, 1) as int) * 3) +
		(cast(SUBSTRING(@National_number, 9, 1) as int) * 2)

	SET @R = @N % 11
	
	IF ((@R = 0 AND @R = @C) OR (@R = 1 AND @C = 1) OR (@R > 1 AND @C = 11 - @R))
		SET @ErrorMessage = 'کد ملی معتبر است'
	ELSE
		SET @ErrorMessage = 'کد ملی نامعتبر است'

END

RETURN @ErrorMessage

END

--TRIGGERS
---Trg_TestVoter_Age : inser into Voter if age be bigger than 18

CREATE TRIGGER dbo.Trg_TestVoter_Age 
ON Voter
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO Voter(National_number, Election_id) 
	SELECT National_number, Election_id 
	FROM inserted 
	WHERE dbo.Fnc_CheckVoter_Age(inserted.National_number, inserted.Election_id) = 'شخص واجد شرایط رای دادن است'
END

---Trg_TestNational_number : insert into Person if National_number be valid

CREATE TRIGGER dbo.Trg_TestNational_number 
ON Person
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO Person SELECT * FROM inserted 
						WHERE dbo.Fnc_CheckNational_number(inserted.National_number) = 'کد ملی معتبر است'
END
;

---Trg_TestCandidate_Age : inser into Candidate if age be bigger than 40

CREATE TRIGGER dbo.Trg_TestCandidate_Age 
ON Candidate
INSTEAD OF INSERT
AS
BEGIN
	INSERT INTO Candidate(National_number, Election_id) 
	SELECT National_number, Election_id 
	FROM inserted 
	WHERE dbo.Fnc_CheckCandidate_Age(inserted.National_number, inserted.Election_id) = 'شخص واجد شرایط نامزدی انتخابات است'
END

--STORED PROCEDURE
---SPRecord_Vote : record a vote in vote table

CREATE PROCEDURE dbo.SPRecord_Vote
@National_number nchar(10),
@Candidate_id int,
@Election_branch_id int,
@Election_id int
AS
BEGIN
	declare @Voter_id int
	set @Voter_id = -1
	select @Voter_id = Voter_id from Voter where National_number = @National_number
	if @voter_id != -1
		insert into vote(Voter_id, Candidate_id, Election_branch_id, Vote_time, Election_id)
		values(@Voter_id, @Candidate_id, @Election_branch_id, CONVERT(TIME,GETDATE()), @Election_id)
	else
		print 'Your NationalNumber does not exist in Voter'
END

---SPWinner_In_Each_City : determin winner of election in each city

CREATE PROCEDURE dbo.SPWinner_In_Each_City
@Election_id int
AS
BEGIN
	with t1(City_id, Candidate_id, num) as
	(
		select City_id, Candidate_id, count(*)
		from vote join Branch on (vote.Election_branch_id = Branch.Election_branch_id)
		where vote.Election_id = @Election_id
		group by City_id, Candidate_id
	),
	t2 (City_id, mux) as
	(
		select City_id, MAX(num)
		from t1
		group by City_id
	)
	select City_name, Person.First_name + ' ' + Person.Last_name as 'Candidate Name', num as Num_votes
	from t1 join t2 on(t1.City_id = t2.City_id)
	join City on(t1.City_id = City.City_id)
	join Candidate on(t1.Candidate_id = Candidate.Candidate_id)
	join Person on(Candidate.National_number = Person.National_number)
	where t1.num = t2.mux
	order by t1.City_id
END


---SPSalary_Increase : increase salary of staffs 10% and salary of supervisors 20%
CREATE PROCEDURE dbo.SPSalary_Increase
AS
BEGIN
	update Staff
	set Salary = 1.1 * Salary

	update Supervisor
	set Salary = 1.2 * Salary
END













