//
//  ViewController.m
//  CollectionViewProject
//
//  Created by Treinamento on 12/08/17.
//  Copyright © 2017 Ribamar. All rights reserved.
//

#import "ViewController.h"
#import "TesteCollectionViewCell.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrayElements = @[ @"Segunda", @"Terca", @"Quarta", @"Quinta", @"Sexta", @"Sabado", @"Domingo"];
    // Do any additional setup after loading the view, typically from a nib.
}

-(NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.arrayElements.count;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    TesteCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    cell.lblInfo.text = self.arrayElements[indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
