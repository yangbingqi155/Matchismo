//
//  Deck.m
//  Matchismo
//
//  Created by yangbinqi on 17/3/7.
//  Copyright © 2017年 valor. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "Deck.h"
#import "Card.h"
@interface Deck()
@property (strong, nonatomic)NSMutableArray *cards;
@end

@implementation Deck
-(NSMutableArray *)cards{
    if(!_cards){
        _cards=[[NSMutableArray alloc] init];
    }
    return _cards;
}
-(void)addCard:(Card *)card{
    [self addCard:card atTop:NO];
}

- (void)addCard:(Card *)card atTop:(BOOL)atTop{
    if(atTop){
        [self.cards insertObject:card atIndex:0];
    }else{
        [self.cards addObject:card];
    }

}

- (Card *)drawRandomCard{
    Card *randomCard=nil;
    if([self.cards count]){
        unsigned index=arc4random() % [self.cards count];
        randomCard=self.cards[index];
        [self.cards removeObjectAtIndex:index];
    }
    
    return  randomCard;
}

@end

