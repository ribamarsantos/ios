//
//  ViewController.m
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ViewController.h"
#import "PRODUCT+CoreDataClass.h"
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

- (IBAction)btnSalvar:(id)sender {
    NSDictionary * dic = @{@"name": self.txtName.text,
                           @"brand": self.txtBrand.text,
                           @"quantity": self.txtQuantity.text};
    
    [PRODUCT newProduto:dic];
    
    self.txtQuantity.text = @"";
    self.txtBrand.text = @"";
    self.txtName.text = @"";
    [self.txtBrand becomeFirstResponder];
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    
    return YES;
    
}

@end
