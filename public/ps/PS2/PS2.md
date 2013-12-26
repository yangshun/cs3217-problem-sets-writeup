Problem Set 2
==

*Issue Date: 26 January 2014  
Due Date: 11 February 2014  
Tutorial Date: Week 4*

Section 1 - Introduction
--
The purpose of this problem set is to improve your understanding of *Abstract Data Types* (ADTs). You will interpret, implement and test three ADT classes, `Node`, `Edge` and `Graph`, representing the vertices, edges and overall structure of a labeled graph respectively. The code for these classes can be found in `cs3217/ps2/GraphADT`.

**Reminder**: Please read the entire problem set before starting.

### Background ###
The purpose of a specification is to document a program’s logic, the range of input that it can safely operate on, and its expected behaviour. So for ADTs, the specification describes what this ADT represents, its purpose, its representation invariant, and the behaviour of each of its method. At the start of the ADT, the specification gives a summary of the ADT, mainly the abstraction function and the representation invariant. The abstraction function is a mapping from the state of an ADT instance to some mathematical object that it represents. The representation invariant is some condition that all valid instances of the ADT must satisfy, which is essentially the format of the ADT. Before each method, there are comments describing its behaviour. Here we are simply describing its expected input and output. The “requires” clause state the conditions that the input must satisfy. When calling this method, we must make sure all the conditions in the “requires” clause are met. When implementing this method, we can safely assume that the input satisfies the “requires” clause. The “returns” clause dictates the relationship between the expected output and the input.

### Definitions and Terminology ###

A *graph* is a collection of *nodes* (also called *vertices*) and *edges*. Each edge connects two nodes. In a *directed graph*, edges are one-way: an edge `e = (A,B)` indicates B that is directly reachable from A. To indicate that B is directly reachable from A and A from B, a directed graph would have edges `(A,B) and (B,A)`. On the other hand, in an *undirected graph* we can travel in either directions along the edges between nodes.

The *children* of node B are the nodes to which there is an edge from B. In Fig. 1, the children of B are A and C. Similarly, the *parents* of B are the nodes from which there is an edge to B. In Fig. 1, B only has one parent, A.

A node is said to be *adjacent* to another node if there exists an edge between the two nodes.

A *path* is a sequence of edges `(node1,node2), (node2,node3), (node3,node4), ....` In other words, a path is an ordered list of edges, where an edge to some node is immediately followed by an edge from that node. In Fig. 1, one possible path is `(B,A),(A,B),(B,C)`. This path represents traveling from B to A to B to C. A path may traverse a given edge twice.

In a *multigraph*, there can be any number of edges (zero, one, or more) between a pair of nodes. Fig. 2 shows a multigraph with 2 edges from A to C.

In a *weighted graph* (Fig. 3), every edge has a weight associated with it. In this assignment, a graph cannot contain more than one edge with the same weight between a pair of nodes.

Section 2 - Graph ADT
--
Interpreting an abstract type involves understanding its specifications -  what services it should provide and what their behaviour should be. Implementing an abstract type involves choosing a representation and algorithms, and embodying them in code. In this section, you will practice interpreting and implementing specifications for a Graph structure and in doing so, will gain a better appreciation for the role that fundamental tools such as specifications, object models and the representation invariants play in the design of a module.

### Problem 1: Designing the Graph ADT (20 Points) ###

Now let’s take a look at the first two ADTs, *Node* and *Edge*. You are provided with an Xcode project called `GraphADT` in `cs3217/ps2/GraphADT`. Double click `GraphADT.xcodeproj` to open the project template. Read the specifications for *Node* in `Node.h`, representing individual vertices, and for *Edge* in `Edge.h`, representing edges in the graph. Then read over the staff-provided implementations, `Node.m` and `Edge.m`.

Answer the following questions in `design.txt`:

1. The `isEqual:` methods in *Node* and *Edge* require that object != nil. This is because these methods access the fields of 'object' without checking if 'object' is null first. Why do we require `self` to be non-null? What happens when we pass a message to a nil pointer? Explain. **(5 points)**

2. Calls to `checkRep:` are supposed to catch violations in the classes’ invariants. In general, it is recommended that one call `checkRep:` at the beginning and end of every method. In the case of *Node* and *Edge*, why is it sufficient to call `checkRep:` only at the end of the constructors? (Hint: could a method ever modify a *Node* or *Edge* such that it violates its representation invariant? How are changes to instances of *Node* and *Edge* prevented?) **(5 points)**

3. For *Node* and *Edge*, we could provide a separate method such as `isEquivalentTo:` to test whether two objects represent the same Node or Edge instead of overriding the `isEqual:` method of NSObject. Why is it necessary to override the `isEqual:` methods in these classes? (Hint: methods like `containsObject:`,  `indexOfObject:` for NSArray, and `addObject:` for NSMutableSet call the `isEqual:` method of the collection objects to test for equality). Explain. **(5 points)**

4. There are several ways to represent a graph. Here are a few:
 * As a collection of edges
 * As an adjacency list, in which each node is associated with a list of its outgoing edges.
 * As an adjacency matrix, which explicitly represents, for every pair ⟨A,B⟩ of edges, whether there is a link from A to B, and how many. 

  Briefly discuss the advantages and disadvantages of any three types of Graph representations. **(5 points)**

### Problem 2: Implementing the Graph ADT (100 Points) ###

