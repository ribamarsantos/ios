//
//  NovoComentarioViewController.h
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface NovoComentarioViewController : UIViewController < UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtUser;
@property (weak, nonatomic) IBOutlet UITextView *txtComentario;
@property (weak, nonatomic) IBOutlet UIImageView *imgComment;
@property (strong, nonatomic) CLLocationManager * locationManager;

@end
