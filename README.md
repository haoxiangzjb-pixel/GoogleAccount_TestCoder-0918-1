# Ansible Playbook for Defining Variables and Saving to Random Filename

This repository contains an Ansible playbook that demonstrates how to:

1. Define various types of variables (strings, numbers, lists, dictionaries)
2. Generate a random filename
3. Save the variables to a file with the random name

## Files in this repository:

- `ansible-playbook.yml`: The main playbook that defines variables and saves them to a file with a random name
- `README.md`: This documentation file

## How it works:

1. The playbook defines several variables of different types:
   - `my_variable1`: A string ("Hello World")
   - `my_variable2`: A number (42)
   - `my_variable3`: A list with 3 items
   - `my_variable4`: A dictionary with 2 key-value pairs

2. The playbook generates a random filename using:
   - A random number (0-9999): `{{ 10000 | random }}`
   - The current timestamp: `{{ ansible_date_time.iso8601_basic_short }}`

3. The variables are saved to the randomly named file in a human-readable format

## Running the playbook:

```bash
ansible-playbook ansible-playbook.yml
```

The playbook will output the name of the file where the variables were saved.