--Load the data
data = LOAD 'inrix/2-2-2017-sample.csv' using PigStorage(',') As (code:chararray, cvalue:int, closed:chararray, score:int, speed:int,   avg_speed:int, ref_speed:int, traveltime:double, time:datetime);

--Get the schema of the variable "data" (Optional)
describe data;

--Drop off unwanted columns
reqd_col = FOREACH data GENERATE code, score;

--Get the schema of the variable "reqd_col" (Optional)
describe reqd_col;

--Filter confidence score equal to 30
filtered_data = FILTER reqd_col BY conf == 30;

--Group by sements 
group_segment = GROUP filtered_data BY code;

--Get the schema of the variable "group_segment" (Optional)
describe group_segment;

--Count the confidence score of 30 for each segment
count_conf = FOREACH group_segment GENERATE group AS segment, COUNT(filtered_data.score) AS counter;

--Limit for only 10 segments
results = Limit count_conf 10;

--View the results in the screen rather than saving
DUMP results;


--Store the results
STORE results INTO 'pranamesh/test_output' USING org.apache.pig.piggybank.storage.CSVExcelStorage(',');

--Copy the results from hdfs to local machine
fs -getmerge pranamesh/test_output pranamesh/test_output.csv
