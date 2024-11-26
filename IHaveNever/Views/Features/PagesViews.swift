//
//  PagesViews.swift
//  IHaveNever
//
//  Created by PEPPA CHAN on 26.11.2024.
//

import SwiftUI

struct FirstPageView: View {
    var body: some View {
        ZStack{
            VStack{
                Image("firstPageFirst")
                Image("firstPageOther")
            }
            .offset(y: -50)
            .mask({
                Rectangle() //  rgba(45, 16, 125, 1)
                    .offset(y: -250)
                    .blur(radius: 50)
                    .frame(width: 1000, height: 700)
            })
            VStack(spacing: 20){
                Text("1M+ Questions in\none app")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 27))
                    .bold()
                    .foregroundStyle(Color.white)
                Text("Have fun, wait for the\nboards to update")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20.5))
                    .foregroundStyle(Color.white)
            }
            .offset(y: 250)
        }
    }
} //  rgba(78, 28, 220, 1)

struct SecondPageView: View {  //  rgba(155, 20, 148, 1) -> rgba(190, 18, 101, 1), Sex & Dirty Questions, Lots of dirty questions for couples or good friends..., rgba(141, 18, 115, 1), blur 150
    var body: some View {
        ZStack{
            Image("handKeeper")
                .offset(y: -100)
                .mask {
                    Rectangle()
                        .offset(y: -250)
                        .blur(radius: 150)
                        .frame(width: .infinity, height: 500)
                }
            VStack(spacing: 20){
                Text("Sex & Dirty\nQuestions")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 27))
                    .bold()
                    .foregroundStyle(Color.white)
                Text("Lots of dirty questions for\ncouples or good friends...")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20.5))
                    .foregroundStyle(Color.white)
            }
            .offset(y: 250)
        }
    }
}

struct ThirdPageView: View {  //  , rgba(17, 129, 101, 1), Thank you for rating!, Show your love and rate us in the AppStore
    var body: some View {
        VStack(spacing: 20){
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 160, height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 37))
                .offset(y: -25)
            
            VStack(spacing: -18){
                Image(systemName: "star.fill")
                    .foregroundStyle(Color.yellow)
                    .font(.system(size: 25))
                HStack(spacing: 40){
                    ForEach(0..<2){ _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.yellow)
                            .font(.system(size: 25))
                    }
                }
                HStack(spacing: 100){
                    ForEach(0..<2){ _ in
                        Image(systemName: "star.fill")
                            .foregroundStyle(Color.yellow)
                            .font(.system(size: 25))
                    }
                }
            }
            .offset(y: -5)
            
                Text("Thank you for\nrating!")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 27))
                    .bold()
                    .foregroundStyle(Color.white)
                Text("Show your love and rate\nus in the AppStore")
                    .multilineTextAlignment(.center)
                    .font(.system(size: 20.5))
                    .foregroundStyle(Color.white)
        }
    }
}

struct FourthPageView: View {
    @State private var choice = 0
    var body: some View {
        VStack(spacing: 30){
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 78.5, height: 78.5)
                .clipShape(RoundedRectangle(cornerRadius: 18.4))
                .offset(y: -25)
            
            Text("Get Full Access")
                .font(.system(size: 27))
                .bold()
                .foregroundStyle(Color.white)
                .offset(y: -20)
            
            VStack(alignment: .leading, spacing: 20){
                HStack{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(Color.white)
                    HStack(spacing: 5){
                        Text("AI Cards")
                            .frame(width: 80, height: 25)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .font(.system(size: 16.6))
                            .foregroundStyle(Color.black)
                        Text("Create")
                            .font(.system(size: 16.6))
                            .foregroundStyle(Color.white)
                    }
                }
                HStack{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(Color.white)
                    Text("3-Day Free Trial")
                        .font(.system(size: 16.6))
                        .foregroundStyle(Color.white)
                }
                HStack{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(Color.white)
                    Text("Dirty & Sex cards")
                        .font(.system(size: 16.6))
                        .foregroundStyle(Color.white)
                }
                HStack{
                    Image(systemName: "checkmark.circle.fill")
                        .foregroundStyle(Color.white)
                    Text("New content updates")
                        .font(.system(size: 16.6))
                        .foregroundStyle(Color.white)
                }
            }
            VStack(spacing: 10) {
                HStack(spacing: 15){
                    VStack(alignment: .leading){
                        Text("Yearly")
                            .foregroundStyle(Color.white)
                            .bold()
                        HStack(spacing: 5){
                            Text("3-Day Free Trial")
                                .foregroundStyle(Color.white)
                            Text("(then $90.00 /year)")
                                .foregroundStyle(Color.white.opacity(0.5))
                        }
                    }
                    Image(systemName: choice == 0 ? "inset.filled.circle": "circle")
                        .font(.system(size: 22))
                        .foregroundStyle(Color.white)
                }
                .frame(width: 370, height: 60)
                .background(Color.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 100))
                .overlay {
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.white, lineWidth: choice == 0 ? 1: 0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)){
                        choice = 0
                    }
                }
                HStack(spacing: 15){
                    VStack(alignment: .leading){
                        Text("Monthly")
                            .foregroundStyle(Color.white)
                            .bold()
                        HStack(spacing: 5){
                            Text("$9.90 /month")
                                .foregroundStyle(Color.white)
                        }
                    }
                    .padding(.horizontal, 25)
                    Spacer()
                    Image(systemName: choice == 1 ? "inset.filled.circle": "circle")
                        .font(.system(size: 22))
                        .foregroundStyle(Color.white)
                        .padding(.horizontal, 25)
                }
                .frame(width: 370, height: 60)
                .background(Color.gray.opacity(0.5))
                .clipShape(RoundedRectangle(cornerRadius: 100))
                .overlay {
                    RoundedRectangle(cornerRadius: 100)
                        .stroke(Color.white, lineWidth: choice == 1 ? 1: 0)
                }
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)){
                        choice = 1
                    }
                }
            }
        }
    }
}

#Preview {
    FourthPageView()
}
