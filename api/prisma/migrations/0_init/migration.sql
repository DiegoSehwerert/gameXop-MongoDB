-- CreateTable
CREATE TABLE `admin_trackings` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `userId` INTEGER NOT NULL,
    `entity` VARCHAR(255) NOT NULL,
    `entityId` INTEGER NOT NULL,
    `action` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `admin_trackings_entity_entityId_index`(`entity`, `entityId`),
    INDEX `admin_trackings_userId_fk`(`userId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `api_trackings` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NULL,
    `fingerprintId` INTEGER NULL,
    `ip` VARCHAR(255) NOT NULL,
    `isRobot` BOOLEAN NOT NULL,
    `resource` VARCHAR(255) NOT NULL,
    `resourceElement` INTEGER NULL,
    `method` VARCHAR(255) NOT NULL,
    `httpCode` INTEGER NOT NULL,
    `message` TEXT NULL,
    `startTime` DOUBLE NOT NULL,
    `endTime` DOUBLE NOT NULL,
    `latencyMS` DOUBLE NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `api_trackings_customerId_fk`(`customerId`),
    INDEX `api_trackings_fingerprintId_fk`(`fingerprintId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cart_details` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cartId` INTEGER NOT NULL,
    `productId` INTEGER NOT NULL,
    `localeId` INTEGER NOT NULL,
    `priceId` INTEGER NOT NULL,
    `priceDiscountId` INTEGER NULL,
    `taxId` INTEGER NOT NULL,
    `productName` VARCHAR(255) NOT NULL,
    `basePrice` DECIMAL(6, 2) NOT NULL,
    `taxPrice` DECIMAL(6, 2) NULL,
    `quantity` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `cart_details_cartId_fk`(`cartId`),
    INDEX `cart_details_localeId_fk`(`localeId`),
    INDEX `cart_details_priceDiscountId_fk`(`priceDiscountId`),
    INDEX `cart_details_priceId_fk`(`priceId`),
    INDEX `cart_details_productId_fk`(`productId`),
    INDEX `cart_details_taxId_fk`(`taxId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `carts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `uuid` CHAR(36) NOT NULL,
    `customerId` INTEGER NULL,
    `fingerprintId` INTEGER NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `carts_customerId_fk`(`customerId`),
    INDEX `carts_fingerprintId_fk`(`fingerprintId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `cities` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `countryId` INTEGER NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `cities_countryId_fk`(`countryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `companies` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `countryId` INTEGER NOT NULL,
    `cityId` INTEGER NOT NULL,
    `dialCodeId` INTEGER NOT NULL,
    `fiscalName` VARCHAR(255) NOT NULL,
    `comercialName` VARCHAR(255) NOT NULL,
    `vat` VARCHAR(255) NOT NULL,
    `comercialAddress` VARCHAR(255) NULL,
    `fiscalAddress` VARCHAR(255) NOT NULL,
    `postalCode` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `web` VARCHAR(255) NULL,
    `telephone` VARCHAR(255) NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    UNIQUE INDEX `email`(`email`),
    INDEX `companies_cityId_fk`(`cityId`),
    INDEX `companies_countryId_fk`(`countryId`),
    INDEX `companies_dialCodeId_fk`(`dialCodeId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `contacts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `fingerprintId` INTEGER NULL,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `subject` VARCHAR(255) NOT NULL,
    `message` TEXT NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `contacts_email_index`(`email`),
    INDEX `contacts_fingerprintId_fk`(`fingerprintId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `countries` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `iso2` VARCHAR(255) NOT NULL,
    `iso3` VARCHAR(255) NOT NULL,
    `visible` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `coupons` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `code` VARCHAR(255) NOT NULL,
    `percentage` DECIMAL(10, 0) NULL,
    `multiplier` DECIMAL(10, 0) NULL,
    `startsAt` DATETIME(0) NULL,
    `endsAt` DATETIME(0) NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customer_trackings` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NULL,
    `fingerprintId` INTEGER NULL,
    `localeSeoId` INTEGER NULL,
    `localeSeoSlugId` INTEGER NULL,
    `eventTime` DOUBLE NULL,
    `eventName` VARCHAR(255) NULL,
    `path` VARCHAR(255) NULL,
    `event` TEXT NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `customer_trackings_customerId_fk`(`customerId`),
    INDEX `customer_trackings_fingerprintId_fk`(`fingerprintId`),
    INDEX `customer_trackings_localeSeoId_fk`(`localeSeoId`),
    INDEX `customer_trackings_localeSeoSlugId_fk`(`localeSeoSlugId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `customers` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `countryId` INTEGER NOT NULL,
    `cityId` INTEGER NOT NULL,
    `dialCodeId` INTEGER NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `surname` VARCHAR(255) NOT NULL,
    `telephone` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `postalCode` VARCHAR(255) NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    UNIQUE INDEX `email`(`email`),
    INDEX `customers_cityId_fk`(`cityId`),
    INDEX `customers_countryId_fk`(`countryId`),
    INDEX `customers_dialCodeId_fk`(`dialCodeId`),
    INDEX `customers_email_index`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `dial_codes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `countryId` INTEGER NOT NULL,
    `dialCode` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `dial_codes_countryId_fk`(`countryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `email_errors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NOT NULL,
    `emailId` INTEGER NOT NULL,
    `error` TEXT NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `customerId`(`customerId`),
    INDEX `emailId`(`emailId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `emails` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `subject` VARCHAR(255) NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `faqs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `order` INTEGER NULL DEFAULT 0,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `fingerprints` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NULL,
    `cityId` INTEGER NOT NULL,
    `fingerprint` VARCHAR(255) NOT NULL,
    `browser` VARCHAR(255) NOT NULL,
    `browserVersion` VARCHAR(255) NOT NULL,
    `os` VARCHAR(255) NOT NULL,
    `osVersion` VARCHAR(255) NOT NULL,
    `screenHeight` INTEGER NOT NULL,
    `screenWidth` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `fingerprints_cityId_fk`(`cityId`),
    INDEX `fingerprints_customerId_fk`(`customerId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `image_configurations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `entity` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `mediaQuery` VARCHAR(255) NOT NULL,
    `widthPx` INTEGER NULL,
    `heightPx` INTEGER NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `image_configurations_entity_name_mediaQuery_index`(`entity`, `name`, `mediaQuery`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `images` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `imageConfigurationId` INTEGER NOT NULL,
    `entityId` INTEGER NULL,
    `entity` VARCHAR(255) NOT NULL,
    `name` VARCHAR(255) NULL,
    `originalFilename` VARCHAR(255) NULL,
    `resizedFilename` VARCHAR(255) NULL,
    `title` VARCHAR(255) NULL,
    `alt` VARCHAR(255) NULL,
    `languageAlias` VARCHAR(255) NOT NULL,
    `mediaQuery` VARCHAR(255) NOT NULL,
    `latencyMs` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `images_entityId_entity_mediaQuery_index`(`entityId`, `entity`, `mediaQuery`),
    INDEX `images_imageConfigurationId_fk`(`imageConfigurationId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `invoices` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NOT NULL,
    `saleId` INTEGER NOT NULL,
    `returnId` INTEGER NULL,
    `reference` VARCHAR(255) NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `invoices_customerId_fk`(`customerId`),
    INDEX `invoices_returnId_fk`(`returnId`),
    INDEX `invoices_saleId_fk`(`saleId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `languages` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `alias` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    UNIQUE INDEX `alias`(`alias`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `locale_seo_redirects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `localeSeoId` INTEGER NULL,
    `languageAlias` VARCHAR(255) NOT NULL,
    `group` VARCHAR(255) NULL,
    `key` VARCHAR(255) NULL,
    `subdomain` VARCHAR(255) NULL,
    `oldUrl` VARCHAR(255) NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `locale_seo_redirects_localeSeoId_fk`(`localeSeoId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `locale_seo_slug_redirects` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `localeSeoSlugId` INTEGER NULL,
    `languageAlias` VARCHAR(255) NULL,
    `oldUrl` VARCHAR(255) NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `locale_seo_slug_redirects_localeSeoId_fk`(`localeSeoSlugId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `locale_seo_slugs` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `localeSeoId` INTEGER NOT NULL,
    `languageAlias` VARCHAR(255) NOT NULL,
    `relParent` VARCHAR(255) NOT NULL,
    `slug` VARCHAR(255) NOT NULL,
    `key` INTEGER NOT NULL,
    `parentSlug` VARCHAR(255) NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL,
    `keywords` VARCHAR(255) NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `locale_seo_slugs_localeSeoId_fk`(`localeSeoId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `locale_seos` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `languageAlias` VARCHAR(255) NOT NULL,
    `url` VARCHAR(255) NOT NULL,
    `title` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL,
    `redirection` BOOLEAN NULL DEFAULT false,
    `menu` BOOLEAN NULL DEFAULT true,
    `changeFrequency` VARCHAR(255) NULL,
    `priority` DECIMAL(10, 0) NULL,
    `sitemap` BOOLEAN NULL DEFAULT true,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `locales` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `languageAlias` VARCHAR(255) NOT NULL,
    `entity` VARCHAR(255) NOT NULL,
    `entityId` INTEGER NOT NULL,
    `key` VARCHAR(255) NOT NULL,
    `value` TEXT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `locales_languageAlias_entity_entityId_key_index`(`languageAlias`, `entity`, `entityId`, `key`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `menu_items` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `menuId` INTEGER NOT NULL,
    `localeSeoId` INTEGER NULL,
    `localeSeoSlugId` INTEGER NULL,
    `parent` INTEGER NULL,
    `name` VARCHAR(255) NOT NULL,
    `description` VARCHAR(255) NULL,
    `customUrl` VARCHAR(255) NULL,
    `private` BOOLEAN NOT NULL,
    `order` INTEGER NULL DEFAULT 0,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `menu_items_localeSeoId_fk`(`localeSeoId`),
    INDEX `menu_items_localeSeoSlugId_fk`(`localeSeoSlugId`),
    INDEX `menu_items_menuId_fk`(`menuId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `menus` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `page_trackings` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NULL,
    `fingerprintId` INTEGER NULL,
    `localeSeoId` INTEGER NULL,
    `localeSeoSlugId` INTEGER NULL,
    `path` VARCHAR(255) NOT NULL,
    `ip` VARCHAR(255) NOT NULL,
    `isRobot` BOOLEAN NOT NULL,
    `startTime` DOUBLE NOT NULL,
    `endTime` DOUBLE NOT NULL,
    `latencyMS` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `page_trackings_customerId_fk`(`customerId`),
    INDEX `page_trackings_fingerprintId_fk`(`fingerprintId`),
    INDEX `page_trackings_localeSeoId_fk`(`localeSeoId`),
    INDEX `page_trackings_localeSeoSlugId_fk`(`localeSeoSlugId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `payment_methods` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `configuration` JSON NOT NULL,
    `visible` BOOLEAN NOT NULL DEFAULT true,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `price_discounts` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `priceId` INTEGER NOT NULL,
    `percentage` DECIMAL(10, 0) NULL,
    `multiplier` DECIMAL(10, 0) NULL,
    `current` BOOLEAN NULL,
    `startsAt` DATETIME(0) NULL,
    `endsAt` DATETIME(0) NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `price_discounts_priceId_fk`(`priceId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `prices` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productId` INTEGER NULL,
    `taxId` INTEGER NULL,
    `basePrice` DECIMAL(10, 0) NULL,
    `current` BOOLEAN NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `prices_productId_fk`(`productId`),
    INDEX `prices_taxId_fk`(`taxId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_categories` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `visible` BOOLEAN NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `product_category_relations` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `productId` INTEGER NOT NULL,
    `productCategoryId` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `product_category_relations_productCategoryId_fk`(`productCategoryId`),
    INDEX `product_category_relations_productId_fk`(`productId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `products` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `featured` BOOLEAN NULL,
    `visible` BOOLEAN NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `return_details` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `returnId` INTEGER NOT NULL,
    `productId` INTEGER NOT NULL,
    `localeId` INTEGER NOT NULL,
    `priceId` INTEGER NOT NULL,
    `taxId` INTEGER NOT NULL,
    `priceDiscountId` INTEGER NULL,
    `productName` VARCHAR(255) NOT NULL,
    `basePrice` DECIMAL(6, 2) NOT NULL,
    `taxPrice` DECIMAL(6, 2) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `return_details_localeId_fk`(`localeId`),
    INDEX `return_details_priceDiscountId_fk`(`priceDiscountId`),
    INDEX `return_details_priceId_fk`(`priceId`),
    INDEX `return_details_productId_fk`(`productId`),
    INDEX `return_details_returnId_fk`(`returnId`),
    INDEX `return_details_taxId_fk`(`taxId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `return_errors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NOT NULL,
    `returnId` INTEGER NOT NULL,
    `paymentMethodId` INTEGER NOT NULL,
    `errorCode` INTEGER NOT NULL,
    `errorMessage` VARCHAR(255) NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `return_errors_customerId_fk`(`customerId`),
    INDEX `return_errors_paymentMethodId_fk`(`paymentMethodId`),
    INDEX `return_errors_returnId_fk`(`returnId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `returns` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `saleId` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `paymentMethodId` INTEGER NOT NULL,
    `reference` VARCHAR(255) NOT NULL,
    `totalPrice` DECIMAL(10, 2) NOT NULL,
    `totalBasePrice` DECIMAL(10, 2) NOT NULL,
    `totalTaxPrice` DECIMAL(10, 2) NOT NULL,
    `returnDate` DATE NOT NULL,
    `returnTime` TIME(0) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `returns_customerId_fk`(`customerId`),
    INDEX `returns_paymentMethodId_fk`(`paymentMethodId`),
    INDEX `returns_saleId_fk`(`saleId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sale_details` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `saleId` INTEGER NOT NULL,
    `productId` INTEGER NOT NULL,
    `localeId` INTEGER NOT NULL,
    `priceId` INTEGER NOT NULL,
    `priceDiscountId` INTEGER NULL,
    `taxId` INTEGER NOT NULL,
    `productName` VARCHAR(255) NOT NULL,
    `basePrice` DECIMAL(6, 2) NOT NULL,
    `taxPrice` DECIMAL(6, 2) NOT NULL,
    `quantity` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `sale_details_localeId_fk`(`localeId`),
    INDEX `sale_details_priceDiscountId_fk`(`priceDiscountId`),
    INDEX `sale_details_priceId_fk`(`priceId`),
    INDEX `sale_details_productId_fk`(`productId`),
    INDEX `sale_details_saleId_fk`(`saleId`),
    INDEX `sale_details_taxId_fk`(`taxId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sale_errors` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `paymentMethodId` INTEGER NOT NULL,
    `customerId` INTEGER NOT NULL,
    `cartId` INTEGER NOT NULL,
    `errorCode` INTEGER NOT NULL,
    `errorMessage` VARCHAR(255) NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `sale_errors_cartId_fk`(`cartId`),
    INDEX `sale_errors_customerId_fk`(`customerId`),
    INDEX `sale_errors_paymentMethodId_fk`(`paymentMethodId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sales` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `cartId` INTEGER NULL,
    `customerId` INTEGER NULL,
    `paymentMethodId` INTEGER NULL,
    `couponId` INTEGER NULL,
    `reference` VARCHAR(255) NOT NULL,
    `totalPrice` DECIMAL(10, 2) NOT NULL,
    `totalBasePrice` DECIMAL(10, 2) NOT NULL,
    `totalTaxPrice` DECIMAL(10, 2) NOT NULL,
    `saleDate` DATE NOT NULL,
    `saleTime` TIME(0) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `sales_cartId_fk`(`cartId`),
    INDEX `sales_couponId_fk`(`couponId`),
    INDEX `sales_customerId_fk`(`customerId`),
    INDEX `sales_paymentMethodId_fk`(`paymentMethodId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sent_emails` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NOT NULL,
    `emailId` INTEGER NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `email_errors_customerId_fk`(`customerId`),
    INDEX `email_errors_emailId_fk`(`emailId`),
    INDEX `sent_emails_customerId_fk`(`customerId`),
    INDEX `sent_emails_emailId_fk`(`emailId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `sequelizemeta` (
    `name` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `name`(`name`),
    PRIMARY KEY (`name`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `social_networks` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `baseUrl` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `taxes` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `countryId` INTEGER NOT NULL,
    `type` VARCHAR(255) NOT NULL,
    `rate` DECIMAL(10, 2) NOT NULL,
    `multiplier` DECIMAL(10, 2) NOT NULL,
    `current` BOOLEAN NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `taxes_countryId_fk`(`countryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `tickets` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `customerId` INTEGER NOT NULL,
    `saleId` INTEGER NOT NULL,
    `returnId` INTEGER NULL,
    `reference` VARCHAR(255) NOT NULL,
    `path` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    INDEX `tickets_customerId_fk`(`customerId`),
    INDEX `tickets_returnId_fk`(`returnId`),
    INDEX `tickets_saleId_fk`(`saleId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `users` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `createdAt` DATETIME(0) NOT NULL,
    `updatedAt` DATETIME(0) NOT NULL,
    `deletedAt` DATETIME(0) NULL,

    UNIQUE INDEX `email`(`email`),
    INDEX `users_email_index`(`email`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `admin_trackings` ADD CONSTRAINT `admin_trackings_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `api_trackings` ADD CONSTRAINT `api_trackings_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `api_trackings` ADD CONSTRAINT `api_trackings_ibfk_2` FOREIGN KEY (`fingerprintId`) REFERENCES `fingerprints`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart_details` ADD CONSTRAINT `cart_details_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `carts`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart_details` ADD CONSTRAINT `cart_details_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart_details` ADD CONSTRAINT `cart_details_ibfk_3` FOREIGN KEY (`localeId`) REFERENCES `locales`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart_details` ADD CONSTRAINT `cart_details_ibfk_4` FOREIGN KEY (`priceId`) REFERENCES `prices`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart_details` ADD CONSTRAINT `cart_details_ibfk_5` FOREIGN KEY (`priceDiscountId`) REFERENCES `price_discounts`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cart_details` ADD CONSTRAINT `cart_details_ibfk_6` FOREIGN KEY (`taxId`) REFERENCES `taxes`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `carts` ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `carts` ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`fingerprintId`) REFERENCES `fingerprints`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `cities` ADD CONSTRAINT `cities_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `countries`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `companies` ADD CONSTRAINT `companies_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `countries`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `companies` ADD CONSTRAINT `companies_ibfk_2` FOREIGN KEY (`cityId`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `companies` ADD CONSTRAINT `companies_ibfk_3` FOREIGN KEY (`dialCodeId`) REFERENCES `dial_codes`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `contacts` ADD CONSTRAINT `contacts_ibfk_1` FOREIGN KEY (`fingerprintId`) REFERENCES `fingerprints`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customer_trackings` ADD CONSTRAINT `customer_trackings_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customer_trackings` ADD CONSTRAINT `customer_trackings_ibfk_2` FOREIGN KEY (`fingerprintId`) REFERENCES `fingerprints`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customer_trackings` ADD CONSTRAINT `customer_trackings_ibfk_3` FOREIGN KEY (`localeSeoId`) REFERENCES `locale_seos`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customer_trackings` ADD CONSTRAINT `customer_trackings_ibfk_4` FOREIGN KEY (`localeSeoSlugId`) REFERENCES `locale_seo_slugs`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customers` ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `countries`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customers` ADD CONSTRAINT `customers_ibfk_2` FOREIGN KEY (`cityId`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `customers` ADD CONSTRAINT `customers_ibfk_3` FOREIGN KEY (`dialCodeId`) REFERENCES `dial_codes`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `dial_codes` ADD CONSTRAINT `dial_codes_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `countries`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `email_errors` ADD CONSTRAINT `email_errors_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `email_errors` ADD CONSTRAINT `email_errors_ibfk_2` FOREIGN KEY (`emailId`) REFERENCES `emails`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `fingerprints` ADD CONSTRAINT `fingerprints_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `fingerprints` ADD CONSTRAINT `fingerprints_ibfk_2` FOREIGN KEY (`cityId`) REFERENCES `cities`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `images` ADD CONSTRAINT `images_ibfk_1` FOREIGN KEY (`imageConfigurationId`) REFERENCES `image_configurations`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_ibfk_2` FOREIGN KEY (`saleId`) REFERENCES `sales`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `invoices` ADD CONSTRAINT `invoices_ibfk_3` FOREIGN KEY (`returnId`) REFERENCES `returns`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `locale_seo_redirects` ADD CONSTRAINT `locale_seo_redirects_ibfk_1` FOREIGN KEY (`localeSeoId`) REFERENCES `locale_seos`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `locale_seo_slug_redirects` ADD CONSTRAINT `locale_seo_slug_redirects_ibfk_1` FOREIGN KEY (`localeSeoSlugId`) REFERENCES `locale_seo_slugs`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `locale_seo_slugs` ADD CONSTRAINT `locale_seo_slugs_ibfk_1` FOREIGN KEY (`localeSeoId`) REFERENCES `locale_seos`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `menu_items` ADD CONSTRAINT `menu_items_ibfk_1` FOREIGN KEY (`menuId`) REFERENCES `menus`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `menu_items` ADD CONSTRAINT `menu_items_ibfk_2` FOREIGN KEY (`localeSeoId`) REFERENCES `locale_seos`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `menu_items` ADD CONSTRAINT `menu_items_ibfk_3` FOREIGN KEY (`localeSeoSlugId`) REFERENCES `locale_seo_slugs`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `page_trackings` ADD CONSTRAINT `page_trackings_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `page_trackings` ADD CONSTRAINT `page_trackings_ibfk_2` FOREIGN KEY (`fingerprintId`) REFERENCES `fingerprints`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `page_trackings` ADD CONSTRAINT `page_trackings_ibfk_3` FOREIGN KEY (`localeSeoId`) REFERENCES `locale_seos`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `page_trackings` ADD CONSTRAINT `page_trackings_ibfk_4` FOREIGN KEY (`localeSeoSlugId`) REFERENCES `locale_seo_slugs`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `price_discounts` ADD CONSTRAINT `price_discounts_ibfk_1` FOREIGN KEY (`priceId`) REFERENCES `prices`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prices` ADD CONSTRAINT `prices_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `prices` ADD CONSTRAINT `prices_ibfk_2` FOREIGN KEY (`taxId`) REFERENCES `taxes`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_category_relations` ADD CONSTRAINT `product_category_relations_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `product_category_relations` ADD CONSTRAINT `product_category_relations_ibfk_2` FOREIGN KEY (`productCategoryId`) REFERENCES `product_categories`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `return_details` ADD CONSTRAINT `return_details_ibfk_1` FOREIGN KEY (`returnId`) REFERENCES `returns`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `return_details` ADD CONSTRAINT `return_details_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `return_details` ADD CONSTRAINT `return_details_ibfk_3` FOREIGN KEY (`localeId`) REFERENCES `locales`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `return_details` ADD CONSTRAINT `return_details_ibfk_4` FOREIGN KEY (`priceId`) REFERENCES `prices`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `return_details` ADD CONSTRAINT `return_details_ibfk_5` FOREIGN KEY (`taxId`) REFERENCES `taxes`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `return_details` ADD CONSTRAINT `return_details_ibfk_6` FOREIGN KEY (`priceDiscountId`) REFERENCES `price_discounts`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `return_errors` ADD CONSTRAINT `return_errors_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `return_errors` ADD CONSTRAINT `return_errors_ibfk_2` FOREIGN KEY (`returnId`) REFERENCES `returns`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `return_errors` ADD CONSTRAINT `return_errors_ibfk_3` FOREIGN KEY (`paymentMethodId`) REFERENCES `payment_methods`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `returns` ADD CONSTRAINT `returns_ibfk_1` FOREIGN KEY (`saleId`) REFERENCES `sales`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `returns` ADD CONSTRAINT `returns_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `returns` ADD CONSTRAINT `returns_ibfk_3` FOREIGN KEY (`paymentMethodId`) REFERENCES `payment_methods`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sale_details` ADD CONSTRAINT `sale_details_ibfk_1` FOREIGN KEY (`saleId`) REFERENCES `sales`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sale_details` ADD CONSTRAINT `sale_details_ibfk_2` FOREIGN KEY (`productId`) REFERENCES `products`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sale_details` ADD CONSTRAINT `sale_details_ibfk_3` FOREIGN KEY (`localeId`) REFERENCES `locales`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sale_details` ADD CONSTRAINT `sale_details_ibfk_4` FOREIGN KEY (`priceId`) REFERENCES `prices`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sale_details` ADD CONSTRAINT `sale_details_ibfk_5` FOREIGN KEY (`priceDiscountId`) REFERENCES `price_discounts`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sale_details` ADD CONSTRAINT `sale_details_ibfk_6` FOREIGN KEY (`taxId`) REFERENCES `taxes`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sale_errors` ADD CONSTRAINT `sale_errors_ibfk_1` FOREIGN KEY (`paymentMethodId`) REFERENCES `payment_methods`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sale_errors` ADD CONSTRAINT `sale_errors_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sale_errors` ADD CONSTRAINT `sale_errors_ibfk_3` FOREIGN KEY (`cartId`) REFERENCES `carts`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sales` ADD CONSTRAINT `sales_ibfk_1` FOREIGN KEY (`cartId`) REFERENCES `carts`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sales` ADD CONSTRAINT `sales_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sales` ADD CONSTRAINT `sales_ibfk_3` FOREIGN KEY (`paymentMethodId`) REFERENCES `payment_methods`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sales` ADD CONSTRAINT `sales_ibfk_4` FOREIGN KEY (`couponId`) REFERENCES `coupons`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sent_emails` ADD CONSTRAINT `sent_emails_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `sent_emails` ADD CONSTRAINT `sent_emails_ibfk_2` FOREIGN KEY (`emailId`) REFERENCES `emails`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `taxes` ADD CONSTRAINT `taxes_ibfk_1` FOREIGN KEY (`countryId`) REFERENCES `countries`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_ibfk_2` FOREIGN KEY (`saleId`) REFERENCES `sales`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `tickets` ADD CONSTRAINT `tickets_ibfk_3` FOREIGN KEY (`returnId`) REFERENCES `returns`(`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

