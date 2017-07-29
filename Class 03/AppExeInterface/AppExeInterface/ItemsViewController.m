//
//  ItemsViewController.m
//  AppExeInterface
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ItemsViewController.h"
#import "CustomTableViewCell.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.diasSemanaArray = @[ @"Segunda-feira", @"Terça-feira",@"Quarta-feira", @"Quinta-feira", @"Sexta-feira", @"Sábado", @"Domingo" ];
    self.dicMyList = @[
                       @{
                       @"name": @"Ribamar",
                       @"email": @"ribamaar@gmail.com",
                       @"street": @"R. Jd. Boa Sorte",
                       @"country": @"Brasil"
                       },
                       @{
                           @"name": @"Jessica",
                           @"email": @"jessica@gmail.com",
                           @"street": @"R. Jd. Boa Sorte",
                           @"country": @"Brasil"
                           },
                       @{
                           @"name": @"Amanda",
                           @"email": @"ribamaar@gmail.com",
                           @"street": @"R. Paulista",
                           @"country": @"Brasil"
                           },
                       @{
                           @"name": @"Joyce",
                           @"email": @"joyce@gmail.com",
                           @"street": @"R. Jd Piedade",
                           @"country": @"Brasil"
                           }
                       ];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// numero de sessoes
-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
// tamanha do tableview
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dicMyList.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   // NSString * identificador;
    
    CustomTableViewCell * cell = [ tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    NSDictionary *myLocalList = self.dicMyList[ indexPath.row];
    cell.lblName.text = myLocalList[@"name"];
    cell.lblEmail.text =myLocalList[@"email"];
    cell.lblStreet.text = myLocalList[@"street"];
    cell.lblCountry.text = myLocalList[@"country"];
    
    return cell;
    
//    if( indexPath.row % 2 == 0 ){
//        identificador = @"blueCell";
//    }else{
//        identificador = @"whiteCell";
//    }
//    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: identificador forIndexPath:indexPath];
//    cell.textLabel.text = self.diasSemanaArray[ indexPath.row];
//    return cell;
    
    
    
    
    
    
}
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
