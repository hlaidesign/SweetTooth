//
//  MealDetailViewModel.swift
//  SweetTooth
//
//  Created by Hunter Lai on 11/20/23.
//

import Foundation

final class MealDetailViewModel: ObservableObject {
    
    @Published var meal = Meal(idMeal: "", strMeal: "", strMealThumb: "")
    @Published var mealDetail: MealDetail?
    
    @Published var ingredients = [Ingredient]()
    
    
    func getMealDetail(meal: Meal) async throws {
        do{
            //create the APICall for details at the given meal
            self.meal = meal
            let id = meal.idMeal
            let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"
            
            guard let url = URL(string: endpoint) else{
                throw GHError.invalidURL
            }
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                throw GHError.invalidResponse
            }
            
            //save JSON repsonse in mealDetail property
            do{
                let decoder = JSONDecoder()
                mealDetail = try decoder.decode(MealDetailResponse.self, from: data).meals[0]
            }catch{
                throw GHError.invalidData
            }
            
            //populate ingredients array
            getIngredients()
           
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
    
    
    //loops through all ingredients to only add those that have non-empty values to ingredients property
    func getIngredients(){
        if(mealDetail!.strIngredient1 != "" && mealDetail!.strMeasure1 != "") && mealDetail!.strIngredient1 != nil && mealDetail!.strMeasure1 != nil{
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient1!, strMeasure: mealDetail!.strMeasure1!))
        }
        
        if(mealDetail!.strIngredient2 != "" && mealDetail!.strMeasure2 != "" && mealDetail!.strIngredient2 != nil && mealDetail!.strMeasure2 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient2!, strMeasure: mealDetail!.strMeasure2!))
        }
        
        if(mealDetail!.strIngredient3 != "" && mealDetail!.strMeasure3 != "" && mealDetail!.strIngredient3 != nil && mealDetail!.strMeasure3 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient3!, strMeasure: mealDetail!.strMeasure3!))
        }
        
        if(mealDetail!.strIngredient4 != "" && mealDetail!.strMeasure4 != "" && mealDetail!.strIngredient4 != nil && mealDetail!.strMeasure4 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient4!, strMeasure: mealDetail!.strMeasure4!))
        }
        
        if(mealDetail!.strIngredient5 != "" && mealDetail!.strMeasure5 != "" && mealDetail!.strIngredient5 != nil && mealDetail!.strMeasure5 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient5!, strMeasure: mealDetail!.strMeasure5!))
        }
        if(mealDetail!.strIngredient6 != "" && mealDetail!.strMeasure6 != "" && mealDetail!.strIngredient6 != nil && mealDetail!.strMeasure6 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient6!, strMeasure: mealDetail!.strMeasure6!))
        }
        if(mealDetail!.strIngredient7 != "" && mealDetail!.strMeasure7 != "" && mealDetail!.strIngredient7 != nil && mealDetail!.strMeasure7 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient7!, strMeasure: mealDetail!.strMeasure7!))
        }
        if(mealDetail!.strIngredient8 != "" && mealDetail!.strMeasure8 != "" && mealDetail!.strIngredient8 != nil && mealDetail!.strMeasure8 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient8!, strMeasure: mealDetail!.strMeasure8!))
        }
        if(mealDetail!.strIngredient9 != "" && mealDetail!.strMeasure9 != "" && mealDetail!.strIngredient9 != nil && mealDetail!.strMeasure9 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient9!, strMeasure: mealDetail!.strMeasure9!))
        }
        
        if(mealDetail!.strIngredient10 != "" && mealDetail!.strMeasure10 != "" && mealDetail!.strIngredient10 != nil && mealDetail!.strMeasure10 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient10!, strMeasure: mealDetail!.strMeasure10!))
        }
        
        if(mealDetail!.strIngredient11 != "" && mealDetail!.strMeasure11 != "" && mealDetail!.strIngredient11 != nil && mealDetail!.strMeasure11 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient11!, strMeasure: mealDetail!.strMeasure11!))
        }
        
        if(mealDetail!.strIngredient12 != "" && mealDetail!.strMeasure12 != "" && mealDetail!.strIngredient12 != nil && mealDetail!.strMeasure12 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient12!, strMeasure: mealDetail!.strMeasure12!))
        }
        
        if(mealDetail!.strIngredient13 != "" && mealDetail!.strMeasure13 != "" && mealDetail!.strIngredient13 != nil && mealDetail!.strMeasure13 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient13!, strMeasure: mealDetail!.strMeasure13!))
        }
        
        if(mealDetail!.strIngredient14 != "" && mealDetail!.strMeasure14 != "" && mealDetail!.strIngredient14 != nil && mealDetail!.strMeasure14 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient14!, strMeasure: mealDetail!.strMeasure14!))
        }
        
        if(mealDetail!.strIngredient15 != "" && mealDetail!.strMeasure15 != "" && mealDetail!.strIngredient15 != nil && mealDetail!.strMeasure15 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient15!, strMeasure: mealDetail!.strMeasure15!))
        }
        if(mealDetail!.strIngredient16 != "" && mealDetail!.strMeasure16 != "" && mealDetail!.strIngredient16 != nil && mealDetail!.strMeasure16 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient16!, strMeasure: mealDetail!.strMeasure16!))
        }
        if(mealDetail!.strIngredient17 != "" && mealDetail!.strMeasure17 != "" && mealDetail!.strIngredient17 != nil && mealDetail!.strMeasure17 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient17!, strMeasure: mealDetail!.strMeasure17!))
        }
        if(mealDetail!.strIngredient18 != "" && mealDetail!.strMeasure18 != "" && mealDetail!.strIngredient18 != nil && mealDetail!.strMeasure18 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient18!, strMeasure: mealDetail!.strMeasure18!))
        }
        if(mealDetail!.strIngredient19 != "" && mealDetail!.strMeasure19 != "" && mealDetail!.strIngredient19 != nil && mealDetail!.strMeasure19 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient19!, strMeasure: mealDetail!.strMeasure19!))
        }
        if(mealDetail!.strIngredient20 != "" && mealDetail!.strMeasure20 != "" && mealDetail!.strIngredient20 != nil && mealDetail!.strMeasure20 != nil){
            ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient20!, strMeasure: mealDetail!.strMeasure20!))
        }
    }
    
    //Used to separate cooking instructions into numerical steps
    func addNumbersToNewlines(inputString: String) -> String {
        let substrings = inputString.components(separatedBy: "\n")

        let formattedString = substrings.enumerated().map { (index, substring) in
            "\(index + 1). \(substring)"
        }.joined(separator: "\n\n")

        return formattedString
    }
}
