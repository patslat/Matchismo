//
//  PlayingCard.h
//  Matchismo
//
//  Created by Patrick Slattery on 8/30/13.
//  Copyright (c) 2013 Patrick Slattery. All rights reserved.
//

#import "Card.h"

@interface PlayingCard : Card

@property (strong, nonatomic) NSString *suit;
// why not unsigned int? NSInteger and NSUInteger are just typedefs
@property (nonatomic) NSUInteger rank;

+ (NSArray *)validSuits;
+ (NSUInteger)maxRank;

@end
