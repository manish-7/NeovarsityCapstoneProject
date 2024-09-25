CREATE TABLE authorization
(
    id                            VARCHAR(255) NOT NULL,
    registered_client_id          VARCHAR(255) NULL,
    principal_name                VARCHAR(255) NULL,
    authorization_grant_type      VARCHAR(255) NULL,
    authorized_scopes             TEXT NULL,
    attributes                    TEXT NULL,
    state                         VARCHAR(500) NULL,
    authorization_code_value      TEXT NULL,
    authorization_code_issued_at  datetime NULL,
    authorization_code_expires_at datetime NULL,
    authorization_code_metadata   VARCHAR(255) NULL,
    access_token_value            TEXT NULL,
    access_token_issued_at        datetime NULL,
    access_token_expires_at       datetime NULL,
    access_token_metadata         TEXT NULL,
    access_token_type             VARCHAR(255) NULL,
    access_token_scopes           TEXT NULL,
    refresh_token_value           TEXT NULL,
    refresh_token_issued_at       datetime NULL,
    refresh_token_expires_at      datetime NULL,
    refresh_token_metadata        TEXT NULL,
    oidc_id_token_value           TEXT NULL,
    oidc_id_token_issued_at       datetime NULL,
    oidc_id_token_expires_at      datetime NULL,
    oidc_id_token_metadata        TEXT NULL,
    oidc_id_token_claims          TEXT NULL,
    user_code_value               TEXT NULL,
    user_code_issued_at           datetime NULL,
    user_code_expires_at          datetime NULL,
    user_code_metadata            TEXT NULL,
    device_code_value             TEXT NULL,
    device_code_issued_at         datetime NULL,
    device_code_expires_at        datetime NULL,
    device_code_metadata          TEXT NULL,
    CONSTRAINT pk_authorization PRIMARY KEY (id)
);

CREATE TABLE authorization_consent
(
    registered_client_id VARCHAR(255) NOT NULL,
    principal_name       VARCHAR(255) NOT NULL,
    authorities          VARCHAR(1000) NULL,
    CONSTRAINT pk_authorizationconsent PRIMARY KEY (registered_client_id, principal_name)
);

CREATE TABLE client
(
    id                            VARCHAR(255) NOT NULL,
    client_id                     VARCHAR(255) NULL,
    client_id_issued_at           datetime NULL,
    client_secret                 VARCHAR(255) NULL,
    client_secret_expires_at      datetime NULL,
    client_name                   VARCHAR(255) NULL,
    client_authentication_methods TEXT NULL,
    authorization_grant_types     TEXT NULL,
    redirect_uris                 TEXT NULL,
    post_logout_redirect_uris     TEXT NULL,
    scopes                        TEXT NULL,
    client_settings               TEXT NULL,
    token_settings                TEXT NULL,
    CONSTRAINT pk_client PRIMARY KEY (id)
);

CREATE TABLE `role`
(
    id        BIGINT AUTO_INCREMENT NOT NULL,
    role_name VARCHAR(255) NULL,
    CONSTRAINT pk_role PRIMARY KEY (id)
);

CREATE TABLE session
(
    id          BIGINT AUTO_INCREMENT NOT NULL,
    token       VARCHAR(255) NULL,
    expiring_at datetime NULL,
    user_id     BIGINT NULL,
    status      TINYINT NULL,
    CONSTRAINT pk_session PRIMARY KEY (id)
);

CREATE TABLE user
(
    id       BIGINT AUTO_INCREMENT NOT NULL,
    e_mail   VARCHAR(255) NOT NULL,
    password VARCHAR(255) NULL,
    CONSTRAINT pk_user PRIMARY KEY (id)
);

CREATE TABLE user_roles
(
    user_id  BIGINT NOT NULL,
    roles_id BIGINT NOT NULL,
    CONSTRAINT pk_user_roles PRIMARY KEY (user_id, roles_id)
);

ALTER TABLE user
    ADD CONSTRAINT uc_990d4d377cac9fe1e599b359c UNIQUE (e_mail);

ALTER TABLE session
    ADD CONSTRAINT FK_SESSION_ON_USER FOREIGN KEY (user_id) REFERENCES user (id);

ALTER TABLE user_roles
    ADD CONSTRAINT fk_userol_on_role FOREIGN KEY (roles_id) REFERENCES `role` (id);

ALTER TABLE user_roles
    ADD CONSTRAINT fk_userol_on_user FOREIGN KEY (user_id) REFERENCES user (id);


CREATE TABLE categories (
    Id VARCHAR(255) PRIMARY KEY,
    modifiedBy VARCHAR(255),
    modifiedOn TIMESTAMP,
    createdBy VARCHAR(255),
    createdOn TIMESTAMP,
    isDeleted BOOLEAN,
    name VARCHAR(255),
    description VARCHAR(255)
);

CREATE TABLE payments (
    Id BIGINT AUTO_INCREMENT PRIMARY KEY,
    modifiedBy VARCHAR(255),
    modifiedOn TIMESTAMP,
    createdBy VARCHAR(255),
    createdOn TIMESTAMP,
    isDeleted BOOLEAN,
    amount BIGINT,
    status VARCHAR(50),
    user_id BIGINT,
    order_id VARCHAR(255),
    payment_link VARCHAR(255),
    payment_ref VARCHAR(255)
);

