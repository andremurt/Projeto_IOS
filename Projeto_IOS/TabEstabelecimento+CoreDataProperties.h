//
//  TabEstabelecimento+CoreDataProperties.h
//  Projeto_IOS
//
//  Created by Andre Murta on 03/11/16.
//  Copyright © 2016 iesb. All rights reserved.
//  This file was automatically generated and should not be edited.
//

#import "TabEstabelecimento+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface TabEstabelecimento (CoreDataProperties)

+ (NSFetchRequest<TabEstabelecimento *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *culinaria;
@property (nullable, nonatomic, copy) NSString *email;
@property (nullable, nonatomic, copy) NSString *endereco;
@property (nullable, nonatomic, copy) NSString *facebook;
@property (nullable, nonatomic, copy) NSString *foto;
@property (nullable, nonatomic, copy) NSString *horario_func;
@property (nullable, nonatomic, copy) NSString *icone;
@property (nonatomic) int32_t id_estab;
@property (nullable, nonatomic, copy) NSString *latitude;
@property (nullable, nonatomic, copy) NSString *longitude;
@property (nullable, nonatomic, copy) NSString *nome_estab;
@property (nullable, nonatomic, copy) NSString *telefone;
@property (nullable, nonatomic, copy) NSString *tipos_pagamento;

@end

NS_ASSUME_NONNULL_END
