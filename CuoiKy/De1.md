
# ĐỀ THI THỰC HÀNH HỆ QUẢN TRỊ CƠ SỞ DỮ LIỆU SQL SERVER

## BỐI CẢNH



<img src="./de1.png" width="100%" alt="Đề thi SQL Server">

Công ty **WOODCRAFT Furniture** là doanh nghiệp chuyên sản xuất và kinh doanh nội thất gỗ cao cấp. Công ty sở hữu:

* Nhiều cửa hàng bán lẻ.
* Nhiều kho lưu trữ sản phẩm.
* Một xưởng sản xuất.
* Hệ thống giao hàng riêng.
* Chương trình khuyến mãi dành cho khách hàng.

Ban giám đốc yêu cầu xây dựng hệ thống cơ sở dữ liệu nhằm quản lý:

* Nhân viên
* Khách hàng
* Sản phẩm
* Nhà cung cấp
* Kho hàng
* Xưởng sản xuất
* Hóa đơn bán hàng
* Giao hàng
* Đổi trả
* Khuyến mãi

---

## SƠ ĐỒ NGHIỆP VỤ

<pre class="overflow-visible! px-0!" data-start="792" data-end="1391"><div class="relative w-full mt-4 mb-1"><div class=""><div class="contents"><div class="relative"><div class="h-full min-h-0 min-w-0"><div class="h-full min-h-0 min-w-0"><div class="border border-token-border-light border-radius-3xl corner-superellipse/1.1 rounded-3xl"><div class="h-full w-full border-radius-3xl bg-(--code-block-surface) corner-superellipse/1.1 overflow-clip rounded-3xl [--code-block-surface:var(--bg-elevated-secondary)] dark:[--code-block-surface:var(--composer-surface-primary)] lxnfua_clipPathFallback"><div class="pointer-events-none absolute end-1.5 top-1 z-2 md:end-2 md:top-1"></div><div class="relative"><div class="pe-11 pt-3"><div class="relative z-0 flex max-w-full"><div id="code-block-viewer" dir="ltr" class="q9tKkq_viewer cm-editor z-10 light:cm-light dark:cm-light flex h-full w-full flex-col items-stretch ͼd ͼr"><div class="cm-scroller"><pre class="cm-content q9tKkq_readonly m-0"><code><span>                     NHÀ CUNG CẤP
                            |
          ----------------------------------
          |                                |
   PHIẾU NHẬP NVL                 PHIẾU NHẬP SẢN PHẨM
          |                                |
          |                                |
     NGUYÊN VẬT LIỆU                  KHO HÀNG
          |
       XƯỞNG
          |
      CÔNG ĐOẠN
          |
      SẢN PHẨM
          |
    DANH MỤC SP
          |
      CỬA HÀNG
          |
      HÓA ĐƠN
          |
      KHÁCH HÀNG
          |
     GIAO HÀNG
          |
      XE GIAO</span></code></pre></div></div></div></div></div></div></div></div></div><div class=""><div class=""></div></div></div></div></div></div></pre>

---

# CÂU 1 (2 ĐIỂM)

## Thiết kế cơ sở dữ liệu

Cho các thực thể sau:

### NhanVien

| Thuộc tính   |
| -------------- |
| MaNV (PK)      |
| TenNV          |
| NgaySinh       |
| GioiTinh       |
| CCCD           |
| SDT            |
| Email          |
| MaChucVu (FK)  |
| MaCuaHang (FK) |
| MaXuong (FK)   |

### ChucVu

| Thuộc tính  |
| ------------- |
| MaChucVu (PK) |
| TenChucVu     |

### KhachHang

| Thuộc tính |
| ------------ |
| MaKH (PK)    |
| TenKH        |
| SDT          |
| DiaChi       |
| Email        |

### SanPham

| Thuộc tính     |
| ---------------- |
| MaSP (PK)        |
| TenSP            |
| GiaSP            |
| MauSac           |
| KichThuoc        |
| MaDanhMucSP (FK) |
| MaKho (FK)       |
| MaKhuyenMai (FK) |
| MaCuaHang (FK)   |

### NhaCungCap

