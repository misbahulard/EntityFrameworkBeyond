
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/03/2018 15:55:49
-- Generated from EDMX file: c:\users\misbahul ardani\source\repos\Entity6_12\Entity6_12\Model1.edmx
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

IF OBJECT_ID(N'[dbo].[FK_DealerCar]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cars] DROP CONSTRAINT [FK_DealerCar];
GO
IF OBJECT_ID(N'[dbo].[FK_Toyota_inherits_Car]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cars_Toyota] DROP CONSTRAINT [FK_Toyota_inherits_Car];
GO
IF OBJECT_ID(N'[dbo].[FK_BMW_inherits_Car]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Cars_BMW] DROP CONSTRAINT [FK_BMW_inherits_Car];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Cars]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cars];
GO
IF OBJECT_ID(N'[dbo].[Dealers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Dealers];
GO
IF OBJECT_ID(N'[dbo].[Cars_Toyota]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cars_Toyota];
GO
IF OBJECT_ID(N'[dbo].[Cars_BMW]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Cars_BMW];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Cars'
CREATE TABLE [dbo].[Cars] (
    [CarId] int IDENTITY(1,1) NOT NULL,
    [Model] nvarchar(max)  NOT NULL,
    [Year] int  NOT NULL,
    [Color] nvarchar(max)  NOT NULL,
    [Dealer_DealerId] int  NOT NULL
);
GO

-- Creating table 'Dealers'
CREATE TABLE [dbo].[Dealers] (
    [DealerId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Cars_Toyota'
CREATE TABLE [dbo].[Cars_Toyota] (
    [CarId] int  NOT NULL
);
GO

-- Creating table 'Cars_BMW'
CREATE TABLE [dbo].[Cars_BMW] (
    [CollisionAvoidance] bit  NOT NULL,
    [CarId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [CarId] in table 'Cars'
ALTER TABLE [dbo].[Cars]
ADD CONSTRAINT [PK_Cars]
    PRIMARY KEY CLUSTERED ([CarId] ASC);
GO

-- Creating primary key on [DealerId] in table 'Dealers'
ALTER TABLE [dbo].[Dealers]
ADD CONSTRAINT [PK_Dealers]
    PRIMARY KEY CLUSTERED ([DealerId] ASC);
GO

-- Creating primary key on [CarId] in table 'Cars_Toyota'
ALTER TABLE [dbo].[Cars_Toyota]
ADD CONSTRAINT [PK_Cars_Toyota]
    PRIMARY KEY CLUSTERED ([CarId] ASC);
GO

-- Creating primary key on [CarId] in table 'Cars_BMW'
ALTER TABLE [dbo].[Cars_BMW]
ADD CONSTRAINT [PK_Cars_BMW]
    PRIMARY KEY CLUSTERED ([CarId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Dealer_DealerId] in table 'Cars'
ALTER TABLE [dbo].[Cars]
ADD CONSTRAINT [FK_DealerCar]
    FOREIGN KEY ([Dealer_DealerId])
    REFERENCES [dbo].[Dealers]
        ([DealerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_DealerCar'
CREATE INDEX [IX_FK_DealerCar]
ON [dbo].[Cars]
    ([Dealer_DealerId]);
GO

-- Creating foreign key on [CarId] in table 'Cars_Toyota'
ALTER TABLE [dbo].[Cars_Toyota]
ADD CONSTRAINT [FK_Toyota_inherits_Car]
    FOREIGN KEY ([CarId])
    REFERENCES [dbo].[Cars]
        ([CarId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- Creating foreign key on [CarId] in table 'Cars_BMW'
ALTER TABLE [dbo].[Cars_BMW]
ADD CONSTRAINT [FK_BMW_inherits_Car]
    FOREIGN KEY ([CarId])
    REFERENCES [dbo].[Cars]
        ([CarId])
    ON DELETE CASCADE ON UPDATE NO ACTION;
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------