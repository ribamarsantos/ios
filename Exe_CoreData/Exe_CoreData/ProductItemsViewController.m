//
//  ProductItemsViewController.m
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ProductItemsViewController.h"
#import "PRODUCT+CoreDataClass.h"
#import "PICTURE+CoreDataClass.h"
#import <MGSwipeTableCell.h>"
@interface ProductItemsViewController ()

@end

@implementation ProductItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableViewProducts.separatorColor = [UIColor clearColor];
    self.tableViewProducts.separatorColor = [UIColor grayColor];
    self.arrProducts = [PRODUCT getAllProducts];
    self.tableViewProducts.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated{
    
}

-(void) viewDidAppear:(BOOL)animated{
    [UITableView transitionWithView: self.tableViewProducts
                           duration:1.0
                            options: UIViewAnimationOptionTransitionCurlDown
                         animations:^{
                             self.tableViewProducts.hidden = NO;
                         }completion: ^ (BOOL finished){
                             
                         }];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.arrProducts.count;
}

-(UITableViewCell*) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    
//    PRODUCT * prod = self.arrProducts[ indexPath.row];
//    cell.textLabel.text =  prod.name;
//    cell.detailTextLabel.text = prod.brand;
//    
//
//    
//    
//    return cell;
    
    
    static NSString * reuseIdentifier = @"cell";
    MGSwipeTableCell * cell = [self.tableViewProducts dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell = [[MGSwipeTableCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:reuseIdentifier];
    }
    
  //  cell.layer.cornerRadius = 50;
  //  cell.backgroundColor = UIColor.gray;
   // cell.clipsToBounds = true;
  //  cell.swipeBackgroundColor = UIColor.gray;
    
    
    PRODUCT * prod = self.arrProducts[ indexPath.row];
    cell.textLabel.text = prod.name;
    cell.detailTextLabel.text = prod.brand;
   //  cell.delegate = self; //optional
    
    
    //configure left buttons
    cell.leftButtons = @[[MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"check.png"] backgroundColor:[UIColor greenColor]],
                         [MGSwipeButton buttonWithTitle:@"" icon:[UIImage imageNamed:@"fav.png"] backgroundColor:[UIColor blueColor]]];
    cell.leftSwipeSettings.transition = MGSwipeTransition3D;
    
    //configure right buttons
    cell.rightButtons = @[[MGSwipeButton buttonWithTitle:@"Delete" backgroundColor:[UIColor redColor]],
                          [MGSwipeButton buttonWithTitle:@"More" backgroundColor:[UIColor lightGrayColor]]];
    cell.rightSwipeSettings.transition = MGSwipeTransitionBorder;
    return cell;
    
}
- (IBAction)btnTakePicture:(id)sender {
    UIView * view = sender;
    
    while(! [ view isKindOfClass:[ UITableViewCell class ]]){
        view = [ view superview] ;
        
    }
    
    NSIndexPath * indexPath = [ self.tableViewProducts indexPathForCell: (UITableViewCell * ) view];
    
    self.selectedProd = self.arrProducts[indexPath.row];
    
    UIAlertController * alert = [ UIAlertController alertControllerWithTitle: @"Aviso" message:@"Escolha opcao" preferredStyle: UIAlertControllerStyleActionSheet ];
    
    UIAlertAction *cameraAction = [UIAlertAction actionWithTitle:@"Camera" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePicker =  [[UIImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }];
    
    UIAlertAction *galeriaAction = [UIAlertAction actionWithTitle:@"Galeria" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        self.imagePicker =  [[UIImagePickerController alloc] init];
        self.imagePicker.delegate = self;
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:self.imagePicker animated:YES completion:nil];
    }];
    
    
    [alert addAction:cameraAction];
    [alert addAction:galeriaAction];
    
    [self presentViewController:alert animated:YES completion:nil];
    
    
    
    
}

- (void) imagePickerControllerDidCancel: (UIImagePickerController *) picker {
    [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

// For responding to the user accepting a newly-captured picture or movie
- (void) imagePickerController: (UIImagePickerController *) picker didFinishPickingMediaWithInfo: (NSDictionary *) info {
    
    UIImage *originalImage, *editedImage, *imageToSave;
    
    // Handle a still image capture
    editedImage = (UIImage *) info[UIImagePickerControllerEditedImage];
    originalImage = (UIImage *) info[UIImagePickerControllerOriginalImage];
    
    if (editedImage) {
        imageToSave = editedImage;
    } else {
        imageToSave = originalImage;
    }
    
    // Save the new image (original or edited) to the Camera Roll
    if (picker.sourceType == UIImagePickerControllerSourceTypeCamera)
        UIImageWriteToSavedPhotosAlbum (imageToSave, nil, nil , nil);
    
    UIImage *image = imageToSave;
    NSDictionary *dic = @{@"imagem": image, @"produto": self.selectedProd};
    [PICTURE newPic:dic];
    
    [picker.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}



-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    //self.arrProducts = nil;
    
    if ( searchText.length > 0)
      self.arrProducts = [PRODUCT produtosComNome:searchText];
    else
        self.arrProducts = [ PRODUCT getAllProducts];
    
    [self.tableViewProducts reloadData];
    

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
