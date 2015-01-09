Problem Set 1
==

*Issue Date: 12 January 2015  
Due Date: 18 January 2015  
Tutorial Date: Week 2*

Section 1 - Introduction
--
This assignment consists of two parts. In the first part of this assignment, you will be introduced to Xcode, which is the IDE for Mac OS and iOS development. In the second part, you will take the opportunity to learn the basics of the Swift/Objective-C and Cocoa programming language and create a simple command line tool using Xcode.

**Reminder:** Please read the entire problem set before starting.

### Getting Started ###

This assignment (and the rest of the course) assumes that you have access to

* Mac OS X 10.9
* Xcode 6.1
* An Apple Developer account
* An iPad capable of running iOS 8

Strictly speaking, it is sufficient (but *not* recommended) to install and use OS X Command Line Tools.

If you do not have access to a computer running Mac OS X 10.9, you may:

* Use the iMacs in Programming Lab 1. They have already been configured to support course requirements.
* Resourcefully acquire an OS X installer image. This image can be installed on a virtual machine like VMWare Workstation or Virtual Box.

Development in general can be a messy process, and you should consider running your toolchain in a virtual environment if you are working on your primary computer.

### Swift/Objective-C and Cocoa ###

As of iOS 8, Apple introduced a new programming language, Swift. Swift replaces Objective-C as the primary language that will be used to write Mac and iOS software. Swift is intended to be more resilient to erroneous code than Objective-C, and also more concise (meaning you have to type less code). It is possible to use Swift and Objective-C together in apps, but for this course, we will stick with Swift. During this semester, all coding assignments will be done mainly using Swift and a little Objective-C at the start.

If you’re comfortable with basic object-oriented concepts and have used scripting languages before, it should be easy to pick up Swift during CS3217. You should read Apple's introduction to Swift: [The Swift Programming Language](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/). There is also an iBooks version available that is more iPad-friendly.

