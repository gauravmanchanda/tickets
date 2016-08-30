fury = Admin.new(first_name: 'Nick', last_name: 'Fury', email: 'nickfury@shield.com', dob: Date.new(1966,1,1))
fury.password = "nickfury"
fury.password_confirmation = "nickfury"
fury.save!
im = Agent.new(first_name: 'Tony', last_name: 'Stark', email: 'tony@starkindustries.com', dob: Date.new(1970,2,2))
im.password = "theironman"
im.password_confirmation = "theironman"
im.save!
thor = Agent.new(first_name: 'Thor', last_name: 'Odinson', email: 'thor@asgard.com', dob: Date.new(380,3,3))
thor.password = "thortheking"
thor.password_confirmation = "thortheking"
thor.save!
bw = Agent.new(first_name: 'Natasha', last_name: 'Romanova', email: 'blackwidow@shield.com', dob: Date.new(1980,4,4))
bw.password = "blackwidow"
bw.password_confirmation = "blackwidow"
bw.save!
hulk = Agent.new(first_name: 'Bruce', last_name: 'Banner', email: 'bbanner@culver.edu', dob: Date.new(1975,5,5))
hulk.password = "biggreenguy"
hulk.password_confirmation = "biggreenguy"
hulk.save!
pepper = Customer.new(first_name: 'Pepper', last_name: 'Potts', email: 'pepper@starkindustries.com', dob: Date.new(1982,6,6))
pepper.password = "pepper123"
pepper.password_confirmation = "pepper123"
pepper.save!
jane = Customer.new(first_name: 'Jane', last_name: 'Foster', email: 'jfoster@gmail.com', dob: Date.new(1986,7,7))
jane.password = "thorlove"
jane.password_confirmation = "thorlove"
jane.save!
coulson = Customer.new(first_name: 'Phil', last_name: 'Coulson', email: 'pcoulson@shield.com', dob: Date.new(1970,8,8))
coulson.password = "avengers143"
coulson.password_confirmation = "avengers143"
coulson.save!
anton = Customer.new(first_name: 'Anton', last_name: 'Wanko', email: 'wanko@evil.ru', dob: Date.new(1970,9,9))
anton.password = "killtony"
anton.password_confirmation = "killtony"
anton.save!

pepper.tickets.create!(title: "Help!!", description: "Someone is wreacking havoc on the Stark Building, please help!!")
jane.tickets.create!(title: "Missing", description: "Man, around 6 feet, carrying a Hammer, he calls it Mjolnir, is missing. Help with any info you may have!")
coulson.tickets.create!(title: "Hi my name is Agent Coulson", description: "I am in love with the Avengers, please help me get rid of the obsession. :(")
anton.tickets.create!(title: "They can do more than Salute", description: "I have an army of death waiting at the exibition. Save yourselves if you can!!")
