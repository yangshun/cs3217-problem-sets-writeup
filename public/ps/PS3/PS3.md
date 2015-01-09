Problem Set 3
==

*Issue Date: 26 January 2015  
Due Date: 8 February 2015  
Tutorial Date: Week 5*

Section 1 - Introduction
--
In this problem set, you will build upon what you had done in the previous problem set to implement a simple application in order to better understand the MVC design pattern, handling gestures, and file operations/persistent storage. We also want you to consider different ways of implementing the requirements for this problem set before you decide on the final implementation.

You will also design and implement a few simple objects. Some specifications will be given, but you will not be given the full set. You are expected to add the appropriate interfaces and specifications to complete the problem set. Please ensure that you document your code according to the standards of CS3217. Each new class should have an overview and complex methods should have external parameter names.

**Reminder**: Please read the entire problem set before starting.

When programming a new game, you usually start by implementing some basic features and subsequently enhance it with more complex features. As the game grows, the code gets more complicated and the classes will get bigger. To avoid ending up with a mess of spaghetti code, we typically decouple the rendering from the logic. Doing so will also allow you to let the game logic run at a different speed than the rendering. Actually, the game logic will know nothing about the rendering, so it does not matter how the game is displayed (2D, 3D, ASCII art, etc). The rendering however depends on the logic, because it needs info on how/where to display everything. Typically, all the rendering is done in the view module.

The game logic is typically subdivided into a model and a controller. The model keeps track of the objects in the game world, and knows nothing about displaying, user input, etc. It just implements all the world rules, and how entities interact with each other. The controller knows about the model and can manipulate it depending on the external inputs.

**Good Advice**: Please start working on this problem set early. If not, you will live to regret.

### Model-View-Controller (MVC) ###

In this problem set you will familiarise yourself with the **Model-View-Controller (MVC)** design pattern. In MVC, the logic of the application is separated from the user interface such that development, testing and maintenance of these modules are independent. An MVC application is a collection of model/view/controller triads, each responsible for a different UI element.

The **Model** manages the behavior and the data of the application, provides information to the view about its state, and updates its stated according to the controller. The model may notify observers (such as views) when the information data changes so that they can render the updated state.

The **View** renders the model into a form suitable for interaction, typically by user interface elements. It is possible to have multiple views for a single model for different purposes.

The **Controller** receives input from the user and instructs the model and view to perform actions based on the input.

The Cocoa and Cocoa Touch frameworks encourage the use of the MVC pattern. Interface Builder constructs views, and connects them to controllers via *Outlets* and *Actions*. In this problem set, you will develop a level designed for a game called Bubble Blast Saga by conforming to the MVC design pattern.
￼
### Bubble Blast Saga Level Designer (MVC) ###

The following is a brief overview of the game that you will be building called Bubble Blast Saga. When launching the game, the user is presented with the interface, with an isometric grid-like structure where the bubbles will be placed. A palette at the bottom will allow the designer to choose the colour of bubble he/she wants to design the grid with (blue, red, green or orange). The palette also contains an eraser used to clean the bubbles off the grid. After adding the bubbles onto the grid, the user can use the **SAVE** button to store the current grid bubbles in a file on the iPad. The **LOAD** button can be used to load and restore the previously saved level, and the **RESET** button will clear all the bubbles from the grid. Once the user is satisfied with the level design, he/she can start the game by pressing the **START** button (to be implemented in the next problem set).

In the game, the user specifies the direction of a new bubble to shot. The bubble will then interact with the existing bubbles in the grid according to the game engine that you will build in the next problem set. If the shot bubble touches another bubble with the same colour as its own, and these bubbles form a group of 3 or more bubbles, then all the connected bubbles of this colour are destroyed. The objective of the game is to destroy all the bubbles from the grid by making connected groups of 3 or more bubbles. In this problem set, the **START** button will be disabled. You will *only* have to build a rudimentary level designer.

The features of the level designer that you are expected to implement include the following:

* **RESET**, **SAVE** and **LOAD** a game level using the respective buttons
* An object palette from which the user can select the bubble colour or the eraser
* Fill the grid with the bubbles (Pan gesture)
* Cycle through the colour of the bubbles in the grid (Single Tap gesture)
* Delete bubbles from the grid (via Long Press gesture and panning with eraser mode)


