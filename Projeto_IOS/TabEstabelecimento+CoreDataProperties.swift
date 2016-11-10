//
//  TabEstabelecimento+CoreDataProperties.swift
//  Projeto_IOS
//
//  Created by Andre Murta on 09/11/16.
//  Copyright © 2016 iesb. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension TabEstabelecimento {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TabEstabelecimento> {
        return NSFetchRequest<TabEstabelecimento>(entityName: "TabEstabelecimento");
    }

    @NSManaged public var id: String?
    @NSManaged public var icone: String?
    @NSManaged public var culinaria: String?
    @NSManaged public var email: String?
    @NSManaged public var endereco: String?
    @NSManaged public var facebook: String?
    @NSManaged public var foto: String?
    @NSManaged public var horario_func: String?
    @NSManaged public var latitude: String?
    @NSManaged public var longitute: String?
    @NSManaged public var nome_estab: String?
    @NSManaged public var telefone: String?
    @NSManaged public var tipos_pagamento: String?

}
