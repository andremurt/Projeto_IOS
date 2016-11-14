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

#pragma mark - Fetched results controller

- (NSFetchedResultsController *)fetchedResultsController{
    
     NSManagedObjectContext *managedObjectContext = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;

    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"TabEstabelecimento" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *result = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (error) {
        NSLog(@"Unable to execute fetch request.");
        NSLog(@"%@, %@", error, error.localizedDescription);
    }
        
    return result;
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