[Cocoa](https://developer.apple.com/technologies/mac/cocoa.html) is Apple’s native object-oriented API for the Mac OS X operating system. For iOS development, we will be using [Cocoa Touch](https://developer.apple.com/technologies/ios/cocoa-touch.html), a touch-oriented API similar to Cocoa. Cocoa Touch follows a Model-View-Controller (MVC) paradigm.

##### Milestone 0: Find out how common programming constructs are expressed idiomatically in Objective-C and Swift; you will need them for this problem set and subsequent ones (Not graded)

**Objective-C**

- Declaring primitive types
- Declaring and instantiating objects
- Declaring class and instance methods
- Declaring class fields
- Class access specifiers
- Declaring and using interfaces/protocols
- Invoking methods
- Accessing properties
- C-style structures versus objects

**Swift**

- Basic Operators
- Strings and Characters
- Collection Types
- Control Flow
- Functions
- Classes and Structures
- Properties and Methods
- Inheritance
- Initialization and Deinitialization
- Extensions and Protocols
- Generics


Section 2 - Hello iPad! (Not Graded)
--

In this section, you will use Xcode to create a project and storyboards to construct a very simple user interface. This assignment requires no coding. It is intended to provide you with a quick introduction to the tools that you’ll be using during the course. Follow this walkthrough and build your first iOS application.

**Important Note:** Even though it is possible to complete the first part of the assignment just by following instructions, it is important for you to understand what you are doing in each step, since in the next assignments you will be required to use the same tools.

##### Milestone 1: Create a new Xcode project.

![Welcome to Xcode\!](/ps/ps1/img/1-1.png)

1.1 Welcome to Xcode\! Click **Create a new Xcode project** on the lower left part of the welcome panel to create your first iPad app.

![Begin by creating an iOS Single View application.](/ps/ps1/img/1-2.png)

1.2 Begin by creating an iOS Single View application.

![Fill in app details. \(Note: It is important to keep the company identifier as `nus.cs3217`\)](/ps/ps1/img/1-3.png)

1.3 Fill in app details as shown here. You will be prompted to save your project to disk after this step. **Note**: It is important to keep the company identifier as `nus.cs3217` in order for you to run the app on your device.

**Objective-C versus Swift:** Here in the dropdown menu you can choose between either Objective-C, the programming language maintained by Apple for quite some time, and the newly announced multi-paradigm language, Swift. We will show you the instructions for creating this project in both languages. In the following diagram, the result is shown if we selected **Swift**. Select **Objective-C** if you want to do this project in Objective-C.

![Swift. When you are done with the above steps, you should be looking at this page that summaries your app info.](/ps/ps1/img/1-4-1.png)

1.4.1 When you are done with the above steps, you should be looking at this page that summaries your app info.

**Objective-C versus Swift:** This step is (almost) the same for projects written in both Objective-C and Swift. The difference is, of course, the files created. This screenshots shows a project written in Swift. The next screenshot shows an Objective-C version. Compare the created files.

![Objective-C. When you are done with the above steps, you should be looking at this page that summarizes your app info.](/ps/ps1/img/1-4-2.png)

1.4.2 When you are done with the above steps, click on the project name at the top left corner and you will be shown a page that summarizes your app info.

**Objective-C versus Swift:** Screenshot of project created in Objective-C.


##### Milestone 2: Navigate around the IDE.

![The standard editor displays a single file.](/ps/ps1/img/2-1.png)

2.1 The standard editor displays a single file. This screenshot shows the visual storyboard editor. Note the properties panel to the right of the screen. When you are looking at the storyboard file which displays a iPad view, chances are you find the views too big/small so you want to zoom out/in. Try pressing "`shift` + `option` + `command` + `]`" to zoom in and `[` instead of `]` to zoom out.

**Objective-C versus Swift:** This step is the same for both languages.

![The assistant editor is highly recommended for writing code.](/ps/ps1/img/2-2.png)

2.2 The assistant editor is highly recommended for writing code, as you can use a 2-column split view to compare code between files.

**Objective-C versus Swift:** This step is the same for both languages.


![When writing code, the properties panel is replaced by Quick Help, which shows brief documentation of the object under cursor.](/ps/ps1/img/2-3.png)

2.3 When writing code, the properties panel is replaced by **Quick Help**, which shows brief documentation of the object under cursor.

**Objective-C versus Swift:** This step is the same for both languages.

##### Milestone 3: Add library interface elements.

![Add user interface elements from the library by dragging them to the storyboard.](/ps/ps1/img/3-1.png)

3.1 Add user interface elements from the library by dragging them to the storyboard. For now, add a label, and a button. Resize the label such that there is sufficient padding around the text and change its **Alignment** to center-alignment in the **Attributes Inspector**.

**Objective-C versus Swift:** This step is the same for both languages.

![Check the lower right part of Xcode's interface for the UI elements library which you can drag and drop into the storyboard. ](/ps/ps1/img/3-2.png)

3.2 Check the lower right part of Xcode's interface for the UI elements library which you can drag and drop into the storyboard. 

**Objective-C versus Swift:** This step is the same for both languages.

##### Milestone 4: Add some code.

**Objective-C versus Swift:** In this milestone, the difference between Swift project and Objective-C project is relatively big. We will first show how to carry on with Swift, followed by Objective-C.

You need to "link" storyboard elements to their associated View Controller before you can reference them in code.

**Objective-C versus Swift:** The following are instructions for the Swift version:

![Right-click on the label and add a "Referencing Outlet" by dragging the `+` to the View Controller Swift file.](/ps/ps1/img/4-1-1.png)

4.1.1 Select the UI element label, hold the `control` key and drag the label to your code file `ViewController.swift`. Release the mouse button and give it a name, such as `myLabel` for example. After that, click **Connect**. Make sure that your new `@IBOutlet` is created in the outermost scope of class and not within any of the functions. Alternatively, you can right-click on the label, hover over the circle on the right of **New Referencing Outlets** under **Referencing Outlets** and drag the **+** to the View Controller file. 

![Add an Action handler in the same way for "Touch Up Inside".](/ps/ps1/img/4-1-2.png)

4.1.2 Do the same for the UI element button. However, this time in the pop-out window, for the **Connection** field, you should choose **Action**. Give your **Action** a name, such as `myButtonClicked` for example. Alternatively, right-click the button and add an Action handler in the same way for **Touch Up Inside** under **Sent Events**.
![Write a single line of code to change the label's text.](/ps/ps1/img/4-1-3.png)

4.1.3 Here `myLabel` is the name that was given to the UI element label in step 4.1.1, and `myButtonClicked` is the name that was given to the action handler. Write a single line of code 
```
myLabel.text = "Hello, world!"
```
inside the `myButtonClicked` function to change the label's text. 

**Objective-C versus Swift:** The following are instructions for the Objective-C version:

![Right-click on the label and add a "Referencing Outlet" by dragging the `+` to the View Controller file.](/ps/ps1/img/4-2-1.png)

4.2.1 Select the UI element label, hold the `control` key and drag the label to your code file `ViewController.m`. Release the mouse button and give it a name, such as `myLabel` for example. After that, click **Connect**. Make sure that your new `IBOutlet` is created within `@interface` and `@end`. Alternatively, you can right-click on the label, hover over the circle on the right of **New Referencing Outlets** under **Referencing Outlets** and drag the **+** to the View Controller file. 
 
![Add an Action handler in the same way for "Touch Up Inside".](/ps/ps1/img/4-2-2.png)

4.2.2 Do the same for the UI element button. But this time in the pop-out window, **Connection** field, choose **Action**. Give your button a name. Alternatively, right-click the button and add an **Action handler** in the same way for **Touch Up Inside**.

![Write a single line of code to change the label's text.](/ps/ps1/img/4-2-3.png)

4.2.3 Write a single line of code to change the label's text. Here `myLabel` is the name given to the UI element label in step 4.1.1, and `myButtonClicked` is the name given to the action handler.
Note here in `ViewController.m` file, you have both `@interface` and a `@implementation` sections. When you add an action to the button by `control`-dragging the button to @interface section, a method with the name is created in the `@implementation` section. You should add your code in this method in the `@implementation` section. Also note that in Objective-C, string constants are declared in the format `@"Your String Here"`, unlike Swift or Java, where string constants are declared within a pair of quotes. Write a single line of code
```
self.myLabel.text = @"Hello, world!"
```
within the `myButtonClicked:` method.

##### Milestone 5: Run your project in the emulator.

Run your project by clicking on the play button at the top-left of the screen. It may take awhile for the emulator to launch. 

![My First iOS App\!](/ps/ps1/img/4-4.png)

Test that your app works by tapping on the button. Observe that the label's text changes.

**Objective-C versus Swift:** This step is the same for both languages.


![It works\!](/ps/ps1/img/4-5.png)

On lower resolution screens, the height (in pixels) of the iPad may exceed the height of your screen. If this happens, you will need to scroll up and down within the emulator. From the menubar, go to **Window > Scale** and change it to a lower scale if you find it too big.

Holding the `option` key with your cursor over the emulator's "screen" brings out two grey circles representing two touch points. This is useful for debugging pinch and rotate gestures. Pressing `shift` while holding the `option` key will allow you to move the center position of the two points.

The emulator has limitations when testing more complicated gestures, the camera, and network stacks. You should find out about these limitations if your application implements such functionality.

**Objective-C versus Swift:** This step is the same for both languages.

Section 3 - Introduction to Objective-C (100 points)
--

In this section, you will be introduced to Object-Oriented Programming and collection-types in Swift through the implementation of basic Abstract Data Types (ADT) and simple graph algorithms. As these algorithms may be relevant to future problem sets, you are advised to design your solutions in a generic and reusable way so that you can reuse these earlier work in the coming weeks.


### Problem 1: Collections in Swift (10 points)

Swift provides two main collection types, known as arrays and dictionaries. 

- **Arrays** describes an ordered list of objects *of the same type* where each object may be accessed by an index.

- **Dictionaries** store unordered collections of values *of the same type*, which can be referenced and looked up using a unique identifier, also known as a key.

These collections can either be mutable or immutable upon declaration (using `var` for mutable objects and `let` for immutable objects).

Keys in `Dictionary` may be any instance of an `AnyObject`. Which selector does `Dictionary` use to test for the uniqueness of keys?  **(10 points)**



### Problem 2: Standard Data Structures (30 points) ###

Swift does not provide Stacks and Queues ADTs natively. Your task is to implement a generic LIFO stack, and a generic FIFO queue.

**Fork** the Problem Set 1 repository into your account on Bitbucket ([https://bitbucket.org/cs3217/cs3217-problem-set-1](https://bitbucket.org/cs3217/cs3217-problem-set-1)) and **clone** it into your computer to begin working. 

The Xcode project that you would have just cloned contained some unit tests. We will be using this driver program to grade your assignment automatically. 

#### Property Lists ####

[Property lists](http://en.wikipedia.org/wiki/Property_list), also called "plists", are text files that store serialised objects. They store basic data types such as Strings, Numbers, and Boolean values, but are also capable of representing dates, arrays, dictionaries, and binary data (encoded as Base64 ASCII). 

#### Running the Compiled Binary ####

IDE-generated data, including build files, are stored in your project's subdirectory at `~/Library/Developer/Xcode/DerivedData`. When you build (`Cmd` + `B`) your application, the compiled binary will be written to `./Build/Products`.

To view that executable, from the Project Navigator, expand the **Products** folder and you will see the file `CS3217-PS1`. Click on the file and examine the **Full Path** in the right panel (File Inspector). You may `cd` to that directory in your terminal and run the application from there. If you do not have the input `.plist` files in the same directory, you will need to specify a fully qualified path.

#### Stacks and Queues ####

1. A skeleton class for the Stack has been provided in  `Stack.swift`. Implement the `Stack` by filling up the method implementations in `Stack.swift` according to the descriptions. You should not change the method signatures provided. **(15 points)**

2. A skeleton class for the Queue has been provided in  `Queue.swift`. Implement the `Queue` by filling up the method implementations in `Queue.swift` according to the descriptions. You should not change the method signatures provided. **(15 points)**

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
	
Fortunately, Xcode provides a graphical property list editor, and you should not have to wrangle XML manually.

![plist Editor](/ps/ps1/img/plist.png)

#### Output ####

If you have implemented the skeleton classes correctly, the driver program should run without modification. The following screenshot shows the execution of the driver program with the stack and queue examples given in the skeleton project.

![Output for stack and queue](/ps/ps1/img/output-stack-queue.png)

The output of the driver program in both cases is a representation of the state of the stack or queue after the sequence of methods described in the respective property list has been invoked.

The top of the stack, or front of the queue, is on the left.

### Problem 3: Graph Traversal (45 points)

We may represent a **general undirected graph** as an adjacency list implemented in the form of a dictionary that maps vertex labels to arrays of their neighbours.

Consider the following graph taken from [Wikipedia](http://en.wikipedia.org/wiki/File:Graph.traversal.example.svg):

![Example Graph](/ps/ps1/img/graph.png)

The adjacency list for this graph in the format of a property list would be as follows. The key `start` represents the start vertex of the traversal described by this test file, and the key `graph` contains a dictionary representing the adjacency list of the graph. Each key in this dictionary represents a vertex in the graph, and its corresponding array represents the vertices that it is adjacent to.

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
	
Your task is to write sub-classes of `NSEnumerator`s that traverse the graph in Depth-first and Breadth-first order starting from a given vertex. Neighbours of a node will be traversed in the order of nodes that appear in the `plist` file.

The driver program will parse property lists into their constituent Swift objects. Your implementation only needs to deal with graphs represented as `Dictionary`s. 


- Implement the class `DepthFirstSearchEnumerator`, which is a subclass of `NSEnumerator` for Depth-first Search. **(20 points)**

The Depth-first Search enumerator should return vertices in pre-order, that is, the order in which they were visited by the algorithm. In the example graph, the order we are looking for is: **A, B, D, F, E, C, G**.

- Implement the class `BreadthFirstSearchEnumerator`, which is a subclass of `NSEnumerator` for Breadth-first Search. **(20 points)**

The Breadth-first Search enumerator should also return vertices in the order that they were visited. In the example graph, the order we are looking for is: **A, B, C, E, D, F, G**.

- Create a category for the `Dictionary` class implementing `Traversable` that contains a selector returning the new `NSEnumerator` classes. **(5 points)**

Your files should be named `Dictionary+Traversable.swift` in the style of Swift.

The following screenshot shows the output from running the driver program on the given graph.

![Output for bfs and dfs](/ps/ps1/img/output-bfs-dfs.png)

### Problem 4: Testing (15 points)

Write sufficient tests to ensure that your Stack, Queue, Depth-first Search, and Breadth-first Search work correctly. **(15 points)**

We Provide three unit test cases (`StackTest.swift`, `QueueTest.swift` and `GraphTest.swift`) for your testing purpose and you should not modify it unless specified. 

We also provide three respective plist and expect files which are used to test in three unit test cases. 

You can also create your own plist and expect files. Remember to add plist and expect files before executing the testing drive program.

Instruction:
**Targets -> CS3217-PS1-Swift -> Building Phases -> Copy Bundle Resources -> Add respective plist and expect files**.

One example is given here:

![Example Graph](/ps/ps1/img/add.png)


And you need to change plist and expect files for different testing, you just need to substitute file name.

One example is given here:

![Example Graph](/ps/ps1/img/test.png)

However, "stack" type plist should only be passed into `StackTest.swift` to run test case, "queue" type plist should only be passed into `QueueTest.swift` to run test case and "graph" type plist should only be passed into `GraphTest.swift` to run test case

Note: 

**a.** Only after you implement `DepthFirstSearchEnumerator.swift` and `BreathFirstSearchEnumerator.swift`, you can comment back the commented part to test. 


![Example Graph](/ps/ps1/img/comment.png)

**b.** After you implement `DepthFirstSearchEnumerator.swift` and `BreathFirstSearchEnumerator.swift`, remember to add them to compile resources: **Targets -> CS3217-PS1-SwiftTests -> Build Phases -> Compile Sources -> Add**.


![Example Graph](/ps/ps1/img/compile.png)

### Bonus Problem: Reflection (3 Bonus Points) ###
Please answer the following questions:

1. How many hours did you spend on each problem of this problem set?
2. In retrospect, what could you have done better to reduce the time you spent solving this problem set?
3. What could the CS3217 teaching staff have done better to improve your learning experience in this problem set? 

Submit your answers to these bonus problems at [http://tiny.cc/cs3217-ps1](http://tiny.cc/cs3217-ps1). Thanks!

Section 4 - Grading and Submission
--
Please read this section carefully so that you fully understand the grading scheme and the mode of submission!

### Grading Scheme ###
In this module, you are training to become a good software engineer. The first and basic requirement is that your code must satisfy the requirements and be correct. Above and beyond correctness, you are required to write well-documented code. In real software projects, just ensuring that your code can do the job is not sufficient. Remember that if you are doing anything useful at all, the code has to be maintained and the probability that some poor soul will have to come along to read and modify your code is very high. Your goal is to minimise the grief of this poor fella and make him love reading your code.

You also want to minimise the grief that is inflicted on your tutors. In particular, we will be looking out for the following:

- Your submission should adhere to the submission format.
- Your files should compile without errors or warnings.
- Your program should run without crashing over the range of all valid inputs.
- Your code should be well-documented, correctly indented and neat. You should not use magic numbers.  

### Mode of Submission ###
In this assignment, you will be using Bitbucket for submitting your code and receiving feedback. 

Accounts have already been created for you using your matriculation number and the email address you supplied when registering for this module. You should have received an email containing an initial password, and instructions asking you to login and change that password.

The Xcode projects for your problem sets, if they are provided, will be located under the [private repositories section](https://bitbucket.org/cs3217/profile/repositories?visibility=private). You should first **fork** the project to your own private workspace, and then **clone** the project to your computer.

Please make yourself familiar with Git as you will be using Git to submit your work, receive feedback, and collaborate with others on the final project. Github offers a short crash course at [https://try.github.io/](https://try.github.io/).

When you begin working, your Xcode project will grow to contain files that are user-specific, and should not be committed to a revision control system. You can tell Git to ignore files by writing their definitions in `.gitignore` in the root of a Git repository. This has already been done for you, and the definitions we have used are taken from [GitHub's Objective-C gitignore](https://github.com/github/gitignore/blob/master/Objective-C.gitignore) and [GitHub's Swift gitignore](https://github.com/github/gitignore/blob/master/Swift.gitignore). 

**Important Note:** All the required files should be inside the Xcode project that you have forked and cloned. We should be able to download the entire repository, import it into Xcode, and run your solution without making additional changes.

Even though your tutors will be reading every single line of your code, we will using our own unit tests to test your implementations. Hence is it important that you do not change the method signatures of the given code. Points are likely to be taken off if our unit test fails due to unauthorised changes you may have made in the given skeleton code.

Clarifications and questions related to this assignment may be directed to the IVLE Forum under the heading **‘Problem Set 1: Hello iPad!’**.