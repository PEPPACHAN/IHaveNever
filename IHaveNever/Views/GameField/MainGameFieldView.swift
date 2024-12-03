//
//  MainGameFieldView.swift
//  IHaveNever
//
//  Created by PEPPA CHAN on 02.12.2024.
//

import SwiftUI

struct MainGameFieldView: View {
    @State private var currentPage: Int = 0
    @State private var currentPage2: Int = 0
    @State private var currentOffsetX: CGFloat = 0
    @StateObject private var gameInfo = GameInfo.shared
    @StateObject private var apiService = APIService.shared
    @State private var titleOffsetY: CGFloat = 0
    @State private var isExitButtonPressed: Bool = false
    @State private var isDone: Bool = false
    @AppStorage("language") private var language = ""
    
    var body: some View {
        ZStack{
            VStack(spacing: 10) {
                VStack{
                    HStack{
                        Image(systemName: "chevron.left")
                            .font(.system(size: 27))
                            .foregroundStyle(Color.white)
                            .offset(y: isDone ? -235: 0)
                            .onTapGesture {
                                isExitButtonPressed.toggle()
                            }
                        
                        Spacer()
                        
                        VStack{
                            if isDone {
                                Image(systemName: "checkmark.circle.fill")
                                    .font(.system(size: 92.97))
                                    .foregroundStyle(
                                        LinearGradient(colors: [
                                            Color.init(red: 42/255, green: 15/255, blue: 118/255),
                                            Color.init(red: 78/255, green: 28/255, blue: 220/255)
                                        ], startPoint: .top, endPoint: .bottom),
                                        Color.white
                                    )
                                    .padding(.bottom, 12.52)
                            }
                            Text(gameInfo.categoryName[currentPage])
                                .font(.system(size: 24.74, weight: .heavy))
                                .foregroundStyle(Color.white)
                            Text(String(describing: gameInfo.gameData.count) + "cards".localizedPlural(gameInfo.gameData.count, lang: language))
                                .font(.system(size: 15.53))
                                .foregroundStyle(Color.white.opacity(0.37))
                        }
                        .offset(x: -13.5, y: titleOffsetY)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(27.79)
                    
                    HStack{
                        Text("IHN".changeLocale(lang: language))
                            .font(.system(size: 34.46, weight: .heavy))
                            .foregroundStyle(Color.white)
                        
                        Spacer()
                        
                        Text(String(describing: currentPage2 + 1) + "/" + String(describing: gameInfo.gameData.count))
                            .font(.system(size: 18.33, weight: .bold))
                            .padding(.vertical, 9.24)
                            .padding(.horizontal, 20.05)
                            .background(Color.white.opacity(0.13))
                            .clipShape(RoundedRectangle(cornerRadius: 21.54))
                    }
                    .padding(.top)
                    .padding(.bottom, 34.06)
                    .padding(.horizontal, 28)
                    .foregroundStyle(Color.green)
                    .offset(y: isDone ? -297: 0)
                }
                .frame(maxHeight: .infinity)
                .padding(.top, 48.68)
                
                if !isDone {
                    ZStack {
                        ForEach((currentPage..<min(currentPage + 3, gameInfo.gameData.count)).reversed(), id: \.self) { index in
                            RoundedRectangle(cornerRadius: 18)
                                .fill(index == currentPage
                                      ? Color.white // Верхняя карта
                                      : index == currentPage + 1
                                      ? Color(red: 243/255, green: 241/255, blue: 248/255, opacity: 1) // Вторая карта
                                      : Color(red: 238/255, green: 237/255, blue: 238/255, opacity: 0.75)) // Третья карта
                                .offset(x: index==currentPage ? currentOffsetX: CGFloat(index - currentPage), y: CGFloat(index - currentPage) * -20)
                                .scaleEffect(1 - CGFloat(index - currentPage) * 0.05)
                                .animation(.easeInOut, value: currentPage)
                                .frame(width: 337, height: 447)
                                .overlay {
                                    VStack(spacing: 71.21) {
                                        Text(gameInfo.gameData[index].appCardTextValue)
                                            .padding(.horizontal)
                                            .offset(x: index==currentPage ? currentOffsetX: CGFloat(index - currentPage), y: CGFloat(index - currentPage) * -20)
                                            .scaleEffect(1 - CGFloat(index - currentPage) * 0.05)
                                            .animation(.easeInOut, value: currentPage)
                                        Image("handKeeperRed")
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 157.88, height: 186.73)
                                            .offset(x: index==currentPage ? currentOffsetX: CGFloat(index - currentPage), y: CGFloat(index - currentPage) * -20)
                                            .scaleEffect(1 - CGFloat(index - currentPage) * 0.05)
                                            .animation(.easeInOut, value: currentPage)
                                    }
                                }
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack(spacing: 58) {
                        Button(action: {
                            if currentPage > 0 {
                                currentPage2 -= 1
                                currentPage -= 1
                                withAnimation(.easeInOut(duration: 0.3)){
                                    currentOffsetX = UIScreen.main.bounds.width
                                }
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                    withAnimation(.easeInOut(duration: 0.5)){
                                        currentOffsetX = 0
                                    }
                                }
                            }
                        }) {
                            Image(systemName: "chevron.left")
                                .font(.system(size: 55.38))
                                .padding(12.72)
                        }
                        .padding(10)
                        .foregroundStyle(currentPage != 0 ? Color.white : Color.clear)
                        .background(currentPage != 0 ? Color.gray.opacity(0.5) : Color.clear)
                        .clipShape(Circle())
                        .disabled(currentPage == 0)
                        
                        Image(systemName: (currentPage2+1) == gameInfo.gameData.count ? "checkmark" :"chevron.right")
                            .font(.system(size: (currentPage+1) == gameInfo.gameData.count ? 40 : 55.38))
                            .padding(12.72)
                            .padding(10)
                            .foregroundStyle(Color.white)
                            .background(Color.gray.opacity(0.5))
                            .clipShape(Circle())
                            .onTapGesture {
                                onTap()
                            }
                    }
                    .padding(.bottom, 50)
                }else{
                    VStack(spacing: 25){
                        Button(action: {
                            exit()
                        }) {
                            Text("exitToMenu".changeLocale(lang: language))
                                .font(.system(size: 16, weight: .heavy))
                                .padding(12.72)
                        }
                        
                        Button(action: {
                            withAnimation(.easeInOut(duration: 0.2)) {
                                currentPage = 0
                                currentPage2 = 0
                                isDone.toggle()
                            }
                        }) {
                            Text("repeat".changeLocale(lang: language))
                                .font(.system(size: 16, weight: .heavy))
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 25)
                                .background(Color.init(red: 56/255, green: 25/255, blue: 145/255))
                                .clipShape(RoundedRectangle(cornerRadius: 100))
                                .padding(.horizontal, 29)
                        }
                    }
                    .foregroundStyle(.white)
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            LinearGradient(colors: [
                Color.init(red: 42/255, green: 15/255, blue: 118/255),
                Color.init(red: 78/255, green: 28/255, blue: 220/255)
            ], startPoint: .top, endPoint: .bottom))
        .tabViewStyle(.page(indexDisplayMode: .never))
        
        if isExitButtonPressed {
            Rectangle()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .foregroundStyle(Color.black.opacity(0.4))
                .ignoresSafeArea(.all)
                .onTapGesture {
                    isExitButtonPressed.toggle()
                }
            askView()
                .frame(width: 300)
                .padding(.horizontal, 22)
                .background(Color.white)
                .clipShape(RoundedRectangle(cornerRadius: 27))
        }
    }
}

extension MainGameFieldView {
    func onTap() {
        if currentPage2 == gameInfo.gameData.count-1 {
            withAnimation(.easeInOut(duration: 0.2)){
                isDone.toggle()
                titleOffsetY = 100
            }
        }
        if currentPage2 != gameInfo.gameData.count - 1 {
            if currentPage < gameInfo.gameData.count - 1 {
                currentPage2 += 1
                withAnimation(.easeInOut(duration: 0.3)){
                    currentOffsetX = UIScreen.main.bounds.width
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                    currentPage += 1
                    currentOffsetX = 0
                }
            }
        }
    }
    
    func exit() {
        gameInfo.isGameStarted.toggle()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
            gameInfo.selectedIndex.removeAll()
            gameInfo.categoryName.removeAll()
            gameInfo.categoryNameEn.removeAll()
            gameInfo.gameData.removeAll()
        }
    }
    
    func askView() -> some View {
        Group{
            RoundedRectangle(cornerRadius: 23)
                .foregroundStyle(Color.white)
                .padding(.horizontal, 35)
                .frame(height: 198)
            VStack{
                Text("exit".changeLocale(lang: language))
                    .font(.system(size: 20, weight: .bold))
                    .foregroundStyle(Color.black)
                    .multilineTextAlignment(.center)
                HStack{
                    Image(systemName: "xmark")
                        .font(.system(size: 25))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .foregroundColor(Color.white)
                        .background(Color.init(red: 56/255, green: 25/255, blue: 145/255))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            isExitButtonPressed.toggle()
                        }
                    Spacer()
                    Image(systemName: "checkmark")
                        .font(.system(size: 25))
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .foregroundColor(Color.init(red: 209/255, green: 209/255, blue: 209/255))
                        .background(Color.init(red: 241/255, green: 241/255, blue: 241/255))
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                        .onTapGesture {
                            isExitButtonPressed.toggle()
                            exit()
                        }
                }
                .padding(5)
            }
        }
    }
}

#Preview {
    MainPageView()
}