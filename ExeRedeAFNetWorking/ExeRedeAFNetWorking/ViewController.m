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

@interface ViewController ()

@property (nonatomic) NSArray * comments;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self carregarTableView];
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


-(void) carregarTableView{
    AFHTTPRequestOperationManager	*manager	=	[AFHTTPRequestOperationManager
                                                     manager];
    [manager	GET:@"http://teste-aula-ios.herokuapp.com/comments.json"
      parameters:nil
         success:^(AFHTTPRequestOperation	*operation,	id responseObject)	{
             
             self.comments = responseObject;
             //NSLog(@"comments:	%@",	self.comments);
             [self.tableViewComment reloadData ];
         }	failure:^(AFHTTPRequestOperation	*operation,	NSError	*error)	{
             NSLog(@"Error:	%@",	error);
         }];
}

- (IBAction)novoComentario:(id)sender {
}


@end
