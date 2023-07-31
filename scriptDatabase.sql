

create database shoplaptop;
USE shoplaptop ;

-- -----------------------------------------------------
-- Table `mydb`.`role`
-- vai trò gồm có admin, user, id= 1: admin, id =2: user
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `role` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL unique,
  PRIMARY KEY (`id`))
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `mydb`.`user`

-- status: 0 là xóa, 1 là bình thường
-- -----------------------------------------------------

CREATE TABLE IF NOT EXISTS `user` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(50) NOT NULL,
  `fullname` NVARCHAR(100)  NULL,
  `email` VARCHAR(200) NOT NULL unique,
  `phonenumber` VARCHAR(20) NULL unique,
  `address` NVARCHAR(500) NULL,
  `password` VARCHAR(255) NOT NULL,
  `role_id` INT  NOT NULL DEFAULT 2,
  `status` INT NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  CONSTRAINT `role_id`
    FOREIGN KEY (`role_id`)
    REFERENCES `role` (`id`)
    )
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`category`
-- danh mục chứa sản phẩm
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `category` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` NVARCHAR(200) NOT NULL unique,
  PRIMARY KEY (`id`)
  )
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



-- -----------------------------------------------------
-- Table `mydb`.`product`
-- isfeature đánh giấu những sản phẩm được nổi bật, hoặc giảm giá
-- status trạng thái sản phẩm, xóa hoặc không
-- create_at, update_at: thòi gian tạo ra sản phẩm , và thòi gian sửa giá sản phẩm
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `product` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` NVARCHAR(500) NOT NULL,
  `short_description` NVARCHAR(600) NULL,
  `price` DOUBLE NULL,
  `discount` DOUBLE NULL,
   `quantity` INT NULL DEFAULT 0,
  `thumbnail` VARCHAR(500) NULL,
  `description` LONGTEXT NULL,
  `is_featured` tinyint NULL,
  `status` INT NULL DEFAULT 0,
   `category_id` INT NULL,
  `create_at` DATETIME NOT NULL,
  `update_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `category_id`
    FOREIGN KEY (`category_id`)
    REFERENCES `category` (`id`)
    )
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `mydb`.`galery`
-- thư mục chứ nhiều ảnh của 1 sản phẩm
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `galery` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `thumbnail` VARCHAR(500) NULL,
  `product_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `product_id`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`id`)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `mydb`.`feedback`
-- create_at : ghi lại thời gian phản hồi
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `feedback` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` NVARCHAR(100) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `subject` NVARCHAR(200) NOT NULL,
  `message` NVARCHAR(500) NOT NULL,
  `created_at` datetime null, 
  `status` INT NULL DEFAULT 0 COMMENT '0: chưa xử lý, 1: đã xử lý',
  `user_id` int not null,
   primary key(`id`),
   CONSTRAINT `u_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    )
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `mydb`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `order` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fullname` NVARCHAR(100)  NULL,
  `email` VARCHAR(200)  NULL,
  `phonenumber` VARCHAR(20)  NULL,
  `address` NVARCHAR(500)  NULL,
  `note` NVARCHAR(500) NULL,
  `orderdate` DATETIME  NULL,
  `status` INT  NULL,
  `total` DOUBLE  NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- -----------------------------------------------------
-- Table `mydb`.`orderdatail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `orderdetail` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `price` DOUBLE NOT NULL,
  `quantity` INT NOT NULL,
  `total` DOUBLE NOT NULL,
  `product_id` INT NOT NULL,
  `order_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `id_product`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`id`)
   ,
  CONSTRAINT `order_id`
    FOREIGN KEY (`order_id`)
    REFERENCES `order` (`id`)
   )
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- -------------111----------------------------------------
-- Table `mydb`.`wishlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `wishlist` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `product_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `productid`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`id`),
  CONSTRAINT `userid`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;



CREATE TABLE IF NOT EXISTS `review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` NVARCHAR(100) NOT NULL,
  `email` VARCHAR(200) NOT NULL,
  `content` NVARCHAR(500) NOT NULL,
  `rating` INT NOT NULL,
  `product_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `idproduct`
    FOREIGN KEY (`product_id`)
    REFERENCES `product` (`id`)
)
ENGINE = InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;






