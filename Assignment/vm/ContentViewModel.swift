//
//  ContentViewModel.swift
//  Assignment
//
//  Created by Kunal on 10/01/25.
//

import Foundation


class ContentViewModel: ObservableObject {
    
    private let apiService = ApiService()
    @Published var navigateDetail: DeviceData? = nil
    @Published var data: [DeviceData]? = []
    @Published var isShowingOfflineResults: Bool = false

    func fetchAPI() {
        apiService.fetchDeviceDetails(completion: { item in
            DispatchQueue.main.async {
                if item.isEmpty {
                    self.data = DeviceDataCache.shared.getData()
                    self.isShowingOfflineResults = true
                } else {
                    self.data = item
                    DeviceDataCache.shared.setData(item)
                }
            }
        })
    }
    
    func navigateToDetail(navigateDetail: DeviceData) {
        self.navigateDetail = navigateDetail
    }
}
