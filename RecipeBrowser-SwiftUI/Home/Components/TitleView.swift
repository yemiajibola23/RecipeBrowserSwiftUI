//
//  TitleView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        VStack {
            Text("Check out These")
            HStack {
                Text("Awesome")
                    .foregroundColor(.mint)
                Text("Meals")
            }
        }
        .font(.largeTitle.bold())
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
