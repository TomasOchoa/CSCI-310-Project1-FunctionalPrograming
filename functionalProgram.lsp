"
 CSCI 310 Organization of Programming Languages, Spring 2015
 Program #1: Functional Programming
 Author: Tomas Ochoa
 Date Due: 23 February 2015

"

; 1.    To get things going, write a function, hlbackwards, that takes a 
;		list of s-expressions as input, and returns a list in which the 
;		order of the elements of the list is reversed.  Note that this 
;		function should only work on the elements of the list and not of 
; 		any sublists! 
 
(defun hlbackwards (L)
	(cond
		((null L) ())
		(T (append (hlbackwards (cdr L)) (list (car L))))
	)
)
;-----------------------------------------------------------------------------------------------------------------

; 2.    To continue warming up, write a function, llbackwards, that takes
;		a list of s-expressions as input, and returns a list in which the 
;		elements of every list and sublist are in reverse order. 

(defun llbackwards (L)
	(cond
		((null L) ())
		((listp (car L))(append (llbackwards (cdr L)) (list (llbackwards (car L)))))
		(T (append (llbackwards (cdr L)) (list (car L))))
	)
)
;-----------------------------------------------------------------------------------------------------------------

; 3.    Write a function, palindrome, that takes a list as input and returns T 
;	    if the list is a palindrome, ie reads the same in both directions.  
;		If it is not, it takes the input and converts it into a palindrome by 
;		reversing the input and appending it to itself, without duplicating 
;		the last element, and returns that list.

(defun palindrome (L)
	(cond 
		((equal L(llbackwards L)))
		(T (append L(cdr(llbackwards L))))
	)
)
;-----------------------------------------------------------------------------------------------------------------

; 4.    Write a function, ionah, that takes a single number as input and prints
;	   	out the solution to the inverted disk  problem for that many disks.  This 
;		is the problem of moving a stack of k disks of increasing size from bottom 
;		to top, from the first peg to the third peg with another peg that may be 
;		used as well, subject to the condition that a smaller disk is never put on 
;		top of a larger one, and only one disk may be moved at a time.


(defun doionah(n to from u)
	(cond
		(
			(> n 0)
			(doionah (- n 1) u from to)
			(format t "move disk from peg ~D to peg ~D~&" from to)
			(doionah (- n 1) to u from)
		)
	)
)

(defun ionah(n)
    (doionah n 3 1 2)
)
;-----------------------------------------------------------------------------------------------------------------

; 5.    Write a function, sequence, that takes a single integer as input and prints 
;	 	out a list containing that many terms of the the sequence defined by:

;2*sequence(n - 1) + 2*sequence(n - 2)
(defun seqDef (n)
	(cond
		((equal n 1) 0)
		((equal n 2) 1)
		(T (+(* 2 (seqDef (- n 1))) (seqDef (- n 2))))
	)
)	

(defun mysequence (n)
	(cond
		((equal n 1) '(0))
		((equal n 2) '(1))
		(T (append (mysequence (- n 1)) (list (seqDef n))))
	)
)


;-----------------------------------------------------------------------------------------------------------------

; 6.    Write a function, permutations, that takes a list as input and generates a list 
;		containing all possible permutations of the list elements.

(defun permutations (lst &optional (remain lst))
	(cond 
		((null remain) nil)
		((null (rest lst)) (list lst))
        (T (append
           (mapcar (lambda (l) (cons (first lst) l)) (permutations (rest lst)))
           (permutations (append (rest lst) (list (first lst))) (rest remain)))
		)
	)
)	
;-----------------------------------------------------------------------------------------------------------------

; 7.	Write a program to argue with yourself.  Your program should take statements that are 
;		typed in as a list and change the pronouns and negate the verbs.  For instance, you 
;		should change to I, are should change to am not, and so on.

(defun argue (L)
	(cond
		((null L) ())
		((equal (car L) 'i) (append (list 'you ) (argue (cdr L))))
		((equal (car L) 'you)(append (list 'i )	(argue (cdr L))))
		((equal (car L) 'am) (append (list 'are 'not )(argue (cdr L))))
		((equal (car L) 'are) (append (list 'am 'not )(argue (cdr L))))	
		((equal (car L) 'arent) (append (list 'am ) (argue (cdr L))))	
		((equal (car L) 'is) (append (list 'is 'not ) (argue (cdr L))))
		((equal (car L) 'isnt) (append (list 'is )(argue (cdr L))))
		((equal (car L) 'your) (append (list 'my )(argue (cdr L))))
		((equal (car L) 'my) (append (list 'your )(argue (cdr L))))
		((equal (car L) 'does) (append (list 'doesnt )(argue (cdr L))))
		((equal (car L) 'doesnt) (append (list 'does )(argue (cdr L))))
		(T L)		
	)
)


;-----------------------------------------------------------------------------------------------------------------
; 8.	Write a program bubblesort that takes a list of numbers and returns 
;		the list in sorted order.

(defun bubblesort (list)
	(cond
		((null list) ())
		(T(<= (length list) 1) list (let ((pivot (first list)))
		(append	(bubblesort (remove-if-not #'(lambda (x) (< x pivot)) list))
		(remove-if-not #'(lambda (x) (= x pivot)) list)
		(bubblesort (remove-if-not #'(lambda (x) (> x pivot)) list)))))
	)
)

;-----------------------------------------------------------------------------------------------------------------



