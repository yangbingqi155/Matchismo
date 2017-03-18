//
//  CardMatchingGame.h
//  Matchismo
//
//  Created by yangbinqi on 17/3/11.
//  Copyright © 2017年 valor. All rights reserved.
//

#import "Foundation/Foundation.h"
#import "Deck.h"
#import "Card.h"
@interface CardMatchingGame : NSObject

@property (nonatomic,readonly) NSInteger score;
@property (nonatomic,strong,readonly) NSMutableString *lastResultMessage;
@property (nonatomic) NSUInteger matchMode;

- (instancetype)initWithCardCount:(NSUInteger) count usingDeck:(Deck *)deck;

- (void)chooseCardAtIndex:(NSUInteger) index;
- (Card *)cardAtIndex:(NSUInteger) index;



@end
