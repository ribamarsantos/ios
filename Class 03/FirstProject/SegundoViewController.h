//
//  SegundoViewController.h
//  FirstProject
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SegundoViewController : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) NSString * nome;
@property (weak, nonatomic) IBOutlet UILabel *lblTitulo;
@property (nonatomic, strong) NSArray * myarray;
@property (weak, nonatomic) IBOutlet UITextField *txtEmail;
@property (weak, nonatomic) IBOutlet UITextField *txtSenha;

@end
