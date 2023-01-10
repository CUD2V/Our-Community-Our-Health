SELECT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY days_observed) OVER() AS median_days_observed
FROM (
      SELECT person_id, DATEDIFF(day, end_date, start_date) AS days_observed
      FROM (
            SELECT tgd.person_id AS person_id, min(op.observation_period_start_date) AS start_date, max(op.observation_period_end_date) AS end_date
            FROM (
                  SELECT distinct person_id
                  FROM transgender.condition_occurrence
                  WHERE condition_concept_id IN (4338512,4029638,443625,37108765,43021157,45613639,4300404,37117130,4246663,432306,436381,4182401,4148284,4248372,37017838,37200330,4284694,43021970,4288747,43021960,4244266,37017839,4234364,4231241,36919180,4247437,439701,43021158)
                 ) AS tgd
            JOIN transgender.observation_period AS op ON tgd.person_id = op.person_id
            GROUP BY tgd.person_id))