//
//  CardMatchingGame.m
//  Matchismo
//
//  Created by yangbinqi on 17/3/11.
//  Copyright © 2017年 valor. All rights reserved.
//


#import "CardMatchingGame.h"

@interface CardMatchingGame()
@property (nonatomic,readwrite) NSInteger score;
@property (nonatomic,strong) NSMutableArray *cards;

@end

@implementation CardMatchingGame
// or static const int MISMATCH_PENALTY=2
static const int MISMATCH_PENALTY=2;
static const int MATCH_BONUS= 4;
static const int COST_TO_CHOOSE=1;

- (NSMutableArray *)cards{
    if(!_cards){
        _cards=[[NSMutableArray alloc] init];
    }
    return _cards;
}

//Designated initializer
- (instancetype)initWithCardCount:(NSUInteger)count usingDeck:(Deck *)deck
{
    self=[super init];
    if(self){
        for (int i=0; i<count; i++) {
            Card *card=[deck drawRandomCard];
            [self.cards addObject:card];
        }
    }
    return  self;
}

- (void) chooseCardAtIndex:(NSUInteger)index{
    Card *card=self.cards[index];
    if(card.isChosen){
        card.chosen=NO;
    }
    else{
        for (Card *otherCard in self.cards) {
            if(otherCard.isChosen && !otherCard.isMatched){
                int matchedScore=[card match:@[otherCard]];
                if (matchedScore) {
                    self.score+=matchedScore*MATCH_BONUS;
                    card.matched=YES;
                    otherCard.matched=YES;
                }
                else
                {
                    self.score -= MISMATCH_PENALTY;
                    otherCard.chosen=NO;
                }
                break;
            }
        }
        self.score -=COST_TO_CHOOSE;
        card.chosen=YES;
    }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    Card *card= index<[self.cards count] ? self.cards[index] : nil;
    
    return  card;
}

@end
