//
//  ContentView.swift
//  counter
//
//  Created by 木村朋広 on 2024/02/19.
//

import SwiftUI

struct ContentView: View {
    @State var count = 0
    @State var isShowAlert = false
    var body: some View {
        ZStack{
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                Text("\(count)")
                    .foregroundColor(count < 0 ? .red : .black)
                    .font(.system(size: 130, weight: .bold, design: .default))

            HStack{
                Button {
                    count -= 1
                }label: {
                    Text("-")
                        .frame(height: UIScreen.main.bounds.height/2.5)
                        .frame(maxWidth: .infinity)
                        .background(Color("MinusButtonColor"))
                        .foregroundColor(.white)
                        .font(.system(size: 130, weight: .bold, design: .default))
                        .cornerRadius(10)
                } // Button ここまで

                Button{
                    count += 1
                }label: {
                    Text("+")
                        .frame(height: UIScreen.main.bounds.height/2.5)
                        .frame(maxWidth: .infinity)
                        .background(Color("PlusButtonColor"))
                        .foregroundColor(.white)
                        .font(.system(size: 130, weight: .bold, design: .default))
                        .cornerRadius(10)
                } // Button ここまで
            } // HStack ここまで
            Spacer()
            Button {
                isShowAlert = true
            }label: {
                Text("リセットする")
                    .bold()
                    .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                    .frame(height: 50)
                    .background(.white)
                    .foregroundColor(.red)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(.red, lineWidth: 1))
            }
            .alert("注意", isPresented: $isShowAlert) {
                Button ("リセットする", role: .destructive) {
                    count = 0
                }
                Button ("キャンセル", role: .cancel) {}
            } message: {
                Text("現在のカウントをリセットしますが、本当によろしいでしょうか？")
            }
        } // VStack ここまで
        .padding()
    } //ZStackここまで
} //body ここまで
} // ContentView ここまで

#Preview {
    ContentView()
}
