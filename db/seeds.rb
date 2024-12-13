# ตัวอย่าง: db/seeds.rb

products_data = [
  {
    name: "เสื้อ ODDS  (สีดำ)",
    price: 299,
    detail: "ส่วมใส่สบาย คูลๆๆ",
    image_path: "db/images/เสื้อ.jpg"
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
  
  # แนบรูปภาพเฉพาะเมื่อยังไม่มีไฟล์แนบ
  unless product.image.attached?
    product.image.attach(
      io: File.open(Rails.root.join(product_data[:image_path])),
      filename: File.basename(product_data[:image_path]),
      content_type: "image/jpg"
    )
  end
end
