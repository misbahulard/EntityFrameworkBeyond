
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 11/03/2018 13:40:54
-- Generated from EDMX file: c:\users\misbahul ardani\source\repos\Entity6_1\Entity6_1\Model1.edmx
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

IF OBJECT_ID(N'[dbo].[FK_EventOrganizer_Event]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventOrganizer] DROP CONSTRAINT [FK_EventOrganizer_Event];
GO
IF OBJECT_ID(N'[dbo].[FK_EventOrganizer_Organizer]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[EventOrganizer] DROP CONSTRAINT [FK_EventOrganizer_Organizer];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Events]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Events];
GO
IF OBJECT_ID(N'[dbo].[Organizers]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Organizers];
GO
IF OBJECT_ID(N'[dbo].[EventOrganizer]', 'U') IS NOT NULL
    DROP TABLE [dbo].[EventOrganizer];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Events'
CREATE TABLE [dbo].[Events] (
    [EventId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Organizers'
CREATE TABLE [dbo].[Organizers] (
    [OrganizerId] int IDENTITY(1,1) NOT NULL,
    [Name] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'EventOrganizer'
CREATE TABLE [dbo].[EventOrganizer] (
    [Events_EventId] int  NOT NULL,
    [Organizers_OrganizerId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [EventId] in table 'Events'
ALTER TABLE [dbo].[Events]
ADD CONSTRAINT [PK_Events]
    PRIMARY KEY CLUSTERED ([EventId] ASC);
GO

-- Creating primary key on [OrganizerId] in table 'Organizers'
ALTER TABLE [dbo].[Organizers]
ADD CONSTRAINT [PK_Organizers]
    PRIMARY KEY CLUSTERED ([OrganizerId] ASC);
GO

-- Creating primary key on [Events_EventId], [Organizers_OrganizerId] in table 'EventOrganizer'
ALTER TABLE [dbo].[EventOrganizer]
ADD CONSTRAINT [PK_EventOrganizer]
    PRIMARY KEY CLUSTERED ([Events_EventId], [Organizers_OrganizerId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [Events_EventId] in table 'EventOrganizer'
ALTER TABLE [dbo].[EventOrganizer]
ADD CONSTRAINT [FK_EventOrganizer_Event]
    FOREIGN KEY ([Events_EventId])
    REFERENCES [dbo].[Events]
        ([EventId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating foreign key on [Organizers_OrganizerId] in table 'EventOrganizer'
ALTER TABLE [dbo].[EventOrganizer]
ADD CONSTRAINT [FK_EventOrganizer_Organizer]
    FOREIGN KEY ([Organizers_OrganizerId])
    REFERENCES [dbo].[Organizers]
        ([OrganizerId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_EventOrganizer_Organizer'
CREATE INDEX [IX_FK_EventOrganizer_Organizer]
ON [dbo].[EventOrganizer]
    ([Organizers_OrganizerId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------