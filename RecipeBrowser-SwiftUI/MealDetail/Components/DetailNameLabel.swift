//
//  DetailNameLabel.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import SwiftUI

struct DetailNameLabel: View {
    var meal: Meal
    
    var body: some View {
        HStack {
            Text(meal.name)
                .foregroundColor(.black)
                .font(.title)
                .bold()
            Spacer()
        } // HStack
        .padding(.top, 16)
        .padding(.horizontal, 12)
    }
}

struct DetailNameLabel_Previews: PreviewProvider {
    static var previews: some View {
        DetailNameLabel(meal: .test)
    }
}
