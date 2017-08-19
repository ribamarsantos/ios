//
//  ViewController.m
//  ExeTableView
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ViewController.h"
#import "DetalheViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.estados = @{
//                     @"Nordeste": @[ @"Pernambuco", @"Ceara", @"Rio Grande do Norte", @"Paraíba", @"Alagoas", @"Sergipe"],
//                     @"Norte": @[ @"Amazonas", @"Pará", @"Amapá"],
//                     @"Sudeste": @[@"São Paulo", @"Rio de Janeiro", @"Espirito Santo" ],
//                     @"Centro-oeste": @[ @"Mato Grosso", @"Goiás"],
//                     @"Sul": @[ @"Rio Grande do Sul", @"Paraná", @"Santa Catarina"]
//                     };
    
    self.estados = [NSMutableDictionary dictionaryWithDictionary: @{
                                                                     @"Nordeste": [NSMutableArray arrayWithArray: @[ @"Pernambuco", @"Ceara", @"Rio Grande do Norte", @"Paraíba", @"Alagoas", @"Sergipe"]],
                                                                     @"Norte": [NSMutableArray arrayWithArray:@[ @"Amazonas", @"Pará", @"Amapá"]],
                                                                     @"Sudeste": [NSMutableArray arrayWithArray: @[@"São Paulo", @"Rio de Janeiro", @"Espirito Santo" ]],
                                                                     @"Centro-oeste": [NSMutableArray arrayWithArray: @[ @"Mato Grosso", @"Goiás"]],
                                                                     @"Sul": [NSMutableArray arrayWithArray: @[ @"Rio Grande do Sul", @"Paraná", @"Santa Catarina"]]
                                                                     }];
    
//    self.dicEstados = [NSMutableDictionary 
    
    
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return self.address.count;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * customcell = [tableView dequeueReusableCellWithIdentifier:@"customCell" forIndexPath:indexPath];
    
    NSString * regiao = self.estados.allKeys[indexPath.section];
    NSString * uf = self.estados[regiao][ indexPath.row];
    
    customcell.textLabel.text = uf;
    
    return customcell;
}
-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    NSString * regiao = self.estados.allKeys[section];
    return regiao;
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    NSString *
    NSString *regiao = self.estados.allKeys[indexPath.section];
    NSString *estado = self.estados[regiao][indexPath.row];
    
    NSString *message = [NSString stringWithFormat:@"%@ - %@", regiao, estado];
    
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle: @"Atenção"
                                          message: message
                                          preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* detailButton = [UIAlertAction actionWithTitle:@"Detalhes"
                                                       style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action){
                                                             
                DetalheViewController * viewDetalhe = [self.storyboard instantiateViewControllerWithIdentifier:@"DetalheViewController"];
                [self.navigationController pushViewController:viewDetalhe animated: YES];
    }];
    

    
    
    UIAlertAction* deleteButton = [UIAlertAction actionWithTitle:@"Remover"
                                                        style:UIAlertActionStyleDestructive
                                                         handler: ^(UIAlertAction * _Nonnull action) {
                                                             [self.estados[regiao] removeObjectAtIndex:indexPath.row];
                                                             [self.tableViewRegiao reloadData];
                                                         }];
    [alertController addAction:detailButton];
    [alertController addAction:deleteButton];
    
    [self presentViewController:alertController animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
//
//-(void ^Nullable) exibirTela{
//    DetalheViewController * viewDetalh = [ self.storyboard instantiateInitialViewController: @"DetalheViewController"];
//    
//    [self presentViewController:viewSeg animated:YES completion:nil];
//
//    - (IBAction)openSegundoViewController:(id)sender {
//        NSArray * array = @[ @"Ribamar", @"Santos"];
//        
//        SegundoViewController * viewSeg = [self.storyboard instantiateViewControllerWithIdentifier:@"SegundoViewController"];
//        
//        
//        viewSeg.myarray = array;
//            }
//}




@end
