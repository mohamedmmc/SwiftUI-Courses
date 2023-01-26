//
//  Start.swift
//  swiftUI First Project
//
//  Created by Mohamed Melek Chtourou on 21/1/2023.
//

import SwiftUI

struct Start: View {
    //@State var isOn: Bool = true

    var body: some View {
        LandmarkList()
    }
}

struct Start_Previews: PreviewProvider {
    static var previews: some View {
        Start()
            .environmentObject(ModelData())
    }
}
