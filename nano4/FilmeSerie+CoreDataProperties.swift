//
//  FilmeSerie+CoreDataProperties.swift
//  nano4
//
//  Created by Gustavo Rigor on 26/05/20.
//  Copyright © 2020 Gustavo Rigor. All rights reserved.
//
//

import Foundation
import CoreData


extension FilmeSerie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FilmeSerie> {
        return NSFetchRequest<FilmeSerie>(entityName: "FilmeSerie")
    }

    @NSManaged public var nome: String?
    @NSManaged public var duracao: Int32
    @NSManaged public var capaImg: String?

}
