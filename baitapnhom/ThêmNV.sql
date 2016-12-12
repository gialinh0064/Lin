USE A
Go

IF OBJECT_ID('uspInsertEmployee','p') IS NOT NULL
	DROP PROCEDURE UspInsertEmployee;
GO
CREATE PROC uspInsertEmployee
	@MaNV nvarchar(10),
    @HoNV nvarchar(50),
    @Ten nvarchar(50),
    @SDT nvarchar(50),
    @QueQuan nvarchar(50)
    
AS

	INSERT INTO Nhanvien(MaNV,HoNV,Ten,SDT,QueQuan) VALUES(@MaNV,@HoNV,@Ten,@SDT,@QueQuan)

GO

EXEC uspInsertEmployee N'NV06',N'Nguyen',N'Anh','(08)876543',N'TPHCM'