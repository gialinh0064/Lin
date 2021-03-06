
USE master
GO

CREATE DATABASE A
GO

--DROP DATABASE A
--GO

USE A
GO
----CREATE TABLE NHA CUNG CAP----

CREATE TABLE [dbo].[NCC]
(
	[MaNCC] [nvarchar](10) NOT NULL, 
	[TenNCC] [nvarchar](50)  NULL,
	[DiaChi] [nvarchar](50) NULL,
	[SDT] [nvarchar](10) NULL,
	[Fax] [nvarchar](50)  NULL,
    CONSTRAINT [PK_NCC] PRIMARY KEY CLUSTERED 
(
	[MaNCC] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC1',N'Bia Bến thành',N'34 HCM',10000,2)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC2',N'Vinamilk',N'160 Q.Thủ Đức,HCM',11000,32)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC3',N'ChiBiCo',N'161B Q.Thủ Đức,HCM',13000,32)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC4',N'Unilever',N'161B Q.Hòan Kiếm,HaNoi',14000,32)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC5',N'Pepsi',N'150B Q.Hòan Kiếm,HaNoi',15000,32)
INSERT INTO NCC([MaNCC],[TenNCC],[DiaChi],[SDT],[Fax])
    VALUES ('NCC6',N'Simply',N'530A Q.Hòan Kiếm,HaNoi',16000,32)    
    GO
    
    select*
    from NCC
    go
    
----------------Create table Nhanvien---------------


CREATE TABLE [dbo].[Nhanvien](
	[MaNV] [nvarchar] (10) NOT NULL,
	[HoNV] [nvarchar](50) NULL,
	[Ten] [nvarchar](50) NULL,
	[QueQuan] [nvarchar] (50) NULL,
	[SDT] [nvarchar] (50) NULL,
	
CONSTRAINT [PK_Nhanvien] PRIMARY KEY CLUSTERED 
(
	[MaNV] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[QueQuan],[SDT])
    VALUES ('NV01',N'Nguy?n Văn',N'An',N'Hà Tiên',N'1064425301')
INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[QueQuan],[SDT])
    VALUES ('NV02',N'lê Văn',N'Hằng',N'Kiên Giang',N'1064435201')
INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[QueQuan],[SDT])
    VALUES ('NV03',N'Phạm Thị Nữ',N'Như',N'TP.Hồ Chí Minh',N'1064524301')
INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[QueQuan],[SDT])
    VALUES ('NV04',N'Trương Văn Minh',N'Nhật',N'TP.Hồ Chí Minh',N'1064402531')
INSERT INTO Nhanvien ([MaNV],[HoNV],[Ten],[QueQuan],[SDT])
    VALUES ('NV05',N'Lý Văn Minh',N'Nguyệt',N'Vũng Tàu',N'1064425301')

select*
from Nhanvien
go


------------CREATE TABLE LoaiHH------------------


CREATE TABLE [dbo].[LoaiHH](
	[MaLoaiHH] [int] NOT NULL,
	[TenLoaiHH] [nvarchar](255) NULL,
	[Mota] [nvarchar] (255) NULL,
 CONSTRAINT [PK_LoaiHH] PRIMARY KEY CLUSTERED 
(
	[MaLoaiHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
Go
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH],[Mota])VALUES(1, N'Rượu',N'Rượu Vang Đà Lạt,Rượu vang trắng Chardonnay,Pinot Girs,Rượu vang đỏ Merlot')
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH],[Mota])VALUES(2, N'Bia',N'Bia 33,Bia Tiger,Helineken,Hà Nội,..')
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH],[Mota])VALUES(3, N'Nước ngọt',N'CoCa CoLa,7up,Pepsi,...')
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH],[Mota])VALUES(4, N'Dầu Ăn',N'Simly,Tường An,Mezizan,Nepture')
INSERT INTO LoaiHH([MaLoaiHH],[TenLoaiHH],[Mota])VALUES(5, N'Sữa',N'Ovaltine,Vinamilk socola,TH True Milk ,Fristi trái cây')


--select*
--from LoaiHH
--go

-----------CREATE TABLE Hang hoa------------

