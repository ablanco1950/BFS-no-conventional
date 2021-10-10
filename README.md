# BFS-no-conventional
BFS-no-conventional search according to the BFS algorithm and  an " noconventional" method, meaning the conventional one that is downloaded from http://www.paulgraham.com/acl.html link to code file acl2.lisp.

In this "no conventional" version, all the paths that lead to the objective are obtained following the BFS strategy, not only the first path, which will be the shortest. Since there may be several paths that are the shortest, apart from facilitating the case in which the branches are weighted and only the shortest path is not decisive.

A program BFS-no-conventional-only-first-path.cl is also provided that obtains only the first path that reaches the target (actually it is the same program in which the value of the option parameter has been modified).

The result is an increase in time but a significant reduction in the memory occupied, which is useful in the case of large graphs.

The code has some lack of "orthodoxy", such as the use of global variables.

Requirements:
Allegro CL 10.1 Free Express Edition The programs are loaded, the code is selected and Tools Incremental Evaluation is given. The test cases are then selected and Tools Incremental Evaluation is given again.

References:

ANSI Common Lisp by Paul Graham. http://www.paulgraham.com/acl.html link to code, file acl2.lisp

Diverse material of practices of the subject of Artificial Intelligence of the Polytechnic School Superior, Computer Engineering, of the Autonomous University of Madrid.
