//
//  ViewController.h
//  AvaliacaoPDMiOS
//
//  Created by Crystian Leão on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) IBOutlet UITableView *tableViewComment;
@property (strong, nonatomic) IBOutlet UISearchBar *txtSearch;


@end

