# CSCI 310: Organization of Programming Languages
## Project 1: Functional Programming
### Description:
* Programming done from a functional point of view using Common Lisp.
* For this assignment, allowed to use car, cdr, cons, cond, defun, mapcar, load, append, listp, print, format, trace, eq, equal, null, zerop, atom and list.  Anything else you need, you should include code for in your program file 
### Problems : 

1) Write a function, hlbackwards, that takes a list of s-expressions as input, and returns a list in which the order of the elements of the list is reversed.  Note that this function should only work on the elements of the list and not of anysublists!  
    * Sample execution:
        * (hlbackwards (quote (a (b c) ((d e (f) g) h i))))
    * Returns: 
        * (((d e (f) g) h i) (b c) a)
2) Write a function, llbackwards, that takes a list of s-expressions as input, and returns a list in which the elements of every list and sublist are in reverse order.
    * Sample execution:
        * (llbackwards (quote (a (b c) ((d e (f)) g) h i)))
    * Returns: 
        * ((i h (g ((f) e d)) (c b) a)
3) Write a function, palindrome, that takes a list as input and returns T if the list is a palindrome, ie reads the same in both directions.  If it is not, it takes the input and converts it into a palindrome by reversing the input and appending it to itself, without duplicating the last element, and returns that list.
    * Sample execution2:
        * (palindrome (quote (a b c (b) a)))
    * Returns: 
        * (a b c (b) a (b) c b a)
    * Sample execution2:
        * (palindrome (quote (a (b c (d)) ((d) c b) a)))
    * Returns: 
        * T
4) Write a function, ionah, that takes a single number as input and prints out the solution to the inverted disk  problem for that many disks.  This is the problem of moving a stack of k disks of increasing size from bottom to top, from the first peg to the third peg with another peg that may be used as well, subject to the condition that a smaller disk is never put on top of a larger one, and only one disk may be moved at a time.  
    * Sample execution:
        * (ionah 3)
    * Returns: 
        * move disk from peg 1 to peg 3
        * move disk from peg 1 to peg 2
        * move disk from peg 3 to peg 2
        * move disk from peg 1 to peg 3
        * move disk from peg 2 to peg 1
        * move disk from peg 2 to peg 3
        * move disk from peg 1 to peg 3
        * NIL

5) Write a function, sequence, that takes a single integer as input and prints out a list containing that many terms of the thesequence defined by:
    * Sn = 
    *0 if n = 1
        - 1 if n = 2
        - 2Sn-1 + Sn-2 if n > 2
    * Sample execution:
        * (sequence 7)
    * Returns: 
        * (0 1 2 5 12 29 70)
6) Write a function, permutations, that takes a list as input and generates a list containing all possible permutations of the list elements.  Here is a sample application:
    * Sample execution:
        * (permutations (quote (1 2 3)))
    * Returns: 
        * ((1 2 3) (1 3 2) (2 1 3) (2 3 1) (3 1 2) (3 2 1))
7) Write a program to argue with yourself.  Your program should take statements that are typed in as a list and change the pronouns and negate the verbs.  For instance, you should change to I, are should change to am not, and so on. 
    * Sample execution:
        * (argue (quote (you are a stupid computer)))
    * Returns: 
        * (I am not a stupid computer)
    * Sample execution:
        * (argue (quote (you are)))
    * Returns:
        * (I am not)
    * Sample execution:
        * (argue (quote (are)))
    * Returns:
        * (am not)
    * Sample execution:
        * (argue (quote (I am a smart human)))
    * Returns:
        * (you are not a smart human)
    * Sample execution:
        * (argue (quote (your mother does wear army boots)))
    * Returns:
        * (my mother does not wear army boots))
    * Sample execution:
        * (argue (quote (you are argumentative)))
    * Returns: 
        * (I am not argumentative)
8) Write a program bubblesort that takes a list of numbers and returns the list in sorted order.
    * Sample execution:
        * (bubblesort (quote (1 4 2 8 5 7)))
    * Returns: 
        * (1 2 4 5 7 8)
