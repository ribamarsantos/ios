//
//  ViewController.h
//  ExeTableView
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate,  UITableViewDataSource>

//@property (nonatomic) NSDictionary * estados;
@property (nonatomic) NSMutableDictionary * estados;

@property (weak, nonatomic) IBOutlet UITableView *tableViewRegiao;

@end

