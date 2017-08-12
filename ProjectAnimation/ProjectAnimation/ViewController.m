//
//  ViewController.m
//  ProjectAnimation
//
//  Created by Treinamento on 12/08/17.
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

- (IBAction)showView:(id)sender {
    // pegar arquivo .xib
    self.myView = [[[NSBundle mainBundle] loadNibNamed:@"MyView" owner:self options:nil] objectAtIndex:0];
    // carregar na tela
    [self.view addSubview:self.myView];
}

@end
