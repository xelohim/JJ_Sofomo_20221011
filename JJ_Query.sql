--I assumed that 14 is correct result for measure_2 in a, since dimension_3 
--appears to be correct and imply two separate combinations
SELECT
    m.dimension_1,
    m.correct_dimension_2 as dimension_2,
    COALESCE(SUM(a.measure_1),0) as measure_1,
    COALESCE(SUM(b.measure_2),0) as measure_2
FROM
    A a
    right outer JOIN ( select distinct * from map) m ON m.dimension_1 = a.dimension_1
    left JOIN B b ON b.dimension_1 = m.dimension_1 
GROUP BY m.dimension_1,m.correct_dimension_2