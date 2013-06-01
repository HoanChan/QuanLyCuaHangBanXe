sp_addlogin 'NVVip', 'NVVip'
sp_adduser 'NVVip', 'NVVip'


Revoke EXECUTE on sp_Select to admin
grant EXECUTE on schema ::dbo to admin
grant insert on NhanVien to admin

grant insert on CTVanChuyen to NV001

grant select on ChucVu to admin
grant insert on ChucVu to admin

grant select on CTQuyen to admin

grant select on ChiNhanh to admin
grant select on Kho to admin
grant select on ChucVu to admin
Grant select on NhanVien to admin
Grant delete on NhanVien to admin

grant EXECUTE on dbo.sp_addlogin to admin

exec ('grant sp_Select on NhanVien to NVVip')