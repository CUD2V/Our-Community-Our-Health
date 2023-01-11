SELECT TOP(1) PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY diff.days_observed) OVER() AS median_days_observed
    FROM (
    SELECT agg.person_id, DATEDIFF(day, agg.start_date, agg.end_date) AS days_observed
    FROM (
    SELECT person_id, MAX(all_dates) AS end_date, MIN(all_dates) AS start_date
    FROM (
    SELECT tgd.person_id AS person_id, min(meas.measurement_date) AS min_m_date, min(visit.visit_start_date) AS min_v_date, max(meas.measurement_date) AS max_m_date, max(visit.visit_start_date) AS max_v_date
    FROM (
      SELECT distinct person_id
      FROM CONDITION_OCCURRENCE
      WHERE condition_concept_id IN (4338512,4029638,443625,37108765,43021157,45613639,4300404,37117130,4246663,432306,436381,4182401,4148284,4248372,37017838,37200330,4284694,43021970,4288747,43021960,4244266,37017839,4234364,4231241,36919180,4247437,439701,43021158)
    ) AS tgd
    JOIN MEASUREMENT AS meas ON tgd.person_id = meas.person_id
    JOIN VISIT_OCCURRENCE AS visit ON tgd.person_id = visit.person_id
    GROUP BY tgd.person_id) AS T
    UNPIVOT
    ( all_dates FOR c IN (T.min_m_date, T.min_v_date, T.max_m_date, T.max_v_date)) AS unpvt
    GROUP BY person_id) AS agg) AS diff