# check all uers
select * from users;

-- check user details by joining users
select * from users u 
join user_details ud 
on
ud.user_id = u.id;

-- check images profile of each users
-- by joining table user_details
select * from users u 
join user_details ud 
on
ud.user_id = u.id
join images i 
on
i.id = ud.image_id ;

-- check each role of users
-- by joining users with users_role table
-- select * from users u 
-- join user_details ud 
-- on
-- ud.user_id = u.id
-- join images i 
-- on
-- i.id = ud.image_id
-- join user_roles ur 
-- on ur.user_id  = u.id; 

-- check each role of users
-- by joining users with users_role table
-- select * from users u 
-- join user_details ud 
-- on
-- ud.user_id = u.id
-- join images i 
-- on
-- i.id = ud.image_id
-- join user_roles ur 
-- on ur.user_id  = u.id; 

-- check wishlist of users
select * from users
join charts c  on
c.user_id  = users.id 
;

-- check the product of carts
select * from users
join charts c on
c.user_id = users.id 
join chart_products cp on
cp.chart_id  = c.id 
join products p on
p.id = cp.product_id 
;

-- check the transaction that is done by hasan
select * from users
join charts c on
c.user_id = users.id 
join chart_products cp on
cp.chart_id  = c.id 
join products p on
p.id = cp.product_id 
join transactions t on
t.user_id = users.id 
group by p.id  
;

-- check the payment of hasan's transaction
-- select * from users
-- join wishlist w on
-- w.user_id = users.id 
-- join wishlist_products wp on
-- wp.wishlist_id = w.id 
-- join products p on
-- p.id = wp.product_id 
-- join transactions t on
-- t.user_id = users.id
-- join payment p2 on
-- p2.transaction_id = t.id
-- group by p.id  
-- ;

-- check product asset after doing payment
-- select * from users
-- join wishlist w on
-- w.user_id = users.id 
-- join wishlist_products wp on
-- wp.wishlist_id = w.id 
-- join products p on
-- p.id = wp.product_id 
-- join transactions t on
-- t.user_id = users.id
-- join payment p2 on
-- p2.transaction_id = t.id
-- join product_asset pa on
-- pa.id = p.asset_id 
-- group by p.id  
-- ;
-- 
-- check product's seller that sold
-- select count(*) as sold  from users u 
-- join user_roles ur on
-- ur.user_id = u.id 
-- join products p on
-- p.seller_id = u.id 
-- join transactions t on
-- t.product_id = p.id 
-- join payment p2 on
-- p2.transaction_id = t.id 
-- where ur.`role` = 'seller' and p2.status = 'DONE'
-- ;

-- check the reviews
-- and his product
-- select r.comment , p.title, u.username  as pembeli, ur.`role`, p.seller_id  from reviews r 
-- join products p on
-- p.id = r.product_id 
-- join users u on
-- u.id = r.user_id 
-- join user_roles ur on
-- ur.user_id = u.id 
-- ;
-- 



select * from `user` u ;
select * from products p ;
select * from user_details ud ;

