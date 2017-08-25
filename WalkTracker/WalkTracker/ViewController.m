//
//  ViewController.m
//  WalkTracker
//
//  Created by Ribamar Marcos José dos Santos on 25/08/17.
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

-(void) startWalk{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager requestAlwaysAuthorization];
    
    
}

-(void) stopWalk{
    self.startedWalk = NO;
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if( status == kCLAuthorizationStatusAuthorizedAlways){
        UIAlertController * successAlert =[ UIAlertController
                                             alertControllerWithTitle:@"Success"
                                             message:@"Status is Authorized Always"
                                             preferredStyle:  UIAlertControllerStyleAlert   ];
        [ successAlert addAction:[ UIAlertAction
                                  actionWithTitle:@"Great" style:UIAlertActionStyleDefault
                                  handler:nil]];
        [self presentViewController:successAlert animated:YES completion: nil ];
        
    }
}

- (IBAction)btnStartWalk:(id)sender {
    [self startWalk];
}



@end
