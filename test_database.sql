-- Create Three users
insert into users(username) values('hasan'),('husain'),('ali');

-- create three user detail
insert into user_details (user_id, email, password, name) 
values
(1,'hasan@gmail.com', '12345678', 'achmad hasan'),
(2,'husain@gmail.com', '12345678', 'achmad husain'),
(3,'ali@gmail.com', '12345678', 'ali');

-- create user roles for 3 users
insert into user_roles (role, user_id)
values
('seller', 1),
('buyer', 2),
('buyer', 3);

-- Upload image
insert into images (location)
values
('www.google.com/1'),
('www.google.com/2'),
('www.google.com/3');

-- update image after upload
update user_details  
set image_id = 1
where user_details.id = 1;

update user_details  
set image_id = 2
where user_details.id = 2;

update user_details  
set image_id = 3
where user_details.id = 3;

-- create category product
insert into categories (name)
values
('template'),
('icon'),
('ebook'),
('font');

-- create image products
insert into images (location)
values 
('www.product.com/1'),
('www.product.com/2'),
('www.product.com/3');


-- ali creates first product because hi is a seller in this platform
insert into products (title, image_id, seller_id, description, price, category_id)
values
('Icon Pack Web UISI', 4, 3, 'Saya baru saja sciping semua icon uisi', 5000000, 2),
('Template Web UISI', 5, 3, 'Saya baru saja hack web uisi', 5000000, 1),
('Ebook Sejarah Abul Hasan Asy-Syadzili', 6, 3, 'ebook sejarah Abul Hasan Asy-Syadzili', 3000000, 3),
('Font Jawir', 6, 3, 'font yang bisa berbahsa jawa', 1000000, 4);

-- assume that hasan or husain is gonna whislist items
insert into wishlist  (user_id) values(1);

-- okay rn, hasan is choosing the product in whislist
insert into wishlist_products (wishlist_id, product_id)
values(1, 3),(1,2); -- PR : harusnya tidak bisa whistlist dengan product yang sama berturut2

-- now hasan is buying products
insert into transactions (product_id, user_id, total) values(2, 1, 3);

-- after purchasing , hasan is happy and going to give a reviews to ali
insert into reviews (star, comment, user_id, product_id)
values(5, 'Ya Maula Ya Ali, ane suka product ente', 1, 2); // PR : One transaction harus bisa komen satu kali


