CREATE DATABASE SimpleList
GO
       
USE SimpleList
GO

create table Podcast (
 id uniqueidentifier primary key default newid(),
 Title varchar(100) not null
)
GO

insert into Podcast (Title)
values ('.NET EP 01'),
       ('LINQ - DO and Donts'),
       ('SQL - Server 101'),
       ('Docker 101')

    
       