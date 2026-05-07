# Câu 1. Tìm khóa của lược đồ quan hệ

Cho:

- R = {A, B, C, D, E}

- F = {
  AB → C  
  CD → E  
  B → CE
  }

---

# Lời giải chi tiết

## Bước 1. Phân tích thuộc tính bắt buộc có trong khóa

Ta xét các thuộc tính xuất hiện ở vế phải của các phụ thuộc hàm:

- C
- E

Như vậy, các thuộc tính không xuất hiện ở vế phải là:

```text
A, B, D
```

Theo lý thuyết chuẩn hóa cơ sở dữ liệu:

> Mọi thuộc tính không xuất hiện ở vế phải đều phải có mặt trong mọi khóa.

Suy ra khóa chắc chắn phải chứa:

```text
ABD
```

---

## Bước 2. Tính bao đóng của ABD

Ta có:

```text
(ABD)+
```

### Ban đầu:

```text
(ABD)+ = {A, B, D}
```

---

### Áp dụng các phụ thuộc hàm

Từ:

```text
B → CE
```

Vì đã có thuộc tính `B`, nên suy ra thêm:

```text
C, E
```

Khi đó:

```text
(ABD)+ = {A, B, C, D, E}
```

Ta thu được toàn bộ thuộc tính của quan hệ:

```text
R = {A, B, C, D, E}
```

Do đó:

```text
(ABD)+ = R
```

Suy ra:

```text
ABD
```

là siêu khóa của quan hệ.

---

## Bước 3. Kiểm tra tính tối thiểu của khóa

Ta lần lượt loại từng thuộc tính khỏi `ABD` để kiểm tra.

---

### 1. Xét BD

Ta có:

```text
(BD)+ = {B, D, C, E}
```

Không suy ra được:

```text
A
```

Vậy:

```text
(BD)+ ≠ R
```

⇒ `BD` không phải khóa.

---

### 2. Xét AD

Ta có:

```text
(AD)+ = {A, D, C}
```

Không suy ra được:

```text
B, E
```

Vậy:

```text
(AD)+ ≠ R
```

⇒ `AD` không phải khóa.

---

### 3. Xét AB

Ta có:

```text
(AB)+ = {A, B, C, E}
```

Không suy ra được:

```text
D
```

Vậy:

```text
(AB)+ ≠ R
```

⇒ `AB` không phải khóa.

---

Vì không thể loại bỏ bất kỳ thuộc tính nào khỏi `ABD`, nên:

```text
ABD
```

là khóa tối thiểu (khóa ứng viên) của quan hệ.

---

# Kết luận

Khóa của lược đồ quan hệ `R` là:

```text
ABD
```