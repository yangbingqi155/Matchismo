//
//  SetCardDeck.m
//  Matchismo
//
//  Created by yangbinqi on 17/5/3.
//  Copyright © 2017年 valor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCardDeck.h"
#import "SetCard.h"

@implementation SetCardDeck

-(instancetype)init{
    self=[super init];
    for (NSString * symbol in [SetCard validSymbols]) {
        for (NSString *color in [SetCard validColors]) {
            for (NSNumber *number in [SetCard validNumbers]) {
                for (NSString *shadding in [SetCard validShaddings]) {
                    SetCard *card=[[SetCard alloc] init];
                    card.symbol=symbol;
                    card.color=color;
                    card.number=[number unsignedIntegerValue];
                    card.shadding=shadding;
                    [self addCard:card];
                }
            }
        }
    }
    return self;
}

@end