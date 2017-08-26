//
//  ViewController.m
//  ExeRedeAFNetWorking
//
//  Created by Treinamento on 05/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import "CustomTableViewCell.h"
#import <UIImageView+AFNetworking.h>
#import <SVProgressHUD.h>
#import "ServerAPI.h"
#import "DetailCommentViewController.h"
@interface ViewController ()

@property (nonatomic) NSArray * comments;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
  
   // [SVProgressHUD setFadeInAnimationDuration:3.0f];
    //[self carregarTableView];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.comments.count;
}


-(UITableViewCell * ) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    CustomTableViewCell * cell = [ tableView dequeueReusableCellWithIdentifier:@"customcell" forIndexPath:indexPath];
    

    NSDictionary *myObj = self.comments[ indexPath.row];
    cell.lblUser.text = myObj[@"user"];
    cell.lblData.text = myObj[@"created_at"];
    cell.textComment.text = myObj[@"content"];
    NSURL	*filePath	=	[NSURL URLWithString: myObj[@"image"] ];
    [cell.imgAvatar setImageWithURL:filePath placeholderImage:[UIImage imageNamed:@"place_user"]];
    
    return cell;
}
- (IBAction)reloadTableViewComments:(id)sender {

    [self carregarTableView];
}

-(void) viewWillAppear:(BOOL)animated{
    
    [self carregarTableView];
}

-(void) carregarTableView{

        [[ServerAPI sharedClient] getComments:^(NSArray *comments) {
            self.comments = comments;
            [self.tableViewComment reloadData ];
            [SVProgressHUD dismiss];
        } andErrorBlock:^(NSError *error, AFHTTPRequestOperation *operation) {
            NSLog(@"Error:	%@",	error);
            [SVProgressHUD dismiss];
        }];
    
    //    AFHTTPRequestOperationManager	*manager	=	[AFHTTPRequestOperationManager
//                                                     manager];
//    [manager	GET:@"http://teste-aula-ios.herokuapp.com/comments.json"
//      parameters:nil
//         success:^(AFHTTPRequestOperation	*operation,	id responseObject)	{
//             
//             self.comments = responseObject;
//             //NSLog(@"comments:	%@",	self.comments);
//             [self.tableViewComment reloadData ];
//             [SVProgressHUD dismiss];
//         }	failure:^(AFHTTPRequestOperation	*operation,	NSError	*error)	{
//             NSLog(@"Error:	%@",	error);
//         }];
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *myObj = self.comments[ indexPath.row];
    
    
    DetailCommentViewController * viewDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailCommentViewController"];
    
    
    viewDetail.comment = myObj;
    //[self  presentViewController:viewDetail animated:YES completion:nil];
    
    
    UIAlertController * alert = [ UIAlertController alertControllerWithTitle: @"Aviso" message:@"Opções" preferredStyle: UIAlertControllerStyleActionSheet ];
    
    UIAlertAction *deleteAction = [UIAlertAction actionWithTitle:@"Apagar" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //processo apagar
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        
        NSString *urlApagar =  [NSString stringWithFormat:@"https://teste-aula-ios.herokuapp.com/comments/%@.json", self.comments[indexPath.row][@"id"]];
        
        [SVProgressHUD show];
        [manager DELETE:urlApagar
             parameters:nil
                success:^(AFHTTPRequestOperation *operation, id responseObject) {
                    [SVProgressHUD dismiss];
                    //self.comments = [NSMutableArray arrayWithArray:responseObject];
                    [self carregarTableView];
                }    failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                    [SVProgressHUD dismiss];
                    NSLog(@"Error: %@", error);
                }];
    }];
    
    UIAlertAction *detalharAction = [UIAlertAction actionWithTitle:@"Detalhar" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController pushViewController:viewDetail animated:YES];
    }];
    
    UIAlertAction *cancelarAction = [UIAlertAction actionWithTitle:@"Cancelar" style:UIAlertActionStyleDefault handler:nil];
    
    
    [alert addAction:deleteAction];
    [alert addAction:detalharAction];
    [alert addAction:cancelarAction];
    
    [self presentViewController:alert animated:YES completion:nil];

}




@end
