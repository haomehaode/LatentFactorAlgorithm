go
create view test(�û����,�γ̱��,��������)
as
--����γ�
select UserPageViews.User_ID �û����,Navigations.Nav_ID ��ǩ,UserPageViews.UPV_Type �������� from UserPageViews
join Courses on Courses.Cou_ID=UserPageViews.UPV_Target
join dbo.Navigations on dbo.Navigations.Nav_ID=Courses.Cou_Tags
where UserPageViews.UPV_Type  = '1'
union all
--�Ƽ��γ�
select UserLikes.User_ID �û����,Navigations.Nav_ID ��ǩ,UserLikes.UL_Type �������� from UserLikes
join Courses on Courses.Cou_ID=UserLikes.UL_Target
join Navigations on Navigations.Nav_ID=Courses.Cou_Tags
where UserLikes.UL_Type = '11'
union all
--���Ƽ��γ�
select UserNotLikes.User_ID �û����,Navigations.Nav_ID ��ǩ,UserNotLikes.UNL_Type �������� from UserNotLikes
join Courses on Courses.Cou_ID=UserNotLikes.UNL_Target
join Navigations on Navigations.Nav_ID=Courses.Cou_Tags
where UserNotLikes.UNL_Type='18'
union all
--�ղؿγ�
select UserCollections.User_ID �û����,Navigations.Nav_ID ��ǩ,UserCollections.UC_Type �������� from UserCollections
join Courses on Courses.Cou_ID=UserCollections.UC_Target
join Navigations on Navigations.Nav_ID=Courses.Cou_Tags
where UserCollections.UC_Type='8'
union all
create view Learn
as
--ѧϰ�γ�
select UserLearnCoursesRecord.User_ID �û����,Navigations.Nav_ID ��ǩ from UserLearnCoursesRecord
join Courses on Courses.Cou_ID=UserLearnCoursesRecord.Cou_ID
join Navigations on Navigations.Nav_ID=Courses.Cou_Tags
group by  UserLearnCoursesRecord.User_ID,Navigations.Nav_ID
select * from test where �û����=2
create table Array
(
   User_ID int not null  FOREIGN KEY REFERENCES UserInfo(User_ID),
   Nav_ID int not null   FOREIGN KEY REFERENCES Navigations(Nav_ID),
   Socure int default(0)
)
create table UserArr
(
  Arr_Id int primary key identity(1,1),
  Use_ID int,
  Ngv_ID int,
  Soc int
)




--DECLARE @shopid NVARCHAR(12)
--DECLARE @shopname NVARCHAR(50)
--DECLARE @parentid NVARCHAR(12)

--CREATE TABLE #temp(
--	shopid nvarchar(12),
--	shopname nvarchar(50),
--	parentid nvarchar(12)
--)
--BEGIN
--	INSERT INTO #temp VALUES(-1)
--	--�����α�
--	DECLARE mycursor CURSOR FOR SELECT SHOP_ID,SHOP_NAME,CODE FROM dbo.SHOP00 WHERE LEN(isnull(CODE,'')) > 0 
--								UNION 
--								SELECT group_id,GROUP_NAME,PARENT_ID FROM dbo.shopgroup2
--	--���α�
--	OPEN mycursor
--	--ʹ���α�
--	FETCH NEXT FROM mycursor INTO @shopid,@shopname,@parentid
--	WHILE @@FETCH_STATUS = 0
--		BEGIN
--			INSERT INTO #temp VALUES (@shopid,@shopname,@parentid)
--			FETCH NEXT FROM mycursor INTO @shopid,@shopname,@parentid
--		END
--	--�ر��α�
--	CLOSE mycursor
--	--�ͷ��α�
--	DEALLOCATE mycursor
--	SELECT * FROM #temp
--	DROP TABLE #temp
--END


