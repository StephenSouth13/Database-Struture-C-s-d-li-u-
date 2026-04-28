/* LESSON: Buoi_1 - Database Design
   Author: Quách Thành Long (Stephen)
   Project: GradeUp Core DB
*/

-- 1. Khởi tạo Database
USE master;
GO

-- Một phát ăn ngay, không cần truy vấn sys.databases
DROP DATABASE IF EXISTS GradeUp_DB;
GO

CREATE DATABASE GradeUp_DB;
GO

USE GradeUp_DB;
GO
-- =============================================
-- LEVEL 1: CÁC THỰC THỂ ĐỘC LẬP
-- =============================================

-- Bảng Tổ chức (Tenant)
CREATE TABLE Organizations (
                               OrgID INT PRIMARY KEY IDENTITY(1,1),
                               TaxCode NVARCHAR(20) UNIQUE,
                               OrgName NVARCHAR(255) NOT NULL,
                               Website VARCHAR(100),
                               CreatedAt DATETIME DEFAULT GETDATE()
);

-- Bảng Dự án
CREATE TABLE Projects (
                          ProID INT PRIMARY KEY IDENTITY(1,1),
                          ProName NVARCHAR(100) NOT NULL,
                          StartDate DATE,
                          EndDate DATE
);

-- Bảng Kỹ năng
CREATE TABLE Skills (
                        SkillID INT PRIMARY KEY IDENTITY(1,1),
                        SkillName NVARCHAR(50) NOT NULL,
                        Category NVARCHAR(50) -- Ví dụ: Technical, Soft Skill
);

-- =============================================
-- LEVEL 2: CÁC THỰC THỂ PHỤ THUỘC (1-N)
-- =============================================

-- Bảng Phòng ban (Thuộc về 1 Tổ chức)
CREATE TABLE Departments (
                             DepID INT PRIMARY KEY IDENTITY(1,1),
                             OrgID INT NOT NULL,
                             DeptName NVARCHAR(100) NOT NULL,
                             CreatedAt DATETIME DEFAULT GETDATE(),
                             CONSTRAINT FK_Dept_Org FOREIGN KEY (OrgID) REFERENCES Organizations(OrgID)
);

-- Bảng Nhân viên (Thuộc về 1 Phòng ban, có quan hệ Sếp-Lính)
CREATE TABLE Employees (
                           EmployeeID INT PRIMARY KEY IDENTITY(1,1),
                           DepID INT NOT NULL,
                           ManagerID INT NULL, -- Self-reference
                           FullName NVARCHAR(100) NOT NULL,
                           PhoneNumber VARCHAR(15), -- Dùng VARCHAR để giữ số 0 ở đầu
                           Email NVARCHAR(100) UNIQUE,
                           Status VARCHAR(30) DEFAULT 'Active' CHECK (Status IN ('Active', 'Inactive', 'OnLeave')),
                           CONSTRAINT FK_Emp_Dept FOREIGN KEY (DepID) REFERENCES Departments(DepID),
                           CONSTRAINT FK_Emp_Manager FOREIGN KEY (ManagerID) REFERENCES Employees(EmployeeID)
);

-- =============================================
-- LEVEL 3: QUAN HỆ ĐẶC BIỆT (1-1 & N-N)
-- =============================================

-- 1. Quan hệ 1-1: Hồ sơ chi tiết nhân viên
CREATE TABLE EmployeesProfile (
                                  EmployeeID INT PRIMARY KEY, -- PK đồng thời là FK
                                  Address NVARCHAR(MAX),
                                  IdentityNumber VARCHAR(20) UNIQUE,
                                  Bio NVARCHAR(MAX),
                                  CONSTRAINT FK_Profile_Emp FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 2. Quan hệ N-N: Nhân viên tham gia Dự án (Project Assignments)
CREATE TABLE ProjectAssignments (
                                    ProID INT NOT NULL,
                                    EmployeeID INT NOT NULL,
                                    RoleInProject NVARCHAR(50), -- Ví dụ: Lead, Developer
                                    AssignedAt DATETIME DEFAULT GETDATE(),
                                    PRIMARY KEY (ProID, EmployeeID),
                                    CONSTRAINT FK_Assign_Project FOREIGN KEY (ProID) REFERENCES Projects(ProID),
                                    CONSTRAINT FK_Assign_Emp FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

-- 3. Quan hệ N-N: Kỹ năng của nhân viên (Employee Skills)
CREATE TABLE EmployeeSkills (
                                EmployeeID INT NOT NULL,
                                SkillID INT NOT NULL,
                                ProficiencyLevel INT CHECK (ProficiencyLevel BETWEEN 1 AND 5), -- 1: Beginner, 5: Expert
                                PRIMARY KEY (EmployeeID, SkillID),
                                CONSTRAINT FK_ESkill_Emp FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
                                CONSTRAINT FK_ESkill_Skill FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
);
GO