# 🚩 ASSIGNMENT 2 – Aviation & Cargo Operations (T-SQL Detailed Solution)

# 1. Tổng quan bài toán

Bài này mô phỏng:

* hệ thống quản lý sân bay
* điều phối chuyến bay
* logistics hàng hóa
* runway safety analytics
* BI reporting

Tech stack phù hợp:

* SQL Server
* T-SQL

---

# 2. Database Schema Design

## 2.1 CREATE DATABASE

```sql
CREATE DATABASE AviationDB;
GO
```

## Giải thích

| Dòng                      | Ý nghĩa                         |
| -------------------------- | --------------------------------- |
| CREATE DATABASE AviationDB | Tạo database tên AviationDB     |
| GO                         | Kết thúc batch trong SQL Server |

---

# 2.2 USE DATABASE

```sql
USE AviationDB;
GO
```

## Giải thích

| Dòng          | Ý nghĩa                        |
| -------------- | -------------------------------- |
| USE AviationDB | Chuyển sang database AviationDB |
| GO             | Kết thúc batch                 |

---

# 3. Tạo bảng Airlines

```sql
CREATE TABLE Airlines (
    AirlineCode VARCHAR(10) PRIMARY KEY,
    AirlineName NVARCHAR(100) NOT NULL,
    Country NVARCHAR(50) NOT NULL
);
```

# Giải thích từng dòng

| Dòng                               | Ý nghĩa                                            |
| ----------------------------------- | ---------------------------------------------------- |
| CREATE TABLE Airlines               | Tạo bảng Airlines                                  |
| AirlineCode VARCHAR(10) PRIMARY KEY | Mã hãng tối đa 10 ký tự và là khóa chính   |
| AirlineName NVARCHAR(100) NOT NULL  | Tên hãng hỗ trợ Unicode và không được rỗng |
| Country NVARCHAR(50) NOT NULL       | Quốc gia hãng hàng không                         |

---

# 4. Tạo bảng Runways

```sql
CREATE TABLE Runways (
    RunwayID VARCHAR(10) PRIMARY KEY,
    MaxWeightCapacity INT NOT NULL,
    Status VARCHAR(20) NOT NULL
    CHECK (Status IN ('Available', 'Maintenance', 'Occupied'))
);
```

# Giải thích

| Dòng                            | Ý nghĩa                              |
| -------------------------------- | -------------------------------------- |
| RunwayID VARCHAR(10) PRIMARY KEY | Mã đường băng                     |
| MaxWeightCapacity INT            | Tải trọng tối đa                   |
| Status VARCHAR(20)               | Trạng thái đường băng            |
| CHECK (...)                      | Chỉ cho phép 3 trạng thái hợp lệ |

---

# 5. Tạo bảng Flights

```sql
CREATE TABLE Flights (
    FlightID VARCHAR(20) PRIMARY KEY,

    AirlineCode VARCHAR(10) NOT NULL,

    RunwayID VARCHAR(10) NOT NULL,

    FlightType VARCHAR(20) NOT NULL
    CHECK (FlightType IN ('Passenger', 'Cargo')),

    ScheduledTime DATETIME NOT NULL,

    ActualTime DATETIME NOT NULL,

    Direction VARCHAR(15) NOT NULL
    CHECK (Direction IN ('Departure', 'Arrival')),

    CONSTRAINT FK_Flights_Airlines
    FOREIGN KEY (AirlineCode)
    REFERENCES Airlines(AirlineCode),

    CONSTRAINT FK_Flights_Runways
    FOREIGN KEY (RunwayID)
    REFERENCES Runways(RunwayID)
);
```

# Giải thích chi tiết

## FlightID

```sql
FlightID VARCHAR(20) PRIMARY KEY
```

* mã chuyến bay
* ví dụ: VN234
* khóa chính

---

## AirlineCode

```sql
AirlineCode VARCHAR(10) NOT NULL
```

* hãng hàng không sở hữu chuyến bay

---

## Foreign Key

```sql
FOREIGN KEY (AirlineCode)
REFERENCES Airlines(AirlineCode)
```

Ý nghĩa:

* AirlineCode trong Flights
* phải tồn tại trong bảng Airlines

