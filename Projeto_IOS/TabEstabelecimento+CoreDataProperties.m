//
//  TabEstabelecimento+CoreDataProperties.m
//  Projeto_IOS
//
//  Created by Andre Murta on 03/11/16.
//  Copyright © 2016 iesb. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "TabEstabelecimento+CoreDataProperties.h"

@implementation TabEstabelecimento (CoreDataProperties)

+ (NSFetchRequest<TabEstabelecimento *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"TabEstabelecimento"];
}

@dynamic culinaria;
@dynamic email;
@dynamic endereco;
@dynamic facebook;
@dynamic foto;
@dynamic horario_func;
@dynamic icone;
@dynamic id_estab;
@dynamic latitude;
@dynamic longitude;
@dynamic nome_estab;
@dynamic telefone;
@dynamic tipos_pagamento;

@end
