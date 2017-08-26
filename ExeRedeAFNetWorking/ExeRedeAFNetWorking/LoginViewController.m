//
//  LoginViewController.m
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 26/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "LoginViewController.h"
#import <AFNetworking.h>

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
    AFHTTPRequestOperationManager	*manager	=	[AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    
    [manager POST: @"https://teste-aula-ios.herokuapp.com/users/sign_in.json"
       parameters:@{ @"user" : @{ @"email": @"crystian@roadmaps.com.br",
                                  @"password": @"12345678"} }
          success:^(AFHTTPRequestOperation * _Nonnull operation, id _Nonnull
                    responseObject) {
              
              NSLog(@"Login success");
              UIViewController * navigation = [self.storyboard instantiateViewControllerWithIdentifier:@"nav"];
              
              [self presentViewController:navigation animated:YES completion:nil];
              
              
          } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError *
                      _Nonnull error) {
              NSLog(@"Login failure");
          }];
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
