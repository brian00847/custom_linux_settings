#!/usr/bin/python3

import re, sys

#def split_file_by_substring(input_file, substring, output_prefix):
#    """
#    Splits the content of 'input_file' into multiple files based on 'substring'.
#    Each file contains the content from one occurrence of 'substring' to the next.
#
#    :param input_file: The path to the input file
#    :param substring: The substring to match for splitting the content
#    :param output_prefix: Prefix for the output files, which will be appended with indices
#    """
#    try:
#        # Open the input file
#        with open(input_file, 'r') as file:
#            content = file.read()
#
#        # Find all matches of the substring
#        matches = list(re.finditer(substring, content))
#
#        # Create files for each content block from one match to the next
#        for i in range(len(matches)):
#            start = matches[i].end()
#            end = matches[i+1].start() if i+1 < len(matches) else len(content)
#            output_file_path = f"{output_prefix}_{i+1}.txt"
#
#            # Write the content block to a new file
#            with open(output_file_path, 'w') as output_file:
#                output_file.write(content[start:end])
#
#            print(f"Content between matches {i+1} saved to {output_file_path}")
#
#    except FileNotFoundError:
#        print("The input file does not exist.")
#    except Exception as e:
#        print(f"An error occurred: {str(e)}")
#
## Example usage:
##split_file_by_substring('path/to/input.txt', 'your_substring_here', 'output_file')

def split_file_by_substring(input_file, substring, output_prefix, encoding='latin1'):
    """
    Splits the content of 'input_file' into multiple files based on 'substring'.
    Each file contains the content from one occurrence of 'substring' to the next.

    :param input_file: The path to the input file
    :param substring: The substring to match for splitting the content
    :param output_prefix: Prefix for the output files, which will be appended with indices
    :param encoding: The encoding used to read the input file
    """
    try:
        # Open the input file with the specified encoding
        with open(input_file, 'r', encoding=encoding) as file:
            content = file.read()

        # Find all matches of the substring
        matches = list(re.finditer(substring, content))

        # If no matches found, just save the entire content in one file
        if not matches:
            output_file_path = f"{output_prefix}_1.txt"
            with open(output_file_path, 'w', encoding='utf-8') as output_file:
                output_file.write(content)
            print(f"No matches found. Entire content saved to {output_file_path}")
            return

        # Create files for each content block from one match to the next
        for i in range(len(matches)):
            start = matches[i].start()  # Changed from end() to start() to include the match in the output
            end = matches[i+1].start() if i+1 < len(matches) else len(content)
            output_file_path = f"{output_prefix}_{i+1}.txt"

            # Write the content block to a new file
            with open(output_file_path, 'w', encoding='utf-8') as output_file:
                output_file.write(content[start:end])

            print(f"Content between matches {i+1} saved to {output_file_path}")

    except FileNotFoundError:
        print("The input file does not exist.")
    except UnicodeDecodeError:
        print("Failed to decode the file with encoding:", encoding)
        print("You might try a different encoding, such as 'latin1', 'cp1252', or 'utf-16'.")
    except Exception as e:
        print(f"An error occurred: {str(e)}")

# Example usage:
#split_file_by_substring('path/to/input.txt', 'your_substring_here', 'output_file')

def main():
    input_file = 'K888.host_ORCMC.log.21'
    output_prefix = 'out'
    split_file_by_substring(input_file, 'serial:id', output_prefix)
    #split_file_by_substring('path/to/input.txt', 'your_substring_here', 'output_file')


sys.exit(main())
