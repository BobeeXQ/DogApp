//
//  SuggestedResult.swift
//  DogApp
//
//  Created by 向前 on 7/16/23.
//

import SwiftUI

struct SuggestedResult: View {
    @State var foodName : String
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 19)
            
            Image(systemName: "carrot.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(.orange)
                .frame(width: 65, height: 80)

            Spacer()
                .frame(height: 20)
            
            VStack(spacing: 5){
                Text("\(foodName)")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .frame(width: 136, height: 21, alignment: .leading)
                
                Rectangle()
                    .foregroundColor(midGreen)
                    .frame(width: 136, height: 16)
                    .cornerRadius(15)
                    .opacity(0.5)
                
                Spacer()
                    .frame(height: 15)
            }
            .frame(width: 170, height: 50)
            .background(
                LinearGradient(gradient: Gradient(colors: [.white, Color(red: 0.91, green: 0.99, blue: 0.88)]), startPoint: .top, endPoint: .bottom)
            )
            
        }
        .frame(width: 170, height: 165)
        .cornerRadius(15)
        .overlay(
            RoundedRectangle(cornerRadius: 15)
                .stroke(borderGray)
        )
        
    }
}

struct SuggestedResult_Previews: PreviewProvider {
    static var previews: some View {
        SuggestedResult(foodName: "carrot")
    }
}
