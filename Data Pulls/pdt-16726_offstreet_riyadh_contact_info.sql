SELECT l.pk_lot "Lot ID",
	lt.str_value "Lot Type",
	l.str_rates "Lot Rates",
	c.str_value "Operator",
	c.str_phone_office1 "Operator Phone Number",
	c.str_url "Operator Website",
	l.str_tow_phone "Tow Phone",
	l.str_monthly_phone "Monthly Phone",
	l.str_unlock_phone "Unlock Phone",
	l.str_central_office_phone "Central Office Phone",
	l.str_website "Lot Website",
	l.str_user_visible_note "User Visible Note",
	l.str_manager_contact_info "Manager Contact Info"
FROM lot as l 
JOIN lot_type as lt USING (pk_lot_type)
LEFT JOIN company as c ON (c.pk_company = l.pk_operator)
WHERE l.pk_city = '9e6dc192-17f4-11e2-9a3e-12313d1b6657'
AND (l.str_rates IS NOT NULL OR
	c.str_value IS NOT NULL OR
	c.str_phone_office1 IS NOT NULL OR
	c.str_url IS NOT NULL OR
	l.str_tow_phone IS NOT NULL OR
	l.str_monthly_phone IS NOT NULL OR
	l.str_unlock_phone IS NOT NULL OR
	l.str_central_office_phone IS NOT NULL OR
	l.str_user_visible_note IS NOT NULL OR
	l.str_manager_contact_info IS NOT NULL);