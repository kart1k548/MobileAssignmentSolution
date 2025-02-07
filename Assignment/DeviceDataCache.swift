import Foundation

final class DeviceDataCache {
    static var shared = DeviceDataCache()
        
    private init() { }
    
    func setData(_ deviceData: [DeviceData]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(deviceData)
            UserDefaults.standard.set(data, forKey: "deviceData")
        } catch {
            // Fallback
        }
    }
    
    func getData() -> [DeviceData]? {
        guard let deviceData = UserDefaults.standard.data(forKey: "deviceData") else { return nil }
        do {
            let decoder = JSONDecoder()
            let data = try decoder.decode([DeviceData].self, from: deviceData)
            return data
        } catch {
            return nil
        }
    }
}
