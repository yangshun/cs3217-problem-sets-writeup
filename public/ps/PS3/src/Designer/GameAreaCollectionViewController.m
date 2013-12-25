//
//  GameAreaCollectionViewController.m
//  BubblePopper
//
//  Created by Ishaan Singal on 17/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import "Graph.h"
#import "GameAreaCollectionViewController.h"
#import "NSDictionary+NSDictionaryExtension.h"
#import "Constants.h"

@interface GameAreaCollectionViewController ()
@property NSMutableSet *topWallBubbles;
@property Graph *graph;
@end

@implementation GameAreaCollectionViewController

- (id)init {
    self = [super init];
    if (self) {
        self.topWallBubbles = [[NSMutableSet alloc]init];
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        self.bubbleCollection = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, 768, 700) collectionViewLayout:layout];
        
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panHandler:)];
        panGesture.minimumNumberOfTouches = 1;
        panGesture.maximumNumberOfTouches = 1;
        [self.bubbleCollection addGestureRecognizer:panGesture];

        UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(processLongpress:)];
//        longPressGesture.minimumPressDuration = 1.0;
        [self.bubbleCollection addGestureRecognizer:longPressGesture];
        
        [self.bubbleCollection registerClass:[GameBubbleCell class] forCellWithReuseIdentifier:@"Cell"];
        self.bubbleCollection.delegate = self;
        self.bubbleCollection.dataSource = self;
        self.bubbleCollection.allowsMultipleSelection = YES;
        self.bubbleCollection.backgroundColor = [UIColor clearColor];//[UIColor colorWithWhite:0.25f alpha:1.0f];
        [self.bubbleCollection layoutIfNeeded];
        [self createGraph];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)panHandler:(UIGestureRecognizer*)gesture {
    CGPoint panPoint = [(UILongPressGestureRecognizer*)gesture locationInView:self.bubbleCollection];
    NSIndexPath *index = [self.bubbleCollection indexPathForItemAtPoint:panPoint];
    [(GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:index] activateBubble];
}

- (void) processLongpress:(UILongPressGestureRecognizer *)sender {
    if (sender.state == UIGestureRecognizerStateBegan) {
        CGPoint point = [sender locationInView:self.bubbleCollection];
        NSIndexPath *indexPath = [self.bubbleCollection indexPathForItemAtPoint:point];
        if (indexPath) {
            [(GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:indexPath] inactiveBubble];
        }
    }
}

- (void)createGraph {
    self.graph = [[Graph alloc]initWithNumberOfVertices:(kNumberOfColumns * kNumberOfRows) isDirected:NO];
    for (int row = 0; row < kNumberOfRows; row++) {
        for (int column = 0; column < kNumberOfColumns; column++) {
            if (row % 2 == 1 && column == kNumberOfColumns - 1) {
                continue;
            } else {
                GameBubbleCell *bubbleCell = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:[NSIndexPath indexPathForItem:column inSection:row]];
                [self createLinksForBubble:bubbleCell];
            }
        }
    }
}

// collection view data source methods 
- (NSInteger)numberOfSectionsInCollectionView: (UICollectionView *)collectionView {
    return kNumberOfRows;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    int numberOfColumns = kNumberOfColumns;
    if (section%2 == 1) {
        numberOfColumns--;
    }
    return numberOfColumns;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    GameBubbleCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell createBubbleAtRow:indexPath.section Column:indexPath.item AtPos:cell.frame.origin];

    if (indexPath.section == 0) {
        [self.topWallBubbles addObject:cell];
    }
//    [cell activateBubbleWithType:arc4random() % 4];
//    [self.allBubbles addObject:cell];

    return cell;
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    return CGSizeMake(kBubbleViewDiameter, kBubbleViewDiameter);
}

//DECLARE THE MARGINS
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    CGFloat bottomInset = (1 - sin(M_PI/3)) * kBubbleViewDiameter;
    UIEdgeInsets edgeInset = UIEdgeInsetsMake(0, 0, -bottomInset, 0);
    if (section%2 == 1) {
        edgeInset = UIEdgeInsetsMake(0, kBubbleViewDiameter/2, -bottomInset , kBubbleViewDiameter/2);
    }
    return edgeInset;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    //Minimum spacing between cells
    CGFloat interimSpacing = 0.0f;
    return interimSpacing;
}


// COLLECTION VIEW DELEGATES
- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath {
    GameBubbleCell *thisCell = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:indexPath];
    [thisCell bubbleTapped];
//    NSLog(@"cell row: #%d column: #%d was selected", indexPath.section, indexPath.item);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    GameBubbleCell *thisCell = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:indexPath];
    [thisCell bubbleTapped];
//    NSLog(@"cell row: #%d column: #%d was selected", indexPath.section, indexPath.item);

}


