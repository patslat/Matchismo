//
//  PlayingCard.m
//  Matchismo
//
//  Created by Patrick Slattery on 8/30/13.
//  Copyright (c) 2013 Patrick Slattery. All rights reserved.
//

#import "PlayingCard.h"

@implementation PlayingCard

- (NSString *)contents
{
    NSArray *rankStrings = [PlayingCard rankStrings];
	return [rankStrings[self.rank] stringByAppendingString:self.suit];
}
// if you define a setter and a getter, you don't get the free @synthesize
@synthesize suit = _suit;

+ (NSArray *)validSuits {
	return @[@"♥", @"♦", @"♠", @"♣"];
}
          
+ (NSArray *)rankStrings {
    return @[@"?", @"A", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"10", @"J", @"Q", @"K"];
    // immutable array, the @signs are creating array and strings on the fly
}

+ (NSUInteger)maxRank { return [self rankStrings].count - 1; }

-(void)setRank:(NSUInteger)rank {
    if (rank <= [PlayingCard maxRank]) {
        _rank = rank;
    }
}
          
-(void)setSuit:(NSString *)suit {
    if ([[PlayingCard validSuits] containsObject:suit]) {
        _suit = suit;
    }
}
          
- (NSString *)suit {
return _suit ? _suit : @"?";
}

- (int)match:(NSArray *)otherCards;
{
    int score = 0;
    
    if ([otherCards count] == 1) {
        PlayingCard *otherCard = [otherCards lastObject];
        if ([otherCard.suit isEqualToString:self.suit]) {
            score = 1;
        } else if (otherCard.rank == self.rank) {
            score = 4;
        }
    } else {
        int rankMatch = 0;
        int suitMatch = 0;
        for (PlayingCard *otherCard in otherCards) {
            if ([otherCard.suit isEqualToString:self.suit]) {
                suitMatch += 1;
            } else if (otherCard.rank == self.rank) {
                rankMatch += 1;
            } else {
                return 0;
            }
        }
        if (suitMatch && !rankMatch) {
            score = suitMatch;
        }
        if (rankMatch && !suitMatch) {
            score = rankMatch;
        }
    }
        return score;
}
          
@end
