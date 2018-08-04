
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
    monitor: 13+(i/4)*2, 
    weight: i 
    )

end