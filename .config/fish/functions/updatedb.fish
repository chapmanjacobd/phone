function updatedb
    command updatedb --database-root ~/ext/ --output $PREFIX/var/mlocate/external.db
    command updatedb --database-root /storage/emulated/0/ --output $PREFIX/var/mlocate/shared.db
    command updatedb
end
