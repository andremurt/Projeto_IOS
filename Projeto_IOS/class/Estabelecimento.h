//
//  Estabelecimento.h
//  Projeto_IOS
//
//  Created by Rodrigo Nóbrega on 10/30/16.
//  Copyright © 2016 iesb. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Estabelecimento : NSObject



@property (nonatomic) NSString* id_estab;
@property (nonatomic) NSString* nome_estab;
@property (nonatomic) NSString* horario_func;
@property (nonatomic) NSString* telefone;
@property (nonatomic) NSString* email;
@property (nonatomic) NSString* facebook;
@property (nonatomic) NSString* endereco;
@property (nonatomic) NSString* tipos_pagamento;
@property (nonatomic) NSString* latitude;
@property (nonatomic) NSString* longitude;
@property (nonatomic) NSString* foto;
@property (nonatomic) NSString* icone;
@property (nonatomic) NSString* culinaria;

- (instancetype)initWithDicitionary:(NSDictionary *) estabelecimento;


@end
