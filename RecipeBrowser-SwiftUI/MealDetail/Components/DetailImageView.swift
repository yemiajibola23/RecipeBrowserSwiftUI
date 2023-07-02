//
//  DetailImageView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import SwiftUI

struct DetailImageView: View {
    var meal: Meal
    
    var body: some View {
        AsyncImage(url: URL(string: meal.thumbnail)) { image in
            image
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .background {
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(lineWidth: 8)
                        .foregroundColor(.black)
                }
        } placeholder: {
            ProgressView()
        }
    }
}

struct DetailImageView_Previews: PreviewProvider {
    static var previews: some View {
        DetailImageView(meal: .test)
    }
}
