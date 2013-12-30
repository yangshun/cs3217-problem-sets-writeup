Problem Set 1
==

*Issue Date: 19 January 2014  
Due Date: 27 January 2014  
Tutorial Date: Week 2*

Section 1 - Introduction
--
This assignment consists of two parts. In the first part of this assignment, you will be introduced to Xcode, which is the IDE for Mac OS and iOS development. In the second part, you will take the opportunity to learn the basics of the Objective-C programming language and create a simple command line tool using Xcode.

**Reminder:** Please read the entire problem set before starting.

### Getting Started ###

This assignment (and the rest of the course) assumes that you have access to

* Mac OSX 10.9
* Xcode 5
* An Apple Developer account
* An iPad capable of running iOS 7

Strictly speaking, it is sufficient (but *not* recommended) to install and use OSX Command Line Tools.

If you do not have access to a computer running Mac OSX 10.9, you may

* Use the iMacs in the programming lab. They have already been configured to support course requirements
* Resourcefully acquire an OSX installer image. This image can be installed on a virtual machine like VMWare Workstation or Virtual Box

Development in general can be a messy process, and you should consider running your toolchain in a virtual environment if you are working on your primary computer.

### Objective-C and Cocoa ###

Objective-C is the primary language that will used to write Mac and iOS software. During this semester, all coding assignments will be done using Objective-C.

If you’re comfortable with basic object-oriented concepts and the C language, the extensions provided by Objective-C should be quite natural, and it should be easy to pick up Objective-C during CS3217. You should read Apple's [Introduction to Objective C \(PDF\)](http://developer.apple.com/library/mac/documentation/Cocoa/Conceptual/ObjectiveC/ObjC.pdf).

