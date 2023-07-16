//
//  HomeView.swift
//  DogApp
//
//  Created by 向前 on 7/11/23.
//

import SwiftUI

struct HomeView: View {
    var user : User
    @State var hoverUp : Bool = false
    
    var dogName : String {
        if user.dogs?.count != 0 {
            return user.dogs![0].name! + "'s "
        }
        else {
            return ""
        }
    }
    
    var body: some View {
        NavigationView{
            VStack{
                if !hoverUp{
                    HomeViewHeader(dogName: dogName)
                }
                
                if hoverUp {
                    Spacer()
                        .frame(height: 5)
                }
                
                HomeViewSearch(hoverUp: $hoverUp)
                    .ignoresSafeArea(.keyboard)

                if !hoverUp {
                    HomeViewBanners()
                    
                    HomeViewCategoryText()
                    
                    HomeViewButtons()
                    
                    HomeViewTip()
                }
                
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
        }
        .ignoresSafeArea(.keyboard) // all
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        let tempUser = User(id: "a", username: "Mock User", email: "test@gmail.com")
        HomeView(user: tempUser)
    }
}

struct HomeViewHeader: View {
    @State var dogName : String
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 35)
            
            HStack{
                Spacer()
                    .frame(width: 25)
                
                VStack(alignment: .leading){
                    Text("Hello,")
                        .foregroundColor(midGreen)
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                    Text("\(dogName)Hooman!")
                        .foregroundColor(darkGreen)
                        .font(.system(size: 28))
                        .fontWeight(.bold)
                }
                .frame(width: 274, height: 30, alignment: .leading)
                
                Spacer()
                    .frame(width: 14)
                
                Image("Chiyo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 52, height: 52)
                
                Spacer()
            }
            
            Spacer()
                .frame(height: 45)
        }
    }
}

struct HomeViewBanners: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 23)
            
            TabView(selection: $selectedTab) {
                Image("ads")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 363, height: 169)
                    .cornerRadius(24)
                    .tag(0)
                
                Image("ads")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 363, height: 169)
                    .cornerRadius(24)
                    .tag(1)
                
                Image("ads")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 363, height: 169)
                    .cornerRadius(24)
                    .tag(2)
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
            .indexViewStyle(.page(backgroundDisplayMode: .never))
            .ignoresSafeArea(.all)
            .transition(.slide)
            .frame(height: 169)
            
            Spacer()
                .frame(height: 20)
        }
    }
}

struct HomeViewCategoryText: View{
    var body: some View {
        HStack{
            Spacer()
                .frame(width: 19)
            Text("Category")
                .font(.system(size: 20))
                .fontWeight(.bold)
                .foregroundColor(darkGreen)
            Spacer()
        }
    }
    
}
struct HomeViewButtons: View {
    var body: some View{
        HStack{
            NavigationLink {
                CategoryProduce()
                    .navigationBarBackButtonHidden()
            } label: {
                VStack(alignment: .center){
                    Image(systemName: "carrot.fill")
                        .frame(width: 83, height: 78)
                        .foregroundColor(darkGreen)
                        .background(tabbarGreen)
                        .cornerRadius(9)
                    
                    Text("Produce")
                        .font(.system(size: 13))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                }
                
            }

            VStack(alignment: .center){
                Button {
                    print("Dog Food")
                } label: {
                    Image(systemName: "fish.fill")
                        .frame(width: 83, height: 78)
                        .foregroundColor(darkGreen)
                        .background(tabbarGreen)
                        .cornerRadius(9)
                }
                Text("Dog Food")
                    .font(.system(size: 13))
                    .fontWeight(.bold)
            }
            
            VStack(alignment: .center){
                Button {
                    print("Manufacture")
                } label: {
                    Image(systemName: "basket.fill")
                        .frame(width: 83, height: 78)
                        .foregroundColor(darkGreen)
                        .background(tabbarGreen)
                        .cornerRadius(9)
                }
                Text("Manufature")
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

struct HomeViewTip : View {
    var body: some View {
        VStack{
            Spacer()
                .frame(height: 30)
            
            Image("tip")
                .resizable()
                .scaledToFit()
                .frame(height: 154)
        }
    }
}
