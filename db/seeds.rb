Trainer.create!([
  {first_name: "Coach", last_name: "Harvey", username: "admin", email: "admin@admin.com", password: 'password', encrypted_password: "$2a$11$B5aXVbDYOvy/TwMvNeYhEOjohJgkEG/OTrsif9HHNVH3xbWXZE.Ku", admin: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 2, current_sign_in_at: "2016-10-14 02:31:38", last_sign_in_at: "2016-10-13 22:12:35", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
])
Athlete.create!([
  {first_name: "Austin", last_name: "Meier", sport: "Football"}
])
Injury.create!([
  {athlete_id: 1, status: "Full", injury_location: "Header", comment: "My Neck MY back", date: "2016-10-13"},
  {athlete_id: 1, status: "None", injury_location: "Shoulder", comment: "", date: "2016-10-13"}
])
Treatment.create!([
  {athlete_id: 1, trainer_id: 1, treatment_location: "Header", comment: "asdfasdf", date: "2016-10-13", time: "09:35 PM"},
  {athlete_id: 1, trainer_id: 1, treatment_location: "Header", comment: "asdf", date: "2016-10-13", time: "09:51 PM"}
])
