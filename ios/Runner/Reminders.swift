import EventKit

class AppleReminders {
    let eventStore: EKEventStore = EKEventStore()
    let defaultList: EKCalendar?
    var hasAccess: Bool = false

    init() {
        defaultList = eventStore.defaultCalendarForNewReminders()
        eventStore.requestAccess(to: EKEntityType.reminder, completion: {(granted, error) in
            self.hasAccess = granted ? true : false
        })
    }

    private static func dateToString(_ rawDate: DateComponents?) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyy-MM-dd"
        if let dateComponents = rawDate {
            return formatter.string(from: dateComponents.date!)
        }
        return ""
    }

    func allLists() -> [String] {
        let calendars = eventStore.calendars(for: EKEntityType.reminder)
        return calendars.map {$0.title}
    }

    func getReminders(_ list: String, _ completion: @escaping ([[String: Any]]) -> ()) {
        let predicate: NSPredicate? = eventStore.predicateForReminders(in: getCalendar(list))
        if let predicate = predicate {
            eventStore.fetchReminders(matching: predicate) { (_ reminders: [Any]?) -> Void in
                let rems = reminders as? [EKReminder] ?? [EKReminder]()
                completion(rems.map { ["title": $0.title ?? "",
                                       "isCompleted": $0.isCompleted,
                                       "priority": $0.priority,
                                       "dueDate": AppleReminders.dateToString($0.dueDateComponents),
                                       "startDate": AppleReminders.dateToString($0.startDateComponents),
                                       "completionDate": $0.completionDate?.description ?? "",
                                       "id": $0.calendarItemIdentifier,
                                       "notes": "\($0.notes ?? "")  \($0.url?.absoluteString ?? "") \($0.url?.description ?? "")"
                                       ]})
            }
        }
    }

    func deleteReminder(_ id: String) {
        if let reminder = eventStore.calendarItem(withIdentifier: id) as? EKReminder{
            try? eventStore.remove(reminder, commit: true)
        }
    }

    private func getCalendar(_ title: String) -> [EKCalendar] {
        let calendars = eventStore.calendars(for: EKEntityType.reminder)
        return calendars.filter { $0.title == title}
    }
}
