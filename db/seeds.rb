Trainer.create!([
  {first_name: "Coach", last_name: "Harvey", username: "admin", email: "admin@admin.com", password: "password", encrypted_password: "$2a$11$B5aXVbDYOvy/TwMvNeYhEOjohJgkEG/OTrsif9HHNVH3xbWXZE.Ku", admin: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: "2016-10-25 16:55:45", sign_in_count: 6, current_sign_in_at: "2016-10-25 16:55:45", last_sign_in_at: "2016-10-25 16:37:38", current_sign_in_ip: "::1", last_sign_in_ip: "::1"},
  {first_name: "Barry", last_name: "Lindler", username: "blindler", email: "blindler@lexrich5.org", password: "password", encrypted_password: "$2a$11$8saq21IR7w9kk9ktFKcWPeyEFhTi7DYB.XTK5i2LDIFecsJssEK4u", admin: false, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "Sally", last_name: "McTraining", username: "smctraining", email: "smctraining@lexrich5.org", password: "password", encrypted_password: "$2a$11$MLm.9gk8BjG.NdlmxIyRRem5ByS5GiQ.e3gjUy6rsUjusDD6NKkiC", admin: false, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "Charlotte", last_name: "Gibson", username: "cgibson", email: "email@fakeemail.com", password: "password", encrypted_password: "$2a$11$csSyRBjrjF0ThwTpnuvcmO0QvIif/GdpoLp4QIijvG8PlTy2vAixO", admin: false, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "William", last_name: "Edwards", username: "wedwards", email: "email@email.com", password: "password", encrypted_password: "$2a$11$G7bxTx8NaojJR81BXVSQbu96g/sb.Q1CgN6lc1X0BzBHvdMYsn8aW", admin: false, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil},
  {first_name: "Austin", last_name: "Meier", username: "ameier", email: "email@email.com", password: "password", encrypted_password: "$2a$11$G7bxTx8NaojJR81BXVSQbu96g/sb.Q1CgN6lc1X0BzBHvdMYsn8aW", admin: true, reset_password_token: nil, reset_password_sent_at: nil, remember_created_at: nil, sign_in_count: 0, current_sign_in_at: nil, last_sign_in_at: nil, current_sign_in_ip: nil, last_sign_in_ip: nil}

])
Athlete.create!([
  {first_name: "Austin", last_name: "Meier", dob: '10/03/99', grade: '11', phone: '6145605172', address: '506 Cockspur Road', sport: "Football"},
  {first_name: "Adam", last_name: "Greene", dob: '12/10/98', grade: '12', phone: '7836127638', address: '312 Parlock Road', sport: "Swimming"},
  {first_name: "Wyatt", last_name: "Boyer", dob: '5/11/26', grade: '11', phone: '8036034405', address: '745 Nylod Court', sport: "Swimming"},
  {first_name: "Jackson", last_name: "Jordan", dob: '4/20/1886', grade: '12', phone: '8036617752', address: '854 Fallen Court', sport: "Cross Country,Track"},
  {first_name: "Michelle", last_name: "Rodriguez", dob: '7/11/11', grade: '9', phone: '8035606672', address: '711 Grocery Lane', sport: "Cross Country"}
])
Injury.create!([
  {athlete_id: 3, status: "Hold", active: false, injury_location: "Back", comment: "", tcomment: "", date: "2016-09-13", time: "12:46 PM"},
  {athlete_id: 5, status: "Hold", active: true, injury_location: "Back", comment: "", tcomment: "", date: "2016-10-18", time: "12:46 PM"},
  {athlete_id: 3, status: "Hold", active: true, injury_location: "Shoulder", comment: "no pads", tcomment: "", date: "2016-10-25", time: "12:46 PM"},
  {athlete_id: 4, status: "Limit", active: false, injury_location: "Arm", comment: "", tcomment: "", date: "2016-10-14", time: "12:46 PM"},
  {athlete_id: 5, status: "Hold", active: false, injury_location: "Abdomen", comment: "", tcomment: "", date: "2016-10-01", time: "12:46 PM"},
  {athlete_id: 2, status: "Full", active: true, injury_location: "Ankle", comment: "", tcomment: "", date: "2016-10-16", time: "12:46 PM"},
  {athlete_id: 5, status: "Full", active: false, injury_location: "Back", comment: "", tcomment: "", date: "2016-08-09", time: "12:46 PM"},
  {athlete_id: 1, status: "Hold", active: true, injury_location: "Abdomen", comment: "", tcomment: "", date: "2016-10-21", time: "12:46 PM"}
])
Location.create!([
  {location: "Other"},
  {location: "Ankle"},
  {location: "Arm"},
  {location: "Back"},
  {location: "Finger"},
  {location: "Groin"},
  {location: "Head"},
  {location: "Hip"},
  {location: "Knee"},
  {location: "Abdomen"},
  {location: "Shin"},
  {location: "Shoulder"},
  {location: "Thigh"},
  {location: "Toe"},
  {location: "Wrist"}
])
Taction.create!([
  {name: "RICE"},
  {name: "Cryotherapy"},
  {name: "Compression"},
  {name: "Crutches"},
  {name: "Brace"},
  {name: "Tape"},
  {name: "US"},
  {name: "ESTIM/NMES"},
  {name: "Whirpool"},
  {name: "Padding/Protection"},
  {name: "NSAIDs"}
])
Sport.create!([
  {name: "Football"},
  {name: "Wrestling"},
  {name: "Lacrosse"},
  {name: "Baseball"},
  {name: "Softball"},
  {name: "Volleyball"},
  {name: "Track"},
  {name: "Cross-Country"},
  {name: "Basketball"},
  {name: "Soccer"},
  {name: "Swimming"},
  {name: "Tennis"}
])
