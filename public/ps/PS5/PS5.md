Problem Set 5
==

*Issue Date: 16 February 2015  
Due Date: 1 March 2015  
Tutorial Date: Week 7*

Section 1 - Designing Your Game
--
In this problem set, your task is to complete the implementation of Bubble Blast Saga by integrating the modules you implemented in Problem Sets 3 & 4.

***Reminder: Please read the entire problem set before starting.***  

### Introduction ###

In this assignment you will see your efforts over the past few weeks to completion. You have three key tasks in this assignment:

1. Integrating the game engine with the MVC-based GUI from Problem Set 3; and   
2. Tying up the loose ends to complete the game.

The objective of this assignment is to help you better understand design and integration in software engineering. If your did your past two problem sets very well and debugged your code thoroughly, the integration should not be too difficult; on the other hand, if your previous problem sets still have bugs, the bugs will come back to haunt you and you would probably want to debug them before attempting to integrate. How you choose to do this assignment is really up to you. Our goal here is to provide you with an opportunity to learn.

Note that while you are required to achieve certain technical requirements in the Problem Set, you are given the latitude to decide on the actual rules of the game you implement. As long as the final game involves bubbles being shot and reacting correctly according to the colour and types of bubbles, you are pretty much allowed to do anything you want. You don’t even need to use the graphical images we provide and you can change the background.

### What is YOUR game gonna be? ###

Unlike your previous problem sets, the grading of the assignment is divided into two components: satisfying the technical requirements (70%) and “coolness” factor (30%). Before you get too stressed, note that satisfying the technical requirements well is sufficient for you to get a solid A grade in CS3217. The 30% “coolness” factor element in this problem set is designed to provide you with the chance to show off your creativity and to earn an A+ grade.

The following are the conditions that your game must satisfy:

- It involves a game engine that handles destruction of similarly coloured bubbles that are connected adjacently in groups of 3 of more. Hanging bubbles should also be removed at the end of each turn.
- There are power up bubbles that have special behaviours when collided with.
- It allows for the creation, saving and loading of multiple “levels” or level-equivalents.
- There is a complete game flow where there are transitions between the menu screen, level selection screen, level design screen and gameplay screen.

As long as your game satisfies the above conditions, you are free to do pretty much anything you want. You are free to replace the background and provided images, if you desire. First, read through this entire problem set to understand the technical requirements for the problem. Next, describe the rules of your game and how the game works in a file called `answers.txt`. Although the rules are not graded, it gives the players (which includes your tutors) expectations on how the game is supposed to behave, so as to can distinguish between features and bugs :P

Section 2 - Completing the Game (100 points)
--
In Problem Set 3, you implemented the level designer of the game. The user can freely colour the bubbles in the arena, save and load levels while in Problem Set 4, you wrote the logic for the removal of the bubbles after the fired bubble collides with the bubbles in the arena. 

It is time to implement the actual game. On the level designer screen, the game starts when the user presses the **START** button (though you are free to change the user interface to something else that accomplishes the same). This will trigger several things: a bubble can be fired from the bottom, the arena bubbles will interact with the fired bubble upon collision, and animations are also enabled.

### Problem 1: Cannon Direction (5 points) ###

A cannon that fires a bubble will be added to the game. After the game starts, while the user is selecting the direction to fire the bubble, the cannon should rotate to face the direction of firing. In the provided assets, you can find the following image which might be useful:

- `cannon.png`, an animation sprite of the cannon when it fires the bubbles.

Explain in `answers.txt` how the user is supposed to select the cannon direction.

### Problem 2: Upcoming Bubbles (10 points) ###

It would be helpful to the user if he/she knew the colours of the next few bubbles so that he can better plan his/her shots. Your task is to come up with an algorithm to decide on the colours of the next few bubbles and justify it in `answers.txt`.

Implement an interface to display the next few bubbles that the cannon will fire. It is up to you to decide how many bubbles you want to show (minimum of 1). The interface should also be updated after bubbles are fired.

