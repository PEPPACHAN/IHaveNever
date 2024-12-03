//
//  BurgerView.swift
//  IHaveNever
//
//  Created by PEPPA CHAN on 27.11.2024.
//

import SwiftUI

struct BurgerView: View {
    private let languagesArray = ["English", "German", "Russian"]
    
    @State private var retryTimer: Timer? = nil
    
    @AppStorage("language") private var language: String = ""
    @State private var isActive: Bool = false
    @Binding var burgerShowing: Bool
    
    var body: some View {
        VStack(alignment: .leading, spacing: 39){
            Image(systemName: "xmark")
                .foregroundStyle(Color.init(red: 222/255, green: 222/255, blue: 222/255))
                .font(.title)
                .bold()
                .aspectRatio(contentMode: .fill)
                .frame(maxWidth: .infinity, alignment: .trailing)
                .onTapGesture {
                    withAnimation(.easeInOut(duration: 0.2)) {
                        burgerShowing.toggle()
                    }
                }
            
            Text("restorePurchases".changeLocale(lang: language))
            Text("privacyPolicy".changeLocale(lang: language))
            Text("contactUs".changeLocale(lang: language))
            HStack{
                Text("language".changeLocale(lang: language))
                    .overlay(alignment: .topTrailing) {
                        Text(
                            language == "German" || language == "de" ? "GE" :
                            language == "English" || language == "en" ? "ENG" :
                            language == "Russian" || language == "ru" ? "RU": "ENG"
                        )
                            .offset(x: 35, y: -5)
                            .font(.system(size: 12.96, weight: .medium))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    Color.init(red: 42/255, green: 15/255, blue: 118/255),
                                    Color.init(red: 78/255, green: 28/255, blue: 220/255)
                                ], startPoint: .top, endPoint: .bottom)
                            )
                    }
                
                Spacer()
                
                Image(systemName: "chevron.down")
                    .foregroundStyle(Color.init(red: 197/255, green: 197/255, blue: 197/255))
                    .rotationEffect(.degrees(isActive ? -180: 0))
            }
            .background(Color.white)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 0.2)) {
                    self.isActive.toggle()
                }
            }
            
            if isActive {
                moreLanguages()
            }
            
            Spacer()
            
            HStack {
                Image("crown")
                Text("premiumActivated".changeLocale(lang: language))
                    .foregroundStyle(
                        LinearGradient(colors: [
                            Color.init(red: 42/255, green: 15/255, blue: 118/255),
                            Color.init(red: 78/255, green: 28/255, blue: 220/255)
                        ], startPoint: .top, endPoint: .bottom)
                    )
                    .font(.system(size: 18.45, weight: .medium))
            }
        }
        .font(.system(size: 21.36, weight: .bold))
        .foregroundStyle(Color.black)
        .padding([.top, .horizontal], 36)
    }
}

extension BurgerView {
    func moreLanguages() -> some View {
        VStack(spacing: 27){
            ForEach(languagesArray, id: \.self) { item in
                Text(item)
                    .font(.system(size: 17.7))
                    .foregroundStyle(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(Color.white)
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 0.2)){
                            var lang = ""
                            switch item {
                            case "English":
                                lang = "en"
                            case "German":
                                lang = "de"
                            case "Russian":
                                lang = "ru"
                            default:
                                lang = "en"
                            }
                            language = lang
                            self.isActive.toggle()
                            loadDataWithRetry(lang: language)
                            GameInfo.shared.categoryName.removeAll()
                            GameInfo.shared.categoryNameEn.removeAll()
                            GameInfo.shared.gameData.removeAll()
                            GameInfo.shared.selectedIndex.removeAll()
                            
                        }
                    }
            }
        }
    }
}

extension BurgerView {
    private func loadDataWithRetry(lang: String) {
        APIService.shared.fetchData = nil
        APIService.shared.modes.removeAll()
        if APIService.shared.modes.isEmpty {
            APIService.shared.fecthAll(lang: lang)
            retryTimer = Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { _ in
                if APIService.shared.modes.isEmpty {
                    APIService.shared.fecthAll(lang: lang)
                } else {
                    retryTimer?.invalidate()
                }
            }
        }
    }
}

#Preview {
    MainPageView()
}
