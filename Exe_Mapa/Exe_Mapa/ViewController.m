//
//  ViewController.m
//  Exe_Mapa
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ViewController.h"


#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [self initLocationService];
    
    if(IS_OS_8_OR_LATER){
        NSUInteger code = [CLLocationManager authorizationStatus];
        if (code == kCLAuthorizationStatusNotDetermined && ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)] || [self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])) {
            // choose one request according to your business.
            if([[NSBundle mainBundle] objectForInfoDictionaryKey:@"NSLocationWhenInUseUsageDescription"]) {
                [self.locationManager  requestWhenInUseAuthorization];
            } else {
                NSLog(@"Info.plist does not contain NSLocationAlwaysUsageDescription or NSLocationWhenInUseUsageDescription");
            }
        }
    }
    [self addGestureToMap];
    [super viewDidLoad];
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) initLocationService{
    self.locationManager = [[ CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [self.locationManager startUpdatingHeading];
}

- (IBAction)getCurrentLocation:(id)sender {
    NSLog(@"lat = %f", self.locationManager.location.coordinate.latitude);
    NSLog(@"log = %f", self.locationManager.location.coordinate.longitude);
    [self centerMap];
    //[self addAnnotation ];
    [ self collectAddress];
    [ self setPinOnMap:self.locationManager.location];
}

-(void) centerMap{
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = self.locationManager.location.coordinate.latitude;
    newRegion.center.longitude = self.locationManager.location.coordinate.longitude;
    newRegion.span.latitudeDelta = 0.0005;
    newRegion.span.longitudeDelta = 0.0005;
    
    [self.mapView setRegion:newRegion];
    
}

-(void) addAnnotation{
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(self.locationManager.location.coordinate.latitude, self.locationManager.location.coordinate.longitude);
    
    point.title = @"Current Location";
    point.coordinate = coordinate;
    
    [self.mapView addAnnotation: point];
}


-(void)collectAddress{
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    
    [geoCoder reverseGeocodeLocation:self.locationManager.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error) {
        CLPlacemark *placemark = placemarks[0];
        NSLog(@"%@", placemark.thoroughfare);// rua
        NSLog(@"%@", placemark.subLocality);// bairro
    }];
}

-(void)setPinOnMap:(CLLocation *)location{
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    
    MKCoordinateRegion region;
    
    region.center.latitude = location.coordinate.latitude;
    region.center.longitude = location.coordinate.longitude;
    
    annotation.coordinate =   region.center;
    
    annotation.title = @"lala";
    annotation.subtitle = @"lalal123";
    
    [self.mapView addAnnotation:annotation];
}

-(void)addGestureToMap{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapMap:)];
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    tapGesture.delaysTouchesBegan = YES;
    
    [tapGesture setCancelsTouchesInView:YES];
    [self.mapView addGestureRecognizer:tapGesture];
}

-(void)tapMap:(UITapGestureRecognizer *)recognizer{
    CGPoint touchPoint = [recognizer locationInView:self.mapView];
    
    CLLocationCoordinate2D touchMapCoordinate = [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    CLLocation *location  = [[CLLocation alloc] initWithLatitude:touchMapCoordinate.latitude longitude:touchMapCoordinate.longitude];
    
    [self setPinOnMap:location];
}
- (IBAction)btnRemovePin:(id)sender {
    [self.mapView removeAnnotations:self.mapView.annotations];
    
}

- (IBAction)btnSavePin:(id)sender {
    self.annotations = self.mapView.annotations;
    
}
- (IBAction)btnLoadPins:(id)sender {
    [self.mapView addAnnotations:self.annotations];
}


-(void)startSearch:(NSString *)searchString {
    
    if (self.localSearch.searching)
    {
        [self.localSearch cancel];
    }
    
    
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = self.locationManager.location.coordinate.latitude+0.001555;
    newRegion.center.longitude = self.locationManager.location.coordinate.longitude;
    
    newRegion.span.latitudeDelta = 0.112872;
    newRegion.span.longitudeDelta = 0.109863;
    
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    
    request.naturalLanguageQuery = searchString;
    request.region = newRegion;
    
    
    MKLocalSearchCompletionHandler completionHandler = ^(MKLocalSearchResponse *response, NSError *error) {
        
        if (error != nil) {
            [self.localSearch cancel];
            self.localSearch = nil;
            NSLog(@"Erro");
        } else {
            if([response mapItems].count > 0){
                self.resultAdress = [response mapItems];
                
                NSLog(@"%@", response);
                
                [UITableView transitionWithView: self.tableViewResultAddress
                                  duration:0.5
                                  options: UIViewAnimationOptionTransitionFlipFromTop
                                animations:^{
                                    self.tableViewResultAddress.hidden = NO;

                                    
                                }completion: ^ (BOOL finished){
                                    [self.tableViewResultAddress reloadData];
                                }];
                
                
            }else{
                NSLog(@"Erro");
            }
        }
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    };
    
    if (self.localSearch != nil) {
        self.localSearch = nil;
    }
    self.localSearch = [[MKLocalSearch alloc] initWithRequest:request];
    
    [self.localSearch startWithCompletionHandler:completionHandler];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    
}
- (IBAction)btnSearch:(id)sender {
    [self startSearch:_txtSearch.text];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [self.view endEditing:YES];
    
    return YES;
}



-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.resultAdress.count;
}


-(UITableViewCell * ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
   // UITableViewCell * cell = [ tableView dequeueReusableCellWithIdentifier:@"customcell" forIndexPath:indexPath];
    
    UITableViewCell * cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                   reuseIdentifier:@"customCell"] ;
    
     MKMapItem * myObj = self.resultAdress[ indexPath.row];
    cell.textLabel.text =  myObj.name;
    cell.detailTextLabel.text = myObj.phoneNumber;
    
    
    //[self setPinOnMap:myObj.placemark.location];
    
    
    return cell;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  //  self.tableViewResultAddress.hidden = YES;
  //  MKMapItem * myObj = self.resultAdress[ indexPath.row];
  //  [self setPinOnMap:myObj.placemark.location];
   // [self centerMapWithLocation:myObj.placemark.location];
    
    
    
    [UITableView transitionWithView: self.tableViewResultAddress
                           duration:0.5
                            options: UIViewAnimationOptionTransitionFlipFromBottom
                         animations:^{
                             self.tableViewResultAddress.hidden = YES;
                         }completion: ^ (BOOL finished){
                             MKMapItem * myObj = self.resultAdress[ indexPath.row];
                             [self setPinOnMap:myObj.placemark.location];
                             [self centerMapWithLocation:myObj.placemark.location];
                         }];
    
}


-(void) centerMapWithLocation: (CLLocation *)location{
    MKCoordinateRegion newRegion;
    newRegion.center.latitude = location.coordinate.latitude;
    newRegion.center.longitude = location.coordinate.longitude;
    newRegion.span.latitudeDelta = 0.0005;
    newRegion.span.longitudeDelta = 0.0005;
    
    [self.mapView setRegion:newRegion];
    
}

-(MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation{
    if([annotation isKindOfClass:[MKUserLocation class]]){
        return nil;
    }
    
    UIImage *image = [UIImage imageNamed:@"pin_med"];
    
    MKAnnotationView *pinView = (MKAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:@"pin_med"];
    
    if(pinView != nil){
        pinView.annotation = annotation;
    }else{
        pinView = [[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"pin_med"];
        pinView.image = image;
        pinView.centerOffset = CGPointMake(0, -pinView.image.size.height / 2);
    }
    return pinView;
}
@end
