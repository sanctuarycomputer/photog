# Seed Albums
album = Album.create({
  name: "Landscape / Atmosphere",
  published: true
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/1.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/2.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/3.jpg"),
  visible: true,
  album: album
})

album = Album.create({
  name: "Vibes",
  published: true
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/4.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/5.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/6.jpg"),
  visible: true,
  album: album
})

album = Album.create({
  name: "Locations",
  published: true
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/7.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/8.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/9.jpg"),
  visible: true,
  album: album
})


album = Album.create({
  name: "Remote",
  published: true
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/10.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/11.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/12.jpg"),
  visible: true,
  album: album
})

album = Album.create({
  name: "Local",
  published: true
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/13.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/14.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/15.jpg"),
  visible: true,
  album: album
})

# Seed User
AdminUser.create({
  email: 'spree@example.com',
  password: 'spree123'
})

# Seed Pages
album = Album.create({
  name: "Homepage Images"
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/home_1.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/home_2.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/home_3.jpg"),
  visible: true,
  album: album
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/home_4.jpg"),
  visible: true,
  album: album
})

Page.create({
  name: 'Homepage',
  title: 'Jaime Johnson',
  copy: 'Photographer',
  album: album
})

# About Page
album = Album.create({
  name: "About Page Images"
})

Image.create({
  file: File.new("#{Rails.root}/public/seed_images/logo.jpg"),
  visible: true,
  album: album
})

Page.create({
  name: 'About',
  title: 'About Jaime Johnson',
  copy: 'Lorem Ipsum',
  album: album
})
