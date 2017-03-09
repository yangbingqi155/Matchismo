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

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLable;
@property (nonatomic) int flipCount;
@property (strong ,nonatomic) Deck *deck;
@end

@implementation ViewController
- (Deck *) deck{
    if(!_deck){
        _deck=[[PlayingCardDeck alloc] init];
    }
    
    return _deck;        
}

- (void) setFlipCount:(int)flipCount{
    _flipCount=flipCount;
    self.flipsLable.text=[NSString stringWithFormat:@"Flips : %d",self.flipCount];
    NSLog(@"flipCount changed to %d",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if([sender.currentTitle length]){
        [sender setBackgroundImage: [UIImage imageNamed:@"cardback"] forState:UIControlStateNormal];
        [sender setTitle: @"" forState:UIControlStateNormal];
    }
    else{
        [sender setBackgroundImage: [UIImage imageNamed:@"cardfront"] forState:UIControlStateNormal];
        
        [sender setTitle: [self.deck drawRandomCard].contents forState:UIControlStateNormal];
    }
    self.flipCount++;
    
}

@end
