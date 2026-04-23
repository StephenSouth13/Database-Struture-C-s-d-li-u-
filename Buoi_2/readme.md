🔑 Mô hình cơ sở dữ liệu quan hệ
1) Khóa và Siêu khóa
   ➤ Siêu khóa (Super Key) là gì?

Siêu khóa là tập hợp một hoặc nhiều thuộc tính có khả năng xác định duy nhất mỗi bản ghi (tuple) trong một bảng (relation).

Nói đơn giản:
👉 Không có 2 dòng nào trong bảng có cùng giá trị siêu khóa
Đặc điểm:
Có thể chứa thuộc tính dư thừa
Không cần tối giản

📌 Ví dụ:
Bảng Student(StudentID, Email, Name)

Các siêu khóa có thể là:

{StudentID}
{Email} (nếu email là duy nhất)
{StudentID, Name} (dư Name nhưng vẫn là siêu khóa)
➤ Khóa (Candidate Key) là gì?

Khóa (khóa ứng viên) là siêu khóa tối thiểu — tức là:

👉 Vẫn đảm bảo xác định duy nhất,
👉 Nhưng không thể bỏ bất kỳ thuộc tính nào mà vẫn giữ được tính duy nhất

Đặc điểm:
Không dư thừa
Là “phiên bản tối giản” của siêu khóa

📌 Ví dụ (tiếp):

{StudentID} → là khóa
{Email} → cũng có thể là khóa
{StudentID, Name} ❌ không phải khóa (vì bỏ Name vẫn xác định được)
🔥 So sánh nhanh
Tiêu chí	Siêu khóa	Khóa (Candidate Key)
Xác định duy nhất	✅	✅
Có thể dư thuộc tính	✅	❌
Tối giản	❌	✅
💡 Ghi nhớ nhanh

Mọi khóa đều là siêu khóa, nhưng không phải mọi siêu khóa đều là khóa.
