//
//  EstabelecimentoViewController.m
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/30/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import "EstabelecimentoViewController.h"
#import "Estabelecimento.h"
#import "AppDelegate.h"
#import <CoreData/CoreData.h>

@interface EstabelecimentoViewController ()

@end

@implementation EstabelecimentoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    double lat = [[[self estabelecimento] latitude]doubleValue];
    double lon = [[[self estabelecimento] longitute]doubleValue];
    
    CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(lat, lon);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(0.1, 0.1);
    MKCoordinateRegion region = {coord, span};
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    [annotation setCoordinate:coord];
    
    [self.mapView setRegion:region];
    [self.mapView addAnnotation:annotation];
    
    [self.lblNome setText:[[self estabelecimento] nome_estab]];
    [self.lblEndereco setText:[[self estabelecimento] endereco]];
    [self.lblhorario setText:[[self estabelecimento] horario_func]];
    [self.labelTiposPagamentos setText:[[self estabelecimento] tipos_pagamento]];
        
    self.imgEstabelecimento.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:
                                                            [NSURL URLWithString:self.estabelecimento.foto]]];
    
    NSString *id_pesq;
    if (self.estabelecimento.id_estab) {
        id_pesq = self.estabelecimento.id_estab;
    }
    
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSEntityDescription *Entity=[NSEntityDescription entityForName:@"TabEstabelecimento" inManagedObjectContext:context];
    NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
    [fetch setEntity:Entity];
    NSPredicate *p=[NSPredicate predicateWithFormat:@"id == %@", id_pesq];
    [fetch setPredicate:p];
    NSError *fetchError;
    NSArray *results = [context executeFetchRequest:fetch error:&fetchError];
    
    if (results.firstObject > 0){
        [_myswitch setOn:YES];

    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)switchFavorito:(UISwitch *)sender {
    
    
    if (sender.isOn){
        //inserir
        NSManagedObjectContext *context = ((AppDelegate *)[UIApplication sharedApplication].delegate).managedObjectContext;
        
        NSManagedObject *nsmanaged = [NSEntityDescription insertNewObjectForEntityForName:@"TabEstabelecimento" inManagedObjectContext:context];
        
        [nsmanaged setValue:self.estabelecimento.id_estab forKey:@"id"];
        [nsmanaged setValue:self.estabelecimento.icone forKey:@"icone"];
        [nsmanaged setValue:self.estabelecimento.culinaria forKey:@"culinaria"];
        [nsmanaged setValue:self.estabelecimento.email forKey:@"email"];
        [nsmanaged setValue:self.estabelecimento.endereco forKey:@"endereco"];
        [nsmanaged setValue:self.estabelecimento.facebook forKey:@"facebook"];
        [nsmanaged setValue:self.estabelecimento.foto  forKey:@"foto"];
        [nsmanaged setValue:self.estabelecimento.horario_func forKey:@"horario_func"];
        [nsmanaged setValue:self.estabelecimento.latitude forKey:@"latitude"];
        [nsmanaged setValue:self.estabelecimento.longitute forKey:@"longitute"];
        [nsmanaged setValue:self.estabelecimento.nome_estab forKey:@"nome_estab"];
        [nsmanaged setValue:self.estabelecimento.telefone forKey:@"telefone"];
        [nsmanaged setValue:self.estabelecimento.tipos_pagamento forKey:@"tipos_pagamento"];
        
        NSError *error;
        [context save:&error];


     }
    else{
        //deletar
        
        
        NSString *id_pesq = self.estabelecimento.id_estab;
        
        AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
        NSManagedObjectContext *context = [appDelegate managedObjectContext];
        
        NSEntityDescription *Entity=[NSEntityDescription entityForName:@"TabEstabelecimento" inManagedObjectContext:context];
        NSFetchRequest *fetch=[[NSFetchRequest alloc] init];
        [fetch setEntity:Entity];
        NSPredicate *p=[NSPredicate predicateWithFormat:@"id == %@", id_pesq];
        [fetch setPredicate:p];
        NSError *fetchError;
        NSError *error;
        NSArray *fetchedEstabelecimentos=[context executeFetchRequest:fetch error:&fetchError];
        for (NSManagedObject *estabelecimento in fetchedEstabelecimentos) {
            [context deleteObject:estabelecimento];
        }
        [context save:&error];
    }
}
@end
