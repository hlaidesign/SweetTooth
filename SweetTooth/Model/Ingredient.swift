//
//  Ingredient.swift
//  SweetTooth
//
//  Created by Hunter Lai on 11/20/23.
//

import Foundation

struct Ingredient: Codable, Identifiable{
    let id = UUID()
    let strIngredient: String
    let strMeasure: String
}
