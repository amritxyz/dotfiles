#!/usr/bin/env bash

if [ ! -f /usr/bin/postgres ]; then
	sudo pacman -S postgresql
fi

echo -ne "You want to initialize postgres database? [Y/n] "
read -r POSTGRES
if [[ $POSTGRES == "Y" || $POSTGRES == "y" || -z $POSTGRES ]]; then
	sudo -iu postgres initdb -D /var/lib/postgres/data
fi


# create role to create databse in postgresql
# ```sql
# create role postgres with CREATEDB CREATEROLE;
# ```

# More secure
# sudo -iu postgres initdb -D /var/lib/postgres/data --locale=C.UTF-8 --encoding=UTF8 --auth-local=peer --auth-host=scram-sha-256

# if gcc version mismatched
# ALTER DATABASE template1 REFRESH COLLATION VERSION;

# refresh version immediately in the current session
# ALTER DATABASE postgres REFRESH COLLATION VERSION;
