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
@property (nonatomic) NSString* longitute;
@property (nonatomic) NSString* foto;
@property (nonatomic) NSString* icone;
@property (nonatomic) NSString* culinaria;

- (instancetype)initWithDicitionary:(NSDictionary *) estabelecimento;

/*
 "id_estab":"1",
 "nome_estab":"Mangai",
 "horario_func":"12:00 as 22:00",
 "telefone":"(61) 3252-0155",
 "email":"mangai@mangai.com.br",
 "facebook":"https:\/\/www.facebook.com\/RestauranteMang",
 "endereco":"Trecho 2 conj 26 lote 2 - SHCS, Brasilia - DF",
 "tipos_pagamento":"visa mastercad elo alelo refeicao americaexpress",
 "latitude":"-15.817719",
 "longitute":"-47.836981",
 "foto":"http:\/\/andremurta.esy.es\/Mangai.png",
 "icone":"http:\/\/andremurta.esy.es\/icone_mangai.png"
 */
@end
