class Shift < ApplicationRecord
    belongs_to :shop
    belongs_to :worker
    
    validates :worker_id, presence: true
    
    def self.day_of_week(day)
        first_day = Date.current.beginning_of_month.since((day - 1).days).wday
        week = ["日", "月", "火", "水", "木", "金", "土"]
        p "#{week[first_day]}"
    end
    
    def self.work_time(day, shift)
        day_hour = ((Pattern.find_by(id: shift.send("day#{day}")).end_time.hour) * 60) - ((Pattern.find_by(id: shift.send("day#{day}")).start_time.hour) * 60)
        day_hour += 1440 if day_hour < 0
        day_hour -= ((Pattern.find_by(id: shift.send("day#{day}")).rest_time.hour) * 60)
        day_minit = (Pattern.find_by(id: shift.send("day#{day}")).end_time.min) - (Pattern.find_by(id: shift.send("day#{day}")).start_time.min)
        day_minit += 60 if day_minit < 0
        day_minit  -= (Pattern.find_by(id: shift.send("day#{day}")).rest_time.min)
        day_hour + day_minit
    end
    
end
