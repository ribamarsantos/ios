//
//  MyView.h
//  ProjectAnimation2
//
//  Created by Siddhartha Freitas on 12/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView
@property (strong, nonatomic) IBOutlet UIButton *backButton;
@property (strong, nonatomic) IBOutlet UIButton *useButton;

-(void)ocultarElementos;
-(void)exibirElementos;

@end
