//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by Patrick Slattery on 8/30/13.
//  Copyright (c) 2013 Patrick Slattery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlayingCard.h"
#import "Deck.h"

@interface CardMatchingGame : NSObject
// designated initializer
- (id)initWithCardCount:(NSUInteger)count
              usingDeck:(Deck *)deck
            matchNumber:(int)matchNumber;

- (void)flipCardAtIndex:(NSUInteger)index;

- (Card *)cardAtIndex:(NSUInteger)index;

@property (readonly, nonatomic) int score;
@property (readonly, nonatomic) NSString *status;
@property (readonly, nonatomic) int matchNumber;
@end
