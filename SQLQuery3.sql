go
create view View_All(�û����,��ǩ,��������)
as
--����γ�
select UserPageViews.User_ID �û����,Navigations.Nav_ID ��ǩ,UserPageViews.UPV_Type �������� from UserPageViews
join Courses on Courses.Cou_ID=UserPageViews.UPV_Target
join ObjectTags on ObjectTags.Obj_ID=Courses.Cou_ID
join dbo.Navigations on dbo.Navigations.Nav_ID=ObjectTags.Obj_TagID
where UserPageViews.UPV_Type  = '1'
union all
--�Ƽ��γ�
select UserLikes.User_ID �û����,Navigations.Nav_ID ��ǩ,UserLikes.UL_Type �������� from UserLikes
join Courses on Courses.Cou_ID=UserLikes.UL_Target
join ObjectTags on ObjectTags.Obj_ID=Courses.Cou_ID
join dbo.Navigations on dbo.Navigations.Nav_ID=ObjectTags.Obj_TagID
where UserLikes.UL_Type = '11'
union all
--�ղؿγ�
select UserCollections.User_ID �û����,Navigations.Nav_ID ��ǩ,UserCollections.UC_Type �������� from UserCollections
join Courses on Courses.Cou_ID=UserCollections.UC_Target
join ObjectTags on ObjectTags.Obj_ID=Courses.Cou_ID
join dbo.Navigations on dbo.Navigations.Nav_ID=ObjectTags.Obj_TagID
where UserCollections.UC_Type='8'

--ѧϰ�γ�
create view View_learn
as
select UserLearnCoursesRecord.User_ID �û����,Navigations.Nav_ID ��ǩ from UserLearnCoursesRecord
join Courses on Courses.Cou_ID=UserLearnCoursesRecord.Cou_ID
join ObjectTags on ObjectTags.Obj_ID=Courses.Cou_ID
join dbo.Navigations on dbo.Navigations.Nav_ID=ObjectTags.Obj_TagID
group by  UserLearnCoursesRecord.User_ID,Navigations.Nav_ID
--���ԭʼ����
Create table UserAry
(
  Arr_ID int primary key identity(1,1),
  User_ID int not null  FOREIGN KEY REFERENCES UserInfo(User_ID),--�û�ID
  Nav_ID int not null   FOREIGN KEY REFERENCES Navigations(Nav_ID),--��ǩ
  Ary_Sco int--����
)
--��ŷֽ��ľ���
Create table NewAry
(
  Arr_ID int primary key identity(1,1),
  User_ID int not null  FOREIGN KEY REFERENCES UserInfo(User_ID),--�û�ID
  Nav_ID int not null   FOREIGN KEY REFERENCES Navigations(Nav_ID),--��ǩ
  Ary_Sco float --����
)
--�������������û�ID�洢����
create proc  PR_UserID
as
begin
select User_ID from UserInfo order by User_ID
END
exec PR_UserID
--�������ҿγ̱�ǩID
create proc PR_CouID
as
begin
select Nav_ID from Navigations
end
exec PR_CouID
--�����Ƽ����ղء�����û�ID
create proc PR_AllID
as
begin
select �û���� from View_All group  by �û���� order by �û����
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
--�����û�ѧϰ�γ��û�ID�洢����
create proc PR_learnID
as
begin
select �û���� from View_learn group by �û���� order by �û����
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
--���������û��Ƿ�ѧϰ��ĳ�γ̣�  �洢����
create proc PR_Learn
@User_ID int,
@Nav_ID int
as
begin
select COUNT(*) from View_learn where �û����=@User_ID and ��ǩ=@Nav_ID 
end
exec PR_Learn @User��ID=2,@Nav_ID=1
--�����û�ID����ǩ����������ղء��Ƽ��������Ƽ�����
create proc PR_ALL
@User_ID int,
@Nav_ID int
as
begin
select �������� from View_All where  �û����=@User_ID and ��ǩ=@Nav_ID group by �������� 
end
exec PR_ALL @User��ID=3,@Nav_ID=18
select * from View_All
--����д��UserAll�Ĵ洢����
create proc PR_UserAry
@User_ID int,
@Nav_ID int,
@Ary_Sco int
as
begin
insert into UserAry values(@User_ID,@Nav_ID,@Ary_Sco)
end
--����д��NewAry�Ĵ洢����
create proc PR_NewAry
@User_ID int,
@Nav_ID int,
@Ary_Sco float
as
begin
insert into NewAry values(@User_ID,@Nav_ID,@Ary_Sco)
end
--��������UserAll������Ϣ�Ĵ洢����
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


select �û���� from View_learn group by �û����
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
select * from View_All where �û����=1007
select * from UserAry where UserAry.User_ID=5 and UserAry.Ary_Sco!=5 and UserAry.Ary_Sco!=0
select * from View_All where �û����=5
select * from UserAry order by UserAry.User_ID,UserAry.
select * from NewAry
