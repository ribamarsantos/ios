//
//  MyView.m
//  ProjectAnimation2
//
//  Created by Siddhartha Freitas on 12/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
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


-(void)ocultarElementos{
	self.useButton.frame = CGRectMake(160.f, 289.f, 0.f, 0.f);
	self.backButton.frame = CGRectMake(159.f, 288.f, 0.f, 0.f);
}

-(void)exibirElementos{
	[UIView beginAnimations:nil context:nil];
	[UIView setAnimationDuration:1.0];
	
	self.useButton.frame = CGRectMake(111.f, 289.f, 98.f, 72.f);
	self.backButton.frame = CGRectMake(65.f, 288.f, 94.f, 73.f);
	
	[UIView commitAnimations];
}

- (IBAction)back:(id)sender {
	
	[[NSNotificationCenter defaultCenter] postNotificationName:@"sidd" object:nil];
	
}

@end
