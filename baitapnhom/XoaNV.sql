USE A
Go

IF OBJECT_ID('uspXoaEmployee','p') IS NOT NULL
	DROP PROCEDURE UspXoaEmployee;
GO
CREATE PROC uspXoaEmployee
    @HoNV nvarchar(50),
    @Ten nvarchar(50),
    @SDT nvarchar(50),
    @QueQuan nvarchar(50)
    
AS

	DELETE FROM Nhanvien 
	WHERE HoNV=@HoNV and Ten=@Ten and SDT=@SDT and QueQuan=@QueQuan

GO

EXEC uspXoaEmployee  N'Nguyen',N'Anh',N'(08)876543',N'TPHCM'