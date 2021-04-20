#/bin/sh

# from https://stackoverflow.com/questions/28830225/how-to-read-a-properties-file-which-contains-keys-that-have-a-period-character/28831442

file="./app.properties"

if [ -f "$file" ]
then
  echo "$file found."

  while IFS='=' read -r key value
  do
    key=$(echo $key | tr '.' '_')
    eval ${key}=\${value}
  done < "$file"

  echo "User Id       = " ${user}
  echo "user password = " ${pass}
else
  echo "$file not found."
fi


