load data
infile 'data/staff.txt'
 "str '<EORD>'"
into table sakila.staff
fields terminated by '<EOFD>'
trailing nullcols
(
active  NULLIF active = 'NULL',
address_id  NULLIF address_id = 'NULL',
email  "DECODE(:email, 'NULL', NULL, NULL, ' ', :email)",
first_name  "DECODE(:first_name, 'NULL', NULL, NULL, ' ', :first_name)",
last_name  "DECODE(:last_name, 'NULL', NULL, NULL, ' ', :last_name)",
last_update "TO_DATE(DECODE(:last_update, 'NULL', NULL,  DECODE(translate(:last_update,'10 -,:.','1'), null, null,:last_update)),  'yyyy-mm-dd HH24:mi:ss')",
password  "DECODE(:password, 'NULL', NULL, NULL, ' ', :password)",
picture  CHAR(2000000)  NULLIF picture = 'NULL',
staff_id  NULLIF staff_id = 'NULL',
store_id  NULLIF store_id = 'NULL',
username  "DECODE(:username, 'NULL', NULL, NULL, ' ', :username)"
)
