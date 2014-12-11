Problem Set 2
==

*Issue Date: 19 January 2015  
Due Date: 25 January 2015  
Tutorial Date: Week 4*

Section 1 - Introduction
--

###Bubble Blast Saga###

This assignment will prepare you for the application that you are going to build over the next 5 weeks. This application is a bubble puzzle game similar to BubbleMania. The objective is to shoot bubbles of different colours so that they adhere to other bubbles that are already in the game area. Three or more connected bubbles of the same colour will be removed from the game areas. Any bubbles left unattached to the top will also be removed. 

In this assignment, you will practice reading and interpreting specifications, and writing Objective-C code that satisfies our specifications. In addition, you will be given an introduction to using checkRep methods and testing strategies. You will implement three classes and link them with the code provided to complete the implementation of a Graph ADT. You will be required to answer some questions about both the code you are given and the code you need to write.

A video of what your app might look like is shown in Interactive 3.1. Note that while the grading of the problem sets will be done separately, you will eventually have to integrate all the parts together. You should put effort into ensuring that each problem set is fully debugged before you move on or you will run into a lot of problems when you try to integrate all the parts in a few weeks.

[Interactive 3.1]

###Deploying Apps on your Development iPad###

You should now have received your distributed iPad. It’s time to try installing an application onto your iPad for testing.

To do so, you must ensure your computer and iPad device is configured for iOS development. Make sure your iPad is plugged in, start Xcode and open Organizer from **Window** menu.If this is the first time using the device for development, select your device in Organizer and press **Use for Development**.

If there is no certificate created, Xcode will ask you if you want Xcode to submit certificate request automatically. Say YES. Request will show online on developer portal and has to be approved by an admin user. If Xcode does not prompt you to request a certificate, click **Refresh** in **Provisioning Profiles** under **Library**.

If this is a new device, copy the Identifier UDID and send it to admin user to add it to the online developer portal (should not be the case since all iPads and devices are already added, unless you intend to use your own iPad or iPhone)
 
Go to Provisioning Profiles in LIBRARY in Organizer and click on **Automatic Device Provisioning**. Your device should have a green color dot if everything is OK and you should be able to run apps on it.
 
If you have a yellow/orange dot, select the iOS Team Provisioning profile and hit **DELETE**. Then hit **Refresh** again. Xcode will update with the new profile and should work. Try disconnecting the device and rebooting also if it’s not working straight away. 

**Please note that:**
 
All students use their own certificates, issued on the Mac they connected first. If they wanna use another Mac, they must export and import their profile from Xcode by themselves.

Students may need to install the WWDC certificate authority, which can be downloaded from the online developer portal. 

​ Once that’s done, let’s try to install a very simple application, in fact, just a blank application. Create a single-view iPad application, named **DeviceTest**. Make sure you fill in `nus.cs3217` (case sensitive) as your company. Then change the target platform from simulator to iPad in the scheme selector in the top part of the IDE. Run your application and see that it can be loaded into iPad to run. Now that you are able to successfully deploy an application on the iPad, you can do the same for your future applications by applying similar steps.

Section 2 - Background
--

### Overview ###

The purpose of this problem set is to improve your understanding of *Abstract Data Types* (ADTs). You will interpret, implement and test three ADT classes, `Node`, `Edge` and `Graph`, representing the vertices, edges and overall structure of a labeled graph respectively. The code for these classes can be found in `problem-set-2/GraphADT`.

**Reminder**: Please read the entire problem set before starting.

