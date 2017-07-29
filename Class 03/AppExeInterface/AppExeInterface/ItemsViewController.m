//
//  ItemsViewController.m
//  AppExeInterface
//
//  Created by Treinamento on 29/07/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ItemsViewController.h"

@interface ItemsViewController ()

@end

@implementation ItemsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.diasSemanaArray = @[ @"Segunda-feira", @"Terça-feira",@"Quarta-feira", @"Quinta-feira", @"Sexta-feira", @"Sábado", @"Domingo" ];
    
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
    return self.diasSemanaArray.count;
}
-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * identificador;
    
    if( indexPath.row % 2 == 0 ){
        identificador = @"blueCell";
    }else{
        identificador = @"whiteCell";
    }
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier: identificador forIndexPath:indexPath];
    cell.textLabel.text = self.diasSemanaArray[ indexPath.row];
    return cell;
    
    
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
