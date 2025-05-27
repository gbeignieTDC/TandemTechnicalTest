//
//  DetailView.swift
//  PokeTest
//
//  Created by Tandem on 21.05.2025.
//

import SwiftUI

struct DetailView: View {
    var viewModel: ListViewModel

    var body: some View {
        Text("Detail View")
    }
}

#Preview {
    ListView(viewModel: ListViewModel())
}
