//
//  SecondContentView.swift
//  SwiftUI-Weather
//
//  Created by Fuh chang Loi on 21/5/21.
//

import Foundation
import SwiftUI

struct SecondContentView: View {
    var color: Color
    var num: Int
    @StateObject private var loader = PokemonLoader()
    var body: some View {
        VStack {
            CircleNumberView(color: color, number: num).padding(.top, 20)
                .navigationTitle("Red Circle View")
            NavigationLink(
                destination: PokemonList(pokemonLoader: loader),
                label: {
                    Text("Next Screen")
                        .bold()
                        .frame(width: 280, height: 50)
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                })
            Spacer()
        }
    }
}
struct CircleNumberView: View {
    var color: Color
    var number: Int
    var body: some View {
        ZStack {
            Circle().frame(width: 200, height: 200)
                .foregroundColor(color)
            Text("\(number)")
                .foregroundColor(.white)
                .font(.system(size: 70, weight: .bold))
        }
    }
}

struct SecondContentView_Previews: PreviewProvider {
    static var previews: some View {
        SecondContentView(color: .green, num: 1)
    }
}
