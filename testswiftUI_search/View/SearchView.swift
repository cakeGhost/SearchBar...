//
//  SearchView.swift
//  testswiftUI_search
//
//  Created by betty on 2022/08/19.
//

import SwiftUI

struct SearchView: View {
    @StateObject var locationManager: LocationManager = .init()
    
    var body: some View {
        VStack {
            
            ZStack {
                HStack {
                    Button {
                        
                    } label: {
                        Image(systemName: "chevron.left")
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                    .padding(.leading, 10)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Text("위치 검색")
                        .font(.title3)
                        .fontWeight(.semibold)
                    Spacer()
                }
                .frame(maxWidth: .infinity,
                       alignment: .center)
            }
           
            
            
            HStack(spacing: 10) {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("지역/장소 검색하기",
                          text: $locationManager.searchText)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background {
                RoundedRectangle(cornerRadius: 10,
                                 style: .continuous)
                    .strokeBorder(.gray)
            }
            .padding(.vertical, 10)
            
            // MARK: Live Location Button
            Button {
                
            } label: {
                Label {
                    Text("Use Current Location")
                        .font(.callout)
                } icon: {
                    Image(systemName: "location.north.circle.fill")
                    
                }
                .foregroundColor(.green)
            }
            .padding()
            .frame(maxHeight: .infinity,
                   alignment: .top)
        }
        .padding()
        .frame(maxHeight: .infinity,
               alignment: .top)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
