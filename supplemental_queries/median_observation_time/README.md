# Supplemental queries

## Median Observation Time
The median observation time query attempts to calculate the median length of time in days clinical events have been recorded for TGD patients. The query makes use of the OMOP [Observation Period Table](http://ohdsi.github.io/CommonDataModel/cdm54.html#OBSERVATION_PERIOD). For each patient it simply finds the earliest `OBSERVATION_PERIOD.observation_period_start_date` and the latest `OBSERVATION_PERIOD.observation_period_end_date`, and computes the difference between the two dates. The median is computed by finding the 50th percentile of the observation periods.

Note, the BigQuery version of the query has been tested, however the MSSQL Server verion has not, and therefore may need to be adjusted.