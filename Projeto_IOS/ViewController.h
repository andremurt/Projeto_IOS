//
//  ViewController.h
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/21/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Connection.h"
#import "EstabelecimentoViewController.h"

@interface ViewController : UIViewController<UITableViewDataSource>

@property(nonatomic)NSArray<Estabelecimento *> *estabelecimentos;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

