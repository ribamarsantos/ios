//
//  ViewController.h
//  Exe_Mapa
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet MKMapView * mapView;
@property (strong, nonatomic) CLLocationManager * locationManager;
@property (strong, nonatomic) NSArray * annotations;
@property (strong, nonatomic) NSArray * resultAdress;
@property (strong, nonatomic) MKLocalSearch * localSearch;

@property (strong, nonatomic) UITapGestureRecognizer * gestureRecognizer;
@property (weak, nonatomic) IBOutlet UITextField *txtSearch;
@property (weak, nonatomic) IBOutlet UITableView *tableViewResultAddress;

@end