CREATE TABLE products (
    Id VARCHAR(255) PRIMARY KEY,
    modifiedBy VARCHAR(255),
    modifiedOn TIMESTAMP,
    createdBy VARCHAR(255),
    createdOn TIMESTAMP,
    isDeleted BOOLEAN,
    name VARCHAR(255) NOT NULL,
    title VARCHAR(255),
    description TEXT,
    image VARCHAR(255),
    category_id VARCHAR(255),
    price DOUBLE,
    CONSTRAINT fk_product_category FOREIGN KEY (category_id) REFERENCES categories(Id)
);


-- Product Categories
INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Electronics', 'All electronic devices'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Furniture', 'Home and office furniture'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Clothing', 'Apparel for all ages'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Footwear', 'Shoes and sandals'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Books', 'Various genres of books'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Sports Equipment', 'All types of sports gear'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Beauty Products', 'Cosmetics and skincare'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Stationery', 'Office and school supplies'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Toys', 'Toys and games for children'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Garden Supplies', 'Tools and supplies for gardening'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Home Appliances', 'Household appliances'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);

INSERT INTO CATEGORIES (ID, NAME, DESCRIPTION)
SELECT UUID(), 'Groceries', 'Everyday essentials'
WHERE NOT EXISTS (SELECT 1 FROM CATEGORIES LIMIT 1);


-- Products
INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'LED TV', 'LED TV 50 inch', '50-inch LED television', 499.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Electronics')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Sofa Set', 'Comfortable Sofa', '3-seater comfortable sofa', 899.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Furniture')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'T-Shirt', 'Casual T-Shirt', '100% cotton casual t-shirt', 15.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Clothing')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Running Shoes', 'Sports Running Shoes', 'Lightweight running shoes', 59.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Footwear')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Mystery Novel', 'Best-selling Mystery Novel', 'A thrilling mystery novel', 9.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Books')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Football', 'Official Size Football', 'Size 5 professional football', 29.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Sports Equipment')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Lipstick', 'Matte Lipstick', 'Long-lasting matte lipstick', 12.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Beauty Products')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Notebook', 'Spiral Notebook', '200 pages spiral notebook', 4.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Stationery')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Lego Set', 'Building Blocks Set', '500 pieces lego set', 39.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Toys')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Garden Shears', 'Professional Garden Shears', 'Sharp garden shears for cutting', 19.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Garden Supplies')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Vacuum Cleaner', 'High Power Vacuum Cleaner', 'Powerful household vacuum cleaner', 149.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Home Appliances')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Rice', 'Basmati Rice', '1 kg of premium basmati rice', 2.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Groceries')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Smartphone', 'Latest Smartphone', 'High-performance smartphone with 128GB storage', 799.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Electronics')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Office Chair', 'Ergonomic Office Chair', 'Comfortable and adjustable office chair', 199.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Furniture')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Jeans', 'Denim Jeans', 'Slim-fit denim jeans', 39.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Clothing')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Sneakers', 'Stylish Sneakers', 'Trendy casual sneakers', 69.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Footwear')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Cookbook', 'Vegan Recipes Cookbook', 'Over 100 vegan recipes', 19.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Books')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Basketball', 'Indoor/Outdoor Basketball', 'Durable basketball for indoor and outdoor use', 34.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Sports Equipment')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Face Cream', 'Anti-aging Face Cream', 'Hydrating anti-aging face cream', 29.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Beauty Products')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Pen Set', 'Luxury Pen Set', 'Set of 5 premium pens', 24.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Stationery')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Action Figure', 'Superhero Action Figure', '12-inch action figure of a popular superhero', 19.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Toys')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Lawn Mower', 'Electric Lawn Mower', 'Powerful electric lawn mower', 249.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Garden Supplies')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Washing Machine', 'Front Load Washing Machine', 'Energy-efficient front load washing machine', 599.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Home Appliances')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Olive Oil', 'Extra Virgin Olive Oil', '1-liter bottle of extra virgin olive oil', 8.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Groceries')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Laptop', 'Gaming Laptop', 'High-performance gaming laptop with 16GB RAM', 1299.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Electronics')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Dining Table', 'Wooden Dining Table', '6-seater wooden dining table', 799.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Furniture')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Dress', 'Summer Dress', 'Floral printed summer dress', 49.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Clothing')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Hiking Boots', 'Waterproof Hiking Boots', 'Durable and waterproof boots for hiking', 99.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Footwear')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Science Fiction Novel', 'Best-selling Sci-Fi Novel', 'A gripping science fiction novel', 14.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Books')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Yoga Mat', 'Eco-friendly Yoga Mat', 'Non-slip and eco-friendly yoga mat', 29.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Sports Equipment')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Shampoo', 'Organic Shampoo', 'Sulfate-free organic shampoo', 14.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Beauty Products')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Markers Set', 'Colored Markers Set', 'Pack of 10 colored markers', 9.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Stationery')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Puzzle', '500-piece Puzzle', 'Challenging 500-piece puzzle', 14.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Toys')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Garden Hose', 'Expandable Garden Hose', '50ft expandable garden hose', 39.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Garden Supplies')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Microwave Oven', 'Convection Microwave Oven', '1000-watt convection microwave oven', 199.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Home Appliances')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);

INSERT INTO PRODUCTS (ID, NAME, TITLE, DESCRIPTION, PRICE, CATEGORY_ID)
SELECT UUID(), 'Cereal', 'Whole Grain Cereal', '500g box of whole grain cereal', 4.99, (SELECT ID FROM CATEGORIES WHERE NAME = 'Groceries')
WHERE NOT EXISTS (SELECT 1 FROM PRODUCTS LIMIT 1);
