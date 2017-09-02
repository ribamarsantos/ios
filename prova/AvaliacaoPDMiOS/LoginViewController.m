//
//  LoginViewController.m
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import "LoginViewController.h"
#import "ServerAPI.h"
#import <SVProgressHUD.h>

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnLogar:(id)sender {
    NSString * msg = @"";
    
    if(_txtEmail.text.length == 0){
        msg = @"Usuário não informado!";
        [_txtEmail becomeFirstResponder];
    }else if( _txtPassword.text.length == 0 ){
        msg = @"Informe a senha";
        [_txtPassword becomeFirstResponder];
    }
    
    if(msg.length == 0 ){
        [SVProgressHUD showWithStatus:@"Signing in..."];
        
        [[ServerAPI sharedClient] login:_txtEmail.text
                            andPassWord: _txtPassword.text
                        andSuccessBlock:^(NSArray *comments) {
                            _txtEmail.text = @"";
                            _txtPassword.text = @"";
                            NSLog(@"Login success");
                            UIViewController * navigation = [self.storyboard instantiateViewControllerWithIdentifier:@"nav"];
                            
                            [self presentViewController:navigation animated:YES completion:nil];
                            
                        } andErrorBlock:^(NSError *error, AFHTTPRequestOperation *operation) {
                            [SVProgressHUD setStatus:@"Invalid login"];
                            [SVProgressHUD dismissWithDelay:3];
                            NSLog(@"Login failure");
                        }];
        
    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Atenção" message:msg preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"Ok"  style:UIAlertActionStyleDefault
                                                         handler:nil];
        
        [alertController addAction:okButton];
        
        [self presentViewController:alertController animated:YES completion:nil];

    }
    
}
-(void)viewWillAppear:(BOOL)animated{
     [ _txtEmail becomeFirstResponder];
    
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