**Note:** The cannon only fires normal coloured bubbles, it does not fire special bubbles.

### Problem 3: Integration (25 points) ###

After adding the cannon sprite, and implementing an algorithm which decides the colour of the upcoming bubbles, it is time to put them all together. Integrate the game engine with the designed level and activate it when the user pushes the **START** button; he should be able to play that level and test it out. 

Describe in the file `answers.txt` how your design allowed the integration of the game engine. Explain the advantages and disadvantages of your approach and alternative approaches.

### Problem 4: Special Bubbles (30 points) ###

The game would be more interesting with special bubbles. Hence we are going to implement special bubbles that will make the game even more fun. This is a test of the flexibility your software design! A good design will make the process of adding features relatively easy and pain-free.

Implement the following additional bubbles:

- **Indestructible Bubble** -  Cannot be removed through connecting with adjacent bubbles of the same colour. They have to be removed by falling out of the screen.
- **Lightning Bubble** - Removes all bubbles in the same row as it. All hanging bubbles thereafter should also be removed.
- **Bomb Bubble** - Removes all bubbles adjacent to it.
- **Star Bubble** - When a coloured bubble comes into contact with the star bubble, all bubbles of that colour in the arena will be removed.

Except for the indestructible bubble, the effects of the other special bubbles are triggered when the shot bubble's final position is adjacent to a special bubble (aka touching it).

1. Modify your level designer to support the addition of these special bubbles. **(5 points)**
2. Modify your game engine to handle these new bubble behaviours. **(20 points)**
3. Explain in the file `answers.txt` your general strategy for implementing these special behaviours. Explain why your strategy is the best among alternatives. **(5 points)**

### Problem 5: Game Flow (20 points) ###

Make the game a complete application by implementing the following screens and UI elements that allows transitions between them. You are required to use storyboard transitions.

- **Menu Screen** - Entry point of the application
 - Select Level Button - Leads to level selection screen
 - Design Level Button - Leads to level designer screen (Problem Set 3)
- **Level Selection Screen** - Interface that shows the levels that are pre-packaged with the application and levels that can be loaded in the design mode).
 - Buttons that lead to the gameplay screen which allows users to preloaded levels. There should be at least 3 different preloaded levels.
- **Level Designer Screen** - Interface created from Problem Set 3
 - As stated in Problem Set 3.
- **Gameplay Screen** - Interface for user to play a level (can be preloaded/designed)
 - Back Button - To return to the previous screen

### Problem 6: Module Dependency Diagram (5 points) ###

Draw the module dependency diagram for the basic implementation of your game (i.e. you do not need to include the bells and whistles). Save your diagram as `mdd.png` and include it in the root directory of your repository for submission.

Section 3 - Testing, Refinements and Reflections (100 points)
--
In this section, you will perform thorough testing of your app to make sure that it runs as intended. You will also try your best to refine and polish up your app.

### Problem 7: Integration Testing (30 points) ###

Testing is an integral part of software engineering. For the final game, you are supposed to implement a large number of features and it is important for you to test your final code to make sure that the game meets the stated requirements. The way to do this is to start from a hierarchy and then break down into smaller and more specific cases. For example:

- Black-box testing
 - Test level designer
     * ...
 - Test start game
     * ...
 - Test cannon rotation
     * ...
 - Test game engine
     * ...
 - ...
- Glass-box testing
 - ...
     * ...

Please describe your testing strategy in `answers.txt`. The testing strategy should also include the testing strategies for Problem Sets 3 and 4, since these are components of the final application. If you did your testing perfectly in the previous problem sets, you only need to replicate what you did earlier; if you didn’t do so well, this is where you show that you’ve learnt something and update the tests.

Of course, you should test the game as you have described instead of just listing down what you think you ought to test! You might want to let your friends try out your game and thereby help you test it too.

### Problem 8: The Bells & Whistles (60 points) ###

With a good design and good implementation for Problem Sets 3 and 4, extensions and integration should not take too much time. Spend your remaining time by finishing the game and adding extensions. The points in this part are subjective and take into consideration the general feeling of the entire game and will be awarded relative to the submissions by the rest of the class. The following is a list of possible improvements that you can consider implementing:

