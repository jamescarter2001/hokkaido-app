//
//  FlashcardView.swift
//  Hokkaido
//
//  Created by James on 23/02/2022.
//

import SwiftUI

struct FlashcardView: View {
    @State var kanji : [Kanji]
    @State var shuffled: Bool
    let closeCallback : (() -> Void)
    
    @State var showKanji: Bool = false
    @State var index : Int = 0
    @State var lines : [Line] = []
    
    init(kanji: [Kanji], shuffled: Bool, closeCallback: @escaping () -> Void) {
        self.kanji = kanji
        self.shuffled = shuffled
        self.closeCallback = closeCallback
    }
    var body: some View {
        VStack(spacing: 5) {
            Text(String(format: "%d / %d", index+1, kanji.count)).foregroundColor(.gray).padding()
            Text(showKanji ? kanji[index].symbol : kanji[index].name).font(.system(size: showKanji ? 120 : 40)).frame(height: 110)
            Spacer()
            HStack {
                Button("Clear") {
                    self.clearArea()
                }
                Spacer()
                Button("Undo") {
                    self.undoLine()
                }.disabled(lines.count == 0)
            }.padding(30)
            DrawView(lines: lines).clipShape(RoundedRectangle(cornerRadius: 15)).overlay(RoundedRectangle(cornerRadius: 15).strokeBorder(Color.gray)).gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local).onChanged({ value in
                let newPoint = value.location
                
                if (value.translation.width + value.translation.height == 0) {
                    lines.append(Line(points: [newPoint], color: .black, lineWidth: 8))
                } else {
                    let index = lines.count-1
                    lines[index].points.append(newPoint)
                }
            }))
            HStack {
                Button(action: {
                    self.index-=1
                    self.resetCard()
                }) {
                    Text("Previous").padding()
                    Spacer()
                }.disabled(index == 0).frame(width: 110)
                Spacer()
                Button(action: {
                    self.showKanji.toggle()}) {
                        Text("Flip")
                    }.padding().frame(width: 110)
                Spacer()
                Button(action: {
                    self.index+=1
                    self.resetCard()
                }) {
                    Spacer()
                    Text("Next").padding()
                }.disabled((index == kanji.count-1)).frame(width: 110)
            }.frame(height: 90)
        }.onAppear {
            if (shuffled) {
                kanji = kanji.shuffled()
            }
        }
    }
    private func clearArea() {
        lines = []
    }
    private func undoLine() {
        lines.removeLast()
    }
    
    private func resetCard() {
        self.showKanji = false
        self.clearArea()
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(kanji: [HkDebug.DummyKanji1()], shuffled: false, closeCallback: {
            print("Closed")
        })
    }
}