Read over the specifications provided for the *Graph* class in `Graph.h`. Make sure that you understand the overview for *Graph* and the specifications for the given methods.

Fill in an implementation for the methods in the specification of *Graph*, according to the specifications. You may define new helper methods in `Graph.m` if you need them. You may not add public methods; the external interface must remain the same. Also implement the private `checkRep:` method to help you test whether or not a *Graph* instance violates the representation invariants. We highly recommend you use `checkRep:` in the code you write. Think about the issues discussed in **Problem 1.2** when deciding where `checkRep:` should be called. **(80 points)**

Answer the following questions in `design.txt`:

1. Where did you include calls to `checkRep:` (at the beginning of methods, the end of methods, the beginning of constructors, the end of constructors, some combination)? Why? **(5 points)**

2. In **Problem 1.4**, you had explored the different types of graph representations. Briefly explain why you chose the representation you did in order to implement the Graph ADT. **(5 points)**

3. Imagine that the original representation invariant was changed such that the *Graph* was required to be **directed**. Which method or constructor implementations would have to change? Please list them. For each changed piece of code, describe the changes informally, and indicate how much more or less complex (in terms of code clarity and/or execution efficiency) the result would be. Note that the new implementations must still adhere to the given spec. **(5 points)**

4. Imagine that the original representation invariant was changed to include a new requirement that there can be **at most 1 edge** between a source and destination node. Which method or constructor implementations would have to change? Please list them. For each changed piece of code, describe the changes informally, and indicate how much more or less complex (in terms of code clarity and/or execution efficiency) the result would be. Note that the new implementations must still adhere to the given spec. **(5 points)**

### Problem 3: Testing the Graph ADT (30 Points) ###

It is a very good practice to write unit tests for your ADTs. They help you make sure you don’t break your program when you make changes. The Unit Tests for *Node* and *Edge* have been created for you. Please follow the step-by-step instructions in Gallery 2.1 to run the unit test for Graph ADT.

Now, you are required to add your own unit test cases for the methods of *Graph* in `GraphADT_Tests.m`. Make sure your implementation passes all the test cases you provide. Do note that this is not a time-wasting practice! It gives you peace of mind by minimising your bugs before submission. :) **(30 points)**

### Problem 4: Extending the Graph ADT (50 Points) ###
In this problem, you are going to use a tree to cipher and decipher texts. The cipher and decipher functions are defined as follows:

* **Cipher**: perform string-to-tree with breadth first and then tree-to-string with depth-first
* **Decipher**: perform string-to-tree with depth first and then tree-to-string with breadth-first

In order to perform the string-to-tree conversions, you will be provided with a **key**. This key specifies the number of children for every letter in the string. 

1. First, you must design and implement an ADT for a *Tree* in new files named `Tree.h` and `Tree.m`. You may extend the Graph ADT used in the previous problems or use a different representation for the *Tree*. You should provide a suitable specification for the ADT and also define the representation invariant properly.

2. Now, write a class category for NSString that implements the following two methods:

 - `- (Tree*)breadthFirstStringToTree:(NSNumber*)key`
 - `- (Tree*)depthFirstStringToTree:(NSNumber*)key`

 Your algorithm will need to append some 'special nodes' to the end of the tree to conform to the keys.

3. Add the following two methods to the *Tree* ADT you had implemented earlier:
 - `- (NSString*)breadthFirstTreeToString:(NSNumber*)key`
 - `- (NSString*)breadthFirstTreeToString:(NSNumber*)key`

 Your algorithm will need to add special characters to the result string to indicate the 'special nodes' in the tree.

4. Write appropriate test cases in `GraphADT_Tests.m` to test the cipher and decipher functionalities. Keep in mind that given a string, performing the cipher operation followed by the decipher operation using the same key should produce the same string.  

### Problem 5 [Bonus Question]: Reflection ###
Please answer the following questions:

* How many hours did you spend on each problem of this problem set?
* In retrospect, what could you have done better to reduce the time you spent solving this problem set?
* What could the CS3217 teaching staff have done better to improve your learning experience in this problem set? 

Submit the answer to this question at the end of `design.txt`. **(3 bonus points)**

Section 3 - Grading and Submission
--
Please read this section carefully so that you fully understand the grading scheme and the mode of submission!

### Grading Scheme ###
The simplest way to ensure that you get a good grade on your assignment is to simply go through the list of testing items. Most of the reasons we mark an assignment down could very easily be avoided by simply taking a few minutes to go through each of the testing points before submitting. For this assignment, testing/ grading will be done by running the project in the simulator. We will be looking out for the following:

- Your submission should adhere to the submission format.
- Your interface must be neat.
- You have answered the questions correctly in a concise manner.
- Your project should build without errors or warnings.
- Your project should run without crashing.
- Your unit test cases are well-designed.

### Mode of Submission ###
Like Problem Set 1, the teaching staff will be grading your code directly on GitHub. Your solution for this Problem Set should be contained in a single directory called `ps02`. This directory should be inside the root directory of the private repository assigned to you. You must upload all your work to the master branch of this remote repository. You will be graded on the **latest commit** on the master branch before the deadline.

The directory should contain all the source files, so that your TA can run your code and unit tests.

Clarifications and questions related to this assignment may be directed to the IVLE Forum under the header **‘Problem Set 2: Objective-C & Coding to Specifications’**.

*Good luck and have fun!*