| Thuộc tính |
| ------------ |
| MaNCC (PK)   |
| TenNCC       |
| SDT          |
| Email        |
| DiaChi       |

### DanhMucSanPham

| Thuộc tính     |
| ---------------- |
| MaDanhMucSP (PK) |
| TenDanhMucSP     |
| SoLuong          |

### Kho

| Thuộc tính |
| ------------ |
| MaKho (PK)   |
| DiaChiKho    |
| SoLuong      |

### HoaDon

| Thuộc tính      |
| ----------------- |
| MaHoaDon (PK)     |
| MaKH (FK)         |
| MaNV (FK)         |
| MaVanDon (FK)     |
| SoTien            |
| NgayLap           |
| HinhThucThanhToan |

### PhieuGiaoHang

| Thuộc tính  |
| ------------- |
| MaVanDon (PK) |
| MaHoaDon (FK) |
| MaXe (FK)     |
| NgayGiao      |
| NgayNhan      |

### Xe

| Thuộc tính |
| ------------ |
| MaXe (PK)    |
| LoaiXe       |
| MaNV (FK)    |

### KhuyenMai

| Thuộc tính      |
| ----------------- |
| MaKhuyenMai (PK)  |
| GiaTri            |
| ThoiGianKhuyenMai |

### PhieuDoiTra

| Thuộc tính  |
| ------------- |
| MaDoiTra (PK) |
| MaSP (FK)     |
| MaHoaDon (FK) |
| NgayDoiTra    |

### NguyenVatLieu

| Thuộc tính |
| ------------ |
| MaNVL (PK)   |
| TenNVL       |
| SoLuongNVL   |
| GiaNVL       |
| DonVi        |

### Xuong

| Thuộc tính |
| ------------ |
| MaXuong (PK) |
| TenXuong     |
| DiaChiXuong  |

### CongDoan

| Thuộc tính    |
| --------------- |
| MaCongDoan (PK) |
| TenCongDoan     |

### CuaHang

| Thuộc tính   |
| -------------- |
| MaCuaHang (PK) |
| DiaChiCuaHang  |
| SDT            |
| SoLuong        |

---

### Yêu cầu

1. Xác định khóa chính và khóa ngoại.
2. Vẽ sơ đồ ERD hoàn chỉnh.
3. Chuẩn hóa dữ liệu đến chuẩn 3NF.

---

# CÂU 2 (2 ĐIỂM)

Viết lệnh SQL tạo toàn bộ các bảng dữ liệu.

Yêu cầu:

* Đặt Primary Key.
* Đặt Foreign Key.
* Thiết lập ràng buộc CHECK:

<pre class="overflow-visible! px-0!" data-start="3497" data-end="3539"><div class="relative w-full mt-4 mb-1"><div class=""><div class="contents"><div class="border border-token-border-light border-radius-3xl corner-superellipse/1.1 rounded-3xl"><div class="relative h-full w-full border-radius-3xl bg-(--code-block-surface) corner-superellipse/1.1 overflow-clip rounded-3xl [--code-block-surface:var(--bg-elevated-secondary)] dark:[--code-block-surface:var(--composer-surface-primary)] lxnfua_clipPathFallback"><div class="pointer-events-none absolute inset-x-4 top-12 bottom-4"><div class="pointer-events-none sticky z-40 shrink-0 z-1!"><div class="sticky bg-token-border-light"></div></div></div><div class="relative"><div class="h-full min-h-0 min-w-0"><div class="h-full min-h-0 min-w-0"><div class=""><div class="relative"><div class=""><div class="relative z-0 flex max-w-full"><div id="code-block-viewer" dir="ltr" class="q9tKkq_viewer cm-editor z-10 light:cm-light dark:cm-light flex h-full w-full flex-col items-stretch ͼd ͼr"><div class="cm-scroller"><pre class="cm-content q9tKkq_readonly m-0"><code><span>GiaSP </span><span class="ͼg">></span><span></span><span class="ͼj">0</span><span>
GiaNVL </span><span class="ͼg">></span><span></span><span class="ͼj">0</span><span>
SoTien </span><span class="ͼg">></span><span></span><span class="ͼj">0</span></code></pre></div></div></div></div></div></div></div></div><div class=""><div class=""></div></div></div></div></div></div></div></div></pre>

