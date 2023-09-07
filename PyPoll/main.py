# import dependencies
import os
import csv

# Reads in the csv for PyPoll (path)
csvpath = os.path.join("Resources", "election_data.csv")

# Display the complete list of candidates (variables)
Charles_Casper_Stockham_count = 0
Diana_DeGette_count = 0
Raymon_Anthony_Doane_count = 0

# Open the file & read the headers
with open(csvpath) as csvfile:    
    csvreader = csv.reader(csvfile, delimiter=',')
    csv_header = next(csvreader)

    voter_information = csvfile   

    # Display results for what we want to look for
    candidate_list = {}
    row_count = 0
    
    for row in csvreader:
        # Get each candidate's total votes
        if row[2] == "Charles Casper Stockham":
            Charles_Casper_Stockham_count += 1
        elif row[2] == "Diana DeGette":
            Diana_DeGette_count += 1
        elif row[2] == "Raymon Anthony Doane":
            Raymon_Anthony_Doane_count += 1
        
        row_count += 1  


# Get the percent of votes for each candidate
Charles_Casper_Stockham_percentage = (Charles_Casper_Stockham_count / row_count) * 100
Diana_DeGette_percentage = (Diana_DeGette_count / row_count) * 100
Raymon_Anthony_Doane_percentage = (Raymon_Anthony_Doane_count / row_count) * 100

# Summary of results
output = (f"Election Results\n"
    f"---------------------------------------------------------------------------\n"
    f"Total Votes: {row_count}\n"
    f"---------------------------------------------------------------------------\n"
    f"Charles Casper Stockham: {Charles_Casper_Stockham_percentage: .2f}% ({Charles_Casper_Stockham_count})\n"
    f"Diana DeGette: {Diana_DeGette_percentage: .2f}% ({Diana_DeGette_count})\n"
    f"Raymon Anthony Doane: {Raymon_Anthony_Doane_percentage: .2f}% ({Raymon_Anthony_Doane_count})\n"
    f"---------------------------------------------------------------------------\n"
    f"Winner : Diana DeGette\n"
    f"---------------------------------------------------------------------------\n")       

print(output)    

# Create the 'Analysis' directory
output_dir = "Analysis"
os.makedirs(output_dir, exist_ok=True)

# Define the file path for the output file
file_to_save = os.path.join("Analysis", "output_file.txt")

# Export results as txt.file
with open(file_to_save, "w") as txt_file:
    txt_file.write(output)
    