Section 2 - Bubble Blast Saga Level Designer
--

### Walkthrough for Building the Interface

You will use the following milestone guidelines to set up the project on which you will build this problem set.

##### Milestone 1: Set Up an Xcode project for UI design

Here, we would like to create a new Single View Application project and set up the Storyboard scene so that it can be used for interface design later on. To do so, please follow the step-by-step instructions shown in gallery below. The detailed instructions for each step is given by the caption below the figures. 

![](/ps/ps3/img/Milestone1img/SingleViewApplication.png)
*Step 1:* Launch the empty Xcode project forked from the `cs3217-problem-set-3` repository and add a new target. The image above should appear. Select **Single View Application** as the template.

![](/ps/ps3/img/Milestone1img/OptionsNewProject.png)
*Step 2:* In the Project Options dialog, fill in the **Product Name** with a name of your choice and the **Company Identifier** as 'nus.cs3217'. You should select 'Swift' as the choice of **Language** and 'iPad' for **Devices**. For other options, you can follow the default configurations.

![](/ps/ps3/img/Milestone1img/ViewControllers.png)
By default, the Project Navigator should be opened in the top left corner of the Xcode IDE. If not, you can open it by from the top menu by clicking on **View → Navigators → Show Project Navigator**. Notice the highlighted `ViewController.swift` in the Project Navigator, as shown above. This is the interface and implementation of the controller class of the view provided by the project template. Also notice the file `Main.storyboard` in the Project Navigator. This is the file where the storyboard is stored. In most cases it suffices to use one storyboard for an application, even if you have quite a few different views.

![](/ps/ps3/img/Milestone1img/NavigationPane.png)

*Step 4:* You can hide the Navigation Pane so that you have more room to work with your interface design. Right now the storyboard contains only one empty view. In storyboard terminology, we call this view a scene. Toggle the bottom-left button in the storyboard to show the outline of scenes on the left of the design canvas. All the scenes are listed here. Currently there is only one scene. This is where we wire the things we draw in the storyboard to our view controller class’ member elements. You can also adjust the zoom level of your design canvas by double-clicking on the canvas.

![](/ps/ps3/img/Milestone1img/SizeMetrics.png)

*Step 5:* In the Attributes Inspector for the View Controller, change the **Size** to 'iPad Full Screen'. Since the problem sets are implemented only for iPad, this setting will suffice. In future if/when you build universal applications, the proper way would be to use 'Auto Layout'.

Your project is now set up for interface design using the integrated Interface Builder. Next, you will learn how to add UI elements to your app’s view and link them up to your View Controller.

##### Milestone 2: Add UIButton with IBAction connection using Editor Assistant

What we want to achieve here is to add buttons to the view and set up the buttons such that their text color will toggle between blue and light gray as we press them. Please follow the step-by-step instructions shown in the gallery below to set up IBAction connection between the button and the view controller. The detailed instructions for each step is given by the caption below the figures.

![](/ps/ps3/img/Milestone2img/StoryboardView.png)

*Step 1:* First, select View in the left pane. Double-click on the design canvas to bring it to the actual size. This step is necessary so that objects can be dragged and dropped from the Object Library to the View.

![](/ps/ps3/img/Milestone2img/ButtonAttributes.png)

*Step 2:* Open the Object Library. Use the search box at the bottom right to search for the `UIButton` object. Drag and drop a Round Rect Button from the Object Library to the top left of our view. Select the button by clicking on it. In the Attributes Inspector, change its **Title** to 'Start' and **Text Color** to 'Light Gray Color'.

![](/ps/ps3/img/Milestone2img/ButtonDragAction.png)

*Step 3:* With the file `Main.storyboard` selected, open the **Assistant Editor** by going from top menu **View → Assistant Editor → Show Assistant Editor** or just simply toggling the correpsonding top-right button. The Assistant Editor should appear to the right of the main editor, with `ViewController.swift` opened in it automatically. Click on the button to select it. Then, while holding the `control` key, drag the button to the bottom area in `ViewController.swift` in the Assistant Editor. Notice the blue line extending out from the button as we drag it.

