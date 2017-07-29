//
//  ItemsViewController.h
//  AppExeInterface
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ItemsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic) NSArray * diasSemanaArray;
@property (nonatomic) NSArray * dicMyList;
@property (weak, nonatomic) IBOutlet UITableView *tableViewDiasSemana;
@end
