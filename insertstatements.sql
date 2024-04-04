insert into facultyMember values(facultyID(#) , 'facultyname'));

insert into department values(departmentID(#) , 'department name'));

insert into vehicle values(vehicleID(#) , 'vehicleType' , odometerStart(#) , odometerEnd(#) , 'maintenanceComplains'(long text) , 'creditCardNumber'));

insert into maintenanceLogForm values(logID(serial),vehicleID(#),'maintenanceDescription'(long text), logEntryDate(xx/xx/xxxx), completeDate(xx/xx/xxxx), 'mechanicInformation'(long text));

insert into maintenanceDetailForm values(detailID(serial),logID(#), 'mechanicInformation'(long text), 'partsUsed'(long text), 'maintenanceSummary'(long text), completionStatus(true or false));

insert into partsInventory values(partID(serial), 'partName' , 'partQuality'(long text), minimumOnHand(#));

insert into partsUsageForm values(usageID(serial) , logID(#),detailID(#) , partID(#));

insert into TFBS_Center values(tfbsCenterID(serial) , vehicleID(#) , logID(#) , partID(#));

insert into monthlyReports values(reportID(serial), month(xx), 'maintenanceSummary'(long text), 'mechanicInformation'(long text), usageID(#), 'mileageReport'(long text), revenue($xx.xx));
