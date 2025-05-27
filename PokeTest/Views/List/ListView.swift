//
//  ListView.swift
//  PokeTest
//
//  Created by Tandem on 21.05.2025.
//

import SwiftUI

struct ListView: View {
    var viewModel: ListViewModel

    var body: some View {
        Text("List View")
    }
}

#Preview {
    ListView(viewModel: ListViewModel())
}
