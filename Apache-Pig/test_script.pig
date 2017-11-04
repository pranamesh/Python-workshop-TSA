--Load the data
data = LOAD 'inrix/2016-06/06232016.txt' using PigStorage(',') As (segment:chararray, speed:int,  time:datetime, conf:int, cvalue:int, avg_speed:int, ref_speed:int, traveltime:double);

--Drop off unwanted columns
reqd_col = FOREACH data GENERATE segment, conf;

--Filter confidence score equal to 30
filtered_data = FILTER reqd_col BY conf == 30;

--Group by sements 
group_segment = GROUP filtered_data BY segment;

--Count the confidence score of 30 for each segment
count_conf = FOREACH group_segment GENERATE group AS segment, COUNT(filtered_data.conf) AS counter;

--Limit for only 10 segments
results = Limit count_conf 10;

--Store the results
STORE results INTO 'tutorial/output_pranamesh' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',');

/*
--View the rsults in the screen rather than saving
DUMP results;
*/