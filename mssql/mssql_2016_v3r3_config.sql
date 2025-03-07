/** V-214028 CAT-I:
    The SQL Server default [sa] must be disabled
**/
USE master;
GO
ALTER LOGIN [sa] DISABLE;
GO


/** V-213937 CAT-II:
    SQL Server must allow only the ISSM (or individuals or roles appointed)
    by the ISSM) to select which auditable events are to be audited

    Create a server role specifically for audit maintainers and grant perms
    to maintain audits wo granting unncessary perms
**/
CREATE SERVER ROLE SERVER_AUDIT_MAINTAINERS;
GO
GRANT ALTER ANY SERVER AUDIT TO SERVER_AUDIT_MAINTAINERS;
GO

/** V-213957 CAT-II:
    Access to xp_cmdshell must be disabled unless specifically required and
    approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'xp_cmdshell', 0;
GO
RECONFIGURE;
GO


/** V-213958 CAT-II:
    Access to CLR code must be disabled or restricted, unless specifically
    required and approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'clr enabled', 0;
GO
RECONFIGURE;
GO


/** V-213975 CAT-II:
    SQL Server must prevent unauthorized and unintended information transfer
    via shared system resources
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'common criteria compliance enabled', 1;
GO
RECONFIGURE
GO


/** V-213991 CAT-II:
    SQL Server must maintain a seperate execution domain for each executing process
**/
EXEC sp_configure 'clr enabled', 0
GO
RECONFIGURE;
GO


/** V-21035 CAT-II:
    Ole Automation Procedures feature must be disabled, unless specifically required
    and approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'Ole Automation Procedures', 0
GO
RECONFIGURE;
GO


/** V-214036 CAT-II:
    SQL Server User Options feature must be disabled, unless specifically required and
    approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'user options', 0
GO
RECONFIGURE;
GO


/** V-214037 CAT-II:
    Remote Access feature must be disabled, unless specifically required and approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'remote access', 0
GO
RECONFIGURE;
GO


/** V-214038 CAT-II:
    Hadoop Connectivity feature must be disabled, unless specifically required and
    approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'hadoop connectivity', 0
GO
RECONFIGURE;
GO


/** V-214039 CAT-II:
    Allow Polybase Export feature must be disabled, unless specifically required and
    approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'allow polybase export', 0;
GO
RECONFIGURE;
GO

/** V-214040 CAT-II:
    Remove Data Archive feature must be disabled unless specifically required and
    approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'remote data archive', 0
GO
RECONFIGURE;
GO


/** V-214041 CAT-II:
    SQL Server External Script Enabled feature must be disabled unless specifically
    required and approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'external scripts enabled', 0
GO
RECONFIGURE;
GO


/** V-214043 CAT-II:
    SQL Server Replication Xps feature must be disabled, unless specifically required
    and approved
**/
EXEC sp_configure 'show advanced options', 1;
GO
RECONFIGURE;
GO
EXEC sp_configure 'replication xps', 0;
GO
RECONFIGURE
GO
