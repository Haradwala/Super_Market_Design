CREATE TABLE `Orders`(
    `CustomerID` INT NOT NULL,
    `OrderDate` DATE NOT NULL,
    `TotalAmount` ENUM('') NOT NULL,
    `OrderID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE
    `Orders` ADD UNIQUE `orders_customerid_unique`(`CustomerID`);
CREATE TABLE `Inventory`(
    `ProductID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `Quantity` BIGINT NOT NULL
);
CREATE TABLE `Suppliers`(
    `Supplier` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `SupplierName` VARCHAR(255) NOT NULL,
    `ProductID` INT NOT NULL,
    `ContactName` VARCHAR(255) NOT NULL,
    `ContactPhone` VARCHAR(255) NOT NULL,
    PRIMARY KEY(`ProductID`)
);
CREATE TABLE `Warehouse Inventory`(
    `WareHouseID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `ProductId` INT NOT NULL,
    `Quantity` INT NOT NULL,
    PRIMARY KEY(`ProductId`)
);
CREATE TABLE `Employees`(
    `EmployeeID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName``` VARCHAR(255) NOT NULL,
    `Position` VARCHAR(255) NOT NULL,
    `HireDate` DATE NOT NULL
);
CREATE TABLE `OrderItem`(
    `ProductID` INT NOT NULL,
    `OrderID` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `OrderItemID` INT NOT NULL,
    `Quantity` INT NOT NULL,
    `Price` ENUM('') NOT NULL,
    PRIMARY KEY(`OrderItemID`)
);
CREATE TABLE `HR Department`(
    `HRDepartmentID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `DepartmentName` VARCHAR(255) NOT NULL,
    `ManagerID` INT NOT NULL
);
ALTER TABLE
    `HR Department` ADD UNIQUE `hr department_managerid_unique`(`ManagerID`);
CREATE TABLE `Drivers`(
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Phone` VARCHAR(255) NOT NULL,
    `LicenceNumber` VARCHAR(255) NOT NULL,
    `HireDate` DATE NOT NULL,
    `EmployeeID` VARCHAR(255) NOT NULL,
    `DriverID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY
);
ALTER TABLE
    `Drivers` ADD UNIQUE `drivers_employeeid_unique`(`EmployeeID`);
CREATE TABLE `WareHouses`(
    `ManagerID` INT NOT NULL,
    `WareHouseID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `WareHouseName` VARCHAR(255) NOT NULL,
    `Location` VARCHAR(255) NOT NULL
);
CREATE TABLE `Deliveries`(
    `DeliveryID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `OrderID` INT NOT NULL,
    `DriverID` INT NOT NULL,
    `DeliveryDate` DATE NOT NULL,
    `DeliveryStatus` VARCHAR(255) NOT NULL
);
CREATE TABLE `Customer`(
    `CustomerID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `FirstName` VARCHAR(255) NOT NULL,
    `LastName` VARCHAR(255) NOT NULL,
    `Email` VARCHAR(255) NOT NULL,
    `Phone` VARCHAR(255) NOT NULL
);
CREATE TABLE `EmployeeRoles`(
    `RoleID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `RoleName` VARCHAR(255) NOT NULL,
    `EmployeeID` INT NOT NULL
);
CREATE TABLE `Payrolls`(
    `PayrollID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `EmployeeID` INT NOT NULL,
    `PayDate` DATE NOT NULL,
    `Salary` ENUM('') NOT NULL,
    `Bonus` ENUM('') NOT NULL
);
CREATE TABLE `Payments`(
    `PaymentID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `OrderID` INT NOT NULL,
    `PaymentDate` DATE NOT NULL,
    `Amount` ENUM('') NOT NULL,
    `PaymentMethod` VARCHAR(255) NOT NULL
);
CREATE TABLE `Products`(
    `ProductID` INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ProductName` VARCHAR(255) NOT NULL,
    `Supplier` INT NOT NULL,
    `Price` ENUM('') NOT NULL,
    `Category` VARCHAR(255) NOT NULL
);
ALTER TABLE
    `OrderItem` ADD CONSTRAINT `orderitem_orderid_foreign` FOREIGN KEY(`OrderID`) REFERENCES `Orders`(`OrderID`);
ALTER TABLE
    `HR Department` ADD CONSTRAINT `hr department_managerid_foreign` FOREIGN KEY(`ManagerID`) REFERENCES `WareHouses`(`ManagerID`);
ALTER TABLE
    `Deliveries` ADD CONSTRAINT `deliveries_orderid_foreign` FOREIGN KEY(`OrderID`) REFERENCES `Orders`(`OrderID`);
ALTER TABLE
    `WareHouses` ADD CONSTRAINT `warehouses_warehouseid_foreign` FOREIGN KEY(`WareHouseID`) REFERENCES `WareHouses`(`WareHouseID`);
ALTER TABLE
    `Orders` ADD CONSTRAINT `orders_customerid_foreign` FOREIGN KEY(`CustomerID`) REFERENCES `Customer`(`CustomerID`);
ALTER TABLE
    `Warehouse Inventory` ADD CONSTRAINT `warehouse inventory_warehouseid_foreign` FOREIGN KEY(`WareHouseID`) REFERENCES `WareHouses`(`WareHouseID`);
ALTER TABLE
    `Products` ADD CONSTRAINT `products_productid_foreign` FOREIGN KEY(`ProductID`) REFERENCES `Warehouse Inventory`(`ProductId`);
ALTER TABLE
    `Drivers` ADD CONSTRAINT `drivers_employeeid_foreign` FOREIGN KEY(`EmployeeID`) REFERENCES `Employees`(`EmployeeID`);
ALTER TABLE
    `Deliveries` ADD CONSTRAINT `deliveries_driverid_foreign` FOREIGN KEY(`DriverID`) REFERENCES `Drivers`(`DriverID`);
ALTER TABLE
    `EmployeeRoles` ADD CONSTRAINT `employeeroles_employeeid_foreign` FOREIGN KEY(`EmployeeID`) REFERENCES `Employees`(`EmployeeID`);
ALTER TABLE
    `Payments` ADD CONSTRAINT `payments_orderid_foreign` FOREIGN KEY(`OrderID`) REFERENCES `Orders`(`OrderID`);
ALTER TABLE
    `WareHouses` ADD CONSTRAINT `warehouses_managerid_foreign` FOREIGN KEY(`ManagerID`) REFERENCES `Employees`(`EmployeeID`);
ALTER TABLE
    `Products` ADD CONSTRAINT `products_productid_foreign` FOREIGN KEY(`ProductID`) REFERENCES `Suppliers`(`ProductID`);
ALTER TABLE
    `Payrolls` ADD CONSTRAINT `payrolls_employeeid_foreign` FOREIGN KEY(`EmployeeID`) REFERENCES `Employees`(`EmployeeID`);
ALTER TABLE
    `OrderItem` ADD CONSTRAINT `orderitem_productid_foreign` FOREIGN KEY(`ProductID`) REFERENCES `Products`(`ProductID`);
ALTER TABLE
    `Products` ADD CONSTRAINT `products_productid_foreign` FOREIGN KEY(`ProductID`) REFERENCES `Inventory`(`ProductID`);