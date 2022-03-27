//
//  ContentView.swift
//  AlignmentGuidesAbout
//
//  Created by 亚飞 on 2022/3/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        let titile = ["姓名", "专业爱好", "最恨之人"]
        let content = ["张三", "挑战刑法", "罗老师"]
        let color = [Color.red, Color.green, Color.orange]
        
        VStack {
            
            Spacer()
            
            HStack(alignment: .bottom) {
                
                Image(systemName: "applelogo")
                    .font(.largeTitle)
                    
                Text("logo")
                    .alignmentGuide(.bottom) { context in
                        context[.bottom] + 10
                    }
                
            }
            
            Spacer()
            
            HStack(alignment: .vCustom) {
                
                VStack {
                    
                    Text("悬赏令")
                        .font(.title)
                        .alignmentGuide(.vCustom) { context in
                            context[VerticalAlignment.center]
                        }
                    Image("luffy")
                        .resizable()
                        .frame(width: 64, height: 63)
                }
                
                VStack {
                    
                    Text("蒙奇D路飞")
                    Text("live OR  die")
                        .alignmentGuide(.vCustom) { context in
                            context[VerticalAlignment.center]
                        }
                }
            }
            
            Spacer()
            
            HStack {
                
                VStack(alignment:.trailing) {
                    
                    Text("姓名")
                    Text("专业爱好")
                }
                .foregroundColor(.red)
                
                VStack {
                    
                    Text("张三")
                    Text("刑法")
                    
                }
            }
            
            Spacer()
            
            VStack(alignment: .hCustom) {
                
                ForEach(0..<titile.count) { position in
                    
                    HStack {
                        
                        Text(titile[position])
                            .alignmentGuide(.hCustom) { context in
                                context[HorizontalAlignment.trailing]
                            }
                        Text(content[position])
                    }
                    .foregroundColor(color[position])
                }
                
            }
            
            Spacer()
        }
        
        
    }
}

extension VerticalAlignment {
    
    struct VCustom: AlignmentID {
        
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            
            context[.top]
        }
    }
    
    static let vCustom = VerticalAlignment(VCustom.self)
}


extension HorizontalAlignment {
    
    struct HCustom: AlignmentID {
        
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            
            context[.top]
        }
    }
    
    static let hCustom = HorizontalAlignment(HCustom.self)
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
