SELECT COUNT (*) "Truck Parking Lots", SUM(COALESCE(l.i_spaces, l.i_spaces_calculated, 0)) "Truck Parking Spaces (Estimated)"
FROM lot as l 
JOIN destination as d ON l.pk_city = d.pk_destination
WHERE d.pk_country = 'b363bb38-ca10-11e1-9278-12313d1b6657'
AND l.pk_lot_type = 12;
