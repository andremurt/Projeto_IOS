//
//  EstabelecimentoViewController.m
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/30/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import "EstabelecimentoViewController.h"

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

@end
