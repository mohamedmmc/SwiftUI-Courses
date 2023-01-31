//
//  ContentView.swift
//  Bucket List
//
//  Created by Mohamed Melek Chtourou on 29/1/2023.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @StateObject private var viewModel = ViewModel()
    var body: some View {
        ZStack{
            Map(coordinateRegion: $viewModel.mapRegion, annotationItems: viewModel.locations) { location in
                MapAnnotation(coordinate: location.coordinate){
                    VStack{
                        Image(systemName: "star.circle")
                            .resizable()
                            .foregroundColor(.red)
                            .frame(width: 20,height: 20)
                            .background(.white)
                            .clipShape(Circle())
                        Text(location.name)
                    }
                    .onTapGesture {
                        viewModel.seletecPlace = location
                    }
                }
            }
                .ignoresSafeArea()
            Circle()
                .fill(.blue)
                .opacity(0.3)
                .frame(width: 32,height: 32)
            VStack{
                Spacer()
                HStack{
                    Spacer()
                    Button{
                        viewModel.addLocation()
                    }label: {
                        Image(systemName: "plus")
                    }
                    .padding()
                    .background(.black.opacity(0.75))
                    .foregroundColor(.white)
                    .font(.title)
                    .clipShape(Circle())
                    .padding(.trailing)
                }
            }
        }.sheet(item: $viewModel.seletecPlace) { place in
            EditView(location: place) { newLocation in
                viewModel.update(location: newLocation)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