=> đảm bảo tính toàn vẹn dữ liệu

---

## CHECK Constraint

```sql
CHECK (FlightType IN ('Passenger', 'Cargo'))
```

Không cho nhập linh tinh:

* abc
* test
* hello

Chỉ được:

* Passenger
* Cargo

---

# 6. Tạo bảng CargoShipments

```sql
CREATE TABLE CargoShipments (
    CargoID INT IDENTITY(1,1) PRIMARY KEY,

    FlightID VARCHAR(20) NOT NULL,

    WeightKG DECIMAL(10,2) NOT NULL,

    CargoCategory NVARCHAR(50) NOT NULL,

    CustomsStatus VARCHAR(30) NOT NULL
    CHECK (CustomsStatus IN ('Cleared', 'Pending', 'Rejected')),

    CONSTRAINT FK_Cargo_Flights
    FOREIGN KEY (FlightID)
    REFERENCES Flights(FlightID)
);
```

# Giải thích

## IDENTITY(1,1)

```sql
CargoID INT IDENTITY(1,1)
```

Tự động tăng:

* dòng đầu = 1
* dòng tiếp = 2
* tiếp tục +1

---

## DECIMAL(10,2)

```sql
WeightKG DECIMAL(10,2)
```

Cho phép:

```text
99999999.99
```

---

# 7. INSERT SAMPLE DATA

# 7.1 Airlines

```sql
INSERT INTO Airlines VALUES
('VNA', 'Vietnam Airlines', 'Vietnam'),
('VJ', 'VietJet Air', 'Vietnam'),
('BAM', 'Bamboo Airways', 'Vietnam'),
('SQ', 'Singapore Airlines', 'Singapore');
```

---

# 7.2 Runways

```sql
INSERT INTO Runways VALUES
('25R', 50000, 'Available'),
('25L', 45000, 'Maintenance'),
('09R', 55000, 'Occupied');
```

---

# 7.3 Flights

```sql
INSERT INTO Flights VALUES
('VN234', 'VNA', '25R', 'Cargo',
 '2026-05-01 08:00:00',
 '2026-05-01 08:45:00',
 'Departure'),

('VJ811', 'VJ', '25R', 'Passenger',
 '2026-05-01 09:00:00',
 '2026-05-01 09:03:00',
 'Departure'),

('SQ183', 'SQ', '09R', 'Cargo',
 '2026-05-01 10:00:00',
 '2026-05-01 10:20:00',
 'Arrival'),

('QH222', 'BAM', '25R', 'Cargo',
 '2026-05-01 10:30:00',
 '2026-05-01 10:35:00',
 'Arrival');
```

---

# 7.4 CargoShipments

```sql
INSERT INTO CargoShipments
(FlightID, WeightKG, CargoCategory, CustomsStatus)
VALUES
('VN234', 700, 'Electronics', 'Cleared'),
('VN234', 300, 'General', 'Pending'),
('SQ183', 1200, 'Electronics', 'Cleared'),
('SQ183', 5000, 'Perishable', 'Cleared'),
('QH222', 600, 'Electronics', 'Rejected');
```

---

# ==============================

# LEVEL 1 – Filtering & JOIN

# ==============================

# Q1. Electronics > 500kg và Cleared

```sql
SELECT
    c.CargoID,
    a.AirlineName,
    f.FlightID,
    c.WeightKG
FROM CargoShipments c
JOIN Flights f
    ON c.FlightID = f.FlightID
JOIN Airlines a
    ON f.AirlineCode = a.AirlineCode
WHERE c.CargoCategory = 'Electronics'
AND c.WeightKG > 500
AND c.CustomsStatus = 'Cleared';
```

# Giải thích từng phần

## Alias

```sql
CargoShipments c
```

c = alias

=> viết ngắn hơn

---

## JOIN

```sql
JOIN Flights f
ON c.FlightID = f.FlightID
```

Nối:

* CargoShipments
* với Flights

qua khóa:

* FlightID

---

## WHERE

```sql
WHERE c.CargoCategory = 'Electronics'
```

Lọc hàng điện tử.

---

