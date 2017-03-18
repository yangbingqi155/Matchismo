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
@property (nonatomic,strong,readwrite) NSMutableString *lastResultMessage;
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

- (NSMutableString *)lastResultMessage{
    if(!_lastResultMessage){
        _lastResultMessage=[[NSMutableString alloc] init];
    }
    return _lastResultMessage;
}

- (void) chooseCardAtIndex:(NSUInteger)index{
    Card *card=self.cards[index];
    if(card.isChosen){
        card.chosen=NO;
    }
    else{
        int winScore=0;
        BOOL isCanMatch=NO;
        NSMutableArray *chosenCards=[[NSMutableArray alloc] init];
        for (Card *otherCard in self.cards) {
            if(otherCard.isChosen && !otherCard.isMatched){
                [chosenCards addObject:otherCard];
            }
        }
        
        if([chosenCards count]+1==self.matchMode&&[chosenCards count]){
            isCanMatch=YES;
            int matchedScore=[card match:chosenCards];
            if(matchedScore){
                winScore=matchedScore*MATCH_BONUS;
                card.matched=YES;
            }
            else{
                winScore=0-MISMATCH_PENALTY;
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
        
        self.score+=winScore;
        self.score -=COST_TO_CHOOSE;
        card.chosen=YES;
        
        NSMutableString *conentOfChosenCards=[[NSMutableString alloc] init];
        for (Card *chosenCard in chosenCards) {
            [conentOfChosenCards appendString:chosenCard.contents];
            [conentOfChosenCards appendString:@" "];
        }
        if(isCanMatch){
            if(winScore>0){
                [self.lastResultMessage appendString:@"Matched "];
                [self.lastResultMessage appendString:conentOfChosenCards];
                [self.lastResultMessage appendFormat:@" for %d points.",winScore];
            }
            else{
                [self.lastResultMessage appendString:conentOfChosenCards];
                [self.lastResultMessage appendFormat:@" don't match! %d point penalty!",winScore];
            }
        }else
        {
            self.lastResultMessage= [NSMutableString  stringWithString:card.contents];
        }
    }
}

- (Card *)cardAtIndex:(NSUInteger)index{
    Card *card= index<[self.cards count] ? self.cards[index] : nil;
    
    return  card;
}

@end
