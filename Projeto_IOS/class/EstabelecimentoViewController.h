//
//  EstabelecimentoViewController.h
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/30/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "Estabelecimento.h"

@interface EstabelecimentoViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *lblNome;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (weak, nonatomic) IBOutlet UILabel *labelTiposPagamentos;
@property (weak, nonatomic) IBOutlet UIImageView *imgEstabelecimento;
@property (weak, nonatomic) IBOutlet UILabel *lblEndereco;
@property (weak, nonatomic) IBOutlet UILabel *lblFacebook;
@property(weak, nonatomic)Estabelecimento* estabelecimento;
@end
