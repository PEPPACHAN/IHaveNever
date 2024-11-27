//
//  MainPageCards.swift
//  IHaveNever
//
//  Created by PEPPA CHAN on 27.11.2024.
//

import SwiftUI

struct MainPageGMView: View {
    private let arr = [["handKeeper", "name1", "cardCount 220"], ["handKeeper", "name2", "cardCount 888"], ["handKeeper", "name3", "cardCount 290"], ["handKeeper", "name4", "cardCount 200"]]
    var body: some View {
        VStack{
            ForEach(arr, id: \.self){ item in
                HStack{
                    Image(item[0])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 59.58, height: 56.62)
                        .padding(.horizontal)
                    VStack(alignment: .leading){
                        Text(item[1])
                            .foregroundStyle(Color.white)
                            .font(.system(size: 19.57, weight: .bold))
                                  
                        Text(item[2])
                            .font(.system(size: 14.87))
                            .foregroundStyle(Color.white.opacity(0.37))
                        
                        if arr.first == item {
                            Text("MOST POPULAR")
                                .padding(.horizontal, 10)
                                .padding(.vertical, 2)
                                .foregroundStyle(Color.white)
                                .font(.system(size: 11.76, weight: .heavy))
                                .background(Color.white.opacity(0.09))
                                .clipShape(
                                    RoundedRectangle(cornerRadius: 19.31)
                                )
                        }
                    }
                    Spacer()
                    Circle()
                        .frame(width: 28.37)
                        .foregroundStyle(Color.white.opacity(0.12))
                        .overlay {
                            Text("i")
                                .foregroundStyle(Color.white.opacity(0.36))
                                .font(.system(size: 16.62, weight: .heavy))
                        }
                    Image(systemName: "checkmark.circle.fill")//: "circle.fill")
                        .font(.system(size: 28.37))
                        .foregroundStyle(
                            Color.white,
                            LinearGradient(colors: [
                                Color.init(red: 23/255, green: 168/255, blue: 143/255),
                                Color.init(red: 11/255, green: 140/255, blue: 117/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
                        )
                        .tag(item)
                        .onTapGesture {
                            
                        }
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity, maxHeight: 95.93, alignment: .leading)
                .background(
                    LinearGradient(colors: [
                        Color.init(red: 27/255, green: 28/255, blue: 55/255),
                        Color.init(red: 43/255, green: 45/255, blue: 93/255)], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
                .clipShape(
                    RoundedRectangle(cornerRadius: 27)
                )
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    MainPageView()
}