* Email phải duy nhất.

---

# CÂU 3 (1.5 ĐIỂM)

Nhập tối thiểu:

* 10 Nhân viên
* 10 Khách hàng
* 10 Sản phẩm
* 5 Nhà cung cấp
* 5 Hóa đơn

bằng câu lệnh INSERT.

---

# CÂU 4 (1.5 ĐIỂM)

Viết các truy vấn SQL sau:

### a)

Liệt kê danh sách nhân viên cùng chức vụ.

### b)

Liệt kê sản phẩm có giá trên 10.000.000 VNĐ.

### c)

Thống kê tổng doanh thu theo từng tháng.

### d)

Tìm khách hàng mua hàng nhiều nhất.

### e)

Liệt kê các sản phẩm đang áp dụng khuyến mãi.

---

# CÂU 5 (1.5 ĐIỂM)

Tạo VIEW:

### View_DoanhThu

Hiển thị:

<pre class="overflow-visible! px-0!" data-start="4079" data-end="4147"><div class="relative w-full mt-4 mb-1"><div class=""><div class="contents"><div class="relative"><div class="h-full min-h-0 min-w-0"><div class="h-full min-h-0 min-w-0"><div class="border border-token-border-light border-radius-3xl corner-superellipse/1.1 rounded-3xl"><div class="h-full w-full border-radius-3xl bg-(--code-block-surface) corner-superellipse/1.1 overflow-clip rounded-3xl [--code-block-surface:var(--bg-elevated-secondary)] dark:[--code-block-surface:var(--composer-surface-primary)] lxnfua_clipPathFallback"><div class="pointer-events-none absolute end-1.5 top-1 z-2 md:end-2 md:top-1"></div><div class="relative"><div class="pe-11 pt-3"><div class="relative z-0 flex max-w-full"><div id="code-block-viewer" dir="ltr" class="q9tKkq_viewer cm-editor z-10 light:cm-light dark:cm-light flex h-full w-full flex-col items-stretch ͼd ͼr"><div class="cm-scroller"><pre class="cm-content q9tKkq_readonly m-0"><code><span>Mã hóa đơn
Tên khách hàng
Tên nhân viên
Ngày lập
Số tiền</span></code></pre></div></div></div></div></div></div></div></div></div><div class=""><div class=""></div></div></div></div></div></div></pre>

---

### View_SanPhamKhuyenMai

Hiển thị:

<pre class="overflow-visible! px-0!" data-start="4192" data-end="4256"><div class="relative w-full mt-4 mb-1"><div class=""><div class="contents"><div class="relative"><div class="h-full min-h-0 min-w-0"><div class="h-full min-h-0 min-w-0"><div class="border border-token-border-light border-radius-3xl corner-superellipse/1.1 rounded-3xl"><div class="h-full w-full border-radius-3xl bg-(--code-block-surface) corner-superellipse/1.1 overflow-clip rounded-3xl [--code-block-surface:var(--bg-elevated-secondary)] dark:[--code-block-surface:var(--composer-surface-primary)] lxnfua_clipPathFallback"><div class="pointer-events-none absolute end-1.5 top-1 z-2 md:end-2 md:top-1"></div><div class="relative"><div class="pe-11 pt-3"><div class="relative z-0 flex max-w-full"><div id="code-block-viewer" dir="ltr" class="q9tKkq_viewer cm-editor z-10 light:cm-light dark:cm-light flex h-full w-full flex-col items-stretch ͼd ͼr"><div class="cm-scroller"><pre class="cm-content q9tKkq_readonly m-0"><code><span>Tên sản phẩm
Giá gốc
Giá trị khuyến mãi
Giá sau giảm</span></code></pre></div></div></div></div></div></div></div></div></div><div class=""><div class=""></div></div></div></div></div></div></pre>

---

# CÂU 6 (2 ĐIỂM)

Tạo Stored Procedure:

### sp_ThemKhachHang

Thêm khách hàng mới.

