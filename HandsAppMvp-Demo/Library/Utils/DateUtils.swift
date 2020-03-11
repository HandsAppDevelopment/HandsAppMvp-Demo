import Foundation

class DateUtils {
    func dateString(fromIso8601String iso8601String: String, format: String) -> String {
        let iso8601Formatter = ISO8601DateFormatter()
        iso8601Formatter.timeZone = .current
        guard let date = iso8601Formatter.date(from: iso8601String) else {
            return String()
        }
        let formatter = DateFormatter()
        formatter.timeZone = .current
        formatter.dateFormat = format
        return formatter.string(from: date)
    }
}
