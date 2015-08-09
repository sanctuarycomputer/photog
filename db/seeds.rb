# Seed Albums
album = Album.create({
  name: "Landscape / Atmosphere"
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/1.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/2.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/3.jpg"),
  album: album
})

album = Album.create({
  name: "Vibes"
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/4.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/5.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/6.jpg"),
  album: album
})

album = Album.create({
  name: "Locations"
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/7.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/8.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/9.jpg"),
  album: album
})


album = Album.create({
  name: "Remote"
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/10.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/11.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/12.jpg"),
  album: album
})

album = Album.create({
  name: "Local"
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/13.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/14.jpg"),
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/15.jpg"),
  album: album
})

# Seed User
AdminUser.create({
  email: 'spree@example.com',
  password: 'spree123'
})
