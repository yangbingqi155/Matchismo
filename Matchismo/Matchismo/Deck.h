//
//  Deck.h
//  Matchismo
//
//  Created by yangbinqi on 17/3/7.
//  Copyright © 2017年 valor. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Card.h"

@interface Deck : NSObject
- (void)addCard:(Card *) card;
- (void)addCard:(Card *) card atTop:(BOOL)atTop;

- (Card *)drawRandomCard;

@end

