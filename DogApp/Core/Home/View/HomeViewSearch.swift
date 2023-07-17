//
//  HomeViewSearch.swift
//  DogApp
//
//  Created by 向前 on 7/12/23.
//

import SwiftUI

struct HomeViewSearch: View {
    @ObservedObject var fetchModel = FetchDataModel()

    @State private var searchText = ""
    @State var isEditing : Bool = false
    @Binding var hoverUp : Bool
    
    var body: some View {
        HStack{
            TextField("Search", text: $searchText)
                .autocorrectionDisabled()
                .padding(13)
                .padding(.horizontal, 35)
                .background(Color(.systemGray6))
                .cornerRadius(25)
                .overlay(
                    HStack {
                        if !isEditing {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.gray)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 16)
                        }
                        else{
                            Button(action: {
                                withAnimation{
                                    isEditing = false
                                    searchText = ""
                                    hoverUp = false
                                    UIApplication.shared.endEditing()
                                }
                            }) {
                                Image(systemName: "arrow.left")
                                    .fontWeight(.bold)
                                    .foregroundColor(.gray)
                                    .padding(.leading, 16)
                                    .padding(.top)
                                    .padding(.bottom)
                            }
                            
                            Spacer()
                        }
                        if isEditing {
                            Button(action: {
                                withAnimation{
                                    searchText = ""
                                }
                            }) {
                                Image(systemName: "multiply.circle.fill")
                                    .foregroundColor(.gray)
                                    .padding(.trailing, 8)
                                    .opacity(searchText.isEmpty ? 0 : 1)
                            }
                        }
                    }
                )
                .onTapGesture {
                    withAnimation {
                        self.isEditing = true
                        hoverUp = true
                    }
                }
                .onChange(of: searchText, perform: { newValue in
                    fetchModel.getData(from: newValue)
                })
                .onChange(of: fetchModel.category, perform: { _ in
                    fetchModel.getData(from: searchText)
                })
        }
        .frame(width: 363, height: 49)
        .ignoresSafeArea(.keyboard)

        if hoverUp{
            HomeViewSearchHoverUp(searchText: $searchText)
                .environmentObject(fetchModel)
                .ignoresSafeArea(.keyboard)
        }
    }
}

struct HomeViewSearch_Previews: PreviewProvider {
    static var previews: some View {
        HomeViewSearch(hoverUp: .constant(true))
    }
}




