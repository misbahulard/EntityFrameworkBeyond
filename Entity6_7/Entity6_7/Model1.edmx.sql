
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/03/2018 14:42:31
-- Generated from EDMX file: C:\Users\Misbahul Ardani\source\repos\Entity6_7\Entity6_7\Model1.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Database1];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Instructor_inherits_Staff]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Staffs_Instructor] DROP CONSTRAINT [FK_Instructor_inherits_Staff];
GO
IF OBJECT_ID(N'[dbo].[FK_Principal_inherits_Staff]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Staffs_Principal] DROP CONSTRAINT [FK_Principal_inherits_Staff];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Staffs]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Staffs];
GO
IF OBJECT_ID(N'[dbo].[Staffs_Instructor]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Staffs_Instructor];
GO
IF OBJECT_ID(N'[dbo].[Staffs_Principal]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Staffs_Principal];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Staffs'
CREATE TABLE [dbo].[Staffs] (
    [StaffId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Staffs_Instructor'
CREATE TABLE [dbo].[Staffs_Instructor] (
    [InstructorId] int IDENTITY(1,1) NOT NULL,
    [Salary] decimal(18,0)  NULL,
    [StaffId] int  NOT NULL
);
GO

-- Creating table 'Staffs_Principal'
CREATE TABLE [dbo].[Staffs_Principal] (
    [PrincipalId] int IDENTITY(1,1) NOT NULL,
    [Salary] decimal(18,0)  NULL,
    [Bonus] decimal(18,0)  NULL,
    [StaffId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [StaffId] in table 'Staffs'
ALTER TABLE [dbo].[Staffs]
ADD CONSTRAINT [PK_Staffs]
    PRIMARY KEY CLUSTERED ([StaffId] ASC);
GO

-- Creating primary key on [StaffId] in table 'Staffs_Instructor'
ALTER TABLE [dbo].[Staffs_Instructor]
ADD CONSTRAINT [PK_Staffs_Instructor]
    PRIMARY KEY CLUSTERED ([StaffId] ASC);
GO

-- Creating primary key on [StaffId] in table 'Staffs_Principal'
ALTER TABLE [dbo].[Staffs_Principal]
ADD CONSTRAINT [PK_Staffs_Principal]
    PRIMARY KEY CLUSTERED ([StaffId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [StaffId] in table 'Staffs_Instructor'
ALTER TABLE [dbo].[Staffs_Instructor]
ADD CONSTRAINT [FK_Instructor_inherits_Staff]
    FOREIGN KEY ([StaffId])
    REFERENCES [dbo].[Staffs]
        ([StaffId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [StaffId] in table 'Staffs_Principal'
ALTER TABLE [dbo].[Staffs_Principal]
ADD CONSTRAINT [FK_Principal_inherits_Staff]
    FOREIGN KEY ([StaffId])
    REFERENCES [dbo].[Staffs]
        ([StaffId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------