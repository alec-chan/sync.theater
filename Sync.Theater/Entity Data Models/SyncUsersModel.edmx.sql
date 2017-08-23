
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 08/23/2017 01:27:09
-- Generated from EDMX file: C:\Users\Alec\Sync.Theater\Sync.Theater\Entity Data Models\SyncUsersModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [sync-theater-users];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_UserQueue]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Queues] DROP CONSTRAINT [FK_UserQueue];
GO
IF OBJECT_ID(N'[dbo].[FK_QueueQueueItem]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[QueueItems] DROP CONSTRAINT [FK_QueueQueueItem];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Users]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Users];
GO
IF OBJECT_ID(N'[dbo].[Queues]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Queues];
GO
IF OBJECT_ID(N'[dbo].[QueueItems]', 'U') IS NOT NULL
    DROP TABLE [dbo].[QueueItems];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Username] nvarchar(max)  NOT NULL,
    [PasswordHash] nvarchar(max)  NOT NULL,
    [Email] nvarchar(max)  NOT NULL,
    [CustomRoomCode] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Queues'
CREATE TABLE [dbo].[Queues] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [QueueName] nvarchar(max)  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'QueueItems'
CREATE TABLE [dbo].[QueueItems] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [QueueId] int  NOT NULL,
    [URL] nvarchar(max)  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Queues'
ALTER TABLE [dbo].[Queues]
ADD CONSTRAINT [PK_Queues]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'QueueItems'
ALTER TABLE [dbo].[QueueItems]
ADD CONSTRAINT [PK_QueueItems]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [UserId] in table 'Queues'
ALTER TABLE [dbo].[Queues]
ADD CONSTRAINT [FK_UserQueue]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserQueue'
CREATE INDEX [IX_FK_UserQueue]
ON [dbo].[Queues]
    ([UserId]);
GO

-- Creating foreign key on [QueueId] in table 'QueueItems'
ALTER TABLE [dbo].[QueueItems]
ADD CONSTRAINT [FK_QueueQueueItem]
    FOREIGN KEY ([QueueId])
    REFERENCES [dbo].[Queues]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_QueueQueueItem'
CREATE INDEX [IX_FK_QueueQueueItem]
ON [dbo].[QueueItems]
    ([QueueId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------