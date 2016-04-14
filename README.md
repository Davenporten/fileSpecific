# fileSpecific
Checks how similar files of the same name are in different directories.

This little shell is pretty unrefined, this is my first time coding in bash, but it does what I need it to, at least I think it does. 

It's use is limited, but what it essentially does it iterate through all the cpp and h files in two directories (it could be adjusted to do any sort of file; perhaps add an option?) and returns what percent of the second file is the same as the first. The percentage is really an approximation, but as far as I've tested it's pretty good.

Here's essentially how it works (if my logic's off please let me know):
  1) Find two files in each folders that have the same name
  2) Use sdiff to find any unique lines of code between the two
  3) Add the number of lines from each file
  4) Subtract the number of unique lines from the total number of lines
  5) Divides that value by two (this should be the number of lines that one of the files has in common with the other)
  6) Divides the common lines in one file with the total lines in the second argument
  7) Multiplies by 100

Areas I need/want help (any other suggestions are welcome):

  - Is there an easier way to get the unique lines of code? I'm not really familiar with sdiff, but it seems to work. I feel like though it could be done in few lines of code.
  
  - Does my logic work? Does the percentage mean what I think it means? Need some others to test it.
  
  - I had problems getting the total number of lines for each file, probably because I don't understand cat, while I was building this and I remedied it by just adding one to the total number of lines for each file. Is there some way to take care of this problem?

Note: The commented out code at the bottom is for general file comparison.
