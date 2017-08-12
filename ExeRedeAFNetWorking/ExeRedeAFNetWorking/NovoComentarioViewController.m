//
//  NovoComentarioViewController.m
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "NovoComentarioViewController.h"
#import <AFNetworking.h>
@interface NovoComentarioViewController ()

@end

@implementation NovoComentarioViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)gravarNovoComentario:(id)sender {
    AFHTTPRequestOperationManager	*manager	=	[AFHTTPRequestOperationManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    NSDictionary	*parameters	=	@{@"user":	_txtUser.text, @"content": _txtComentario.text};
    
    [manager
        POST:@"http://teste-aula-ios.herokuapp.com/comments.json"
        parameters:parameters
        success:^(AFHTTPRequestOperation	*operation,	id responseObject)	{
               NSLog(@"JSON:	%@",	responseObject);
            [ self.navigationController popViewControllerAnimated:YES];
        }
        failure:^(AFHTTPRequestOperation	*operation,	NSError	*error)	{
               NSLog(@"Error:	%@",	error);		
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
