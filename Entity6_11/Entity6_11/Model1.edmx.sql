
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/03/2018 15:46:10
-- Generated from EDMX file: c:\users\misbahul ardani\source\repos\Entity6_11\Entity6_11\Model1.edmx
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

IF OBJECT_ID(N'[dbo].[FK_Team_inherits_Member]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Members_Team] DROP CONSTRAINT [FK_Team_inherits_Member];
GO
IF OBJECT_ID(N'[dbo].[FK_Adult_inherits_Member]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Members_Adult] DROP CONSTRAINT [FK_Adult_inherits_Member];
GO
IF OBJECT_ID(N'[dbo].[FK_Senior_inherits_Member]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Members_Senior] DROP CONSTRAINT [FK_Senior_inherits_Member];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Members]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members];
GO
IF OBJECT_ID(N'[dbo].[Members_Team]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members_Team];
GO
IF OBJECT_ID(N'[dbo].[Members_Adult]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members_Adult];
GO
IF OBJECT_ID(N'[dbo].[Members_Senior]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Members_Senior];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Members'
CREATE TABLE [dbo].[Members] (
    [MemberId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Phone] nvarchar(max)  NOT NULL,
    [Age] int  NOT NULL
);
GO

-- Creating table 'Members_Teen'
CREATE TABLE [dbo].[Members_Teen] (
    [MemberId] int  NOT NULL
);
GO

-- Creating table 'Members_Adult'
CREATE TABLE [dbo].[Members_Adult] (
    [MemberId] int  NOT NULL
);
GO

-- Creating table 'Members_Senior'
CREATE TABLE [dbo].[Members_Senior] (
    [MemberId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [MemberId] in table 'Members'
ALTER TABLE [dbo].[Members]
ADD CONSTRAINT [PK_Members]
    PRIMARY KEY CLUSTERED ([MemberId] ASC);
GO

-- Creating primary key on [MemberId] in table 'Members_Teen'
ALTER TABLE [dbo].[Members_Teen]
ADD CONSTRAINT [PK_Members_Teen]
    PRIMARY KEY CLUSTERED ([MemberId] ASC);
GO

-- Creating primary key on [MemberId] in table 'Members_Adult'
ALTER TABLE [dbo].[Members_Adult]
ADD CONSTRAINT [PK_Members_Adult]
    PRIMARY KEY CLUSTERED ([MemberId] ASC);
GO

-- Creating primary key on [MemberId] in table 'Members_Senior'
ALTER TABLE [dbo].[Members_Senior]
ADD CONSTRAINT [PK_Members_Senior]
    PRIMARY KEY CLUSTERED ([MemberId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [MemberId] in table 'Members_Teen'
ALTER TABLE [dbo].[Members_Teen]
ADD CONSTRAINT [FK_Teen_inherits_Member]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[Members]
        ([MemberId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MemberId] in table 'Members_Adult'
ALTER TABLE [dbo].[Members_Adult]
ADD CONSTRAINT [FK_Adult_inherits_Member]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[Members]
        ([MemberId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [MemberId] in table 'Members_Senior'
ALTER TABLE [dbo].[Members_Senior]
ADD CONSTRAINT [FK_Senior_inherits_Member]
    FOREIGN KEY ([MemberId])
    REFERENCES [dbo].[Members]
        ([MemberId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------