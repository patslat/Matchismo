//
//  Deck.m
//  Matchismo
//
//  Created by Patrick Slattery on 8/30/13.
//  Copyright (c) 2013 Patrick Slattery. All rights reserved.
//

#import "Deck.h"

@interface Deck()
@property (strong, nonatomic) NSMutableArray *cards; // of Card
@end

@implementation Deck

- (NSMutableArray *)cards
{
	if (!_cards) _cards = [[NSMutableArray alloc] init];
	return _cards;
} // if you have property, but implement a getter, compiler ignores the property getter

- (void)addCard:(Card *)card atTop:(BOOL)atTop
{
	if (atTop) {
		[self.cards insertObject:card atIndex:0]; // adds object at top
	} else {
		[self.cards addObject:card]; // adds object at the end
	}
}

- (Card *)drawRandomCard
{
	Card *randomCard = nil; // create a pointer for a card
    
	if (self.cards.count) {
		unsigned index = arc4random() % self.cards.count;
		randomCard = self.cards[index];
		[self.cards removeObjectAtIndex:index];
	}
    
	return randomCard;
}

@end
