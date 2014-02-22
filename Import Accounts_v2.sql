USE [msdb]
GO

/****** Object:  Job [Import Accounts]    Script Date: 02/04/2014 15:10:20 ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [Database Maintenance]    Script Date: 02/04/2014 15:10:21 ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'Database Maintenance' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'Database Maintenance'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'Import Accounts', 
		@enabled=1, 
		@notify_level_eventlog=0, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'Import Accounts from a CSV file to database.', 
		@category_name=N'Database Maintenance', 
		@owner_login_name=N'EDP_WINDOWS8\Ed Pacson', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Create Temporary Table]    Script Date: 02/04/2014 15:10:21 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Create Temporary Table', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'CREATE TABLE CSVTable (AccountID INTEGER, UserType NVARCHAR (50), 
Lname NVARCHAR (50), Fname NVARCHAR (50), Mname NVARCHAR (50), 
Address NVARCHAR (100), Gender NVARCHAR (10), Birthdate DATE,
ContactNo NVARCHAR (50), Email NVARCHAR (50), Password NVARCHAR(30), EPurseBalance FLOAT, AccountStatus NVARCHAR (50))', 
		@database_name=N'LMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Import CSV File]    Script Date: 02/04/2014 15:10:21 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Import CSV File', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'BULK INSERT CSVTable
	FROM ''D:\exceloutp.txt''
	WITH
	(
		FIELDTERMINATOR = '','',
		ROWTERMINATOR = ''\n''
	)
GO', 
		@database_name=N'LMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Insert Data to Destination Table]    Script Date: 02/04/2014 15:10:21 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Insert Data to Destination Table', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'INSERT INTO tblAccount
SELECT CSVTable.AccountID,
		CSVTable.UserType,
		CSVTable.Lname,
		CSVTable.Fname,
		CSVTable.Mname,
		CSVTable.Address,
		CSVTable.Gender,
		CSVTable.Birthdate,
		CSVTable.ContactNo,
		CSVTable.Email,
		CSVTable.Password,
		CSVTable.EPurseBalance,
		CSVTable.AccountStatus
FROM CSVTable
       LEFT JOIN tblAccount 
         ON CSVTable.AccountID = tblAccount.AccountID
WHERE tblAccount.AccountID  IS NULL', 
		@database_name=N'LMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Validate Data]    Script Date: 02/04/2014 15:10:21 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Validate Data', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'SELECT * FROM tblAccount
SELECT * FROM CSVTable', 
		@database_name=N'LMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [Drop Temporary Table]    Script Date: 02/04/2014 15:10:21 ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'Drop Temporary Table', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'DROP TABLE CSVTable', 
		@database_name=N'LMS', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:

GO

