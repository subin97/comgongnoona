
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


for i in 1..10
Spec.create(
    brand: "samsung", 
    name: "#{i}번노트북", 
    price: i*100000, 
    cpu: "#{i}번CPU", 
    cpuscore: i*100000, 
    gpu: "#{i}번GPU", 
    gpuscore: i*100000, 
    ram: i, 
    hdd: i*100, 
    ssd: i*100, 
    battery: i, 
    display: 13+(i/4)*2, 
    weight: i 
    )

end