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
        NSMutableArray *chosenCards=[[NSMutableArray alloc] init];
        for (Card *otherCard in self.cards) {
            if(otherCard.isChosen && !otherCard.isMatched){
                [chosenCards addObject:otherCard];
            }
        }
        
        if([chosenCards count]+1==self.matchMode&&[chosenCards count]){
            int matchedScore=[card match:chosenCards];
            if(matchedScore){
                self.score+=matchedScore*MATCH_BONUS;
                card.matched=YES;
            }
            else{
                self.score-=MISMATCH_PENALTY;
            }
            
            for (Card *chosenCard in chosenCards) {
                if(matchedScore){
                    chosenCard.matched=YES;
                    chosenCard.chosen=YES;
                }
                else{
                    chosenCard.chosen=NO;
                }
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
