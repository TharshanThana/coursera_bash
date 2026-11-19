cat << 'EOF' > guessinggame.sh
#!/usr/bin/env bash
# File: guessinggame.sh

function get_file_count {
    local count=$(ls -1 | wc -l)
    echo "$count"
}

correct_count=$(get_file_count)
user_guess=-1

echo "How many files are in the current directory?"

while [[ $user_guess -ne $correct_count ]]
do
    read -p "Enter your guess: " user_guess

    if [[ ! $user_guess =~ ^[0-9]+$ ]]
    then
        echo "Please enter a valid positive number."
    elif [[ $user_guess -lt $correct_count ]]
    then
        echo "Your guess is too low. Try again!"
    elif [[ $user_guess -gt $correct_count ]]
    then
        echo "Your guess is too high. Try again!"
    else
        echo "Congratulations! You guessed the correct number of files ($correct_count)."
    fi
done
EOF
