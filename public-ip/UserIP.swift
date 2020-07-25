//
//  UserIP.swift
//  public-ip
//
//  Created by Matteo Spada on 25/07/2020.
//  Copyright © 2020 Matteo Spada. All rights reserved.
//

import Foundation
import SwiftPublicIP

class UserIP: ObservableObject {
    
    @Published var pubblicIP = "LOADING"
    @Published var clipboardState = "TAP TO COPY TO CLIPBOARD"
    
    
    
    func setIP() {
        print("SET IP")

            SwiftPublicIP.getPublicIP(url: PublicIPAPIURLs.ipv4.icanhazip.rawValue) { (string, error) in
                if let error = error {
                    DispatchQueue.main.async {
                        self.pubblicIP = "OFFLINE"
                        print(error)
                    }
                } else if let string = string {
                   DispatchQueue.main.async {
                       self.pubblicIP = string
                   }
                }
            }
        
        
    }
    
    
    
    func changeClipboardText () {
        
        self.clipboardState == "TAP TO COPY TO CLIPBOARD" ? self.clipboardState = "COPIED!" : nil
    }
    
}
