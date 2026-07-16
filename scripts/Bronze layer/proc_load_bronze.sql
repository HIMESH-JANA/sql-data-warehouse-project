/*

Store Procrdure : load bronze layer

Script Purpose: this script loads the data from souec(csv files) into the Bronze schema.
			also,
				-truncates the already existing tables
				-uses Full load method

parameters : none

*/

CREATE OR ALTER  PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @STARTTIME DATETIME,@ENDTIME DATETIME,@STARTTIMEBATCH DATETIME,@ENDTIMEBATCH DATETIME;

	SET @STARTTIMEBATCH=GETDATE();

	PRINT('------------------');
	PRINT('LOADING CRM TABLES');
	PRINT('------------------');

	SET @STARTTIME=GETDATE();
		TRUNCATE TABLE bronze.crm_cust_info;
		BULK INSERT bronze.crm_cust_info
		FROM 'C:\Users\himes\Downloads\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
			);
	SET @ENDTIME=GETDATE();
	PRINT('LOAD DURATION: '+CAST(DATEDIFF(SECOND,@STARTTIME,@ENDTIME) AS VARCHAR)+'SECONDS');

	SET @STARTTIME=GETDATE();
		TRUNCATE TABLE bronze.crm_prd_info;
		BULK INSERT bronze.crm_prd_info
		FROM 'C:\Users\himes\Downloads\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
			);
	SET @ENDTIME=GETDATE();
	PRINT('LOAD DURATION: '+CAST(DATEDIFF(SECOND,@STARTTIME,@ENDTIME) AS VARCHAR)+'SECONDS');

	SET @STARTTIME=GETDATE();
		TRUNCATE TABLE bronze.crm_sales_details;
		BULK INSERT bronze.crm_sales_details
		FROM 'C:\Users\himes\Downloads\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
			);
	SET @ENDTIME=GETDATE();
	PRINT('LOAD DURATION: '+CAST(DATEDIFF(SECOND,@STARTTIME,@ENDTIME) AS VARCHAR)+'SECONDS');

	PRINT('------------------');
	PRINT('LOADING ERP TABLES');
	PRINT('------------------');

	SET @STARTTIME=GETDATE();
		TRUNCATE TABLE bronze.erp_cust_az12;
		BULK INSERT bronze.erp_cust_az12
		FROM 'C:\Users\himes\Downloads\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
			);
	SET @ENDTIME=GETDATE();
	PRINT('LOAD DURATION: '+CAST(DATEDIFF(SECOND,@STARTTIME,@ENDTIME) AS VARCHAR)+'SECONDS');

	SET @STARTTIME=GETDATE();
		TRUNCATE TABLE bronze.erp_loc_a101;
		BULK INSERT bronze.erp_loc_a101
		FROM 'C:\Users\himes\Downloads\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
			);
	SET @ENDTIME=GETDATE();
	PRINT('LOAD DURATION: '+CAST(DATEDIFF(SECOND,@STARTTIME,@ENDTIME) AS VARCHAR)+'SECONDS');

	SET @STARTTIME=GETDATE();
		TRUNCATE TABLE bronze.erp_px_cat_g1v2;
		BULK INSERT bronze.erp_px_cat_g1v2
		FROM 'C:\Users\himes\Downloads\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH(
			FIRSTROW=2,
			FIELDTERMINATOR=',',
			TABLOCK
			);
	SET @ENDTIME=GETDATE();
	PRINT('LOAD DURATION: '+CAST(DATEDIFF(SECOND,@STARTTIME,@ENDTIME) AS VARCHAR)+'SECONDS');

	SET @ENDTIMEBATCH=GETDATE();
	PRINT('LOAD DURATION FOR THIS BATCH: '+CAST(DATEDIFF(SECOND,@STARTTIMEBATCH,@ENDTIMEBATCH) AS VARCHAR)+'SECONDS');
END
