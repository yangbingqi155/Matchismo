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

static const int SIGLE_RANK_SCORE=4;
static const int SIGLE_SUIT_SCORE=1;
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
- (void) addMatchedCard:(PlayingCard *)card matchedCards:(NSMutableArray *) cards{
    if(![cards containsObject:card]){
        [cards addObject:card];
    }
}
- (void) colletionMatchedCards:(NSMutableArray *) chooseCards matchedCards:(NSMutableArray *) cards isRank:(BOOL) isRank{
    for (int i=0; i<[chooseCards count]; i++) {
        for (int j=i+1; j<[chooseCards count]; j++) {
            PlayingCard *firstCard=chooseCards[i];
            PlayingCard *secondCard=chooseCards[j];
            if(isRank){
                if(firstCard.rank == secondCard.rank){
                    [self addMatchedCard:firstCard matchedCards:cards ];
                    [self addMatchedCard:secondCard matchedCards:cards ];
                }
            }
            else{
                if([firstCard.suit isEqualToString: secondCard.suit]){
                    [self addMatchedCard:firstCard matchedCards:cards ];
                    [self addMatchedCard:secondCard matchedCards:cards ];
                }
            }
            
        }
    }
}

- (int)match:(NSArray *)otherCards{
    int score=0;
    
    if([otherCards count]){
        NSMutableArray *matchedRankCards=[[NSMutableArray alloc] init];
        NSMutableArray *matchedSuitCards=[[NSMutableArray alloc] init];
        NSMutableArray *chooseCards=[[NSMutableArray alloc] init];
        [chooseCards addObject:self];
        for (id card in otherCards) {
            if([card isKindOfClass:[PlayingCard class]]){
                [chooseCards addObject:(PlayingCard *)card];
            }
            
        }
        [self colletionMatchedCards:chooseCards matchedCards:matchedRankCards isRank:YES];
        [self colletionMatchedCards:chooseCards matchedCards:matchedSuitCards isRank:NO];
        
     
            if([matchedRankCards count] >=[chooseCards count]-1){
                score=SIGLE_RANK_SCORE*([matchedRankCards count]-1) ;
            }
            else if([matchedSuitCards count] >=[chooseCards count]-1){
                score=SIGLE_SUIT_SCORE*([matchedSuitCards count]-1) ;
            }
        
    }
    return score;
}


- (NSString *) contents{
    NSArray *rankStrings=[PlayingCard rankStrings];
    return [rankStrings[self.rank] stringByAppendingString:self.suit];
}

@end
