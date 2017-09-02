//
//  DetailCommentViewController.m
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 26/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "DetailCommentViewController.h"
#import <UIImageView+AFNetworking.h>
#import "ServerAPI.h"
#import <SVProgressHUD.h>

@interface DetailCommentViewController ()

@end

@implementation DetailCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(![self.comment[@"lat"] isKindOfClass:[NSNull class]]){
        [self centerMap];
        [self addAnnotation];
    }else{
        self.mapUser.hidden = YES;
    }
    
    self.lblUser.text =self.comment[@"user"] ;
    
    NSURL	*filePath	=	[NSURL URLWithString: self.comment[@"image"]];
    [self.imgAvatar setImageWithURL:filePath placeholderImage:[UIImage imageNamed:@"place_user"]];
    self.txtComment.text  = self.comment[@"content"];
    self.lblDataPost.text = [ self.comment[@"created_at"] substringToIndex:10];

    self.imgAvatar.layer.cornerRadius = self.imgAvatar.frame.size.width / 2;
    self.imgAvatar.clipsToBounds = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) addAnnotation{
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];


    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake( [self.comment[@"lat"] floatValue], [self.comment[@"lng"] floatValue]);
    
    point.title = self.comment[@"user"] ;
    point.coordinate = coordinate;
    
    [self.mapUser addAnnotation: point];
}

-(void) centerMap{
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = [self.comment[@"lat"] floatValue];
    newRegion.center.longitude = [self.comment[@"lng"] floatValue];
    newRegion.span.latitudeDelta = 0.0005;
    newRegion.span.longitudeDelta = 0.0005;
    
    [self.mapUser setRegion:newRegion];
    
}
- (IBAction)btnDeleteComment:(id)sender {
    UIAlertController * alert = [ UIAlertController alertControllerWithTitle: @"Aviso" message:@"Deseja realmente remover o comentário?" preferredStyle: UIAlertControllerStyleActionSheet ];
    
    UIAlertAction *YesAction = [UIAlertAction actionWithTitle:@"Sim"
                                style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                    
                        [ [ServerAPI sharedClient] deleteComment:  [ self.comment[@"id"] integerValue]
                                                 andSuccessBlock:^(NSArray *comments) {
                            [SVProgressHUD dismiss];
                            [ self.navigationController popViewControllerAnimated:YES];
                        } andErrorBlock:^(NSError *error, AFHTTPRequestOperation *operation) {
                           [SVProgressHUD dismiss];
                           NSLog(@"Error:	%@",	error);
                           NSLog(@"Error:	%@",	operation.responseString);
                        }];


    }];

    UIAlertAction * NoAction = [UIAlertAction actionWithTitle:@"Não" style:UIAlertActionStyleDefault handler:nil];
    
    
    [alert addAction: YesAction];
    [alert addAction: NoAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
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
