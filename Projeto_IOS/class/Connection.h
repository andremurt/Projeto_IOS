//
//  Connection.h
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/30/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Estabelecimento.h"

@interface Connection : NSObject

+ (void) estabelecimentos:(void(^)(NSArray<Estabelecimento *> *especialidadesArray)) block;
    
@end
