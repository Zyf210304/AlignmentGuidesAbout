//
//  ContentView.swift
//  AlignmentGuidesAbout
//
//  Created by 亚飞 on 2022/3/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        
        VStack {
            
            Spacer()
            
            HStack {
                VStack {
                    
                    HStack(alignment: .bottom) {
                      Image(systemName: "applelogo")
                        .font(.largeTitle)
                        .alignmentGuide(.bottom, computeValue: { d in d[.bottom] - 10})
                      Text("Apple")
                    }
                }
            }
            
            Spacer()
            
            HStack(alignment: .midAccountAndName) {
                
                VStack {
                    
                    
                    Text("悬赏令")
                        .alignmentGuide(.midAccountAndName){ d in
                            d[VerticalAlignment.bottom]
                        }
                    Image("luffy")
                        .resizable()
                        .frame(width: 64, height: 64)
                }
                
                VStack {
                    
                    Text("Live or Die")
                    Text("蒙奇D路飞")
                        .alignmentGuide(.midAccountAndName){ d in
                            d[VerticalAlignment.bottom]
                        }
                        .font(.largeTitle)
                        
                }
            }
            
            Spacer()

            HStack {
                
                VStack(alignment: .trailing) {
                    Text("phone")
                    Text("email")
                }
                
                VStack(alignment: .leading) {
                    
                    Text("1111111000")
                    Text("xxx@yyy.com77777")
                }
            }
           
            Spacer()
            
            HStack {
                
                HStack{
                    VStack(alignment: .custom, spacing: 10) {
                        
                        HStack {
                            
                            Text("手机")
                                .alignmentGuide(.custom) { d in
                                    d[HorizontalAlignment.trailing]
                                }
                            Text("110110119")
                        }
                        HStack {
                            
                            Text("电子邮件")
                                .alignmentGuide(.custom) { d in
                                    d[HorizontalAlignment.trailing]
                                }
                            Text("xxxxxx@yy.com")
                        }
                        .font(.title2)
                    }
                }
                .padding(.leading, 16)
                
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            .background(Rectangle()
                .fill(Color.black)
                .cornerRadius(8))
            .padding(.horizontal)
            
            Spacer(minLength: 100)
        }
    }
    

}


extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in d: ViewDimensions) -> CGFloat {
            d[.bottom]
        }
    }

    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

extension HorizontalAlignment {
    
    enum CustomAlignment: AlignmentID {
        
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.leading]
        }
    }
    
    static let custom = HorizontalAlignment(CustomAlignment.self)
}

//extension VerticalAlignment {
//
//    enum MidAccountAndName: AlignmentID {
//
//        static func defaultValue(in context: ViewDimensions) -> CGFloat {
//
//            context[.top]
//        }
//    }
//
//    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
//}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
