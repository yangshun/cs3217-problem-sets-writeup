Problem Set 4
==

*Issue Date: 16 February 2014  
Due Date: 24 February 2014  
Tutorial Date: Week 6*

Section 1 - Introduction
--
This section gives you an overview of the task of this problem set, which is to implement a game engine with simple physics and game-specific behaviours based on the requirements and specifications described later in this section.

￼￼￼***Reminder: Please read the entire assignment before starting.***

### Game Engine (to be updated) ###
In this assignment, you will practice software engineering skills by building a simple 2D physics engine from scratch. The process involves understanding how physics can be simulated, deciding on the ADTs that you need, designing the classes and modules that are necessary and finally, implementing and testing your design.

You should also keep in mind that the physics engine should be designed such that it can be integrated with any other application which requires rigid body dynamics with as little modification as possible, and not just out of fulfillment of the Falling Bricks demonstration Problem 4 or your next problem set, where the engine is to be integrated with what you have already done in Problem Set 3. You do not necessarily have to implement your engine according to the rules given in the Appendix, and you are free refer to other references or physics engines. Your physics engine simply has to be able to simulate physical interactions and motion in a “natural” way. You must however write all the code for your engine yourself and are not allowed to include an external physics engine library. You are allowed to use any Apple frameworks and libraries though.

A physics engine is the virtual simulation of the physical aspects of an abstract world, like the mass, shape, velocity, acceleration of each physical body, the forces and torques acting on the bodies. These objects and entities interact based on the laws of physics derived for real world physical entities.

The physics engine will serve as an oracle for the main game engine. After setting up the physics world, the main game engine periodically queries the physics engine for the status of the world; mainly the position and angle of rotation of the physical bodies in the world (by angle of rotation, we mean the angle at which the object is rotated from its standard upright position). Whenever the engine is queried, it simulates the interactions between the physical bodies in the time interval from the last query to the current one. This is therefore a discrete simulation of the physical world. Usually the time interval between each successive queries is fixed. (for example, 1/60 seconds)

In this assignment, we’ll only provide the guidelines on how to build a physics engine. The pleasure of personally designing it is all yours. :)

The entities that you may need to model in a physics engine include:

* The world, which contains a set of physical bodies, the direction and magnitude of the gravity, and some other information specifically related with the simulation, instead of the physics, which are discussed in the Appendix. Note however that if you do not wish to use the physics model described in the Appendix, you are free to do your own thing. Note however that you do so at your own peril.

* Physical bodies. The attributes for a body includes: mass, moment of inertia, position, shape (in this assignment, we’ll only deal with rectangular shapes, but it would be advisable for your design to be extensible to other types of shapes), velocity, angular velocity, force (you only need to keep a vector sum of all the forces acting on the body), torque, friction coefficient.

* The contact points, which are the points where the physical bodies collide with each other. Note that we hardly encounter cases where two colliding bodies are barely touching each other. Usually, since we are running a discrete simulation, when two bodies collide, they share an intersection area. We therefore need to approximate; find two contact points such that we can think of the two bodies as colliding at these points only. (more on this later)

* Restitution coefficient (which is a value between 0 and 1, that describes how much the objects bounce after the collision. The larger the value, the more bouncy the objects are. For a restitution coefficient of 0, the objects do not bounce at all. For a restitution coefficient of 1, no kinetic energy is lost in the collision). In reality this constant is unique for each collision. Even for the same pair of objects, when they collide with different velocities, this constant is different. But that is very hard to implement. We will simplify it by giving each object a constant e, depending on how bouncy you intend it to be. Then for two objects with bounciness e1 and e2 respectively, we compute the restitution coefficient between their collisions as e1e2 ,
under the assumption that this coefficient remains the same for different velocities.

Make sure you download ps04-code.zip, which provides you with an implementation of an immutable 2- dimensional vector class and an immutable 2x2 matrix class to aid you with some mathematics for this assignment. While these classes may seem simple, please take some time to go through its methods and comments.

Now, let us examine a little example that demonstrates what we can do with the physics engine. We build a world, and add four thin immobile bodies to form walls at the edges of the screen (we make a body immobile by giving it an infinite mass). Next we place some bodies inside the box and start the simulation. As gravity pulls the bodies downward, collisions may happen. After some period of times, collisions will stop, and the bodies reach the ground.


The physics engine should support a “world” object to which you can add objects. 
These objects have the following properties:

* position
* shape (though in this assignment, you only need to support circular shapes) 
* velocity

The world object needs to support a step function that takes in small time step dt and update the state of all the objects that it contains.


**References**

1. D. M. Bourg. Physics for Game Developers. O’Reilly Media, November 2001.
2. I. Millington. Game Physics Engine Development, Second Edition: How to Build a Robust Commercial-Grade Physics Engine for your Game. Morgan Kaufmann, August 2010.

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

Decide on how to allow the user to specify the angle of the bubble to be shot and implement it accordingly. Explain how your game handles user input for the angle and implement it. Remember to give the shot bubble a velocity!

##### 2. Bubble movement (5 points) #####
A bubble should be able to

- travel with its current velocity
- reflect off the side walls

##### 3. Bubble collisions (10 points) #####
The game engine should be able to detect the following collisions of the moving bubble:

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