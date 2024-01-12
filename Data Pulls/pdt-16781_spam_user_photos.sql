SELECT a.pk_lot "Lot ID",
	a.str_path "Photo path",
	auth_user.email "User email"
FROM asset as a
JOIN django_lot.auth_user ON pk_user = id
WHERE auth_user.email = 'cemuntel@gmail.com';