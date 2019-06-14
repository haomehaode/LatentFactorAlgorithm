go
create view View_All(用户编号,标签,操作类型)
as
--浏览课程
select UserPageViews.User_ID 用户编号,Navigations.Nav_ID 标签,UserPageViews.UPV_Type 操作类型 from UserPageViews
join Courses on Courses.Cou_ID=UserPageViews.UPV_Target
join ObjectTags on ObjectTags.Obj_ID=Courses.Cou_ID
join dbo.Navigations on dbo.Navigations.Nav_ID=ObjectTags.Obj_TagID
where UserPageViews.UPV_Type  = '1'
union all
--推荐课程
select UserLikes.User_ID 用户编号,Navigations.Nav_ID 标签,UserLikes.UL_Type 操作类型 from UserLikes
join Courses on Courses.Cou_ID=UserLikes.UL_Target
join ObjectTags on ObjectTags.Obj_ID=Courses.Cou_ID
join dbo.Navigations on dbo.Navigations.Nav_ID=ObjectTags.Obj_TagID
where UserLikes.UL_Type = '11'
union all
--收藏课程
select UserCollections.User_ID 用户编号,Navigations.Nav_ID 标签,UserCollections.UC_Type 操作类型 from UserCollections
join Courses on Courses.Cou_ID=UserCollections.UC_Target
join ObjectTags on ObjectTags.Obj_ID=Courses.Cou_ID
join dbo.Navigations on dbo.Navigations.Nav_ID=ObjectTags.Obj_TagID
where UserCollections.UC_Type='8'

--学习课程
create view View_learn
as
select UserLearnCoursesRecord.User_ID 用户编号,Navigations.Nav_ID 标签 from UserLearnCoursesRecord
join Courses on Courses.Cou_ID=UserLearnCoursesRecord.Cou_ID
join ObjectTags on ObjectTags.Obj_ID=Courses.Cou_ID
join dbo.Navigations on dbo.Navigations.Nav_ID=ObjectTags.Obj_TagID
group by  UserLearnCoursesRecord.User_ID,Navigations.Nav_ID
--存放原始矩阵
Create table UserAry
(
  Arr_ID int primary key identity(1,1),
  User_ID int not null  FOREIGN KEY REFERENCES UserInfo(User_ID),--用户ID
  Nav_ID int not null   FOREIGN KEY REFERENCES Navigations(Nav_ID),--标签
  Ary_Sco int--分数
)
--存放分解后的矩阵
Create table NewAry
(
  Arr_ID int primary key identity(1,1),
  User_ID int not null  FOREIGN KEY REFERENCES UserInfo(User_ID),--用户ID
  Nav_ID int not null   FOREIGN KEY REFERENCES Navigations(Nav_ID),--标签
  Ary_Sco float --分数
)
--创建查找所有用户ID存储过程
create proc  PR_UserID
as
begin
select User_ID from UserInfo order by User_ID
END
exec PR_UserID
--创建查找课程标签ID
create proc PR_CouID
as
begin
select Nav_ID from Navigations
end
exec PR_CouID
--创建推荐、收藏、浏览用户ID
create proc PR_AllID
as
begin
select 用户编号 from View_All group  by 用户编号 order by 用户编号
end
exec  PR_AllID
select * from UserLikes
	insert into UserLikes (UL_Type, User_ID, UL_Target, UL_Time)values(11,3,1011,'2017-4-1')
	insert into UserLikes (UL_Type, User_ID, UL_Target, UL_Time)values(11,2,1021,'2017-4-1')
	insert into UserLikes (UL_Type, User_ID, UL_Target, UL_Time)values(11,4,1021,'2017-4-1')
	insert into UserLikes (UL_Type, User_ID, UL_Target, UL_Time)values(11,5,1012,'2017-4-1')
	insert into UserLikes (UL_Type, User_ID, UL_Target, UL_Time)values(11,6,1014,'2017-4-1')
	insert into UserLikes (UL_Type, User_ID, UL_Target, UL_Time)values(11,2,1,'2017-4-1')
	insert into UserCollections(UC_Type, User_ID, UC_Target, UC_Time)values(8,2,2,'2017-4-1')
	insert into UserCollections(UC_Type, User_ID, UC_Target, UC_Time)values(8,3,1014,'2017-4-1')
	insert into UserCollections(UC_Type, User_ID, UC_Target, UC_Time)values(8,4,1017,'2017-4-1')
	insert into UserCollections(UC_Type, User_ID, UC_Target, UC_Time)values(8,5,1018,'2017-4-1')
	insert into UserCollections(UC_Type, User_ID, UC_Target, UC_Time)values(8,6,1019,'2017-4-1')
	insert into UserCollections(UC_Type, User_ID, UC_Target, UC_Time)values(8,7,3,'2017-4-1')
	insert into UserCollections(UC_Type, User_ID, UC_Target, UC_Time)values(8,1009,4,'2017-4-1')
	insert into UserPageViews (UPV_Type,User_ID,UPV_Target,UPV_Time)values(1,1007,1025,'2017-4-1')
	insert into UserPageViews (UPV_Type,User_ID,UPV_Target,UPV_Time)values(1,1008,1016,'2017-4-1')
	insert into UserPageViews (UPV_Type,User_ID,UPV_Target,UPV_Time)values(1,2,1,'2017-4-1')
	insert into UserPageViews (UPV_Type,User_ID,UPV_Target,UPV_Time)values(1,3,1019,'2017-4-1')
	insert into UserPageViews (UPV_Type,User_ID,UPV_Target,UPV_Time)values(1,5,1005,'2017-4-1')
	insert into UserPageViews (UPV_Type,User_ID,UPV_Target,UPV_Time)values(1,1007,3,'2017-4-1')
