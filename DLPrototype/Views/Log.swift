//
//  Log.swift
//  DLPrototype
//
//  Created by Ryan Priebe on 2020-07-10.
//  Copyright © 2020 YegCollective. All rights reserved.
//

import SwiftUI

struct Log: View {
    var category: Category
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(category.title).log")
                .font(.title)
            
            Spacer()
            
            ScrollView {
                Text(readFile())
            }
            
            Spacer()
        }
        .frame(width: 700, height: 700)
        .padding()
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .desktopDirectory, in: .userDomainMask)
        
        return paths[0]
    }
    
    func readFile() -> String {
        var lines: String = "nothing to see here"

        let log = getDocumentsDirectory().appendingPathComponent("\(category.title).log")
            
        if let logLines = try? String(contentsOf: log) {
            if !logLines.isEmpty {
                lines = logLines
            }
        }
        
        return lines
    }
}