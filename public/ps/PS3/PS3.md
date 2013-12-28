Problem Set 3
==

*Issue Date: 09 February 2014  
Due Date: 17 February 2014  
Tutorial Date: Week 5*

Section 1 - Introduction
--
In this problem set, you will build upon what you had done in the previous problem set to implement a simple application in order to better understand the MVC design pattern, handling gestures, and file operations/persistent storage. We also want you to consider different ways of implementing the requirements for this problem set before you decide on the final implementation.

You will also design and implement a few simple objects. Some specifications will be given, but you will not be given the full set. You are expected to add the appropriate interfaces and specifications to complete the problem set. Please ensure that you document your code according to the standards of CS3217. Each new class should have an overview and the procedures should have the appropriate clauses. Typically only the header (.h) files need to have the procedural comments, since people typically need only to refer to your header files to use the classes you implement. However to make grading easier for your TAs, please also replicate the comments in the .m files (just like you had seen in the previous problem sets).

**Reminder**: Please read the entire problem set before starting.

When programming a new game, you usually start by implementing some basic features and subsequently enhance it with more complex features. As the game grows, the code gets more complicated and the classes will get bigger. To avoid ending up with a mess of spaghetti code, we typically decouple the rendering from the logic. Doing so will also allow you to let the game logic run at a different speed than the rendering. Actually, the game logic will know nothing about the rendering, so it does not matter how the game is displayed (2D, 3D, ASCII art or whatever). The rendering however depends on the logic, because it needs info on how/where to display everything. Typically, all the rendering is done in the view module.

The game logic is typically subdivided into a model and a controller. The model keeps track of the objects in the game world, and knows nothing about displaying, user input, etc. It just implements all the world rules, and how entities interact with each other. The controller knows about the model and can manipulate it depending on the external inputs.

**Good Advice**: Please start working on this problem set early. If not, you will live to regret.

### Model-View-Controller (MVC) ###

In this problem set you will familiarise yourself with the **Model-View-Controller (MVC)** design pattern. In MVC, the logic of the application is separated from the user interface such that development, testing and maintenance of these modules are independent. An MVC application is a collection of model/view/controller triads, each responsible for a different UI element.

The **model** manages the behavior and the data of the application, provides information to the view about its state, and updates its stated according to the controller. The model may notify observers (such as views) when the information data changes so that they can render the updated state.

The **view** renders the model into a form suitable for interaction, typically by user interface elements. It is possible to have multiple views for a single model for different purposes.

The **controller** receives input from the user and instructs the model and view to perform actions based on the input.

The Cocoa and Cocoa Touch frameworks encourage the use of the MVC pattern. Interface Builder constructs views, and connects them to controllers via *Outlets* and *Actions*. In this problem set, you will develop a level designed for a game called Bubble Blast Saga by conforming to MVC design pattern.
￼
### Bubble Blast Saga Level Designer (MVC) ###

The following is a brief overview of the game that you will be building called Bubble Blast Saga. When launching the game, the user is presented with the interface, with an isometric grid-like structure where the bubbles will be placed. A palette at the bottom will allow the designer to choose the type of bubble he wants to design the grid with (blue, red, green, orange). The palette also contains an eraser used to clean the bubbles off the grid. After adding the bubbles onto the grid, the user can use the **SAVE** button to store the current grid bubbles in a file on the iPad. The **LOAD** button can be used to load and restore the previously saved level, and the **RESET** button will clear all the bubbles from the grid. Once the user is satisfied with the level design, he can start the game by pressing the **START** button (to be implemented in the upcoming problem sets).

In the game, the user specifies the direction of a new bubble to shot. The bubble will then interact with the existing bubbles in the grid according to the game engine that you will build in the next problem set. If the shot bubble touches another bubble with the same colour as its own, and these bubbles form a group of 3 or more bubbles, then all the connected bubbles of this colour are destroyed. The objective of the game is to destroy all the bubbles from the grid by making groups of 3 or more. In this problem set, the **START** button will be disabled. You will only have to build a rudimentary level designer.

The features of the level designer that you are expected to implement include the following:

* Reset, save and load a game level;
* An object palette from which the user can select the bubble colour or the eraser;
* Fill the grid with the bubbles (pan gesture);
* Change the colour in the grid in a round-robin fashion (single-tap gesture);
* Delete bubbles from the grid (long-press gesture);