The purpose of a specification is to document a program’s logic, the range of inputs that it can safely operate on, and its expected behaviour. So for ADTs, the specification describes what this ADT represents, its purpose, its representation invariant, and the behaviour of each of its method(s). At the start of the ADT, the specification gives a summary of the ADT, mainly the abstraction function and the representation invariant. The abstraction function is a mapping from the state of an ADT instance to some mathematical object that it represents. The representation invariant is some condition that all valid instances of the ADT must satisfy, which is essentially the format of the ADT. Before each method, there are comments describing its behaviour. Here we are simply describing its expected input and output. The “requires” clause state the conditions that the input must satisfy. When calling this method, we must make sure all the conditions in the “requires” clause are met. When implementing this method, we can safely assume that the input satisfies the “requires” clause. The “returns” clause dictates the relationship between the expected output and the input.

### Definitions and Terminology ###

A *graph* is a collection of *nodes* (also called *vertices*) and *edges*. Each edge connects two nodes. In a *directed graph*, edges are one-way: an edge `e = (A, B)` indicates that a node, B is directly reachable from another node, A. To indicate that B is directly reachable from A and vice-versa, a directed graph would have edges `(A, B) and (B, A)`. On the other hand, in an *undirected graph* we can travel in either directions along the edges between nodes.

The *children* of node B are the nodes to which there is an edge from B. In Fig. 1, the children of B are A and C. Similarly, the *parents* of B are the nodes from which there is an edge to B. In Fig. 1, B only has one parent, A.

<img src="/ps/ps2/img/digraph.png" alt="digraph" style="width: 180px;"/>
<img src="/ps/ps2/img/multigraph.png" alt="multigraph" style="width: 180px;"/>
<img src="/ps/ps2/img/labeled-graph.png" alt="labelledgraph" style="width: 180px;"/>

A node is said to be *adjacent* to another node if there exists an edge between the two nodes.

A *path* is a sequence of edges `(node1, node2), (node2, node3), (node3, node4), ....` In other words, a path is an ordered list of edges, where an edge to some node is immediately followed by an edge from that node. In Fig. 1, one possible path is `(B, A), (A, B), (B, C)`. This path represents traveling from B to A to B to C. A path may traverse a given edge twice.

In a *multigraph*, there can be any number of edges (zero, one, or more) between a pair of nodes. Fig. 2 shows a multigraph with 2 edges from A to C.

In a *weighted graph* (Fig. 3), every edge has a weight associated with it. In this assignment, a graph cannot contain more than one edge with the same weight between a pair of nodes.

Section 3 - Graph ADT
--
Interpreting an abstract type involves understanding its specifications -  what services it should provide and what their behaviour should be. Implementing an abstract type involves choosing a representation and algorithms, and embodying them in code. In this section, you will practice interpreting and implementing specifications for a Graph structure and in doing so, will gain a better appreciation for the role that fundamental tools such as specifications, object models and the representation invariants play in the design of a module.

### Problem 1: Designing the Graph ADT (20 Points) ###

Now let’s take a look at the first two ADTs, *Node* and *Edge*. You are provided with an Xcode project called `GraphADT` in `problem-set-2/GraphADT`. Double click `ps2.xcodeproj` to open the project template. Read the specifications for *Node* in `Node.h`, representing individual vertices, and for *Edge* in `Edge.h`, representing edges in the graph. Then read over the staff-provided implementations, `Node.m` and `Edge.m`.

Answer the following questions in `design.txt`:

1. The `isEqual:` methods in *Node* and *Edge* require that object != nil. This is because these methods access the fields of 'object' without checking if 'object' is null first. Why do we require `self` to be non-null? What happens when we pass a message to a nil pointer? Explain. **(5 points)**

2. Calls to `checkRep:` are supposed to catch violations in the classes’ invariants. In general, it is recommended that one calls `checkRep:` at the beginning and end of every method. In the case of *Node* and *Edge*, why is it sufficient to call `checkRep:` only at the end of the constructors? (Hint: could a method ever modify a *Node* or *Edge* such that it violates its representation invariant? How are changes to instances of *Node* and *Edge* prevented?) **(5 points)**

