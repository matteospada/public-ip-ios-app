//
//  ContentView.swift
//  public-ip
//
//  Created by Matteo Spada on 17/07/2020.
//  Copyright © 2020 Matteo Spada. All rights reserved.
//

import SwiftUI


struct ContentView: View {
    
    @ObservedObject var settings = UserIP()
    

    
    
    var body: some View {
        ZStack
            {
                Color(red: 0.22, green: 0.24, blue: 0.27, opacity: 1.00)
                    .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                if(settings.pubblicIP == "OFFLINE"){
                    VStack{
                    Text("YOU ARE OFFLINE").foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00)).font(.title).padding(10)
                    Text("CHECK YOUR NETWORK CONNECTIVITY").foregroundColor(Color(red: 0.77, green: 0.98, blue: 0.43, opacity: 1.00)).font(.footnote).padding(10)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    }
                } else {
                VStack {
                    
                    Text("YOUR PUBLIC IP IS:").foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00)).font(.title).padding(10)
                    
                    Button(action: {
                        
                        let pasteboard = UIPasteboard.general
                        pasteboard.strings = [self.settings.pubblicIP]
                        self.settings.changeClipboardText()
                        
                        
                    }) {
                        VStack {
                            Text(settings.pubblicIP).foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00)).font(.title).padding(10)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                            
                            Text(settings.clipboardState).foregroundColor(Color(red: 0.77, green: 0.98, blue: 0.43, opacity: 1.00)).font(.footnote).padding(10)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                        }
                        
                        
                    }.buttonStyle(PlainButtonStyle())
                    
                }
                }
        }.onAppear(perform: {
            self.settings.setIP()
            }
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone XS"))
    }
}

