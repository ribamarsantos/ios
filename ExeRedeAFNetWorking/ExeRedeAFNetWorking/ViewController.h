//
//  ViewController.h
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableViewComment;
@property (weak, nonatomic) IBOutlet UIView *lblUser;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnComentar;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *btnReload;

@end

