#!/bin/bash

# Array of full names with potential extra spaces

names=("Yvonne Irene Powell" "Brian King Ogden" "Natalie Walsh Paige" "Anthony Allan" "Christopher Miller" "Joan Murray" "Jessica Hart" "John Alsop" "Nicholas Edmunds Rees" "Karen   Sharp")

# Declare an empty array to store usernames
usernames=()

# Iterate over each full name
for name in "${names[@]}"; do
  cleaned=$(echo "$name" | tr -s ' ')
  first=$(echo "$cleaned" | cut -d ' ' -f1)
  middle=$(echo "$cleaned" | cut -d ' ' -f2)
  last=$(echo "$cleaned" | cut -d ' ' -f3-)
  firsttwo="${first:0:2}"
  middletwo="${middle:0:2}"
  lasttwo="${last:0:2}"
  username="${firsttwo}${middletwo}${lasttwo}"
  usernames+=("$username")
done

 Print all usernames after the loop
echo "Usernames are: ${usernames[@]}"
for username in "${usernames[@]}"; do
	sudo useradd -G newusers -m -s /bin/bash "$username"
	sudo passwd "$username"
	./install_app.sh "$username"
done
echo "Users added successfully"


