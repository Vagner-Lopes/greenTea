IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;
GO

BEGIN TRANSACTION;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220106150006_mig-1')
BEGIN
    CREATE TABLE [Categorias] (
        [Id] int NOT NULL IDENTITY,
        [Nome] nvarchar(max) NOT NULL,
        [Cor] nvarchar(max) NOT NULL,
        CONSTRAINT [PK_Categorias] PRIMARY KEY ([Id])
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220106150006_mig-1')
BEGIN
    CREATE TABLE [Tabela] (
        [Id] int NOT NULL IDENTITY,
        [Img] nvarchar(max) NOT NULL,
        [Nome] nvarchar(max) NOT NULL,
        [CategoriaID] int NOT NULL,
        CONSTRAINT [PK_Tabela] PRIMARY KEY ([Id]),
        CONSTRAINT [FK_Tabela_Categorias_CategoriaID] FOREIGN KEY ([CategoriaID]) REFERENCES [Categorias] ([Id]) ON DELETE CASCADE
    );
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220106150006_mig-1')
BEGIN
    CREATE INDEX [IX_Tabela_CategoriaID] ON [Tabela] ([CategoriaID]);
END;
GO

IF NOT EXISTS(SELECT * FROM [__EFMigrationsHistory] WHERE [MigrationId] = N'20220106150006_mig-1')
BEGIN
    INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
    VALUES (N'20220106150006_mig-1', N'5.0.12');
END;
GO

COMMIT;
GO

