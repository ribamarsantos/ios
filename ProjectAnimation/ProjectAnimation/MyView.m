//
//  MyView.m
//  ProjectAnimation
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "MyView.h"

@implementation MyView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void) hideElements{
    self.btnUse.frame = CGRectMake(160.f, 289.f, 0.f, 0.f);
    self.btnBack.frame = CGRectMake(159.f, 288.f, 0.f, 0.f);
    
    
}

-(void) showElements{
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    self.btnUse.frame = CGRectMake(111.f, 289.f, 98.f, 72.f);
    self.btnBack.frame = CGRectMake(65.f, 288.f, 94.f, 73.f);
    [UIView commitAnimations];
    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:5.0];
//    self.btnUse.frame = CGRectMake(160.f, 289.f, 0.f, 0.f);
//    self.btnBack.frame = CGRectMake(159.f, 288.f, 0.f, 0.f);
//    [UIView commitAnimations];
//    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:1.0];
//    self.btnUse.frame = CGRectMake(111.f, 289.f, 98.f, 72.f);
//    self.btnBack.frame = CGRectMake(65.f, 288.f, 94.f, 73.f);
//    [UIView commitAnimations];
    
    
    
}

- (IBAction)btnBack:(id)sender {
    [[NSNotificationCenter  defaultCenter] postNotificationName:@"backButton" object:nil];
}

@end
