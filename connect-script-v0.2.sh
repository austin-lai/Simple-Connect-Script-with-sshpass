#!/bin/bash

# Display Help or Usage
display_usage() { 
	echo -e "\nThis script to decode rot13 encoded text ...\n" 
    echo -e "./decode-rot13-v0.2.sh -t wsadxre -o output-decoded-rot13.txt \n"
	echo -e "Usage: $0 [ -h | -t | -o ]\n" 
	echo -e "\t-h , --help"
	echo -e "\t-t <encoded text>"
	echo -e "\t-o <output filename>"
} 

# If less than one arguments supplied, display usage 
if [  $# -lt 1 ] 
then 
	display_usage
	exit 1
fi 

# Check whether user had supplied -h or --help . If yes display usage 
if [[ ( $# == "--help") ||  $# == "-h" ]] 
then 
	display_usage
	exit 0
fi 


# Check and get the parameter or option pass to the Argument
while getopts "t:o:" opt
do
   case "$opt" in
      t ) parameterA="$OPTARG" ;;
      o ) parameterB="$OPTARG" ;;
   esac
done


# Print display_usage function in case parameters are empty  || [ -z "$parameterB" ]
if [ -z "$parameterA" ] 
then
   echo -e "\nSome or all of the parameters are empty";
   display_usage
else
    # Begin script in case all parameters are correct

	# Store given encoded rot13 text from Argument 1 to variable encoded_text
	encoded_text=$parameterA
	echo -e "\nOptions -t = $encoded_text"

    # Decode the rot13
	decoded_rot13=$(echo -n "$encoded_text" | rot13)
    printf "Encoded rot13 = $encoded_text, decoded rot13 = $decoded_rot13"

    # Check if output file parameter is set?
    if [ -z "$parameterB" ]
    then

        # Output file parameter not set, use default outputfile
        echo -e "\nOptions -o not set, use default output file\n"

        echo -e "$decoded_rot13 \n" >> decoded-rot13.txt
    else
        # Store given output filename from Argument 2 to variable output_file
        output_file=$parameterB
        echo -e "\nOptions -o = $output_file\n"

        # Output the decoded rot13 to file as specify
        echo -e "$decoded_rot13 \n" >> $output_file.txt
    fi
fi
