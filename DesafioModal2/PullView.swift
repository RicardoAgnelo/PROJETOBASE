//
//  PullView.swift
//  DesafioModal2
//
//  Created by RICARDO AGNELO DE OLIVEIRA on 17/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct PullView: View {
    var repoName: String
    @ObservedObject var pulls: PullFeed
    init(repoName: String) {
        self.repoName = repoName
        pulls = PullFeed(repoName: repoName)
    }
    var body: some View {
        List(pulls.pulls) { item in
            Cell(titulo: item.title, url: item.user.avatarUrl,
                 name: item.user.login, date: item.createdAt,
                 description: item.body, urlRepo: item.htmlUrl ).onAppear {
                    pulls.loadMoreContentIfNeeded(currentItem: item)
                 }
                .navigationTitle(repoName)
        }.onAppear(perform: {
            pulls.scorroParte2()
        })
    }
}

struct  Cell: View {
    var titulo: String
    var url: String
    var name: String
    var date: String
    var description: String
    var urlRepo: URL
    var body: some View {
        Link(destination: urlRepo) {
        VStack(alignment: .leading) {
            HStack {
                AnimatedImage(url: URL(string: url)!)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .cornerRadius(35)
                VStack(alignment: .leading, spacing: 10) {
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Text("  Titulo :")
                                .fontWeight(.bold)
                            Text(titulo)
                                .lineLimit(2)
                                .minimumScaleFactor(0.8)
                        }
                        HStack {
                            Text("  Autor :")
                                .fontWeight(.semibold)
                            Text(name)
                        }
                        HStack(alignment: .center, spacing: 20
                        ) {
                        }
                    }
                }
            }
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Date :")
                        .fontWeight(.semibold)
                    Text(date)
                }
                Text("Descricao")
                    .fontWeight(.semibold)
                Text(description)
                    .lineLimit(2)
                    .minimumScaleFactor(0.9)
            }
        }
        }
    }
}
