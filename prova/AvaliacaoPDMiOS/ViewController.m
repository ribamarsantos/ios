//
//  ViewController.m
//  AvaliacaoPDMiOS
//
//  Created by Crystian Leão on 02/09/17.
//  Copyright © 2017 Ibratec. All rights reserved.
//

#import "ViewController.h"
#import <AFNetworking.h>
#import <UIImageView+AFNetworking.h>
#import "CommentTableViewCell.h"
#import <SVProgressHUD.h>
#import "ServerAPI.h"
#import "DetailCommentViewController.h"

@interface ViewController ()

@property (nonatomic) int page;
@property (strong) NSMutableArray * comments;
@property (strong) NSMutableArray * commentsTemp;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [SVProgressHUD show];
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeGradient];
    self.page = 1;
    
    [self initArrayComment];
    
    // Isso aqui diz pra o iOS não criar espaços em cima das scrollviews, por causa do navigation bar
    self.automaticallyAdjustsScrollViewInsets = NO;
    

    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSLog(@"rows %i", (int) self.comments.count);
    return self.comments.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CommentTableViewCell * cell = [ tableView dequeueReusableCellWithIdentifier:@"customcell" forIndexPath:indexPath];
    
    
    NSDictionary *myObj = self.comments[ indexPath.row];
    
    cell.lblUser.text = myObj[@"user"];
    cell.lblDataPost.text =  [myObj[@"created_at"] substringToIndex:10];
    cell.txtComment.text = myObj[@"content"];
    
    cell.imgAvatar.layer.cornerRadius = cell.imgAvatar.frame.size.width / 2;
    cell.imgAvatar.clipsToBounds = YES;
    
    NSURL	*filePath	=	[NSURL URLWithString: myObj[@"image"] ];
    [cell.imgAvatar setImageWithURL:filePath placeholderImage:[UIImage imageNamed:@"place_user"]];
    
    if (indexPath.row == [self.comments count] - 1) {
        // Última célula, tenta carregar mais
        self.page++;
        [self carregarTableView];
        NSLog(@"chamou no cellforrowatIndexPath");
    }
    
    return cell;
}

- (IBAction)btnReloadComment:(id)sender {
    self.page = 1;
    [self   initArrayComment];
    [self carregarTableView];
    NSLog(@"chamou no reload comment");
}

-(void)viewWillAppear:(BOOL)animated{
    [self.txtSearch setText:@""];
    self.page = 1;
    [self carregarTableView];
    NSLog(@"chamou no will Apppear");

}


-(void) carregarTableView {
    
  [[ServerAPI sharedClient] getComments:self.page
     andSuccessBlock:^(NSArray *comments) {
         
         if (self.page == 1) {
             [self initArrayComment];
         }
         if( comments.count != 0){
             [self.comments addObjectsFromArray:comments];
             self.commentsTemp = self.comments;
             [self.tableViewComment reloadData ];
         }

       [SVProgressHUD dismiss];
         
     } andErrorBlock:^(NSError *error, AFHTTPRequestOperation *operation) {
      NSLog(@"Error:	%@",	error);
      [SVProgressHUD dismiss];
    }];
   
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    NSDictionary *myObj = self.comments[ indexPath.row];
    
    
    DetailCommentViewController * viewDetail = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailCommentViewController"];
    
    
    viewDetail.comment = myObj;
    
    [self.navigationController pushViewController:viewDetail animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) initArrayComment{
    //self.page = 1;
    self.comments = [NSMutableArray arrayWithArray: @[]];
   // self.commentsFilter = [NSMutableArray arrayWithArray: @[]];
}
- (IBAction)btnSair:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{

    
    if(searchText.length == 0)
    {
        
        self.comments  = self.commentsTemp;
        //self.isFiltered = NO;
    }
    else
    {
        //self.isFiltered = YES;
        NSPredicate *predicate  = [NSPredicate predicateWithFormat:@"user contains[cd] %@",searchText];
        self.comments  =[NSMutableArray arrayWithArray:[self.commentsTemp filteredArrayUsingPredicate:predicate]];
        
    }
    
    [self.tableViewComment reloadData];
    [searchBar becomeFirstResponder];
}



@end
