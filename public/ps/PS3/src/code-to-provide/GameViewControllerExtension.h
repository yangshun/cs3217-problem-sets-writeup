//
//  GameViewControllerExtension.h
//

@interface GameViewController (Extension)

- (void)save;
  // REQUIRES: game in designer mode
  // EFFECTS: game state (grid) is saved

- (void)load;
  // MODIFIES: self (game bubbles in the grid)
  // REQUIRES: game in designer mode
  // EFFECTS: game level is loaded in the grid

- (void)reset;
  // MODIFIES: self (game bubbles in the grid)
  // REQUIRES: game in designer mode
  // EFFECTS: current game bubbles in the grid are deleted 


@end
