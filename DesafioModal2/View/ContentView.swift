//
//  ContentView.swift
//  DesafioModal2
//
//  Created by RICARDO AGNELO DE OLIVEIRA on 15/12/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct ContentView: View {
    @StateObject var repos = RepositoriesFeed()
    var body: some View {
        NavigationView {
            List(repos.items) { item in
                NavigationLink(
                    destination: PullView(repoName: item.fullName),
                    label: {
                        Cell(name: item.name, url: item.owner.avatarUrl,
                             fullName: item.owner.login, watchers: item.watchersCount,
                             forks: item.forksCount,
                             description: item.description ?? "No content").onAppear {
                                repos.loadMoreContentIfNeeded(currentItem: item)
                             }
                    })
                    .navigationTitle("Repositórios de Swift")
            }
        }
    }

    struct  Cell: View {
        var name: String
        var url: String
        var fullName: String
        var watchers: Int
        var forks: Int
        var description: String
        var body: some View {
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
                                Text("  Repositorio :")
                                    .fontWeight(.bold)
                                Text(name)
                                    .lineLimit(2)
                                    .minimumScaleFactor(0.8)
                            }
                            HStack {
                                Text("  Autor :")
                                    .fontWeight(.semibold)
                                Text(fullName)
                            }
                            HStack(alignment: .center, spacing: 20
                            ) {
                            }
                        }
                    }
                }
                VStack(alignment: .leading, spacing: 10) {
                    HStack {
                        HStack {
                            Text(Image(systemName: "star")) + Text(" Stars:").fontWeight(.semibold)
                            Text("\(watchers)")
                        }
                        HStack {
                            Text(Image(systemName: "tuningfork")) + Text(" Forks:").fontWeight(.semibold)
                            Text("\(forks)")
                        }

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
