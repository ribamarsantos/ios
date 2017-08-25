//
//  ViewController.h
//  WalkTracker
//
//  Created by Ribamar Marcos José dos Santos on 25/08/17.
//  Copyright © 2017 Ribamar Marcos José dos Santos. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager * locationManager;
@property (nonatomic) BOOL startedWalk;

@end

