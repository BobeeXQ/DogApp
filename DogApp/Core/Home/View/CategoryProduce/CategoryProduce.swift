//
//  CategoryProduce.swift
//  DogApp
//
//  Created by 向前 on 7/13/23.
//

import SwiftUI

struct CategoryProduce: View {
    @Environment(\.dismiss) var dismiss
    @State var hoverUp : Bool = false
    @ObservedObject var produceFetchModel = ProduceFetchDataModel()
    
    var body: some View {
        NavigationView{
            VStack{
                Spacer()
                    .frame(height: 15)
                
                if !hoverUp{
                    HStack{
                        Spacer()
                            .frame(width: 25)

                        Button {
                            dismiss()
                        } label: {
                            Image(systemName: "arrow.left")
                                .foregroundColor(darkGreen)
                                .imageScale(.large)
                        }

                        Spacer()
                    }

                    Spacer()
                        .frame(height: 10)

                    HStack{
                        Spacer()
                            .frame(width: 25)

                        Text("Produce")
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .foregroundColor(darkGreen)

                        Spacer()
                    }
                    
                    Spacer()
                        .frame(height: 10)
                }
                
                Spacer()
                    .frame(height: 5)
                
                CategoryProduceSearch(hoverUp: $hoverUp)
                
                if hoverUp {
                    CategoryProduceHoverUp()
                }
                
                Spacer()
                    .frame(height: 16)
                
                if !hoverUp{
                   CategoryProduceBelowSearch()
                        .environmentObject(produceFetchModel)
                }
                
                Spacer()
            }
        }
    }
}

struct CategoryProduce_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProduce()
    }
}

struct CategoryProduceBelowSearch: View {
    @EnvironmentObject var produceFetchModel: ProduceFetchDataModel
    
    var columns: [GridItem] = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
    
    var body: some View {
        VStack{
            CategoryProduceButtons()
            
            Spacer()
                .frame(height: 20)
            
            // Result title line
            HStack {
                Spacer()
                    .frame(width: 25)
                
                Text("Results")
                    .font(.system(size: 20))
                    .foregroundColor(darkGreen)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button {
                    print("only")
                } label: {
                    HStack(spacing: 3){
                        Circle()
                            .frame(width: 10, height: 10)
                            .foregroundColor(midGreen)
                        
                        Text("Only")
                            .font(.system(size: 13))
                            .foregroundColor(.black)
                    }
                    .frame(width: 55, height: 24)
                    .background(tabbarGreen)
                    .cornerRadius(12)
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(borderGray)
                    )
                    
                    Spacer()
                        .frame(width: 25)
                }
            }
            
            Spacer()
                .frame(height: 10)
            
            ScrollView {
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(produceFetchModel.results, id: \.id) { product in
                        NavigationLink(destination: ResultDetailView(product: product)) {
                            SuggestedResult(foodName: product.name)
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
            }
        }
        .onAppear(perform: loadData)
    }
    
    private func loadData() {
        produceFetchModel.getData(from: "")
    }
}

struct CategoryProduceButtons: View {
    var body: some View {
        HStack{
            NavigationLink {
                CategoryProduceMeat()
                    .navigationBarBackButtonHidden()
            } label: {
                VStack(alignment: .center){
                    Image(systemName: "carrot.fill")
                        .frame(width: 83, height: 78)
                        .foregroundColor(darkGreen)
                        .background(tabbarGreen)
                        .cornerRadius(9)
                    
                    Text("Meat")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
            }
            
            VStack(alignment: .center){
                Button {
                    print("Diary")
                } label: {
                    Image(systemName: "fish.fill")
                        .frame(width: 83, height: 78)
                        .foregroundColor(darkGreen)
                        .background(tabbarGreen)
                        .cornerRadius(9)
                }
                Text("Diary")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
            }
            
            VStack(alignment: .center){
                Button {
                    print("Fruit")
                } label: {
                    Image(systemName: "basket.fill")
                        .frame(width: 83, height: 78)
                        .foregroundColor(darkGreen)
                        .background(tabbarGreen)
                        .cornerRadius(9)
                }
                Text("Fruit")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
            }
            
            VStack(alignment: .center){
                Button {
                    print("More")
                } label: {
                    Image(systemName: "ellipsis")
                        .frame(width: 83, height: 78)
                        .foregroundColor(darkGreen)
                        .background(tabbarGreen)
                        .cornerRadius(9)
                }
                Text("More")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
            }
        }
    }
}

struct CategoryProduceHoverUp: View {
    var body: some View {
        VStack{
            Text("a")
        }
    }
}