3. For *Node* and *Edge*, we could provide a separate method such as `isEquivalentTo:` to test whether two objects represent the same Node or Edge instead of overriding the `isEqual:` method of NSObject. Why is it necessary to override the `isEqual:` methods in these classes? (Hint: methods like `containsObject:`,  `indexOfObject:` for NSArray, and `addObject:` for NSMutableSet call the `isEqual:` method of the collection objects to test for equality). Explain. **(5 points)**

4. There are several ways to represent a graph. Here are a few:
 * As a collection of edges
 * As an adjacency list, in which each node is associated with a list of its outgoing edges.
 * As an adjacency matrix, which explicitly represents, for every pair ⟨A, B⟩ of edges, whether there is a link from A to B, and how many. 

  Briefly discuss the advantages and disadvantages of any three types of Graph representations. **(5 points)**

### Problem 2: Implementing the Graph ADT (100 Points) ###

Read over the specifications provided for the *Graph* class in `Graph.h`. Make sure that you understand the overview for *Graph* and the specifications for the given methods.

Fill in an implementation for the methods in the definition of *Graph*, according to the specifications. You may define new helper methods in `Graph.m` if you need them. You may not add public methods; the external interface must remain the same. Also implement the private `checkRep:` method to help you test whether or not a *Graph* instance violates the representation invariants. We highly recommend you use `checkRep:` in the code you write. Think about the issues discussed in **Problem 1.2** when deciding where `checkRep:` should be called. **(80 points)**

Answer the following questions in `design.txt`:

1. Where did you include calls to `checkRep:` (at the beginning of methods, the end of methods, the beginning of constructors, the end of constructors, some other combination)? Why? **(5 points)**

2. In Problem 1.4, you have explored the different types of graph representations. Briefly explain why you chose that representation to implement the Graph ADT. **(5 points)**

3. Imagine that the original representation invariant was changed such that the *Graph* was required to be **directed**. Which method or constructor implementations would have to be changed? Please list them. For each changed piece of code, describe the changes informally, and indicate how much more or less complex (in terms of code clarity and/or execution efficiency) the result would be. Note that the new implementations must still adhere to the given specifications. **(5 points)**

4. Imagine that the original representation invariant was changed to include a new requirement that there can be **at most 1 edge** between a source and destination node. Which method or constructor implementations would have to change? Please list them. For each changed piece of code, describe the changes informally, and indicate how much more or less complex (in terms of code clarity and/or execution efficiency) the result would be. Note that the new implementations must still adhere to the given spec. **(5 points)**

### Problem 3: Testing the Graph ADT (30 Points) ###

It is a very good practice to write unit tests for your ADTs. They help you make sure you don’t break your program when you make changes. The Unit Tests for *Node* and *Edge* have been created for you. Please follow the step-by-step instructions in Gallery 3.1 to run the unit test for Graph ADT.

**Gallery 3.1** Run unit test for GraphADT in Xcode.

![Open Project](/ps/ps2/img/2-1.png)

**Step 1:** Open the *GraphADT* Xcode project.

![Test Project](/ps/ps2/img/2-2.png)

**Step 2:** Then, select `Product -> Test` (or use the ⌘+U shortcut key) to perform unit testing.

![Test Results](/ps/ps2/img/2-3.png)

**Step 3:** Check your test results by switching to the **Log Navigator** and select the first item *Test* under *GraphADT*. If you have done everything correctly, you should see a series of green checks indicating all the unit tests have passed successfully.

Now, you are required to add your own unit test cases for the methods of *Graph* in `GraphADT_Tests.m`. Make sure your implementation passes all the test cases you provide. Do note that this is not a time-wasting practice! It gives you peace of mind by minimising your bugs before submission. :) **(30 points)**

### Problem 4: Extending the Graph ADT (50 Points) ###
In this problem, you are going to use a tree to cipher and decipher texts. The cipher and decipher functions are defined as follows:

* **Cipher**: perform string-to-tree with breadth first and then tree-to-string with depth-first
* **Decipher**: perform string-to-tree with depth first and then tree-to-string with breadth-first