CREATE TABLE [dbo].[HangHoa](
	[MaHH] [nvarchar](10) NOT NULL,
	[TenHH] [nvarchar](50) NULL,
	[Donvitinh] [nvarchar](8) NULL,
	[Dongia] [int] NULL,
	[MaLoaiHH] [int] NOT NULL,
	
 CONSTRAINT [PK_HangHoa] PRIMARY KEY CLUSTERED 
(--khoa chinh--
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
--=====tao khoa ngoai cho bang SanPhamBH : MaLoaiHH
ALTER TABLE [dbo].[HangHoa]  WITH CHECK ADD  CONSTRAINT [FK_HangHoa_LoaiHH] FOREIGN KEY([MaLoaiHH])/*khoa ngoai*/
REFERENCES [dbo].[LoaiHH] ([MaLoaiHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[HangHoa] CHECK CONSTRAINT [FK_HangHoa_LoaiHH]
GO 



INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])VALUES(01,N'Rượu Nho',N'VNĐ',N'10000',N'1')
INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])VALUES(02,N'Bia 33',N'VNĐ',N'8000',N'2')
INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])VALUES(03,N'Cocacola',N'VNĐ',N'9000',N'3')
INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])VALUES(04,N'Simply',N'VNĐ',N'80000',N'4')
INSERT INTO HangHoa([MaHH],[TenHH],[Donvitinh],[Dongia],[MaLoaiHH])VALUES(05,N'Ovaltine',N'VNĐ',N'8500',N'5')

select*
from HangHoa
go

---------Create table Phieu Nhap ------


CREATE TABLE [dbo].[PhieuNhap](
	[MaPN] [nvarchar] (10) NOT NULL,
	[NgayNhap] [datetime] NULL,
	[MaNCC] [nvarchar](10) NULL,
	--[TongGiaTri] [float] null,
	[MaNV] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_PhieuNhap] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
--===Khoa ngoai (Phieu Nhap-NCC)==--
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_NCC] FOREIGN KEY([MaNCC])
REFERENCES [dbo].[NCC] ([MaNCC])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_NCC]
GO
--===Khoa ngoai (Phieu Nhap-NV)==--
ALTER TABLE [dbo].[PhieuNhap]  WITH CHECK ADD  CONSTRAINT [FK_PhieuNhap_Nhanvien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PhieuNhap] CHECK CONSTRAINT [FK_PhieuNhap_Nhanvien]
GO

INSERT INTO PhieuNhap([MaPN],[NgayNhap],[MaNCC],[MaNV])VALUES('PN01',N'07/08/2010',N'NCC1',N'NV01')
INSERT INTO PhieuNhap([MaPN],[NgayNhap],[MaNCC],[MaNV])VALUES('PN02',N'08/08/2010',N'NCC2',N'NV02')
INSERT INTO PhieuNhap([MaPN],[NgayNhap],[MaNCC],[MaNV])VALUES('PN03',N'09/08/2010',N'NCC3',N'NV03')
INSERT INTO PhieuNhap([MaPN],[NgayNhap],[MaNCC],[MaNV])VALUES('PN04',N'10/08/2010',N'NCC4',N'NV04')

select *
from PhieuNhap
go
   



------CREATE TABLE CTPN------


CREATE TABLE [dbo].[CTPN](
	[MaPN] [nvarchar] (10) NOT NULL,
	[MaHH] [nvarchar](10) NOT NULL,
	[SoLuongNhap] [int] NULL,
	[DonGia] [int] NULL,	
 CONSTRAINT [PK_CTPN] PRIMARY KEY CLUSTERED 
(
	[MaPN] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_PhieuNhap] FOREIGN KEY([MaPN])
REFERENCES [dbo].[PhieuNhap] ([MaPN])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_PhieuNhap]
GO

ALTER TABLE [dbo].[CTPN]  WITH CHECK ADD  CONSTRAINT [FK_CTPN_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPN] CHECK CONSTRAINT [FK_CTPN_HangHoa]
GO
   
INSERT INTO CTPN([MaPN],[MaHH],[SoLuongNhap],[DonGia])VALUES('PN01',N'01',N'5',N'7000')
INSERT INTO CTPN([MaPN],[MaHH],[SoLuongNhap],[DonGia])VALUES('PN02',N'02',N'8',N'9000')
INSERT INTO CTPN([MaPN],[MaHH],[SoLuongNhap],[DonGia])VALUES('PN03',N'03',N'6',N'8000')
INSERT INTO CTPN([MaPN],[MaHH],[SoLuongNhap],[DonGia])VALUES('PN04',N'04',N'10',N'6000')

--=======CREATE TABLE PHIEU XUAT======--