```sql
AND c.WeightKG > 500
```

Khối lượng > 500kg.

---

```sql
AND c.CustomsStatus = 'Cleared'
```

Đã thông quan.

---

# Q2. Runway đang Maintenance

```sql
SELECT
    RunwayID,
    MaxWeightCapacity,
    Status
FROM Runways
WHERE Status = 'Maintenance';
```

# Giải thích

```sql
WHERE Status = 'Maintenance'
```

Chỉ lấy runway bảo trì.

---

# ==============================

# LEVEL 2 – Aggregation

# ==============================

# Q3. Tổng khối lượng hàng xuất trong tháng hiện tại

```sql
SELECT
    a.AirlineName,
    SUM(c.WeightKG) AS TotalWeight,
    COUNT(c.CargoID) AS TotalShipments
FROM Airlines a
JOIN Flights f
    ON a.AirlineCode = f.AirlineCode
JOIN CargoShipments c
    ON f.FlightID = c.FlightID
WHERE f.Direction = 'Departure'
AND MONTH(f.ScheduledTime) = MONTH(GETDATE())
AND YEAR(f.ScheduledTime) = YEAR(GETDATE())
GROUP BY a.AirlineName;
```

# Giải thích

## SUM

```sql
SUM(c.WeightKG)
```

Tính tổng khối lượng.

---

## COUNT

```sql
COUNT(c.CargoID)
```

Đếm số lô hàng.

---

## MONTH(GETDATE())

```sql
MONTH(GETDATE())
```

Lấy tháng hiện tại.

---

## GROUP BY

```sql
GROUP BY a.AirlineName
```

Gộp dữ liệu theo từng hãng.

---

# Q4. Cargo vượt tải runway

```sql
SELECT
    f.FlightID,
    r.RunwayID,
    SUM(c.WeightKG) AS TotalCargoWeight,
    r.MaxWeightCapacity
FROM Flights f
JOIN CargoShipments c
    ON f.FlightID = c.FlightID
JOIN Runways r
    ON f.RunwayID = r.RunwayID
WHERE f.FlightType = 'Cargo'
GROUP BY
    f.FlightID,
    r.RunwayID,
    r.MaxWeightCapacity
HAVING SUM(c.WeightKG) > r.MaxWeightCapacity;
```

# Giải thích

## HAVING

```sql
HAVING SUM(c.WeightKG) > r.MaxWeightCapacity
```

HAVING dùng sau GROUP BY.

Mục tiêu:

* lọc các nhóm bị quá tải.

---

# ==============================

# LEVEL 3 – Time Analytics

# ==============================

# Q5. Delay Analytics

```sql
SELECT
    FlightID,
    ScheduledTime,
    ActualTime,
    DATEDIFF(MINUTE, ScheduledTime, ActualTime)
    AS DelayMinutes
FROM Flights
WHERE DATEDIFF(MINUTE, ScheduledTime, ActualTime) > 30;
```

# Giải thích

## DATEDIFF

```sql
DATEDIFF(MINUTE, ScheduledTime, ActualTime)
```

Tính:

```text
ActualTime - ScheduledTime
```

đơn vị:

* MINUTE

---

Ví dụ:

```text
08:00 -> 08:45
```

Delay:

```text
45 phút
```

---

# Q6. Interval Analysis bằng LAG()

```sql
WITH FlightIntervals AS (

    SELECT
        FlightID,
        RunwayID,
        ActualTime,

        LAG(ActualTime) OVER (
            PARTITION BY RunwayID
            ORDER BY ActualTime
        ) AS PreviousLandingTime

    FROM Flights

    WHERE Direction = 'Arrival'
)

SELECT
    FlightID,
    RunwayID,
    ActualTime,
    PreviousLandingTime,

    DATEDIFF(
        MINUTE,
        PreviousLandingTime,
        ActualTime
    ) AS IntervalMinutes

FROM FlightIntervals

WHERE DATEDIFF(
        MINUTE,
        PreviousLandingTime,
        ActualTime
      ) < 10;
```

# Giải thích cực quan trọng

## WITH

```sql
WITH FlightIntervals AS
```

Tạo CTE:

* Common Table Expression
* bảng tạm logic

