//
//  AIModeView.swift
//  IHaveNever
//
//  Created by PEPPA CHAN on 28.11.2024.
//

import SwiftUI

struct AIModeView: View {
    @State private var modeName: String = ""
    @State private var selectedMode = ""
    @StateObject private var mode = APIService.shared
    @State private var isSelection: Bool = false
    @State private var numberOfCards: String = ""
    @State private var tags: String = "Brief tags for the gist"
    
    var body: some View {
        Group {
            VStack{
                Text("AI Mode")
                    .foregroundStyle(
                        LinearGradient(colors: [
                            Color.init(red: 42/255, green: 15/255, blue: 118/255),
                            Color.init(red: 78/255, green: 28/255, blue: 220/255)
                        ], startPoint: .top, endPoint: .bottom)
                    )
                    .font(.system(size: 18.43, weight: .heavy))
                    .padding()
                
                TextField("Mode name", text: $modeName)
                    .padding()
                    .foregroundStyle(.black.opacity(0.3))
                    .background(Color.init(.tertiarySystemFill))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                
                Button(action:{
                    
                }){
                    HStack{
                        Text(selectedMode != "" ? selectedMode: mode.modes.first ?? "nil")
                        Spacer()
                        Image(systemName: isSelection ? "chevron.down": "chevron.right")
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.init(.tertiarySystemFill))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                }
                
                TextField("Number of cards", text: $numberOfCards)
                    .keyboardType(.numberPad)
                    .foregroundStyle(.black.opacity(0.3))
                    .padding()
                    .background(Color.init(.tertiarySystemFill))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                
                TextEditor(text: $tags)
                    .scrollContentBackground(.hidden)
                    .foregroundStyle(.black.opacity(0.3))
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.init(.tertiarySystemFill))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .padding(.horizontal)
                
                Button(action:{
                    
                }){
                    Text("Generate")
                        .foregroundStyle(.white)
                        .font(.system(size: 16.33, weight: .bold))
                        .frame(maxWidth: .infinity, maxHeight: 65.13)
                        .background(Color.init(red: 56/255, green: 25/255, blue: 145/255))
                        .clipShape(RoundedRectangle(cornerRadius: 23))
                        .padding()
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
    }
}

#Preview {
    MainPageView()
}
