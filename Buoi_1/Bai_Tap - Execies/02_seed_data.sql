/* 
   SESSION 1 - SEED DATA (DML)
   Project: GradeUp Core DB
   Author: Quách Thành Long (Stephen)
*/

USE GradeUp_DB;
GO

-- 1. Nạp Tổ chức (Organization) - Gốc của mọi thứ
INSERT INTO Organizations (TaxCode, OrgName, Website)
VALUES (N'0312345678', N'GradeUp Education Technology', 'https://gradeup.vn');

-- 2. Nạp Phòng ban (Departments) - Thuộc OrgID = 1
INSERT INTO Departments (OrgID, DeptName)
VALUES (1, N'Product & Engineering'),
       (1, N'Marketing & Growth');

-- 3. Nạp Nhân viên (Employees)
-- Lưu ý: Nạp Sếp trước để có ID làm ManagerID cho lính
-- Nhân viên 1: Sếp Tổng (ManagerID = NULL)
INSERT INTO Employees (DepID, ManagerID, FullName, PhoneNumber, Email, Status)
VALUES (1, NULL, N'Quách Thành Long', '0901112223', 'long.cto@gradeup.vn', 'Active');

-- Nhân viên 2 & 3: Nhân viên dưới quyền Long (ManagerID = 1)
INSERT INTO Employees (DepID, ManagerID, FullName, PhoneNumber, Email, Status)
VALUES (1, 1, N'Nguyễn Văn Triệu', '0904445556', 'trieu.dev@gradeup.vn', 'Active'),
       (2, 1, N'Hồ Thị Thanh Tuyến', '0907778889', 'tuyen.design@gradeup.vn', 'Active');

-- 4. Nạp Hồ sơ chi tiết (EmployeesProfile - Quan hệ 1-1)
INSERT INTO EmployeesProfile (EmployeeID, Address, IdentityNumber, Bio)
VALUES (1, N'TP. Hồ Chí Minh', '079123456789', N'CTO tại GradeUp, đam mê xây dựng hệ thống SaaS.'),
       (2, N'Bình Dương', '079987654321', N'Fullstack Developer, yêu thích T-SQL.'),
       (3, N'Đồng Nai', '079555666777', N'UI/UX Designer với 5 năm kinh nghiệm.');

-- 5. Nạp Dự án & Kỹ năng (Bảng độc lập)
INSERT INTO Projects (ProName, StartDate, EndDate)
VALUES (N'GradeUp Core System', '2026-01-01', '2026-12-31'),
       (N'MSCer Mobile App', '2026-03-01', NULL);

INSERT INTO Skills (SkillName, Category)
VALUES ('T-SQL', 'Database'),
       ('Docker', 'DevOps'),
       ('Next.js', 'Frontend'),
       ('AI Agent', 'Artificial Intelligence');

-- 6. Phân công Dự án (ProjectAssignments - Quan hệ N-N)
-- Gán 2 dự án cho nhân viên chính (Long - ID 1)
INSERT INTO ProjectAssignments (EmployeeID, ProID, RoleInProject)
VALUES (1, 1, N'Solution Architect'),
       (1, 2, N'Technical Advisor'),
       (2, 1, N'Backend Developer');

-- 7. Gán Kỹ năng (EmployeeSkills - Quan hệ N-N)
-- Gán 3 kỹ năng cho nhân viên chính (Long - ID 1)
INSERT INTO EmployeeSkills (EmployeeID, SkillID, ProficiencyLevel)
VALUES (1, 1, 5), -- T-SQL level 5
       (1, 2, 4), -- Docker level 4
       (1, 4, 5); -- AI Agent level 5
GO