//
//  MyView.h
//  ProjectAnimation
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyView : UIView
@property (weak, nonatomic) IBOutlet UIButton *btnUse;
@property (weak, nonatomic) IBOutlet UIButton *btnBack;
-(void) hideElements;
-(void) showElements;

@end
