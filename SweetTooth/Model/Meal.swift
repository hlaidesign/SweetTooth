//
//  Meal.swift
//  SweetTooth
//
//  Created by Hunter Lai on 11/20/23.
//

import Foundation


struct MealsResponse: Codable{
    let meals: [Meal]
}

struct Meal: Codable{
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
}


