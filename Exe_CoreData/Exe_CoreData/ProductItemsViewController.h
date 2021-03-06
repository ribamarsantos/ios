//
//  ProductItemsViewController.h
//  Exe_CoreData
//
//  Created by Treinamento on 19/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PRODUCT+CoreDataClass.h"
#import <MGSwipeTableCell.h>"

@interface ProductItemsViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UISearchBarDelegate, MGSwipeTableCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableViewProducts;
@property (strong, nonatomic) NSArray * arrProducts;
@property (weak, nonatomic) PRODUCT * selectedProd;
@property (weak, nonatomic) UIImagePickerController   * imagePicker;
@property (weak, nonatomic) IBOutlet UISearchBar *txtSearchProduto;
@end
