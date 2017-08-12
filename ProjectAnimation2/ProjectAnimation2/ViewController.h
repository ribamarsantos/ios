//
//  ViewController.h
//  ProjectAnimation2
//
//  Created by Siddhartha Freitas on 12/08/17.
//  Copyright © 2017 Roadmaps. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyView.h"

@interface ViewController : UIViewController

@property(strong, nonatomic)MyView *myView;

@property (strong, nonatomic) IBOutlet UITextField *searchBar;

@end

