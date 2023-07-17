//
//  CategoryProduceMeat.swift
//  DogApp
//
//  Created by 向前 on 7/13/23.
//

import SwiftUI

struct CategoryProduceMeat: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        VStack{
            Spacer()
                .frame(height: 15)
            
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
                
                Text("Meat")
                    .font(.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(darkGreen)
                
                Spacer()
            }
            
            Spacer()
        }
    }
}

struct CategoryProduceMeat_Previews: PreviewProvider {
    static var previews: some View {
        CategoryProduceMeat()
    }
}
