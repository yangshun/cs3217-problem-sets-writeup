Problem Set 1
==

*Issue Date: 13 January 2014  
Due Date: 19 January 2014  
Tutorial Date: Week 2*

Section 1 - Introduction
--
This assignment consists of two parts. In the first part of this assignment, you will be introduced to Xcode, which is the IDE for Mac OS and iOS development. In the second part, you will take the opportunity to learn the basics of the Objective-C programming language and create a simple command line tool using Xcode.

**Reminder:** Please read the entire problem set before starting.

### Getting Started ###

This assignment (and the rest of the course) assumes that you have access to

* Mac OS X 10.9
* Xcode 5
* An Apple Developer account
* An iPad capable of running iOS 7

Strictly speaking, it is sufficient (but *not* recommended) to install and use OS X Command Line Tools.

If you do not have access to a computer running Mac OS X 10.9, you may:

* Use the iMacs in Programming Lab 1. They have already been configured to support course requirements.
* Resourcefully acquire an OS X installer image. This image can be installed on a virtual machine like VMWare Workstation or Virtual Box.

Development in general can be a messy process, and you should consider running your toolchain in a virtual environment if you are working on your primary computer.

### Objective-C and Cocoa ###

Objective-C is the primary language that will be used to write Mac and iOS software. During this semester, all coding assignments will be done using Objective-C.

If you’re comfortable with basic object-oriented concepts and the C language, the extensions provided by Objective-C should be quite natural, and it should be easy to pick up Objective-C during CS3217. You should read Apple's [Introduction to Objective-C \(PDF\)](https://developer.apple.com/library/ios/documentation/cocoa/Conceptual/OOP_ObjC/OOP_ObjC.pdf).

