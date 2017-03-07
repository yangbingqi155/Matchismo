//
//  Card.m
//  Matchismo
//
//  Created by yangbinqi on 17/3/7.
//  Copyright © 2017年 valor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"
@interface Card()

@end

@implementation Card

-(int)match:(NSArray *)otherCards
{
    int score=0;
    for (Card* card in otherCards) {
        if([card.contents isEqualToString:self.contents]){
            score=1;
        }
    }
    
    return score;
}

@end
