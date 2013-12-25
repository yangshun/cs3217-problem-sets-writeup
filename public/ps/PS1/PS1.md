Problem Set 1
==

*Issue Date: 13 January 2014  
Due Date: 20 January 2014  
Tutorial Date: 24 January 2014*

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

###Milestone 0: Find out how common programming constructs are expressed idiomatically in Objective C. (Not graded)

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

In this section, you will use Xcode to create a project and storyboards to construct a very simple user interface. This assignment requires no coding. It is intended to provide you with a quick introduction to the tools that you’ll be using during the course. Follow this walkthrough and build your first **HelloIPad** application.

**Important Note:** Even though it is possible to complete the first part of the assignment just by following instructions, it is important for you to understand what you are doing in each step, since in the next assignments you will be required to use the same tools.

##### Milestone 1: Create a new project in Xcode (Not graded)

Please follow the step-by-step instructions shown in Gallery 3.1 to create your first iPad app. The detailed instructions for each step is given by the caption below the figures.

TODO: Add screenshots

##### Milestone 2: Run your project in the simulator (Not graded)

Please follow the step-by-step instructions shown in Gallery 3.2 to
run your first iPad app in the simulator. The detailed instructions for each step is given by the caption below the figures.

TOOD: Add screenshots

##### Milestone 3: Understanding the Xcode IDE Layout (Not graded)

Interactive 3.1 shows the overall project layout in Xcode. Xcode is a powerful Integrated Design Environment (IDE).

TODO: Add screenshots

##### Milestone 4: Add library interface elements to your app. (Not graded)

Please follow the step-by-step instructions shown in Gallery 3.3 to
add an interface element to the main view of your app. The detailed instructions for each step is given by the caption below the figures.

TODO: Add screenshots

##### Milestone 5: Add resource files to your project. (Not graded)

Please follow the step-by-step instructions shown in Gallery 3.4 to add an image resource file to your project and add that resource into your app’s main view. The detailed instructions for each step is given by the caption below the figures.

TODO: Add screenshots


Section 3 - Introduction to Objective-C (100 points)
--

In this section, you will be introduced to Object Oriented Programming and collection-types in Objective C through the implementation of graph algorithms. As these algorithms may be relevant to future problem sets, you are advised to design your solutions in a generic and reusable way so that you will not have to waste time in the coming weeks.


### Collections in Objective C


Objective C provides three main collection types

1. `NSArray` describes a linear collection of objects where each object may be accessed by an index
2. `NSDictionary` describes a key-value store where some one *key*-object maps to one *value*-object
3. `NSSet` describes an unordered collection of unqiue objects



Collections are immutable by default. The mutable counterparts of the above are `NSMutableArray`, `NSMutableDictionary`, and `NSMutableSet`. Collections should also be thought of in their abstract sense, rather than their concrete implementation (such as in Java).

##### Milestone 6: What are the selectors used for the comparison operation among keys in `NSDictionary` and objects in `NSSet`?  (10 points)

##### Milestone 7: What is the worst-case time complexity of performing a linear search through an `NSArray`? (5 points)

### FIFO Queue


Your task is to implement a generic FIFO queue.

Since a queue describes a set of operations on an arbitrary data structure, it should be abstracted from its concrete implementation. We have provided a protocol in `Queue.h` that you should implement in a concrete class.

##### Milestone 8: Implement the queue protocol using an `NSMutableArray`. Call the test method `BOOL testQueue(id<Queue> queue)` and demonstrate that it returns `TRUE`. (25 points)

##### Milestone 9: Implement sufficient test cases to ensure that your queue works in all cases described by the protocol. You may make reasonably assuptions where necessary. (10 points)

*You are not required to use the unit testing framework at this point, however, feel free to read ahead and give it a try.*

### Tree Traversal with Enumerators


We may represent a tree as a dictionary that maps vertex labels to arrays of their children.

// TODO:

##### Milestone 10: Implement an `NSEnumerator` that returns an `NSString` containing vertex labels in level-order. (25 points)

##### Milestone 11: Create a category for the `NSDictionary` class that contains a selector returning the new `NSEnumerator` class. (15 points)

##### Milestone 12: Write sufficient test cases to ensure that your algorithm is correct. (10 points)

Coding Style
---

Up to **10 points** may be deducted for issues with coding style.