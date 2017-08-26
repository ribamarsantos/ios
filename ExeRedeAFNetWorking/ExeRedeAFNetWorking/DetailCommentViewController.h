//
//  DetailCommentViewController.h
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 26/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface DetailCommentViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) NSDictionary * comment;
@property (strong, nonatomic) IBOutlet MKMapView *mapUser;
@property (strong, nonatomic) IBOutlet UILabel *lblUser;
@property (strong, nonatomic) IBOutlet UIImageView *imgAvatar;

@end
