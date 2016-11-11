//
//  FavoritosViewController.m
//  Projeto_IOS
//
//  Created by Andre Murta on 02/11/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import "FavoritosViewController.h"
#import "FavoritosTableViewCell.h"
#import "TabEstabelecimento+CoreDataClass.h"

@interface FavoritosViewController ()

@property (nonatomic, strong) NSArray *FavoritosList;

@end

@implementation FavoritosViewController

@synthesize FavoritosList = _FavoritosList;

- (void)viewDidLoad {
    [super viewDidLoad];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.FavoritosList.count;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"ListCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    FavoritosViewController *currentList = [self.FavoritosList objectAtIndex:self.tableView.indexPathForSelectedRow.row];
    cell.textLabel.text = currentList.title;
    
    return cell;
}

@end