Tham số:

<pre class="overflow-visible! px-0!" data-start="4358" data-end="4395"><div class="relative w-full mt-4 mb-1"><div class=""><div class="contents"><div class="border border-token-border-light border-radius-3xl corner-superellipse/1.1 rounded-3xl"><div class="relative h-full w-full border-radius-3xl bg-(--code-block-surface) corner-superellipse/1.1 overflow-clip rounded-3xl [--code-block-surface:var(--bg-elevated-secondary)] dark:[--code-block-surface:var(--composer-surface-primary)] lxnfua_clipPathFallback"><div class="pointer-events-none absolute inset-x-4 top-12 bottom-4"><div class="pointer-events-none sticky z-40 shrink-0 z-1!"><div class="sticky bg-token-border-light"></div></div></div><div class="relative"><div class="h-full min-h-0 min-w-0"><div class="h-full min-h-0 min-w-0"><div class=""><div class="relative"><div class=""><div class="relative z-0 flex max-w-full"><div id="code-block-viewer" dir="ltr" class="q9tKkq_viewer cm-editor z-10 light:cm-light dark:cm-light flex h-full w-full flex-col items-stretch ͼd ͼr"><div class="cm-scroller"><pre class="cm-content q9tKkq_readonly m-0"><code><span>@TenKH
@SDT
@DiaChi
@Email</span></code></pre></div></div></div></div></div></div></div></div><div class=""><div class=""></div></div></div></div></div></div></div></div></pre>

---

### sp_DoanhThuTheoThang

Trả về doanh thu của tháng được truyền vào.

---

# CÂU 7 (2 ĐIỂM)

Tạo Trigger:

### Trigger 1

Khi thêm hóa đơn:

* Tự động giảm số lượng tồn kho.

---

### Trigger 2

Khi đổi trả sản phẩm:

* Tự động cộng lại số lượng tồn kho.

---

### Trigger 3

Không cho phép xóa khách hàng nếu khách hàng đã từng mua hàng.

---

# CÂU 8 (1 ĐIỂM)

## Logon Trigger

Công ty muốn giới hạn số lượng phiên đăng nhập SQL Server.

Yêu cầu:

1. Tạo bảng lưu lịch sử đăng nhập:

<pre class="overflow-visible! px-0!" data-start="4890" data-end="4954"><div class="relative w-full mt-4 mb-1"><div class=""><div class="contents"><div class="border border-token-border-light border-radius-3xl corner-superellipse/1.1 rounded-3xl"><div class="relative h-full w-full border-radius-3xl bg-(--code-block-surface) corner-superellipse/1.1 overflow-clip rounded-3xl [--code-block-surface:var(--bg-elevated-secondary)] dark:[--code-block-surface:var(--composer-surface-primary)] lxnfua_clipPathFallback"><div class="pointer-events-none absolute inset-x-4 top-12 bottom-4"><div class="pointer-events-none sticky z-40 shrink-0 z-1!"><div class="sticky bg-token-border-light"></div></div></div><div class="relative"><div class="h-full min-h-0 min-w-0"><div class="h-full min-h-0 min-w-0"><div class=""><div class="relative"><div class=""><div class="relative z-0 flex max-w-full"><div id="code-block-viewer" dir="ltr" class="q9tKkq_viewer cm-editor z-10 light:cm-light dark:cm-light flex h-full w-full flex-col items-stretch ͼd ͼr"><div class="cm-scroller"><pre class="cm-content q9tKkq_readonly m-0"><code><span>LoginHistory
(
    ID,
    LoginName,
    LoginTime
)</span></code></pre></div></div></div></div></div></div></div></div><div class=""><div class=""></div></div></div></div></div></div></div></div></pre>

2. Viết Logon Trigger:

* Ghi nhận thời gian đăng nhập.
* Không cho phép tài khoản đăng nhập quá 3 phiên đồng thời.

---

# CÂU 9 (1 ĐIỂM)

## Backup & Restore

Trình bày các câu lệnh:

### Backup Full

