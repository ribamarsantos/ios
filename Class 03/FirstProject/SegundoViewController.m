//
//  SegundoViewController.m
//  FirstProject
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "SegundoViewController.h"

@interface SegundoViewController ()

@end

@implementation SegundoViewController
// primeiro metodo chamado ao abrir view
- (void)viewDidLoad {
    [super viewDidLoad];
    //self.lblTitulo.text = self.nome;
    //self.txtSenha.delegate = self;// segunda maneira de esconder teclado
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)btnVoltar:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self.view endEditing:YES];
    return YES;
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
