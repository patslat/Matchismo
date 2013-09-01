//
//  Deck.h
//  Matchismo
//
//  Created by Patrick Slattery on 8/30/13.
//  Copyright (c) 2013 Patrick Slattery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject

- (void)addCard:(Card *)card atTop:(BOOL)atTop;
- (Card *)drawRandomCard;

@end