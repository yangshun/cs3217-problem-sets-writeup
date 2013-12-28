Problem Set 4
==

*Issue Date: 16 February 2014  
Due Date: 24 February 2014  
Tutorial Date: Week 6*

Section 1 - Introduction
--
This section gives you an overview of of this problem set, which is to implement a game engine with a simplified physics engine and game-specific behaviours based on the requirements and specifications described later in this section.

￼￼￼***Reminder: Please read the entire assignment before starting.***

In this assignment, you will practice software engineering skills by building a 
simple 2D game engine. The process involves understanding how a game can be
simulated, deciding on the ADTs that you need, designing the classes and modules 
that are necessary and finally, implementing and testing your design.

You should also keep in mind that the game engine should be designed such that it 
not only fulfils the requirements in section 2 but also be general enough to
extend in the next problem set when your engine is to be integrated with what you
have already done in problem set 3. You can refer to any game (and/or physics) 
engines; however, you must write all the code for your game yourself and not 
allowed to include an external engine library. You are allowed to use any Apple 
frameworks and libraries except SpriteKit!

A good game engine provides varied functionalities including "a renderer for 2D or 3D graphics, a physics engine (collision detection), sound, scripting, animation, artificial intelligence, networking, streaming, memory management, threading, localization support, and a scene graph" ([Wikipedia][Wikipedia-Game Engine]). In this assignment, you are supposed to build a simple engine which only consists of a renderer and a physics engine.

While we’ll provide certain guidelines here on how to build a game engine, the pleasure of personally designing it is all yours. :)

[Wikipedia-Game Engine]: http://en.wikipedia.org/wiki/Game_engine

### 2D Renderer ###

Apple's UIKit framework has excellent built-in classes that you can use to draw and display your game objects. Nevertheless, you still need to choose your object's model that can be easily stored and displayed.

Next, a game must have smooth animation which means the screen needs to be redrawn frequently (e.g. 60 frames per second). At every 1/60 second, your game engine should use its physics engine to update the objects' properties (e.g. position, velocity or collision), handle all the gameplay's scenario and then call the renderer to redrawn your objects.

*Hint: If you did a good job for the problem set 3, you can simply reuse the data model! However, note that this assignment does not require you to support persistent data. If you choose to do so and it causes bugs when your game runs, your mark will be deducted.*

### Physics Engine ###

A typical physics engine would require its objects to have all important physics properties such as position, velocity, mass, force, torque and etc. in order to calculate realistic physics phenomena like impulse, reflection or oscillation. However, a full-scaled physics engine is a bit overkill for the purpose of building Bubble Blast Sage and hence, you are only required to implement a simplified engine which supports simple object movement (problem 2.1) and collision detection between bubbles or between bubble and wall (2.3).  

Keep in my mind that your physics engine should be flexible enough to extend easily and support further requirements to build an interesting game.

*Hint: You might want to look ahead at the problem set 5 or try out Bubble Mania to see what features your physics engine might need to support.*

### Gameplay ###

On top of the game engine that might be reused across different games, each game will have its own unique gameplay. In Bubble Blast Sage, the core features which you have to implement in this problem set includes:

- The moving bubble snaps to the closest empty grid when collides with another bubble (2.4)
- Then, a group of 3 or more connected identically-coloured bubbles including the colliding bubble is removed
- Afterwards, any floating bubbles (detached from the top roof and hanging bubbles) should be removed as well

Section 2 - Design & Implement the Game Engine (100 points)
--
In this section, you will go through the steps of designing and implementing your game engine.

### Problem 1 - Design (25 points) ###

Before you begin, please make sure to understand how a game engine works and the requirements for Problem 2 below. You are free to refer to other game (and/or physics) engines, but you are to write your engine completely from scratch.

Please draw the following diagrams and include them in your `ps04` folder:

a. Draw a data model by identifying the data types and how they are related.

b. Draw a module-dependency diagram (MDD) and describe what each module is used for. Explain the rationale for your design over alternatives.

Put the explanation in a text file `design.txt` and add it to folder `ps04` as well. The image files for your data model and MDD should be named `data-model.png` and `module-dependency.png` respectively (You can use other file formats or names if you prefer to. You should indicate this in `design.txt`). Also, please explain how you would extend your design to support more complex physic interactions.

### Problem 2 - Game Engine (55 points) ###

##### 1. Bubble shooting (10 points) #####

Decide on how to allow the user to specify the angle of the bubble to be shot and implement it accordingly. Explain how your game handles user input for the angle and implement it. Remember to give your user a new bubble after every shot!

##### 2. Bubble movement (5 points) #####
A bubble should be able to

- travel with its current speed and direction
- reflect off the side walls

##### 3. Bubble collisions (10 points) #####
The game engine should be able to detect the following collisions of the moving bubble when:

- It collides with another bubble in the arena.
- It collides with the top wall

##### 4. Bubble snapping to grid (5 points) #####
After the bubble has collided with either another bubble or the top wall, it should find a final position to come to rest.

##### 5. Removing identical bubbles (10 points) #####
If the colliding bubble touches other identically coloured bubbles, all connected bubbles of that colour are removed if they form a group of 3 or more. 

##### 6. Removing unattached bubbles (15 points) #####
After identically-coloured bubbles are removed, if there are bubbles that are not connected to the bubbles on the top wall, they should be removed too!

**For 5 Bonus Points:** Give the removal (5 & 6) some cool and distinct animations such as blowing up and falling out of the screen.

### Problem 3 - Testing (20 points) ###

Testing is an integral part of software engineering. You are expected to create unit tests for the various components in your game engine. In addition, you will need to do integration testing to make sure that your game engine works when the various components are put together. The way to do this is to start from a hierarchy and then break down into smaller and more specific cases. For example:

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

Please come up with you testing strategy and describe it in `design.txt`. Note that if we find that if your application fails any of the tests described, **you will be penalized heavily**. We do not want testing to be merely an exercise in documentation.

### Bonus Problem: Reflection (3 Bonus Points) ###
Please answer the following questions:

a. How many hours did you spend on each problem of this problem set?

b. In retrospect, what could you have done better to reduce the time you spent solving this problem set?

c. What could the CS3217 teaching staff have done better to improve your learning experience in this problem set?

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

The teaching staff will be grading your code directly on GitHub. You will be graded on the latest commit on the master branch before the deadline. Your solution for this Problem Set should be contained in a single directory called `ps04`, which should be inside the root directory of the private repository
assigned to you. The `ps04` directory should contain all your project files. However, in order to keep the size of your submission small, you should omit the build subdirectory that contains the compiled binaries. In addition, your submission directory should contain your design explanation `design.txt`, two diagrams `data-model.png` and `module-dependency.png`, and a `README` file where you specify which implementation files contain your code.

Clarifications and questions related to this assignment may be directed to the IVLE Forum under the header **“Problem Set 4: Bubble Blast Saga Game Engine”**.

*Good luck and have fun!*