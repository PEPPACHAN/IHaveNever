//
//  FirstFeaturesPageView.swift
//  IHaveNever
//
//  Created by PEPPA CHAN on 26.11.2024.
//

import SwiftUI

struct FirstFeaturesPageView: View {
    @AppStorage("wasShown") var wasShown: Bool = false
    
    @State private var currentPage = 0
    private let colors = [
        LinearGradient(colors: [Color.init(red: 42/255, green: 15/255, blue: 118/255), Color.init(red: 78/255, green: 28/255, blue: 220/255), Color.init(red: 42/255, green: 15/255, blue: 118/255)], startPoint: .top, endPoint: .bottom),
        LinearGradient(colors: [Color.init(red: 155/255, green: 20/255, blue: 148/255), Color.init(red: 190/255, green: 18/255, blue: 101/255), Color.init(red: 155/255, green: 20/255, blue: 148/255)], startPoint: .top, endPoint: .bottom),
        LinearGradient(colors: [Color.init(red: 15/255, green: 118/255, blue: 89/255), Color.init(red: 28/255, green: 220/255, blue: 201/255), Color.init(red: 15/255, green: 118/255, blue: 89/255)], startPoint: .top, endPoint: .bottom),
        LinearGradient(colors: [Color.init(red: 42/255, green: 15/255, blue: 118/255), Color.init(red: 78/255, green: 28/255, blue: 220/255), Color.init(red: 42/255, green: 15/255, blue: 118/255)], startPoint: .top, endPoint: .bottom)
    ]
    
    var body: some View {
        VStack{
            HStack {
                ForEach(0..<4) { index in
                    Rectangle()
                        .foregroundStyle(index == currentPage ? .white : .gray.opacity(0.5))
                        .frame(width: 60, height: 4)
                        .clipShape(.capsule)
                        .animation(.easeInOut, value: currentPage)
                }
                Image(systemName: "xmark")
                    .foregroundStyle(Color.gray.opacity(0.5))
                    .offset(x: 20)
                    .opacity(currentPage == 3 ? 1: 0)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.5)){
                            wasShown.toggle()
                        }
                    }
            }
            .padding(.horizontal, 50)
            .padding(.top, 40)
            
            TabView(selection: $currentPage) {
                FirstPageView()
                    .tag(0)
                SecondPageView()
                    .tag(1)
                ThirdPageView()
                    .tag(2)
                FourthPageView()
                    .tag(3)
            }
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            Button (action: {
                if currentPage < 3{
                    withAnimation(.easeInOut(duration: 0.5)){
                        currentPage+=1
                    }
                }
            }){
                Text("Continue")
                    .foregroundStyle(Color.black)
                    .frame(maxWidth: UIScreen.main.bounds.width - 100, maxHeight: 60)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 100))
            }
            .offset(y: -28)
            HStack {
                Text("Terms of Use")
                Spacer()
                Text("Restore")
                Spacer()
                Text("Privacy Policy")
            }
            .disabled(currentPage != 3)
            .foregroundStyle(currentPage == 3 ? Color.gray.opacity(0.4): Color.clear)
            .font(.system(size: 14))
            .padding(.horizontal, 50)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(colors[currentPage].ignoresSafeArea())
    }
}
//
//#Preview {
//    FirstFeaturesPageView()
//}
