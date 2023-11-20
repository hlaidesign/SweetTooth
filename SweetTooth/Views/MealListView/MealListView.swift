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
            
            //List of name and images of desserts
            if viewModel.meals != nil{
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
                try await viewModel.getMealList()
            }catch{
                print("unexpected error")
            }
        }
    }
    
    
    
    
    
}


struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
