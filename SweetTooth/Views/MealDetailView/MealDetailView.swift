//
//  MealDetailView.swift
//  SweetTooth
//
//  Created by Hunter Lai on 11/20/23.
//

import SwiftUI

struct MealDetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State var meal: Meal
    @StateObject private var viewModel = MealDetailViewModel()
    
    
    
    var body: some View {
        ScrollView{
            
            
            if(viewModel.mealDetail != nil){
                
                AsyncImage(url: URL(string: viewModel.meal.strMealThumb))
                { image in image.resizable() } placeholder: { Color.gray }
                    .aspectRatio(contentMode: .fit)
                    .frame( maxHeight: .infinity, alignment: .top)
                    .frame(maxHeight: .infinity)
                
                VStack(alignment: .leading){
                    Text(viewModel.mealDetail!.strMeal.capitalized)
                        .font(.title)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                    
                    Text("Ingredients")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    
                    ForEach(viewModel.ingredients) { ingredient in
                        
                        HStack{
//                            Text("\(ingredient.strMeasure) \(ingredient.strIngredient)")
                            Text(ingredient.strIngredient)
                                .font(.body)
                            Spacer()
                            Text(ingredient.strMeasure)
                                .font(.subheadline)
                                
                        }
                        
                        .padding(.vertical, 4)
                        
                        Divider()
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Instructions")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .padding(.vertical)
                        
                        
//                        Text(mealDetail!.strInstructions)
                        Text(viewModel.addNumbersToNewlines(inputString: viewModel.mealDetail!.strInstructions))
                            .font(.body)
                    }
                    
                    
                }
                .frame(maxWidth: .infinity)
                .padding()
                
                
                
                
            }else{
                LoadingView()
            }
            
            
            
        }
        .overlay(alignment: .topLeading) {
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "arrow.left")
                //                    .font(.title)
                    .font(.subheadline)
                    .foregroundColor(.primary)
                    .fontWeight(.bold)
                    .padding()
                    .frame(width: 30, height: 30)
                    .background(Color.white)
                    .clipShape(Circle())
                
            }
            .padding()
            .shadow(color: .gray, radius: 3, x: 0, y: 3)
        }
        
        .navigationBarBackButtonHidden(true)
        //        .navigationTitle(meal.strMeal.capitalized)
        .task{
            
            
            do{
                viewModel.meal = meal
                try await viewModel.runTask()
            }catch{
                print("unexpected error")
            }
        }
    }
    
  
    
    
    
}

