//
//  BFSEnumerator.h
//  PS1
//
//  Created by Ishaan Singal on 12/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFSEnumerator : NSEnumerator
- (id)init;
- (id)initWithSourceTree:(NSDictionary*)sourceTree andStartNode:(id)startNode;
- (id)nextObject;

@end
