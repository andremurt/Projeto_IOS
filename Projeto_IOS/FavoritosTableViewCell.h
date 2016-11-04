//
//  FavoritosTableViewCell.h
//  Projeto_IOS
//
//  Created by Andre Murta on 03/11/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FavoritosTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgIcone;
@property (weak, nonatomic) IBOutlet UILabel *labelNomeEstabelecimento;
@property (weak, nonatomic) IBOutlet UILabel *labelCulinaria;

@end
