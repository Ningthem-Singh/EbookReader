//
//  ContentView.swift
//  EbookReader
//
//  Created by Ning on 05/04/26.
//

import SwiftUI
internal import UniformTypeIdentifiers

struct ContentView: View {
    @State private var pdfURL: URL?

    var body: some View {
        VStack {
            if let url = pdfURL {
                PDFViewer(url: url)
            } else {
                Text("Open a PDF file")
                    .foregroundColor(.gray)
            }

            Button("Open PDF") {
                openPDF()
            }
            .padding() 
        }
        .frame(minWidth: 800, minHeight: 600)
    }

    func openPDF() {
        let panel = NSOpenPanel()
        panel.allowedContentTypes = [.pdf]
        panel.allowsMultipleSelection = false

        if panel.runModal() == .OK {
            pdfURL = panel.url
        }
    }
}
