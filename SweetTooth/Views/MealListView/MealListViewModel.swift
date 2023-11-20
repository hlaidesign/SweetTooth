//
//  MealListViewModel.swift
//  SweetTooth
//
//  Created by Hunter Lai on 11/20/23.
//

import Foundation

final class MealListViewModel: ObservableObject {
    
    @Published var meals: [Meal]?
    
    func getMealList() async throws{
        do{
            
            //Create URL Object
            let endpoint = "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert"

            guard let url = URL(string: endpoint) else{
                throw GHError.invalidURL
            }

            //Create URLSession from URL
            let (data, response) = try await URLSession.shared.data(from: url)

            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                throw GHError.invalidResponse
            }

            do{
                let decoder = JSONDecoder()
                let mealsResponse = try decoder.decode(MealsResponse.self, from: data)
                DispatchQueue.main.async {
                    self.meals = mealsResponse.meals
                }
                
            }catch{
                throw GHError.invalidData
            }
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
