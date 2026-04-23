📚 Session 1 — Introduction & ER Model

Database Course — Foundations of Data Systems

👋 Giới thiệu

Buổi học đầu tiên không chỉ là nhập môn — mà là đặt nền móng cho toàn bộ tư duy về hệ thống dữ liệu.

Nếu frontend là thứ người dùng nhìn thấy, thì database là thứ quyết định hệ thống có chạy đúng, chạy nhanh và “thông minh” hay không.

👤 About Me
Name: Quách Thành Long (Stephen)
Major: Business Information Systems
University: UEH
Goal:
→ Trở thành engineer hiểu hệ thống từ data → backend → AI → product

💡 Repo này mình làm không phải để “lưu bài”, mà để:

Học lại cho chắc
Viết lại cho dễ hiểu
Và build mindset đúng ngay từ đầu
🎯 Mục tiêu buổi 1

Sau buổi này, bạn cần hiểu:

Database là gì và tại sao nó quan trọng
Cách mô hình hóa dữ liệu bằng ER Model
Phân biệt:
Entity
Attribute
Relationship

Bắt đầu tư duy:

“Làm sao để biến bài toán thực tế → mô hình dữ liệu?”

🧠 Database là gì?

Database (Cơ sở dữ liệu) là nơi:

Lưu trữ dữ liệu có cấu trúc
Cho phép truy vấn, cập nhật
Đảm bảo tính chính xác, nhất quán và hiệu suất

📌 Ví dụ thực tế:

Facebook → user, post, comment
Shopee → product, order, user
HRM system → employee, salary, attendance

👉 Tất cả đều bắt đầu từ thiết kế database đúng

🧩 ER Model (Entity-Relationship Model)

Đây là bước đầu tiên khi thiết kế database.

👉 Không code vội.
👉 Không SQL vội.

Phải vẽ được hệ thống trước.

1. Entity (Thực thể)

Là đối tượng trong thế giới thực mà ta muốn lưu dữ liệu.

📌 Ví dụ:

Student
Course
Employee

👉 Entity thường là danh từ

2. Attribute (Thuộc tính)

Là thông tin mô tả entity.

📌 Ví dụ:
Student có:

StudentID
Name
Email

👉 Attribute là chi tiết của entity

3. Relationship (Mối quan hệ)

Mô tả cách các entity liên kết với nhau.

📌 Ví dụ:

Student enrolls in Course
Employee works in Department

👉 Relationship thường là động từ

4. Cardinality (Bội số quan hệ)

Xác định số lượng liên kết giữa các entity:

Loại	Ý nghĩa
1–1	Một - một
1–N	Một - nhiều
N–M	Nhiều - nhiều

📌 Ví dụ:

1 Student → nhiều Courses
1 Course → nhiều Students

→ Đây là quan hệ N–M

🧠 Tư duy quan trọng (rất dễ thi)
❗ Sai lầm phổ biến:
Nhảy vào code SQL ngay
Không phân tích entity rõ ràng
Thiếu relationship → design sai toàn bộ
✅ Tư duy đúng:
Hiểu bài toán thực tế
Xác định entity
Xác định thuộc tính
Xác định relationship
Vẽ ERD
🧪 Ví dụ mini
Bài toán:

Quản lý sinh viên và môn học

Phân tích:
Entity:
Student
Course
Relationship:
Enroll
Cardinality:
N–M

👉 Đây chính là lý do sau này cần bảng trung gian (junction table)

⚠️ Note quan trọng

🔥 Buổi này tưởng dễ nhưng là nền:

Sai ERD → sai toàn bộ database
Sai từ đầu → fix rất tốn thời gian

👉 Học kỹ buổi này = tiết kiệm 80% công sức sau này

📌 Bài tập gợi ý
Thiết kế ERD cho hệ thống:
Quản lý thư viện
Quản lý bán hàng
Quản lý lớp học
Xác định:
Entity
Attribute
Relationship
Cardinality