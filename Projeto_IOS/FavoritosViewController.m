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

//@property (nonatomic, strong) NSArray<Estabelecimento *> *FavoritosList;
@property(nonatomic)NSMutableArray *estabelecimentos;

@end

@implementation FavoritosViewController


- (void)viewDidLoad {
    [super viewDidLoad];
}


-(void)viewWillAppear:(BOOL)animated {
    [self loadData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self estabelecimentos].count;
}


- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"cell";
    FavoritosTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    Estabelecimento *estab = [self.estabelecimentos objectAtIndex:indexPath.row];
    //NSLog(@"teste %@", [estab valueForKey:@"id_estab"]);
    cell.labelNomeEstabelecimentoFavorito.text = estab.nome_estab;
    cell.labelCulinariaFavorito.text = estab.culinaria;
    cell.tag = [[[self.estabelecimentos objectAtIndex:indexPath.row] valueForKey:@"id_estab"] integerValue];
    
    NSData * imageData = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: estab.icone]];
    {
        [cell.imgIconeFavorito setImage:[UIImage imageWithData: imageData]];
    };

    return cell;
}

#pragma mark - Fetched results controller

- (void) loadData {
    
    NSManagedObjectContext *managedObjectContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TabEstabelecimento" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    
    NSArray* arr = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    self.estabelecimentos = [NSMutableArray new];
    for (id estabelecimento in arr) {
        [self.estabelecimentos addObject:estabelecimento];
        NSLog(@"%@", estabelecimento);
    }
    [self.tableView reloadData];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([[segue identifier] isEqualToString:@"segueEstabelecimentoFav"]) {
        
        NSIndexPath* index = [[self tableView] indexPathForSelectedRow];
        Estabelecimento* estab = self.estabelecimentos[index.row] ;
        //Estabelecimento *estab = [self.FavoritosList objectAtIndex:index.row];
        EstabelecimentoViewController* dest = [segue destinationViewController];
        dest.estabelecimento = [Estabelecimento new];
        dest.estabelecimento_id = [NSString stringWithFormat:@"%d", [(UIView *)sender tag]];
        [dest setEstabelecimento:estab];
    }
}

@end
