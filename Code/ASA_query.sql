CREATE TABLE InputEventHub (
    utcTimeStamp datetime,
    PTID bigint,
    Load float
); 

CREATE TABLE InputBlobRefData (
    PTID bigint,   
    Name nvarchar(max),   
    Latitude float,   
    Longitude float
); 

SELECT 
    a.utcTimeStamp as Time, 
    b.Name as Region, 
    a.PTID, 
    b.Latitude, 
    b.Longitude, 
    a.Load as Demand 
INTO 
    PBIoutput 
FROM (
    SELECT 
        utcTimeStamp, 
        PTID, 
        Load 
    FROM 
        InputEventHub
    ) 
a join (
    SELECT 
        PTID, 
        Name, 
        Latitude, 
        Longitude 
    FROM 
        InputBlobRefData
) 
b on a.PTID=b.PTID;
