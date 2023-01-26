//
//  ImageView.swift
//  swiftUI First Project
//
//  Created by Mohamed Melek Chtourou on 21/1/2023.
//

import SwiftUI

struct ImageView: View {
    var image : Image
    var body: some View {
        image
            .resizable()
            .frame(width: 200, height: 200)
            .clipShape(Circle())
            .overlay{
                Circle().stroke(.gray,lineWidth: 5)
            }
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(image: Image("turtlerock"))
    }
}