Section 2 - Bubble Blast Saga Level Designer
--

### Problem 1: Create the Bubble Palette (10 points) ###

To create the palette, you need to add a new view, palette, to the main view. The palette will contain 4 bubbles (blue, red, green, orange) that the user can choose to fill the grid with and an eraser to delete bubbles. These images should stay in the palette throughout the design phase. You can find the necessary graphic files for the game objects in the archive for this problem set. Image 5.1 is a sample screenshot of the level designer. You are however free to redesign the layout of the level designer as long as you satisfy the basic requirements.

From the bubble palette, the user taps to select the type of bubble he wants to use to fill the grid or taps the eraser to delete the bubble from the grid.

### Problem 2: Create the Bubble Grid (10 points) ###

Your next task is to create an isometric grid. The grid should have 12 columns and should be tightly packed as seen in the previous image (the number of rows is up to you to decide). This grid will indicate all the possible positions of the bubble and would be used by the designer to design a game level by filling it with bubbles.

### Problem 3: Explain your Design (40 points) ###

Before you begin, please spend some time understanding the requirements of this problem set. Think about the following questions: What objects do you need to implement? How will the objects interact with your main controller? How do you best organize the code for these objects? Are there alternatives? How will you add new game objects?

Once you have decided on the best way to organize your code, please answer the following questions by including a PDF file `design.pdf` at the root directory of your project folder.

1. How did you apply the MVC pattern in this problem set? Explain how you decided to organize the code for your game objects with an entity-relationship diagram for your implementation of the game. With the entity-relationship model diagram as a start, build a module dependency (class) diagram for the entire project. The entity-relationship model is an abstract and conceptual representation of your data. An entity is a unique thing that can exist independently in your design. Each entity must have a set of unique attributes. A relationship captures how two ore more entities are related to each other. Relationships also may have attributes. The entity-relationship diagram shows graphically the entity and the relationship sets, including the cardinality of the relationship (e.g. one-to-one, one-to-many, many-to-one). Please follow the conventions as discussed in lecture. **(10 points)**

2. Explain why you decided on your chosen design over alternative designs. **(5 points)**

3. How would you add a new “projectile” object - the launched bubble, to the game? (To be done later) **(5 points)**

4. How do you plan to integrate the bubble objects with a game engine? **(10 points)**

5. What other functionalities do you think you might want to add to the game later and how can you extend your code to support these new features, other than what has been specified in this problem set? Give two concrete examples of changes you can make to your code as well as the structure of your classes). **(10 points)**


***Self-check:***
A correct implementation of the MVC framework has the following properties:

* the model knows about nobody
* the view knows about the model (but accesses it only through the controller)
* the controller knows about the the view and the model
* the controller observes the view

### Problem 4: Implementing the Bubble Objects (80 points) ###

You will be using the MVC pattern to implement the game objects. Thus, a game object is represented by the triad: **model**, to store the state of the object; **view**, to represent the object on the screen; and **controller**, to manage the model and the view.

- **Model** - There are two important aspects regarding the object model. In this problem set, you are concerned mostly with the position of the object on the screen, such that you can save and restore the object to that position using the buttons on the tab bar created in the walkthrough at the start of this problem set. However, be aware that for the next problem set the game objects state will be more complex as you develop a representation required for the physics engine. (10 points)

- **View** -  Rendering to the screen is handled by the view. It uses the model to know where to draw everything. The view doesn’t have any other functionality than this. You are provided with the required sprites in the attached archive. A sprite is an image or animation that is going to be integrated into a larger scene, such as our game. Here you will find included the image sprites. (10 points)
 - `bubble-blue.png`, `bubble-red.png`, `bubble-orange.png`, `bubble-green.png` are image sprites. These are the bubble images that will be used to design the game level. The default size of the bubble frame is 160x160 pixels.

  **Note:** If you use the images in their default sizes, the palette and the grid will have to be very big. Thus, the views placed in the palette/grid should be scaled down to a reasonable smaller dimension. The sizes of the bubbles in the palette and grid do no have to be the same, as the palette is just for the designer to select the type of bubble  to be used to fill the grid. 

