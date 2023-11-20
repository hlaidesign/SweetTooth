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
                
                //thumbnail image
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
                    
                    //List of ingredients
                    ForEach(viewModel.ingredients) { ingredient in
                        HStack{
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
            
            //Floating Back Button
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
        .task{
            
            //make API call for details of a specific meal
            do{
                try await viewModel.getMealDetail(meal: meal)
            }catch{
                print("error getting MealDetail")
            }
        }
    }
    
  
    
    
    
}

