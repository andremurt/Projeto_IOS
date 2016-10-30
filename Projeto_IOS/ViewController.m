//
//  ViewController.m
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/21/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import "ViewController.h"
#import "EstabelecimentoTableViewCell.h"

@interface ViewController ()


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        [Connection estabelecimentos:^(NSArray<Estabelecimento *> *especialidadesArray) {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setEstabelecimentos:especialidadesArray];
                [[self tableView] reloadData];
            });
        }];
    // Do any additional setup after loading the view, typically from a nib.
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self estabelecimentos] count];
}

// Row display. Implementers should *always* try to reuse cells by setting each cell's reuseIdentifier and querying for available reusable cells with dequeueReusableCellWithIdentifier:
// Cell gets various attributes set automatically based on table (separators) and data source (accessory views, editing controls)

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    EstabelecimentoTableViewCell* cell = (EstabelecimentoTableViewCell *) [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    Estabelecimento* estabelecimento = [[self estabelecimentos] objectAtIndex:indexPath.row];
    [cell.labelNomeEstabelecimento setText:estabelecimento.nome_estab];
    
    [ViewController loadFromURL:[NSURL URLWithString:estabelecimento.icone] callback:^(UIImage *image) {
        [cell.imgIcone setImage:image];
    }];
    
    return cell;
}

+ (void) loadFromURL: (NSURL*) url callback:(void (^)(UIImage *image))callback {
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0ul);
    dispatch_async(queue, ^{
        NSData * imageData = [NSData dataWithContentsOfURL:url];
        dispatch_async(dispatch_get_main_queue(), ^{
            UIImage *image = [UIImage imageWithData:imageData];
            callback(image);
        });
    });
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
