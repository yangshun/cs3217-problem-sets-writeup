Problem Set 2
==

*Issue Date: 19 January 2015  
Due Date: 25 January 2015  
Tutorial Date: Week 3*

Section 1 - Introduction
--

###Bubble Blast Saga###

This assignment will prepare you for the application that you are going to build over the next 5 weeks. This application is a bubble puzzle game similar to BubbleMania. The objective is to shoot bubbles of different colours so that they adhere to other bubbles that are already in the game area. Three or more connected bubbles of the same colour will be removed from the game areas. Any bubbles left unattached to the top will also be removed. 

In this assignment, you will practice reading and interpreting specifications, and writing Swift code that satisfies our specifications. In addition, you will be given an introduction to using `checkRep` methods and testing in Xcode 6. You will implement three classes and link them with the code provided to complete the implementation of a Graph ADT. You will be required to answer some questions about both the code you are given and the code you need to write.

A video of what your app might look like is shown in Interactive 3.1. Note that while the grading of the problem sets will be done separately, you will eventually have to integrate all the parts together. You should put effort into ensuring that each problem set is fully debugged before you move on or you will run into a lot of problems when you try to integrate all the parts in a few weeks.

[Interactive 3.1]

###Deploying Apps on your Development iPad###

You should now have received your distributed iPad. It’s time to try installing an application onto your iPad for testing.