CREATE TABLE [dbo].[PhieuXuat](
	[MaPX] [nvarchar] (10) NOT NULL,
	[NgayXuat] [datetime] NULL,
	--[TongGiaTri] [nvarchar](50) NULL,
	[MaNV] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_PhieuXuat] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--===Khoa ngoai (Phieu Xuat-NV)==--
ALTER TABLE [dbo].[PhieuXuat]  WITH CHECK ADD  CONSTRAINT [FK_PhieuXuat_Nhanvien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[PhieuXuat] CHECK CONSTRAINT [FK_PhieuXuat_Nhanvien]
GO

INSERT INTO PhieuXuat([MaPX],[NgayXuat],[MaNV])VALUES('PX01',N'07/08/2010',N'NV01')
INSERT INTO PhieuXuat([MaPX],[NgayXuat],[MaNV])VALUES('PX02',N'08/08/2010',N'NV02')
INSERT INTO PhieuXuat([MaPX],[NgayXuat],[MaNV])VALUES('PX03',N'09/08/2010',N'NV03')
INSERT INTO PhieuXuat([MaPX],[NgayXuat],[MaNV])VALUES('PX04',N'10/08/2010',N'NV04')
INSERT INTO PhieuXuat([MaPX],[NgayXuat],[MaNV])VALUES('PX05',N'11/08/2010',N'NV05')
----CREATE TABLE CTPX---


CREATE TABLE [dbo].[CTPX](
	[MaPX] [nvarchar] (10) NOT NULL,
	[MaHH] [nvarchar](10) NOT NULL,
	[SoLuongXuat] [int] NULL,
	[DonGia] [int] NULL,
 CONSTRAINT [PK_CTPX] PRIMARY KEY CLUSTERED 
(
	[MaPX] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[CTPX]  WITH CHECK ADD  CONSTRAINT [FK_CTPX_PhieuXuat] FOREIGN KEY([MaPX])
REFERENCES [dbo].[PhieuXuat] ([MaPX])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_PhieuXuat]
GO

ALTER TABLE [dbo].[CTPX]  WITH CHECK ADD  CONSTRAINT [FK_CTPX_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPX] CHECK CONSTRAINT [FK_CTPX_HangHoa]
GO

INSERT INTO CTPX([MaPX],[MaHH],[SoLuongXuat],[Dongia])VALUES('PX01',N'01',N'6',N'10000')
INSERT INTO CTPX([MaPX],[MaHH],[SoLuongXuat],[Dongia])VALUES('PX02',N'02',N'8',N'8000')
INSERT INTO CTPX([MaPX],[MaHH],[SoLuongXuat],[Dongia])VALUES('PX03',N'03',N'5',N'9000')
INSERT INTO CTPX([MaPX],[MaHH],[SoLuongXuat],[Dongia])VALUES('PX04',N'04',N'10',N'80000')
INSERT INTO CTPX([MaPX],[MaHH],[SoLuongXuat],[Dongia])VALUES('PX05',N'05',N'8',N'8500')

-----------CREATE TABLE Hoa Don------------------


CREATE TABLE [dbo].[HoaDon](
	[MaHD] [nvarchar](10) NOT NULL,
	[MaNV] [nvarchar] (10) NULL,
	[NgayLapHD] [datetime] NOT NULL,
 CONSTRAINT [PK_HoaDon] PRIMARY KEY CLUSTERED 
(
	[MaHD] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[HoaDon]  WITH CHECK ADD  CONSTRAINT [FK_HoaDon_Nhanvien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[HoaDon] CHECK CONSTRAINT [FK_HoaDon_Nhanvien]
GO

INSERT INTO HoaDon([MaHD],[MaNV],[NgayLapHD])VALUES('HD01',N'NV01',N'07/08/2010')
INSERT INTO HoaDon([MaHD],[MaNV],[NgayLapHD])VALUES('HD02',N'NV02',N'08/08/2010')
INSERT INTO HoaDon([MaHD],[MaNV],[NgayLapHD])VALUES('HD03',N'NV03',N'09/08/2010')
INSERT INTO HoaDon([MaHD],[MaNV],[NgayLapHD])VALUES('HD04',N'NV04',N'10/08/2010')
INSERT INTO HoaDon([MaHD],[MaNV],[NgayLapHD])VALUES('HD05',N'NV05',N'11/08/2010')

-----------CREATE TABLE CTHD--------------

CREATE TABLE [dbo].[CTHD](
	[MaHD] [nvarchar](10) NOT NULL,
	[MaHH] [nvarchar](10) NOT NULL,
	[Soluong] [int] NULL,
	[Giamgia] [real] NULL,
 CONSTRAINT [PK_CTHD] PRIMARY KEY CLUSTERED 
(
--2 khoa chinh MaDH,MaSP ;xep thu tu A-Z
	[MaHD] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

--==tao khoa ngoai cho bang CTHD : MaHD==--
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HoaDon] FOREIGN KEY([MaHD])
REFERENCES [dbo].[HoaDon] ([MaHD])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HoaDon]
GO

--==tao khoa ngoai cho bang CTHD : MaHH==--
ALTER TABLE [dbo].[CTHD]  WITH CHECK ADD  CONSTRAINT [FK_CTHD_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTHD] CHECK CONSTRAINT [FK_CTHD_HangHoa]
GO

INSERT INTO CTHD([MaHD],[MaHH],[Soluong],[Giamgia])VALUES('HD01',N'01',N'3',N'10%')
INSERT INTO CTHD([MaHD],[MaHH],[Soluong],[Giamgia])VALUES('HD02',N'02',N'4',N'3%')
INSERT INTO CTHD([MaHD],[MaHH],[Soluong],[Giamgia])VALUES('HD03',N'03',N'5',N'5%')
INSERT INTO CTHD([MaHD],[MaHH],[Soluong],[Giamgia])VALUES('HD04',N'04',N'3',N'4%')
INSERT INTO CTHD([MaHD],[MaHH],[Soluong],[Giamgia])VALUES('HD05',N'05',N'3',N'8%')
------CREATE TABLE PHIEU KIEM KE


CREATE TABLE [dbo].[PhieuKK](
	[MaKK] [nvarchar] (10) NOT NULL,
	[NgayKK] [datetime] NULL,
	[TongGiaTri] [nvarchar](50) NULL,
	[MaNV] [nvarchar](10) NOT NULL,
 CONSTRAINT [PK_PhieuKK] PRIMARY KEY CLUSTERED 
(
	[MaKK] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

--===Khoa ngoai (Phieu Xuat-NV)==--
ALTER TABLE [dbo].[PhieuKK]  WITH CHECK ADD  CONSTRAINT [FK_PhieuKK_Nhanvien] FOREIGN KEY([MaNV])
REFERENCES [dbo].[Nhanvien] ([MaNV])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

INSERT INTO PhieuKK([MaKK],[NgayKK],[TongGiaTri],[MaNV])VALUES('KK01',N'07/08/2010',N'10',N'NV01')
INSERT INTO PhieuKK([MaKK],[NgayKK],[TongGiaTri],[MaNV])VALUES('KK02',N'09/08/2010',N'8',N'NV02')
INSERT INTO PhieuKK([MaKK],[NgayKK],[TongGiaTri],[MaNV])VALUES('KK03',N'10/08/2010',N'5',N'NV03')


----===CREATE TABLE CTPKK==----

CREATE TABLE [dbo].[CTPKK](
	[MaKK] [nvarchar](10) NOT NULL,
	[MaHH] [nvarchar](10) NOT NULL,
	[Soluong] [smallint] NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_CTPKK] PRIMARY KEY CLUSTERED 
(
	[MaKK] ASC,
	[MaHH] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[CTPKK]  WITH CHECK ADD  CONSTRAINT [FK_CTPKK_PhieuKK] FOREIGN KEY([MaKK])
REFERENCES [dbo].[PhieuKK] ([MaKK])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPKK] CHECK CONSTRAINT [FK_CTPKK_PhieuKK]
GO

ALTER TABLE [dbo].[CTPKK]  WITH CHECK ADD  CONSTRAINT [FK_CTPKK_HangHoa] FOREIGN KEY([MaHH])
REFERENCES [dbo].[HangHoa] ([MaHH])
ON UPDATE CASCADE
ON DELETE CASCADE
GO

ALTER TABLE [dbo].[CTPKK] CHECK CONSTRAINT [FK_CTPKK_HangHoa]
GO

INSERT INTO CTPKK([MaKK],[MaHH],[Soluong],[TinhTrang])VALUES('KK05',N'01',N'10',N'Còn Hàng')
INSERT INTO CTPKK([MaKK],[MaHH],[Soluong],[TinhTrang])VALUES('KK05',N'01',N'8',N'Còn Hàng')
INSERT INTO CTPKK([MaKK],[MaHH],[Soluong],[TinhTrang])VALUES('KK05',N'01',N'5',N'Hết Hàng')