Trainer.create!([
  {first_name: "Coach", last_name: "Harvey", username: "admin", email: "admin@admin.com", password: "password", encrypted_password: "$2a$11$B5aXVbDYOvy/TwMvNeYhEOjohJgkEG/OTrsif9HHNVH3xbWXZE.Ku", admin: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-10-14 02:31:38", last_sign_in_at: "2016-10-13 22:12:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1"}
])
Athlete.create!([
  {first_name: "Austin", last_name: "Meier", sport: "Football"},
  {first_name: "Other", last_name: "Athlete", sport: "Baseball"}
])
Injury.create!([
  {athlete_id: 1, status: "Full", active: true, injury_location: "Header", comment: "Injury Test", date: "2016-10-13"},
  {athlete_id: 2, status: "Limit", active: true, injury_location: "Shoulder", comment: "Comment", date: "2016-10-27"}
])
Treatment.create!([
  {athlete_id: 1, trainer_id: 1, treatment_location: "Head", comment: "Treatment 2", date: "2016-10-27", time: "04:39 PM"},
  {athlete_id: 2, trainer_id: 1, treatment_location: "Finger", comment: "Treatment", date: "2016-10-27", time: "04:38 PM"}
])
