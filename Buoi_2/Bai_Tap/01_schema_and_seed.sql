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
     
 )
