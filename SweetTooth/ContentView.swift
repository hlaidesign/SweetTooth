//
//  ContentView.swift
//  SweetTooth
//
//  Created by Hunter Lai on 11/13/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var meals: [Meal]?
    
    var body: some View {
        NavigationView {
            
            //List of name and images of desserts
            
            if meals != nil{
                List(meals!, id: \.idMeal){ meal in
                    NavigationLink(destination: MealView(meal: meal), label: {
                        Text(meal.strMeal)
                    })
                }
            }else{
                Text("No Meals")
            }
            
        }
        .padding()
        .task{
            do{
                meals = try await getRecipes().meals
                print(meals)
            }catch GHError.invalidURL{
                print("invalid URL")
            }catch GHError.invalidData{
                print("invalid data")
            }catch GHError.invalidResponse{
                print("invalid response")
            }catch{
                print("unexpected error")
            }
        }
    }
    
    
    
    func getRecipes() async throws -> MealsResponse{
        let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

        guard let url = URL(string: endpoint) else{
            throw GHError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw GHError.invalidResponse
        }

        do{
            let decoder = JSONDecoder()
            return try decoder.decode(MealsResponse.self, from: data)
        }catch{
            throw GHError.invalidData
        }
    }
    
}

struct MealsResponse: Codable{
    let meals: [Meal]
}

struct MealDetailResponse: Codable{
    let meals: [MealDetail]
}

struct Meal: Codable{
    
    let idMeal: String
    let strMeal: String
    let strMealThumb: String
    
    
}

struct Ingredient: Codable, Identifiable{
    let id = UUID()
    let strIngredient: String
    let strMeasure: String
}

struct MealDetail: Codable{
    
    let idMeal: String
    let strMeal: String
    let strInstructions: String
    let strMealThumb: String
    
    let strIngredient1: String?
    let strIngredient2: String?
    let strIngredient3: String?
    let strIngredient4: String?
    let strIngredient5: String?
    let strIngredient6: String?
    let strIngredient7: String?
    let strIngredient8: String?
    let strIngredient9: String?
    let strIngredient10: String?
    let strIngredient11: String?
    let strIngredient12: String?
    let strIngredient13: String?
    let strIngredient14: String?
    let strIngredient15: String?
    let strIngredient16: String?
    let strIngredient17: String?
    let strIngredient18: String?
    let strIngredient19: String?
    let strIngredient20: String?
    
    let strMeasure1: String?
    let strMeasure2: String?
    let strMeasure3: String?
    let strMeasure4: String?
    let strMeasure5: String?
    let strMeasure6: String?
    let strMeasure7: String?
    let strMeasure8: String?
    let strMeasure9: String?
    let strMeasure10: String?
    let strMeasure11: String?
    let strMeasure12: String?
    let strMeasure13: String?
    let strMeasure14: String?
    let strMeasure15: String?
    let strMeasure16: String?
    let strMeasure17: String?
    let strMeasure18: String?
    let strMeasure19: String?
    let strMeasure20: String?
    
    
}



enum GHError: Error{
    case invalidURL
    case invalidResponse
    case invalidData
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