Apple provides an excellent quick guide so please follow them at the following links.

 - First, you should have registered for an Apple Developer (at this [link](https://developer.apple.com/register/index.action)) and been invited to join **National University of Singapore (Department of Computer Science)** team.

 - Add your account to Xcode (see the instruction [here](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/AddingYourAccounttoXcode/AddingYourAccounttoXcode.html#//apple_ref/doc/uid/TP40013839-CH40-SW2))

 - Make sure that your app bundle ID is prefixed with **nus.c3217** and the team is set to **National University of Singapore (Department of Computer Science)**

 - Now connect your iPad. If this is the first time using the device for development, Xcode 6 will automatically enable Developer Mode on your device. If you are using your own device, you might see the following screen.
![Fix issue](/ps/ps2/img/fix-issue.png)
 
 Please copy the Identifier UDID (go to **Window → Devices**, select your iPad on the left column and the Identifier field is the UDID) and send it to admin user to add it to the provisioning profile. It should not be the case if you receive the iPad from the school because all iPads are already added.

 - Change the target platform from simulator to your iPad in the scheme selector in the Toolbar and run any application (you can use the provided project GraphADT in this problem set) to see check if the app is successfully loaded onto the device.

 - If the app cannot run on your device, please follow these [instructions](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/LaunchingYourApponDevices/LaunchingYourApponDevices.html#//apple_ref/doc/uid/TP40013839-CH34-SW7) to verify that your profile has been set up correctly.

**Please note that:**
 
All students use their own certificates, issued on the Mac they connected first. If they wanna use another Mac in the lab, they must first export their signing identities (following these [instructions](https://developer.apple.com/library/ios/documentation/IDEs/Conceptual/AppStoreDistributionTutorial/CreatingYourTeamProvisioningProfile/CreatingYourTeamProvisioningProfile.html#//apple_ref/doc/uid/TP40013839-CH33-SW7)) and import to the other computer. 


Section 2 - Background
--

### Overview ###

The purpose of this problem set is to improve your understanding of reading and implementing a specification. You will be interpreting, implementing and testing a `Graph` Abstract Data Type. The skeleton code for these classes can be found in the `GraphADT` folder of the repository.

**Reminder**: Please read the entire problem set before starting.

The purpose of a specification is to document a program’s logic, the range of inputs that it can safely operate on, and its expected behaviour. So for ADTs, the specification describes what this ADT represents, its purpose, its representation invariant, and the behaviour of each of its method(s). At the start of the ADT, the specification gives a summary of the ADT, mainly the abstraction function and the representation invariant. The abstraction function is a mapping from the state of an ADT instance to some mathematical object that it represents. The representation invariant is some condition that all valid instances of the ADT must satisfy, which is essentially the format of the ADT. Before each method, there are comments describing its behaviour. Here we are simply describing its expected input and output. The “requires” clause state the conditions that the input must satisfy. When calling this method, we must make sure all the conditions in the “requires” clause are met. When implementing this method, we can safely assume that the input satisfies the “requires” clause. The “returns” clause dictates the relationship between the expected output and the input.

### Definitions and Terminology ###

A *graph* is a collection of *nodes* (also called *vertices*) and *edges*. Each edge connects two nodes. In a *directed graph*, edges are one-way: an edge `e = (A, B)` indicates that a node, B is directly reachable from another node, A. To indicate that B is directly reachable from A and vice-versa, a directed graph would have edges `(A, B) and (B, A)`. On the other hand, in an *undirected graph* we can travel in either directions along the edges between nodes.

A node *A* is said to be *adjacent* to a node *B* if there exists an edge connecting *A* to *B*. In Fig. 1, the neighbours of *A* are *A* and *B*.

<img src="/ps/ps2/img/digraph.png" alt="digraph" style="width: 180px;"/>
<img src="/ps/ps2/img/multigraph.png" alt="multigraph" style="width: 180px;"/>
<img src="/ps/ps2/img/labeled-graph.png" alt="labelledgraph" style="width: 180px;"/>

A *path* is a sequence of edges `(node1, node2), (node2, node3), (node3, node4), ....` In other words, a path is an ordered list of edges, where an edge to some node is immediately followed by an edge from that node. In Fig. 1, one possible path is `(B, A), (A, B), (B, C)`. This path represents traveling from B to A, to B, and to C. A path may traverse a given edge twice.

In a *multigraph*, there can be any number of edges (zero, one, or more) between a pair of nodes. Fig. 2 shows a multigraph with 2 edges from A to C.

In a *weighted graph* (Fig. 3), every edge has a weight associated with it.

In this assignment, a graph cannot contain more than one edge with the same weight between a pair of nodes.

Section 3 - Graph ADT
--
Interpreting an abstract type involves understanding its specifications -  what services it should provide and what their behaviour should be. Implementing an abstract type involves choosing a representation and algorithms, and embodying them in code. In this section, you will practice interpreting and implementing specifications for a Graph structure and in doing so, will gain a better appreciation for the role that fundamental tools such as specifications, object models and the representation invariants play in the design of a module.

### Problem 1: Designing the Graph ADT (20 Points) ###

Now let’s take a look at the first two ADTs, *Node* and *Edge*. You are provided with an Xcode project called `GraphADT`. Read the specifications and implementation for `Node` in `Node.swift`, representing individual vertices, and for `Edge` in `Edge.swift`, representing edges in the graph.

Answer the following questions in `answers.txt`:

1. Calls to `_checkRep()` are supposed to catch violations in the classes’ invariants. In general, it is recommended that one calls `_checkRep()` at the beginning and end of every method. In the case of `Edge`, why is it sufficient to call `_checkRep()` only at the end of the constructors? (Hint: could a method ever modify an `Edge` such that it violates its representation invariant? How are changes to instances of and `Edge` prevented?) **(5 points)**

2. `Node` and `Edge` implement the `Equatable` protocol. A related protocol is the `Hashable` protocol. Would there be any benefit in requiring that both Node and Edge implement `Hashable` over `Equatable`? Explain your answer. **(5 points)**

3. Why is `Graph` implemented as a class but not a struct like `Node` and `Edge`? **(5 points)**

4. There are several ways to represent a graph. Here are a few:
   * As a collection of edges
   * As an adjacency list, in which each node is associated with a list of its  outgoing edges.
   * As an adjacency matrix, which explicitly represents, for every pair ⟨A, B⟩ of edges, whether there is a link from A to B, and how many. 

   Briefly discuss the advantages and disadvantages of any three types of Graph representations. **(5 points)**

### Problem 2: Implementing the Graph ADT (100 Points) ###

Read the specifications provided for the `Graph` class in `Graph.swift`. Make sure that you understand the behaviour required for the ADT and the specifications for the given methods.

Implement the `Graph` ADT, according to the specifications. Also implement the private `_checkRep()` method to help you test whether or not a `Graph` instance violates the representation invariants. **(80 points)**

You may modify the declaration of the `Graph` class so long it adheres to the specifications in terms of behaviour and API. Failure to adhere to specifications will result in a heavy penalty. It is also recommended that you use `_checkRep()` when implementing the ADT. Think about the issues discussed in **Problem 1.2** when deciding where `_checkRep()` should be called.

Answer the following questions in `answers.txt`:

1. Where did you include calls to `_checkRep()` (at the beginning of methods, the end of methods, the beginning of constructors, the end of constructors, some other combination)? Why? **(5 points)**

2. In Problem 1.4, you have explored the different types of graph representations. Briefly explain why you chose that representation to implement the `Graph` ADT. **(5 points)**

3. Imagine that the original representation invariant was changed such that the `Graph` was required to be **directed**. Which method or constructor implementations would have to be changed? Please list them. For each changed piece of code, describe the changes informally, and indicate how much more or less complex (in terms of code clarity and/or execution efficiency) the result would be. Note that the new implementations must still adhere to the given specifications. **(5 points)**

4. Imagine that the original representation invariant was changed to include a new requirement that there can be **at most 1 edge** between a source and destination node. Which method or constructor implementations would have to change? Please list them. For each changed piece of code, describe the changes informally, and indicate how much more or less complex (in terms of code clarity and/or execution efficiency) the result would be. Note that the new implementations must still adhere to the given spec. **(5 points)**

### Problem 3: Testing the Graph ADT (30 Points) ###

It is a must to write unit tests for your ADTs. They help you make sure you don’t break your program when you make changes. The Unit Tests for `Node` and `Edge` have been created for you. Please follow the step-by-step instructions in Gallery 3.1 to run the unit test for Graph ADT.

**Gallery 3.1** Run unit test for GraphADT in Xcode.

![Open Project](/ps/ps2/img/2-1.png)

**Step 1:** Open the *GraphADT* Xcode project.

![Test Project](/ps/ps2/img/2-2.png)

**Step 2:** Then, select **Product → Test** (or use the ⌘+U shortcut key) to perform unit testing.

![Test Results](/ps/ps2/img/2-3.png)

**Step 3:** Check your test results by switching to the **Test Navigator**. If you have done everything correctly, you should see a series of green checks indicating all the unit tests have passed successfully.

Now, you are required to add your own unit test cases for the methods of `Graph` in `GraphTests.swift`. Make sure your implementation passes all the test cases you provide. Do note that this is not a time-wasting practice! It gives you peace of mind by minimising your bugs before submission. :) **(30 points)**

### Problem 4: Extending the Graph ADT (50 Points) ###
In this problem, you are going to use a tree to cipher and decipher texts. The cipher and decipher functions are defined as follows:

* **Cipher**: perform string-to-tree with breadth-first order and then tree-to-string with depth-first order
* **Decipher**: perform string-to-tree with depth-first order and then tree-to-string with breadth-first order

In order to perform the string-to-tree conversions, you will be provided with a **key**. This key specifies the number of children for every letter in the string (or the number of children of each node in the intermediate tree). The intermediate tree is a perfect tree which means that:

 - Every node other than the leaves has exactly **k** children.
 - All leaves have the same depth.

For example, consider the string **HELLO WORLD**. When performing the cipher operation with the **key as 2**, the breadth-first string-to-tree conversion would result in the following tree:

![Cipher Tree](/ps/ps2/img/cipher-tree.png)

In order to create a perfect binary tree, we need to append some 'special nodes' with a string label **\*** to the end of the tree to conform to the key. You can assume that the input string has no **\*** character. (Note that the empty node in the diagram represents the space in the original string.)

In the second part of the cipher operation, this tree is converted to a string using the depth-first approach. This would result in the following string: **HELOROLDL \*\*W**. Note that the special characters must be removed if they appears at the end of the string after the conversion.

If this resultant string is used as the input for the decipher operation using the same key, it should give back the initial string i.e. **HELLO WORLD**.

Now, follow the steps described below to implement the cipher/decipher functionalities:

1. First, you must design and implement a `Tree` ADT in `Tree.swift`. You should provide a suitable specification for the ADT and also define the representation invariant properly. You may extend the `Graph` ADT created in the previous problems or use a different representation for the `Tree`. You may add new files to the project to support your implementation; however, you are required to mention them in `answers.txt`.

2. Implement a class extension for `String` in `String+Cryptography.swift`. The  specifications for the class extension can be found within the skeleton provided.

   Take note that your algorithm will need to append the 'special nodes' to the end of the tree to conform to the perfect tree property.

3. Implement a class extension for `Tree` in `Tree+Traversal.swift`. The specifications for the class extension can be found within the skeleton provided.

   Your algorithm will need to deal with the 'special nodes' in the tree appropriately: they should not appear at the end of the converted string.

4. Write appropriate test cases in `TreeTests.swift` and `String+CryptographyTests.swift` to test the `Tree` ADT and the cipher and decipher functionalities. Keep in mind that given a string, performing the cipher operation followed by the decipher operation using the same key should produce the same string.  

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
The simplest way to ensure that you get a good grade on your assignment is to simply go through the list of testing items. Most of the reasons we mark an assignment down could very easily be avoided by simply taking a few minutes to go through each of the testing points before submitting. For this assignment, testing/ grading will be done by running the project through your set of test cases and then our additional ones. We will be looking out for the following:

- Your submission should adhere to the submission format.
- You have answered the questions correctly in a concise manner.
- Your project should build without errors or warnings.
- Your project should run without crashing.
- Your unit test cases are well-designed.

### Mode of Submission ###

Like Problem Set 1, you will be using a pilot locally hosted [GitLab](http://cs3217.comp.nus.edu.sg) instance for submitting your code and receiving feedback. 

The Xcode project for this problem set will be located in the group [Problem Sets 2014](http://cs3217.comp.nus.edu.sg/groups/problem-sets-2014) under `Problem Set 2`. You should first **fork** the project to your own private workspace, and then **clone** the project to your computer.

When you begin working, your Xcode project will create files that are user-specific, and should not be committed to a revision control system. You can tell Git to ignore these files by writing their definitions in `.gitignore` in the root of a Git repository. This has already been done for you, and the definitions we have used are taken from [GitHub's Swift gitignore](https://github.com/github/gitignore/blob/master/Swift.gitignore).

**Important Note:** All the required files should be inside the Xcode project that you have forked and cloned. We should be able to download the entire repository, import it into Xcode, and run your solution without making additional changes. You will be graded on the **latest commit** before the deadline.

Even though your tutors will be reading every single line of your code, we will be testing your code using our set of test cases. Points may be taken off if our tests fails due to unauthorised changes you may have made to the provided struct, class and extension declarations.

Clarifications and questions related to this assignment may be directed to the IVLE Forum under the header **‘Problem Set 2: Swift & Coding to Specifications’**.

*Good luck and have fun!*