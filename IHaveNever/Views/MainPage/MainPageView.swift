//
//  MainPageView.swift
//  IHaveNever
//
//  Created by PEPPA CHAN on 27.11.2024.
//

import SwiftUI

struct MainPageView: View {
    @AppStorage("wasShown") private var wasShown: Bool = false
    
    @State private var burgerShowing: Bool = false
    @State private var selectedTab: Bool = false
    
    var body: some View {
        ZStack{
            VStack{
                HStack{
                    Text("App Title")
                        .font(.title)
                        .bold()
                    Spacer()
                    VStack(spacing: 2){
                        ForEach(0..<2){ _ in
                            RoundedRectangle(cornerRadius: 8)
                                .frame(width: 27.72, height: 4.5)
                        }
                    }
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)) {
                            burgerShowing.toggle()
                        }
                    }
                }
                .padding(25)
                .foregroundStyle(Color.white)
                
                RoundedRectangle(cornerRadius: 28)
                    .frame(width: 334.74, height: 56)
                    .foregroundStyle(Color.white)
                    .padding(.bottom)
                    .overlay {
                        ZStack{
                            RoundedRectangle(cornerRadius: 24.99)
                                .frame(width: 162.26, height: 49.98)
                                .foregroundStyle(Color.init(red: 56/255, green: 25/255, blue: 145/255))
                                .padding(.bottom)
                                .offset(x: selectedTab ? 82.26: -82.26) // +-
                            HStack{
                                Text("Game Modes")
                                    .padding(.bottom)
                                    .foregroundStyle(!selectedTab ? Color.white : Color.init(red: 42/255, green: 15/255, blue: 118/255))
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.2)) {
                                            selectedTab = false
                                        }
                                    }
                                Spacer()
                                Text("AI Mode")
                                    .foregroundStyle(selectedTab ? Color.white : Color.init(red: 42/255, green: 15/255, blue: 118/255))
                                    .padding(.bottom)
                                    .padding(.trailing, 22)
                                    .onTapGesture {
                                        withAnimation(.easeInOut(duration: 0.2)) {
                                            selectedTab = true
                                        }
                                    }
                            }
                            .padding(.horizontal, 30)
                        }
                    }
                if !selectedTab {
                    MainPageGMView()
                        .clipShape(RoundedRectangle(cornerRadius: 38))
                } else {
                    AIModeView()
                        .clipShape(RoundedRectangle(cornerRadius: 38))
                }
            }
            .ignoresSafeArea()
            .padding(.top, 1)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(colors: [
                    Color.init(red: 42/255, green: 15/255, blue: 118/255),
                    Color.init(red: 78/255, green: 28/255, blue: 220/255),
                ], startPoint: .top, endPoint: .bottom)
            )
            
            if !wasShown {
                FirstFeaturesPageView()
                    .transition(.opacity)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            Rectangle()
                .frame(maxWidth: 299.62, maxHeight: .infinity)
                .foregroundStyle(Color.black.opacity(0.4))
                .ignoresSafeArea()
                .offset(x: burgerShowing ? -100: 400)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        burgerShowing.toggle()
                    }
                }
            BurgerView()
                .frame(maxWidth: 315, maxHeight: .infinity)
                .background(Color.white)
                .offset(x: burgerShowing ? 50 : 360)
        }
        .onAppear{
            APIService.shared.fecthAll(lang: "ru")
        }
    }
}

#Preview {
    MainPageView()
}
