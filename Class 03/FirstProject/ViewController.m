//
//  ViewController.m
//  FirstProject
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ViewController.h"
#import "SegundoViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeLabel:(id)sender {
    self.myLabel.text = @"Ribamar";
}
- (IBAction)anotherButton:(id)sender {
    [ self modificaLabel:@" Lalala"];
    
}

-(void) modificaLabel: (NSString *) textoMudanca {
    NSString * novaString = [NSString stringWithFormat:@"O nome é %@",textoMudanca ];
    self.anotherLabel.text = novaString;
    [self modificaDoisLabel:textoMudanca segundoParam:@" aula"];
}

- (void) modificaDoisLabel: (NSString *) texto1  segundoParam: (NSString *) texto2 {
    NSString * novaString = [ NSString stringWithFormat:@" Nome %@ Sobrenome %@", texto1, texto2];
    self.myLabel.text = novaString;
}
- (IBAction)clickGrayButton:(id)sender {
    [self.whiteButton setTitle:@"white"  forState:UIControlStateNormal];
}
- (IBAction)openSegundoViewController:(id)sender {
    NSArray * array = @[ @"Ribamar", @"Santos"];
    
    SegundoViewController * viewSeg = [self.storyboard instantiateViewControllerWithIdentifier:@"SegundoViewController"];
    
    
    viewSeg.myarray = array;
    [self presentViewController:viewSeg animated:YES completion:nil];
}

@end
