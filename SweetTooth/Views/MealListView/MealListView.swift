//
//  MealListView.swift
//  SweetTooth
//
//  Created by Hunter Lai on 11/13/23.
//

import SwiftUI

struct MealListView: View {
    
    @StateObject private var viewModel = MealListViewModel()
    
    var body: some View {
        NavigationView {
    
            if viewModel.meals != nil{
                
                //List of meals/desserts
                List(viewModel.meals!, id: \.idMeal){ meal in
                    NavigationLink(destination: MealDetailView(meal: meal), label: {
                        HStack{
                            AsyncImage(url: URL(string: meal.strMealThumb))
                            { image in image.resizable() } placeholder: { Color.gray }
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 90, height: 90)
                                .cornerRadius(8)
                                .padding(.trailing)
                            Text(meal.strMeal.capitalized)
                                .font(.headline)
                                .fontWeight(.semibold)
                        }
                        
                    })
                }
                .navigationTitle("🧁 Desserts")
                
            }else{
                LoadingView()
            }
            
        }
        .task{
            do{
                //make API call to get list of Desserts
                try await viewModel.getMealList()
            }catch{
                print("Error getting MealList")
            }
        }
    }
    
}


struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
