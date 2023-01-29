//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Mohamed Melek Chtourou on 27/1/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var countries = ["Estonia","France","Germany","Ireland","Italy","Nigeria", "Poland", "Russia","Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    
    var body: some View {
        ZStack{
            RadialGradient(stops:[
                .init (color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init (color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3)
                ], center: .top, startRadius: 200, endRadius: 700)
                .ignoresSafeArea()
            VStack {
                Text("Guess The Flag")
                    .foregroundColor(.white)
                    .font(.largeTitle.weight(.bold))
                Spacer()
                VStack(spacing:30){
                    VStack{
                        Text("Tap the flag of")
                            .foregroundColor(.white)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .foregroundColor(.white)
                            .font(.largeTitle.weight(.semibold))
                    }
                    ForEach(0..<3) { number in
                        Button{
                            flagTapped(number)
                        }label: {
                            Image(countries[number])
                                .clipShape(Capsule())
                                .shadow(radius: 15)
                        }
                    }
                }
                .padding(.vertical,20)
                .frame(maxWidth: .infinity)
                .background(.thinMaterial)
                Spacer()
                Text("Score: ??")
                    .font(.title.bold())
                    .foregroundColor(.white)
                Spacer()
            }
        }
        .alert(scoreTitle, isPresented:$showingScore){
            Button("Continue",action: askQuestion)
        }
    }
    func flagTapped(_ number: Int){
        if number == correctAnswer {
            scoreTitle = "Correct"
        }else{
            scoreTitle = "Wrong"
        }
        showingScore = true
    }
    func askQuestion ( ) {
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
