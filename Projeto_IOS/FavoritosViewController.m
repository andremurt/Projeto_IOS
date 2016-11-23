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
#import "AppDelegate.h"

@interface FavoritosViewController ()

@property (nonatomic, strong) NSArray<Estabelecimento *> *FavoritosList;

@end

@implementation FavoritosViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self loadData];
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
    
    static NSString *CellIdentifier = @"cell";
    FavoritosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Estabelecimento *estab = [self.FavoritosList objectAtIndex:indexPath.row];
    
    cell.labelNomeEstabelecimentoFavorito.text = estab.nome_estab;
    cell.labelCulinariaFavorito.text = estab.culinaria;
    
    
    return cell;
}

#pragma mark - Fetched results controller

- (void) loadData {
    
    NSManagedObjectContext *managedObjectContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TabEstabelecimento" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    _FavoritosList = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"segueEstabelecimento"]) {
        
        NSIndexPath* index = [[self tableView] indexPathForSelectedRow];
        Estabelecimento* e = [[self estabelecimentos] objectAtIndex:index.row];
        EstabelecimentoViewController* dest = [segue destinationViewController];
        [dest setEstabelecimento:e];
    }
}

@end
