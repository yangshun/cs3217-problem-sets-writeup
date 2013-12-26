//
//  GameBubble.h
// 
// You can add your own prototypes in this file
//

#import <UIKit/UIKit.h>

// Constants for the three game objects to be implemented
typedef enum {kGameBubbleBasic} GameBubbleType;

@interface GameBubble : UIViewController {
  // You might need to add state here.

}

@property (nonatomic, readonly) GameBubbleType bubbleType;

- (void)tapHandler:(UIGestureRecognizer *)gesture;
  // MODIFIES: bubble model (color)
  // REQUIRES: game in designer mode
  // EFFECTS: the user taps the bubble with one finger
  //          if the bubble is active, it will change its color

- (void)longpressHandler:(UIGestureRecognizer *)gesture;
  // MODIFIES: bubble model (state from active to inactive)
  // REQUIRES: game in designer mode, bubble active in the grid
  // EFFECTS: the bubble is 'erased' after being long-pressed

// You will need to define more methods to complete the specification. 

@end
