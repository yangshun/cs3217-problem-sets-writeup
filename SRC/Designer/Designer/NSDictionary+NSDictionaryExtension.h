//
//  NSDictionary+NSDictionaryExtension.h
//  PS1
//
//  Created by Ishaan Singal on 12/12/13.
//  Copyright (c) 2013 ishaan.practise. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BFSEnumerator.h"
#import "DFSEnumerator.h"

@interface NSDictionary (NSDictionaryExtension)

- (NSEnumerator*)bfsEnumeratorWithStartNode:(id)startNode;

- (NSEnumerator*)dfsEnumeratorWithStartNode:(id)startNode;

@end
