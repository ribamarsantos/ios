//
//  ViewController.m
//  Canada Calc Express Entry
//
//  Created by Ribamar Marcos José dos Santos on 04/08/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)logar:(id)sender {
    
}
- (IBAction)novoCadastro:(id)sender {
    
}

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:TRUE];
    return YES;
}

@end
