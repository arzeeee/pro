# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
teacher = Role.create(roleName: "Teacher")
student = Role.create(roleName: "Student")

jabar = Province.create(provinceName: "Jawa Barat")
jatim = Province.create(provinceName: "Jawa Timur")

bandung = City.create(province: jabar, cityName: "Bandung")
malang = City.create(province: jatim, cityName: "Malang")

smansab = School.create(city: bandung, schoolName: "SMAN 1 Bandung")
smansam = School.create(city: malang, schoolName: "SMAN 1 Malang")
School.create(city: malang, schoolName: "SMP 1 Malang")

itb = University.create(universityName: "ITB")
ugm = University.create(universityName: "UGM")

major1 = MajorInterest.create(code:1, majors: "STEI", capacity: 100, 
         university: itb, passingGrade: 62.1, year: 2015)

major2 = MajorInterest.create(code:2, majors: "FTI", capacity: 200, 
         university: ugm, passingGrade: 62.1, year: 2015)

Grade.create(gradeName: "7", gradeType: "SMP")
Grade.create(gradeName: "8", gradeType: "SMP")
Grade.create(gradeName: "9", gradeType: "SMP")
ipa10 = Grade.create(gradeName: "10 IPA", gradeType: "SMA")
Grade.create(gradeName: "11 IPA", gradeType: "SMA")
Grade.create(gradeName: "12 IPA", gradeType: "SMA")
Grade.create(gradeName: "10 IPS", gradeType: "SMA")
ips11 = Grade.create(gradeName: "11 IPS", gradeType: "SMA")
Grade.create(gradeName: "12 IPS", gradeType: "SMA")

user1 = User.create(username: "test_username1", email:"email0@email.com", password: "password", fullname: "Test Subject", phoneNo: "081320460544", role: teacher)
user2 = User.create(username: "test_username2", email:"email2@email.com", password: "password", fullname: "Test Subject", phoneNo: "081320460541", role: student)
user3 = User.create(username: "test_username3", email:"email3@email.com", password: "password", fullname: "Test Subject", phoneNo: "081320460443", role: teacher)
user4 = User.create(username: "test_username4", email:"email4@email.com", password: "password", fullname: "Test Subject", phoneNo: "081320405432", role: student)


std1 = Student.create(dob: Date.today, school: smansab, university: itb, province: jabar,
               nise: "-", major_interest: major1, grade: ipa10)
               
std2 = Student.create(dob: Date.today, school: smansab, university: ugm, province: jabar,
               nise: "-", major_interest: major1, grade: ips11)

std3 = Student.create(dob: Date.today, school: smansab, university: itb, province: jabar,
               nise: "-", major_interest: major1, grade: ipa10)
               
std4 = Student.create(dob: Date.today, school: smansab, university: ugm, province: jabar,
               nise: "-", major_interest: major1, grade: ips11)

user1.student = std1
user2.student = std2
user3.student = std3
user4.student = std4

subjects = ["Maths","Biology","Physics","Chemistry","English","Indonesian"]

subjects.each do |subject|
  Subject.create(subjectName: subject)
  Lesson.create(lessonName: subject+" chapter 1", chapter: '1',
  subject: (Subject.where(subjectName: subject).first), grade: Grade.find(1),
  price: 0, lessonType: "Outline")
  Lesson.create(lessonName: subject+" chapter 2", chapter: '2', 
  subject: (Subject.where(subjectName: subject).first), grade: Grade.find(1),
  price: 0, lessonType: "Outline")
end

subjects.each do |subject|
  Lesson.create(lessonName: subject+" chapter 3", chapter: '3',
  subject: (Subject.where(subjectName: subject).first), grade: Grade.find(1),
  price: 0, lessonType: "EduVideo")
  Lesson.create(lessonName: subject+" chapter 4", chapter: '4', 
  subject: (Subject.where(subjectName: subject).first), grade: Grade.find(1),
  price: 0, lessonType: "ProblemSet")
end

i = 1

while i<50 do
  School.create(city: bandung, schoolName: "SMAN #{i} Bandung")
  i+=1
end

Message.create(body: "Made by seed",user_id: 2)
Message.create(body: "Yea probably not a good idea",user_id: 1)
Message.create(body: "Or is it",user_id: 2)



