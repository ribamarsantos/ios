//
//  ViewController.m
//  AppExeInterface
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Ribamar. All rights reserved.
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

- (IBAction)setVisibleButtonLogin:(id)sender {
    self.btnLogin.hidden = self.spinOnOffButton.selectedSegmentIndex == 1;
}

- (IBAction)sldSetIdade:(id)sender {
    
    self.lblIdade.text = [NSString stringWithFormat: @"%i ano(s)", (int) self.sldIdade.value];
    
}

- (BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
}

@end