In order to perform the string-to-tree conversions, you will be provided with a **key**. This key specifies the number of children for every letter in the string. 

As an example, consider the string **HELLO WORLD**. When performing the cipher operation with the **key as 2**, the breadth-first string-to-tree conversion would result in the following tree:

![Cipher Tree](/ps/ps2/img/cipher-tree.png)

Here, we need to append some 'special nodes' to the end of the tree to conform to the key. In the given example, **+** denotes a whitespace while ***** represents a special node. 

In the second part of the cipher operation, this tree is converted to a string using the depth-first approach. This would result in the following string: **HELOROLDL \*\*W\*\***. 

If this resultant string is used as the input for the decipher operation using the same key, then it should give back the initial string i.e. **HELLO WORLD**.

Now, follow the steps described below to implement the cipher/decipher functionalities:

1. First, you must design and implement an ADT for a *Tree* in new files named `Tree.h` and `Tree.m`. You may extend the Graph ADT used in the previous problems or use a different representation for the *Tree*. You should provide a suitable specification for the ADT and also define the representation invariant properly. You may add new files to the project to support your implementation. However, you are required to mention them in `design.txt`.

2. Now, write a class category for NSString that implements the following two methods:

 - `- (Tree*)breadthFirstStringToTree:(NSNumber*)key`
 - `- (Tree*)depthFirstStringToTree:(NSNumber*)key`

 Your algorithm will need to append the 'special nodes' to the end of the tree to conform to the keys.

3. Add the following two methods to the *Tree* ADT you had implemented earlier:
 - `- (NSString*)breadthFirstTreeToString:(NSNumber*)key`
 - `- (NSString*)depthFirstTreeToString:(NSNumber*)key`

 Your algorithm will need to deal with the 'special nodes' in the tree appropriately.

4. Write appropriate test cases in `GraphADT_Tests.m` to test the cipher and decipher functionalities. Keep in mind that given a string, performing the cipher operation followed by the decipher operation using the same key should produce the same string.  

### Bonus Problem: Reflection (3 Bonus Points) ###
Please answer the following questions:

1. How many hours did you spend on each problem of this problem set?
2. In retrospect, what could you have done better to reduce the time you spent solving this problem set?
3. What could the CS3217 teaching staff have done better to improve your learning experience in this problem set? 

Submit your answers to these bonus problems at [http://tiny.cc/cs3217-ps2](http://tiny.cc/cs3217-ps2). Thanks!

Section 4 - Grading and Submission
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

Like Problem Set 1, you will be using a pilot locally hosted [GitLab](http://cs3217.comp.nus.edu.sg) instance for submitting your code and receiving feedback. 

The Xcode project for this problem set will be located in the group [Problem Sets 2014](http://cs3217.comp.nus.edu.sg/groups/problem-sets-2014) under `Problem Set 2`. You should first **fork** the project to your own private workspace, and then **clone** the project to your computer.

When you begin working, your Xcode project will grow to contain files that are user-specific, and should not be committed to a revision control system. You can tell Git to ignore files by writing their definitions in `.gitignore` in the root of a Git repository. This has already been done for you, and the definitions we have used are taken from [GitHub](https://github.com/github/gitignore/blob/master/Objective-C.gitignore). 

**Important Note:** All the required files should be inside the Xcode project that you have forked and cloned. We should be able to download the entire repository, import it into Xcode, and run your solution without making additional changes. You will be graded on the **latest commit** before the deadline.

Even though your TAs will be reading every single line of your code, we will be doing high-level tests of your code using an automated grading script. Points may be taken off if the script fails due to unauthorised changes you may have made in the driver program.

Clarifications and questions related to this assignment may be directed to the IVLE Forum under the header **‘Problem Set 2: Swift & Coding to Specifications’**.

*Good luck and have fun!*