![](/ps/ps3/img/Milestone2img/ButtonAction.png)

*Step 4:* As you release the mouse button, a small window will popup. Change the **Connection** from **Outlet** to **Action**, then fill in the name as `buttonPressed`. Click **Connect**, then the following IBAction handler will be added to `ViewController.swift`:

    @IBAction func buttonPressed(sender: AnyObject)

![](/ps/ps3/img/Milestone2img/ButtonActionCode.png)

*Step 5:* Now close the Assistant Editor by clicking the little cross in the top right corner of it. Open `ViewController.swift` by selecting it in the Project Navigator. Notice that an empty skeleton for the handler `buttonPressed` has been added here. Flesh it out as shown above.

*Step 6:* Now run the program, by clicking the **Run** button in the top left corner of IDE. Alternatively, you can go from top menu **Product → Run**. You should be able to toggle the button’s text color by clicking on it.

![](/ps/ps3/img/Milestone2img/Orientation.png)

*Step 7:* Since we would be only using the **Portrait** orientation in this game, you must specify the supported interface orientations in the project setting. Click on the top-level project in the Project Navigation pane and deselect **Landscape Left** and **Landscape Right** orientations. 

![](/ps/ps3/img/Milestone2img/AllButtons.png)

*Step 8:* Copy and paste this button to create three more buttons. Note that when we copy a button, we also copy its link to the event handlers. That means, the button press events generated by the three new buttons are also handled by `buttonPressed`. Align these buttons nicely at the top of our view. Change the titles of the three new buttons to **Save**, **Load**, and **Reset** respectively in the Attributes Inspector or by double-clicking on the buttons.

##### Milestone 3: Add UIView with IBOutlet connection using Editor Assistant

Now, we want to add a `UIView` to the main view to represent the game area. We also want to add an `IBOutlet` connection between the `UIView` and the View Controller, so that our View Controller has access to the game area.  To achieve this, please follow the step-by-step instructions shown in the gallery below. The detailed instructions for each step is given by the caption below the figures. 

![](/ps/ps3/img/Milestone3img/GameArea.png)

*Step 1:* Drag and drop a `UIView` to our view. Stretch it to cover the entire space above the buttons.

![](/ps/ps3/img/Milestone3img/GameareaDrag.png)

*Step 2:* Open the **Assistant Editor**. Then, while holding the `control` key, drag the `UIView` to the interface declaration in `ViewController.swift` in the Assistant Editor. Notice the blue line extending from the button as we drag it.

![](/ps/ps3/img/Milestone3img/GameareaOutlet.png)

*Step 3:* As you release the mouse button, a small window appears. Make sure that the **Connection** is **Outlet** and fill in the **Name** as `gameArea`. Click **Connect**. The wiring is done.

![](/ps/ps3/img/Milestone3img/GameareaOutletConfirm.png)

*Step 4:* You should see the `gameArea` property added to `ViewController.swift`.

![](/ps/ps3/img/Milestone3img/StoryboardFinal.png)
*Step 5:* We are done with the interface building for now. You should now have an interface like the one shown in the figure above. Note that the background colour of the game area has been here just for demonstration purposes.

##### Milestone 4: Add subviews to the game view programmatically

The game area is rather dull, isn’t it? Let’s place a picture in it. Please follow the step-by-step instructions shown in the gallery below to add image resource files to your project and programmatically add these images as `UIImageView` subviews to your Game View. The detailed instructions for each step is given by the caption below the figures. 

![](/ps/ps3/img/Milestone4img/ImageExtraction.png)
*Step 1:* Select all the images in the `images` folder of the forked repository.

![](/ps/ps3/img/Milestone4img/ImportImages.png)

*Step 2:* Drag the images into the **Project Navigation** pane, under the **Game** folder. When prompted with the above dialog, check Copy items into destination group’s folder (if needed). Click **Finish** to complete.

![](/ps/ps3/img/Milestone4img/ImagesFolder.png)

*Step 3:* The images should appear under the Game folder as shown above.

![](/ps/ps3/img/Milestone4img/ViewDidLoad.png)

