Problem Set 4
==

*Issue Date: 3 February 2014  
Due Date: 16 February 2014  
Tutorial Date: Week 6*

Section 1 - Introduction
--
This section gives you an overview of this problem set, which is to implement a game engine with a simplified physics engine and game-specific behaviours based on the requirements and specifications described later in this section.

￼￼￼***Reminder: Please read the entire assignment before starting.***

In this assignment, you will practice software engineering skills by building a 
simple game engine. The process involves understanding how a game can be
simulated, deciding on the ADTs that you need, designing the classes and modules 
that are necessary and finally, implementing and testing your design.

You should also keep in mind that the game engine should be designed such that it 
not only fulfills the requirements in section 2 but also be extensible enough to
support new behaviours in the next problem set when your engine is to be integrated with what you have completed in problem set 3. You can refer to any game (and/or physics) engines; however, you must write all the code for your game yourself and not allowed to include an external engine library. You are allowed to use any Apple frameworks and libraries except SpriteKit!

A good game engine provides various functionalities including "a renderer for 2D or 3D graphics, a physics engine (real-world physical interaction), sound, scripting, animation, artificial intelligence, networking, streaming, memory management, threading, localization support, and a scene graph" ([Wikipedia][Wikipedia-Game Engine]). In this assignment, you are supposed to build a simple engine which only consists of a renderer and a physics engine.

While we will provide certain guidelines here on how to build a game engine, the pleasure of personally designing it is all yours. :-)

[Wikipedia-Game Engine]: http://en.wikipedia.org/wiki/Game_engine

### Game Loop ###

A game must have smooth animation which means the screen needs to be redrawn frequently (e.g. 60 frames per second). For every 1/60<sup>th</sup> of a second, your game engine should use its physics engine to update the objects' physical properties (e.g. position, velocity, rotation, etc), handle all the resulting interaction (according to gameplay logic and specifications), then call the renderer to redraw your objects on the screen.

*Hint: If you designed your problem set 3 well, you can simply reuse the data model! However, note that this assignment does not require you to support persistent data. If you choose to reuse your data model and it causes bugs when your game engine runs, marks will be deducted.*

### 2D Renderer ###

Apple's UIKit framework has excellent built-in classes that you can use to draw and display your game objects. However, you will still need to decide on the objects' model so that can be easily stored, manipulated and displayed.

### Physics Engine ###

A typical physics engine would require its objects to possess the full set of physical properties such as position, velocity, mass, force, torque and etc. in order to calculate realistic physics phenomena like impulse, reflection or oscillation. However, a full-fledged physics engine is unnecessary for the purpose of the simple physical interactions required in Bubble Blast Saga. Hence, you are only required to implement a simplified engine which supports simple object movement (Problem 2.2) and collision detection (Problem 2.3).  

Keep in my mind that your physics engine should be flexible enough to support future extensions that make the game more interesting.

*Hint: You might want to look ahead at problem set 5 and/or try out Bubble Mania to see what features your physics engine might need to support.*

### Gameplay ###

On top of the game engine that might be reused across different games, each game will have its own unique gameplay. In Bubble Blast Saga, the core features which you have to implement in this problem set includes:

- The moving bubble snaps to the closest empty cell when it collides with an existing bubble (Problem 2.4)
- A group of 3 or more identically-coloured and connected bubbles including the colliding bubble is removed (Problem 2.5)
- Lastly, any floating bubbles (detached from the top) should be removed as well (Problem 2.6)

Section 2 - Design & Implement the Game Engine (100 points)
--
In this section, we will go through the steps of designing and implementing your game engine.

### Problem 1 - Design (25 points) ###

Before you begin, please make sure you understand how a game engine works and the requirements specified in Problem 2 below. You are free to refer to other game (and/or physics) engines, but you are to write your engine completely from scratch. 

Bear in mind that a good game engine is one where the modules/components are reusable in other games of similar nature. Do spend some time understanding the specifications of the game, think of possible extensions to the game (required in problem set 5), and design your game engine to support these. Note that each functionality/specification can be supported by a few game engine components (physics, rendering, etc).

Please draw the following diagrams and include them in your `ps04` folder:

a. Draw a data model by identifying the data types and how they are related. **(10 points)**

b. Draw a module-dependency diagram (MDD) of your game engine and describe what each module is used for. Please also list down the APIs (Application Programming Interface) for each of your modules. Explain the rationale for your design over alternatives. **(15 points)**

