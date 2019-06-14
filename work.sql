go
create view test(用户编号,课程编号,操作类型)
as
--浏览课程
select UserPageViews.User_ID 用户编号,Navigations.Nav_ID 标签,UserPageViews.UPV_Type 操作类型 from UserPageViews
join Courses on Courses.Cou_ID=UserPageViews.UPV_Target
join dbo.Navigations on dbo.Navigations.Nav_ID=Courses.Cou_Tags
where UserPageViews.UPV_Type  = '1'
union all
--推荐课程
select UserLikes.User_ID 用户编号,Navigations.Nav_ID 标签,UserLikes.UL_Type 操作类型 from UserLikes
join Courses on Courses.Cou_ID=UserLikes.UL_Target
join Navigations on Navigations.Nav_ID=Courses.Cou_Tags
where UserLikes.UL_Type = '11'
union all
--不推荐课程
select UserNotLikes.User_ID 用户编号,Navigations.Nav_ID 标签,UserNotLikes.UNL_Type 操作类型 from UserNotLikes
join Courses on Courses.Cou_ID=UserNotLikes.UNL_Target
join Navigations on Navigations.Nav_ID=Courses.Cou_Tags
where UserNotLikes.UNL_Type='18'
union all
--收藏课程
select UserCollections.User_ID 用户编号,Navigations.Nav_ID 标签,UserCollections.UC_Type 操作类型 from UserCollections
join Courses on Courses.Cou_ID=UserCollections.UC_Target
join Navigations on Navigations.Nav_ID=Courses.Cou_Tags
where UserCollections.UC_Type='8'
union all
create view Learn
as
--学习课程
select UserLearnCoursesRecord.User_ID 用户编号,Navigations.Nav_ID 标签 from UserLearnCoursesRecord
join Courses on Courses.Cou_ID=UserLearnCoursesRecord.Cou_ID
join Navigations on Navigations.Nav_ID=Courses.Cou_Tags
group by  UserLearnCoursesRecord.User_ID,Navigations.Nav_ID
select * from test where 用户编号=2
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
--	--定义游标
--	DECLARE mycursor CURSOR FOR SELECT SHOP_ID,SHOP_NAME,CODE FROM dbo.SHOP00 WHERE LEN(isnull(CODE,'')) > 0 
--								UNION 
--								SELECT group_id,GROUP_NAME,PARENT_ID FROM dbo.shopgroup2
--	--打开游标
--	OPEN mycursor
--	--使用游标
--	FETCH NEXT FROM mycursor INTO @shopid,@shopname,@parentid
--	WHILE @@FETCH_STATUS = 0
--		BEGIN
--			INSERT INTO #temp VALUES (@shopid,@shopname,@parentid)
--			FETCH NEXT FROM mycursor INTO @shopid,@shopname,@parentid
--		END
--	--关闭游标
--	CLOSE mycursor
--	--释放游标
--	DEALLOCATE mycursor
--	SELECT * FROM #temp
--	DROP TABLE #temp
--END