*Step 4:* Select `ViewController.swift` from the Project Navigation pane and locate the `viewDidLoad` function. We are going to add code to this function to programmatically add the background image as subview of `gameArea` View.

![](/ps/ps3/img/Milestone4img/UIImageAlloc.png)

*Step 5:* Load the image resource into an `UIImage` object.

![](/ps/ps3/img/Milestone4img/UIImageviewAlloc.png)

*Step 6:* Place the `UIImage` into a `UIImageView`.

![](/ps/ps3/img/Milestone4img/BackgroundDimensions.png)

*Step 7:* Get the height and width of the game area. These will be used later to set the size of the `UIImageView` object.

![](/ps/ps3/img/Milestone4img/Backgroundframe.png)

*Step 8:* Set the frames of background  based on the previous calculations.

![](/ps/ps3/img/Milestone4img/BackgroundSubview.png)

*Step 9:* Add background as a subview to the `gameArea` View.

![](/ps/ps3/img/Milestone4img/GameareaFinal.png)
*Step 10:* **Build** and **Run** the program. If you have done everything correctly, you should see something like the above.

Note that you can achieve the above result using the Interface Builder, but it is helpful to learn how it is done programmatically because not everything can be done via the builder. Learn to determine when to use the Interface Builder to add your elements and when to create them programatically.

### Problem 1: Create the Bubble Palette (10 points) ###

To create the palette, you need to add a new view, palette, to the main view. The palette will contain 4 bubbles (blue, red, green, orange) that the user can choose to fill the grid with and an eraser to delete bubbles. These images should stay in the palette throughout the design phase. You can find the necessary graphic files for the game objects in the archive for this problem set. The following image is a sample screenshot of the level designer. You are however free to redesign the layout of the level designer as long as you satisfy the basic requirements.

From the palette area, the user taps a coloured bubble to select the colour of bubble he wants to use to fill the grid or taps the eraser to enter the erase mode. In erasing mode, panning over any non-empty bubble cells will clear the bubble from the grid.

Your bubble palette should indicate the current drawing mode (which coloured bubble or eraser).

![designer](/ps/ps3/img/designer.png)

### Problem 2: Create the Bubble Grid (10 points) ###

Your next task is to create an isometric grid. The grid should have 12 columns, at least 9 rows, and should be tightly packed as seen in the previous image. This grid will indicate all the possible positions of the bubble and would be used by the designer to design a game level by filling it with bubbles.

(Hint: The traditional way of doing this is by adding individual `UIView` circles to make the grid. Alternatively, you may use `UICollectionView` to directly build the grid. Although this will make your life less complicated, understanding how `UICollectionView` works may take some time. Both ways are equally acceptable and you need to decide which one you are more comfortable with).

### Problem 3: Explain your Design (40 points) ###

Before you begin, please spend some time understanding the requirements of this problem set. Think about the following questions: What objects do you need to implement? How will the objects interact with your main controller? How do you best organize the code for these objects? Are there alternatives? How will you add new game objects?

Once you have decided on the best way to organize your code, please answer the following questions by including a text file `answers.txt` at the root directory of your problem set repository.

1. How did you apply the MVC pattern in this problem set? Explain how you decided to organize the code for your game objects with an entity-relationship diagram for your implementation of the game. With the entity-relationship model diagram as a start, build a class diagram for the entire project. The entity-relationship model is an abstract and conceptual representation of your data. An entity is a unique thing that can exist independently in your design. Each entity must have a set of unique attributes. A relationship captures how two or more entities are related to each other. Relationships also may have attributes. The entity-relationship diagram shows graphically the entity and the relationship sets, including the cardinality of the relationship (e.g. one-to-one, one-to-many, many-to-one). 

  To summarize, your class diagram should:
  - Show the attributes, methods of each class and additional relevant information about them.
  - Relationships between classes should also be shown. Show the instance-level (association, composition) and class-level relationships (generalization, realization) where appropriate.
  - Allow a developer who hasn't seen your code base before to let them have a high-level understanding of your software.

  Save your diagram as `class-diagram.png` and include it in the root directory of your problem set repository. If you would like to add more diagrams that you find helpful in allowing others to understand your code architecture, feel free to add them in, and make indicate it inside `answers.txt`. **(10 points)**

