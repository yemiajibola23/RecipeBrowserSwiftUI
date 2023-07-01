//
//  InstructionsView.swift
//  RecipeBrowser-SwiftUI
//
//  Created by Yemi Ajibola on 7/1/23.
//

import SwiftUI

struct InstructionsView: View {
    @Binding var isInstructionsTapped: Bool
    var instructions: String
    
    var body: some View {
        VStack {
            HStack {
                if isInstructionsTapped {
                    Text(instructions)
                        .foregroundColor(.black)
                        .fixedSize(horizontal: false, vertical: true)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)) {
                               isInstructionsTapped.toggle()
                            }// withAnimation
                        }// onTapGesure
                } else {
                    Text(instructions)
                        .foregroundColor(.black)
                        .lineLimit(3)
                        .onTapGesture {
                            withAnimation(.easeInOut(duration: 1)) {
                                isInstructionsTapped.toggle()
                            }// withAnimation
                        } // onTapGesture
                } // if else
            } // HStack
            .overlay {
                Button {
                    withAnimation(.easeInOut(duration: 1)){
                        isInstructionsTapped.toggle()
                    } // withAnimation
                } label: {
                    Image(systemName: isInstructionsTapped ? "chevron.up.circle.fill" : "chevron.down.circle.fill")
                        .foregroundColor(.black)
                        .imageScale(.large).offset(x:10,y:36)
                } // button
                .buttonStyle(.plain)
            } // overlay
        } // vstack
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .foregroundColor(.gray.opacity(0.4))
        } // background
        .padding(.horizontal, 12)
        .padding(.top, 30)

    }
}

struct InstructionsView_Previews: PreviewProvider {
    static var previews: some View {
        InstructionsView(isInstructionsTapped: .constant(true), instructions: "Mix milk, oil and egg together. Sift flour, baking powder and salt into the mixture. Stir well until all ingredients are combined evenly.\r\n\r\nSpread some batter onto the pan. Spread a thin layer of batter to the side of the pan. Cover the pan for 30-60 seconds until small air bubbles appear.\r\n\r\nAdd butter, cream corn, crushed peanuts and sugar onto the pancake. Fold the pancake into half once the bottom surface is browned.\r\n\r\nCut into wedges and best eaten when it is warm.")
    }
}
