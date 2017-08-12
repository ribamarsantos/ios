//
//  ViewController.m
//  ProjectAnimation
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //esconder  16 29 266 30
    CGRect rec = self.txtBusca.frame;
    rec.origin.x = (rec.size.width * -1);
    
    self.txtBusca.frame = rec;
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showView:(id)sender {
    // pegar arquivo .xib
    self.myView = [[[NSBundle mainBundle] loadNibNamed:@"MyView" owner:self options:nil] objectAtIndex:0];

    // esconde botoes
    [self.myView hideElements];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(removerView) name:@"backButton"
                                               object:nil];
    
    // animacao
    [UIView transitionWithView: self.view
                           duration:0.5
                           options:UIViewAnimationOptionTransitionCrossDissolve
                          //options: UIViewAnimationOptionTransitionFlipFromTop
                          //options: UIViewAnimationOptionCurveEaseIn
                             animations:^{
                               // carregar na tela
                               [self.view addSubview:self.myView];
                            
                                 
                               
                           }completion: ^ (BOOL finished){
                               // ao finalizar exibicao da viao anima os botoes
                               [self.myView showElements];
                           }];

}

-(void) removerView{
    
    [UIView transitionWithView: self.view
                      duration:0.5
                       options:UIViewAnimationOptionTransitionCrossDissolve
                      animations:^{
                        // carregar na tela

                        
                        [self.myView removeFromSuperview];
                        
                    }completion: ^ (BOOL finished){
                        [[NSNotificationCenter defaultCenter] removeObserver:self];
                    }];

}

- (IBAction)btnShowTextFieldBusca:(id)sender {
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1.0];
    
    CGRect rec = self.txtBusca.frame;
    rec.origin.x = 16;
    self.txtBusca.frame = rec;
    [UIView commitAnimations];
}


@end
