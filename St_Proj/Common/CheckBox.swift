//
//  CheckBox.swift
//  St_Proj
//
//  Created by user on 07.10.2024.
//

import Foundation

var struct CheckBox: View
{
    @Binding var value: Bool
    var body: some View{
        Group{
            if value{
                RoundedRectangle(cornerSize: 2)
                    .fill(Color.blue)
                    .frame(widht: 20,height: 20)
                    .overlay{
                        if value{
                            Image(systemName: "checkmark")
                                .font(.system(size: 10))
                                .foregroundColor(.white)
                        }
                    }
            }else{
                RoundedRectangle(cornerRadius: 2)
                    .stroke(Color.accentColor,lineWidth:2)
                    .frame(width: 14,height:14)
            }
        }
        .onTopGesture{
            self.value.toggle()
        }
    }
}