- (void)createLinksForBubble:(GameBubbleCell*)gameBubble {
    int row = gameBubble.bubble.row;
    int column = gameBubble.bubble.column;
    
    GameBubbleCell *leftBubble, *rightBubble, *topLeftBubble, *topRightBubble, *bottomLeftBubble, *bottomRightBubble;
    //left
    if (column > 0) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:column - 1 inSection:row];
        leftBubble = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:index];
        if (leftBubble == nil) {
            NSLog(@"Row: %d, Column: %d", row, column);
        }
        [self.graph insertEdgeWithSource:gameBubble andDestination:leftBubble];
    }
    //right
    if (column < kNumberOfColumns - 2 || (row % 2 == 0 && column == kNumberOfColumns - 2)) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:column + 1 inSection:row];
        rightBubble = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:index];
        if (rightBubble == nil) {
            NSLog(@"Row: %d, Column: %d", row, column);
        }
        [self.graph insertEdgeWithSource:gameBubble andDestination:rightBubble];
    }
    //top left
    if (row > 0 && (column > 0 || row % 2 == 1)) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:column - (row+1)%2 inSection:row - 1];
        topLeftBubble = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:index];
        if (topLeftBubble == nil) {
            NSLog(@"Row: %d, Column: %d", row, column);
        }
        [self.graph insertEdgeWithSource:gameBubble andDestination:topLeftBubble];
    }
    //top right
    if (row > 0 && (column < kNumberOfColumns - 1)) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:column + row%2 inSection:row - 1];
        topRightBubble = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:index];
        if (topRightBubble == nil) {
            NSLog(@"Row: %d, Column: %d", row, column);
        }
        [self.graph insertEdgeWithSource:gameBubble andDestination:topRightBubble];
    }
    
    //bottom left
    if ((row < kNumberOfRows - 1) && (column > 0 || row % 2 == 1)) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:column - (row+1)%2 inSection:row + 1];
        bottomLeftBubble = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:index];
        if (bottomLeftBubble == nil) {
            NSLog(@"Row: %d, Column: %d", row, column);
        }
        [self.graph insertEdgeWithSource:gameBubble andDestination:bottomLeftBubble];
    }
    //bottom right
    if ((row < kNumberOfRows - 1) && (column < kNumberOfColumns - 1)) {
        NSIndexPath *index = [NSIndexPath indexPathForItem:column + row%2 inSection:row + 1];
        bottomRightBubble = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:index];
        if (bottomRightBubble == nil) {
            NSLog(@"Row: %d, Column: %d", row, column);
        }
        [self.graph insertEdgeWithSource:gameBubble andDestination:bottomRightBubble];
    }
}

- (void)redesignLevel {
    for (int row = 0; row < kNumberOfRows; row++) {
        for (int column = 0; column < kNumberOfColumns; column++) {
            if (row % 2 == 1 && column == kNumberOfColumns - 1) {
                continue;
            } else {
                GameBubbleCell *thisBubble = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:[NSIndexPath indexPathForItem:column inSection:row]];
                if (thisBubble.bubble.bubbleState == kKilled) {
                    [thisBubble inactiveBubble];
                }
            }
        }
    }
}


- (void)createLevel {
    for (int row = 0; row < kNumberOfRows; row++) {
        for (int column = 0; column < kNumberOfColumns; column++) {
            if (row % 2 == 1 && column == kNumberOfColumns - 1) {
                continue;
            } else {
                GameBubbleCell *thisBubble = (GameBubbleCell*)[self.bubbleCollection cellForItemAtIndexPath:[NSIndexPath indexPathForItem:column inSection:row]];
                if (thisBubble.bubble.bubbleState == kActive) {
                    if (![self removeUnconnectedBubble:thisBubble]) {
                        [thisBubble deactiveBubble];
                    }
                }
                else {
                    [thisBubble deactiveBubble];
                }
            }
        }
    }
    return;
}

- (BOOL)removeUnconnectedBubble:(GameBubbleCell*)gameBubble {
    NSMutableArray *stack = [[NSMutableArray alloc]init];
    NSMutableSet *visited = [[NSMutableSet alloc]init];
    [stack addObject:gameBubble];
    while ([stack count] != 0) {
        GameBubbleCell *tempBubble = [stack lastObject];
        [stack removeObject:tempBubble];
        if ([self.topWallBubbles containsObject:tempBubble]) {
            return YES;
        }
        NSSet *adjacentNodes = [self.graph getNeighboursOfNode:tempBubble];
        for (GameBubbleCell* neighbour in adjacentNodes ) {
            if (neighbour == nil) {
                NSLog(@"nil");
            }
            if (![visited containsObject:neighbour] && neighbour.bubble.bubbleState == kActive) {
                [stack addObject:neighbour];
            }
        }
        [visited addObject:tempBubble];
    }
    
//    NSEnumerator* dfsEnumerator = [self.bubbleGraph dfsEnumeratorWithStartNode:[NSNumber valueWithNonretainedObject:gameBubble]];
//    BOOL connectedFlag = NO;
//    for (GameBubble *tempBubble in dfsEnumerator) {
//        if (tempBubble.bubble.bubbleState == kKilled) {
//            continue;
//        }
//        if ([topWallBubbles containsObject:tempBubble]) {
//            connectedFlag = YES;
//            break;
//        }
//    }
//    
//    if (!connectedFlag) {
//        [gameBubble deactiveBubble];
//        [self removeAllInstancesOfBubble:gameBubble];
//    }
    
    //    for (GameBubble *gamebubble in self.bubbleGridGraph.allKeys) {
    //        if (gamebubble.bubble.bubbleState == kKilled) {
    //            continue;
    //        }
    //        BOOL connectedFlag = NO;
    //        NSEnumerator *bfsEnumerator = [self.bubbleGridGraph bfsEnumeratorWithStartNode:gamebubble];
    //        for (GameBubble *bfsNodes in bfsEnumerator) {
    //            if ([topWallBubbles containsObject:bfsNodes]) {
    //                connectedFlag = YES;
    //                break;
    //            }
    //        }
    //        if (!connectedFlag) {
    //            [gamebubble deactiveBubble];
    //            [self removeAllInstancesOfBubble:gamebubble];
    //        }
    //    }
    
    return NO;
}


@end
