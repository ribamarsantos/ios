//
//  NovoComentarioViewController.m
//  AvaliacaoPDMiOS
//
//  Created by Treinamento on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import "NovoComentarioViewController.h"
#import <SVProgressHUD.h>
#import "ServerAPI.h"

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
    
    //Create a alert to show failed message
    NSString * msg = @"";
    
    if(_txtUser.text.length == 0){
        msg = @"Usuário não informado!";
        [_txtUser becomeFirstResponder];
    }else if( _txtComentario.text.length == 0 ){
        msg = @"Informe um comentário";
        [_txtComentario becomeFirstResponder];
    }else if ( _imgComment.image == nil){
        msg = @"Imagem não informada!";
        
    }
    
    if(msg.length == 0 ){
        [SVProgressHUD show];
        
        NSDictionary	*parameters	=	@{@"comment[user]":	_txtUser.text,
                                          @"comment[content]": _txtComentario.text,
                                          @"comment[lat]"  : [NSNumber numberWithDouble: self.locationManager.location.coordinate.latitude],
                                          @"comment[lng]" :  [NSNumber numberWithDouble: self.locationManager.location.coordinate.longitude]  };
        
        //  NSString *caminho = [[NSBundle mainBundle] pathForResource:_imgComment ofType:@"jpg"]; // or ofType:@"png", etc.
        NSData *imageData = UIImageJPEGRepresentation(_imgComment.image,0.5);
        
        
        [[ServerAPI sharedClient] addComment:parameters
                                imageComment:imageData
                             andSuccessBlock:^(NSArray *comments) {
                                 // NSLog(@"JSON:	%@",	responseObject);
                                 [SVProgressHUD dismiss];
                                 [ self.navigationController popViewControllerAnimated:YES];
                             } andErrorBlock:^(NSError *error, AFHTTPRequestOperation *operation) {
                                 [SVProgressHUD dismiss];
                                 NSInteger * returnStatus = [operation.response statusCode];
                                 if(  returnStatus == 401 ) {
                                     [self.navigationController dismissViewControllerAnimated:YES completion:nil];
                                 }
                                 NSLog(@"Error:	%@",	error);
                                 NSLog(@"Error:	%@",	operation.responseString);
                             }];

    }else{
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Atenção" message:msg preferredStyle: UIAlertControllerStyleAlert];
        
        UIAlertAction* okButton = [UIAlertAction actionWithTitle:@"Ok"  style:UIAlertActionStyleDefault
                                                         handler:nil];
        
        [alertController addAction:okButton];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }

    
    
    
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
