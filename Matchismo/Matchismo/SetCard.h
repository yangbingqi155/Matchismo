//
//  SetCard.h
//  Matchismo
//
//  Created by yangbinqi on 17/5/3.
//  Copyright © 2017年 valor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Card.h"

@interface  SetCard :Card

@property (nonatomic,strong)NSString *symbol;
@property (nonatomic,strong)NSString *color;
@property (nonatomic) NSUInteger number;
@property (nonatomic,strong)NSString *shadding;

+(NSArray *)validSymbols;
+(NSArray *)validColors;
+(NSArray *)validNumbers;
+(NSArray *)validShaddings;

@end