---

## LAG()

```sql
LAG(ActualTime)
```

Lấy:

* thời gian của dòng trước.

---

## OVER

```sql
OVER (
    PARTITION BY RunwayID
    ORDER BY ActualTime
)
```

Ý nghĩa:

### PARTITION BY

Chia nhóm theo runway.

### ORDER BY

Sắp xếp theo thời gian hạ cánh.

---

Ví dụ:

| Flight | Time  |
| ------ | ----- |
| SQ183  | 10:00 |
| QH222  | 10:05 |

LAG sẽ lấy:

```text
QH222.previous = 10:00
```

---

## DATEDIFF

```sql
DATEDIFF(MINUTE,
         PreviousLandingTime,
         ActualTime)
```

Nếu:

```text
< 10 phút
```

=> runway clearance không an toàn.

---

# ==============================

# LEVEL 4 – BI Dashboard

# ==============================

# Q7. Airline Performance Dashboard

```sql
SELECT
    a.AirlineName,

    COUNT(f.FlightID) AS TotalFlights,

    AVG(
        CASE
            WHEN DATEDIFF(
                MINUTE,
                f.ScheduledTime,
                f.ActualTime
            ) <= 5
            THEN 1.0
            ELSE 0
        END
    ) * 100 AS OnTimeRate,

    SUM(c.WeightKG) AS TotalCargoTransported

FROM Airlines a

LEFT JOIN Flights f
    ON a.AirlineCode = f.AirlineCode

LEFT JOIN CargoShipments c
    ON f.FlightID = c.FlightID

GROUP BY a.AirlineName;
```

# Giải thích

## COUNT

```sql
COUNT(f.FlightID)
```

Tổng số chuyến bay.

---

## CASE WHEN

```sql
CASE
WHEN delay <= 5
THEN 1.0
ELSE 0
END
```

Nếu đúng giờ:

* trả 1

Nếu trễ:

* trả 0

---

## AVG

```sql
AVG(...)
```

Ví dụ:

```text
1 1 1 0 1
```

AVG:

```text
0.8 = 80%
```

=> tỷ lệ đúng giờ.

---

## LEFT JOIN

```sql
LEFT JOIN
```

Lấy toàn bộ hãng hàng không.

Kể cả:

* chưa có chuyến bay.

---

# 8. README.md nên viết gì?

## Nội dung nên có

* Mô tả project
* ERD
* Tech stack
* Query analytics
* Screenshot output

---

# 9. ERD Logic

```text
Airlines
   |
   | 1 - n
   |
Flights
   |
   | 1 - n
   |
CargoShipments

Flights
   |
   | n - 1
   |
Runways
```

---

# 10. Kỹ thuật SQL bạn đã dùng

| Kỹ thuật   | Xuất hiện ở đâu |
| ------------ | -------------------- |
| CREATE TABLE | Schema               |
| PRIMARY KEY  | Tất cả bảng       |
| FOREIGN KEY  | Flights, Cargo       |
| CHECK        | Validation           |
| JOIN         | Q1-Q7                |
| GROUP BY     | Q3-Q7                |
| HAVING       | Q4                   |
| DATEDIFF     | Q5-Q7                |
| CASE WHEN    | Q7                   |
| LAG()        | Q6                   |
| CTE          | Q6                   |
| Aggregation  | SUM, COUNT, AVG      |

---

# 11. Đánh giá kỹ năng bài này

Sau bài này bạn đã luyện:

* relational database design
* operational analytics
* logistics analytics
* BI KPI dashboard
* SQL Server T-SQL
* window function
* enterprise query design

---

# 12. Nâng cấp project nếu muốn mạnh GitHub

## Có thể thêm:

### VIEW

```sql
CREATE VIEW vw_AirlinePerformance AS
...
```

### PROCEDURE

```sql
CREATE PROCEDURE sp_GetDelayedFlights
AS
BEGIN
...
END
```

### INDEX

```sql
CREATE INDEX idx_FlightTime
ON Flights(ActualTime)
```

### Trigger

```sql
CREATE TRIGGER trg_RunwaySafety
```

để tự động cảnh báo runway conflict.
