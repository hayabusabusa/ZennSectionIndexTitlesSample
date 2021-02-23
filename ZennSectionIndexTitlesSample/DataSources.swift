//
//  DataSources.swift
//  ZennSectionIndexTitlesSample
//
//  Created by Shunya Yamada on 2021/02/23.
//

import Foundation

struct DataSources {
    
    static let data = [
        Section(
            title: "A",
            items: [
                Item(name: "ActionScript"),
                Item(name: "AppleScript")
            ]
        ),
        Section(
            title: "B",
            items: [
                Item(name: "Bash")
            ]
        ),
        Section(
            title: "C",
            items: [
                Item(name: "C"),
                Item(name: "C#"),
                Item(name: "C++"),
                Item(name: "COBOL"),
                Item(name: "CoffeeScript")
            ]
        ),
        Section(
            title: "D",
            items: [
                Item(name: "Dart"),
                Item(name: "Delphi")
            ]
        ),
        Section(
            title: "E",
            items: [
                Item(name: "ECMAScript"),
                Item(name: "Elixir")
            ]
        ),
        Section(
            title: "F",
            items: [
                Item(name: "FORTRAN")
            ]
        ),
        Section(
            title: "G",
            items: [
                Item(name: "Go")
            ]
        ),
        Section(
            title: "H",
            items: [
                Item(name: "Haskell")
            ]
        ),
        Section(
            title: "J",
            items: [
                Item(name: "Java"),
                Item(name: "JavaScript")
            ]
        ),
        Section(
            title: "K",
            items: [
                Item(name: "Kotlin")
            ]
        ),
        Section(
            title: "O",
            items: [
                Item(name: "Objective-C")
            ]
        ),
        Section(
            title: "P",
            items: [
                Item(name: "Perl"),
                Item(name: "PHP"),
                Item(name: "Python")
            ]
        ),
        Section(
            title: "R",
            items: [
                Item(name: "Ruby"),
                Item(name: "Rust")
            ]
        ),
        Section(
            title: "S",
            items: [
                Item(name: "Scratch"),
                Item(name: "Swift")
            ]
        ),
        Section(
            title: "T",
            items: [
                Item(name: "TypeScript")
            ]
        )
    ]
    
    struct Section {
        let title: String
        let items: [Item]
    }
    
    struct Item {
        let name: String
    }
}
