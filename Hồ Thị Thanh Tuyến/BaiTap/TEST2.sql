--18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.
--S: san pham do Singapore san xuat
--R: CTHD

SELECT DISTINCT R1.SOHD
FROM CTHD R1
WHERE NOT EXISTS (SELECT *
					FROM SANPHAM S
					WHERE S.NUOCSX ='SINGAPORE' AND NOT EXISTS (SELECT *
										FROM CTHD R2
										WHERE R2.MASP = S.MASP AND R2.SOHD = R1.SOHD))

-- 21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.
SELECT COUNT(DISTINCT C.MASP) AS SLSP_2006
FROM HOADON H, CTHD C
WHERE H.SOHD = C.SOHD AND YEAR(H.NGHD) = '2006'

--32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(*) AS SLSP_TQ
FROM SANPHAM S
WHERE S.NUOCSX = 'TRUNG QUOC'

--43. *Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất.
SELECT  S.NUOCSX, S.MASP, S.TENSP
FROM SANPHAM S
GROUP BY S.NUOCSX, S.MASP, S.TENSP
WHERE S.GIA >=ALL (SELECT S1.GIA
					FROM SANPHAM S1
					WHERE S.NUOCSX = S1.NUOCSX
					GROUP BY S1.NUOCSX)