--创建用户学习课程用户ID存储过程
create proc PR_learnID
as
begin
select 用户编号 from View_learn group by 用户编号 order by 用户编号
end
exec PR_learnID
--insert into UserLearnCoursesRecord(User_ID, Cou_ID, ULC_Time)values(2,1005,'2017-4-1')
--insert into UserLearnCoursesRecord(User_ID, Cou_ID, ULC_Time)values(3,1,'2017-4-1')
--insert into UserLearnCoursesRecord(User_ID, Cou_ID, ULC_Time)values(4,1026,'2017-4-1')
--insert into UserLearnCoursesRecord(User_ID, Cou_ID, ULC_Time)values(2,1014,'2017-4-1')
--insert into UserLearnCoursesRecord(User_ID, Cou_ID, ULC_Time)values(5,5,'2017-4-1')
--insert into UserLearnCoursesRecord(User_ID, Cou_ID, ULC_Time)values(3,1016,'2017-4-1')
--insert into UserLearnCoursesRecord(User_ID, Cou_ID, ULC_Time)values(1007,1055,'2017-4-1')
--select * from UserLearnCoursesRecord
--创建查找用户是否学习过某课程，  存储过程
create proc PR_Learn
@User_ID int,
@Nav_ID int
as
begin
select COUNT(*) from View_learn where 用户编号=@User_ID and 标签=@Nav_ID 
end
exec PR_Learn @User＿ID=2,@Nav_ID=1
--根据用户ID，标签查找浏览、收藏、推荐，返回推荐类型
create proc PR_ALL
@User_ID int,
@Nav_ID int
as
begin
select 操作类型 from View_All where  用户编号=@User_ID and 标签=@Nav_ID group by 操作类型 
end
exec PR_ALL @User＿ID=3,@Nav_ID=18
select * from View_All
--创建写入UserAll的存储过程
create proc PR_UserAry
@User_ID int,
@Nav_ID int,
@Ary_Sco int
as
begin
insert into UserAry values(@User_ID,@Nav_ID,@Ary_Sco)
end
--创建写入NewAry的存储过程
create proc PR_NewAry
@User_ID int,
@Nav_ID int,
@Ary_Sco float
as
begin
insert into NewAry values(@User_ID,@Nav_ID,@Ary_Sco)
end
--创建查找UserAll所有信息的存储过程
create proc PR_SelectAll
as
begin
select * from UserAry order by UserAry.User_ID,UserAry.Nav_ID
end
create proc PR_SelAll
@User_ID int,
@Nav_ID int
as
begin
select * from UserAry where UserAry.User_ID=@User_ID and UserAry.Nav_ID=@Nav_ID
end


select 用户编号 from View_learn group by 用户编号
select count(*) from UserAry  where UserAry.User_ID=2
select count(*) from UserAry  where UserAry.User_ID=3
select count(*) from UserAry  where UserAry.User_ID=4
select * from UserAry  where UserAry.User_ID=4 order by Nav_ID
select count(*) from UserAry  where UserAry.User_ID=6
select count(*) from UserAry  where UserAry.User_ID=1007
select count(*) from UserAry  where UserAry.User_ID=1008
select count(*) from UserAry  where UserAry.User_ID=1009
select UserLearnCoursesRecord.User_ID,UserLearnCoursesRecord.Cou_ID,Navigations.Nav_ID from UserLearnCoursesRecord
join ObjectTags on ObjectTags.Obj_ID=UserLearnCoursesRecord.Cou_ID
join dbo.Navigations on dbo.Navigations.Nav_ID=ObjectTags.Obj_TagID
where User_ID=2
select * from UserAry where UserAry.User_ID=2 and UserAry.Ary_Sco=5
select * from UserAry where UserAry.User_ID=1007 and UserAry.Ary_Sco!=5 and UserAry.Ary_Sco!=0
select * from View_All where 用户编号=1007
select * from UserAry where UserAry.User_ID=5 and UserAry.Ary_Sco!=5 and UserAry.Ary_Sco!=0
select * from View_All where 用户编号=5
select * from UserAry order by UserAry.User_ID,UserAry.
select * from NewAry
