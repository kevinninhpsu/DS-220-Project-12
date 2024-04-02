CREATE TABLE facultyMember (
    facultyID SERIAL PRIMARY KEY, /*Faculty member's ID*/
    facultyName VARCHAR(255) NOT NULL
);

CREATE TABLE department (
    departmentID SERIAL PRIMARY KEY, /*Department's ID*/
    departmentName VARCHAR(255) NOT NULL
);

CREATE TABLE vehicle (
    vehicleID SERIAL PRIMARY KEY, /*Vehicle's ID*/
    vehicleType VARCHAR(63), /*Identifies vehicle's type (Sedan,minivan,ETC.*/
    odometerStart INT,
    odometerEnd INT, /*Indicates how far the car has traveled*/
    maintenanceComplains TEXT, /*Maintenance, if needed*/
    gallonsPurchased DECIMAL, /*Amount of gallons of gas, if purchased*/
    creditCardNumber VARCHAR(16) /*Credit card number, if gas is purchased*/
);

CREATE TABLE maintenanceLogForm (
    logID SERIAL PRIMARY KEY, /*ID for log form*/
    vehicleID INT REFERENCES vehicle(vehicleID), /*ID for vehicle that is being repaired*/
    maintenanceDescription TEXT,/*Records maintenance activities*/
    logEntryDate DATE,/*Date of when log is entered*/
    completeDate DATE,/*Date of when log is completed*/
    mechanicInformation TEXT/*Information of mechanic, including mechanicID */
);

CREATE TABLE maintenanceDetailForm (
    detailID SERIAL PRIMARY KEY, /*ID for detail form*/
    logID INT REFERENCES  maintenanceLogForm(logID), /*ID for log form*/
    mechanicInformation TEXT REFERENCES maintenanceLogForm(mechanicInformation),
    partsUsed TEXT, /*parts used on each activity*/
    maintenanceSummary TEXT,/*Details about each maintenance activity and summary of issues/solutions */
    completionStatus BOOLEAN default FALSE/*Indicates whether or not maintenance is complete*/
);

CREATE TABLE partsInventory (
    partID SERIAL PRIMARY KEY, /*ID of part*/
    partName VARCHAR(63),
    partQuality TEXT, /*Quality indicator of part*/
    minimumOnHand INT /*Minimum amount of parts on hand at TFBS center*/
);

CREATE TABLE partsUsageForm (
    usageID SERIAL PRIMARY KEY, /*ID of when part is used */
    logID INT REFERENCES maintenanceLogForm(logID), /*References log detail form*/
    detailID INT REFERENCES maintenanceDetailForm(detailID), /*References maintenance detail form*/
    partID INT REFERENCES  partsInventory(partID) /*References exact part*/
);

CREATE TABLE TFBS_Center (
    tfbsCenterID SERIAL PRIMARY KEY,
    vehicleID INT REFERENCES vehicle(vehicleID),
    logID INT REFERENCES maintenanceLogForm(logID),
    partID INT REFERENCES partsInventory(partID)
);

CREATE TABLE monthlyReports (
    reportID SERIAL PRIMARY KEY, /*ID of report*/
    month DATE, /*Indicates which month the report is for*/
    maintenanceSummary TEXT REFERENCES maintenanceDetailForm(maintenanceSummary), 
    mechanicInformation TEXT REFERENCES maintenanceDetailForm(mechanicInformation),
    usageID INT REFERENCES partsUsageForm(usageID),
    mileageReport TEXT,
    revenue DECIMAL
);
