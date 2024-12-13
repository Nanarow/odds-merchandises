# ตัวอย่าง: db/seeds.rb

products_data = [
  {
    name: "เสื้อ ODDS  (สีดำ)",
    price: 299,
    detail: "ส่วมใส่สบาย คูลๆๆ",
    image_path: "db/images/เสื้อดำ.jpg"
  },
  {
    name: "เสื้อ ODDS  (สีขาว)",
    price: 299,
    detail: "ส่วมใส่สบาย คูลๆๆ",
    image_path: "db/images/เสื้อขาว.jpg"
  },
  {
    name: "ถุงเท้า (สีเขียว)",
    price: 99,
    detail: "ส่วมใส่สบาย วิ่งเร็ว",
    image_path: "db/images/ถุงเท้า.jpg"
  },
  {
    name: "ถุงเท้า (สีดำ)",
    price: 99,
    detail: "ส่วมใส่สบาย วิ่งเร็ว",
    image_path: "db/images/ถุงเท้า.jpg"
  },
  {
    name: "แก้วน้ำ",
    price: 299,
    detail: "ใส่น้ำ ดื่ม สดใส",
    image_path: "db/images/แก้วน้ำ.jpg"
  },
  {
    name: "พวงกุญแจ",
    price: 199,
    detail: "ห้อยแล้ว สดใส ร่าเริง",
    image_path: "db/images/พวงกุญแจ.jpg"
  },
  {
    name: "หมวก",
    price: 299,
    detail: "ส่วมใส่สบาย เก๋ๆ",
    image_path: "db/images/หมวก.jpg"
  }
]

products_data.each do |product_data|
  product = Product.find_or_create_by(
    name: product_data[:name],
    price: product_data[:price],
    detail: product_data[:detail]
  )
  unless product.image.attached?
    product.image.attach(
      io: File.open(Rails.root.join(product_data[:image_path])),
      filename: File.basename(product_data[:image_path]),
      content_type: "image/jpg"
    )
  end
end

# db/seeds.rb

# ตรวจสอบว่ามีข้อมูล Products และ Billings อยู่แล้ว
if Product.count == 0
  puts "Please seed products first."
  exit
end

if Billing.count == 0
  puts "Please seed billings first."
  exit
end

# ตัวอย่าง: สร้าง Seed สำหรับ Orders
orders_data = []

# สร้าง Orders จำนวน 10 รายการ
10.times do
  product = Product.order("RANDOM()").first # เลือกสินค้าแบบสุ่ม
  billing = Billing.order("RANDOM()").first # เลือก Billing แบบสุ่ม
  quantity = rand(1..5) # กำหนดจำนวนแบบสุ่ม (1 ถึง 5)

  total_price = product.price * quantity # คำนวณราคาทั้งหมด

  orders_data << {
    product_id: product.id,
    billing_id: billing.id,
    quantity: quantity,
    total_price: total_price
  }
end

# บันทึกข้อมูลลงฐานข้อมูล
orders_data.each do |order_data|
  Order.create!(order_data)
end

puts "Seeded #{orders_data.size} orders."