2. Explain why you decided on your chosen design over alternative designs. **(5 points)**

3. How would you add a new “projectile” object - the launched bubble - to the game in subsequent problem sets? **(5 points)**

4. How do you plan to integrate the bubble objects with a game engine? **(10 points)**

5. What other functionalities do you think you might want to add to the game later and how can you extend your code to support these new features, other than what has been specified in this problem set? Give two concrete examples of changes you can/will make to your code as well as the structure of your classes). **(10 points)**


***Self-check:***
A correct implementation of the MVC framework has the following properties:

* the **model** knows about nobody
* the **view** knows about the **model** (but accesses it only through the **controller**)
* the **controller** knows about the the **view** and the **model**
* the **controller** observes the **view**

### Problem 4: Implementing the Bubble Objects (110 points) ###

You will be using the MVC pattern to implement the bubble objects. Thus, a game bubble is represented by the triad: **Model** - to store the state of the object; **View** - to represent the bubble on the screen; and **Controller** - to manage the model and the view.

1. **Model** - There are two important aspects regarding the object model. In this problem set, you are concerned mostly with the position of the object on the screen, and the type of bubble, such that you can save and restore the object of the respective type to that position using the palette buttons in the walkthrough at the start of this problem set. However, note that for the next problem set the game objects state will be more complex as you develop a representation required for the game and physics engine. Writing extensible and reusable code is one of the qualities of good code. **(10 points)**

2. **View** -  Rendering to the screen is handled by the view. It uses the model to know where to draw everything. The view doesn’t have any other functionality than this. You are provided with the required sprites in the attached archive. A sprite is an image or animation that is going to be integrated into a larger scene, such as our game. Here you will find included the image sprites. **(10 points)**
 - `bubble-blue.png`, `bubble-red.png`, `bubble-orange.png`, `bubble-green.png` are image sprites. These are the bubble images that will be used to design the game level. The default size of the bubble frame is 160x160 pixels.

  **Note:** If you use the images in their default sizes, the palette and the grid will have to be very big. Thus, the views placed in the palette/grid should be scaled down to a reasonable smaller dimension. The sizes of the bubbles in the palette and grid do not have to be the same, as the palette is just for the designer to select the colour of bubble  to be used to fill the grid. 

3. **Controller** - The controller handles the user input and manipulates the model. First it checks for user input, then it might query the view to see which on-screen objects are being manipulated by the user, and finally it changes the model accordingly. Since all objects respond in a similar way to the user input (for example: tap on the palette, long-press to delete, tap to change colour, drag on the grid to fill with bubbles), you are given the interface for an abstract class representing a game object controller. 

 You need to come up with an implementation of a base `GameBubble` class (you may change the name as you please) and then subclass it with the additional requirements for each bubble types. For this problem set, there is only one basic bubble type (how many subclasses should you have?) with different colours. However, over the next two problem sets, you would be subclassing this abstract class to create different types of games bubbles (for example, special power bubbles) that would have different behaviour from the basic bubble types. Design your class well if you want to avoid rewriting code in the future problem sets. **(30 points)**

4. **Touch Gestures**. To implement the drag, single-tap and long-press, you can use gesture recognizers. For dragging, you can use `UIPanGestureRecognizer`, for single/double-tap you can use `UITapGestureRecognizer` and for long-press you can use `UILongPressGestureRecognizer`. **(30 points)**

 An example use of gesture recognizers is the following: 

        // This is required for touch interaction with the view
        let panGesture = UIPanGestureRecognizer(target: self, action: Selector("panHandler:"))
        panGesture.minimumNumberOfTouches = 1
        panGesture.maximumNumberOfTouches = 1
        view.addGestureRecognizer(panGesture)

 Supported Operations:  
 - Select a bubble colour from the palette (Single-tap gesture)  
 - Drag finger across main grid to fill the cells up with the selected bubble colour 
or erase a cell if the eraser was chosen in the palette (Pan gesture)  
 - Tap an existing bubble on the grid to cycle through bubble colours (Single-tap gesture). **Note**: Tapping on an empty cell will not have any effects.
 - Convenient erasure of a cell (Long-press gesture)