[Cocoa](https://developer.apple.com/technologies/mac/cocoa.html) is Apple’s native object-oriented API for the Mac OS X operating system. For iOS development, we will be using [Cocoa Touch](https://developer.apple.com/technologies/ios/cocoa-touch.html), a touch-oriented API similar to Cocoa. Cocoa Touch follows a Model-View-Controller (MVC) paradigm.

##### Milestone 0: Find out how common programming constructs are expressed idiomatically in Objective-C. (Not graded)

* Declaring primitive types
* Declaring and instantiating objects
* Declaring class and instance methods
* Declaring class fields
* Class access specifiers
* Declaring and using interfaces/protocols
* Invoking methods
* Accessing properties
* C-style structures versus objects


Section 2 - Hello iPad! (Not Graded)
--

In this section, you will use Xcode to create a project and storyboards to construct a very simple user interface. This assignment requires no coding. It is intended to provide you with a quick introduction to the tools that you’ll be using during the course. Follow this walkthrough and build your first iOS application.

**Important Note:** Even though it is possible to complete the first part of the assignment just by following instructions, it is important for you to understand what you are doing in each step, since in the next assignments you will be required to use the same tools.

##### Milestone 1: Create a new Xcode project.

![Welcome to Xcode\!](/ps/ps1/img/1-1.png)

Welcome to Xcode\!

![When you have finally decided to start working, begin by creating an iOS Single View application.](/ps/ps1/img/1-2.png)

When you have finally decided to start working, begin by creating an iOS Single View application.

![Fill in app details. \(Note: It is important to keep the company identifier as `nus.cs3217`\)](/ps/ps1/img/1-3.png)

Fill in app details. \(Note: It is important to keep the company identifier as `nus.cs3217`\) You will be prompted to save your project to disk after this step.

##### Milestone 2: Navigate around the IDE.

![The standard editor displays a single file.](/ps/ps1/img/2-1.png)

The standard editor displays a single file. This screenshot shows the visual storyboard editor. Note the properties panel to the right of the screen.

![The assistant editor is highly recommended for writing code.](/ps/ps1/img/2-2.png)

The assistant editor is highly recommended for writing code. It shows header and implementation files in a 2-column split view by default, but can also be made to show any arbitrary file.

![When writing code, the properties panel is replaced by Quick Help, which shows brief documentation of the object under cursor.](/ps/ps1/img/2-3.png)

When writing code, the properties panel is replaced by Quick Help, which shows brief documentation of the object under cursor.

##### Milestone 3: Add library interface elements.

![Add user interface elements from the library by dragging them to the storyboard.](/ps/ps1/img/3-1.png)

Add user interface elements from the library by dragging them to the storyboard.

Note how the properties panel expands to show further details when a UI element is selected. Add both a label, and a button. 

##### Milestone 4: Add some code.

You need to "link" storyboard elements to their associated View Controller before you can reference them in code.

![Right-click on the label and add a "Referencing Outlet" by dragging the `+` to the View Controller header file.](/ps/ps1/img/4-1.png)

Right-click on the label and add a "Referencing Outlet" by dragging the `+` to the View Controller header file.

![Add an Action handler in the same way for "Touch Up Inside".](/ps/ps1/img/4-2.png)

Add an Action handler in the same way for **"Touch Up Inside"**.

![Write a single line of code to change the label's text.](/ps/ps1/img/4-3.png)

Write a single line of code to change the label's text.

##### Milestone 5: Run your project in the emulator.

Run your project by clicking on the play button at the top-left of the screen. It may take awhile for the emulator to launch. 

![My First iOS App\!](/ps/ps1/img/4-4.png)

Test that your app works by tapping on the button. Observe that the label's text changes.

![It works\!](/ps/ps1/img/4-5.png)

Note that on lower resolution screens, your emulator may not show the faux iPad bezel. In addition, the height (in pixels) of the iPad may exceed the height of your screen. If this happens, you will need to scroll up and down emulator.

Holding the `option` key with your cursor over the emulator's "screen" brings out two gray circles representing two touch points. This is useful for debugging pinch and rotate gestures. 

The emulator has limitations when testing more complicated gestures, the camera, and network stacks. You should find out about these limitations if your application implements such functionality.

Section 3 - Introduction to Objective-C (100 points)
--

In this section, you will be introduced to Object Oriented Programming and collection-types in Objective-C through the implementation of graph algorithms. As these algorithms may be relevant to future problem sets, you are advised to design your solutions in a generic and reusable way so that you will not have to waste time in the coming weeks.


### Problem 1: Collections in Objective-C (10 points)

Objective-C provides three main collection types:

- `NSArray` describes a linear collection of objects where each object may be accessed by an index.
- `NSDictionary` describes a key-value store where some one *key*-object maps to one *value*-object.
- `NSSet` describes an unordered collection of unique objects.

Collections are immutable by default. The mutable counterparts of the above are `NSMutableArray`, `NSMutableDictionary`, and `NSMutableSet`. Collections should also be thought of in their abstract sense, rather than their concrete implementation (such as in Java).

1. What are the selectors used for the comparison operation among keys in `NSDictionary` and objects in `NSSet`?  **(10 points)**


### Problem 2: Standard Data Structures (30 points)

Objective-C does not provide Stacks and Queues natively. Your task is to implement a generic LIFO stack, and a generic FIFO queue.

**Fork** the Problem Set 1 repository from GitLab ([http://cs3217.comp.nus.edu.sg/problem-sets-2014/problem-set-1](http://cs3217.comp.nus.edu.sg/problem-sets-2014/problem-set-1)) and **clone** it into your computer to begin working. 

The Xcode project that you would have just cloned is a Mac OS Command Line Tool which is designed to be run on your computer, not your iPad. The file `main.m` contains a small driver program that you *should not change*. The driver program will read a property list specified in an argument, and output the results of the specified algorithm to the console. We will be using this driver program to grade your assignment automatically. 

#### Property Lists ####

[Property lists](http://en.wikipedia.org/wiki/Property_list), also called "plists", are text files that store serialised objects. They store basic data types such as Strings, Numbers, and Boolean values, but are also capable of representing dates, arrays, dictionaries, and binary data (encoded as Base64 ASCII). 

In OS X and iOS, `.plist` files are most commonly used to store program settings, and may be seen as analogous to the Windows registry (Property lists compartmentalise settings to applicaiton bundles, whereas the Windows registry is a global store).


#### Stacks and Queues ####

The Xcode project that you would have just cloned is a Mac OS Command Line Tool which is designed to be run on your computer, not your iPad. The file `main.m` contains a small driver program that you *should not modify*. We will be using this driver program to grade your assignment automatically.

1. A skeleton class for the Stack has been provided in `Stack.h` and `Stack.m`. Implement the Stack by filling up the method implementations in `Stack.m`. You should not change the protocol provided. **(15 points)**

2. A skeleton class for the Queue has been provided in `Queue.h` and `Queue.m`. Implement the Queue by filling up the method implementations in `Queue.m`. You should not change the protocol provided. **(15 points)**

#### Input Format ####

The input file format for Stacks and Queues is a property list with a root key `testCases` that maps to an array of items. Each test item contains the name of a selector that the driver program should dynamically invoke, and a single optional parameter that may be supplied. 

An example to test a Queue data structure is given below.

	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
		<key>testCases</key>
		<array>
			<dict>
				<key>selector</key>
				<string>enqueue:</string>
				<key>param</key>
				<string>A</string>
			</dict>
			<dict>
				<key>selector</key>
				<string>enqueue:</string>
				<key>param</key>
				<string>B</string>
			</dict>
			<dict>
				<key>selector</key>
				<string>enqueue:</string>
				<key>param</key>
				<string>C</string>
			</dict>
			<dict>
				<key>selector</key>
				<string>dequeue</string>
			</dict>
		</array>
	</dict>
	</plist>

### Problem 3: Graph Traversal (45 points)

We may represent a **general graph** as an adjacency list implemented in the form of a dictionary that maps vertex labels to arrays of their neighbors.

Consider the following graph taken from [Wikipedia](http://en.wikipedia.org/wiki/File:Graph.traversal.example.svg):

![Example Graph](/ps/ps1/img/graph.png)

The adjacency list for this graph in the format of an (Apple) property list would be as follows. The root key `start` represents the start vertex of the traversal decribed by this test file.

	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
		<key>start</key>
		<string>A</string>
		<key>graph</key>
		<dict>
			<key>A</key>
			<array>
				<string>B</string>
				<string>C</string>
				<string>E</string>
			</array>
			<key>B</key>
			<array>
				<string>A</string>
				<string>D</string>
				<string>F</string>
			</array>
			<key>C</key>
			<array>
				<string>A</string>
				<string>G</string>
			</array>
			<key>D</key>
			<array>
				<string>B</string>
			</array>
			<key>E</key>
			<array>
				<string>A</string>
				<string>F</string>
			</array>
			<key>F</key>
			<array>
				<string>B</string>
				<string>E</string>
			</array>
			<key>G</key>
			<array>
				<string>C</string>
			</array>
		</dict>
	</dict>
	</plist>
	
Note that this graph contains a cycle, and that edges are bidirectional.

Fortunately, Xcode provides a graphical property list editor, and you should not have to wrangle XML manually.

![plist Editor](/ps/ps1/img/plist.png)
	
Your task is to write enumerators that traverse the graph in Depth-first and Breadth-first order starting from a given vertex.
	
- Find out what an `NSEnumerator` does. **(Not graded)**

- Implement the class `DepthFirstSearchEnumerator`, which is a subclass of `NSEnumerator` for Depth-first Search. **(20 points)**

The Depth-first Search enumerator should return vertices in pre-order, that is, the order in which they were visited by the algorithm. In the example graph, the order we are looking for is: A, B, D, F, E, C, G.

- Implement the class `BreadthFirstSearchEnumerator`, which is a subclass of `NSEnumerator` for Breadth-first Search. **(20 points)**

The Breadth-first Search enumerator should also return vertices in the order that they were visited. In the example graph, the order we are looking for is: A, B, C, E, D, F, G.

- Create a category for the `NSDictionary` class implementing `Traversable` that contains a selector returning the new `NSEnumerator` class. **(5 points)**

Your file should be named `NSDictionary+Traversable.{h, m}` in the style of Objective-C.

### Problem 4: Testing (15 points)

1. Write sufficient tests to ensure that your Stack, Queue, Depth-first Search, and Breadth-first Search work correctly. **(15 points)**

Your tests can be given as a set of input files (in the respective formats described above) and their corresponding outputs, but any other sensible format will do fine. If your tests are input files, you should describe the scope in a comment appended at the end of the file `main.m`.

While it is a good practice to code defensively, we will not be supplying malformed property lists to your implementation.

*You are not required to use the unit testing framework at this point, however, feel free to read ahead and give it a try.*

#### Running the Driver Program
If you have implemented the skeleton classes correctly, the driver program should run without modification. The following screenshot shows the execution of the driver program on the example graph given in this document.

![Correct output](/ps/ps1/img/driver.png)

### Bonus Problem: Reflection (3 Bonus Points) ###
Please answer the following questions:

1. How many hours did you spend on each problem of this problem set?
2. In retrospect, what could you have done better to reduce the time you spent solving this problem set?
3. What could the CS3217 teaching staff have done better to improve your learning experience in this problem set? 

Submit the answer to this question in the form of a comment appended at the end of the file `main.m`. **(3 bonus points)**

Section 4 - Grading and Submission
--
Please read this section carefully so that you fully understand the grading scheme and the mode of submission!

### Grading Scheme ###
In this module, you are training to become a good software engineer. The first and basic requirement is that your code must satisfy the requirements and be correct. Above and beyond correctness, you are required to write well-documented code. In real software projects, just ensuring that your code can do the job is not sufficient. Remember that if you are doing anything useful at all, the code has to be maintained and the probability that some poor soul will have to come along to read and modify your code is very high. Your goal is to minimize the grief of this poor fella and make him love reading your code.

You also want to minimize the grief that is inflicted on your TAs. In particular, we will be looking out for the following:

- Your submission should adhere to the submission format.
- Your files should compile without errors or warnings.
- Your program should run without crashing over the range of all valid inputs.
- Your code should be well-documented, correctly indented and neat. You should not use magic numbers.  

### Mode of Submission ###
In this assignment, you will be using a pilot locally hosted [GitLab](http://cs3217.comp.nus.edu.sg) instance for submitting your code and receiving feedback. 

Accounts have already been created for you using your matriculation number and the email address you supplied when registering for this module. You should have received an email containing an initial password, and instructions asking you to login and change that password.

*As this is a non-TLS service (due to typical civil service red tape), please choose a strong throwaway password. Do not reuse passwords from your other accounts.*

The Xcode projects for your problem sets, if they are provided, will be located in the group [Problem Sets 2014](http://cs3217.comp.nus.edu.sg/groups/problem-sets-2014). You should first **fork** the project to your own private workspace, and then **clone** the project to your computer.

As with GitHub, you may add an SSH key to your account. However, due once again to the above reason, SSH will only be accessible within the SoC network. (We're working on this; it takes *some* time.) We recommend that you clone using HTTP and configure Git to remember your password for minimum grief.

When you begin working, your Xcode project will grow to contain files that are user-specific, and should not be committed to a revision control system. You can tell Git to ignore files by writing their definitions in `.gitignore` in the root of a Git repository. This has already been done for you, and the definitions we have used are taken from [GitHub](https://github.com/github/gitignore/blob/master/Objective-C.gitignore). 

**Important Note:** All the required files should be inside the Xcode project that you have forked and cloned. We should be able to download the entire repository, import it into Xcode, and run your solution without making additional changes.

Even though your TAs will be reading every single line of your code, we will be doing high-level tests of your code using an automated grading script. Points may be taken off if the script fails due to unauthorised changes you may have made in the driver program.

Clarifications and questions related to this assignment may be directed to the IVLE Forum under the heading **‘Problem Set 1: Hello iPad!’**.