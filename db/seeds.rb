Trainer.create!([
  {first_name: "Coach", last_name: "Harvey", username: "admin", email: "admin@admin.com", password: "password", encrypted_password: "$2a$11$B5aXVbDYOvy/TwMvNeYhEOjohJgkEG/OTrsif9HHNVH3xbWXZE.Ku", admin: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2016-10-25 16:55:45", sign_in_count: 6, current_sign_in_at: "2016-10-25 16:55:45", last_sign_in_at: "2016-10-25 16:37:38", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {first_name: "Barry", last_name: "Lindler", username: "blindler", email: "blindler@lexrich5.org", password: "password", encrypted_password: "$2a$11$8saq21IR7w9kk9ktFKcWPeyEFhTi7DYB.XTK5i2LDIFecsJssEK4u", admin: false, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "Sally", last_name: "McTraining", username: "smctraining", email: "smctraining@lexrich5.org", password: "password", encrypted_password: "$2a$11$MLm.9gk8BjG.NdlmxIyRRem5ByS5GiQ.e3gjUy6rsUjusDD6NKkiC", admin: false, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "Charlotte", last_name: "Gibson", username: "cgibson", email: "email@fakeemail.com", password: "password", encrypted_password: "$2a$11$csSyRBjrjF0ThwTpnuvcmO0QvIif/GdpoLp4QIijvG8PlTy2vAixO", admin: false, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "William", last_name: "Edwards", username: "wedwards", email: "email@email.com", password: "password", encrypted_password: "$2a$11$G7bxTx8NaojJR81BXVSQbu96g/sb.Q1CgN6lc1X0BzBHvdMYsn8aW", admin: false, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil}
])
Athlete.create!([
  {first_name: "Austin", last_name: "Meier", sport: "Football"},
  {first_name: "Adam", last_name: "Greene", sport: "Swimming"},
  {first_name: "Wyatt", last_name: "Boyer", sport: "Swimming"},
  {first_name: "Jackson", last_name: "Jordan", sport: "Cross Country,Track"},
  {first_name: "Michelle", last_name: "Rodriguez", sport: "Cross Country"}
])
Injury.create!([
  {athlete_id: 3, status: "Hold", active: false, injury_location: "Back", comment: "", date: "2016-09-13"},
  {athlete_id: 5, status: "Hold", active: true, injury_location: "Back", comment: "", date: "2016-10-18"},
  {athlete_id: 3, status: "Hold", active: true, injury_location: "Shoulder", comment: "no pads", date: "2016-10-25"},
  {athlete_id: 4, status: "Limit", active: false, injury_location: "Arm", comment: "", date: "2016-10-14"},
  {athlete_id: 5, status: "Hold", active: false, injury_location: "Abdomen", comment: "", date: "2016-10-01"},
  {athlete_id: 2, status: "Full", active: true, injury_location: "Ankle", comment: "Broken Ankles", date: "2016-10-16"},
  {athlete_id: 5, status: "Full", active: false, injury_location: "Back", comment: "", date: "2016-08-09"},
  {athlete_id: 1, status: "Hold", active: true, injury_location: "Abdomen", comment: "", date: "2016-10-21"}
])
Treatment.create!([
  {athlete_id: 5, trainer_id: 4, treatment_location: "Abdomen", comment: "Wrap", date: "2016-10-01", time: "12:46 PM"},
  {athlete_id: 5, trainer_id: 5, treatment_location: "Abdomen", comment: "Wrap", date: "2016-10-02", time: "12:47 PM"},
  {athlete_id: 1, trainer_id: 1, treatment_location: "Abdomen", comment: "Ice", date: "2016-10-24", time: "12:48 PM"},
  {athlete_id: 1, trainer_id: 4, treatment_location: "Abdomen", comment: "Ice Wrap", date: "2016-10-14", time: "12:49 PM"},
  {athlete_id: 1, trainer_id: 1, treatment_location: "Arm", comment: "Splint", date: "2016-10-15", time: "12:50 PM"},
  {athlete_id: 3, trainer_id: 1, treatment_location: "Shoulder", comment: "Ice Pack", date: "2016-10-25", time: "01:05 PM"}
])
