//
//  SetCard.m
//  Matchismo
//
//  Created by yangbinqi on 17/5/3.
//  Copyright © 2017年 valor. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SetCard.h"

@implementation SetCard

+(NSArray *)validSymbols{
    return @[@"◼︎",@"▲",@"○"];
}
+(NSArray *)validColors{
    return @[@"red",@"green",@"blue"];
}
+(NSArray *)validNumbers{
    return @[@1,@2,@3];
}
+(NSArray *)validShaddings{
    return @[@"striped",@"solid",@"open"];

}

-(int)matched:(NSArray *)otherCards{

    
    return  0;
}


@end