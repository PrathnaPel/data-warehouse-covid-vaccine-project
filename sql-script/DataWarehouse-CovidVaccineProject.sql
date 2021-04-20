create database CovidVaccine;
go

use CovidVaccine;
go

create table LocationDim(
locationID int identity(1,1) primary key,
country nvarchar(1000),
iso_code nvarchar(1000)
);

create table DateDim(
DateID int identity(1,1) primary key,
date date
);

create table SourceDim(
SourceID int identity(1,1) primary key,
sourceName nvarchar(1000),
sourceWebsite nvarchar(1000)
);

--Forgot to include vaccine type table
create table VaccineTypeDim(
VaccineTypeID int identity(1,1) primary key,
VaccineType nvarchar(1000)
);

create table VaccineFact(
VaccineID int identity(1,1) primary key,
locationID int,
DateID int,
SourceID int,
VaccineTypeID int,
DailyVaccinated bigint,
PeopleVaccinated bigint,
PeopleFullyVaccinated bigint,
DailyVaccinationsRaw bigint,
TotalVaccinated bigint,
TotalVaccinationsPerHundred real,
PeopleVaccinationsPerHundred real,
PeopleFullyVaccinatedPerHundred real,
DailyVaccinationPerMillion real,
foreign key (locationID) references LocationDim(locationID),
foreign key (DateID) references DateDim(DateID),
foreign key (SourceID) references SourceDim(SourceID),
foreign key (VaccineTypeID) references VaccineTypeDim(VaccineTypeID)
);