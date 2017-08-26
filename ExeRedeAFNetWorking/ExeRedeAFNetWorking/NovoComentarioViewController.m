//
//  NovoComentarioViewController.m
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "NovoComentarioViewController.h"
#import <AFNetworking.h>
#import <SVProgressHUD.h>

#define IS_OS_8_OR_LATER ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)

@interface NovoComentarioViewController ()

@end

@implementation NovoComentarioViewController

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
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gravarNovoComentario:(id)sender {
    [SVProgressHUD show];
     AFHTTPRequestOperationManager	*manager	=	[AFHTTPRequestOperationManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSDictionary	*parameters	=	@{@"comment[user]":	_txtUser.text,
                                      @"comment[content]": _txtComentario.text,
                                      @"comment[lat]"  : [NSNumber numberWithDouble: self.locationManager.location.coordinate.latitude],
                                      @"comment[lng]" :  [NSNumber numberWithDouble: self.locationManager.location.coordinate.longitude]  };
    
  //  NSString *caminho = [[NSBundle mainBundle] pathForResource:_imgComment ofType:@"jpg"]; // or ofType:@"png", etc.
    NSData *imageData = UIImageJPEGRepresentation(_imgComment.image,0.5);

    
    //NSLog( @" %@", stringImagePath);
 //    NSData * imgData = [ NSData ];
    NSString * fileName = [self getCurrentDate];
    [manager
        POST:@"http://teste-aula-ios.herokuapp.com/comments.json"
        parameters:parameters
        constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
            [formData appendPartWithFileData:imageData name:@"comment[picture]" fileName:[NSString stringWithFormat:@"img_%@.jpg",fileName ] mimeType:@"image/jpeg" ];
        }
     
        success:^(AFHTTPRequestOperation	*operation,	id responseObject)	{
               NSLog(@"JSON:	%@",	responseObject);
            [SVProgressHUD dismiss];
            [ self.navigationController popViewControllerAnimated:YES];
        }
        failure:^(AFHTTPRequestOperation	*operation,	NSError	*error)	{
            [SVProgressHUD dismiss];
            NSInteger * returnStatus = [operation.response statusCode];
            if(  returnStatus == 401 ) {
                [self.navigationController dismissViewControllerAnimated:YES completion:nil];
            }
           NSLog(@"Error:	%@",	error);
            NSLog(@"Error:	%@",	operation.responseString);
            
        }];
    
    
}
- (IBAction)btnCancelar:(id)sender {
    [ self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)btnCapturarImagem:(id)sender {
    [self startCameraControllerFromViewController:self usingDelegate: self];
}


- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
  
    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    if ([mediaType isEqualToString:@"public.image"]) {
        editedImage = (UIImage *) [info objectForKey:  UIImagePickerControllerEditedImage];
        originalImage = (UIImage *) [info objectForKey:  UIImagePickerControllerOriginalImage];
        
        if (editedImage) {
            imageToSave = editedImage;
        }
        else {
            imageToSave = originalImage;
        }
        
        UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil , nil);
        //[self.imgComment setImage:imageToSave];
        self.imgComment.image = imageToSave;
    }
    
    // Handle a movie capture
    if ([mediaType isEqualToString:@"public.movie"]) {
        
        NSString *moviePath = [[info objectForKey: UIImagePickerControllerMediaURL] path];
        if (UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(moviePath)) {
            UISaveVideoAtPathToSavedPhotosAlbum(moviePath, nil, nil, nil);
        }
    }   
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL) startCameraControllerFromViewController: (UIViewController*) controller  usingDelegate: (id <UIImagePickerControllerDelegate, UINavigationControllerDelegate>)delegate {
    if (([UIImagePickerController isSourceTypeAvailable:  UIImagePickerControllerSourceTypePhotoLibrary] == NO)
        || (delegate == nil)
        || (controller == nil))  return NO;
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];  cameraUI.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    cameraUI.mediaTypes =
    [UIImagePickerController availableMediaTypesForSourceType:
     UIImagePickerControllerSourceTypePhotoLibrary];
    cameraUI.allowsEditing = NO;
    
    cameraUI.delegate = delegate; 
    [controller presentViewController: cameraUI animated: YES completion:nil];  return YES; 
}
-(NSString * ) getCurrentDate{
    NSDate *currentDate = [NSDate date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"ddMMYYHHmmss"];
    NSString *dateString = [dateFormatter stringFromDate:currentDate];
    return dateString;
}

- (void) initLocationService{
    self.locationManager = [[ CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
    [self.locationManager startUpdatingHeading];
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
