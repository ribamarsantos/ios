//
//  CustomTableViewCell.h
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *lblUser;
@property (weak, nonatomic) IBOutlet UILabel *lblData;
@property (weak, nonatomic) IBOutlet UITextView *textComment;
@property (weak, nonatomic) IBOutlet UIImageView *imgAvatar;

@end