### Problem 5: Saving and Loading Game Levels. (50 points) ###

Finally, you have to implement the reset/save/load functionality for the level designer. You are to design your format for storing the game objects and decide how you want to store the objects. Make sure you implement the ability to save and load from different files, as well to modify and re-save a level. Your saving/loading/editing functionality has to support multiple levels. Please explain how you chose to implement the save/load function in `answers.txt`. Justify your decision by explaining why your implementation is the best one among all the alternatives you considered.

There are five ways to maintain data persistency on iOS:

- Property lists
- Object archives
- Manual encoding
- SQlite database
- Core Data

In this problem set, we will briefly discuss the first three. You should go and learn about the other two ways on your own. 

All applications in iOS 7 and before are sandboxed. As such, applications can only read and write data from several folders. The `Documents` folder should be used for persistent data since it will get backed up regularly. The `Cache` folder can be used to store information available to the application between launches, but it’s not backed up by iTunes. Lastly, the `tmp` folder is available only when the application is running. 

However, quoting [Apple's Technical Note TN2406](https://developer.apple.com/library/ios/technotes/tn2406/_index.html): *Beginning in iOS 8, the Documents and Library directories are no longer siblings of your application's bundle. This document describes how to ensure your app is not affected by these changes. iOS 8 changes the locations of the standard directories used for storing user and app data (e.g. Documents, Library). While the locations of these directories have always been an implementation detail, some applications improperly assume that the Documents and Library directories reside in the same directory as the application's bundle. iOS 8 splits the data of an application from the application bundle. Code which attempts to derive the path to the Documents or Library directories will return an invalid path on iOS 8. Attempting to access this path will fail, and may terminate your app.* 

Please bear the above in mind when doing your problem set, you may be referring to guides that are meant for iOS 7 and before and wonder why this does not work.

You may use the following code to save a file to the app's document directory (which changes everytime you build the app).
```
var urls = NSFileManager.DefaultManager.GetUrls (NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomain.User)
var path = urls[0].Path
File.WriteAllText(Path.Combine(path, "myfile.txt"), "woohoo")
```

You can choose to save your data either using a single file, or using multiple files. We will discuss only the case of single file since it might be easier to implement. You start by having one root object (e.g. an `NSArray` or `NSDictionary`) which you populate with all the data that have to be persisted. When saving, you rewrite the single file with the contents of the root directory.

**Property Lists** - Property lists (plists) are convenient because their representation is in XML. As such, you  can view and edit files manually using *Xcode* or the *Property List Editor* application. You can create  and write both `NSArray`s and `NSDictionary`s containing any object as long as the objects are serializable. Although any object can be made serializable, only certain objects can be placed in the Foundation collection classes, such as: `NSArray`, `NSMutableArray`, `NSDictionary`, `NSMutableDictionary`, `NSData`, `NSMutableData`, `NSString`, `NSMutableString`, `NSNumber`, `NSDate`. If you can build ￼your model using only these objects (**Note**: Look at the documentation for `NSData`) then you can save your entire game data using the collection method `writeToFile(_ path: String, atomically atomically: Bool)`. Note that when you read from a plist, you will have to initialize using the `contentsOfFile` method of the `NS` classes.

**Object Archives** - One of the problems with property lists is that custom objects cannot be serialized. In Cocoa, “archiving” refers to a more generic serialization that any object can implement. In fact, any object model should support archiving since this allows you any model object to be saved and restored. As long as every property you implement in your class is either a scalar (int, float etc.) or an object that conforms to the `NSCoding` protocol, you can archive your objects completely. To make an object conform to the `NSCoding` protocol, you must implement two methods, one to encode your object into an archive, and one to create your object by decoding it from a file:

    func encodeWithCoder(coder: NSCoder) {
        // This tells the archiver how to encode the object
        coder.encodeObject(self.strVar, forKey: "strVar")
        coder.encodeInt(self.intVar, forKey: "intVar")
    }

    required convenience init(coder decoder: NSCoder) {
        self.init()
    	// This tells the unarchiver how to decode the object
        self.strVar = decoder.decodeObjectForKey("strVar") as String?
        self.intVar = decoder.decodeIntegerForKey("intVar")
    }

To actually store your data then your have to create an instance of `NSMutableData` to hold the encoded data and then create an `NSKeyedArchiver` instance to save the data to a file:

    let data = NSMutableData();
    let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
    archiver.encodeObject(model, forKey: "modelKeyString")
    archiver.finishEncoding()
    let success = data.writeToFile("/path/file/", atomically: true)

Restoring an object from a file is similar, using an `NSKeyedUnarchiver` object and its `decodeObjectForKey(_ key: String)` method.

**Saving Images** - Because the `UIImage` class does not implement the `NSCoding` protocol by default, you need to extend it using an Swift concept known as *Extension*, and add these methods yourself. As before, to encode an object you would do:

    let imageData = UIImagePNGRepresentation(self);
    coder.encodeObject(imageData, forKey: "image")

And to decode it:

    let imageData = decoder.decodeObjectForKey("image")
    return UIImage(data: imageData)

**Manual Encoding** - The general idea in this approach is to open a file and to pass the handler to each object for the object to write itself into the file using a custom format. You will need to assign a unique identifier (type) to each object and write the type of the object to file before calling the object to write itself. To reconstruct objects, you will require a factory function that will read the file for the object type, create an associated empty object and then pass the file handle to the object for the object to initialize its state. Effectively, each object must support a `read` and a `write` method (which you will have to define yourself).

### Problem 6: Testing (30 points) ###

Testing is an integral part of software engineering. Since you are not implementing any complicated ADTs in this assignments, unit tests are probably not particularly helpful. That said, you are supposed to implement a large number of features and it is important for you to test your final code to make sure that your application meets the stated requirements. The way to do this is to start from a hierarchy and then break down into smaller and more specific cases. For example:

* Black-box testing
 - Test implementation of file operations  
     - Save 
 - ··· 
 - Test implementation of game: 
     - Drag to fill the grid cells
         - Drag over filled cell
         - Drag over empty cell
￼
* Glass-box testing      (Testing your implementations)
  - GameViewController (**Note:** Methods shown here are example only!)
     - eraseBubbleAtCell:
         - Filled cell
         - Empty cell
 - ...
 - GameBubbleCollection
     - initializeCollection:
         - Empty collection
         - Non-empty collection

Please come up with your testing strategy and describe it in `answers.txt`. Of course, you should actually test your application as you have described instead of just listing down what you think you ought to test! :-)  