[Cocoa](https://developer.apple.com/technologies/mac/cocoa.html) is Apple’s native object-oriented API for the Mac OSX operating system. For iOS development, we will be using [Cocoa Touch](https://developer.apple.com/technologies/ios/cocoa-touch.html), a touch-oriented API similar to Cocoa. Cocoa Touch follows a Model-View-Controller (MVC) paradigm.

##### Milestone 0: Find out how common programming constructs are expressed idiomatically in Objective C. (Not graded)

* Declaring primitive types
* Declaring and instantiating objects
* Declaring class and instance methods
* Declaring class fields
* Class access specifiers
* Declaring and using interfaces/protocols
* Invoking methods
* Accessing properties
* C-style structures versus objects


Section 2 - Hello iPad!
--

In this section, you will use Xcode to create a project and storyboards to construct a very simple user interface. This assignment requires no coding. It is intended to provide you with a quick introduction to the tools that you’ll be using during the course. Follow this walkthrough and build your first iOS application.

**Important Note:** Even though it is possible to complete the first part of the assignment just by following instructions, it is important for you to understand what you are doing in each step, since in the next assignments you will be required to use the same tools.

##### Milestone 1: Create a new Xcode project. (Not graded)

![Welcome to Xcode\!](/ps/ps1/img/1-1.png)

Welcome to Xcode\!

![When you have finally decided to start working, begin by creating an iOS Single View application.](/ps/ps1/img/1-2.png)

When you have finally decided to start working, begin by creating an iOS Single View application.

![Fill in app details. \(Note: It is important to keep the company identifier as `nus.cs3217`\)](/ps/ps1/img/1-3.png)

Fill in app details. \(Note: It is important to keep the company identifier as `nus.cs3217`\) You will be prompted to save your project to disk after this step.

##### Milestone 2: Navigate around the IDE. (Not graded)

![The standard editor displays a single file.](/ps/ps1/img/2-1.png)

The standard editor displays a single file. This screenshot shows the visual storyboard editor. Note the properties panel to the right of the screen.

![The assistant editor is highly recommended for writing code.](/ps/ps1/img/2-2.png)

The assistant editor is highly recommended for writing code. It shows header and implementation files in a 2-column split view by default, but can also be made to show any arbitrary file.

![When writing code, the properties panel is replaced by Quick Help, which shows brief documentation of the object under cursor.](/ps/ps1/img/2-3.png)

When writing code, the properties panel is replaced by Quick Help, which shows brief documentation of the object under cursor.

##### Milestone 3: Add library interface elements. (Not graded)

![Add user interface elements from the library by dragging them to the storyboard.](/ps/ps1/img/3-1.png)

Add user interface elements from the library by dragging them to the storyboard.

Note how the properties panel expands to show further details when a UI element is selected. Add both a label, and a button. 

##### Milestone 4: Add some code. (Not graded)

You need to "link" storyboard elements to their associated View Controller before you can reference them in code.

![Right-click on the label and add a "Referencing Outlet" by dragging the `+` to the View Controller header file.](/ps/ps1/img/4-1.png)

Right-click on the label and add a "Referencing Outlet" by dragging the `+` to the View Controller header file.

![Add an Action handler in the same way for "Touch Up Inside".](/ps/ps1/img/4-2.png)

Add an Action handler in the same way for "Touch Up Inside".

![Write a single line of code to change the label's text.](/ps/ps1/img/4-3.png)

Write a single line of code to change the label's text.

##### Milestone 5: Run your project in the emulator. (Not graded)

Run your project by clicking on the play button at the top-left of the screen. It may take awhile for the emulator to launch. 

![My First iOS App\!](/ps/ps1/img/4-4.png)

Test that your app works by tapping on the button. Observe that the label's text changes.

![It works\!](/ps/ps1/img/4-5.png)

Note that on lower resolution screens, your emulator may not show the faux iPad bezel. In addition, the height (in pixels) of the iPad may exceed the height of your screen. If this happens, you will need to scroll up and down emulator.

Holding the `Alt` key with your cursor over the emulator's "screen" brings out two gray circles representing two touch points. This is useful for debugging pinch and rotate gestures. 

Section 3 - Introduction to Objective-C (100 points)
--

In this section, you will be introduced to Object Oriented Programming and collection-types in Objective C through the implementation of graph algorithms. 
As these algorithms may be relevant to future problem sets, you are advised to design your solutions in a generic and reusable way so that you will not have to waste time in the coming weeks. You are free to modify any skeleton files provided unless otherwise stated. Obviously, protocols must *not* be altered.


### Collections in Objective C


Objective C provides three main collection types

- `NSArray` describes a linear collection of objects where each object may be accessed by an index.
- `NSDictionary` describes a key-value store where some one *key*-object maps to one *value*-object.
- `NSSet` describes an unordered collection of unique objects.



Collections are immutable by default. The mutable counterparts of the above are `NSMutableArray`, `NSMutableDictionary`, and `NSMutableSet`. Collections should also be thought of in their abstract sense, rather than their concrete implementation (such as in Java).

##### Milestone 6: What are the selectors used for the comparison operation among keys in `NSDictionary` and objects in `NSSet`?  (10 points)

##### Milestone 7: What is the worst-case time complexity of performing a linear search through an `NSArray`? (5 points)

### FIFO Queue


Your task is to implement a generic FIFO queue.

Since a queue describes a set of operations on an arbitrary data structure, it should be abstracted from its concrete implementation. We have provided a protocol in `Queue.h` that you should implement in a concrete class.

##### Milestone 8: Implement the queue protocol using an `NSMutableArray`. Call the test method `BOOL testQueue(id<Queue> queue)` and demonstrate that it returns `TRUE`. (25 points)

##### Milestone 9: Implement sufficient test cases to ensure that your queue works in all cases described by the protocol. You may make reasonably assuptions where necessary. (10 points)

*You are not required to use the unit testing framework at this point, however, feel free to read ahead and give it a try.*

### Property Lists

[Property lists](http://en.wikipedia.org/wiki/Property_list), also called "plists", are text files that store serialised objects. They store basic data types such as Strings, Numbers, and Boolean values, but are also capable of representing dates, arrays, dictionaries, and binary data (encoded as Base64 ASCII). 

In OS X and iOS, `.plist` files are most commonly used to store program settings, and may be seen as analogous to `.ini` files in Windows. 

#### Tree Traversal
We may represent a rudimentary tree using the constructs supported by property lists with an adjacency list. Keys represent vertex labels, and values are arrays of other vertex labels corresponding to children. 

This tree

	  a
	 / \
	b   c
	     \
	      d

would be represented as an abstract dictionary like

	{ 'a': [ 'b', 'c' ], 'b': [ ], 'c': [ 'd' ] }
		
The (Apple) property list would look like

	<?xml version="1.0" encoding="UTF-8"?>
	<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
	<plist version="1.0">
	<dict>
	  <key>a</key>
	  <array>
	    <string>b</string>
	    <string>c</string>
	  </array>
	  <key>b</key>
	  <array/>
	  <key>c</key>
	  <array>
	    <string>d</string>
	  </array>
	  <key>d</key>
	  <array/>
	</dict>
	</plist>
	
Your task is to perform a level-order traversal (breadth-first search from the root) of a tree, given a starting vertex. 

To reduce ambiguity, vertices should be returned in the order which they occur in the property list. For the given example, the correct sequence is `[ a, b, c, d ]`. The alternative order of `[ a, c, b, d ]` will be treated as incorrect.

We have provided a protocol in `Traversable.h` that you should implement in an `NSDictionary` category. 

##### Milestone 10: Create a category for the `NSDictionary` class that implements the `Traversable` protocol. You should name your file `NSDictionary+Traversable.{h,m}` in the Objective C naming convention. Call the test method `BOOL testTraversable()` and demonstrate that it returns `TRUE`. (40 points)

##### Milestone 11: Write sufficient test cases to ensure that your algorithm is correct. (10 points)

### Bonus Problem: Reflection (3 Bonus Points) ###
Please answer the following questions:

1. How many hours did you spend on each problem of this problem set?
2. In retrospect, what could you have done better to reduce the time you spent solving this problem set?
3. What could the CS3217 teaching staff have done better to improve your learning experience in this problem set? 
Submit the answer to this question in the form of a comment appended at the end of your code. (3 bonus points)

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
In this assignment, you will be using [GitHub](https://github.com) for submitting your code and receiving feedback. The required files TODO: Overlaps.m, PEShape.h, PERectangle.h and PERectangle.m should be in a single directory called `ps01`. This directory should be inside the root directory of the private repository assigned to you. You must upload all your work to the master branch of this remote repository. You will be graded on the latest commit on the master branch before the deadline.

The following is a typical workflow to set up the integration with Xcode.
1. Use the git clone command to get a local copy of your remote repository located at `https://github.com/NUS-CS3217-AY1213/<yourreponame>`. This is a one-time operation and should not be repeated for every PS. For successive problem sets, you would just be creating appropriate directories inside this repository as mentioned above.
2. Create a new subdirectory called `ps01` in your local repository. Use the `git add` command to track it.
3. Create a new Xcode project for this assignment and save it to `ps01`. Xcode will automatically inherit the git repo settings, following which you can push/pull/merge etc. to the remote repo.
4. Once you are satisfied with your work, push your changes to the master branch using Xcode.

When you build your project, a directory called build containing the binaries appears in your project folder. It is needless and time-consuming to have git upload these files to the remote repo, so you can ignore this directory when syncing with the remote. The way to do this is add a file called `.gitignore` containing the line build/ to the root directory of your local repository. This line is called a pattern or rule, and tells git to ignore any directory named build anywhere below the current level in the directory tree. You can add more rules to this file to define which files or directories you want git to ignore.

**Important Note:** All the required files should be directly inside the `ps01` directory. Even though your TAs will be reading every single line of your code, we will be compiling and doing high-level tests of your code using an automatic script. You must also include all the files we specified or the scripts might fail. If you fail to comply with our instructions, points will be taken off.

Clarifications and questions related to this assignment may be directed to the IVLE Forum under the heading **‘Problem Set 1: Hello iPad!’**.