- **Controller** - The controller handles the user input and manipulates the model. First it checks for user input, then it might query the view to see which on-screen objects are being manipulated by the user, and finally it changes the model accordingly. Since all objects respond in a similar way to the user input (for example: tap on the palette, long-press to delete, tap to change type, drag on the grid to fill with bubbles), you are given the interface for an abstract class representing a game object controller. 

 You need to complete the implementation of the abstract class (30 points) and then create subclasses with the additional requirements for each bubble type (30 points). For this problem set, there is only one basic bubble type with different colours. Eventually however, over the next problem sets, you would be subclassing this abstract class to create different types of games bubbles (for example, special power bubbles) that would have different behaviour than the basic bubble types. The interface is found in the file `GameBubble.h`. The subclass implementation be should contained in the file `GameBubbleBasic.m`. **(30 points)**

- **Touch Gestures**. To implement the drag, single tap and long-press, you can use gesture recognizers. For dragging, you can use `UIPanRecognizer`, for touch/double-tap you can use `UITapGestureRecognizer` and for long-press you can use `UILongPressGestureRecognizer`. An example use of gesture recognisers is the following **(30 points)**: 

        // This is required for touch interaction with the view
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panHandler:)];
        panGesture.minimumNumberOfTouches = 1;
        panGesture.maximumNumberOfTouches = 1;
        [view addGestureRecognizer:panGesture];

- Supported Operations:
 - Select a bubble colour from the palette (Single Tap gesture)
 - Drag finger across main grid to fill the cells up with the selected bubble colour or erase a cell if the eraser was chosen in the palette (Pan gesture)
 - Tap a cell to cycle through bubble colours (Single Tap gesture)
 - Quick erasure of a cell (Long-press gesture)

### Problem 5: Saving and Loading Game Levels. (50 points) ###

Finally, you have to implement the reset/save/load functionality for the level designer. You are to design your format for storing the game objects and decide how you want to store the objects. Make sure you implement the ability to save and load from different files, as well to modify and re-save a level. Please explain how you chose to implement the save/load function in `design.pdf`. Please argue that your implementation is the best one among all the alternatives you considered.

There are five ways to maintain data persistency on iOS:

* Property lists
* Object archives
* Manual encoding
* SQlite database
* Core Data

In this problem set, we will briefly discuss the first three. You should go and learn about the other two ways on your own. 

All applications in iOS are sandboxed. As such, applications can only read and write data from several folders. The `Documents` folder should be used for persistent data since it will get backed up regularly. The `Cache` folder can be used to store information available to the application between launches, but it’s not backed up by iTunes. Lastly, the `tmp` folder is available only when the application is running. You can find the path of the `Documents` using the `NSSearchPathForDirectoriesInDomains()` function and append that path to your file names.

You can choose to save your data either using a single file, or using multiple files. We will discuss only the case of single file since it might be easier to implement. You start by having one root object (e.g. an `NSArray` or `NSDictionary`) which you populate with all the data that have to be persisted. When saving, you rewrite the single file with the contents of the root directory.

**Property Lists** - Property lists are convenient because their representation is in XML. As such, you  can view and edit files manually using *Xcode* or the *Property List Editor* application. You can create  and write both `NSArray` and `NSDictionary` containing any object as long as the objects are serializable. Although any object can be made serializable, only certain objects can be placed in the Objective-C collection classes, such as: `NSArray, NSMutableArray, NSDictionary, NSMutableDictionary, NSData, NSMutableData, NSString, NSMutableString, NSNumber, NSDate`. If you can build ￼your model using only these objects (NOTE: look at the documentation for `NSData`) then you can save your entire game data using the collection method `writeToFile:atomically:`.

**Object Archives** - One of the problems with property lists is that custom objects cannot be serialized. In Cocoa, “archiving” refers to a more generic serialization that any object can implement. In fact, any object model should support archiving since this allows you any model object to be saved and restored. As long as every property you implement in your class is either a scalar (int, float etc.) or an object that conforms to the `NSCoding` protocol, you can archive your objects completely. To make an object conform to the `NSCoding` protocol, you must implement two methods, one to encode your object into an archive, and one to create your object by decoding it from a file:

    - (void)encodeWithCoder:(NSCoder*)coder {
        // This tells the archiver how to encode the object
        [coder encodeObject:self.strVar forKey:@"theStringVariable"];
        [coder encodeInt:self.intVar forKey:@"theIntVariable"];
    }

    - (void)initWithCoder:(NSCoder*)decoder {
    	// This tells the unarchiver how to decode the object
        self.strVar = [decoder decodeObjectForKey:@"theStringVariable"];
        self.intVar = [decoder decodeIntForKey:@"theIntVariable"];
    }

