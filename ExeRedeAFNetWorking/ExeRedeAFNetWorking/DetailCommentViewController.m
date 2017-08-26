//
//  DetailCommentViewController.m
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 26/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "DetailCommentViewController.h"
#import <UIImageView+AFNetworking.h>

@interface DetailCommentViewController ()

@end

@implementation DetailCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self centerMap];
    [self addAnnotation];
    self.lblUser.text =self.comment[@"user"] ;
    
    NSURL	*filePath	=	[NSURL URLWithString: self.comment[@"image"]];
    [self.imgAvatar setImageWithURL:filePath placeholderImage:[UIImage imageNamed:@"place_user"]];
    
    // Do any additional setup after loading the view.
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
