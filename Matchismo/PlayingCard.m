//
//  PlayingCard.m
//  Matchismo
//
//  Created by yangbinqi on 17/3/7.
//  Copyright © 2017年 valor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
#import "PlayingCard.h"

@implementation PlayingCard
@synthesize suit=_suit;

+ (NSArray *)validSuits{
    return @[@"♥︎",@"♦︎",@"♠︎",@"♣︎"];
}
+ (NSArray *)rankStrings{
    return @[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"J",@"Q",@"K"];
}
+ (NSUInteger)maxRank{
    return [[self rankStrings] count] - 1;
}

- (void)setSuit:(NSString *)suit{
    if([[PlayingCard validSuits] containsObject:suit]){
        _suit=suit;
    }
    
}

- (NSString *) suit{
    return _suit ? _suit : @"?";
}

- (void)setRank:(NSUInteger) rank{
    if(rank<= [PlayingCard maxRank]){
        _rank=rank;
    }
    
}

- (NSString *) contents{
    NSArray *rankStrings=[PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@end
