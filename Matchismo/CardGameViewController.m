//
//  CardGameViewController.m
//  Matchismo
//
//  Created by Patrick Slattery on 8/29/13.
//  Copyright (c) 2013 Patrick Slattery. All rights reserved.
//

#import "CardGameViewController.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface CardGameViewController ()

// only definable here because it can't send things, can only receive
// weakly stored

@property (weak, nonatomic) IBOutlet UILabel *flipsLabel;
@property (nonatomic) int flipCount;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;
@property (strong, nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreDisplay;
@property (weak, nonatomic) IBOutlet UILabel *matchDisplay;
@property (strong, nonatomic) IBOutlet UISegmentedControl *matchNumber;


@end

@implementation CardGameViewController

- (CardMatchingGame *)game
{
    if (!_game)_game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[[PlayingCardDeck alloc] init] matchNumber:(self.matchNumber.selectedSegmentIndex + 2)];
    return _game;
}


- (void)setCardButtons:(NSArray *)cardButtons
{
    _cardButtons = cardButtons;
    [self updateUI];
}

- (void)updateUI
{

    for (UIButton *cardButton in self.cardButtons) {
        Card *card = [self.game cardAtIndex:[self.cardButtons indexOfObject:cardButton]];
        [cardButton setTitle:card.contents forState:UIControlStateSelected];
        [cardButton setTitle:card.contents forState:UIControlStateSelected|UIControlStateDisabled];
        cardButton.selected = card.isFaceUp;
        cardButton.enabled = !card.isUnplayable;
        cardButton.alpha = (card.isUnplayable ? 0.3 : 1.0);
    }
    
    self.scoreDisplay.text = [NSString stringWithFormat:@"Score: %d", self.game.score];
    
    self.matchDisplay.text = self.game.status;
    
    if ([self.game isGameOver]) {
        self.matchNumber.hidden = YES;
    } else {
        // TODO disable cards and display game over
        self.matchNumber.hidden = NO;
    }
}


- (void)setFlipCount:(int)flipCount
{
    _flipCount = flipCount;
    self.flipsLabel.text = [NSString stringWithFormat:@"Flips: %d", self.flipCount];
}
// remember setTitleForState

// IBAction is a typedef to void
- (IBAction)flipCard:(UIButton *)sender
{
    [self.game flipCardAtIndex:[self.cardButtons indexOfObject:sender]];
    self.flipCount++;
    [self updateUI];
}


- (IBAction)resetGame:(id)sender {
    
    _game = [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[[PlayingCardDeck alloc] init] matchNumber:(self.matchNumber.selectedSegmentIndex + 2)];

    [self setFlipCount:0];
    self.scoreDisplay.text = [NSString stringWithFormat:@"Score: %d", 0];
    [self updateUI];
    [self setCardButtons:self.cardButtons];
    
}


@end
