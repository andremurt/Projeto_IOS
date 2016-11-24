//
//  FavoritosViewController.h
//  Projeto_IOS
//
//  Created by Andre Murta on 02/11/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EstabelecimentoViewController.h"

@interface FavoritosViewController : UIViewController<UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;


@end