- Implement the bubble bursting animation using the sprite `bubble-burst.png`;
- Adding game score;
- End-game screen;
- Cannon has limited number of shots in the game, after which the player loses;
- Add trajectory animation and path to the cannon;
- Implement even more special bubbles!
- No snapping of colliding bubbles, i.e. no fixed 2D arrangement;
- Multiplayer mode;

You are free to add your own features to show off your creativity. Please describe **ALL** the extra features and improvements in the file `answers.txt`, so that your tutors can award you due credit.  Briefly describe how you modified your original design to implement each feature.

### Problem 9: Final Reflection (10 points) ###

**Note:** You should answer this question only after you have completed this problem set.

Comment on the original design of your MVC architecture and also on the design of your game engine. Is it possible to further improve the design/architecture? If so, how? If not, why not?

### Bonus Problem: Reflection (4 Bonus Points) ###

Please answer the following questions:

1. How many hours did you spend on each problem of this problem set?

2. In retrospect, what could you have done better to reduce the time you spent solving this problem set?

3. What could the CS3217 teaching staff have done better to improve your learning experience in this problem set?

4. Congratulations, you have completed all the Problem Sets for CS3217. To recap, the learning objectives of the various problem sets are as follows:

  - **Problem Set 1**: Introduction to Xcode and Swift/Objective-C 
  - **Problem Set 2**: Specifications and unit testing
  - **Problem Set 3**: MVC and GUI-programming in Swift/Objective-C
  - **Problem Set 4**: Design and implementation of a full software system
  - **Problem Set 5**: Integration of modules and integration testing

  Yes, we admit that the learning curve is very steep, but we don’t have a lot of time to get you up to speed. The real question is: do you feel that the problem sets have been well-designed to help you learn software engineering and Swift in a structured and effective way? Do you have any suggestions on how the problem sets can be improved?

Submit your answers to these bonus problems at [http://tiny.cc/cs3217-ps5](http://tiny.cc/cs3217-ps5). Thanks!

Section 4 - Grading and Submission
--
Please read this section carefully so that you fully understand the grading scheme and the mode of submission!

### Grading Scheme ###

In this module, you are being trained to become a good software engineer. The first and basic requirement is that your code must satisfy the requirements and be correct. Above and beyond correctness, you are required to write well-documented code.

For this problem set, we will be testing your code by compiling your app and uploading to an iPad to make sure that the game works as expected and you can play it. We will be looking at the following:

- Your submission should adhere to the submission format.
- You have answered the questions satisfactorily in a concise manner.
- Your project should build without errors or warnings.
- Your project should run without crashing.
- You have implemented extra features.
- Your game is complete. By this, we mean that you can create and play a level, the cannon can fire, the bubbles interact as expected, the game ends when all the bubbles on the screen are destroyed (or when the cannon finishes the number of bubble), the score is displayed when the game ends.

### Mode of Submission ###

You will be using a pilot locally hosted [GitLab](http://cs3217.comp.nus.edu.sg) instance for submitting your code and receiving feedback. 

There is no resource or template provided for this problem set. In the group [Problem Sets 2014](http://cs3217.comp.nus.edu.sg/groups/problem-sets-2014) under `Problem Set 5`, there is a repository which only contains the `.gitignore` as in the previous problem sets. Feel free to fork and clone it or create a new repository on your own but make sure to add the `.gitignore` to reduce the submission size.

**Important Note:** This time, you have to start a new Xcode project from scratch. We should be able to download the entire repository, import it into Xcode, and run your solution without making additional changes. You will be graded on the **latest commit** before the deadline.

In addition, your submission directory should contain your design explanation `answers.txt`, a module dependency diagram `mdd.png` and a README file where you specify which implementation files contain your code.

Clarifications and questions related to this assignment may be directed to the IVLE Forum under the header **“Problem Set 5: Putting It All Together”**.

*Good luck and have fun!*