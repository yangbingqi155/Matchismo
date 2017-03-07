//
//  Card.h
//  Matchismo
//
//  Created by yangbinqi on 17/3/7.
//  Copyright © 2017年 valor. All rights reserved.
//
#import <Foundation/Foundation.h>

@interface Card : NSObject
@property (strong,nonatomic) NSString *contents;
@property (nonatomic, getter=isChosen) BOOL chosen;
@property (nonatomic, getter=isMatched) BOOL matched;

- (int)match:(NSArray *)otherCards;

@end

