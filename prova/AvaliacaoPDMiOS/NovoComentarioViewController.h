//
//  NovoComentarioViewController.m
//  AvaliacaoPDMiOS
//
//  Created by Ribamar on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>


@interface NovoComentarioViewController : UIViewController < UIImagePickerControllerDelegate, UINavigationControllerDelegate, CLLocationManagerDelegate, MKMapViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *txtUser;
@property (weak, nonatomic) IBOutlet UITextView *txtComentario;
@property (weak, nonatomic) IBOutlet UIImageView *imgComment;
@property (strong, nonatomic) CLLocationManager * locationManager;

@end
