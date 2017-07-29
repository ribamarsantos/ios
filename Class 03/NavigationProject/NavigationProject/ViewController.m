//
//  ViewController.m
//  NavigationProject
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ViewController.h"
#import "YellowViewController.h"
#import "GreenViewController.h"
#import "RedViewController.h"


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



 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     if( [ segue.identifier isEqualToString:@"segueVermelho"]){
         RedViewController * viewRed = [ segue destinationViewController];
         viewRed.nome = @"Red View";
         
     }else if( [ segue.identifier isEqualToString:@"segueVerde"]){
         GreenViewController * viewGreen = [ segue destinationViewController];
         viewGreen.nome = @"Green view";
     }else if( [ segue.identifier isEqualToString:@"segueAmarelo"]){
         YellowViewController * viewYellow = [ segue destinationViewController];
         viewYellow.nome = @"Yellow view";
         
     }
     
 }


-(BOOL) shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender{
    
    if( [identifier isEqualToString:@"segueAmarelo"]){
        if( 1 == 2){
            return TRUE;
        }else{
            return FALSE;
        }
    }
    
    return YES;
}
@end
