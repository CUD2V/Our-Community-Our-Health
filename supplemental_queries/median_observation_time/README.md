# Supplemental queries

## Median Observation Time based on earliest/latest lab/visit
The `median lab or visit time` query computes an estimate for how long patients have been observed by measuring the time between the earliest lab or visit and the latest lab or visit for a given patient. This query makes use of the OMOP [Visit Occurrence](http://ohdsi.github.io/CommonDataModel/cdm54.html#VISIT_OCCURRENCE) and [Measurement](http://ohdsi.github.io/CommonDataModel/cdm54.html#MEASUREMENT) tables. The median is computed by finding the 50th percentile of the observation periods. The output unit is days observed.

## Median Observation Time based on Observation Period Table
The `median observation time` query attempts to calculate the median length of time in days that clinical events have been recorded for TGD patients. The query makes use of the OMOP [Observation Period Table](http://ohdsi.github.io/CommonDataModel/cdm54.html#OBSERVATION_PERIOD). For each patient it computes the length of all observation periods for a given patient by measuring the distance between `OBSERVATION_PERIOD.observation_period_start_date` and `OBSERVATION_PERIOD.observation_period_end_date`. For each patient, the lengths of all observation periods are summed to determine the total observation period length for that patient. The median is computed by finding the 50th percentile of the observation periods. The output unit is days observed.