To actually store your data then your have to create an instance of `NSMutableData` to hold the encoded data and then create an `NSKeyedArchiver` instance to save the data to a file:

    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:model forKey:@"modelKeyString"];
    [archiver finishEncoding];
    BOOL success = [data writeToFile:@"/path/file/" atomically:YES];

Restoring an object from a file is similar, using an `NSKeyedUnarchiver` object and its `decodeObjectForKey:` method.

**Saving Images** - Because the `UIImage` class does not implement the `NSCoding` protocol by default, you need to extend it using an Objective-C concept known as *categories*, and add these methods yourself. As before, to encode an object you would do:

    NSData *imageData = UIImagePNGRepresentation(self);
    [coder encodeObject:imageData forKey:@"image"];

And to decode it:

    NSData *imageData = [coder decodeObjectForKey:@"image"];
    return [UIImage imageWithData:imageData];

**Manual Encoding** - The general idea in this approach is to open a file and to pass the handler to each object for the object to write itself into the file using a custom format. You will need to assign a unique identifier (type) to each object and write the type of the object to file before calling the object to write itself. To reconstruct objects, you will require a factory function that will read the file for the object type, create an associated empty object and then pass the file handle to the object for the object to initialize its state. Effectively, each object must support a `read` and a `write` method (which you will have to define yourself).

### Problem 6: Testing (30 points) ###

Testing is an integral part of software engineering. Since you are not implementing any complicated ADTs in this assignments, unit tests are probably not particularly helpful. That said, you are supposed to implement a large number of features and it is important for you to test your final code to make sure that your application meets the stated requirements. The way to do this is to start from a hierarchy and then break down into smaller and more specific cases. For example:

* Black-box testing
  
 - Test implementation of file operations  
 - Save 
 - ··· 
 - Test implementation of game: 
     - Drag to fill the grid cells
     - ...
￼
* Glass-box testing 
 

Please come up with your testing strategy and describe it in `design.pdf.` Of course, you should actually test your application as you have described instead of just listing down what you think you ought to test! :-)  

### Bonus Problem: Reflection (3 Bonus Points) ###

Please answer the following questions:

1. How many hours did you spend on each problem of this problem set?
2. In retrospect, what could you have done better to reduce the time you spent solving this problem set?
3. What could the CS3217 teaching staff have done better to improve your learning experience in this problem set?


Your answers to these questions should be appended at the end of `design.pdf.`

Section 3 - Grading and Submission
--
In this module, you are training to become a good software engineer. The first and basic requirement is that your code must satisfy the requirements and be correct. Above and beyond correctness, you are required to write well-documented code. In real software projects, just ensuring that your code can do the job is not sufficient. Remember that if you are doing anything useful at all, code has to be maintained and the probability that some poor soul will have to come along to read and modify your code is very high. Your goal is to minimize the grief of this poor fella and make him love reading your code.

### Grading Scheme ###

For this problem set, testing/grading will be done by running the project in the simulator. You should also probably upload the application to your iPad to make sure that the gesture code works correctly. We will be looking at the following:

* Your submission should adhere to the submission format.
* Your project should build without errors or warnings.
* Your project should run without crashing.
* Each of the sections above will be considered to verify that you’ve completed the problem set correctly.
* You have answered all of the above questions.
* Your code should be well-documented, correctly indented and neat. You should not use magic   numbers.

Points will be taken off if you fail to comply with these requirements.

### Mode of Submission ###

The teaching staff will be grading your code directly on GitHub. You will be graded on the latest commit on the master branch before the deadline. Your solution for this Problem Set should be contained in a single directory called `ps03`, which should be inside the root directory of the private repository
assigned to you. The `ps03` directory should contain **all** your project files. However, in order to keep the size of your submission small, you should omit the `build` subdirectory that contains the compiled binaries. In addition, your submission directory should contain your design explanation `design.pdf` and a README file where you specify which implementation files contain your code.

You must upload all your work to the master branch of the remote repository. You will be graded on the **latest commit** before the deadline.

Clarifications and questions related to this problem set may be directed to the IVLE Forum under the heading **“Problem Set 3: Bubble Blast Saga Level Designer”.**

*Good luck and have fun!*