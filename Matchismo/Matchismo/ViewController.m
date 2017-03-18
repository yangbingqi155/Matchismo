//
//  ViewController.m
//  Matchismo
//
//  Created by yangbinqi on 17/3/4.
//  Copyright © 2017年 valor. All rights reserved.
//

#import "ViewController.h"
#import "Card.h"
#import "PlayingCard.h"
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "CardMatchingGame.h"

@interface ViewController ()
@property (strong ,nonatomic) Deck *deck;
@property (strong,nonatomic) CardMatchingGame *game;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *cardButtons;

@property (weak, nonatomic) IBOutlet UISegmentedControl *matchedModelSwitch;
@property (weak, nonatomic) IBOutlet UILabel *lastResultLabel;

@end

@implementation ViewController

- (CardMatchingGame *)game
{
    if(!_game){
        _game = [self createGame];
        _game.matchMode=2;
    }
    return _game;
}
- (CardMatchingGame *) createGame{
    return [[CardMatchingGame alloc] initWithCardCount:[self.cardButtons count] usingDeck:[self createDeck]];
}
- (Deck *) deck{
    if(!_deck){
        _deck=[self createDeck];
    }
    
    return _deck;        
}

- (Deck *) createDeck{
    return  [[PlayingCardDeck alloc] init];
}
- (IBAction)touchCardButton:(UIButton *)sender {
    [self.matchedModelSwitch setEnabled:NO];
    int cardButtonIndex=[self.cardButtons indexOfObject:sender];
    [self.game chooseCardAtIndex:cardButtonIndex];
    [self.lastResultLabel setText:self.game.lastResultMessage];
    [self updateUI];
   
}

- (IBAction)changeMatchedModeSwitch:(UISegmentedControl *)sender {
    if([sender selectedSegmentIndex]==0)
    {
        self.game.matchMode=2;
    }else if([sender selectedSegmentIndex]==1){
        self.game.matchMode=3;
    }

}

- (IBAction)newGameButton:(UIButton *)sender {
    self.game=nil;
    [self.matchedModelSwitch setEnabled:YES];
    [self updateUI];
}

- (void)updateUI{
    for (UIButton *cardButton in self.cardButtons) {
        int cardButtonIndex=[self.cardButtons indexOfObject:cardButton];
        Card *card=[self.game cardAtIndex:cardButtonIndex];
        [cardButton setTitle:[self titleForCard:card] forState:UIControlStateNormal];
        [cardButton setBackgroundImage:[self backgroudImageForCard:card] forState:UIControlStateNormal];
         [self.scoreLabel setText:[NSString stringWithFormat:@"Score : %d",self.game.score]];
        cardButton.enabled=!card.isMatched;
    }
}
- (NSString *)titleForCard:(Card *) card{
    return  card.isChosen?card.contents:@"";
}
-(UIImage *)backgroudImageForCard:(Card *) card{
    return  [UIImage imageNamed:card.isChosen?@"cardfront":@"cardback"];
}

@end
