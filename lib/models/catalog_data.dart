import 'product.dart';

/// Starting catalog: 36 mock products, with unique IDs.
List<Product> buildInitialCatalog() {
  const entries = <(String, String, double, double, String)>[
    ('MacBook Pro 16" M3 Max','Laptops',3499,4.9,'TOP'),
    ('iPhone 16 Pro Max 512GB','Smartphones',1399,4.8,'NEW'),
    ('Sony WH-1000XM5 Wireless','Audio',399,4.7,'POPULAR'),
    ('iPad Pro 13" M4 Ultra Retina','Tablets',1299,4.9,'TOP'),
    ('Apple Watch Ultra 2 Titanium','Wearables',799,4.8,'HOT'),
    ('Keychron Q1 Pro Custom Mechanical','Peripherals',199,4.6,'DEAL'),
    ('Logitech MX Master 3S Ergonomic','Peripherals',99,4.8,'POPULAR'),
    ('Dell UltraSharp 32" 4K USB-C Hub','Monitors',899,4.7,'TOP'),
    ('Galaxy S24 Ultra 256GB','Smartphones',1199,4.8,'HOT'),
    ('ASUS Zenbook OLED 14','Laptops',1099,4.6,'DEAL'),
    ('JBL Live 770NC Headphones','Audio',169,4.5,'NEW'),
    ('Lenovo Yoga Tab 13','Tablets',649,4.6,'DEAL'),
    ('Garmin Venu 3 Smartwatch','Wearables',449,4.7,'POPULAR'),
    ('Logitech Pebble Keys 2','Peripherals',55,4.5,'NEW'),
    ('Samsung Odyssey G7 27"','Monitors',499,4.6,'HOT'),
    ('Canon EOS R50 Kit','Cameras',799,4.8,'TOP'),
    ('Sony Alpha a6400 Camera','Cameras',949,4.7,'POPULAR'),
    ('Nintendo Switch OLED','Gaming',349,4.9,'BEST'),
    ('Xbox Wireless Controller','Gaming',69,4.8,'DEAL'),
    ('Echo Smart Speaker 5th Gen','Smart Home',119,4.6,'HOT'),
    ('Smart LED Light Starter Kit','Smart Home',79,4.4,'NEW'),
    ('Samsung Portable SSD T7 2TB','Storage',179,4.8,'POPULAR'),
    ('SanDisk Ultra microSD 512GB','Storage',58,4.6,'DEAL'),
    ('USB-C Multiport Dock 9-in-1','Accessories',89,4.5,'HOT'),
    ('Anker Nano 65W Charger','Accessories',49,4.8,'TOP'),
    ('HP Spectre x360 14 OLED','Laptops',1649,4.7,'NEW'),
    ('Google Pixel 9 Pro','Smartphones',999,4.7,'TOP'),
    ('Beats Studio Pro Wireless','Audio',279,4.5,'DEAL'),
    ('Samsung Galaxy Tab S9','Tablets',729,4.8,'POPULAR'),
    ('Fitbit Charge 6 Fitness','Wearables',159,4.6,'HOT'),
    ('Razer Basilisk V3 Gaming Mouse','Peripherals',69,4.7,'BEST'),
    ('LG UltraGear 34" Monitor','Monitors',799,4.7,'NEW'),
    ('Insta360 X4 Action Camera','Cameras',499,4.8,'TOP'),
    ('PlayStation DualSense Edge','Gaming',199,4.7,'HOT'),
    ('Smart Wi-Fi Security Camera','Smart Home',69,4.5,'DEAL'),
    ('Portable NVMe SSD 1TB','Storage',129,4.6,'NEW'),
  ];
  return List.generate(entries.length, (index) {
    final item = entries[index];
    return Product(id: 'p${index+1}', title: item.$1, category: item.$2,
      price: item.$3, rating: item.$4, reviewsCount: 50+index*12, badge: item.$5);
  });
}
