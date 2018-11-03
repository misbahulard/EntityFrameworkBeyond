
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/03/2018 15:17:38
-- Generated from EDMX file: c:\users\misbahul ardani\source\repos\Entity6_9\Entity6_9\Model1.edmx
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


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Toys'
CREATE TABLE [dbo].[Toys] (
    [ToyId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL,
    [Price] decimal(18,0)  NULL
);
GO

-- Creating table 'Toys_RefurbishedToy'
CREATE TABLE [dbo].[Toys_RefurbishedToy] (
    [Quality] nvarchar(max)  NULL,
    [ToyId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [ToyId] in table 'Toys'
ALTER TABLE [dbo].[Toys]
ADD CONSTRAINT [PK_Toys]
    PRIMARY KEY CLUSTERED ([ToyId] ASC);
GO

-- Creating primary key on [ToyId] in table 'Toys_RefurbishedToy'
ALTER TABLE [dbo].[Toys_RefurbishedToy]
ADD CONSTRAINT [PK_Toys_RefurbishedToy]
    PRIMARY KEY CLUSTERED ([ToyId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ToyId] in table 'Toys_RefurbishedToy'
ALTER TABLE [dbo].[Toys_RefurbishedToy]
ADD CONSTRAINT [FK_RefurbishedToy_inherits_Toy]
    FOREIGN KEY ([ToyId])
    REFERENCES [dbo].[Toys]
        ([ToyId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------