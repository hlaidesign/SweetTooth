//
//  MealView.swift
//  SweetTooth
//
//  Created by Hunter Lai on 11/20/23.
//

import SwiftUI

struct MealView: View {
    
    @State var meal: Meal
    @State var mealDetail: MealDetail?
    
    @State var ingredients = [Ingredient]()
    
    var body: some View {
        ScrollView{
            if(mealDetail != nil){
                Text(mealDetail!.strMeal)
                Text(mealDetail!.strInstructions)
                
                
                    ForEach(ingredients) { ingredient in
                        Text("\(ingredient.strMeasure) \(ingredient.strIngredient)")
                    }
                
            }else{
                
            }
           
            
        }
            .task{
                do{
                    mealDetail = try await getMealDetail(meal: meal).meals[0]
                    
                    if(mealDetail!.strIngredient1 != "" && mealDetail!.strMeasure1 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient1!, strMeasure: mealDetail!.strMeasure1!))
                    }

                    if(mealDetail!.strIngredient2 != "" && mealDetail!.strMeasure2 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient2!, strMeasure: mealDetail!.strMeasure2!))
                    }

                    if(mealDetail!.strIngredient3 != "" && mealDetail!.strMeasure3 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient3!, strMeasure: mealDetail!.strMeasure3!))
                    }

                    if(mealDetail!.strIngredient4 != "" && mealDetail!.strMeasure4 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient4!, strMeasure: mealDetail!.strMeasure4!))
                    }

                    if(mealDetail!.strIngredient5 != "" && mealDetail!.strMeasure5 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient5!, strMeasure: mealDetail!.strMeasure5!))
                    }
                    if(mealDetail!.strIngredient6 != "" && mealDetail!.strMeasure6 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient6!, strMeasure: mealDetail!.strMeasure6!))
                    }
                    if(mealDetail!.strIngredient7 != "" && mealDetail!.strMeasure7 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient7!, strMeasure: mealDetail!.strMeasure7!))
                    }
                    if(mealDetail!.strIngredient8 != "" && mealDetail!.strMeasure8 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient8!, strMeasure: mealDetail!.strMeasure8!))
                    }
                    if(mealDetail!.strIngredient9 != "" && mealDetail!.strMeasure9 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient9!, strMeasure: mealDetail!.strMeasure9!))
                    }

                    if(mealDetail!.strIngredient10 != "" && mealDetail!.strMeasure10 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient10!, strMeasure: mealDetail!.strMeasure10!))
                    }

                    if(mealDetail!.strIngredient11 != "" && mealDetail!.strMeasure11 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient11!, strMeasure: mealDetail!.strMeasure11!))
                    }

                    if(mealDetail!.strIngredient12 != "" && mealDetail!.strMeasure12 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient12!, strMeasure: mealDetail!.strMeasure12!))
                    }

                    if(mealDetail!.strIngredient13 != "" && mealDetail!.strMeasure13 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient13!, strMeasure: mealDetail!.strMeasure13!))
                    }

                    if(mealDetail!.strIngredient14 != "" && mealDetail!.strMeasure14 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient14!, strMeasure: mealDetail!.strMeasure14!))
                    }

                    if(mealDetail!.strIngredient15 != "" && mealDetail!.strMeasure15 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient15!, strMeasure: mealDetail!.strMeasure15!))
                    }
                    if(mealDetail!.strIngredient16 != "" && mealDetail!.strMeasure16 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient16!, strMeasure: mealDetail!.strMeasure16!))
                    }
                    if(mealDetail!.strIngredient17 != "" && mealDetail!.strMeasure17 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient17!, strMeasure: mealDetail!.strMeasure17!))
                    }
                    if(mealDetail!.strIngredient18 != "" && mealDetail!.strMeasure18 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient18!, strMeasure: mealDetail!.strMeasure18!))
                    }
                    if(mealDetail!.strIngredient19 != "" && mealDetail!.strMeasure19 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient19!, strMeasure: mealDetail!.strMeasure19!))
                    }
                    if(mealDetail!.strIngredient20 != "" && mealDetail!.strMeasure20 != ""){
                        ingredients.append(Ingredient(strIngredient: mealDetail!.strIngredient20!, strMeasure: mealDetail!.strMeasure20!))
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
    
    func getMealDetail(meal: Meal) async throws -> MealDetailResponse{
        let id = meal.idMeal
        let endpoint = "https://themealdb.com/api/json/v1/1/lookup.php?i=\(id)"

        guard let url = URL(string: endpoint) else{
            throw GHError.invalidURL
        }

        let (data, response) = try await URLSession.shared.data(from: url)

        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
            throw GHError.invalidResponse
        }

        do{
            let decoder = JSONDecoder()
            return try decoder.decode(MealDetailResponse.self, from: data)
        }catch{
            throw GHError.invalidData
        }
    }
    
    
   
}

//struct MealView_Previews: PreviewProvider {
//    static var previews: some View {
//        MealView(meal: Meal(idMeal: "52909", strMeal: "Tarte Tatin", strMealThumb: "https://www.themealdb.com/images/media/meals/ryspuw1511786688.jpg"))
//    }
//}
