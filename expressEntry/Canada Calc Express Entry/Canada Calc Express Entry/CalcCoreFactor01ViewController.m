//
//  CalcCoreFactor01ViewController.m
//  Canada Calc Express Entry
//
//  Created by Ribamar Marcos José dos Santos on 04/08/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import "CalcCoreFactor01ViewController.h"

@interface CalcCoreFactor01ViewController ()

@end

@implementation CalcCoreFactor01ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)slcIdade:(id)sender {
    _lblIdade.text =  [NSString stringWithFormat:@" %i ano(s)", (int) self.slcIdade.value];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
