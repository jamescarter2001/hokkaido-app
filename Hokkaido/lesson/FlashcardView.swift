//
//  FlashcardView.swift
//  Hokkaido
//
//  Created by James on 23/02/2022.
//

import SwiftUI

struct FlashcardView: View {
    let kanji : [Kanji]
    let closeCallback : (() -> Void)
    
    @State var showKanji = false
    @State var index : Int = 0
    @State var lines : [Line] = []
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    closeCallback()
                } label: {
                    Image(systemName: "xmark")
                }.font(.system(size: 20)).padding(30)
            }
            Text(String(format: "%d / %d", index+1, kanji.count)).foregroundColor(.gray)
            Text(showKanji ? kanji[index].symbol : kanji[index].name).font(.system(size: showKanji ? 150 : 50)).frame(height: 150)
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
                    Text("Previous")                            .frame(maxWidth: 130, maxHeight: 40, alignment: .leading).padding(.leading, 30)
                }.disabled(index == 0)
                Spacer()
                /*Button("Flip") {
                 showKanji.toggle()
                 }.padding(40).frame(width: 130, height: 40)*/
                Button(action: {
                    self.showKanji.toggle()}) {
                        Text("Flip")
                            .frame(maxWidth: 130, maxHeight: 40)
                    }
                Spacer()
                Button(action: {
                    self.index+=1
                    self.resetCard()
                }) {
                    Text("Next").frame(maxWidth: 130, maxHeight: 40, alignment: .trailing).padding(.trailing, 30)
                }.disabled((index == kanji.count-1)).frame(width: 130, height: 40)
            }.frame(height: 90)
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
        FlashcardView(kanji: [HkDebug.DummyKanji1()], closeCallback: {
            print("Closed")
        })
    }
}
