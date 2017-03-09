//
//  ViewController.m
//  Matchismo
//
//  Created by yangbinqi on 17/3/4.
//  Copyright © 2017年 valor. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *flipsLable;
@property (nonatomic) int flipCount;
@end

@implementation ViewController

- (void) setFlipCount:(int)flipCount{
    _flipCount=flipCount;
    self.flipsLable.text=[NSString stringWithFormat:@"Flips : %d",self.flipCount];
    NSLog(@"flipCount changed to %d",self.flipCount);
}

- (IBAction)touchCardButton:(UIButton *)sender {
    if([sender.currentTitle length]){
        UIImage *cardImage=[UIImage imageNamed:@"cardback"];
        [sender setBackgroundImage: cardImage forState:UIControlStateNormal];
        [sender setTitle: @"" forState:UIControlStateNormal];
    }
    else{
        UIImage *cardImage=[UIImage imageNamed:@"cardfront"];
        [sender setBackgroundImage: cardImage forState:UIControlStateNormal];
        [sender setTitle: @"A♣︎" forState:UIControlStateNormal];
    }
    self.flipCount++;
    
}

@end