<pre class="overflow-visible! px-0!" data-start="5159" data-end="5233"><div class="relative w-full mt-4 mb-1"><div class=""><div class="contents"><div class="border border-token-border-light border-radius-3xl corner-superellipse/1.1 rounded-3xl"><div class="relative h-full w-full border-radius-3xl bg-(--code-block-surface) corner-superellipse/1.1 overflow-clip rounded-3xl [--code-block-surface:var(--bg-elevated-secondary)] dark:[--code-block-surface:var(--composer-surface-primary)] lxnfua_clipPathFallback"><div class="pointer-events-none absolute inset-x-4 top-12 bottom-4"><div class="pointer-events-none sticky z-40 shrink-0 z-1!"><div class="sticky bg-token-border-light"></div></div></div><div class="relative"><div class="h-full min-h-0 min-w-0"><div class="h-full min-h-0 min-w-0"><div class=""><div class="relative"><div class=""><div class="relative z-0 flex max-w-full"><div id="code-block-viewer" dir="ltr" class="q9tKkq_viewer cm-editor z-10 light:cm-light dark:cm-light flex h-full w-full flex-col items-stretch ͼd ͼr"><div class="cm-scroller"><pre class="cm-content q9tKkq_readonly m-0"><code><span>BACKUP DATABASE WoodCraftDB
</span><span class="ͼg">TO</span><span> DISK</span><span class="ͼg">=</span><span class="ͼk">'D:\Backup\WoodCraftDB.bak'</span></code></pre></div></div></div></div></div></div></div></div><div class=""><div class=""></div></div></div></div></div></div></div></div></pre>

### Restore

<pre class="overflow-visible! px-0!" data-start="5248" data-end="5325"><div class="relative w-full mt-4 mb-1"><div class=""><div class="contents"><div class="border border-token-border-light border-radius-3xl corner-superellipse/1.1 rounded-3xl"><div class="relative h-full w-full border-radius-3xl bg-(--code-block-surface) corner-superellipse/1.1 overflow-clip rounded-3xl [--code-block-surface:var(--bg-elevated-secondary)] dark:[--code-block-surface:var(--composer-surface-primary)] lxnfua_clipPathFallback"><div class="pointer-events-none absolute inset-x-4 top-12 bottom-4"><div class="pointer-events-none sticky z-40 shrink-0 z-1!"><div class="sticky bg-token-border-light"></div></div></div><div class="relative"><div class="h-full min-h-0 min-w-0"><div class="h-full min-h-0 min-w-0"><div class=""><div class="relative"><div class=""><div class="relative z-0 flex max-w-full"><div id="code-block-viewer" dir="ltr" class="q9tKkq_viewer cm-editor z-10 light:cm-light dark:cm-light flex h-full w-full flex-col items-stretch ͼd ͼr"><div class="cm-scroller"><pre class="cm-content q9tKkq_readonly m-0"><code><span>RESTORE DATABASE WoodCraftDB
</span><span class="ͼg">FROM</span><span> DISK</span><span class="ͼg">=</span><span class="ͼk">'D:\Backup\WoodCraftDB.bak'</span></code></pre></div></div></div></div></div></div></div></div><div class=""><div class=""></div></div></div></div></div></div></div></div></pre>

Giải thích ý nghĩa từng câu lệnh.

---

# THANG ĐIỂM

| Nội dung        | Điểm                              |
| ---------------- | ----------------------------------- |
| Thiết kế ERD   | 2                                   |
| Tạo bảng       | 2                                   |
| Insert dữ liệu | 1.5                                 |
| Query SQL        | 1.5                                 |
| View             | 1                                   |
| Procedure        | 1                                   |
| Trigger          | 2                                   |
| Logon Trigger    | 1                                   |
| Backup/Restore   | 1                                   |
| **Tổng**  | **13 điểm → quy đổi 10** |

Đây là dạng đề rất sát thực tế doanh nghiệp, bao phủ gần như toàn bộ nội dung SQL Server:  **ERD → DDL → DML → Query → View → Procedure → Trigger → Logon Trigger → Backup/Restore** , phù hợp cho bài thi cuối kỳ môn Cơ sở dữ liệu hoặc Hệ quản trị SQL Server.
