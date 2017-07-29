//
//  CustomTableViewCell.h
//  AppExeInterface
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblName;

@property (weak, nonatomic) IBOutlet UILabel *lblEmail;
@property (weak, nonatomic) IBOutlet UILabel *lblStreet;
@property (weak, nonatomic) IBOutlet UILabel *lblCountry;

@end
