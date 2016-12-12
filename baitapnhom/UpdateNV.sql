USE A
Go

IF OBJECT_ID('uspUpdateEmployee','p') IS NOT NULL
	DROP PROCEDURE UspUpdateEmployee;
GO
CREATE PROC uspUpdateEmployee
	@MaNV nvarchar(10),
    @HoNV nvarchar(50),
    @Ten nvarchar(50),
    @SDT nvarchar(50),
    @QueQuan nvarchar(50)
    
AS

	UPDATE Nhanvien SET HoNV=@HoNV,Ten=@Ten,SDT=@SDT,QueQuan=@QueQuan WHERE MaNV=@MaNV

GO

EXEC uspUpdateEmployee N'NV06',N'Lê Văn',N'An',N'0123456',N'TPHCM'