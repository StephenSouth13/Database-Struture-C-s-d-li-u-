/*
Tạo Database
*/
CREATE DATABASE Aviation;
       Go

USE Aviation;
Go
/*
2.1)Bảng Airline
*/
CREATE TABLE Airlines(
    AirlineCode Varchar(10) PRIMARY KEY,
    AirlineName NVARCHAR(100) NOT NULL ,
    Country NVARCHAR(50) NOT NULL
    )

/*
2.2)Bảng Runway
*/
CREATE TABLE Runways(
    RunwayID VARCHAR(10) PRIMARY KEY ,
    MaxWeightCapacity INT NOT NULL,
    Status VARCHAR(20) NOT NULL,
    CHECK (Status IN ('Available','Maintenance','Occupied'))
)
/*
 2.3) Bảng Flights
 */
 CREATE TABLE Flights(
     FlightID VARCHAR(20) PRIMARY KEY,
     AirlineCode Varchar(10) NOT NULL,
     RunwayID VARCHAR(10) NOT NULL,
     FlightType VARCHAR(20) NOT NULL,
     CHECK (FlightType IN ('Passenger','Cargo')),
     ScheduleTime DATETIME NOT NULL,
     ActualTime DATETIME NOT NULL,
     Direction VARCHAR(15) NOT NULL,
     CHECK (Direction IN ('Departure','Arrival')),
     CONSTRAINT FK_Flight_Airlines
                     FOREIGN KEY (AirlineCode)
                     REFERENCES Airlines(AirlineCode),
     CONSTRAINT FK_Flight_Runways
                     FOREIGN KEY (RunwayID)
                     REFERENCES Runways(RunwayID)

 )
/*
 2.4) Bảng CargoShipments
 */
 CREATE TABLE CargoShipments (
     CargoID INT IDENTITY PRIMARY KEY,
     FlightID VARCHAR(20) NOT NULL ,
     WeightKG DECIMAL(10,2) NOT NULL,
     CargoCategory NVARCHAR(50) NOT NULL,
     CHECK (CargoCategory IN ('Perishable', 'Electronics', 'General')),
     CustomsStatus VARCHAR(30) NOT NULL,
     CHECK (CustomsStatus IN ('Cleared' , 'Pending', 'Rejected')),
     CONSTRAINT FK_Cargo_Flights
                             FOREIGN KEY (FlightID)
                             REFERENCES Flights(FlightID)
 )

