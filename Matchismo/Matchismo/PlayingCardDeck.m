//
//  PlayingCardDeck.m
//  Matchismo
//
//  Created by yangbinqi on 17/3/7.
//  Copyright © 2017年 valor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Deck.h"
#import "PlayingCardDeck.h"
#import "PlayingCard.h"

@implementation PlayingCardDeck
- (instancetype)init{
    self=[super init];
    if(self){
        for (NSString *suit in [PlayingCard validSuits]) {
            for (NSUInteger rank=0; rank<=[PlayingCard maxRank]; rank++) {
                PlayingCard *card=[[PlayingCard alloc] init];
                card.suit=suit;
                card.rank=rank;
                [self addCard:card];
            }
        }
    }
    
    return self;
}

@end
