/**Rename SA Account**/

USE master;
GO
ALTER LOGIN [sa] WITH NAME = xsa;
GO


/** Rename SQL Server **/
sp_dropserver '[old_name\instancename]';  
GO  
sp_addserver '[new_name\instancename]', local;  
GO  
/** Restart SQL Services, validate change **/
SELECT @@SERVERNAME AS 'Server Name';
