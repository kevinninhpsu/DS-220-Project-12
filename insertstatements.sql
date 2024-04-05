insert into facultyMember values(facultyID(x) , 'facultyname'));

insert into department values(departmentID(x) , 'department name'));

insert into vehicle values(vehicleID(x) , 'vehicleType' , odometerStart(x) , odometerEnd(x) , 'maintenanceComplains'(long text) , 'creditCardNumber'));

insert into maintenanceLogForm values(logID(serial),vehicleID(x),'maintenanceDescription'(long text), logEntryDate(xx/xx/xxxx), completeDate(xx/xx/xxxx), 'mechanicInformation'(long text));

insert into maintenanceDetailForm values(detailID(serial),logID(x), 'mechanicInformation'(long text), 'partsUsed'(long text), 'maintenanceSummary'(long text), completionStatus(true or false));

insert into partsInventory values(partID(serial), 'partName' , 'partQuality'(long text), minimumOnHand(#));

insert into partsUsageForm values(usageID(serial) , logID(x), detailID(x) , partID(x));

insert into TFBS_Center values(tfbsCenterID(serial) , vehicleID(x) , logID(x) , partID(x));

insert into monthlyReports values(reportID(serial), month(xx), 'maintenanceSummary'(long text), 'mechanicInformation'(long text), usageID(x), 'mileageReport'(long text), revenue($xx.xx));
