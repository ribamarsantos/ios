//
//  NovoComentarioViewController.m
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "NovoComentarioViewController.h"
#import <AFNetworking.h>
@interface NovoComentarioViewController ()

@end

@implementation NovoComentarioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gravarNovoComentario:(id)sender {
    AFHTTPRequestOperationManager	*manager	=	[AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSDictionary	*parameters	=	@{@"user":	_txtUser.text, @"content": _txtComentario.text};
    
    [manager
        POST:@"http://teste-aula-ios.herokuapp.com/comments.json"
        parameters:parameters
        success:^(AFHTTPRequestOperation	*operation,	id responseObject)	{
               NSLog(@"JSON:	%@",	responseObject);
            [ self.navigationController popViewControllerAnimated:YES];
        }
        failure:^(AFHTTPRequestOperation	*operation,	NSError	*error)	{
               NSLog(@"Error:	%@",	error);		
        }];
}
- (IBAction)btnCancelar:(id)sender {
    [ self.navigationController popViewControllerAnimated:YES];
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