Put the explanation in a text file `design.txt` and add it to folder `ps04` as well. The image files for your data model and MDD should be named `data-model.png` and `module-dependency.png` respectively (You can use other file formats or names if you prefer to. You should indicate this in `design.txt`). Also, please explain how you would extend your design to support more complex game logic such as removal of all bubbles in the grid of a specific colour.


### Problem 2 - Game Engine (55 points) ###

Implement your game engine according to your design in Problem 1 and make sure it allows for the behaviours listed below. 

1. **Bubble launching (10 points)**
    
    Decide on how to allow the user to specify the angle to launch the bubble. Explain how your game handles user input for that angle and implement it. Remember to give your user a new bubble to launch after every shot!

2. **Bubble movement (5 points)**

    The bubble should:

    - Travel at a constant speed in the direction of launch
    - Reflect off the side walls realistically

3. **Bubble collisions (10 points)**

    The launched bubble should stop moving when it:

    - Collides with another bubble in the arena
    - Collides with the top wall

4. **Bubble snapping to grid cells (5 points)**

    After the bubble has collided with another existing bubble or the top wall, it should find a final position to come to rest. This final position should be the closest available empty cell on the isometric grid.

5. **Removing connected bubbles of the same colour (10 points)**

    After the launched bubble has found a resting position, if it is connected to other identically-coloured bubbles and they form a group of 3 or more, that connected group of bubbles is removed from the arena.

6. **Removing unattached bubbles (10 points)**
    
    After identically-coloured bubbles are removed, if there are bubbles that are not connected to the bubbles on the top wall, they should be removed too.

7. **Animations (5 points)**

    Give each removal (Problems 2.5 & 2.6) some cool animation such as exploding/fading away/falling out of the screen, etc. While you are free to create whatever animation you like, it must enhance the overall gameplay! 

### Problem 3 - Testing (20 points) ###

Testing is an integral part of software engineering. You are expected to create unit tests for the various components in your game engine. In addition, you will need to do integration testing to make sure that your game engine works when various components of the engine are put together. The way to do this is to start from a hierarchy and then break down into smaller and more specific cases. For example:

* Black-box testing
 * Test movable bubbles
     * ···
 * Test collisions between two bubbles
     * ...
 * Test collisions between a bubble and a screen edge
     * ···

 * ···
* Glass-box testing 
 * ···
     * ···

Please come up with your testing strategy and describe it in `design.txt`. Note that if we find that your application fails any of the tests described, **you will be penalized heavily**. We do not want testing to be merely an exercise in documentation.

### Bonus Problem: Reflection (3 Bonus Points) ###
Please answer the following questions:

1. How many hours did you spend on each problem of this problem set?

2. In retrospect, what could you have done better to reduce the time you spent solving this problem set?

3. What could the CS3217 teaching staff have done better to improve your learning experience in this problem set?

Your answers to these questions should be appended at the end of `design.txt`.

Section 3 - Grading and Submission
--
Please read this section carefully so that you fully understand the grading scheme and the mode of submission!

### Grading Scheme ###

In this module, you are being trained to become a good software engineer. The first and basic requirement is that your code must satisfy the requirements and be correct. Above and beyond correctness, you are required to write well-documented code.

For this problem set, we will be testing your code by compiling your app and uploading it to an iPad to make sure that the game engine works as expected. We will be looking at the following:

- Your submission should adhere to the submission format.
- You have answered the questions satisfactorily in a concise manner.
- Your project should build without errors or warnings.
- Your project should run without crashing.
- You have implemented required features.
- Your game engine works. By this, we mean that the bubbles interact with each other and exhibit the desired behaviours.

### Mode of Submission ###

You will be using a pilot locally hosted [GitLab](http://cs3217.comp.nus.edu.sg) instance for submitting your code and receiving feedback. 

There is no resource or template provided for this problem set. In the group [Problem Sets 2014](http://cs3217.comp.nus.edu.sg/groups/problem-sets-2014) under `Problem Set 4`, there is a repository which only contains the `.gitignore` as in the previous problem sets. Feel free to fork and clone it or create a new repository on your own but make sure to add the `.gitignore` to reduce the submission size.

**Important Note:** This time, you have to start a new Xcode project from scratch. We should be able to download the entire repository, import it into Xcode, and run your solution without making additional changes. You will be graded on the **latest commit** before the deadline.

In addition, your submission directory should contain your design explanation `design.txt`, two diagrams `data-model.png` and `module-dependency.png`, and a `README` file where you specify which implementation files contain your code.

Clarifications and questions related to this assignment may be directed to the IVLE Forum under the header **“Problem Set 4: Bubble Blast Saga Game Engine”**.

*Good luck and have fun!*