//
//  Estabelecimento.m
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/30/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import "Estabelecimento.h"

@implementation Estabelecimento

- (instancetype)initWithDicitionary:(NSDictionary *) estabelecimento
{
    self = [super init];
    if (self) {
        [self createEstabelecimento:estabelecimento];
    }
    return self;
}

-(void)createEstabelecimento:(NSDictionary *) estabelecimento {
    
    self.id_estab           = [[estabelecimento objectForKey:@"id_estab"] integerValue];
    self.nome_estab         = [estabelecimento objectForKey:@"nome_estab"];
    self.horario_func       = [estabelecimento objectForKey:@"horario_func"];
    self.telefone           = [estabelecimento objectForKey:@"telefone"];
    self.email              = [estabelecimento objectForKey:@"email"];
    self.facebook           = [estabelecimento objectForKey:@"facebook"];
    self.endereco           = [estabelecimento objectForKey:@"endereco"];
    self.tipos_pagamento    = [estabelecimento objectForKey:@"tipos_pagamento"];
    self.latitude           = [estabelecimento objectForKey:@"latitude"];
    self.longitute          = [estabelecimento objectForKey:@"longitute"];
    self.foto               = [estabelecimento objectForKey:@"foto"];
    self.icone              = [estabelecimento objectForKey:@"icone"];
    self.culinaria          = [estabelecimento objectForKey:@"culinaria"];
}

@end
