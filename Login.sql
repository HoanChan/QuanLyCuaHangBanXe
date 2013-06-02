exec sp_addrole '001'
exec sp_addrole '002'
exec sp_addrole '003'
exec sp_addrole '004'
exec sp_addrole '005'
exec sp_addrole '006'
exec sp_addrole '007'
exec sp_addrole '008'

exec sp_addlogin 'NV001', '123123'
exec sp_adduser 'NV001', 'NV001'
exec sp_addrolemember '001','NV001'

exec sp_addlogin 'NV002', '123123'
exec sp_adduser 'NV002', 'NV002'
exec sp_addrolemember '004','NV002'

exec sp_addlogin 'NV003', '123123'
exec sp_adduser 'NV003', 'NV003'
exec sp_addrolemember '002','NV003'

exec sp_addlogin 'NV004', '123123'
exec sp_adduser 'NV004', 'NV004'
exec sp_addrolemember '005','NV004'

exec sp_addlogin 'NV005', '123123'
exec sp_adduser 'NV005', 'NV005'
exec sp_addrolemember '004','NV005'

exec sp_addlogin 'NV006', '123123'
exec sp_adduser 'NV006', 'NV006'
exec sp_addrolemember '006','NV006'

exec sp_addlogin 'NV007', '123123'
exec sp_adduser 'NV007', 'NV007'
exec sp_addrolemember '003','NV007'

exec sp_addlogin 'NV008', '123123'
exec sp_adduser 'NV008', 'NV008'
exec sp_addrolemember '007','NV008'
