-- Lists all bands with Glam rock as their main style, ranked by their longevity.
-- SELECT band_name, (IFNULL(split, YEAR(CURRENT_DATE())) - formed) AS lifespan
SELECT band_name, 
       IFNULL(DATEDIFF(2020, 
             STR_TO_DATE(SUBSTRING_INDEX(lifespan, '-', 1), '%Y'), 
             STR_TO_DATE(SUBSTRING_INDEX(lifespan, '-', -1), '%Y')), 0) AS lifespan
FROM metal_bands
WHERE FIND_IN_SET('Glam rock', split)
ORDER BY lifespan;
