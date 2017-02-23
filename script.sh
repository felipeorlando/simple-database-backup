# # $1 = database_name
# # $2 = host
# # $3 = user
# # $4 = password

if [ -n "$1" ]; then
  host=$2
  user=$3
  pass=$4
  db_name=$1
else
  read -p "HOST NAME: " host
  read -p "USER NAME: " user
  read -p "PASSWORD: " pass
  read -p "DATABASE: " db_name
fi

time_stamp=$(date +%Y-%m-%d-%T)
new_directory="${HOME}/backups/${time_stamp}"
mkdir -p "${new_directory}"
mysqldump -h $host -u $user --password=$pass $db_name > "${new_directory}/database.sql"