### Bonus Problem: Reflection (3 Bonus Points) ###

Please answer the following questions:

1. How many hours did you spend on each problem of this problem set?

2. In retrospect, what could you have done better to reduce the time you spent solving this problem set?

3. What could the CS3217 teaching staff have done better to improve your learning experience in this problem set?

Submit your answers to these bonus problems at [http://tiny.cc/cs3217-ps3](http://tiny.cc/cs3217-ps3). Thanks!

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

Like previous problem sets, you will be using Bitbucket for submitting your code and receiving feedback. 

The Xcode project for this problem set is provided and will be located under the [private repositories section](https://bitbucket.org/cs3217/profile/repositories?visibility=private). You should first **fork** the project to your own private workspace, and then **clone** the project to your computer.

When you begin working, your Xcode project will create files that are user-specific, and should not be committed to a revision control system. You can tell Git to ignore these files by writing their definitions in `.gitignore` in the root of a Git repository. This has already been done for you, and the definitions we have used are taken from [GitHub's Swift gitignore](https://github.com/github/gitignore/blob/master/Swift.gitignore).

**Important Note:** Until now, a target Xcode project was already constructed for your problem sets. In this problem set, you have to create a new target in the empty Xcode project based on the walkthrough and ensure that all the required files are inside the project that you have forked and cloned. We should be able to download the entire repository, import it into Xcode, and run your solution without making additional changes. You will be graded on the **latest commit** before the deadline.

In addition, your project directory should contain your design explanation `answers.txt`, the class diagram `class-diagram.png`, and a README file where you specify which implementation files contain your code.

Clarifications and questions related to this problem set may be directed to the IVLE Forum under the heading **“Problem Set 3: Bubble Blast Saga Level Designer”.**

*Good luck and have fun!*