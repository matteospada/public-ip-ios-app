//
//  ContentView.swift
//  public-ip
//
//  Created by Matteo Spada on 17/07/2020.
//  Copyright © 2020 Matteo Spada. All rights reserved.
//

import SwiftUI
import SwiftPublicIP

struct ContentView: View {
      
    @State var pubblicIP = "LOADING"
    
    var body: some View {
        ZStack
            {
                Color(red: 0.22, green: 0.24, blue: 0.27, opacity: 1.00)
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                VStack {
                    Text("YOUR PUBBLIC IP IS:").foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00)).font(.title).padding(10)
                    
                     Text(pubblicIP).foregroundColor(Color(red: 1.00, green: 1.00, blue: 1.00, opacity: 1.00)).font(.title).padding(10)
                    
                    Text("TAP TO COPY TO CLIPBOARD").foregroundColor(Color(red: 0.77, green: 0.98, blue: 0.43, opacity: 1.00)).font(.footnote).padding(10)
                    
                    
                }
                // Your other content here
                // Other layers will respect the safe area edges
        }.onAppear{
            SwiftPublicIP.getPublicIP(url: PublicIPAPIURLs.ipv4.icanhazip.rawValue) { (string, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let string = string {
                    self.pubblicIP = string
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewDevice(PreviewDevice(rawValue: "iPhone XS"))
    }
}
