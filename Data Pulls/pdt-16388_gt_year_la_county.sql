CREATE TABLE tmp_gt_years_la_county (
   fid int,
   pk_meter int,
   date_part int
);

-- export PGPASSWORD='djd7NwqDm#TbRA%Yu$0SIuAvw'; psql "user=django_lot2 host=devdb-zzz.parkme.com dbname=pim" -c "\copy tmp_gt_years_la_county FROM '/Users/remimedina/Data Pulls/pdt-16388_gt_years_la_county/pdt-16388_gt_year_la_county.csv' delimiter ',' csv HEADER"

SELECT distinct date_part as "Years"
FROM tmp_gt_years_la_county